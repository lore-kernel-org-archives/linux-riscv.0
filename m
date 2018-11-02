From: abner.chang@hpe.com (Chang, Abner (HPS SW/FW Technologist))
Date: Fri, 2 Nov 2018 04:29:08 +0000
Subject: SBI extension proposal
In-Reply-To: <CAAhSdy3ZX=BqMS-MYnTHNZ9hxkJbt8i5nf5rOTf41FJ6rUpWpA@mail.gmail.com>
References: <20181101164205.l2bra3a6kihjpuib@excalibur.cnev.de>
 <mhng-dd74f93c-74b1-4701-a73c-339d81aa0bd0@palmer-si-x1c4>
 <CAAhSdy3ZX=BqMS-MYnTHNZ9hxkJbt8i5nf5rOTf41FJ6rUpWpA@mail.gmail.com>
Message-ID: <TU4PR8401MB09584566CCE279C368CFC145FFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Friday, November 02, 2018 11:27 AM
> To: Palmer Dabbelt <palmer@sifive.com>
> Cc: merker at debian.org; rjones at redhat.com; Mark Rutland
> <mark.rutland@arm.com>; Christoph Hellwig <hch@infradead.org>; Damien
> Le Moal <Damien.LeMoal@wdc.com>; Olof Johansson
> <olof.johansson@gmail.com>; Andrew Waterman <andrew@sifive.com>;
> alankao at andestech.com; philipp at hug.cx; Zong Li <zong@andestech.com>;
> Atish Patra <atish.patra@wdc.com>; Michael Clark <mjc@sifive.com>; Arnd
> Bergmann <arnd@arndb.de>; paul.walmsley at sifive.com; linux-
> riscv at lists.infradead.org; Chang, Abner (HPS SW/FW Technologist)
> <abner.chang@hpe.com>; vincentc at andestech.com;
> David.Abdurachmanov at cern.ch
> Subject: Re: SBI extension proposal
> 
> On Fri, Nov 2, 2018 at 8:19 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >
> > On Thu, 01 Nov 2018 09:42:05 PDT (-0700), merker at debian.org wrote:
> > > On Thu, Nov 01, 2018 at 09:46:09AM +0000, Richard W.M. Jones wrote:
> > >> On Thu, Nov 01, 2018 at 03:05:51PM +0530, Anup Patel wrote:
> > > [...]
> > >> > > How about putting the version information into device tree and
> > >> > > use the compatible string?  This seems more reliable than
> > >> > > probing.
> > >> > > e.g.
> > >> > > firmware {
> > >> > >         sbi {
> > >> > >                 compatible = "riscv,sbi-r0p1", "riscv,sbi-r0p2";
> > >> > >         };
> > >> > > };
> > >> >
> > >> > If it was just DT then I think having this information in DT
> > >> > makes sense. In future, we might definitely see some ACPI support
> > >> > in RISC-V too (just like ARM64 world).
> > >>
> > >> I agree.  Please try not to make things that depend on DT, as it's
> > >> a Linux-only description which isn't suitable for other OSes and
> > >> has a poorly defined ABI.
> > >
> > > the notion that DT is a "Linux-only" description and not suitable
> > > for other operating systems isn't correct.  Besides being used by
> > > Linux, device-tree is also used by at least U-Boot, FreeBSD and
> > > NetBSD.  Based on issues in the early days of DT one can surely
> > > discuss about device-tree ABI stability, but since then a lot of
> > > effort has been put into making DT ABI-stable, and in my experience
> > > this effort has been successful.  On the other hand I have
> > > experienced way more ACPI issues on x86-64 hardware than I would
> > > like to remember, so I tend to assume that in the ACPI world also
> > > not everything is nice and shining.
> >
> > I'm treating device tree as a stable interface, at least once it's
> > written down as a spec (like all our other interfaces).  At SiFive
> > we're treating it as the standard interface for static device
> > discovery, so interface breaks will be a huge pain.
> 
> DT is a great HW description style (my opinion) but then there are ACPI fans
> too.
> 
> I think SBI spec should be independent of DT or ACPI or any other HW
> description style. In fact, a simple bare-metal programs (without DT or ACPI
> support) should also be able to make complete use of SBI. This will allow us
> to develop baremetal test suit for SBI calls.
> 
Agree.
Please also consider EFI firmware code base. There is no DT in UEFI spec for H/W devices or other information. We would like to leverage SBI spec as well, and implement SBI in EFI firmware. Having SBI version in SBI spec makes more sense to different FW frameworks.

> Regards,
> Anup
