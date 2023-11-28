Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E488BC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmHkqVgz3Y64qKvDQrMu0PPXnAs51PcyN1yR+mCG97U=; b=a1wM4ZHzpcUNHh
	AJh65HX+QP4XuAHSjJz6skkRZ3yXbOM46v0GPibeNtQez9OzB3Y8uaKU3a7GV0rLVgCtZ0batmwET
	wl9tbEk7QSmyVWk7L5caZQ0ot3jMtDAyivw7NplTHoNN3Xulj6k/+wZ9D4mv8xAzVDOTYvYylJ8Ox
	by0FPU8UkADdU5+dIHGWY9k7QuxGww19jJBHbMRLfTvs9ntY9utNCD/qpJFilWJhrDCWtd/ZvvWV7
	umGJAC5NISNu0yfC3zduadZ13hzP2a6MJ6CpZ46sXMvUtuD+nBDu5JX1Uj1vSNrJ5HpUGLmYWfqS7
	am2wViqdBhAFOVlt+nKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wMo-0057Vr-2k;
	Tue, 28 Nov 2023 11:35:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wMl-0057S0-2M
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 11:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1701171299; x=1732707299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RRgZT73GE0PemZtPQmyUTrBFpmxdtx5md87gBaEJquw=;
  b=BF+tPBjnnO3/kTUNIHXwmjAKasKjwIhSFf+4ovtPKXLTueTll2lFRTtg
   NnzwORkeO6uEyPu6KLBYbeHSdWJN5mPoClxwQ4Oe+yPlP1uDNUn9TbW6R
   /FKZkpj30e+qSj0AUSj9/DS6kPoHmXqVEIhrP6iJ3/QSUs1NaGjfu0Ag6
   JWo6BFtOSzruwO9CfYjQnDzacprRLhxu7hh2m5A02WnhS2tiLV2DJy+8Z
   02MIEqYKU44WCo3pfe/IRKvlz5jUiGGejX0nn0DimjqC6JFidDZ7/iziD
   HEG+rIBZ0y97va+ZvVJaar6B+PGCGpjIfa2p/+XVFRasyRIrWT0RsfiLy
   w==;
X-CSE-ConnectionGUID: 0hKpsaz1QDme7RntdZpeCA==
X-CSE-MsgGUID: dAW0adsLSMyhYVDHdbg2Ew==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="12323700"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2023 04:34:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Nov 2023 04:34:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Nov 2023 04:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyZ2u/znP7cDXa1OnPq4uDja4L+4cfELMb8Yeb3ksmF7Ehv1qAzNUf8ZP2+GbouO8kS6u++6tyCeLpHGNQsyk6b/tFM23n+70/DlfliI85ZDPkDvEfQZTWdEs72IwYOWxgbLquuy9km2S9jzF0fHCHvLfGgBZbvV+eCKTTZjDY6FNrCq9ooxyuYaUZAUL7ptdlvBhNKeC8jKHwbQ7Xs39df3c5nvnIGuZkFxYgm4ClUs8L5YiGg4MdxLu6rmwttdrzVf/F/7ZqSM4FSXy6xOCx8CNDZnMNIU/bJYfWCSNNVrqHNxHGDPrIZ2O6dg+6GR3kTBWV9At53Ie1BLBByy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kS8fT6ETub7kQX8+9D35OrlQuVJWziZhpXkUPPhrc8Y=;
 b=LfpaTEH1N6dv2Fa6JpUKcEa2zPul+jbvoppQtm8tSIWK1Pk6ZJRMOZ46JjWo2O/SH+XAsLAeLlwgOc9BESP2u+bOYIolkbpI7JduSdz0eAU/94O90BPj4Kf7LMFqEyP7GnypePS7ODMbB+SZawfxlh2OHnqbxCn8g/jsMOxJ5g6BLMceqSsOK1g2UaF9BJ7Sb0DMqFuIkocsL15ifvdakZBzLa+whUb7Kc789e5ZvI+UPbmyTg7KvR+3Hu7cOrrhZEGzhXLFGxYnLjPCienTNlKKnYrMe19BBsyhZIuprBW3BBQnJ/3FSfEzYSCim/3e/46xsqkRpkMhvD8qCy40Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kS8fT6ETub7kQX8+9D35OrlQuVJWziZhpXkUPPhrc8Y=;
 b=bqOBDetE/uADfX5CwrDsiTDRZ6gWnAsEcDu4IKAktCJBJDCMZLwxD7OOAkewJGwL26E9IyY/57BLNFuLaO7HxGMBfJb/lDU1kPO6da1hiOPaT1frX5c+cGkJHpe66JCMaccOSHY1rIGxO177EqnNtPq+5jBNQvprfXUAU/zPxR1FJgwgcQZAAqb9+jHyIpVKpzXSonCc56AwOYMwLVH3E7HR+P1utNZtp7SsEGv3huIKHZbxakcveDque09qoIZ/0H94peU6TrpwrCOxep3MCxoWCwMXSLX7vjkiSCAhkPX2O/IHTjORjod9PezRS0Sr0UvUejeUI9WtQw/aO0fgmg==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB7822.namprd11.prod.outlook.com (2603:10b6:208:3f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:34:44 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::447:632:a9ce:152f]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::447:632:a9ce:152f%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:34:44 +0000
