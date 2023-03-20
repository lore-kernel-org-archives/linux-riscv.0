Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A400C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4lQS4gTo2vNIVHKrWNL2TvwAUfebMl+YRakETxjdRQ=; b=z7fiD6q2SwLZ2XGW1WUSYQsMZq
	xdHvRHe17GZ+btRJ40REb+afPvCSvLp/P3gwPZV3obGHQAjnh0RCHEyq+aZeNrRe4YzDwgzghfOQ0
	uwFhuGxrrXceJwm1wYJXZjJpybkrqLkXiaYrqWYj0ybdKbuU9LxkCIDvAzgbiFw919Azr+tqSLaBT
	AzamhZq0xZkUakF3yycR/PB6kqtCXd2oRaiRZtDHq8geWlls2T6Qg16UJiL4yDwa0FeNB6Ch1nLo+
	qpR0PWuNEhxF4u9kKrJdNqLRhUg+9KswVw5RKEfRXKMrzwQIOXsjUpWzmPUaXRX5h6dqxkcpQT14S
	276uKPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peEN2-008wRN-30;
	Mon, 20 Mar 2023 12:12:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peEN0-008wQH-0G
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 12:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679314329; x=1710850329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0cFu0waq1sUq+AFu96iKtjuSciX3NLthHqTvv/AT2A=;
  b=asuPxwct1Yv0KxXQe7aGMfpBno9xZjM//5RaFlZODaGC9yjKYZ1yfMf9
   17jVYMgD1Zc7eO4DbcyTVaBtase2C0jQLBXQc12C+UqHzDFh9xAPu9ci9
   g06VG5lK7cbbhqzoqSSPktdYZmU12eMG49azBtpG4umpKVHSx68CH3xAN
   OI3cm6v2JKkPaAPWNE/MrFrJNT70tCZ4fWC3zdVqF7OJ6nWrHUI6J6S9z
   dDcmLnp1RN56QhOOpvaL/0gnhlULbqyJui8YSgyx8E22wL3HiZOB4ZGIf
   a3Se1ymHBbaz0OEVLYfoLz+vZZtxSya5mNechQxBdXsLaebVV+4MveBOf
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; 
   d="asc'?scan'208";a="205502494"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Mar 2023 05:12:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 05:12:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 05:11:59 -0700
Date: Mon, 20 Mar 2023 12:11:29 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alex@ghiti.fr>
CC: Mike Rapoport <rppt@kernel.org>, Conor Dooley <conor@kernel.org>,
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<frowand.list@gmail.com>, <robh+dt@kernel.org>, <mick@ics.forth.gr>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Valentina.FernandezAlanis@microchip.com>, <Daire.McNamara@microchip.com>
Subject: Re: RISC-V reserved memory problems
Message-ID: <e2203659-e1ac-4fbf-9b5d-2c561255b645@spud>
References: <8e10bf15-9fa9-fe90-1656-35bf3e87e7f8@microchip.com>
 <f8e67f82-103d-156c-deb0-d6d6e2756f5e@microchip.com>
 <Y9wytv5KSt1ca+td@spud>
 <ZAchb/DfbIh+qaE4@kernel.org>
 <8abfb680-e1dd-8d1f-dd10-0a8bf086f5c3@ghiti.fr>
 <b797bd15-ef3d-4d28-9aad-ffe0a32aa0b0@spud>
 <de204b7c-7c1d-bd7b-0072-d128757258e2@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <de204b7c-7c1d-bd7b-0072-d128757258e2@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_051210_127739_6AF2518B 
X-CRM114-Status: GOOD (  32.95  )
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
Content-Type: multipart/mixed; boundary="===============6939584661920013915=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6939584661920013915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pKzsOyM01oqrnRqw"
Content-Disposition: inline

--pKzsOyM01oqrnRqw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 04:12:57PM +0100, Alexandre Ghiti wrote:
> On 3/9/23 13:51, Conor Dooley wrote:
> > On Thu, Mar 09, 2023 at 01:45:05PM +0100, Alexandre Ghiti wrote:
> > > On 3/7/23 12:35, Mike Rapoport wrote:
> > > > Hi Conor,
> > > >=20
> > > > Sorry for the delay, somehow this slipped between the cracks.
> > > >=20
> > > > On Thu, Feb 02, 2023 at 10:01:26PM +0000, Conor Dooley wrote:
> > > > > Hullo Palmer, Mike & whoever else may read this,
> > > > >=20
> > > > > Just reviving this thread from a little while ago as I have been =
in the
> > > > > area again recently...
> > > > TBH, I didn't really dig deep into the issues, but the thought I ha=
d was
> > > > what if DT was mapped via fixmap until the setup_vm_final() and the=
n it
> > > > would be possible to call DT methods early.
> > > >=20
> > > > Could be I'm shooting in the dark :)
> > >=20
> > > I think I understand the issue now, it's because In riscv, we establi=
sh 2
> > > different virtual mappings and we map the device tree at 2 different =
virtual
> > > addresses, which is the problem.
> > >=20
> > > So to me, the solution is:
> > >=20
> > > - to revert your previous fix, that is calling
> > > early_init_fdt_scan_reserved_mem() before any call to memblock_alloc()
> > > (which could result in an allocation in the area you want to reserve)
> > >=20
> > > - to map the device tree at the same virtual address, because
> > > early_init_fdt_scan_reserved_mem() initializes reserved_mem with the =
dtb
> > > mapping established in setup_vm() and uses reserved_mem with the new =
mapping
> > > from setup_vm_final (which is what Mike proposes, we should use the f=
ixmap
> > > region to have the same virtual addresses)
> > >=20
> > > Hope that makes sense: I'll come up with something this afternoon for=
 you to
> > > test!
> > Sounds good. Please give me some ELI5 commit messages if you can,
> > explanations for this stuff (which I found took a lot of archaeology to
> > understand) would be very welcome next time we need to go back looking
> > at this stuff.
>=20
>=20
> Can you give it a try here:
> https://github.com/AlexGhiti/riscv-linux/commits/dev/alex/conor_dtb_fixma=
p_v1
> ?
>=20
> That works for me but I need to carefully explain and check that's correct
> though, not upstreamable as is.

Hey Alex,

So I ended up being pretty sick & had to take a week off. I gave this an
initial spin today & it appears to work.
I'll take it for a longer test-drive when you send a "real" patch for
it, but I tested both the lookup by name & the situation that was
allocating in reserved memory and both were not an issue.

Thanks for working on this,
Conor.

--pKzsOyM01oqrnRqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBhNcQAKCRB4tDGHoIJi
0jHSAQDYXV+uHHctZPqRy4OTzH84+s3JkFLcich/mv5xUvEIsAEAttjvErnc91Wo
/sgB9RuUAHwyl42K555VXdhZIr5oHQg=
=vZ1A
-----END PGP SIGNATURE-----

--pKzsOyM01oqrnRqw--


--===============6939584661920013915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6939584661920013915==--

