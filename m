Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54757C64EC4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfdSMIcCFQhHWvjuoYwXIMDRn1kvnRYTKyq56PnU6rc=; b=cP+bD9KC5aYKpIN9BunTG1PIbx
	sHkYTonI3mhn8Z6isRADJGPKTjb02v63IaxJuCQmcmerALsFEAvTXcm0Iixmkv4FWSvmTHrYcVOVm
	V4Hr7BmvtFs94U5YFL8fzUMZGZcbpc0JK+/Ni+6POq4wJVa2WHXcGOsHm3+YkErh0TzqH64o6RzD8
	s6ecYP0FlMCQVjj2n4UtTHYUdd3BiqDIdPhQu9YcPvBjnRI3wHwTi4D0xx/O6zJReUB+K+N5y+uYP
	h5QBe9Ix5QTo2Z88QmsxxJoZZiqWZll1frjgb9AstDe27pWvbXFlULtMZDWTFNpz/47oLix728mGH
	w790ZQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFl7-009w31-2t; Thu, 09 Mar 2023 12:52:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paFl4-009w1O-4r
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 12:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678366354; x=1709902354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BNQWFcbNiSx0YgFF7RrawPwzS3TsDDcIUIvyv/UuNkQ=;
  b=TSHQ4STU++UfI7+mYeyh5Bn2O+dQv1Mcgyva9plN5JbJiZxgalypqyi1
   MEICbCGN90QZve1gLfkzlPyYwpv095KbsY2ljIz+CurXQ1n684p4+lr4v
   nJnwW7AA4JaAm1I6gIWDMJviF7kMj+pb4UUGj2Sv31xN3Rlzyu5ksuJGu
   GQA/mKC+J4OXW+n3uE6yncd7bZHdXkSTYYrkzg4CdV/bG+Tb2Gcpwq+sL
   oeHdhyvNqxA9dTx6ivM/8cjMKvZUQ4bQ9Cy0zdJiZHTxPZvnZSF/I5osw
   LGidye2m3k999ytBUnKuLkARrO34KU9ujFBkMtFVDiQ0wGsGNE/igPK57
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,246,1673938800"; 
   d="asc'?scan'208";a="204527753"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2023 05:52:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Mar 2023 05:52:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Mar 2023 05:52:28 -0700
Date: Thu, 9 Mar 2023 12:51:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Mike Rapoport <rppt@kernel.org>, Conor Dooley <conor@kernel.org>,
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<frowand.list@gmail.com>, <robh+dt@kernel.org>, <mick@ics.forth.gr>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Valentina.FernandezAlanis@microchip.com>, <Daire.McNamara@microchip.com>
Subject: Re: RISC-V reserved memory problems
Message-ID: <b797bd15-ef3d-4d28-9aad-ffe0a32aa0b0@spud>
References: <8e10bf15-9fa9-fe90-1656-35bf3e87e7f8@microchip.com>
 <f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com>
 <Y9wytv5KSt1ca+td@spud>
 <ZAchb/DfbIh+qaE4@kernel.org>
 <8abfb680-e1dd-8d1f-dd10-0a8bf086f5c3@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <8abfb680-e1dd-8d1f-dd10-0a8bf086f5c3@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_045234_269228_5AF0EB8F 
X-CRM114-Status: GOOD (  22.88  )
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
Content-Type: multipart/mixed; boundary="===============1831420129152721536=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1831420129152721536==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mUvIqHBQ7/8R2dhI"
Content-Disposition: inline

--mUvIqHBQ7/8R2dhI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 01:45:05PM +0100, Alexandre Ghiti wrote:
>=20
> On 3/7/23 12:35, Mike Rapoport wrote:
> > Hi Conor,
> >=20
> > Sorry for the delay, somehow this slipped between the cracks.
> >=20
> > On Thu, Feb 02, 2023 at 10:01:26PM +0000, Conor Dooley wrote:
> > > Hullo Palmer, Mike & whoever else may read this,
> > >=20
> > > Just reviving this thread from a little while ago as I have been in t=
he
> > > area again recently...
> > TBH, I didn't really dig deep into the issues, but the thought I had was
> > what if DT was mapped via fixmap until the setup_vm_final() and then it
> > would be possible to call DT methods early.
> >=20
> > Could be I'm shooting in the dark :)
>=20
>=20
> I think I understand the issue now, it's because In riscv, we establish 2
> different virtual mappings and we map the device tree at 2 different virt=
ual
> addresses, which is the problem.
>=20
> So to me, the solution is:
>=20
> - to revert your previous fix, that is calling
> early_init_fdt_scan_reserved_mem() before any call to memblock_alloc()
> (which could result in an allocation in the area you want to reserve)
>=20
> - to map the device tree at the same virtual address, because
> early_init_fdt_scan_reserved_mem() initializes reserved_mem with the dtb
> mapping established in setup_vm() and uses reserved_mem with the new mapp=
ing
> from setup_vm_final (which is what Mike proposes, we should use the fixmap
> region to have the same virtual addresses)
>=20
> Hope that makes sense: I'll come up with something this afternoon for you=
 to
> test!

Sounds good. Please give me some ELI5 commit messages if you can,
explanations for this stuff (which I found took a lot of archaeology to
understand) would be very welcome next time we need to go back looking
at this stuff.

Thanks Alex!
Conor.

--mUvIqHBQ7/8R2dhI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAnWbwAKCRB4tDGHoIJi
0lV+AP9XtW6MNhLD0bRLapXZEAgZkQBrftMGSKL9GmKJ4sPmyAD/SQYlZ6j9k1xD
+QKAkqJQ6hBfnbtegzICGOBWOil3ngk=
=dF4f
-----END PGP SIGNATURE-----

--mUvIqHBQ7/8R2dhI--


--===============1831420129152721536==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1831420129152721536==--

