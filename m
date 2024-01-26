Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F2EC47DDF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxLxL0fYff0y4ADDTU5Gcl8oGYAVkvo06rmJEu90DiI=; b=iSgbdALtGsXgviU5oaDqi1TRQg
	uL6cPihkFj1PXs5eHNDZun1prvwVJAyZHTUUp8/62kToEK6S4rd/Yd+BnNbCd07fTFiBELqYEE3I7
	gFHp/rLO+YjbSJJSB0xsdxwhoAIgpBPbZ7GPO6pSHW4YjIUiPzWi4jlcV48v/ZO2/1w8lEKRTRpgg
	2Q9wfHPpxgzkfBKKYkjIySTKge3mU3B9hRqOE1iUbyznrmugW/OiwEo7GB52mTe3jVgiml9qoFBcH
	JyuPH/1u7PHNsfGwa/duq3lnIPpJUZNXu8UBKA01KUX3bs+9U2OHCfZKxhOfo/CVZkWWufjPCqrwJ
	7VVHDSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTK0g-00000003w6Q-3G2Y;
	Fri, 26 Jan 2024 11:04:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTK0d-00000003w5e-3dYY
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 11:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1706267071; x=1737803071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jx7CiBYDVCqrDkciTRY0aAvyzz7PnM5XKaphvWRKpig=;
  b=1HnkfwagxSx8PBA8TcIIfTsrdnirX7Z8usjK5xXx9lZVU+78ZrsM+i5Y
   JXEZGDc31Z7B4CFEmJMYQKq+T9i1+qNRVr90wwcvX4qheZMjIfdv4ojBV
   K1LcdOggUsVAaWUXJtCcwy86Kgl574XN6hXSyM5q7FMSFb2wFdTpCYSRd
   zOtn/xohyYl5x1qLtLjiqCYVhIMD8L96rlQLy0uOmLuERK8+jfS/+x2xy
   XCE/to3r5cStmbG7NUBjMGi5d9neUTTCey/4O1xcjnaclQZhKSx2rHqRg
   zn1OkWz0MdILBjREsnqy2/DPUqItRlxE+hCbYZ8TNTlyctVxki5uk3rGb
   Q==;
X-CSE-ConnectionGUID: 6eBUXNTyR7KfhA1fl2aXag==
X-CSE-MsgGUID: Ee6Wkf+rQaGF9yMlSWl0fw==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; 
   d="asc'?scan'208";a="182583881"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2024 04:04:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 04:04:01 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Jan 2024 04:03:59 -0700
Date: Fri, 26 Jan 2024 11:03:22 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Setup proper info for SOPHGO vendor support
Message-ID: <20240126-squabble-vitally-7dea14d09e18@wendy>
References: <IA1PR20MB49534A5DE79A6CEE57301737BB792@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49534A5DE79A6CEE57301737BB792@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_030432_180719_127476EA 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: multipart/mixed; boundary="===============2181421681083153441=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2181421681083153441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DY8XnBB7u1R3xie9"
Content-Disposition: inline

--DY8XnBB7u1R3xie9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 02:04:50PM +0800, Inochi Amaoto wrote:
> Add git tree that maintaines sophgo vendor code.
> Also replace Chao Wei with myself, since he does not have enough time.

Ideally Chao Wei can spare some time to ack the patch though?

>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  MAINTAINERS | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 39219b144c23..0dbf2882afbf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20446,12 +20446,13 @@ F:	drivers/char/sonypi.c
>  F:	drivers/platform/x86/sony-laptop.c
>  F:	include/linux/sony-laptop.h
>=20
> -SOPHGO DEVICETREES
> -M:	Chao Wei <chao.wei@sophgo.com>
> +SOPHGO DEVICETREES and DRIVERS
>  M:	Chen Wang <unicorn_wang@outlook.com>
> +M:	Inochi Amaoto <inochiama@outlook.com>
> +T:	git https://github.com/sophgo/linux.git
>  S:	Maintained
> -F:	arch/riscv/boot/dts/sophgo/
> -F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
> +N:	sophgo
> +K:	[^@]sophgo

There's a single instance of this "[^@] business in the whole file,
is it really needed?

Also, you can fold in

diff --git a/MAINTAINERS b/MAINTAINERS
index bf107c5343d3..cc8e240ba3e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18859,6 +18859,7 @@ F:	Documentation/devicetree/bindings/riscv/
 F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
+X:	arch/riscv/boot/dts/sophgo/
=20
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>


if you want. I get CC'ed on everything under the sun anyway from the DT
MAINTAINERS entry, so this at least might reduce some confusion about
who is applying what.

Cheers,
Conor.


--DY8XnBB7u1R3xie9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbORegAKCRB4tDGHoIJi
0o7lAQCfWgxp84MYKF22AxVE/ZMMz+9HojI/9GCvPUisSPxQAgEAr+M7AeqQ2hGX
zozyhua2Z0siLUnr9X9T5ExJ5cab+AA=
=8eIM
-----END PGP SIGNATURE-----

--DY8XnBB7u1R3xie9--


--===============2181421681083153441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2181421681083153441==--

