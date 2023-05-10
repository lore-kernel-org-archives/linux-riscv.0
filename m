Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B1DC7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1E/+xCj5T60igWi55GWYU0pIKk24n7VtQlr26hV/Iw=; b=cguJ63fIXO+J69xawtkIy2rs0E
	Y+88bnZM003XdmG5VSb9BlY6YyDTyKyySuFbkdU3XA3CclFbBxF0LQtfHw/cyO/25boURAt3JGHuH
	amEc0vaEBGItlavyo5qzTW0nRXgvXruppG0ZlriCXRPlLyXRTkFGTaPLj38veC4ylf1+WHZBLnkiK
	f6u65uL4Hih5puWqi1bB109Lk64nzUWfkjy4h7AZck7BXhW/Mi6aAs6i8tpEOOZlan6qncWVGY5zd
	bSC/V8hulTbDgheAbBMt1I/irUtwe1WRRI6nqMYDBuZwFdUBu3fPLqBV5NFV23ZiplisGwiI4lM+o
	nUCfTOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1n-005MTY-21;
	Wed, 10 May 2023 07:14:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwe1l-005MSw-0h
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 07:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683702861; x=1715238861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qXFR+BIP/U3TTlzjbDBkfTuKjPFJ9PK38Gpxgz5qpRs=;
  b=GFUgjw3f1Z6zrX2kzzIuluWuP4mV4S5kvQ+eXbnPf2+qaXyL5ilazRYZ
   FIrEUnyrxTgIWr2OuqN4l24uyxvWN9iPTSgiOWTdhOKHC8Om1U6hXANAa
   1B6k+WCuyd9bZ4dEDZMA/M9BiDvchl4hPTpQIv7MzzXIOHSBGKcXiKABu
   mAo8QInwaHfKud1NI79j/ua8lpCIraisuMI+ekdVDvkAEqrn0QDk2wqh0
   9Svsc0i4RRl+3r8SWpPUtH13vWczTYqe+v40O9i0nd00hI7gF+g6Lh2TL
   /wjv+AJG4vRShpy2T+bWBHe5QF33LoORgG0dJsprEJE+YT6QxA8riXyW5
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677567600"; 
   d="asc'?scan'208";a="151272995"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 May 2023 00:14:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 10 May 2023 00:14:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 10 May 2023 00:14:18 -0700
Date: Wed, 10 May 2023 08:13:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: zhangfei <zhang_fei_0403@163.com>
CC: <ajones@ventanamicro.com>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <zhangfei@nj.iscas.ac.cn>
Subject: Re: [PATCH 1/2] RISC-V: lib: Improve memset assembler formatting
Message-ID: <20230510-cricket-dwindling-a35d40f1da10@wendy>
References: <20230509-b0dc346928ddc8d2b5690f67@orel>
 <20230510035243.8586-1-zhang_fei_0403@163.com>
 <20230510035243.8586-2-zhang_fei_0403@163.com>
MIME-Version: 1.0
In-Reply-To: <20230510035243.8586-2-zhang_fei_0403@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_001421_315464_CDC2D9EC 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: multipart/mixed; boundary="===============5771563306535435861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5771563306535435861==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cBXCyWD8ANQTX0/G"
Content-Disposition: inline

--cBXCyWD8ANQTX0/G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Zhangfei,

On Wed, May 10, 2023 at 11:52:41AM +0800, zhangfei wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
>=20
> Aligning the first operand of each instructions with a tab is a
> typical style which improves readability. Apply it to memset.S.
> While there, we also make a small grammar change to a comment.
>=20
> No functional change intended.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Three things for you here..
Firstly, since you sent Andrew's work, you need to add your own
Signed-off-by to the patch.
Secondly & thirdly, please version your patchsets & do not later
versions as an reply to the v1. In my mail client I see:

May 10 zhangfei        (  58)           =E2=94=8C=E2=94=80>[PATCH 2/2] risc=
v: Optimize memset
May 10 Andrew Jones    (  36)           =E2=94=82 =E2=94=8C=E2=94=80>
May 10 zhangfei        (  32)           =E2=94=9C=E2=94=80>Re: [PATCH] risc=
v: Optimize memset
May 10 zhangfei        ( 205)           =E2=94=9C=E2=94=80>[PATCH 1/2] RISC=
-V: lib: Improve memset assembler formatting
May 10 zhangfei        (  56)         =E2=94=8C=E2=94=80>[PATCH 0/2] riscv:=
 Optimize memset for data sizes less than 16 bytes
May 09 Andrew Jones    (  87)       =E2=94=8C=E2=94=80>Re: [PATCH] riscv: O=
ptimize memset
May 09 zhangfei        (  67)     =E2=94=8C=E2=94=80>Re: Re: [PATCH] riscv:=
 Optimize memset
May 09 Andrew Jones    ( 211)     =E2=94=9C=E2=94=80>Re: [PATCH 1/2] RISC-V=
: lib: Improve memset assembler formatting
May 09 zhangfei        (  57)     =E2=94=9C=E2=94=80>[PATCH 2/2] riscv: Opt=
imize memset
May 09 zhangfei        ( 204)   =E2=94=8C=E2=94=80>[PATCH 1/2] RISC-V: lib:=
 Improve memset assembler formatting
May 05 Andrew Jones    (  91) =E2=94=8C=E2=94=80>
May 05 =E5=BC=A0=E9=A3=9E            (  38) [PATCH] riscv: Optimize memset

How am I supposed to know what is what there?

Thanks,
Conor.

--cBXCyWD8ANQTX0/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFtENgAKCRB4tDGHoIJi
0hBMAP0d6q46/8kriiKrrTjdhs3AC87O5BVmNujgDAfo+Bj98AD/X80Lu5zP9oPj
C2xPcZjZNPJ2xwdBfBqAW1oPf4QJmAU=
=l3yW
-----END PGP SIGNATURE-----

--cBXCyWD8ANQTX0/G--


--===============5771563306535435861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5771563306535435861==--

