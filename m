Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 10:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYRFdhlJo5kKYFh4SKfL5TVNoRiAcO2nPtQqJF+cZWw=; b=XwIK/bE9BGIFWA36D2YGn1DHSK
	APMq6J4VjFSgGHp0yS8EhaPy8YrAAV6SyClrDsqQIM8kUfuAUbj3XXNys+LgL+37Do6w218q4Ga6M
	dj4/JZdKfyT7yEaaXyoem1/hJX4RqN2hWz53nRSzAFdWo5lYtXRgeWBIYamWz+fPRlqU+4cl8RrQI
	Ph2+DsFZEcYMcj0aFGVJD3q/5yCLELrvdx4tT/9CtvjayizAvYMxp2mX9bGyDcQVhODiAQCVpvgiK
	VUH1+KsCqC7F5XHU8c5maZuIi0hjloUhQCNPuj3lx7H+CSln5KIIc9aSl2GhBetyEfqgTq2Y/6kgB
	bhW98QHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvE7R-0000000GeoO-3T5c;
	Fri, 12 Apr 2024 10:26:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvE7O-0000000GenH-2C7c;
	Fri, 12 Apr 2024 10:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712917610; x=1744453610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40Wqfd4r8w7pmze5vM3OJGtDYx+IFl6psH0Cqec/ypk=;
  b=lRQnW+lmw/ugcL+EeAwVlQ9h+O2E4vuk98PZxGapJqzeBWlPOyA5/BId
   YTzEh2G0HyCggmnxQpZ/K2BtKdEnnS//61XNZjLklIM+vShe/SyOQS116
   F7t9dMkYRRQVx6hbVWMrYr/RTOeZ8gHCUpXiREzSNig1z+2O1NESuaAg3
   csFV7HE9ZSqr2iEUibEnzEDJtvHrg9TaCArBJ1MHFV4vTdR/oAlBLwWIG
   yohc25n4oWEl0A3phVdxRSgiTEsUlBZcuSOWAO6omZ/BPiPkgjgdPa34n
   g4X8tZTosne0NBJ1eLjlF/9lQqG13dDSAiC3dJIIBpyE/DvkLNJOPxHJw
   A==;
X-CSE-ConnectionGUID: ZU7OXHjzTCmT3jYqw1Xv5g==
X-CSE-MsgGUID: x9xw3+4GQs2S7ff9t2+dXw==
X-IronPort-AV: E=Sophos;i="6.07,195,1708412400"; 
   d="asc'?scan'208";a="188003463"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 03:26:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 03:26:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 03:26:38 -0700
Date: Fri, 12 Apr 2024 11:25:47 +0100
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
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240412-tuesday-resident-d9d07e75463c@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_032650_680631_2F789990 
X-CRM114-Status: GOOD (  20.12  )
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
Content-Type: multipart/mixed; boundary="===============8462790042481929443=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8462790042481929443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9J4y1ZtcO1sNylrs"
Content-Disposition: inline

--9J4y1ZtcO1sNylrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 09:11:08PM -0700, Charlie Jenkins wrote:
> The riscv_cpuinfo struct that contains mvendorid and marchid is not
> populated until all harts are booted which happens after the DT parsing.
> Use the vendorid/archid values from the DT if available or assume all
> harts have the same values as the boot hart as a fallback.
>=20
> Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on =
older T-Head CPUs")

If this is our only use case for getting the mvendorid/marchid stuff
=66rom dt, then I don't think we should add it. None of the devicetrees
that the commit you're fixing here addresses will have these properties
and if they did have them, they'd then also be new enough to hopefully
not have "v" either - the issue is they're using whatever crap the
vendor shipped.
If we're gonna get the information from DT, we already have something
that we can look at to perform the disable as the cpu compatibles give
us enough information to make the decision.

I also think that we could just cache the boot CPU's marchid/mvendorid,
since we already have to look at it in riscv_fill_cpu_mfr_info(), avoid
repeating these ecalls on all systems.

Perhaps for now we could just look at the boot CPU alone? To my
knowledge the systems that this targets all have homogeneous
marchid/mvendorid values of 0x0.

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

> @@ -514,12 +521,23 @@ static void __init riscv_fill_hwcap_from_isa_string=
(unsigned long *isa2hwcap)
>  				pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>  				continue;
>  			}
> +			if (of_property_read_u64(node, "riscv,vendorid", &this_vendorid) < 0)=
 {
> +				pr_warn("Unable to find \"riscv,vendorid\" devicetree entry, using b=
oot hart mvendorid instead\n");

This should 100% not be a warning, it's not a required property in the
binding.

Cheers,
Conor.

> +				this_vendorid =3D boot_vendorid;
> +			}


--9J4y1ZtcO1sNylrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkMKwAKCRB4tDGHoIJi
0v68AQD669QXYYGZU4Sw+Wu1jBsENutdxevRVfy9dIk6oB75uwEAp3mGiS9zEGbC
gOmDF/36Lm2Mc4K4SgfZISRAD+65oAI=
=tAZ7
-----END PGP SIGNATURE-----

--9J4y1ZtcO1sNylrs--


--===============8462790042481929443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8462790042481929443==--

