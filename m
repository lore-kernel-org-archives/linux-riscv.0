Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461ECC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+/uWxeqT8Wio+nfv3eBnpduUt8znec8Ou+yHLwDxaQ=; b=xR6uYBTVCI5/7x
	GcTQ1/vkIWyKFc+v5227he7+XWlppNXrot+Ngc8PyyfHhpdEmFwh40x4ucZZKfyL1mkDZOKa+0icc
	H/8A3UNxwv4mvIbQAygkmS1cJ8DjAFmleTwBpbufihTI9a+Y3G+rrmitYt6i4IAa4bnlpsYhiq7tq
	w1XHGE3fPppDc6gtxp7/6Qn1isvVcEm2BTUG2twDSmodzdtgP6igPtevRLs1Q9NsvGmyI7TEdIuto
	MmhERYe15BVo/AK8gqTo2lAXffLeAP4iqxQSHNrUj268QYl4B2vNl0Txc3u0Z5Nm0azs9l9d4/DPh
	P/ihDOovynwg2EB9wL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdfSm-00000001vAS-2Yby;
	Tue, 13 Aug 2024 00:32:36 +0000
Received: from mail-bn7nam10olkn20802.outbound.protection.outlook.com ([2a01:111:f403:2804::802] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdfSj-00000001v8a-2RHp
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 00:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT0xJwmYZVWqoml+k47c/ZL+HSAqSw6yjnbQ6wZsPPzhgrZQucQLKeJejLsMJ3Ho/F0IDWbcLFo4r31dJv4g9LukYS4tDM6QwZrVXDI6wvO0MRuYhArTR/vxLAiCyN4SSOy8jVIQRiTaRuKzjLYvJvOAJK8TNaY1suD4wQ81KW6V4HmilIgfs7XkDVKLmr7GrXASvhoeni6Hijnzg4X9UeIkMusfrGY/vB0gd9qEs1fgK+2Mfjm80TfVDcyfkAmV15eO++eHxtY54rzFudlVdkDsqTlRgSSAELOTTipv+CY7qkCIe1Dxg420mZTxCkrg17RqXCiqjkmW5g6Urn/JZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRrJHRc4cr38ERWLEIaK8xT+SdgwqdZ3j5yCrqZ32tg=;
 b=NXJ1tZ05bdkLbwRAt+74XzMiqlGHeQ4Ots2bb9UVd+8rNee/L1HASP+NHAB4n5V0AwuwjCO5hLyKlrin+i+NwqLq6dPMm9FEqFAB7d6DMITht01uv2ii5owJ9b2GW4r5/GRxYVjkk73DiJI28Jr/ndeNTrxBpx88KqazBvihCgec2Cbud7lqLdNVmhVtjd5cXX9b6pqTwS8+jJuknhZqWoHwyVn+gru3Lpp4GMupLNiNWe6Fz+nlLaaayjUoor50IxBeDaSlz4RGMqSTrRnR3uTnu40UeIZyBo1kagjdYGU9ujmxDfJTnWa1Hewfn0KI8jR5WqH+BvfVuJ+/h8zJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRrJHRc4cr38ERWLEIaK8xT+SdgwqdZ3j5yCrqZ32tg=;
 b=IG0YjfxwH7ck4rKpsOwUK5LVG8JBxlcC2rizuzowG47NZe5rpFwoGUkQyhyU8zR8Cx+xhom0CGqYsoM8z8ZFAPJMzAWReGtiCNWlPFman1p872cb361lJeOB4O4/WROrpN9pJCjKwY6uYGOvWTQ1YMAjp2RKxNEbu3kqPr78yGM6GJ1my78E6GXc54YXzWXtTfxSd4OAluKPbfc1ntybyRFQM28/dg6M09jPOtG9FT6+n1Ep2JrqksmIqoDuYdKlGJamasAyBWMboKbs4FveA4UgWyXP+bd3tb+vzUMppZy+pF9KSLPUvddRklrlFxaR+DMJ5bKs94Moqs1Dos575w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ1PR20MB4691.namprd20.prod.outlook.com (2603:10b6:a03:48a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 00:32:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 00:32:18 +0000
Date: Tue, 13 Aug 2024 08:31:34 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
Message-ID: <IA1PR20MB495361E9FD0CBAB62BF44BC1BB862@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495324F3EF7517562CB4CACFBB842@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49533EAD95963C2E99D27B88BB842@IA1PR20MB4953.namprd20.prod.outlook.com>
 <6246542f-6059-4bf8-91f7-6de713707711@wanadoo.fr>
Content-Disposition: inline
In-Reply-To: <6246542f-6059-4bf8-91f7-6de713707711@wanadoo.fr>
X-TMN: [I52vzO5s5S1zD2x4Rbs+6/wgd2D290BJHERW6YIL75Q=]
X-ClientProxiedBy: PS2PR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:300:55::30) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <vzd4naxexr7jnfrndtr2luy75wucaarowysyter6mivetmg2ux@4h6uydngop2x>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ1PR20MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bd5944-b1e9-4644-baef-08dcbb2f62e4
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|15080799003|19110799003|8060799006|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: P7s6MpVkZ6Uzwme+VW6k+bkIrPbki0aK3DjWg1AFJVImQ8siLwet/twwpBNFZz88/fLXTdXp1IhbXZ4JcPlsV7wewkeBFNh4LpQiDYoU5TVfqyxGQ47hE5gjkDEArb1ws07tS9x+XqC55irfJcvOLVg6L5njUVt39yqAsSHb99hEyIAwTj6QFliCMDiLuJBB1BTIf1tpDyieBOWblFllTHwbVCoFWsC86fPEzwsaorOd5Bk1/+LxtL61hUbyV2+7RMQ4lmAMAxuC/ib9sjtKFVyIs7utbnguNy0X6qbebwLO465AycTDrZ8dC5wh1otpC0+EJAt0bxo63c1bRGri/q5p0BY1X4bAo1O/WrksJexztwkrvMP4ZzQUiWzuCpIcumcnPnR72UTbwtFG57RQwxuUBSVWOFZwucWS87nNTLZ5pYKlN9uF4TIaP0MDpjxhKkiySIcgmI/hgcfGAIuOsSAS1O62UnXAZZVXPF8J1igVQvJZ56MP7rx9+oyvGjMoNIJv5KAsz3NQRLmNPPtt+j4HSsQ+hTVgh50ETakx2p5lCXxcSuRkQP85Pwzyh5QxEUusuBXHx61vdWEFfu4wTq1ScUKTwIVN/evz+scWDdYq1y97X/nvUM0xmlg+KLfP3KwW7KNqDq55b67i8SM6axUHBQCz5arAcwRb1AbcID4bUkuoOwWMvUKBfAeXymIVWZO6iareSd+2h57m3/uJOvf22r7rOy5okSBMy7o/F5CTRfS8sJNzUEIGkHEQLTk0pKd0McQD7ftiapIYkkNyRxtYYEK2bG+UzlDu+u6BZexet/YNaH4K94lHF2a/9hVHwrEPc0IJyBhpNHa+KlnX4g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BI7blqtEwaLhOfnmt/seyWQ3B0XwOIn/rsqfRGvncKigWoeny67nrnDVGm?=
 =?iso-8859-1?Q?NWcOWig0V3Rm1nUMkfIDTtOPp6BDF7+aikdb7qIxeRtunQH1Hzn5pFMr2o?=
 =?iso-8859-1?Q?7moIhtkUXQ/zw0uLqFIxO7GPPUvSsXkl5YZ0yzcjNoEDSq5prxgFR7KZCD?=
 =?iso-8859-1?Q?eA/oKE5Sy8COSKrk9Czrc5jOGWeezDRRmH91qRGD2Tzbkrr1huIJ/yOGu/?=
 =?iso-8859-1?Q?Q90JyISi0BjB5kQpEg2mj0UXljMEKgITSpLDJe8NJD/2ziwQlpjj6Lr8KR?=
 =?iso-8859-1?Q?KTjpdlm+9KRLRAkdgYngQadyXD+nBbLZJFjYPtuB6+TiYxE+ZrchzXyMKg?=
 =?iso-8859-1?Q?06wHQ1XSY+Z4NtixhwodL1ZBPdVsyLbe0B9N9Lg0YQ/cW36WkBsbgnoyzR?=
 =?iso-8859-1?Q?zAqkWksoy9d1qhdlPS5Ok7UUOziPoLjrN0xUdjY4n6I4fIzZQUf7Shlw69?=
 =?iso-8859-1?Q?EaH+9XRJ/RSxSm26WlnZwWRKjIfmjSVo/akgqTJ4aZWjNmah5r7ZFE5ZzH?=
 =?iso-8859-1?Q?+SS0HMM23sx58wec3AahfTWQQVkPvBb3lsox/1hAULnY4FE+rU3uD4FWis?=
 =?iso-8859-1?Q?K8QC01dj/qEU2eK3UfvApYaXmi6Xo1wAoCZ2Xyx1Q8c3/UKHulsr9dQk11?=
 =?iso-8859-1?Q?jdVR7iCXhXdzWi3FpRZqSu2RHtVZle9orhuxG8iAzlQSKN56xG74/53r0O?=
 =?iso-8859-1?Q?7CgP7F8Vf9gRPKwZPnIsRANaAloM1SWlx7SM1twGaKkZ573vSOJmr1dZhb?=
 =?iso-8859-1?Q?+RAhVFoyE519maU6IPR52ABQF8i5LHJC1CmrAC6CyGezEWQGLbaGKxEcjd?=
 =?iso-8859-1?Q?AjUABGy99prwQIYRpUP1ihVfWxci/hCJac8QuU79UDOoQtqUc7+IoPYsvG?=
 =?iso-8859-1?Q?JvLIm/NI7jrkhQXItBVX3k9RkG72x/Yi+8PsyzzrWAjdXoGQw97ljU0Ozv?=
 =?iso-8859-1?Q?9nk4/LrXDWfEFuCR60TTAvengVNI2SgbSn3XNhABmVS1R4Wk/hchX92tLu?=
 =?iso-8859-1?Q?7aNUbhXBNAqP6GPG8gk0TV10Y4VYvOv+H+05zBd/ZrF06sOHeFzhYVRoJF?=
 =?iso-8859-1?Q?fxZ4QSI8HnY5pRWppSMnfsbq2REHhtBWPlEUwlVjZg5iS43Cf6FWYtSRnC?=
 =?iso-8859-1?Q?uIK6LBKTApyu6H0+KPTNfUBqlInAysaiSyk8t3IvcqkrBraVFGnllcfuPK?=
 =?iso-8859-1?Q?U4EfnEM1Br9vUP+ZrG5pR2c7r7AQd3EHkPXKUKg9Dmjg1OOTB0wJmZB9Q7?=
 =?iso-8859-1?Q?9Ll9r3+MVCMtkcu5tJd5oeD4cZwfsTglp4Sf6Psom9Y6zQizqLQp7ymOFn?=
 =?iso-8859-1?Q?zCu6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bd5944-b1e9-4644-baef-08dcbb2f62e4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 00:32:17.9713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR20MB4691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_173233_651694_25EFA5F0 
X-CRM114-Status: GOOD (  26.35  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 11, 2024 at 08:00:05AM GMT, Christophe JAILLET wrote:
> Le 11/08/2024 =E0 07:16, Inochi Amaoto a =E9crit=A0:
> > Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
> > its request lines. The multiplexer supports at most 8 request lines.
> > =

> > Add driver for Sophgo CV18XX/SG200X DMA multiplexer.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > ---
> =

> Hi,
> =

> ...
> =

> > +static void *cv1800_dmamux_route_allocate(struct of_phandle_args *dma_=
spec,
> > +					  struct of_dma *ofdma)
> > +{
> > +	struct platform_device *pdev =3D of_find_device_by_node(ofdma->of_nod=
e);
> > +	struct cv1800_dmamux_data *dmamux =3D platform_get_drvdata(pdev);
> > +	struct cv1800_dmamux_map *map;
> > +	struct llist_node *node;
> > +	unsigned long flags;
> > +	unsigned int chid, devid, cpuid;
> > +	int ret;
> > +
> > +	if (dma_spec->args_count !=3D DMAMUX_NCELLS) {
> > +		dev_err(&pdev->dev, "invalid number of dma mux args\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	devid =3D dma_spec->args[0];
> > +	cpuid =3D dma_spec->args[1];
> > +	dma_spec->args_count =3D 1;
> > +
> > +	if (devid > MAX_DMA_MAPPING_ID) {
> > +		dev_err(&pdev->dev, "invalid device id: %u\n", devid);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	if (cpuid > MAX_DMA_CPU_ID) {
> > +		dev_err(&pdev->dev, "invalid cpu id: %u\n", cpuid);
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	dma_spec->np =3D of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> > +	if (!dma_spec->np) {
> > +		dev_err(&pdev->dev, "can't get dma master\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	spin_lock_irqsave(&dmamux->lock, flags);
> > +
> > +	if (test_bit(devid, dmamux->mapped_peripherals)) {
> > +		llist_for_each_entry(map, dmamux->reserve_maps.first, node) {
> > +			if (map->peripheral =3D=3D devid && map->cpu =3D=3D cpuid)
> > +				goto found;
> > +		}
> > +
> > +		ret =3D -EINVAL;
> > +		goto failed;
> > +	} else {
> > +		node =3D llist_del_first(&dmamux->free_maps);
> > +		if (!node) {
> > +			ret =3D -ENODEV;
> > +			goto failed;
> > +		}
> > +
> > +		map =3D llist_entry(node, struct cv1800_dmamux_map, node);
> > +		llist_add(&map->node, &dmamux->reserve_maps);
> > +		set_bit(devid, dmamux->mapped_peripherals);
> > +	}
> > +
> > +found:
> > +	chid =3D map->channel;
> > +	map->peripheral =3D devid;
> > +	map->cpu =3D cpuid;
> > +
> > +	regmap_set_bits(dmamux->regmap,
> > +			DMAMUX_CH_REG(chid),
> > +			DMAMUX_CH_SET(chid, devid));
> > +
> > +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
> > +			   DMAMUX_INT_CH_MASK(chid, cpuid),
> > +			   DMAMUX_INT_CH_BIT(chid, cpuid));
> > +
> > +	spin_unlock_irqrestore(&dmamux->lock, flags);
> > +
> > +	dma_spec->args[0] =3D chid;
> > +
> > +	dev_dbg(&pdev->dev, "register channel %u for req %u (cpu %u)\n",
> > +		chid, devid, cpuid);
> > +
> > +	return map;
> > +
> > +failed:
> > +	spin_unlock_irqrestore(&dmamux->lock, flags);
> > +	of_node_put(dma_spec->np);
> > +	dev_err(&pdev->dev, "errno %d\n", ret);
> > +	return ERR_PTR(ret);
> > +
> =

> Nitpick: Unneeded empty new line.
> =

> > +}
> > +
> > +static int cv1800_dmamux_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *mux_node =3D dev->of_node;
> > +	struct cv1800_dmamux_data *data;
> > +	struct cv1800_dmamux_map *tmp;
> > +	struct device *parent =3D dev->parent;
> > +	struct regmap *regmap =3D NULL;
> > +	unsigned int i;
> > +
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	regmap =3D device_node_to_regmap(parent->of_node);
> > +	if (IS_ERR(regmap))
> > +		return PTR_ERR(regmap);
> > +
> > +	data =3D devm_kmalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	spin_lock_init(&data->lock);
> > +	init_llist_head(&data->free_maps);
> =

> Why init free_maps and not reserve_maps?
> 'data' is not zeroed, so it should be needed, IMHO.
> =

> Same for mapped_peripherals. It is not initialized.
> =

> I think that using devm_kzalloc() above is needed. (and
> init_llist_head(&data->free_maps) could then be removed, if you want)
> =

> Just my 2c.
> =


Thanks, I missed these two field. Although I got no error
when testing, it is necessary to fix this.

I think devm_kzalloc can only zero "mapped_peripherals".
It will be good to add missing init_llist_head for =

"reserve_maps".

Regards,
Inochi

> > +
> > +	for (i =3D 0; i <=3D MAX_DMA_CH_ID; i++) {
> > +		tmp =3D devm_kmalloc(dev, sizeof(*tmp), GFP_KERNEL);
> > +		if (!tmp) {
> > +			/* It is OK for not allocating all channel */
> > +			dev_warn(dev, "can not allocate channel %u\n", i);
> > +			continue;
> > +		}
> > +
> > +		init_llist_node(&tmp->node);
> > +		tmp->channel =3D i;
> > +		llist_add(&tmp->node, &data->free_maps);
> > +	}
> > +
> > +	/* if no channel is allocated, the probe must fail */
> > +	if (llist_empty(&data->free_maps))
> > +		return -ENOMEM;
> > +
> > +	data->regmap =3D regmap;
> > +	data->dmarouter.dev =3D dev;
> > +	data->dmarouter.route_free =3D cv1800_dmamux_free;
> > +
> > +	platform_set_drvdata(pdev, data);
> > +
> > +	return of_dma_router_register(mux_node,
> > +				      cv1800_dmamux_route_allocate,
> > +				      &data->dmarouter);
> > +}
> =

> ...
> =

> CJ
> =

> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
