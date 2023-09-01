Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B4CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 06:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZeDwQwIPoZv+2ZTG9YJz9m71h+xZ+Q4cWubDW4lhf4=; b=yaS9p0WhC6n82J/xghj6pDUVjh
	7gLfFyYjddb6CJz7lABMkdr4ZPFMsAMHOOjt0IYtdiIIA1Reh+u7i/lx+gnhTq/Ix/xvAHOQSOsVe
	pWwc7Z+P/PTWW6qNt+8LhEejyb62l9YYX0PKo/UKwlhKMXrJ5iBAcIPSMEVUMDWfdlKblfUbZaa2N
	KsNfjUlxplvcEyGyiTeMJPU5/HpSUrH/fEFHXpczk8t/Fw3wabTuA9nnJC0Zpy27VJMmDLqv6zRPV
	/HAigXPQd/RPtLGwtf5DKcqUPhYUs5N0uRccHR5CVaYgIcVRIx+Xa/GqzPrpuUQjg7rf4yurgBnPV
	mLx1wGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxaO-00GXYN-2v;
	Fri, 01 Sep 2023 06:24:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbxaL-00GXX3-0z
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 06:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693549489; x=1725085489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QRNW0mmcEm0U5hthS099MEK7qNzHYNv/4Or5oaKKF7I=;
  b=RSx5oSCOcFKApJVqlYuxdcvW4Po9zicFyd9oe0we2ce2+N8KtfMwir7Z
   z8Zbatuw5pshawBrr0Ev5BPYq1KQRaasFuWzPOi9O8NeZZ8EqKSJtKj5I
   6JeZScTUW3xU3rPt6URpFBo6LUh534ELvafNIluTsp9jzcS4xMWSq+ETw
   ahx6ESlc6Qm2oqMy+LpIdoMEE3qkFtlCbp5ZC9quHPU0oRiqkxR6RdnK4
   zC5NRhiYPbfJweGtweM0HUDGhKgDG+F+quw75qqdVadKmjF6H+TKSmsGG
   ZOzPouAcJlQOs/4LplIiqNo865dxk4qvJ5oxRTsnldG++VnE5ob4KqrU3
   Q==;
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="asc'?scan'208";a="2393948"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2023 23:24:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 31 Aug 2023 23:24:40 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 31 Aug 2023 23:24:38 -0700
Date: Fri, 1 Sep 2023 07:23:56 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>
Subject: Re: linux-next: Tree for Aug 31 (riscv: ANDES errata)
Message-ID: <20230901-headed-unsigned-794833b7b5d5@wendy>
References: <20230831135535.13c67178@canb.auug.org.au>
 <33a5e278-fb4b-b5db-e4f6-bb5a1e4228ef@infradead.org>
MIME-Version: 1.0
In-Reply-To: <33a5e278-fb4b-b5db-e4f6-bb5a1e4228ef@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_232449_500319_C21D90E9 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: multipart/mixed; boundary="===============2425221088713484123=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2425221088713484123==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pyMsjv/SDk+2OvlN"
Content-Disposition: inline

--pyMsjv/SDk+2OvlN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:33:40PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 8/30/23 20:55, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Please do *not* include material destined for v6.7 in your linux-next
> > included branches until *after* v6.6-rc1 has been released.  Also,
> > do *not* rebase you linu-next included branches onto v6.5.
> >=20
> > Changes since 20230830:
> >=20
> > The risc-v tree gained conflicts aginst Linus' tree.
> >=20
>=20
> On risc-v 32-bit or 64-bit, when CONFIG_MMU is not set:

lkp reported this yesterday too, Prabhakar is conjuring up a fix.

Thanks Randy for the report,
Conor.

--pyMsjv/SDk+2OvlN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPGDWAAKCRB4tDGHoIJi
0geaAP948UleALoWfE9W0GAqY18T27FIepedxZnpl8hSeGrJlgD+OoY4l9Nzo3lu
qaYzaBi5aPCWlPxu/HoaxKR8Ypl1ugg=
=fh9/
-----END PGP SIGNATURE-----

--pyMsjv/SDk+2OvlN--


--===============2425221088713484123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2425221088713484123==--

