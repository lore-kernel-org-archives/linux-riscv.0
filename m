From: olof@lixom.net (Olof Johansson)
Date: Thu, 1 Nov 2018 10:20:06 -0700
Subject: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <mhng-b2753147-e1db-4a2a-8dfb-710e71a38bed@palmer-si-x1c4>
References: <da34ca57-ea7b-7fb9-bc45-4b315513e43f@deltatee.com>
 <mhng-b2753147-e1db-4a2a-8dfb-710e71a38bed@palmer-si-x1c4>
Message-ID: <CAOesGMjOfE8KADq2hDORvVtYw8sa7GbL6MtbiDRRgPbWMiXQCA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 1, 2018 at 9:17 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 01 Nov 2018 08:43:15 PDT (-0700), logang at deltatee.com wrote:
> >
> >
> > On 2018-10-31 8:19 p.m., Li, Philip wrote:
> >>>> I think it would also be very nice to get the existing kbuild test robot
> >>>> to start compile testing a few riscv configs. It already does most of
> >> thanks Logan, the support to riscv and nds32 has been in our TODO list for
> >> a while, but whole team is blocked by other effort. We will focus on this soon
> >> to complete it within 2-3 weeks.
> >
> > Thanks! Glad to hear it.
>
> We should probably at least have builds for rv32imac, rv32imafdc, rv64imac, and
> rv64imafdc.  It's probably also good to test SMP/non-SMP as well as
> medlow/medany, as I doubt those get regularly tested.  If you'd like I can
> write up the configs, just point me to something that describes what I should
> do.

It might make sense to either do a pseudo-arch for riscv32, or maybe a
config snippet to generate these arch-specific configs.

For the ISA options, it's a bit trickier. Ideally we want to build
just one kernel that can boot everywhere, and enable the rest
dynamically ('fd' in particular). Whether the kernel itself is built
with 'c' could be a config option to enable (like THUMB kernel on
32-bit ARM), but in general we probably want to watch out for
explosions of combinations here.

Embedded/low-end users will want a way to disable whatever they don't
need, so there's a balance to be found.

FWIW, the configs I build today are:

if [ -f arch/riscv/Makefile ] ; then
        (grep -v "CONFIG_SMP=y" arch/riscv/configs/defconfig ; echo
"CONFIG_SMP=n") > arch/riscv/configs/nosmp_defconfig
        (grep -v "CONFIG_ARCH_RV32I is not"
arch/riscv/configs/defconfig ; echo "CONFIG_ARCH_RV32I=y") >
arch/riscv/configs/rv32_defconfig
fi

+ tinyconfig, allmodconfig, allnoconfig and in some cases
allyesconfig. allmod and allyes take forever so I'm trying to figure
out what targets to build those for. Maybe linux-next only or
something. So doing allmod+ISA combinations would be quite a time
addition for build turnarounds for me.


-Olof
