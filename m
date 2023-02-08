Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13859C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 12:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtKrMPFaIXYBqqHE6QbXa9vd7xuVZllD04hHr2oXLyc=; b=sownwGSgrqtTq7O0WDjGyaNu4J
	zamNCClURXivLjTTS/3e88jTGyriU+Bs6aWdXiLAWwUIQsR/1NxtQLRDvCAfVRWttEEhb/OUlyqaW
	jhQahTDiPALEpaMca6vn3+AtKHg4gTFCxTEFed6npJVjH5YeqnVJZZqZg6yyneZHIgkK6IJdn6ZVG
	WFC8ayuvccbWBTch1UBHrdrrlNl6X2B8hCFvSY1BCNVZeA67TPvtWEFX9NIpkqwFNzFDzy7w8fxw+
	58m+Ia2po/PFP8troEznz+HGeuKA2SSduEVALR7cVzBodg23B4+WiGuUP7ok4XQdIIOv4vhCCLGoi
	YPffXQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPk18-00FfZB-G7; Wed, 08 Feb 2023 12:57:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPk14-00FfWJ-8X; Wed, 08 Feb 2023 12:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675861058; x=1707397058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vX03Kta9L6dqBlFyGykVGIICORcja6M/gYVsWB8u3qI=;
  b=KTSfnTmvj+gBSk8o4e/TXtu+HaBRglfx9t+GRSEtIY+xPp8P/LTDqEsv
   SbPS9kKEiOeS/sh1DueYwErL0qBhohMqQHpsFNB53lqZE3tIU/p/eCsWC
   b+N/K3hGRGbSAZhFup6ZVD+t1TrnKYWgT2BOd7gCSzoMd6ZZjeyE3Zwqn
   OVl5ffvCCqHbvYIL39YafSkQZt7/7BQgK27Sc0l73s1veYDM8xcvbdIn6
   g6z4hl+U8w9HJ6nchJ5kPBYAynzZbHUMItmhhOfqh1rRUOTRV8pM8stOo
   HrPEjB03S5YCcl/vjDV6XErhOsXvLywfWD4aEEuKKY2wgVYwdfPo88u5k
   A==;
X-IronPort-AV: E=Sophos;i="5.97,280,1669100400"; 
   d="asc'?scan'208";a="211089574"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Feb 2023 05:57:32 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 05:57:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 8 Feb 2023 05:57:30 -0700
Date: Wed, 8 Feb 2023 12:57:05 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <apatel@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>,
	Stephano Cetola <stephano@riscv.org>, Jeff Scheel <jeff@riscv.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, <pbonzini@redhat.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <ajones@ventanamicro.com>, <anup@brainfault.org>,
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
Message-ID: <Y+OcId2PZ0pi5T08@wendy>
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAK9=C2X8C4yswGhDwe1OzQXTELXQxp8=ayiFxh1aVMk4TxeDjw@mail.gmail.com>
 <Y+KS16ZNXrDU+xun@spud>
 <CAOnJCUKKRRCrKN17ytczYXVLTcMkFaZsg6QXKjPUuSk=PqL6JQ@mail.gmail.com>
 <Y+K3FyGrNUQJZao8@spud>
 <CAK9=C2VnkK5GNO4D1AWpiNcTE=OrSueN9NAyhR7rj9csuUi4Mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK9=C2VnkK5GNO4D1AWpiNcTE=OrSueN9NAyhR7rj9csuUi4Mg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_045738_385754_9700FEAD 
X-CRM114-Status: GOOD (  54.19  )
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
Content-Type: multipart/mixed; boundary="===============8362092132863606735=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8362092132863606735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xbfYQqJmC8jjdpbB"
Content-Disposition: inline

--xbfYQqJmC8jjdpbB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Anup!

