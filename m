Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0699BCD11DD
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuvgemPGdOmK0mVis4Q018nAko+sMMP3EoDIkPKK9Gk=; b=WZNwwaOIqduohK
	5ani31hDc8z2ay1/bwkVpeS7Ow4/I1V2fGEmYvXglqgdz+Z5zZT43CZhYdDfOjVcHxxexqSEed1TH
	pStlasqqPMuNWEMySABembiCxup2qz3PtXcU7QnYUkUMCQkIdPOdgZ9l9BA5XZe3yeHga6GMmAJ+2
	EMBz1JWZUfgNqujMa5L3GCRl6IV+rM/BHLdo+prC99tm++mwvIBo/bZ/SM3iPeVoCB+fuWfTZsLiS
	nbFyK6xwoZibvaOW72sQAACaeW9fIBrevGdliRk/nYcdTCe0PP70div4bP2Zi2fNQht+vAY3kxUyD
	WsgIjGcFqI9xTZNgpahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp5Bv-00000004IcP-2epL;
	Tue, 26 Mar 2024 11:42:07 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp5Br-00000004IaT-3VRj
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 11:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ae0rhaxwFcXuexa6cFi74EqBYXBoQbGTBFQSUWT6JrcPaOS05Nie3UjbcsANYNmOwBj/nv36DSod86mY2U5EzdM7FqvOqI5oda8erbZQ/cArUVcTReHGibMHgQQn04KWgwnXACprRSrjpPlXVzI++ZuQj0WXHpENySP6lWIxvw+W+vkmPeOdvD3hGer2MrgNVpwmi0I0HhztGw2VAs/DqlJEEK9mAjYHh+EOpgtI7zQps2dqDoUuRK1YPKHyTREJ6KF37W4EU5bCL2j00uvXwXfc34o/wKWebbJD6V0Ffs//tMi1I3PSm05rU3U9WjX02kDL5ypY2IYc3IKhMYJdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb+JKACMtAftW1EicdnVyc/h2Wr8axQzFvhefS8qFPM=;
 b=TH+ifTW7X1qRIqYUMhpYgiuk31XShF6FerdS1kn0rOVJodDOO6Vp4ctujVS+4zlLG/OcfwThh8w/pkHmgbwQ4ajbMG1xoWCg48aDk6CYMQpKi+gfBN3S48PwhYPMbgPP+vWXC1vAQh2wfyXXwooRRtyiPbeVKKYmqNanX+/bZxX9/30rkxkOU/NuLfouj4gTPvEgo/2bvnediSo0CpuePp2rtTyxvytc1vXehVjX06nExGtrztlkkBO51bHNW6UpUV1jUgm0HH+5BGQensUduVLROYKYJAo02wgdjmWKsZ2BmollAUr2vpo/vHPWYBadXgpc5u8dMYfDpw2pnTlQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vb+JKACMtAftW1EicdnVyc/h2Wr8axQzFvhefS8qFPM=;
 b=MVKKT5M3MZ9BTiHSs64KQLi6qFeeNzgzji/8qM+W0Hg0/R6l2c2h74CgqZFRAF6/W7tNrh3nAvwTgkGXwE2W44PfS/FlVdnTYZuaYGE1PRj7Lnp9Cs13KUmdkXScoJwz/uB8OW2RROuc63B22nC134svFuBdOvC6FcGq2acgHdP9Lx1jSYuKeqyoKA5pV1mAxYHjqWar7vHccM/eI2pySNIaBhkZmqyjnALTirgt8RbuuPdMcI2kKb1Nr/sYBJ/Ln3iFbZUY+2mDwa1mXpcKBeFmY6XRyIRtvX7JysSU9aNDZQ2/aR5d87Vbtm8q6Gp+BYcqoHi2Dvaw4egmFhUkXQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7422.namprd20.prod.outlook.com (2603:10b6:408:228::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Tue, 26 Mar
 2024 11:41:52 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.026; Tue, 26 Mar 2024
 11:41:52 +0000
Date: Tue, 26 Mar 2024 19:41:55 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, Liu Gui <kenneth.liu@sophgo.com>, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, dlan@gentoo.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: dmaengine: Add dmamux for
 CV18XX/SG200X series SoC
Message-ID: <IA1PR20MB4953EA589A0FF36DC6FCF0E8BB352@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B500D7451964EE37DA4CBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953E2937788D9D92C91ABBBBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <57398ee0-212c-4c82-bfed-bf38f4faa111@linaro.org>
 <IA1PR20MB4953EDEEFC3128741F8E152EBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <473528ac-dce2-41e3-a6d7-28f8c53a89ef@linaro.org>
 <IA1PR20MB4953517450F0E622A66E9A7DBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <cf42e020-9a5b-48bb-bc14-c0cc9498627b@linaro.org>
Content-Disposition: inline
In-Reply-To: <cf42e020-9a5b-48bb-bc14-c0cc9498627b@linaro.org>
X-TMN: [PRJoOjHr7TN/Ws6KCep6lYY5/NRsEpGDLh0xBiCfFXA=]
X-ClientProxiedBy: PS2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::34) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <gsq4vyqwga2sfb5w4ah5euwtif7hxq2ulf45nevqbpeepymvvf@ekobvjtc4vt5>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: c48cc3f9-89c1-46df-aafb-08dc4d89baec
X-MS-Exchange-SLBlob-MailProps: 7J/vb0KDx3ghsXKwRy/t5h7NdWkXmzB01n4ERQjVCrnjdaENCZBmr4HaaNSaDojh6jSgcb293G2fqb5aY46f9lDVyXeX++PDQUEMbd+ZM/icSuUWW1KVTEiwuxA+8g2bNQg28pvBBdTqn0L/WO8MKSuwMvacSmeIk73B0OqyegEUo6UUeosCMyYqRVqptsG9BX998P5Qe+u/LanHcZ8QPUt86Uk4/NVN5ZoahiqgYKEYsIxqwqLKDP4kKI/xh9OMuaEeoRaT/BQ74xepJF4UglTM2eoFR2xUkUlT4mOgNi2e60Ruhqb6f5rzPHRxUDdkWNAbccAfObm1kEjDPkkmQsM2GAN5t++0nxdhGxIUtPdzFSZKHxBb6M74BYd/vaLdX7elcbrcLD0OtBtdUXkfG9N8l3j2RBzrdxRlWgxz1j6WpWmTu6oVCmyH9XEJsWqBgjUMJwLG+Jv4Mh7IyAm7x956TOyFy2k8MRg+oMhPF41OaHc7GpyrovmWj5Bc5FhvdKXli0l51epJcIgIv0JeTJL8JMLxB4TzWaOqI7TBlvjNVn7cfe3CwMO+JXTT2GfDxorxCXhsO7+cyN4CkOUB2PspwcVIOJRs4Vc6VC7HfSxaAfNlGHS8YrryhhqiQ07RFTvgv2F7kLaBqp+i5KP/azRZVCMykfdlXCSHi0LHrMq+uYd9VbMgso0ANWkcWuXrQ4ZvHI3rcvTsJ94H3nWFQTX98dg9pT/CTKfc5dr5yAHe3yTifkAyj/Xp5VWC7Td6Bwtfb1Vmm07aqrsZALcFhbu5ktLw8Wp8LJTr9zU6FiQ=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EilNTjkxVtsA3nPQTVVZGak86zIIEPfeLqkBY3tJ75c/np9nfIxc8go+9Zh1OtX54qFKeDfTo63c4wggCMKzjzoMuOLZqnyxvCVmwNP6vmMuKtQgOhUsqxelC+80t59Whth7fuWYkmz+9292iEt+U2qheDdRhotKTE2MWzhxjd3nxIAP6HdwGz9LpomyKFEn4HtFNhZVoJIPkz2Duj9AZpUVQ6izCH/TTeNK3mlTJj4Hqv8fgjGLNN8ztOH9FFcJvuBQifRpYeIFnBBj91tCoDmxOkanRdu9IHa/RURNIGpBwSsFDEJ1onhsUULbXGqFXma3QHziP9YXDs9kh/sEpFSnMCDf/NSTbjVvBLjxCG9OtrBJ91BEwzAZyJg/Sj4opzJLgkRKvjbmDcii5Lx93SdQGmd78nWTzMFSjI5/UVkGkL5W1TjJQxxQB0NWGwW5lwLt1mmSxAkoyEwi3H2AvTe+XiQMPmIBfuP1/9sb3A2/CmYivqvTT6+uwaSZk5ij48hag/3ri2GEUHdW12xqAO11qXKSaQdI6gW6uigbPBn8ugdFa5sjQIVstrfIUdXXd0yucVEvujNcfSA6iC+IhuXIAaHJ5XN4ESivj9pURwf59lrHRknE5uNJ7bXHFgd7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cJuFWtbfHuxMcGjqsibEqrsELGpPUcMhh7OSZx9RECro/z5y7sO60elvRuTS?=
 =?us-ascii?Q?YyCTcw/gf7x+et0C2tS99rN1wQinK9NQdi7u+0BF408FFqQjZHLoFyu+f7hV?=
 =?us-ascii?Q?aFnJjSBzHknj73pnWIObrLWxqtUAqMy0HaszxSVT7iOvyW8aQ750DNvLcg7P?=
 =?us-ascii?Q?MbaiZD+7aqHOLK7xCCJ/Bz3in+db7NQ8PbQfS7xYRkYqNyKdpVco1V3v8rr1?=
 =?us-ascii?Q?9ccFU0yq/f2gO2PvjOsb6YEn3CavDwONMwgNEj7x8p0cp32AJAb/IN01u5zP?=
 =?us-ascii?Q?4sRIBd4FEq33g1jUEC4a/dNYQFArRWJUbj4n5TdpKFTxvMRiGJv7NkPPgroX?=
 =?us-ascii?Q?Qu+1JfkMzClmSVomOLd0GWe9WkWOXBrtawuPGY50TSqTat/nfsDeNTsm5SYv?=
 =?us-ascii?Q?2cg+fm9FkGwUQR95WB1c7owGqAeSP6tq5+wKAAA1uAaQV0ReGKTWiNUjiZ6c?=
 =?us-ascii?Q?9FRc3OqqaTSiRc+lv5Z5m3FcXF1SwjVw8RPOWAfnL1c45j/XoaFWQKf08SfF?=
 =?us-ascii?Q?jeYXXZPSjEUsJqvy2Ceb7pyZvjdiXUzhY2LqpD5tnnxPhVut8HzDZQ7/RQ+1?=
 =?us-ascii?Q?T/S6adMX+ZjfgjdpVCxsC8U1SL7xqhNBTSbcesGileMqNxlmQ58Knh+puiLc?=
 =?us-ascii?Q?2hjOra3ar9sfhmBix2eR2kPrWQ6Aju1Metsr4LEWu5T7oK+KJH60Tq9lP0Rp?=
 =?us-ascii?Q?TLMwUcMmgfl5jEYTYzLcbg5SgnyQsYYZw21mC+UoIan9y3kW33Vop1DGeQW0?=
 =?us-ascii?Q?XNUJBABOOgPgO+t395moiOL+ZVJJbgcDZBzjVtWJQs6HrjirjDnX79bTVUgG?=
 =?us-ascii?Q?2t1xGHQ1HXqwLvtFbQM8T4EguEwmlIRxF2sRzQJK+jOKtdU06cQZIlCIZIgi?=
 =?us-ascii?Q?02CkGV68QfTJEMXwofcRhtTjqNKJ+vtrCoUE9b1lItrlBTK6f16QylpUUx1k?=
 =?us-ascii?Q?cuyb1lY9YI8Ha5apcEWujrM+enwVcW/euJn2HgGEekQOu49J0pZOt39AqMu8?=
 =?us-ascii?Q?N0gBGKj6m1LwQFEhdj4vS97+BUtrI+ArOCBACYfjlKp2DWsyOb4ZMumohqm1?=
 =?us-ascii?Q?o4DU5mz/peupiNqRTGp6GDx4wkViRw9A6Z4+9cieiZi9R74LpKjDOrKsY1zh?=
 =?us-ascii?Q?XG6S37GRMzdm71ba/9YX4C6BYoashJbsdjzXtpDPzbS1vuTbCEDWn5U7ANXu?=
 =?us-ascii?Q?kbGgukHyPXNcvzm3Ov0qA68bMULXTMMPeAwrp1AW5lM6Y1Oq+wL6Bp6iccVC?=
 =?us-ascii?Q?HxRugD0mrBGOm+9CpiNW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48cc3f9-89c1-46df-aafb-08dc4d89baec
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 11:41:52.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_044203_921831_76795737 
X-CRM114-Status: GOOD (  36.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 26, 2024 at 12:31:18PM +0100, Krzysztof Kozlowski wrote:
> On 26/03/2024 12:15, Inochi Amaoto wrote:
> > On Tue, Mar 26, 2024 at 09:53:09AM +0100, Krzysztof Kozlowski wrote:
> >> On 26/03/2024 08:35, Inochi Amaoto wrote:
> >>>>> +
> >>>>> +required:
> >>>>> +  - '#dma-cells'
> >>>>> +  - dma-masters
> >>>>> +
> >>>>
> >>>>
> >>>> I don't understand what happened here. Previously you had a child and I
> >>>> proposed to properly describe it with $ref.
> >>>>
> >>>> Now, all children are gone. Binding is supposed to be complete. Based on
> >>>> your cover letter, this is not complete, but why? What is missing and
> >>>> why it cannot be added?
> >>>>
> >>>
> >>> The binding of syscon is removed due to a usb phy subdevices, which needs 
> >>> sometime to figure out the actual property. This is why the syscon binding 
> >>> is removed.
> >>>
> >>> I think it is better to use the origianl syscon series to evolve after
> >>> the usb phy binding is submitted. The subdevices of syscon may need
> >>> much reverse engineering to know its parameters. So at least for now,
> >>> the syscon binding is hard to be complete.
> >>
> >> Some explanation why dma-router is gone would be useful, but fine.
> >>
> > 
> > OK, I will add some comments on the why it is gone.
> > 
> >>>
> >>>>
> >>>>> +additionalProperties: false
> >>>>> +
> >>>>> +examples:
> >>>>> +  - |
> >>>>> +    dma-router {
> >>>>> +      compatible = "sophgo,cv1800-dmamux";
> >>>>> +      #dma-cells = <2>;
> >>>>> +      dma-masters = <&dmac>;
> >>>>> +      dma-requests = <8>;
> >>>>> +    };
> >>>>> diff --git a/include/dt-bindings/dma/cv1800-dma.h b/include/dt-bindings/dma/cv1800-dma.h
> >>>>> new file mode 100644
> >>>>> index 000000000000..3ce9dac25259
> >>>>> --- /dev/null
> >>>>> +++ b/include/dt-bindings/dma/cv1800-dma.h
> >>>>
> >>>> Filename should match bindings filename.
> >>>>
> >>>
> >>> Thanks.
> >>>
> >>>>
> >>>> Anyway, the problem is that it is a dead header. I don't see it being
> >>>> used, so it is not a binding.
> >>>>
> >>>
> >>> This header is not used because the dmamux node is not defined at now.
> >>
> >> In the driver? The binding header is supposed to be used in the driver,
> >> otherwise it is not a binding.
> >>
> > 
> > The driver does use this file.
> 
> I checked and could not find. Please point me to specific parts of the code.
> 

In cv1800_dmamux_route_allocate.
>+	regmap_set_bits(dmamux->regmap,
>+			DMAMUX_CH_REG(chid),
>+			DMAMUX_CH_SET(chid, devid));
>+
>+	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
>+			   DMAMUX_INT_CH_MASK(chid, cpuid),
>+			   DMAMUX_INT_CH_BIT(chid, cpuid));

I think this is.

> > 
> >>> And considering the limitation of this dmamux, maybe only devices that 
> >>> require dma as a must can have the dma assigned. 
> >>> Due to the fact, I think it may be a long time to wait for this header
> >>> to be used as the binding header.
> >>
> >> I don't understand. You did not provide a single reason why this is a
> >> binding. Reason is: mapping IDs between DTS and driver. Where is this
> >> reason?
> >>
> > 
> > It seems like that I misunderstood something. This file provides one-one
> > mapping between the dma device id and cpuid, which is both used in the
> > dts and driver. For dts, it provides device id and cpu id mapping. And
> > for driver, it is used as the directive to tell how to write the mapping
> > register.
> 
> So where is it? I looked for DMA_TDM0_RX - nothing. Then DMA_I2C1_RX -
> nothing. Then any "DMA_" - also looks nothing.
> 

It is just the value writed, so I say it is just a one-one mapping.
Maybe I misunderstand the binding meaning? Is the binding a mapping 
between the dts and something defind in the driver (not the real 
device)?

Regards,
Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
