Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E3FEB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM1YnB2aGGDpRGWhSN9KDaGkzV3eEGZoBs9WQBGNP8Q=; b=3+UbZ+Jmc56FYzTKzIBEfoyjDz
	/yZlvLDXFwk4BiWW6sPjmuT1ARt5o50B8Y4s6BviSpYurprJx1MfaC5xmP+t28jRUbMq4UJxSxI/F
	A1WbDYUjEZawlAF3VVd3k7r8XhYbqfFhOHDS9tiskktaXzcvZWaMFeeoR6aFPdY3yz8JUreMWUAPC
	kVqthI0atVggWoWQVOhJx8OKT4YvenlNUQDhAasQjs9VLkE+M0q2ZjR6KOB6HV/paIcRn6SB7pEqC
	jn6s5jJJvGGqSB+cJ1yv954DIbErdZMa+OhtdB3kzul0IvgShbMFsiIfUFMx9OgKhiuML4BuiNXH0
	GOqndJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgzh-0041Xm-1O;
	Fri, 07 Jul 2023 08:39:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHgzd-0041Vx-18
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 08:39:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688719149; x=1720255149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dtGi80nAmBYUlfQxcvkGwXy8iF8J/YdAQKY2USsJAl0=;
  b=UJ5sdRE7ddBIcN6gLtA6GkDgZD4T4k4V0oREHRILG1QqfGepeOR2uiXG
   Lxb8okDjeKg04ppckyOWT6Y7TL5P0WIZlO08kAauA3YmLcLJDTrpAdQnm
   h1+1t5ePYdcZ94gPOf/BDiETNp3KoXIijD1o0LeE6tXpdPAMGCMnetPpz
   uMXbnBPOjT22g1frgzsGwSp2WvEYMVFWN7T3MuZfyvE0hl1Cj4NxE6PpZ
   OMD446RaUffsISdwfmXXB6LfVWtYbh7IEaJAlYsOh+1sBfEH44eXsX0CN
   M31g11NEqNBZ5RmeMFry/nosnPUS7SOI1eZF+oe4sB9ElMflzo1fgOPXd
   w==;
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="asc'?scan'208";a="219303832"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2023 01:39:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Jul 2023 01:39:04 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 7 Jul 2023 01:39:00 -0700
Date: Fri, 7 Jul 2023 09:38:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from
 FFI
Message-ID: <20230707-attach-conjuror-306d967347ce@wendy>
References: <CAMj1kXFZren0Q19DimwQaETCLz64D4bZQC5B2N=i3SAWHygkTQ@mail.gmail.com>
 <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_013909_588566_8E19AC01 
