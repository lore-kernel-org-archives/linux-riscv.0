Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD42C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 11:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETyhqUpYbcMdNhnCeiVwGWiGAAEL/ymm76jWZo3pXhQ=; b=T+UCbsQnETEnEKMEK1D42Ho5m/
	8oUr1+rdWoUJDSXnt/9k+IRalRCuCWRAWd5r3WosS2WkiTdTc1hePI1HxKxRnHUWJfCZ3Oprmk0CL
	yUBeJjKyl+v0iZKwfwVGa4mWLOswDgz/gaDstBsMVR3YU9UeYbBLNoI7KJ//e5+dNQ30EJR9KObCj
	a23H8UDttiVjjOVT/X3n9VnNdXBEsq1xmO42iV/fiYsBlPjge2QBuQHJwDssfqW1ydH6h80x+3QAI
	Zl4XItC2FWfXQ9AIVN2DK1sOx2jqk4W2bospDUOwYKrYozXVFCrf2GY1cUDF8qB0gCxC2knuGAwV2
	7C6R/OsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFGU-0000000GzS3-38cw;
	Fri, 12 Apr 2024 11:40:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvFGR-0000000GzOq-2mkK;
	Fri, 12 Apr 2024 11:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1712922015; x=1744458015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vWrwURI6uGqGzEOsz/9U6rKnDuH3RZniZsq0pIueHuI=;
  b=j4ereAJ/sRPOmj4wi0IamG/2RThWnUrbOD+vMkj7pr5NlJRa9y+R1gSi
   SvjP/XuJ7LCeWJ/JiVCK3pcuTGKV5+ZAKVzUg2ccke17bgQkYfn8OsIym
   zlTDRYr/OXY2q2cCaIgds1gb29MwoCNY8+OVvc2mPFM/urnZztA7hjOUq
   1w+bPzrWR6UODTw7yBBVODfHIR9+L5tEvVlON2jlWf/hZ6EDSEBA3YOUU
   QmkjQcJwfg6NruCGEIrFevNuhl8ZR8XrzVagOwbb8LEuUjQuEr1AFc25B
   gZNeMPy6uiR5tO/YsDIcrOc+7k3ZCj7OTC+EmWktfDoCUzOw8nhYxhFvl
   g==;
X-CSE-ConnectionGUID: i+DXDR/OTgiZjECvCk7SnA==
X-CSE-MsgGUID: LNJas4KrQx+JcZi4m5YrkA==
X-IronPort-AV: E=Sophos;i="6.07,196,1708412400"; 
   d="asc'?scan'208";a="21275385"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Apr 2024 04:40:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 04:40:10 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 12 Apr 2024 04:40:06 -0700
Date: Fri, 12 Apr 2024 12:39:15 +0100
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
Subject: Re: [PATCH 16/19] riscv: hwprobe: Add vendor extension probing
Message-ID: <20240412-candle-duffel-a612bab6e2a7@wendy>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-16-4af9815ec746@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-16-4af9815ec746@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_044015_759679_B080B15B 
X-CRM114-Status: GOOD (  17.28  )
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
Content-Type: multipart/mixed; boundary="===============7022954202397676234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7022954202397676234==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mRHPCw/Vg3OkuwNh"
Content-Disposition: inline

--mRHPCw/Vg3OkuwNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2024 at 09:11:22PM -0700, Charlie Jenkins wrote:

> +static void hwprobe_isa_vendor_ext0(struct riscv_hwprobe *pair,
> +				    const struct cpumask *cpus)
> +{
> +	int cpu;
> +	u64 missing = 0;
> +
> +	pair->value = 0;
> +
> +	struct riscv_hwprobe mvendorid = {
> +		.key = RISCV_HWPROBE_KEY_MVENDORID,
> +		.value = 0
> +	};
> +
> +	hwprobe_arch_id(&mvendorid, cpus);
> +
> +	/* Set value to zero if CPUs in the set do not have the same vendor. */
> +	if (mvendorid.value == -1ULL)
> +		return;
> +
> +	/*
> +	 * Loop through and record vendor extensions that 1) anyone has, and
> +	 * 2) anyone doesn't have.
> +	 */
> +	for_each_cpu(cpu, cpus) {
> +		struct riscv_isainfo *isavendorinfo = &hart_isa_vendor[cpu];
> +
> +#define VENDOR_EXT_KEY(ext)								\
> +	do {										\
> +		if (__riscv_isa_vendor_extension_available(isavendorinfo->isa,		\
> +							 RISCV_ISA_VENDOR_EXT_##ext))	\
> +			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +		else									\
> +			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +	} while (false)
> +
> +	/*
> +	 * Only use VENDOR_EXT_KEY() for extensions which can be exposed to userspace,
> +	 * regardless of the kernel's configuration, as no other checks, besides
> +	 * presence in the hart_vendor_isa bitmap, are made.
> +	 */
> +	VENDOR_EXT_KEY(XTHEADVECTOR);

Reading the comment here, I don't think you can do this. All vector
support in userspace is continent on kernel configuration options.

> +
> +#undef VENDOR_EXT_KEY
> +	}
> +
> +	/* Now turn off reporting features if any CPU is missing it. */
> +	pair->value &= ~missing;
> +}

--mRHPCw/Vg3OkuwNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhkdYwAKCRB4tDGHoIJi
0oeDAP4tnQJ0meOXf8oUmHOUiJb0NFMEHSi8MWLLKw5qh80wlwD/R11jlcsqR/Uh
O70O3h3uu21ywXzH0Akw/ETQIVC34As=
=Jjh4
-----END PGP SIGNATURE-----

--mRHPCw/Vg3OkuwNh--


--===============7022954202397676234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7022954202397676234==--

