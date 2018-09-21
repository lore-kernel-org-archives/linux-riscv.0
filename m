From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 21 Sep 2018 08:48:21 -0700 (PDT)
Subject: RISC-V: kernel symbol version issue in 4.19rc2 (was: Last Week in
 RISC-V: Friday September 7, 2018)
In-Reply-To: <20180918192154.bqxetn2t6qbdxpdg@excalibur.cnev.de>
Message-ID: <mhng-85eb3c6e-d193-4369-b2f6-70f4091d4286@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 18 Sep 2018 12:21:55 PDT (-0700), merker at debian.org wrote:
> Hello Palmer,
>
> may I ping you on the issue below?  The missing symbol versions
> are the one remaining blocker for building a riscv64 kernel-image
> package in Debian, which in turn is a prerequisite for working on
> riscv64 support in the Debian installer. It would therefore
> be really great if the issue could be resolved in 4.19rc5 or rc6.

Yes, let's get this fixed.  I've gotten behind on Linux due to the GNU Tools 
Cauldron, but I hape that someone from linux-riscv will have time to take a 
look.  If not I'll try to get something this weekend, but there are a few other 
fires to put out first.

Let's be sure to get this into 4.19 ASAP.

Thanks for the ping!

>
> Regards,
> Karsten
>
> On Sat, Sep 08, 2018 at 10:43:11PM +0200, Karsten Merker wrote:
>> On Fri, Sep 07, 2018 at 04:23:46PM -0700, Palmer Dabbelt wrote:
>>
>> > ## Linux 4.19-rc3
>> >
>> > On Tuesday I tagged my pull request for Linux 4.19-rc3, which contains
>> > what I hope to be the final RISC-V patch for 4.19.
>> [...]
>> > It's now time to start testing Linux 4.19 on RISC-V systems, let's see
>> > if we can shake out whatever bugs are there before the release.
>>
>> Hello Palmer,
>>
>> there is one issue that should probably be addressed in the 4.19
>> cycle.  I have tried to modify the Debian kernel package to build
>> a riscv64 kernel binary and stumbled over the following issue:
>>
>> -----8<----------8<----------8<----------8<----------8<-----
>>
>> make[3]: Leaving directory '<<builddir>>/linux-4.19~rc2/debian/build/build_riscv64_none_riscv64'
>> debian/bin/buildcheck.py debian/build/build_riscv64_none_riscv64 riscv64 none riscv64
>> ABI is not completely versioned!  Refusing to continue.
>>
>> Unversioned symbols:
>> _mcount                                          module: vmlinux, version: 0x00000000, export: EXPORT_SYMBOL
>> return_to_handler                                module: vmlinux, version: 0x00000000, export: EXPORT_SYMBOL
>> Can't read ABI reference.  ABI not checked!
>> make[2]: *** [debian/rules.real:217: debian/stamps/build_riscv64_none_riscv64] Fehler 1
>>
>> -----8<----------8<----------8<----------8<----------8<-----
>>
>> The missing symbol versions only cause a warning during an
>> upstream kernel build so they are not critical for upstream, but
>> they are critical for the Debian kernel package which relies
>> on having symbol versions.
>>
>> Ben Hutchings, one of the Debian kernel maintainers, wrote:
>> > It's an upstream issue, but not a fatal error there.  For Debian it is
>> > a fatal error becasue unversioned symbols potentially undermine code
>> > signing.
>> >
>> > Any symbol exported from an assembly-language file won't automatically
>> > get a symbol version, since there's no type information there.  The way
>> > to fix this is to include (or directly) add the function prototypes in
>> > arch/riscv/include/asm/asm-prototypes.h.
>> >
>> > I don't think that return_to_handler should be exported at all.  No
>> > other architecture does.  As for _mcount, that is declared in
>> > <asm/ftrace.h>, so <asm/asm-prototypes.h> should just be:
>> >
>> > /* SPDX-License-Identifier: GPL-2.0 */
>> > #include <asm/ftrace.h>
>>
>> James Cowgill, another member of Debian's kernel team, has
>> posted a patch to add symbol versions for the two symbols above:
>> http://lists.infradead.org/pipermail/linux-riscv/2018-September/001372.html
>>
>> Ben Hutchings isn't happy with exporting return_to_handler at all,
>> he would prefer to completely stop exporting the symbol instead
>> of enabling symbol versioning for it.
>>
>> This is out of my field of expertise, so I wanted to ask whether
>> you could take a look at the issue and possibly submit a corresponding
>> pull request for rc4.
>>
>> Regards,
>> Karsten
>> --
>> Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzung
>> sowie der Weitergabe meiner personenbezogenen Daten f?r Zwecke der
>> Werbung sowie der Markt- oder Meinungsforschung.
