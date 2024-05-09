Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F439C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 08:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwKAgynoQmH8mQfusintZdQx3oaDHKBCjo99wVoGk7w=; b=P0Uki4yLyYlO8uJ4k/SxNI5ZsC
	RwkE66vkU64utEUGsucbYuOg3K6yh5wA4dnTNXfkityUj8kXuxMZUFnfvpK2zml0pXAIG22zZP6rX
	BLTPBirvp/vhOjoBVvRQ/WtjAZWw3bvss7QoPQBBXJPHjZhYfn6RV8FqsF/t0iaMLK686i2Bo7e+1
	5y3228dfguG4lopdiBA0u2ScuFAM09odIUYMnD3mB3qr8aL3XI80E50PUK3F5a5LRw7ruThnUgsmO
	KDaD7LYAngsWYASPQlqNh01LGEnnNgJ/kt5X6hMOy+o/H0vmHGIRG374ZZomNdmSk3sG2mRhppZr8
	fLjid7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yzG-00000000oJN-1OIs;
	Thu, 09 May 2024 08:18:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yzD-00000000oIG-02OV;
	Thu, 09 May 2024 08:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715242723; x=1746778723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eYgKI50AT2puid8niw056MNT1xXDuMOWDzaLJ3XEMcg=;
  b=U6LaYUuoqYn38nZ//McOhMcYG88fma+bCZzIRyQ7y3rC8kGApo1ZvOzE
   CKRf3zNml+9cjP6eaMzsWj8LmP8A7wCHfWngaiZdF2X66X3N++IDSV93t
   dOGRmy5whjURUjjz6O/UfOJR+/my0CIcdYnYL12IDZl/U2PFxqWszxrzu
   bhamaqp1nOo8PSw1g4E9UZDC80lgAidckCFM42Y4JpuE0BlfNr5oX+3L/
   zc6Nq0yqaKBmALXrApUizw52CoImGcM+nvLL6FmhbsBwMDI4feH3i57cT
   C4Kx5ZK1siamUx4nTxN4nhmnShkcdBhYzlnJw5h5R7WXuU4bGZ68hxkQI
   w==;
X-CSE-ConnectionGUID: G4GzFAIbQe+QUvzKLznIEQ==
X-CSE-MsgGUID: LrAwBxhoTOuEmzUltNBDxA==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="asc'?scan'208";a="24290819"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 01:18:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 01:18:31 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 01:18:27 -0700
Date: Thu, 9 May 2024 09:18:16 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Evan Green
	<evan@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v6 05/17] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <20240509-creation-sanctuary-3fce99784eb0@wendy>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-5-cb7624e65d82@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_011843_080407_FA660898 
X-CRM114-Status: GOOD (  10.05  )
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
Content-Type: multipart/mixed; boundary="===============5070834894021053770=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5070834894021053770==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a8KQsPCKEipxU/bn"
Content-Disposition: inline

--a8KQsPCKEipxU/bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2024 at 11:18:20AM -0700, Charlie Jenkins wrote:
> Separate vendor extensions out into one struct per vendor
> instead of adding vendor extensions onto riscv_isa_ext.
>=20
> Add a hidden config RISCV_ISA_VENDOR_EXT to conditionally include this
> code.
>=20
> The xtheadvector vendor extension is added using these changes.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

I thought that I had reviewed this the other day,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--a8KQsPCKEipxU/bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjyGyAAKCRB4tDGHoIJi
0mhxAP9qdCcZ8ossQnBRj6IxsLBS9ND1SyiR7l8fPbeYE+uedAD/QXKDPBmr4WYf
L33Wau015J9JR8PRw7FtXts7dwrKOg8=
=xTfT
-----END PGP SIGNATURE-----

--a8KQsPCKEipxU/bn--


--===============5070834894021053770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5070834894021053770==--