On Wed, Feb 08, 2023 at 09:24:28AM +0530, Anup Patel wrote:
> On Wed, Feb 8, 2023 at 2:09 AM Conor Dooley <conor@kernel.org> wrote:
> > On Tue, Feb 07, 2023 at 10:15:22AM -0800, Atish Patra wrote:
> > > On Tue, Feb 7, 2023 at 10:05 AM Conor Dooley <conor@kernel.org> wrote:
> > > > On Fri, Feb 03, 2023 at 05:31:01PM +0530, Anup Patel wrote:
> > > > > On Fri, Feb 3, 2023 at 5:54 AM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
> > > > > >
> > > > > > On Fri, 27 Jan 2023 23:27:32 PST (-0800), apatel@ventanamicro.c=
om wrote:
> > > > > > > We have two extension names for AIA ISA support: Smaia (M-mod=
e AIA CSRs)
> > > > > > > and Ssaia (S-mode AIA CSRs).
> > > > > >
> > > > > > This has pretty much the same problem that we had with the other
> > > > > > AIA-related ISA string patches, where there's that ambiguity wi=
th the
> > > > > > non-ratified chapters.  IIRC when this came up in GCC the rough=
 idea was
> > > > > > to try and document that we're going to interpret the standard =
ISA
> > > > > > strings that way, but now that we're doing custom ISA extension=
s it
> > > > > > seems saner to just define on here that removes the ambiguity.
> > > > > >
> > > > > > I just sent
> > > > > > <https://lore.kernel.org/r/20230203001201.14770-1-palmer@rivosi=
nc.com/>
> > > > > > which documents that.
> > > > >
> > > > > I am not sure why you say that these are custom extensions.
> > > > >
> > > > > Multiple folks have clarified that both Smaia and Ssaia are frozen
> > > > > ISA extensions as-per RVI process. The individual chapters which
> > > > > are in the draft state have nothing to do with Smaia and Ssaia CS=
Rs.
> > > > >
> > > > > Please refer:
> > > > > https://github.com/riscv/riscv-aia/pull/36
> > > > > https://lists.riscv.org/g/tech-aia/message/336
> > > > > https://lists.riscv.org/g/tech-aia/message/337
> > > >
> > > > All of these links seem to discuss the draft chapters somehow being
> > > > incompatible with the non-draft ones. I would very expect that that,
> > > > as pointed out in several places there, that the draft chapters
> > > > finalisation would not lead to meaningful (and incompatible!) chang=
es
> > > > being made to the non-draft chapters.
> > > >
> > >
> > > Here is the status of all RVI specs. It states that the Smaia, Ssaia
> > > extensions are frozen (i.e. public review complete).
> > > https://wiki.riscv.org/display/HOME/Specification+Status
> > >
> > > I have added stephano/Jeff to confirm the same.
> > >
> > > AFAIK, IOMMU spec is close to the public review phase and should be
> > > frozen in this or next quarter.
> > > IIRC, this chapter in AIA will be frozen along with IOMMU spec.
> > >
> > > Anup: Please correct me if that's not correct.
> > >
> > > > Maybe yourself and Palmer are looking at this from different
> > > > perspectives? Looking at his patch from Friday:
> > > > https://lore.kernel.org/linux-riscv/20230203001201.14770-1-palmer@r=
ivosinc.com/
> > > > He specifically mentioned this aspect, as opposed to the aspect that
> > > > your links refer to.
> > > >
> > > > Surely a duo-plic, if that ever comes to be, could be detected from
> > > > compatible strings in DT or w/e - but how do you intend differentia=
ting
> > > > between an implementation of S*aia that contains the IOMMU support =
in
> > > > Chapter 9 in a finalised form, versus an implementation that may ma=
ke
> > > > "different decisions" when it comes to that chapter of the spec?
> > >
> > > We will most likely have an extension specific to iommu spec as well.
> >
> > Right, but unless I am misunderstanding you, that is an extension for t=
he
> > IOMMU spec, not for Chapter 9 of the AIA spec?
> >
> > I would say that it is likely that if you have AIA and IOMMU that you'd
> > want to be implementing Chapter 9, but that would not appear sufficient=
 to
