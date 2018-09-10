From: mick@ics.forth.gr (Nick Kossifidis)
Date: Mon, 10 Sep 2018 16:52:24 +0300
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
In-Reply-To: <20180910134147.GA25264@infradead.org>
References: <ed6952fc-000f-af33-5d2f-ca26ba59741c@wdc.com>
 <mhng-d37c6b2f-e76a-40ae-95fd-7988b49407fd@palmer-si-x1c4>
 <20180910134147.GA25264@infradead.org>
Message-ID: <eeea61edbe84de12b2ef09f62d75f975@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-09-10 16:41, Christoph Hellwig ??????:
> On Thu, Sep 06, 2018 at 02:45:00AM -0700, Palmer Dabbelt wrote:
>> > I think gpio & pwm are required as well. I couldn't get networking up
>> > without the GPIO driver.
>> 
>> That makes sense: IIRC the GPIO twiddles the pins that control the 
>> Ethernet phy.
>> 
>> > https://github.com/riscv/riscv-linux/commit/7b012f300afcff77c20a4d84519f4bd2b9b17bd0
>> >
>> > https://github.com/riscv/riscv-linux/commit/d6e84658098c6f37875a9e4b151706c6b541dc0b
>> 
>> Thanks.  I've grabbed both of these into WIP branches for now, they're 
>> at
>> least the self contained type so it should be viable to start cleaning 
>> them
>> up, pending time.
> 
> Btw, do we have volunteers for given drivers?  I think Paul is trying
> to handle the serial driver.  I'll try to spend some time on one or 
> two,
> and have a SiFive board now.  but I won't really have time to try it
> until the end of the month as I'm busy travelling and at conferences.
> 

Hello all,

I recently got my hands on a SiFive board as well, and I plan to form a 
team here at FORTH to start working on RISC-V kernel support etc. How 
can I help ? I started reading the code under /arch/riscv to get an idea 
but is there a todo list somewhere or a wiki page ? On which git tree / 
branch are you working on ?

Thanks a lot for your work
Nick
