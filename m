From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 19 Sep 2018 17:06:11 -0700 (PDT)
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
In-Reply-To: <eeea61edbe84de12b2ef09f62d75f975@mailhost.ics.forth.gr>
Message-ID: <mhng-825f916b-c5b4-45c1-81fc-de7a1f6fb544@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, 10 Sep 2018 06:52:24 PDT (-0700), mick at ics.forth.gr wrote:
> ???? 2018-09-10 16:41, Christoph Hellwig ??????:
>> On Thu, Sep 06, 2018 at 02:45:00AM -0700, Palmer Dabbelt wrote:
>>> > I think gpio & pwm are required as well. I couldn't get networking up
>>> > without the GPIO driver.
>>>
>>> That makes sense: IIRC the GPIO twiddles the pins that control the
>>> Ethernet phy.
>>>
>>> > https://github.com/riscv/riscv-linux/commit/7b012f300afcff77c20a4d84519f4bd2b9b17bd0
>>> >
>>> > https://github.com/riscv/riscv-linux/commit/d6e84658098c6f37875a9e4b151706c6b541dc0b
>>>
>>> Thanks.  I've grabbed both of these into WIP branches for now, they're
>>> at
>>> least the self contained type so it should be viable to start cleaning
>>> them
>>> up, pending time.
>>
>> Btw, do we have volunteers for given drivers?  I think Paul is trying
>> to handle the serial driver.  I'll try to spend some time on one or
>> two,
>> and have a SiFive board now.  but I won't really have time to try it
>> until the end of the month as I'm busy travelling and at conferences.
>>
>
> Hello all,
>
> I recently got my hands on a SiFive board as well, and I plan to form a
> team here at FORTH to start working on RISC-V kernel support etc. How
> can I help ? I started reading the code under /arch/riscv to get an idea
> but is there a todo list somewhere or a wiki page ? On which git tree /
> branch are you working on ?

The original email in this thread is the best bet: 
http://lists.infradead.org/pipermail/linux-riscv/2018-August/001180.html

If there's anything you're interested in then feel free to just post to the 
list.  You're welcome to post very early patches to linux-riscv, just call them 
something like RFC or WIP instead of PATCH so people who aren't interested can 
filter them out.

If you're submitting patches, then the best bet is to work against Linus' 
master.  That's the only real ground truth, and I can work through any 
conflicts.  We have a RISC-V tree at

    https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git

but it tends to be pretty thin.  There's a blog post that roughly describes how 
the mess of branches work, but it's less up-to-date than my email is so if 
anything conflicts then believe the email :)

    https://www.sifive.com/blog/2018/02/20/all-aboard-part-10-how-to-contribute-to-the-risc-v-software-ecosystem/

Thanks for your interest!  If you have any more questions then feel free to 
ask.
