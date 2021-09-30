Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B94C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 02:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201A1617E5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 02:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 201A1617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=2XavhXtNib6ocBNe2ZXrNGt6bL1Gd3Ms9fFgUqHQK60=; b=XgIq5fcIjesWzK
	VjLQYwpN5HwO3rQFrMqSlQ+Wq5rqnM2QcnukxvVB/4p/5VruCNPtt+mXcFDtMd1AkqTOjsp1S9Rws
	SRu9RkBHGuW6ErwxNOEOhfbVJoRRZ2DHmICmMDuoeHzC/apze8k9gMRXR3p2ffTVMut71ssp9gNq4
	hBLaihOq1sxt7oTMJ9iCFQq5Td74HfveXBCrVP92XqfYacDnyP9wA2/KCnlCeeGPHHpi0bOgQX8IG
	yUd8x2marBQlGUExnCvrKjjgNc0tL+INbT73CehTPeXS9mZUh95k/zXFKHbOMb/rNM+KQbE+MZ4XI
	zyMGqABRPYtALP4lwhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVm9e-00CpNI-1b; Thu, 30 Sep 2021 02:50:38 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVm9N-00CpI3-1t; Thu, 30 Sep 2021 02:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632970220; x=1664506220;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=kRCPIMyPIcHaFO3W2JZRibhvRYFEtz4YoFKUL+l7wmc=;
 b=jQ8jjmdo8/jSwvFBDhOycl5FEIOm/tcG5yTheU2XDU3QY6XDXroErQKi
 nno+oXUHwRkq65WOcXuS9Xl66nPbm+pmLdDRcLO9GErlnUAjCAu/I0mZZ
 /56jW2NEkQuxGwNptMjsNOQIlBZCHWYOoxLQT+ZuV9RgqihqQnHi/mm85
 vM3F5lGuYlpA4wEQ1zV4ypbXuWHIM4f0tVq5obMdLR+onu15FTknZIaLH
 cMKvoKdAKFGYktEn3WdozDAO/L+E4bQ9+ckGf9QVplOL6TIzRbyFFVVfD
 5eNwYijstm8NvFT1Y2tY4zOAOhQ3AAh9cjvdPhviSLveUUDrMiSzmpqqf w==;
X-IronPort-AV: E=Sophos;i="5.85,334,1624291200"; d="scan'208";a="181387537"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 30 Sep 2021 10:50:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Am9WKF53m03lzmr4XZx7AdFnU87zXBkznJuhyFbkKTO5UUOf1ikVY6lNYFAabWO19YEfGQIKq6ODJV1gVA52vbqEI1CNJ12THF6UrQNsgv6wMYXzf7yI7PccIPmy6XsK+44nfHYCfg+txCO40B383bYxBFcLqPeRV3CgvDlzzYCRqWKXRnMtO6+ypXIUiXPGeeojMdkEITCUiORpG6vA2ie/hWtUEc0O1IF/cuSuO9P4mZSSVS+fB6DC76bkjWgq05Mcm73Ajoz0rkmS/gn4kqoDdhTXMHko7Pamf88KSE5H29rHs+Rv6d+bSxyojiy+iRmsNqFv05BP1/axVGpk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PQbQU2DssIevzFmhF28QrI2qy/TSwYckX7lUULGRexo=;
 b=P4ruO14AFwN8wgI6HsBOfRg2xUCwK72Sl4ixNHLycNYe4VscB5cCB6JolQ8WQhuL9EdJSVLVCw0LktcFa0E9js3z2Kc9pZJlWGUN/gk2CSxcXq6oS5egunoaOhQU/hjfMfP18Z9I3f9iszox237Yhezh1gTOyBQFE2Y7VozxzyIAfSaxosY1+9RMtwLG+gJwkwMP6p+DJl7fcwWsR6SbZX+ZL5WCACwiDd2YjukB8zjghmRY1umC3EFhKY5wsSacFw2JKwB6hnI0JNqYqePVOpDJYFOGglOhQLQR4SnhpNpiirF7tqBSt+NaleGQZ3bPTcNOFeuVfVmg1hIbKfV5CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQbQU2DssIevzFmhF28QrI2qy/TSwYckX7lUULGRexo=;
 b=YXV/RFwsKZdflGWk+fta7EVUwxBALKjiwED9dBh3IA/HZuiDoQ4NrPia7+Sup+1TT1WRuocpvsM7risb/BjA7JUzMDWg8OlHy/6NWdSY9kCe1bGAIWg16cofc2JcOtNMuxA7eiszeCO80KpPgHDObB/k/TF3E6CeliCWERFHWDI=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by DM6PR04MB6606.namprd04.prod.outlook.com (2603:10b6:5:1b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 30 Sep
 2021 02:50:15 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::7c0e:3e95:80d3:7a70%8]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 02:50:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Saravana Kannan <saravanak@google.com>, Russell King
 <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-oxnas@groups.io"
 <linux-oxnas@groups.io>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Thread-Topic: [PATCH v4 0/2] Fix simple-bus issues with fw_devlink
