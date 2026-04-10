Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72640E99068
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iVLHuAC10mRLXd5Fl4ldV5OXc5SAZyYFOWsc8aErO4=; b=MdtwH3yFLRGm4U
	5ex6iHyWSgVNlyUSoHqlx9ONRK7rJxEGLjye/fv9bSCHFSahIb9Blmlm7Y7biyABE+5Va+duZw8cv
	rq2Yp1gWW5BUvG3t7KZNgZGuUqx2bm4WsPmX+ODgIZkDXxipRqKDYxJQQTqs1H7StkG6VzYSujFlB
	VWqM4EN/ndNlOSnXMNC05USf7UE0tB/BOpbJf7mM51Ck/zFsYWsZW98Xp21uDUQYI83Wx5C9HuC9W
	iUpFo0zd5UfFHU7PAv5e8tDSHQ2+Dke+w2g5U6Y33VfHzW4MebxPpqJ+LCGllsZYWvE+6WWvR7qug
	wVHwEjGqTzT/nTiTBF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Yd-0000000Bx9l-2u1J;
	Fri, 10 Apr 2026 09:53:47 +0000
Received: from mail-bjschn02on2072a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Ya-0000000Bx9G-0rmx
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 09:53:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Voulae/BkxiP2PT+Rqb18drJw/AxC7wdO4B5y+QaOpchl68/T0xCDWdTNwDoclSPYCET0h0SV+K02dtE0MgnInwULEpa3RvlyuL6fWJDOXDh3XCGGZX0U6XVmpm4whqAui4qLwYQlg0u0+8oaNEf6WuqvOqJVvrV/0Jzmnq3SSY9d3K5ZiLa5KfqQZ4OUKmPMTeIeHqjTnjRbCq7FC651wk74eCHUzwtw+1dlAzOABR3r20Cs4IhG9SNjbRT8TwahoBPJJ631dXWKt7B7COTIwCHsxnUq4X+xXYamVBF3BEKiO778M9TTUeM2jXmTjNxZSecA9HE8YSpBFN99ClLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE12bTp+6zX4eb2WO6uUWXw+havk9opxrPLuGpdRY9U=;
 b=SY9uwEOT4DOXF4UmCVZdiU0y08xTmc9qDsSmveXHQl7V2deQu60JtV5fDnGfJZmZvmJCGjMdbDLPmyXTA969HtBt0qMmM03XNAgx3d404fEIYIu/JTsY5ih9xn8rUOkZipIDv6nRNy6S3mb4GcDrliQSPwve1YSitaPVHZmO2PwerBaR0hFHrUfMqfsrCsqTyhx6jzJYVhotwDzwQAdbBrzWgOD6WVOs8X/qdhQO8Dnmw8AW4kLOuVMc3of0y0rsdddC/oybaFyMdYkVfMYz1gPD3aUuXQzsKnhyiti284Vqgp7bSSwAwDK5M2u6slPFnxbdTxPNMobz7UvPOxCDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:53:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:53:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Leyfoon
 Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
Thread-Topic: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
Thread-Index: AQHcyMiXP4lWSj7OIUO4ae40utKCbLXYBuQAgAAHWHA=
Date: Fri, 10 Apr 2026 09:53:38 +0000
Message-ID: <ZQ4PR01MB1202E0FD0B1EDF46F1110230F2592@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
	 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
 <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