From: <Shravan.Chippa@microchip.com>
To: <vkoul@kernel.org>
CC: <green.wan@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH v4 1/4] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Topic: [PATCH v4 1/4] dmaengine: sf-pdma: Support
 of_dma_controller_register()
Thread-Index: AQHaC7rwiAakoMNSeUabYOyvai+WirCJhnmAgAY/ogA=
Date: Tue, 28 Nov 2023 11:34:44 +0000
Message-ID: <PH0PR11MB561175B8951083F151A7269681BCA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20231031052753.3430169-1-shravan.chippa@microchip.com>
 <20231031052753.3430169-2-shravan.chippa@microchip.com>
 <ZWCSS+UXpRO+4y9h@matsya>
In-Reply-To: <ZWCSS+UXpRO+4y9h@matsya>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|IA1PR11MB7822:EE_
x-ms-office365-filtering-correlation-id: 07286717-c2d9-4797-f887-08dbf00604b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VF/Gz9DqWDcPZyKw9W2is75z+Q+IwyoVDPnJ9mqq/JbMwrKI7S3aLlb8uGT3EzBuZ32/D1U3AXJgojzc+24f1ExrnVyBpSQeMGTcnS+hA3A1kgPMhjComnAQvYC/O6UApHxavQthtsSL5ZuRy2w+ArEVvMqnZllEd4vSTiOeMMklODrzLtY4QVDc+e1qjS5+Li63qKILg78+nnNZ+IAb0cnM7zKX9weXCLkC221Xhgmv2PEtEtN/PWr+BvlciwucbUIJklpPt8L0fHhHqAmzLtvo9lGN3p8YMeUi6TlCEt9d47N+jIA01IhxR5pGBxBEEOVlbWuQDb1Khqcd2Eiz/M0WPTcH17qyqTJtLrWZnmixiH3/DCcEt9ZbDVEYVECGAZKGYWW6EWcuZKbe7pG8Y+EpQuH8iHBCj3X7dOlD3YrniaPh9KKUYwtXy/broL03UE1vTBX4YRqwFmUa7Az5XxxLwhSd2nDVgvytPn3pYoO0KmBVxi7xJEs5cXVY5ETAoQmb9D4BsYQBlqUURrcPptETiImKUBqL+r9MarO1skgpA/hxooGzzPLnFcrpkQ6VSsd4nvxzDoxf05VGZmt7VuHkqZEgZ92dyKBU+5DJ6fvcRS+wbVmk4H/+ESXWXye3+qgKvyPEZawvDFnGWFCd7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230173577357003)(230922051799003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(107886003)(26005)(6506007)(71200400001)(53546011)(86362001)(55016003)(7696005)(52536014)(8676002)(8936002)(5660300002)(66556008)(4326008)(76116006)(478600001)(6916009)(316002)(66946007)(54906003)(66476007)(66446008)(64756008)(7416002)(38100700002)(83380400001)(122000001)(38070700009)(41300700001)(33656002)(9686003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sU0ZKLTExSGeZU5JTCNq9MZYBbCQ9XIsG5o0w2NMqm6VBH5t5VF8GmvBDMRe?=
 =?us-ascii?Q?Foi8cK6pwooubVLW6f1criN7oQSLF4/hICkyW0SXfQ9kViObkfFyUyXkPP+T?=
 =?us-ascii?Q?oP4oq+xeDg90v8bBZOzDF356ZNUzzz0gT4MLXzrflc523LgKjz8z3OolOTNG?=
 =?us-ascii?Q?CG7qj1elKgRYIwsFht5HKqVnEKtovsqjePblIcDVniUuthh+6LopD7n/wk+V?=
 =?us-ascii?Q?6HCjPtDuI/aOEMIs4sWx37CknucFHvaVM+oWWyzFDvETMMuwdfHnyEWc3vBt?=
 =?us-ascii?Q?ePCxcPktpn3REoEtAcrEKQImNXcc4pB+tfx/hgOX8B/EXK4L/WlQ8H6GGut2?=
 =?us-ascii?Q?15fMhkGlGQbeV/LYWvD9LUvgQ1ELOyq0Lt9kGlL1DQb1riwmKawpVS3YYKze?=
 =?us-ascii?Q?g0hkjhGGXYtA3w+Y0NKTz+hA3RJ1UEoLyYjaVBedQJTzCX5ol25996HTqloA?=
 =?us-ascii?Q?/t9vZXDjayrZwsQ/tyPCwAdk8q4b4H0XJyf2pRxKgBQ9RHO5gFWZM2ldMrQI?=
 =?us-ascii?Q?S/AJkWelphtj4qJWhnAyEsLIq94y3tAWdNzXAOnoAf6ePd20+ie4cU6E19ND?=
 =?us-ascii?Q?VD7G3EXIZMI5E6mhA7eog9rjpDVRLjUo1Rg02rWcHNTXPJa5ZFJNb/ts+wii?=
 =?us-ascii?Q?mWdMytTksHxnixbxP10MOeveVXBb7jR9gDhaT0L7J2Tje9tcuqFjDbQ4c25Z?=
 =?us-ascii?Q?6n9Kn9wAfQwKiOgzJ2zQ2dT3bvxC7sYerOf7jdJBLnSZeb/Lx/fXS/z9d0Rb?=
 =?us-ascii?Q?wMZQRfTDJgr2W7PWEf9K2hSH34e6EwKFJtzKxGHMQty/bFgQauQ+2ztM0UtG?=
 =?us-ascii?Q?Drs0RhXG+j2pHDTyBzkBQnJb710JiSm4j8Rwrdx6qL9IdC8Kzg110EPLUQ7Q?=
 =?us-ascii?Q?X4Zctjd3kgB3QAidgxLqIqPboF7hRsLOihPNXWQqTmM93oZNLc8+0EV2d2Zz?=
 =?us-ascii?Q?0HD3czbuy62/WQGKzaVOWKGFHWXk3hVQ8nyxLXkbhvCMOdt6jrR4hP9xF8XF?=
 =?us-ascii?Q?27Egihd73IhaSFukq2soBPehFladDOiCSt2ZNOCEj/xCMNyJ7u40d+z0jnKi?=
 =?us-ascii?Q?5tut0sFdmjO7u/7tE8kG3J7OfmY2KrshGDu9d+TMLn1Ln27bNWZ0Y976R13C?=
 =?us-ascii?Q?lfpEWpLygUuD1B6elMtb8geL5/tQLrtT2fjgXbPm5RwnkYIiGFpDqKja3Bb7?=
 =?us-ascii?Q?T/TDXUpPTyqVrZ62oEf3MWrB1nnbrtsoESBhJQGTkXWGVvU5t3XEHgmk+7EC?=
 =?us-ascii?Q?Du3QJnNnbNtHmHdzjOlt8erNi7sdxMS4jiRa04O/kkY25ooLNGSrC6vVozBS?=
 =?us-ascii?Q?q10H6PlWjEvOqiu+BiG/J2AE+NbTJjchu5DpOexhFVpqm8pxYVqACpyZoz+6?=
 =?us-ascii?Q?qnbVPXpFR2cRmCjlFuFd0/hNc5m8GixE1YdLr6EE/xjY2vPB1g+Rdm7RSF5R?=
 =?us-ascii?Q?Pe2aEweX6RjBllwwc5neXytzllEE4Qn9hEElLwybBG+G1OLIrLAeG4k77fAb?=
 =?us-ascii?Q?vS6kFsnKTvKG2Hp7b4DRL72hiUHxZSHiWW8PbYDBNPrkavFgUvU+TtK1VGCh?=
 =?us-ascii?Q?c9VlYuOzaylRLpwHOG1wNLHvMoTX2eO+PzpIMOfh36v8cvONImMvwWg68ai1?=
 =?us-ascii?Q?VA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07286717-c2d9-4797-f887-08dbf00604b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 11:34:44.2452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mhpd/X40uUcKt75WKCKP0TrsVbWLbs6lBvbYVAmmVRYLvTKjFmLmP7ZZgEJT1qjIRhx61jphq0EbYtoFQtbn7sdisTbCX5RI1Mi0mJoIizU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7822
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_033459_863063_F1A7473D 
X-CRM114-Status: GOOD (  29.02  )
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

Hi Vinod,


> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Friday, November 24, 2023 5:39 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: green.wan@sifive.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org;
> dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli -
> I67208 <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH v4 1/4] dmaengine: sf-pdma: Support
> of_dma_controller_register()
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> On 31-10-23, 10:57, shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Update sf-pdma driver to adopt generic DMA device tree bindings.
> > It calls of_dma_controller_register() with sf-pdma specific
> > of_dma_xlate to get the generic DMA device tree helper support and the
> > DMA clients can look up the sf-pdma controller using standard APIs.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/dma/sf-pdma/sf-pdma.c | 44
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/dma/sf-pdma/sf-pdma.c
> > b/drivers/dma/sf-pdma/sf-pdma.c index d1c6956af452..4c456bdef882
> > 100644
> > --- a/drivers/dma/sf-pdma/sf-pdma.c
> > +++ b/drivers/dma/sf-pdma/sf-pdma.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of.h>
> > +#include <linux/of_dma.h>
> >  #include <linux/slab.h>
> >
> >  #include "sf-pdma.h"
> > @@ -490,6 +491,33 @@ static void sf_pdma_setup_chans(struct sf_pdma
> *pdma)
> >       }
> >  }
> >
> > +static struct dma_chan *sf_pdma_of_xlate(struct of_phandle_args
> *dma_spec,
> > +                                      struct of_dma *ofdma) {
> > +     struct sf_pdma *pdma = ofdma->of_dma_data;
> > +     struct device *dev = pdma->dma_dev.dev;
> > +     struct sf_pdma_chan *chan;
> > +     struct dma_chan *c;
> > +     u32 channel_id;
> > +
> > +     if (dma_spec->args_count != 1) {
> > +             dev_err(dev, "Bad number of cells\n");
> > +             return NULL;
> > +     }
> > +
> > +     channel_id = dma_spec->args[0];
> > +
> > +     chan = &pdma->chans[channel_id];
> > +
> > +     c = dma_get_slave_channel(&chan->vchan.chan);
> > +     if (!c) {
> > +             dev_err(dev, "No more channels available\n");
> > +             return NULL;
> > +     }
> > +
> > +     return c;
> > +}
> 
> This seems could be replaced by of_dma_xlate_by_chan_id() can you tell me
> why that cant be used?

