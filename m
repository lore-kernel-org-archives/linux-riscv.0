From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 31 Oct 2018 13:42:39 -0700 (PDT)
Subject: [PATCH] RISC-V: defconfig: Enable printk timestamps
In-Reply-To: <CAOesGMjXZNURZ4SdKjssYCcFv3=4MYLBpBpzvvb1rNM-fo=QHQ@mail.gmail.com>
Message-ID: <mhng-111820e6-59c0-479a-a10f-f3729007ba70@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 31 Oct 2018 12:20:40 PDT (-0700), Olof Johansson wrote:
> On Tue, Oct 30, 2018 at 5:37 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> The printk timestamps are very useful information to visually see
>> where kernel is spending time during boot. It also helps us see
>> the timing of hotplug events at runtime.
>>
>> This patch enables printk timestamps in RISC-V defconfig so that
>> we have it enabled by default (similar to other architectures
>> such as x86_64, arm64, etc).
>>
>> Signed-off-by: Anup Patel <anup@brainfault.org>
>
> Acked-by: Olof Johansson <olof@lixom.net>
>
> For next time: doing a re-format of the defconfig (to shuffle config
> order), plus changes in the same patch, tends to be a bit fragile. For
> cases like these, I'd recommend hand-pruning to just flip the one
> option if needed, and then have Palmer or Andrew refresh the defconfig
> during a merge window if needed (usually quite rare).

I poked around and it looks like most architectures have this enabled for at 
least one defconfig, with the big architectures having it enabled for all of 
them.

I decided to do a bit of a case study here to try and figure out why some 
architectures have this enabled for some defconfigs but not for others, and as 
far as I can tell it's just an oversight.  Specifically, looking at sparc32 (# 
CONFIG_PRINTK_TIME is not set) vs sparc64 (CONFIG_PRINTK_TIME=y) I can't find 
any reason for the difference.  sparc32's setting can be traced back to

    commit 216da721b881838d639a3987bf8a825e6b4aacdd
    Author: David S. Miller <davem@sunset.davemloft.net>
    Date:   Sun Dec 17 14:21:34 2006 -0800
    
        [SPARC]: Update defconfig.
    
        Signed-off-by: David S. Miller <davem@davemloft.net>

which changes everything in the defconfig, while the sparc64 version dates back to

    commit 3ebc284d52757cf39788731f8fddd70a89f7fc23
    Author: David S. Miller <davem@sunset.davemloft.net>
    Date:   Mon Jan 9 14:36:49 2006 -0800
    
        [SPARC64]: Update defconfig.
    
        Signed-off-by: David S. Miller <davem@davemloft.net>

When we first submitted out port upstream we had an empty defconfig, with the 
theory being that we should just pick whatever the default in Kconfig is for 
everything.  That's obviously the wrong thing to do because most of those 
options are bogus.  At the time I didn't care enough to look because I just 
wanted something to work, but now I find myself asking the question "what goes 
in a defconfig?"  Is it:

* What I, as the maintainer of arch/riscv, want?  That's essentially what it is 
  now, as we have things like "CONFIG_R8169=y" in there because I happened to 
  have one sitting around when we needed to plug in an Ethernet card to test 
  out PCIe.
* What distributions expect?  There's a major element of this in there right 
  now, as half this stuff was just selected because the Debian and Fedora guys 
  suggested we do so because adding things to the RISC-V defconfig made it 
  easier to put together their build scripts.  For example, we ended up with 
  "CONFIG_EXPERT=y" because some setting necessary for the distros was hidden 
  behind it -- that seems like an odd default.
* What users expect?  I'm not even sure who users are in this case, as from my 
  understating most people use distro kernels and don't twiddle Kconfig 
  options.
* What is necessary to work on RISC-V hardware?  This seems like the most 
  reasonable use for an arch-specific defconfig, and subsumes things like 
  "CONFIG_SIFIVE_PLIC=y" because without the PLIC driver nothing will work (but 
  the PLIC driver shouldn't be enabled by default for all architectures, as 
  it's useless everywhere else).

Maybe I've opened up a big can of worms here...  It just seems silly to have 
most of our current defconfig be RISC-V specific.

Anyway, I'm happy with the change because it meets my "what I want" criteria 
:).  I'll split it into two parts, though, as that way when someone else has to 
go to some archaeology on our port they'll be less likely to get lost.
