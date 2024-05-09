Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7EBC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rwo63WGvOQUa3K4fXYZslYewwK4O9l5NBBzho+nf8O4=; b=ukASIb/aXXW3Udx28l5VEqvvHn
	Dmaacn4BQZLcEBdx+BbVWzutdRLXgazUlqYKmYuZHTFy9sd0LJR50wiCbgBGzn4udJVgTxtgID25K
	m41vKW8JTi4QhEAFmFLRsZD9BQjCziUxhwTC2ihLOGbg9Eoye2jaM3gLa7Pw3lVM7AlUKzPMCoTN1
	8zKlaQk0DO7ThanowYXZG1vPhTnnM3TDIQro5GDn+LdA8OvW9CbVJcy5McjwSuy5ssTrvQp3GsYPP
	6BBs2RKjiCSJKgcPzzkyXkPAuX4A4b81+BfgmY5sc19Qk+3oApLCE+j92kqlVHW09oS3VDwHs7sBv
	JDt8sU/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yyD-00000000nxp-3Qqc;
	Thu, 09 May 2024 08:17:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4yy9-00000000nvx-26e1;
	Thu, 09 May 2024 08:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715242657; x=1746778657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lMaYXea0/pL6iEr0T3fEYaeD0BO/p+aXtvy3hTqRvxI=;
  b=kaV5bMScuN56QtRE7MSggUQJwSqmtoQ+TOchzWeg1PjkcQb3lIYoArfM
   ZSwmx8KBRT/tmNGCrOBuXsdk2klhLytOPbHuUqqkVM3wUSZWm7Lqvhra5
   Hg1u+5glRsUW6TRur0VKKe+u0WJT0L/nfKH4j1e4omW3rjoTMiEEoAhgo
   t60g/9PUemwPfgKA60FPdcwAGD6zFlgHgfhnbglEDMVopcWodSKIXrPBA
   LHt6NaC7BIdARAaIe3mOP1IuiLh7W52mZT6XGQ7ejB0na6jy1CKM7da47
   KxbD7bpcWbOMpbC/cnsornoVs0wRZBro5ncutuFDCUz3Wv0bnjNH79QFN
   w==;
X-CSE-ConnectionGUID: 0mKwrjsVTF+mfP6kb6VBzw==
X-CSE-MsgGUID: w51U2VCEQquHoJanXOK8gQ==
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="asc'?scan'208";a="26482894"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 May 2024 01:17:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 01:17:24 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 01:17:20 -0700
Date: Thu, 9 May 2024 09:17:09 +0100
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
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
Message-ID: <20240509-quickly-nibble-01cdb4e541ee@wendy>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_011737_575553_B1EC0419 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Type: multipart/mixed; boundary="===============8244116836280311513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8244116836280311513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftL9clxrsKa3hb4u"
Content-Disposition: inline

--ftL9clxrsKa3hb4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Charlie,

Just me being a pain again...

On Fri, May 03, 2024 at 11:18:18AM -0700, Charlie Jenkins wrote:
> @@ -671,6 +713,11 @@ void __init riscv_fill_hwcap(void)
>  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
>  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  		}
> +
> +		if (elf_hwcap & COMPAT_HWCAP_ISA_V && has_riscv_homogeneous_vlenb() < 0) {
> +			pr_warn("Unsupported heterogeneous vlen detected, vector extension disabled.\n");
> +			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> +		}
>  	}

After replying to Andy this morning about doing some dependency checking
for vector-reliant extensions I realised that we're actually doing this
check too late to be useful for that case.
Say for Zvkb we want to check if vector has been enabled before marking
the extension available, and without Clement's series that re-works the
riscv_isa_extension_check(), we need to ensure that vector support isn't
gonna get turned after we've already marked Zvkb as usable. If we could
move the riscv_has_homogeneous_vlenb() call before probing extensions we
could then examine the result in riscv_isa_extension_check() for V and
make sure it doesn't get enabled in the first place, rather than
clearing it after the fact.

There's a whole load of moving pieces between different series here at
the moment though, I wish some of it would land so that I could send
some cleanup patches for what I think is inconsistency on top :) I
wouldn't mind if this landed as-is, it's still an improvement and the
user I mention above doesn't actually exist yet.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ftL9clxrsKa3hb4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjyGhQAKCRB4tDGHoIJi
0u56AP95eBVgYwPh58UnZa0lZuyLzeDG6PlD0hXLsOA0eWnxUwEAqvt6X42WuHh8
3JcdzsXkKeCVaTmE3NYKMOyV9FDU3Q4=
=JxGW
-----END PGP SIGNATURE-----

--ftL9clxrsKa3hb4u--


--===============8244116836280311513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8244116836280311513==--

