Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F1CEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ugh99hd6Xeevmobviv+Cmu1q/VR2V6jT3JFPq/hu/ZA=; b=EKJHrTHYNUcKY8jZRWh4yXzQsg
	ot1yoFu3yril0Gxkn1tNK2bcbcKBZcF4ja3t5/sS+CxkPZIcXosW3vAKe47Xrjj9Ouzh9jaEf4uRk
	xI2MKEOkjkfrlSGdZOscVMm/z8gcsOs4W52JKBynnO7VFCukdNnfbyfV9N7AFHX7GMdMhuoXHHJ3A
	9ADmLFR9D/P4zoEUin8WhmZfrqoW7DtDoIDWLbmiGZD/POCoBqCldme+/2FzxZRygQMoISYxkPdfk
	w4E6J6Irxr0Aui+5SC2uWw611DdWNcoAuRffWYWSMmot6tAJ61unKkElayALGWKzgorIvZ/SgmEAu
	rl2AmMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmNF-00AJAa-2z;
	Mon, 26 Jun 2023 13:35:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmNE-00AJ9d-04
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 13:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687786521; x=1719322521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gAk31+J9YDPOueH0IlItj567Vy4tDOh+GRCSBbZlyFo=;
  b=YnXDFEGEqgitUQj2mkMWqOhE/AKNjhTK8M12XIlh+F0xYZolENivTXGa
   sZEbqZc9JnOgfauUbwvQ9c690d0dooebatN37PP1tlRV2ogm8subYI9s8
   p7stWF+QIJ1iDVaKMq6pHOjXl70s5kxN6nJyLcOpNrgxwKFTO26CixB66
   cUdkWkAw6NQy6yzFnKk/wNnYXwSa7AEJurP1i1I6ELO/S9j+FjcvhyhNp
   wQ6Cko0f1pHSbKI6XBehcsfgbjp2YpLyLsqtFNzj41jhla+r8O9vW2zun
   6Y2Ne3BwxA9NyN05PIWfcpLLBARPAx2A64vYWRqXSWoesdbR9a241Las3
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="asc'?scan'208";a="220545498"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 06:35:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 06:35:15 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 06:35:11 -0700
Date: Mon, 26 Jun 2023 14:34:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>, <suagrfillet@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <robh+dt@kernel.org>,
	<frowand.list@gmail.com>, <ajones@ventanamicro.com>,
	<alexghiti@rivosinc.com>, <mpe@ellerman.id.au>, Arnd Bergmann
	<arnd@arndb.de>, <rppt@kernel.org>, <samuel@sholland.org>,
	<panqinglin2020@iscas.ac.cn>, <anup@brainfault.org>,
	<xianting.tian@linux.alibaba.com>, <anshuman.khandual@arm.com>,
	<heiko@sntech.de>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
Message-ID: <20230626-mousy-latter-ad8088de089f@wendy>
References: <20230625-obstinate-grimy-b765a1d3d741@spud>
 <mhng-57d088de-b527-4f19-89f5-fec31a6df475@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-57d088de-b527-4f19-89f5-fec31a6df475@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_063520_073982_CAC2A117 
X-CRM114-Status: GOOD (  37.49  )
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
Content-Type: multipart/mixed; boundary="===============3626228375317450377=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3626228375317450377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7iJUOqLUsa8DucKl"
Content-Disposition: inline

--7iJUOqLUsa8DucKl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 03:36:06PM -0700, Palmer Dabbelt wrote:
> On Sun, 25 Jun 2023 15:15:14 PDT (-0700), Conor Dooley wrote:
> > On Sun, Jun 25, 2023 at 11:09:21PM +0800, Song Shuai wrote:
> > > =E5=9C=A8 2023/6/25 22:18, Conor Dooley =E5=86=99=E9=81=93:
> > > > On Sun, Jun 25, 2023 at 10:09:29PM +0800, Song Shuai wrote:
> > > > > This reverts commit ed309ce522185583b163bd0c74f0d9f299fe1826.
> > > > > > > With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages
> > > for the
> > > > > linear mapping") reverted, the MIN_MEMBLOCK_ADDR points the kernel
> > > > > load address which was placed at a PMD boundary.
> > > > > > And firmware always
> > > > > correctly mark resident memory, or memory protected with PMP as
> > > > > per the devicetree specification and/or the UEFI specification.
> > > > > But this is not true? The versions of OpenSBI that you mention
> > > in your
> > > > cover letter do not do this.
> > > > Please explain.
> > > >
> > >=20
> > > At this time, OpenSbi [v0.8,v1.3) and edk2(RiscVVirt) indeed don't ob=
ey the
> > > DT/UEFI spec. This statement is excerpted from "Reserved memory for r=
esident
> > > firmware" part from the upcoming riscv/boot.rst. It isn't accurate fo=
r now.
> > > How about deleting this one?
> >=20
> > It is incorrect, so it will need to be removed, yes.
> > Unfortunately writing a doc does not fix the existing implementations :(
> >=20
> > > Actually with 3335068f8721 reverted, the change of MIN_MEMBLOCK_ADDR =
can
> > > avoid the mapping of firmware memory, I will make it clear in the next
> > > version.
> >=20
> > To be honest, I'd like to see this revert as the final commit in a
> > series that deals with the problem by actually reserving the regions,
> > rather than a set of reverts that go back to how we were.
> > I was hoping that someone who cares about hibernation support would be
> > interested in working on that - *cough* starfive *cough*, although maybe
> > they just fixed their OpenSBI and moved on.
> > If there were no volunteers, my intention was to add a firmware erratum
> > that would probe the SBI implementation & version IDs, and add a firmwa=
re
> > erratum that'd parse the DT for the offending regions and reserve them.
>=20
> Is there any actual use case for hibernation on these boards?  Maybe it's
> simpler to just add a "reserved regions actually work" sort of property a=
nd
> then have new firmware set it -- that way we can avoid sorting through all
> the old stuff nobody cares about and just get on with fixing the stuff
> people use.

What is "old stuff nobody cares about"? The first version of OpenSBI with
the fix shipped only the other day, so effectively all current stuff has
this problem. Certainly everything shipping from vendors at the moment
has the problem, and probably whatever downstream, custom versions of
OpenSBI also have it.

Also, the problem isn't just limited to hibernation apparently. I
think it was mentioned in the cover letter that according to Rob,
without being marked as no-map we could also see speculative access &
potentially some of the memory debugging stuff walking these regions.

I'm not sure how you'd intend communicating "reserved regions actually
work", I figure you mean via DT?
I don't really see the benefit of adding a property for those who are
behaving, if we can detect the versions of the one relevant SBI
implementation that are broken at runtime. DT hat on, even less so.
Perhaps I am missing your point, and there's another angle (like trying
to per firmware code)?


--7iJUOqLUsa8DucKl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJmT8wAKCRB4tDGHoIJi
0nbBAQDsaa4oVZHw4/VcABPnn1PmcHFVf2ixtBkkcs7MEQgihAEA9G41AYagonFJ
Rw49Is8T58eY/wNITs9UkwFkoh+Khw4=
=Vgxt
-----END PGP SIGNATURE-----

--7iJUOqLUsa8DucKl--


--===============3626228375317450377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3626228375317450377==--