X-CRM114-Status: GOOD (  74.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@esmil.dk, rafael@kernel.org, lpieralisi@kernel.org, cuiyunhui@bytedance.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, allen-kh.cheng@mediatek.com, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, jdelvare@suse.com, Paul Walmsley <paul.walmsley@sifive.com>, jrtc27@jrtc27.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, yc.hung@mediatek.com
Content-Type: multipart/mixed; boundary="===============3708933261549129840=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3708933261549129840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9wCFN2db/9+WA3zy"
Content-Disposition: inline

--9wCFN2db/9+WA3zy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

I've tried to reformat this a bit, probably gone wrong in the process
somewhere.

On Thu, Jul 06, 2023 at 02:39:13PM -0700, ron minnich wrote:
> On Thu, Jul 6, 2023 at 8:32=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com=
<mailto:palmer@dabbelt.com>> wrote:
> > On Thu, 06 Jul 2023 01:53:47 PDT (-0700), Ard Biesheuvel wrote:
> > > On Thu, 6 Jul 2023 at 04:04, =E8=BF=90=E8=BE=89=E5=B4=94 <cuiyunhui@b=
ytedance.com<mailto:cuiyunhui@bytedance.com>> wrote:
> > >> On Wed, Jul 5, 2023 at 10:17=E2=80=AFPM Palmer Dabbelt <palmer@dabbe=
lt.com<mailto:palmer@dabbelt.com>> wrote:
> > >> > On Wed, 05 Jul 2023 04:42:47 PDT (-0700), cuiyunhui@bytedance.com<=
mailto:cuiyunhui@bytedance.com> wrote:
> > >> > > Here's version 3 of patch series.
> > >> > >
> > >> > > V1: The FFI (FDT FIRMWARE INTERFACE) scheme has reached a
> > >> > > consensus with the Maintainers.
> > >> > > Please refer to:
> > >> > > https://patches.linaro.org/project/linux-acpi/patch/202304260340=
01.16-1-cuiyunhui@bytedance.com/
> > >> >
> > >> > From looking at that thread it seems that the consensus is this is=
 a bad
> > >> > idea?  Sorry if I'm just missing something...
> > >> >
> > >>
> > >> First of all, Coreboot does not support EFI, Ron has expressed, as f=
ollows:
> > >> "I am wondering if we can focus on risc-v here, and not drag in ARM,
> > >> b/c the ARM ACPI+UEFI ship has sailed. I had that discussion in 2013
> > >> ;-) and it's clear we don't want to redo it.
> > >> In general, in my world, because of the many problems that come with
> > >> UEFI (security, code quality, performance), we'd like to avoid
> > >> requiring a dependency on UEFI just to get ACPI on RISC-V. It also
> > >> seems, from other discussions I'm having, that there is some belief
> > >> that ACPI will be wanted on RISC-V. It would be nice to separate tho=
se
> > >> pieces on RISC-V; certainly they were separate for a very long time =
in
> > >> the x86 world (we had ACPI+SMM on coreboot laptops without UEFI for
> > >> example)."
> > >>
> > >
> > > There appears to be a bit of cargo cult going on here.
> > >
> > > I agree that the traditional BIOS vendors did a terrible job pivoting
> > > to (U)EFI when it became a requirement for booting Windows on x86 PCs,
> > > and coreboot did an excellent job providing a retrofit alternative
> > > that was more secure and robust.
> > >
> > > However, it makes sense to distinguish between
> > > a) the UEFI specification
> > > b) the UEFI reference implementation (edk2)
> > > c) commercial implementations created by BIOS vendors for x86 PC OEMs
> > > that do not perform any testing beyond booting Windows.
> > >
> > > coreboot decided not to implement EFI at all, which on x86 means
> > > booting in a mode that is similar to BIOS boot. Given how the ACPI and
> > > DMTF (for SMBIOS) specifications were already under development when
> > > UEFI was being rolled out on x86, those specs contain provisions
> > > defining how to obtain the ACPI and SMBIOS tables by scanning regions
> > > of memory and looking for magic strings. But this is only defined for
> >=20
> > In theory we have that in RISC-V as well: on boot we don't actually have
> > a DT pointer, but instead a "config string" pointer.  That's a bit of a
> > retcon from when we were planning on adding our own firmware probing
> > interface, but in order to appear to have never made a mistake we just
> > said that config strings can be anything and have magic numbers to
> > differentiate between the flavors.
> >=20
> > IIUC we don't take advantage of that in Linux, though, so maybe let's
> > just pretend it doesn't exist?
> >=20
> > > x86, and only works on x86 because all x86 machines are essentially
> > > PCs with a highly uniform system topology.
> > >
> > > The ARM case is very different, and while I am no expect on RISC-V,
> > > the following probably applies to it as well:
> > > - there is no need to work around buggy proprietary firmware that can
> > > boot Windows but not Linux
> > > - there is no 'prior art' when it comes to pre-EFI boot interfaces
> > > except for embedded style bare metal boot where all initialization is
> > > done by the kernel (e.g., PCI enumeration and resource assignment
> > > etc), and this is fundamentally arch specific
> > > - ACPI is a rich firmware interface, and the ACPI specification layers
> > > it on top of UEFI so the OS can make certain assumptions about the
> > > extent to which the platform has been initialized by the time it hands
> > > over.
> > >
> > > This is why the maintainers of the arm64 and RISC-V ports appear to
> > > agree that ACPI will only be supported when booting from firmware that
> >=20
> > Yes, we're basically in the same spot as arm64 is here -- or at least
> > we're aiming to be, we've yet to even release a kernel that boots with
> > ACPI so we have no legacy compatibility yet.
> >=20
> > > implements the EFI specification. Note that this does not impose any
> > > requirement at all regarding which EFI implementation is going to be
> > > used: suggestions have been made on the thread to use a) a coreboot
> > > specific minimal EFI shim that describes the firmware tables and the
> > > EFI memory map, b) the UPL payload for coreboot, and c) U-Boot's EFI
> > > implementation.
> > >
> > > I will also note that booting according to the EFI spec is not
> > > fundamentally  more secure or faster: I have done some experiments on
> > > arm64 comparing bare metal boot with EFI boot using a minimal
> > > implementation in Rust, for booting virtual machines under KVM. Due to
> > > cache maintenance overhead and execution with the MMU disabled, bare
> > > metal boot is actually slightly slower. And due to the fact that the
> > > minimal EFI firmware enables the MMU and caches straight out of reset,
> > > it is also arguably more secure, given that all memory permission
> > > based protections and other page table based hardening measures (e.g.,
> > > BTI) are always enabled.
> > >
> > > In summary, I think it may be time to stop extrapolating from bad
> > > experiences with buggy proprietary x86 PC firmware created by
> > > traditional BIOS vendors for booting Windows (and nothing else) 15+
> > > years ago. The situation is very different for non-x86 Linux
> > > architectures, where we are trying hard to beat some sense into the
> > > fragmented embedded ecosystem, where every SoC vendor used to have its
> > > own fork of u-boot that booted in a slightly different manner,
> > > requiring a lot of effort on the part of the distros to track all
> > > those moving targets.
> >=20
> > That's roughly where we're trying to go in RISC-V land, at least for
> > most software people.  Everyone gets their own ISA, which obviously
> > causes a ton of fragmentation, but not really anything we can do about
> > that.  At least we can avoid adding additional sources of fragmentation
> > from the software side of things, though.
> >=20
> > >> Then, a consensus was reached with Ard, that FFI can be applied to R=
ISC-V.
> > >>
> > >
> > > For the record, I would not characterize this as consensus. What I sa=
id was
> > > - SMBIOS has very little significance to the kernel itself or impact
> > > on its internal operation, and so it can be exposed via DT in a
> > > generic manner;
> > > - ACPI without UEFI on non-x86 is a) a bad idea, and b) fundamentally
> > > broken on arm64. So b) is out of the question, but it is not up to me
> > > to decide whether or not the RISC-V maintainers should entertain bad
> > > ideas.
> >=20
> > IMO we have enough bad ideas in RISC-V already and thus should avoid
> > adding more.

