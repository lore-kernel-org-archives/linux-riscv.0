From: mick@ics.forth.gr (Nick Kossifidis)
Date: Fri, 02 Nov 2018 20:58:39 +0200
Subject: [RFC 0/2] Add RISC-V cpu topology
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
Message-ID: <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hello All,

???? 2018-11-02 01:04, Atish Patra ??????:
> This patch series adds the cpu topology for RISC-V. It contains
> both the DT binding and actual source code. It has been tested on
> QEMU & Unleashed board.
> 
> The idea is based on cpu-map in ARM with changes related to how
> we define SMT systems. The reason for adopting a similar approach
> to ARM as I feel it provides a very clear way of defining the
> topology compared to parsing cache nodes to figure out which cpus
> share the same package or core.  I am open to any other idea to
> implement cpu-topology as well.
> 

I was also about to start a discussion about CPU topology on RISC-V
after the last swtools group meeting. The goal is to provide the
scheduler with hints on how to distribute tasks more efficiently
between harts, by populating the scheduling domain topology levels
(https://elixir.bootlin.com/linux/v4.19/ident/sched_domain_topology_level).
What we want to do is define cpu groups and assign them to
scheduling domains with the appropriate SD_ flags
(https://github.com/torvalds/linux/blob/master/include/linux/sched/topology.h#L16).

So the cores that belong to a scheduling domain may share:
CPU capacity (SD_SHARE_CPUCAPACITY / SD_ASYM_CPUCAPACITY)
Package resources -e.g. caches, units etc- (SD_SHARE_PKG_RESOURCES)
Power domain (SD_SHARE_POWERDOMAIN)

In this context I believe using words like "core", "package",
"socket" etc can be misleading. For example the sample topology you
use on the documentation says that there are 4 cores that are part
of a package, however "package" has a different meaning to the
scheduler. Also we don't say anything in case they share a power
domain or if they have the same capacity or not. This mapping deals
only with cache hierarchy or other shared resources.

How about defining a dt scheme to describe the scheduler domain
topology levels instead ? e.g:

2 sets (or clusters if you prefer) of 2 SMT cores, each set with
a different capacity and power domain:

sched_topology {
  level0 { // SMT
   shared = "power", "capacity", "resources";
   group0 {
    members = <&hart0>, <&hart1>;
   }
   group1 {
    members = <&hart2>, <&hart3>;
   }
   group2 {
    members = <&hart4>, <&hart5>;
   }
   group3 {
    members = <&hart6>, <&hart7>;
   }
  }
  level1 { // MC
   shared = "power", "capacity"
   group0 {
    members = <&hart0>, <&hart1>, <&hart2>, <&hart3>;
   }
   group1 {
    members = <&hart4>, <&hart5>, <&hart6>, <&hart7>;
   }
  }
  top_level { // A group with all harts in it
   shared = "" // There is nothing common for ALL harts, we could have 
capacity here
  }
}

Regards,
Nick