Thread-Index: AQHXtMYHtS6fHXMugU2E5Mhb0ZTigQ==
Date: Thu, 30 Sep 2021 02:50:15 +0000
Message-ID: <DM6PR04MB70812E56DB9CB8CDC63C6535E7AA9@DM6PR04MB7081.namprd04.prod.outlook.com>
References: <20210929000735.585237-1-saravanak@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34049619-4b3d-4422-8742-08d983bd0809
x-ms-traffictypediagnostic: DM6PR04MB6606:
x-microsoft-antispam-prvs: <DM6PR04MB6606C63FCA145D7D084DE5D9E7AA9@DM6PR04MB6606.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OQUVQQLHrwxiHe3t2MqBGq6yyEvOQ8Tmyvn//TAiZUiRKJRCMciI7EGGzQu+Y9TH96kBViVXT3aCunVKUb2sXp4Wy5+apenAPYt7WbJMwwbuPZ5y++IioemVCYpW6jMKcpJU3JxvSg0APFO/re5CpMRE6yI6kLbyCpzAu6LcFDAvG3XLz4QbOaY5S3pV9IEi3e0bcR6kBtyYbEWslsiprL9xFMQKD9jyDzMQhCX4t985a/zvhCBG7ADc1h733XCoyb/vUFRUq051HHpzsbeLAvVQEDARIzIfgxK4G2CvYJ/6m+PXwFeeIQp+a6i21QRXMegvlQ3xgDIjSMQir39xat8fvN7lp1Br0/SOF8pHLHxffn9FTfHt6UmysbBJz49vtL81Da38DR5iG0TMoS7ZTv1s8PF62pDlpc61qQPkuP8lw/Vp+nVZdcLfIVzQIq+4CSBo7AivXb1KVUFFN/bphrVlhJHni3L23dvB4Xmv4OEmZGX6N39e1a86/vVypbLfoaqzSvjxLggmLHN5Pq3rVBWa21WK7Ke/mDk8SCVIPCtptWzuHJEuy2FvYrTkjDH6/7O6sxg/6qhU/PLs/RUMQky0ZXV75VvmeP4Qe8Hl2rbov0APjFfu4rrb37SARChTCjBZxouPD4sW+71a1NgApV6KV7O9xjDsVE0dB/d5jM/7IhCkwav9CGLMHLiJY0vSaT0xh+Ms4sCS2fOHf0/sYEKE4yEBOrWSe1Ec4tjZksZ59lWf6XGE3zIBRijhX+aAeAb3hw8+PNg3JAeO4GXLc9pPHvZda1jYYhYl+ATbuus=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(76116006)(8936002)(66946007)(91956017)(55016002)(6506007)(66446008)(53546011)(9686003)(64756008)(66556008)(66476007)(83380400001)(186003)(7696005)(8676002)(33656002)(38070700005)(5660300002)(4326008)(38100700002)(122000001)(2906002)(966005)(7416002)(508600001)(52536014)(110136005)(71200400001)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X06IkIwWxMM7yc2mQIHgNDQg9N4auO6KR+lBimA9/FRi7v7LV20HWLzYmZtA?=
 =?us-ascii?Q?oke97pxxbAKfLRYLWOgAM0gf3tezDH1/mU7R+a9rjVJoSytLXGXhwqV0aDFt?=
 =?us-ascii?Q?9PcHC+Vm6xOeF7aucPbRQxFJzdRBtNPzA34vPk08esOZ9U1PLvQstojthh01?=
 =?us-ascii?Q?fOFFn08yf+lI71MaTB7rwqktqiZWn2imSi++f//PKYK5tX8ntXmVlXI1Ffuz?=
 =?us-ascii?Q?oAl/9yoyVcJduAwaIrxjF4qfjE1vfwM/Xs6wonevHBcAfqFSUvKaKzdbfGVe?=
 =?us-ascii?Q?6QlWPuiyZv2DSYaq8VFVDwq09coHdkNOSaB7WLNpcRP3dewu/VCAzlPRXJul?=
 =?us-ascii?Q?UQu6U5kH2VLO/MRT+VKhb6Tsuoyq4nvPUAhYZD75mAYVtZ+lXdQBlHsbjSAs?=
 =?us-ascii?Q?aOS5EelKGXN6hXswTbVL5NXaThwNQYyKY57aT0d23SHmC5rGoin6vWnGxDQE?=
 =?us-ascii?Q?l0zC/NiYlJoR2sIQDDVfqttHO0u8FccS7B3RffbfwbiosUr3uG5bbjKkWkRq?=
 =?us-ascii?Q?bW0QHxH9bH2HZP/O2sxa+sXLCh1xFDGVGAvFMRqeSmnoz/GAyJdns2WQ2rI9?=
 =?us-ascii?Q?4fjQT85X/ZXvQq+fzpSIvc5cXLz44OR2Vvd/iD2k0fMo0yEqYefIPmYzeqb5?=
 =?us-ascii?Q?SY3Zjm4lejQOQDdnMCrkPXAaAQN1Acnjm37M3PF/3hD0Svl2Q1CD0zbu2Kt3?=
 =?us-ascii?Q?3wByf/B08heGk3oplQlErDYy9Cw1YEhkIQ/aZ7FbA1k1icdSpFjcnxLUVulc?=
 =?us-ascii?Q?DxACExBcIrj8i2HmCZ3dUypEWisZ7gLu3LrapImRABo9UrszLHX5v56aVT4i?=
 =?us-ascii?Q?AiuDUrt2O4aWTNe/UezdVfJyn7SgXt41J0Lh2m5bOmwrMpNeg/4PE8QvWdoY?=
 =?us-ascii?Q?6P8Y2Scx1UPcmi4iyi8FTcn8XcMHfx9uWYkBTVupVS9KVWZ68GNgrWHGQ7oK?=
 =?us-ascii?Q?9Kfsi9pxeLSUm8sSF8s6jgxBX1cot13yxKAY+DIhzc+G1k1X7ASlsVyCGhxC?=
 =?us-ascii?Q?xWbCvNF/HWwu8WnUz5NDKLy8+p/RbZ99xuCmBfeq37C9S0Ar0jFmNDlwxLCG?=
 =?us-ascii?Q?t1GX4V4SggCws6EyemKyEA85QA7NMJ1aTIi7HvYNRnT+jqG3yFfUuBLgvxiO?=
 =?us-ascii?Q?u7yTlHqZFq5rpbkIARiezkDj9SvVAt1YG336Wy1urZWkVXNhvmksNEyy+2aR?=
 =?us-ascii?Q?eHSEQmMD64NkHkbmLbOufPntu1KhZXGnWbVYbI7IX8i/3dh93lbfumoYhN6Z?=
 =?us-ascii?Q?UI2LpRIVfSv5nzM5oidXR1VZCAdFEuZKa10kACutokw765IM2hQnRpbRgrXH?=
 =?us-ascii?Q?IncI7Wyz37gR5C/HbF8KWaOkH2ABioClp0gMWWsgfGZCATUUeytMiTuRXW3n?=
 =?us-ascii?Q?PQ9GLakb6gnVpH1ofbIIVE0xi4FoW38YePsoTI4ksSdfyq1srQ=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34049619-4b3d-4422-8742-08d983bd0809
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 02:50:15.4713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CpA65XKyKOZE+IR9oHD6IBrsjq6KUjT4cKAH7796pVnlZdabKm0hFS0U1/PEYafTTZ1Ba04o0doAOrF88N1QEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_195021_182040_2EA758C0 
X-CRM114-Status: GOOD (  19.18  )
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

