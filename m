From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 19 Sep 2018 17:06:09 -0700 (PDT)
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
In-Reply-To: <20180910134147.GA25264@infradead.org>
Message-ID: <mhng-812af88c-22bc-41bc-9a0c-52ddc573d14c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 10 Sep 2018 06:41:47 PDT (-0700), Christoph Hellwig wrote:
> On Thu, Sep 06, 2018 at 02:45:00AM -0700, Palmer Dabbelt wrote:
>> > I think gpio & pwm are required as well. I couldn't get networking up
>> > without the GPIO driver.
>>
>> That makes sense: IIRC the GPIO twiddles the pins that control the Ethernet phy.
>>
>> > https://github.com/riscv/riscv-linux/commit/7b012f300afcff77c20a4d84519f4bd2b9b17bd0
>> >
>> > https://github.com/riscv/riscv-linux/commit/d6e84658098c6f37875a9e4b151706c6b541dc0b
>>
>> Thanks.  I've grabbed both of these into WIP branches for now, they're at
>> least the self contained type so it should be viable to start cleaning them
>> up, pending time.
>
> Btw, do we have volunteers for given drivers?  I think Paul is trying
> to handle the serial driver.  I'll try to spend some time on one or two,
> and have a SiFive board now.  but I won't really have time to try it
> until the end of the month as I'm busy travelling and at conferences.

Well, Paul has sort of been volunteered to do it :).  I'll help out where I can 
but I'm pretty hosed in terms of time, as there's too much going on right now.

Last time I talked to Paul he was working through the serial driver, but that 
has a bunch of dependencies.  The big thing to untagle with all the non-PCIe 
drivers is the clocking stuff, as everything depends on that.  Paul is building 
up a test farm so we can actually test our kernel on boards, which is 
particularly important for the clocking stuff as that's very hardware 
dependent.

The hope is that once we can have confidence in these drivers working we can 
submit them, but getting up a test rig is a big chunk of work.