In-Reply-To: <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: 8f0b965f-2065-4f47-5085-08de96e70a75
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: G5J+0EEmyI7RkRHsjuySPMHkRZ/iLBWoEeUzdC9Cs69Ft7zITjFxJ3FbDXenGgYaL7zGpYhJcVDYZAwqkVvpPHeuhUpZtCqiDYGWBot9ShA2zvGBUNEMpYCfsKAY6kJ0fP5dRr+5D/xz9baGLgpLIRo8SpJTlfIhGc4BGm2r5W4HS4Xf3Yj7GBaol1kMX0skpSoodrpUCyh3ndOQCLEcHz/eu9KN0EOKdTVcWaRtqNdCrX8rh5UrnpYJX6xWQI2FYpPr2bCPL89vwJscMwRNlhqlycfu8Wg9YLb9oxAmkfDkgaByeb25GXqMKA6fWbbXrsOQD3gSAvJowjOlNHJRdDyCwTv+BqY41BmHwEPhsVVwVABsPu394Av05j8aByBNy/6PGd+oZCU7a/RaK1vG8F+x9X27N6bsIE/8A3P1yfZX0nMRWovqcTsuxtHKIqaNz2jiv33VC6kb99bSaAqu7IqL31lgO4IX3sB8enhsREoSPEJgtO1LV76goLXUgm7fWNaqP+No9kCCAPcq1XIncH/FY8bDKmRNPaSzfPMSCSk00btrbV2ZzvIbkUT9mQ/txTGgOWNW0+04Hqc/fkYIPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTMyQnBjcjN0aEo1ZHV5d2pRYkJ0dC9RRkFYRWtuZDZUdkR2aW5yQ1Mrdmd2?=
 =?utf-8?B?V0pqSGVwN0dTMHc0TWxsQnlTYmFIUEw1b1Z4cExjMS9xV09YRUNUVFRQb2Fj?=
 =?utf-8?B?NW9SaVo5aDRtMXNQZ25OWTgwbUtneGFNSWNFUFFXSzd5N0NwMzhVR1JGM2hD?=
 =?utf-8?B?L09tUGpGYmhQYU11UFl3OVBqc2hTaTNmVGVHc014TVFxQThyMFM5Z3lHaWJ1?=
 =?utf-8?B?Z3NkeEx5TDAxWm54cVp6Q1Z5UXZ3WDdsNXlRdmwxamcyMUFWYmczRTNuVnJy?=
 =?utf-8?B?emhER0Vva3ZiMEp2a2VISFJuZnJLMHpiVlVyZ0xUSVVlNjFCZUlaRjBRdno5?=
 =?utf-8?B?UzhUNHFLRFBHNlErVGpLeUk0TTFIemorNUZCN0NBc0VTL1VXUXRneEpuVHdV?=
 =?utf-8?B?ckRwY1FpaElUL0hHNCtpRUNBZlhFdjg0MHN0UmRBMy9IZ3U1Q1pEOGZXOXRL?=
 =?utf-8?B?N0V5TjY0cndqeS9VMUhXa0NrTzR5VFlZLzdsOCt6Rkw1dHJFbWcrZ1lRWTh4?=
 =?utf-8?B?SmpUZEUrbHNGNWNPT1NpcUkvQWwwd2doZllaZ2l4dUxZZm11cnoxbmxKMlYz?=
 =?utf-8?B?YzFoeFVDSGhjNlc0aXVhSFVreldnMHVqbGhEbXBPMnRRdm1scnkvaVRZcHJw?=
 =?utf-8?B?Yjc4YnlDZUx5bE1oUXlJeThEZDVER2ZlZEM3TDk5OFpRbU1SWTFPenVsUmsx?=
 =?utf-8?B?dWp5RHJodXVqK1lZRVJIb0Y0UlRkL21JY3MrRFhJa0FzT1Fxb3BWOUR2dzcz?=
 =?utf-8?B?RVRIbHZGMll2b1pZT1ZsMjAxOCtBRVlNbHZQVnduYm1GZ1drTnFKVkI1YTJI?=
 =?utf-8?B?c3JMd0dPYXR0ajZITXJyczdxd2VnRHZvck42bFh5NkxGOEZ3eGF5WkgvaDZt?=
 =?utf-8?B?QzFYWjA5OWpOaURsdTdLbUxTRzNGaHlmVDdiQzRCMTJja3ExdGxKcXozQ3VS?=
 =?utf-8?B?Y3JnRkw3L3pORllEWUl5dFJZTGpZZDVyd3FQK2l3K0NMeXljSDYySHF2SFlM?=
 =?utf-8?B?Zmw5YnVFVllrN3hmbEJIc0VKRWdPTjVWcmM0ZGFtbkJ0YmREeXoxbUUrcGcw?=
 =?utf-8?B?VjU2RkxwbStaQVNJbThVa0QveVRVaFd3S3ZySkxrTktjVk9iWXhnNjQraGY2?=
 =?utf-8?B?TUhkdVBWYTdqM0RoWTE0d0VENENIQkhCZjdoLzMxYzkwVk9nN25xRFNFZ28z?=
 =?utf-8?B?SG94VEl0LzF4RGhtT2l6WHR5Qzc3K1BaSDJmb2piNmJRc2Z3NVdQYW8razNB?=
 =?utf-8?B?V1l0WFFvK2dielBHTTR4TjdRQ01yM2ViRDhrQ2dXanlnZFZzOXdYc0k3OGYy?=
 =?utf-8?B?L1BPVWt0TWY4Rlo2bi84LzVlcDNES2VGYUp1alN0empBbGJTYzN1cHpTemU0?=
 =?utf-8?B?c0tFRDN2UlhwVVFnVTJBeWwyUnZNcllDR0t6cklXeEpzdjFYVlpCZlUyT3hj?=
 =?utf-8?B?dHlnY1p5anhucWJnemJyZkd3QWpSZkIzZlViUjRYRysxaHNlQU14SlRFRVha?=
 =?utf-8?B?T3NwQXhxNzIxZnkrZHdiSkJmb0JmOVlIRTJZd1kwZWxMdUhQcWgraTdGN3pP?=
 =?utf-8?B?TGV3VW1FZmRuWnNZSlQ0VWJDeGlLUWpYNTNNSURaMS9saDBYRCtIR0pkRkww?=
 =?utf-8?B?RmFqVE5LNEdjeEVBWHRpRGtsOUYzOTJFc0RTb21XaENFMVBYcmNoTWlSRGNF?=
 =?utf-8?B?OE9yM0FQbk5XUFEwZEJkcUl2TjZVYnBxSldhcGdFckUxRWhDVXB3czVpd0tW?=
 =?utf-8?B?T25rUUk2SkxVMnorZm5mTXVJVnh3Z3pkeStsSUExd2FRN2NlVHIxVlk2blM4?=
 =?utf-8?B?RVdULytrYnNZb2xtNHMza3hOYVFqeDBRT2VHU3NibUVtOFI5OUNmUGNraHVp?=
 =?utf-8?B?UXB2WCs3b1dBZmt1RG9wZTNKTmFreUlEK0ZVRFBENXUySXhwL0ZyZmxWZHpO?=
 =?utf-8?B?NkFtbGlKdlhxWFpYd3g3dWgybXZiQXhYZnk1aGNKNWtndG9QVWNmR28yd25T?=
 =?utf-8?B?ejZITjR0WlhmKzI1SGV5cmdSZ1laeGtWcjNZOWlTbS9uTGJlbnFSbEg5M3Mr?=
 =?utf-8?B?WHpRa1EwSWVWdjhGaVl1MDhKT3A4ZnZLWkpGVUkyNDBXNjEyY1pLM3VTQUFQ?=
 =?utf-8?B?REZsQXI0SXN6U0FLQVd6QnR6dzVtL3lkaUpWZmIwS3lHODRYeFFwZ2trNGJJ?=
 =?utf-8?B?SjRjdDVldmlqY2dBVStkWEFETWtDblYvZ3NxQzNHNFBYNFA4Z0NuZVlBMHBU?=
 =?utf-8?B?aFZqZ2FHcXJPdUdTOTRDVnFObEVidVM3ZTZlMGVMeU5ZNnNRQkhodGZrYmY3?=
 =?utf-8?B?cEhMQVhuQ3o2SzZiV0U2SWw5MExvcFNKMnNsalN1bkVuekJPMTJJZDRLbWJZ?=
 =?utf-8?Q?BymtS4uKmARv+h04=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0b965f-2065-4f47-5085-08de96e70a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 09:53:38.9779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63WE2sSzP+DAvXeWgsdPnv/tB+B+1M89oILwjcsy9kcONpNUogClv8arJ2ttl0GjDgatoxbNRIDQ7ephQIOVFTiS2A9pnr5OViw3rj7ff7aP+7hKYjTFMsT2oAZitlka
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_025344_269433_61A64E30 
X-CRM114-Status: GOOD (  17.55  )
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

