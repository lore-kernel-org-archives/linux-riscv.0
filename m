Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D78C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/yfkcXfMxwKDT/TRmnTzLa0mH5Z+dflp1kXCRgzqcE=; b=iEtv1u9mfWIRSooTs9upbJCYKe
	vwaWU+sihi8sogKWPQEBQ7D/KkDMddMPgRCu/CQq5srfhfYMXMAOgXropK+a97iIJp7C99QL0H2jv
	AHFAWZwN6WajuKaiinlCjZsnyX1+7QPDLc7fD3ZxEItOBYiBXZIJYZCmK5Cbx10Aix49ciqliSoCM
	U9WRVFJHOBy73AwoCWdln8k2BPLRpXLZrzPgznzPJDvWwQfLw2ldKuU3aR067KaS5dwPMjWtCFJmL
	nEntEExUI/xGzZoXqZna+38sWbrHy3yjj3VkI92is6wVrcm7e5u7h0VoCetF6OQvfdmqRFI+ddrE1
	ar2H5SCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHiH-0025Bf-1Q;
	Fri, 28 Jul 2023 07:16:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPHiE-0025AO-0F
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 07:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690528594; x=1722064594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3eh8JVhG0BhAwkcoX2/P9LJ94Oz2UTVlcrpf201yuk=;
  b=L1tue5gydTSwWQwziLLyO3J26bVlwQKEYbKukU14TXPlS+LWcY5P+aVK
   nN2Csaxj4SLSgO5TUp5up22KdqlrxRTO6UAP2qQFl8MoaLN8T2hizYmtm
   BfyWiDv5k/q0wmbY1jFFfUP5YwFMnFUosNykKX+jZNbDVYuf1UEpbTlQm
   C6hGIf/c2iWFwfJOGOoD/1cVdNyeJmyslMofao0sBxz8ozOpiMny0nRyQ
   N11zArp5YWzg6zd8s7GGdwvk1lcwNAbJmAvBtkOC/ElR04TItA/g3Tnos
   aJo7SUHS/yoCgN90pw5n39SZqv1E/lNlH/zm9oiTRfEoATqXU8e3sJFTl
   A==;
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="asc'?scan'208";a="163690791"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 00:16:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 00:16:22 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Jul 2023 00:16:19 -0700
Date: Fri, 28 Jul 2023 08:15:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Eric Lin <eric.lin@sifive.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zong.li@sifive.com>, <greentime.hu@sifive.com>, <vincent.chen@sifive.com>,
	Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH v2 2/3] soc: sifive: Add SiFive private L2 cache driver
Message-ID: <20230728-nintendo-umpire-3ca2388fa826@wendy>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-3-eric.lin@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230720135125.21240-3-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_001634_180605_19ADB80D 
X-CRM114-Status: GOOD (  23.10  )
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
Content-Type: multipart/mixed; boundary="===============8061696295208811136=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8061696295208811136==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tDKcUoKE7397b15h"
Content-Disposition: inline

--tDKcUoKE7397b15h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Jul 20, 2023 at 09:51:20PM +0800, Eric Lin wrote:
> This adds SiFive private L2 cache driver which will show
> cache config information when booting and add cpu hotplug
> callback functions.
>=20
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Co-developed-by: Nick Hu <nick.hu@sifive.com>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>

> +static void pl2_config_read(void __iomem *pl2_base, int cpu)

This function's prefix does not match the rest of the driver.

> +{
> +	u32 cfg, banks, ways, cacheline, sets;
> +
> +	cfg =3D readl(pl2_base + SIFIVE_PL2CACHE_CONFIG);
> +	banks =3D FIELD_GET(SIFIVE_PL2CACHE_CONFIG_BANK_MASK, cfg);
> +	ways =3D FIELD_GET(SIFIVE_PL2CACHE_CONFIG_WAYS_MASK, cfg);
> +	cacheline =3D FIELD_GET(SIFIVE_PL2CACHE_CONFIG_BLKS_MASK, cfg);
> +	sets =3D FIELD_GET(SIFIVE_PL2CACHE_CONFIG_SETS_MASK, cfg);
> +	pr_info("%u banks, ways/bank=3D%u, bytes/block=3D%llu, sets:%llu, size:=
%d for CPU:%d\n",
> +		banks, ways, BIT_ULL(cacheline), BIT_ULL(sets), ways << (sets + cachel=
ine), cpu);
> +}