> > draw a conclusion from.
> >
> > Maybe the RVI lads that you've added (or Anup for that matter!) can
> > clarify if there is a requirement that if you do AIA and IOMMU that you
> > must do Chapter 9.
> > If not, my prior question about a differentiation mechanism still appli=
es
> > I think!
>=20
> For the benefit of everyone, the AIA spec mainly defines three
> modular components:
> 1) Extended Local Interrupt CSRs (Smaia and Ssaia extensions)
>     (ISA extension covered by: Chapter 2, Chapter 6, and Chapter 7)
> 2) Incoming MSI Controller (IMSIC)
>     (ISA and Non-ISA extension covered by: Chapter 3 and Chapter 8)
> 3) Advanced PLIC (APLIC)
>     (Non-ISA extension covered by: Chapter 4)
>=20
> Apart from above, we have Chapter 5 ("Duo-PLIC") and Chapter 9
> ("IOMMU Support for MSIs to Virtual Machines") which are in draft
> state.
>=20
> Currently, there are no RISC-V members who have expressed
> interest in implementing Chapter 5 ("Duo-PLIC") so this chapter
> will stay in draft state for a foreseeable future.

Thanks for the clarifications :)

> The Chapter 9 ("IOMMU Support for MSIs to Virtual Machines")
> defines an optional feature of IOMMU which can be implemented
> by a standard IOMMU (such as RISC-V IOMMU) or a vendor specific
> IOMMU. A RISC-V platform can certainly support device pass-through
> using IMSIC guest files and an IOMMU which does not implement
> Chapter 9. Unfortunately, there is a limit on the maximum number
> of per-HART IMSIC guest files which can further limit the number
> of pass-through devices. The Chapter 9 allows RISC-V platforms
> to support large number of pass-through devices by defining "MRIF
> - memory resident interrupt files" for an IOMMU. Further, the MRIFs
> defined by Chapter 9 are simply interrupt files located in main memory
> and have nothing to do with AIA local interrupt CSRs (Smaia and Ssaia).
>=20
> The presence of S*aia in ISA string only implies that AIA extended
> local interrupt CSRs are implemented by the underlying RISC-V
> implementation.

Would you mind linking to where this is documented & explaining in your
commit message why it is okay operate on the basis of s*aia in the ISA
string only mandates the presence of the CSRs and nothing more.

I think when I was reading it last night, I saw some commentary in this
vein in Section 1.6 of the rc2 spec. Although IIRC it noted changes in
interrupt behaviour there too, so I'm not sure if that section is what you
are referring to here.

Perhaps this is all just a good argument for providing more information
in commit messages ;)

> I confirm that it is certainly not mandatory for a RISC-V platform to
> implement Chapter 9 of the AIA specification if the RISC-V platform
> already implements AIA and IOMMU.

Cool, thanks.
By what mechanism, since you say that "s*aia" in the ISA string only
implies presence of the CSRs [sic], are we meant to discover the
presence of Chapter 9?
A property of the IOMMU node seems the most logical I suppose, or
perhaps inferred from the presence/config of other properties of said
node?

> > > > I thought that would be handled by extension versions, but I am told
> > > > that those are not a thing any more.
> > > > If that's not true, and there'll be a version number that we can pu=
ll in
> > > > from a DT and parse which will distinguish between the two, then pl=
ease
> > > > correct my misunderstanding here!

Thanks again Anup,
Conor.


--xbfYQqJmC8jjdpbB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+OcHAAKCRB4tDGHoIJi
0sv5AP4kAApM9wzz3RBpGeRypYwcyCH8VOf6+uAbG6ZPbjmLIwEAnZnuEbEH3/lZ
LfmwTNR0OueZhoRWpzFittOpq/IGxAg=
=b8bw
-----END PGP SIGNATURE-----

--xbfYQqJmC8jjdpbB--


--===============8362092132863606735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8362092132863606735==--