> ACPI was not originally part of UEFI. ACPI works just fine on
> Chromebooks, and has for 12 years, and on coreboot since 2006,
> without UEFI. I've integrated support for ACPI into several
> code bases, including Plan 9 on non-UEFI systems.
>=20
> I am unable to understand the claim that ACPI on non-UEFI
> RISC-V is a bad idea. Clearly, I am not alone.
>=20
> But, all that said, I get the impression that the gatekeepers
> are absolutely immovable on this question?

> Perhaps the right way
> to move forward is to find a way to extract what we need from ACPI
> and move forward on systems that can function without UEFI AND ACPI?
> Would that be preferable?

Isn't this exactly the type of thing that has been proposed by this
series, that everyone seems to be against? Or are you suggesting that we
would, on a DT system, read some ACPI information, and then revert to
being DT based?

> Just so we're all on the same page, I just now asked Mark Himelstein
> of RISC-V International if there is anything in RISC-V standards that
> requires UEFI, and the answer is a solid "no."

Huh? Firstly, running off to invoke RVI is not productive - they don't
maintain the various operating system kernels etc.
Secondly, that does not seem to be true. The platform spec mandates UEFI
for the OS-A server platform, alongside ACPI:
https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-spec=
=2Eadoc#32-boot-process
and the OS-A embedded platform needs to comply with EBBR & use DT:
https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-spec=
=2Eadoc#32-boot-process

EBBR does say that systems must not provide both ACPI and DT to the OS
loader, but I am far from an expert on these kind of things & am not
sure where something like this where the DT "contains" ACPI would stand.

The RISC-V ACPI spec also says "UEFI firmware is mandatory to support
ACPI":
https://github.com/riscv-non-isa/riscv-acpi/blob/master/riscv-acpi-guidance=
=2Eadoc

Jess, Sunil or Ard on the EBBR front perhaps, please correct me here if I
have got anything wrong.

Thanks,
Conor.

--9wCFN2db/9+WA3zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKfO+QAKCRB4tDGHoIJi
0svUAP9r/Lp2zKQXtuAlBsa4gP5JwJi3jnDxf1Hsc2COBpdvRQD/VcbIZht6HEaF
F7OLZmudrFgxwvBA77VaDOUyOMqQyAA=
=f1/M
-----END PGP SIGNATURE-----

--9wCFN2db/9+WA3zy--


--===============3708933261549129840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3708933261549129840==--