My OCD quite dislikes how the formatting here is not consistent.
"%u banks"
"ways/bank=3D%u"
"sets:%llu"

Could you please do me a favour and pick just one style here?

> +
> +static int sifive_pl2_cache_dev_probe(struct platform_device *pdev)
> +{
> +	struct device_node *cpu_node, *pl2_node;
> +	struct sifive_pl2_state *pl2_state =3D NULL;
> +	struct resource *res;
> +	void __iomem *pl2_base;
> +	int cpu;
> +
> +	/* Traverse all cpu nodes to find the one mapping to its pl2 node. */

While comments like this are somewhat useful...

> +	for_each_cpu(cpu, cpu_possible_mask) {
> +		cpu_node =3D of_cpu_device_node_get(cpu);
> +		pl2_node =3D of_parse_phandle(cpu_node, "next-level-cache", 0);
> +
> +		/* Found it! */
> +		if (dev_of_node(&pdev->dev) =3D=3D pl2_node) {
> +			/* Use cpu to get its percpu data sifive_pl2_state. */
> +			pl2_state =3D per_cpu_ptr(&sifive_pl2_state, cpu);
> +			break;
> +		}
> +	}
> +
> +	if (!pl2_state) {
> +		pr_err("Failed to find CPU node for %s.\n", pdev->name);
> +		return -EINVAL;
> +	}
> +
> +	/* Set base address of select and counter registers. */

=2E..something like this just restates what this function always does.
It's the same in some other places, with things like:
	/* save the state */
	save_state();
Could you drop the ones that restate the obvious please?

> +	pl2_base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(pl2_base))
> +		return PTR_ERR(pl2_base);
> +
> +	/* Print pL2 configs. */
> +	pl2_config_read(pl2_base, cpu);
> +	pl2_state->pl2_base =3D pl2_base;
> +
> +	return 0;
> +}
> +
> +static struct platform_driver sifive_pl2_cache_driver =3D {
> +	.driver =3D {
> +		   .name =3D "SiFive-pL2-cache",
> +		   .of_match_table =3D sifive_pl2_cache_of_ids,
> +		   },
> +	.probe =3D sifive_pl2_cache_dev_probe,
> +};
> +
> +static int __init sifive_pl2_cache_init(void)

Why is the split between initcall and normal probe function required?
Does the hotplug stuff require that?

> +{
> +	int ret;
> +
> +	ret =3D cpuhp_setup_state(CPUHP_AP_RISCV_SIFIVE_PL2_ONLINE,
> +				"soc/sifive/pl2:online",
> +				sifive_pl2_online_cpu,
> +				sifive_pl2_offline_cpu);
> +	if (ret < 0) {
> +		pr_err("Failed to register CPU hotplug notifier %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D platform_driver_register(&sifive_pl2_cache_driver);
> +	if (ret) {
> +		pr_err("Failed to register sifive_pl2_cache_driver: %d\n", ret);
> +		cpuhp_remove_state(CPUHP_AP_RISCV_SIFIVE_PL2_ONLINE);
> +		return ret;
> +	}
> +
> +	sifive_pl2_pm_init();
> +
> +	return 0;
> +}

Cheers,
Conor.

--tDKcUoKE7397b15h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMNrIAAKCRB4tDGHoIJi
0lUMAQC+YBZKyezcpOdepBSTcDE8d/8KKQhLZWlOf3Dxgmpf3wD9G00D01RwYreP
xr5jQCN1+kjS9dv4O3bCi+fMO5E/qAU=
=/HJJ
-----END PGP SIGNATURE-----

--tDKcUoKE7397b15h--


--===============8061696295208811136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8061696295208811136==--