On 2021/09/29 9:07, Saravana Kannan wrote:
> Ulf reported an issue[1] with fw_devlink. This series tries to fix that
> issue.
> 
> I replicated a similar set up on my end and I confirmed:
> - A simple-bus only device is probed.
> - Another device listing simple-bus as a 2nd compatible string isn't
>   probed.
> 
> v1->v2:
> - Switched to probing the simple-bus device instead of marking it as
>   NEVER_PROBES.
> 
> v2->v3:
> - Moved all the code into the simple-pm-bus driver
> - Addressed Ulf's comment about the remove() code missing a check.
> 
> v3->v4:
> - Added support for driver_override to accommodate the case where new
>   transparent bus compatible strings are added to DT, but the kernel hasn't
>   been updated yet.
> - Added/updated comments to give more details.
> - Adding Ulf's Tested-by that he have for v3 (v4 didn't change by much).

For riscv Kendryte K210 boards:

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

> 
> Thanks,
> Saravana
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Rob Herring <robh+dt@kernel.org>
> 
> Saravana Kannan (2):
>   drivers: bus: simple-pm-bus: Add support for probing simple bus only
>     devices
>   drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
> 
>  arch/arm/configs/multi_v7_defconfig |  1 -
>  arch/arm/configs/oxnas_v6_defconfig |  1 -
>  arch/arm/configs/shmobile_defconfig |  1 -
>  arch/arm/mach-omap2/Kconfig         |  1 -
>  arch/arm64/configs/defconfig        |  1 -
>  drivers/bus/Kconfig                 | 12 ---------
>  drivers/bus/Makefile                |  2 +-
>  drivers/bus/simple-pm-bus.c         | 42 ++++++++++++++++++++++++++---
>  drivers/soc/canaan/Kconfig          |  1 -
>  9 files changed, 40 insertions(+), 22 deletions(-)
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
