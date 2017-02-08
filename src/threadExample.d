import std.stdio;
import std.concurrency;
import core.thread;

void main()
{
  writeln("Main is executing from ", thisTid());
  spawn(&example, thisTid());
  auto val = receiveOnly!string();
  auto message = val;
  writeln("Back in ", thisTid(), " received from the created process: ", message);
}

void example(Tid id)
{
  writeln("example() is executing from ", thisTid(), " and was started from ", ownerTid());
  send(id, "This was sent from the created process");
}
