Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69442C77B62
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcLkj+ot5K3k2USWGb13saT/6iUnOnBpVFTPX+snVGI=; b=E6pbyb+TVpz478zGLH0v9ZXzvo
	R9D649XZesUrD4xY/fleAW+Y7lpBpQHhzfDPPal++mOUO3ySwTS8iutcRSa8MHkZZea6JaG49MlC3
	GooKs+46c/i6VKpPZyP6dZOlXy37pJiLOLDPD8k8doDCdXTuO+B7AOha4GJg9QGq4yFgRmhlZBF7s
	B/3m3zpU/KfMucWJSh2xIqlViw1qfzAaLtYjvLRsG5VByeze4Vr7Y+QeoDUuLZQ8VNMmNZXBdmRi8
	lutegtBVHJKbaODAjrOmPlADLN83Ng3mq/gPGKk814BKUV1XogmkPofCD3AP+wUM43MXdnJzp3yoF
	eJL3EA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piE8c-007NoP-07;
	Fri, 31 Mar 2023 12:45:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piE8Y-007Nn8-1q
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 12:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680266747; x=1711802747;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XSJ9xYx7OKiDUOZcxx839tz93MC5ZSo3mvtiQkoZYKA=;
  b=apPXsXgOBVZMM8Jmpf+q/nzqbBP3gwMIx9dKKO5zuE7FF+LeOcDnpupP
   C6d7I+sCMppP0eK+OJfcp1vbVjmbNdckTE3k6C3tD0erRKa/v2EdJFcWB
   ZXzSCfP2C/0EExQ4PxCmeiWGMs35I4x+TTgpPcXIAjzN/aHp1A0XrBi+C
   CR9b+W/Ns13Jm/FmuzP9SsXnhqQJBpzvm23BdofdHLAGNuRLdJYAGJXtQ
   QYA4m7J02TPVQfRm6ByI2is8cgHsy4/tRhfj33MxsuZZouU6jAMz9cuYF
   MA3yqEL0yxvS24w4LtkDIixvDYSoJ2EY/SwXWiR4d1wiB5QcdEHL6qL7A
   g==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="asc'?scan'208";a="207589991"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 05:45:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 05:45:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 05:45:41 -0700
Date: Fri, 31 Mar 2023 13:45:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
	<guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>,
	<linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
Message-ID: <5468019d-e688-4019-882f-6f9611443408@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230330204217.47666-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054546_645666_29BD3083 
X-CRM114-Status: GOOD (  18.65  )
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
Content-Type: multipart/mixed; boundary="===============6315287014457239587=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6315287014457239587==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ujmC02K2mc/43jGi"
Content-Disposition: inline

--ujmC02K2mc/43jGi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 09:42:16PM +0100, Prabhakar wrote:

> +STANDALONE CACHE CONTROLLER DRIVERS

> +F:	include/cache

This can go since the file no longer exists.

> +config AX45MP_L2_CACHE
> +	bool "Andes Technology AX45MP L2 Cache controller"
> +	depends on RISCV && RISCV_DMA_NONCOHERENT

This can just be depends on RISCV_DMA_NONCOHERENT, since that's only
defined on RISC-V.

> +static void ax45mp_get_l2_line_size(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "cache-line-size", &ax45mp_priv->ax45mp_cache_line_size);
> +	if (ret) {
> +		dev_err(dev, "Failed to get cache-line-size, defaulting to 64 bytes\n");
> +		ax45mp_priv->ax45mp_cache_line_size = AX45MP_CACHE_LINE_SIZE;
> +	}
> +
> +	if (ax45mp_priv->ax45mp_cache_line_size != AX45MP_CACHE_LINE_SIZE) {
> +		dev_err(dev, "Expected cache-line-size to be 64 bytes (found:%u). Defaulting to 64 bytes\n",
> +			ax45mp_priv->ax45mp_cache_line_size);
> +		ax45mp_priv->ax45mp_cache_line_size = AX45MP_CACHE_LINE_SIZE;
> +	}

I forget, why are we doing this defaulting rather than falling over
immediately if we detect the property is missing or wrong?

> +}

> +static const struct riscv_cache_ops ax45mp_cmo_ops = {
> +	.clean_range = &ax45mp_cpu_dma_wb_range,
> +	.inv_range = &ax45mp_cpu_dma_inval_range,
> +	.flush_range = &ax45mp_cpu_dma_flush_range,
> +};

I think it would be nice if your driver functions matched the names used
by the ops. (and as I said on the other patch, I think the ops should
match the cross-arch naming.

Otherwise, looks grand - although I think I was mostly happy with the
last revision too.a

Cheers,
Conor.

--ujmC02K2mc/43jGi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCbV5wAKCRB4tDGHoIJi
0jXXAP0Wzcz5s99w4wfN/xL5lC591ZxAOt8+z4NTdIBaxn4mzQD+PLdKyy6NKLib
xz7hD43NmKAe5yK/zmiimoEH/rNnTA4=
=25N2
-----END PGP SIGNATURE-----

--ujmC02K2mc/43jGi--


--===============6315287014457239587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6315287014457239587==--