Hi, Philipp,

Thanks for the review.

> On Fr, 2026-04-10 at 02:01 -0700, Changhuang Liang wrote:
> > Use devm_ interfaces to simplify resource release. Make clock and
> > reset get optional as they are not used on the JHB100 SoC. Replace pr_
> > logging with dev_* logging.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/irqchip/irq-starfive-jhb100-intc.c | 44
> > ++++++++--------------
> >  1 file changed, 15 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c
> > b/drivers/irqchip/irq-starfive-jhb100-intc.c
> > index 2c9cdad7f377..312a4634870a 100644
> > --- a/drivers/irqchip/irq-starfive-jhb100-intc.c
> > +++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
> [...]
> > @@ -127,48 +125,44 @@ static int starfive_intc_probe(struct
> platform_device *pdev, struct device_node
> >  	if (!irqc)
> >  		return -ENOMEM;
> >
> > -	irqc->base = of_iomap(intc, 0);
> > +	irqc->base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (!irqc->base) {
> > -		pr_err("Unable to map registers\n");
> > +		dev_err(&pdev->dev, "unable to map registers\n");
> >  		ret = -ENXIO;
> >  		goto err_free;
> >  	}
> >
> > -	rst = of_reset_control_get_exclusive(intc, NULL);
> > +	rst = devm_reset_control_get_optional(&pdev->dev, NULL);
> 
> Please use devm_reset_control_get_optional_exclusive() directly.

Thank you for the reminder. I found that I can use devm_reset_control_get_optional_exclusive_deasserted 
to simplify the code in next version.

> >  	if (IS_ERR(rst)) {
> > -		pr_err("Unable to get reset control %pe\n", rst);
> > +		dev_err(&pdev->dev, "Unable to get reset control %pe\n", rst);
> 
> Consider using dev_err_probe() to stop printing -EPROBE_DEFER.
> 

Best Regards,
Changhunag
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