I will try to use the of_dma_xlate_by_chan_id() function instead of a custom function, I will try to send the next revision.

Thanks,
Shravan


> 
> > +
> >  static int sf_pdma_probe(struct platform_device *pdev)  {
> >       struct sf_pdma *pdma;
> > @@ -563,7 +591,20 @@ static int sf_pdma_probe(struct platform_device
> *pdev)
> >               return ret;
> >       }
> >
> > +     ret = of_dma_controller_register(pdev->dev.of_node,
> > +                                      sf_pdma_of_xlate, pdma);
> > +     if (ret < 0) {
> > +             dev_err(&pdev->dev,
> > +                     "Can't register SiFive Platform OF_DMA. (%d)\n", ret);
> > +             goto err_unregister;
> > +     }
> > +
> >       return 0;
> > +
> > +err_unregister:
> > +     dma_async_device_unregister(&pdma->dma_dev);
> > +
> > +     return ret;
> >  }
> >
> >  static int sf_pdma_remove(struct platform_device *pdev) @@ -583,6
> > +624,9 @@ static int sf_pdma_remove(struct platform_device *pdev)
> >               tasklet_kill(&ch->err_tasklet);
> >       }
> >
> > +     if (pdev->dev.of_node)
> > +             of_dma_controller_free(pdev->dev.of_node);
> > +
> >       dma_async_device_unregister(&pdma->dma_dev);
> >
> >       return 0;
> > --
> > 2.34.1
> 
> --
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
