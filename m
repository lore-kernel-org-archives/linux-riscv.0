From: arnd@arndb.de (Arnd Bergmann)
Date: Tue, 25 Sep 2018 07:48:14 +0200
Subject: mmcqd/0 stuck at 100% CPU
In-Reply-To: <q3worc5qfj.fsf@armitage.lysator.liu.se>
References: <q3worc5qfj.fsf@armitage.lysator.liu.se>
Message-ID: <CAK8P3a3h4eBBWk0WTo6=b+Q0Q33M_6tQQyrwGorgYDNrBj3AwA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 25, 2018 at 3:38 AM Marcus Comstedt <marcus@lysator.liu.se> wrote:
> I'm writing this mail to inform about an issue with the SDcard driver on
> the Hi5Unleashed board running Linux 4.15.18 (riscv-linux-4.15 branch
> from git + patch-4.15.18.xz from kernel.org).

Can you try a newer kernel version?

> So what is mmcqd/0 doing?  Checking /proc/74/stack gives one of three
> results:
>
> # cat /proc/74/stack
> [<0>] __schedule+0x1c6/0x4ea
> [<0>] 0xffffffffffffffff
> # cat /proc/74/stack
> [<0>] __schedule+0x1c6/0x4ea
> [<0>] blk_fetch_request+0x12/0x56
> [<0>] mmc_queue_thread+0x56/0xf6
> [<0>] kthread+0xcc/0xde

This part of the mmc stack was completely rewritten in 4.16
(after many years of not changing much), so the results will
be very different. If there is a bug in the driver, it may show
in a different way though.

     Arnd
