Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34542C71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKPnoFdk+kK5DWbLSw2bFnVCBGYXcUE6QpYiXYzpXB0=; b=ZYyPCqMTLv9WPv
	lhi31XP5QPxnAohQMIHGowTCsGh2Q/5vz8J3Y/hr5U8xTQJhXA5q2RpHtmos1c5lIOPs6DuXE4hs2
	fS6Cpcz1oOycjEHzqU7RtUyNMV7Tt/qb0UObAzHwFE3sA//JAdvxIhgA83OJ1bCJXa+ExdnwRdISG
	IAIvhiLYzgwo45JtA6ca80My3L2OI2e1fgmQikkhy4DlOQYwe4K4Y7auo3rUqT/X+G1Bf3wrtvLul
	wzJLlrjNaAIUZk9RWcUWP5cAH6e3ca+GwK1f0VW7PGEmCai7OkygE6cm0PEmMft9DqAPHqtQsOX6Z
	Isa2mJKOdGDgGrtb9oDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHgk-00000009Sb4-0ps4;
	Wed, 11 Jun 2025 09:24:06 +0000
Received: from mail-sh0chn02on2136.outbound.protection.partner.outlook.cn ([139.219.146.136] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGEB-00000009A0t-3vAG;
	Wed, 11 Jun 2025 07:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYAMovKxu8zR8PumZ52GrMkFPsb6fnczPrY2ztRezkUevqxyNrrGJjgXNq5eIUxBjUhpVdqIs5w3mMxm17bDF3k7Jdy9JRM90qWcc0tyRmrT6o9VKvKmpn6R8XA8BefRvxJAfSGHejfkGsbRyCPsiGoFDId346xF/Eb3pphDP9OyWQhkBt6cqeZholxuxS0vaHHSLq4Kun506yd197ZpHx7dSojrHXA3JVLAH/ewlPFKO3lMbh4snOOu7N1LKi/shy5Vxp98QPdFTOtZulN+q7gDJ2wITBUTqmnzcsZx9FwXQY3so9JXVhrU/AL9HEM9Z2zRzPyUCYRUMauMUQCj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTKpDYpGsK3lbDagPVf7Yx7Rcr3T6Eo8k+Zi9vqiQG0=;
 b=im+NBteedQnQi1hOuZVHeXWo4A807NaVex2NcpN3eXuc9+fnJemNBUCNsyaa8jwbWw+OAQlspVm5/Qzs30GuCN0Hb7IpnGvGmjb7SuYW23/LAky65Mo8tlsbn1LaThoAtfnJi3L2lKqGquo/PFhJaDQ2V0ZqTPV0F6C+TM78JqFoz/Qy/7nzjm5VmgdrOczUVpiJ1L/V3WXcTwPHLT8q7FFbt+xqNlCPq39AMKME3Z4j3dU68okgKNawHSSv/AmV9HjgZ7GwOOmFT3qvwRfZcDFGk4IDGnMnlgcaIngDhCn16/2l2L0csSn0OYpiFRjkm5mfIt8+kSuG2FO1WECyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::5) by NT0PR01MB1135.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.43; Wed, 11 Jun
 2025 07:49:00 +0000
Received: from ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 ([fe80::3651:ecde:eeff:e364]) by ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
 ([fe80::3651:ecde:eeff:e364%3]) with mapi id 15.20.8792.042; Wed, 11 Jun 2025
 07:49:00 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
	=?utf-8?B?Sm9uYXRoYW4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Broadcom internal kernel
 review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
	<jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Damien Le
 Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
	<michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam
	<mani@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-arm-kernel@axis.com"
	<linux-arm-kernel@axis.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: RE: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
Thread-Topic: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
Thread-Index: AQHb2pgQVbcG7PNgJEGvLmECbqcfNbP9lBfQ
Date: Wed, 11 Jun 2025 07:49:00 +0000
Message-ID: <ZQ4SPRMB00018B4570A6C7FC24EBFB85E6752@ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4SPRMB0001:EE_|NT0PR01MB1135:EE_
x-ms-office365-filtering-correlation-id: a1c42e17-8e41-4cca-8c21-08dda8bc6d96
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|41320700013|7416014|921020|38070700018;
x-microsoft-antispam-message-info: 3kvtqbtf/Oxid2MMCXR3wRUn08BKaBEeMF8iTN8aO6JohyMlBFuY8p1AV7Tl+cAQlGpjGbHoZMBOKJh5i2pvNrifD5VA7VgWd6lq4rjExaOgonsx9IZzw8wbkKBPSi8f/mPSDefnnyi+NuImMfwFk3cqroeczSDEsBspl/uN4kBdL1jJrs4owRjcEU+TzjkU9moN9oaiw4rBq41xLejS8c09GBxXyylh5Wo+74pmdX51BU5pv53/0VIBXr3/dcb03C3qgfxczxl/SDKtmCDyfc6YGphUTn8R7c+JQXJxHMWZpoqXqg0CkqvfDRBf83+va2MFx5ln4Ti1mzFJejJO9fKzpAK3eyxuJjjmj9xCpdyQGrfdDX3xRVUFZBpk7KF5NUv8dhxusWh4uQCOb3CWKHhsNj3HHuFIncXEF7qBRxJMNGPpig7+BX5N3+UVxOQ8QofBc9bqgZJlFfD96EdqJ74k3sd1WcNwrMQOSYqRoQaAx4b0dYCtEJxRyhfUHA7hdMfjiSYnIyP4SaR5sqUg36Q3/IWYi0KM/LVG9wIknaBXYkn1NjLTu6IsZdNUx2A6otakXDDZ2dnHMqfTJrFvG/oQWDkk17Q0FRzx+znbZz8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXBQcUVlMmZoV2owTEJsZ1N5enVhbWp4R3N6TFdzMERWQmJqenJhaDd2YkhB?=
 =?utf-8?B?VnZBYVNwR0xpVzcwYWVHRjgzTDFQY0E1ZDNVbEdrZGdVaDRFV2NMcVBTK2Ru?=
 =?utf-8?B?dWN6SkMrVk8yRk1jdi9ONDhScXRnbWdPYld0VFg3YkJ0eHJLbjluWDA1aWxi?=
 =?utf-8?B?VVQzRXBFYmxBeFczRmpDb2JlN2h2VHdLVmZ1QWhPZVRwTGFTY0F3T2lKdTc5?=
 =?utf-8?B?YXdtdHdVNXFkN2pXWFIxUWlrenFXVVBDOWtLNGpPSGNma3MxNzRSblFDZk5W?=
 =?utf-8?B?b0pqUGhOZy9uRURzU3psZGRIell3aFBXMmtCdlZXZ2ZURGZjVmlTazR2ZElI?=
 =?utf-8?B?RjFSY1ZrTXlFVEpLSmxWZ3F2Zi9kMndkSWx5TnBUUVl3akxENkZQT2VGbCtC?=
 =?utf-8?B?bW9WZG14QnVZa0g4VTVSOWtlblVVa1hmcGozNGRmazJNbnk2TmltbEtWb0pn?=
 =?utf-8?B?b1lBcE5KSFNwNmExTUxQcE9Ha1B4T0VIdm9RNURNdTZhYmFFekp5SDNWUXI4?=
 =?utf-8?B?Y3ZnUytURDlFQ3k0TzV1M1NIcVpwRWZseTBhVTdIK1hZY3Zvc0I1bUdWSGcy?=
 =?utf-8?B?aEJsczI1OFFyelY4VnVmc3J4TlF6eTNDeUlMQ1Q1MEllRUVxS3AzWVRRcFE1?=
 =?utf-8?B?N0JRVVd6aXpzQm1pS2dHblZ1UGhZL0JYNGUzWmZub255MUdOd3h3SlFpRmc2?=
 =?utf-8?B?aWtwUkZheUZFbnBpMUtqRVV0NUhrU2pqODVPaGRxVHZEWmxpdVRvZ3A1U2pH?=
 =?utf-8?B?Z2hHUUEyYTFRWUV3aHlLZTZsbGFOYVlIeTEvZ3VOdmlOdFVGNTNERHBLQ2JB?=
 =?utf-8?B?dmZXOTQxc0JkZjdxOWpuUFhVRFl3WDRleWM1bTFmdjV6Rlo4bGo1R2o4MXo4?=
 =?utf-8?B?OC8wVVNvK3UzQmZYZFM1U3RoSTNEaUt0OHVCTUljYmRPeFVWNUs3cUxrRm4x?=
 =?utf-8?B?QmM1aGNqNDY3V2lyMmdnS3d1T0ZSb0ZFSmQxb1haaW9kY2R4aUpnMTZjYlhO?=
 =?utf-8?B?aFlGRzhoczlVOHVwUm5uaUtHZGxwRi9uUzVaMU5kV2t4bnRnYXpNa3YvWFFI?=
 =?utf-8?B?disxd2ZEY1dEUnhHWS90YXlpZXFMUnFFSm55QTJ5NDJzV2pkczMzdWlsNlRz?=
 =?utf-8?B?MlBiRGJtN1cxRXE3T1BSZlZUaG84WWpocmJGT2pkYmxOWUhTVXJwTkQvZnpn?=
 =?utf-8?B?UXhzWEtXNlNmOVBubjZLaDFxNjJNQVlpV0Z5blkzOHB2R0pLRXhhNU9HNGND?=
 =?utf-8?B?azdwQk1FVzFBS0F2M0l2V2pSbFl1RjJLU2xqS0xJNEc3ZWZrOFZmdlExTFFQ?=
 =?utf-8?B?NEVLRmkwV0dsYmQ0V0JXUmwzOFpraVRPRUV1MDgrZmIxd1ZRRDlaSHIwSHhH?=
 =?utf-8?B?M21MNzNpRDhXeTZQMXJKWTRVMmxmYkliYU44U3J5dCsxeWZVeFU2RUJXUGpo?=
 =?utf-8?B?dGk5akhYMUpCUWUvQXYrd3VLMEhROGZ0dHd1R2g2MitNNjVScFVUNHR4RzYv?=
 =?utf-8?B?Umt4djRNai95TVE1R3hVbWZmZHZWL0pkcDVyL0Q1MEFRL3hGWnlsQTY3a1hF?=
 =?utf-8?B?NUJRQXBWMS9vM2NMRmZ1SmY3L2hXVE1ZdnhkRVVvZFMvcG9QSkpqYzVIeGJE?=
 =?utf-8?B?QThPOVhkT2NpckJqUkM3ZnpiNWREZ0ZtSGtDZzJNWWFxVnE5VU1DVHhpOWNW?=
 =?utf-8?B?bWNSNVRlTUhOY0N3cXluY0tWd1hlQTErb250TXBrb0ZEbXNRRGJQa2g2OUIz?=
 =?utf-8?B?OWpNRGVnNU44aEZHeWtUeHpPdU9zejEzc1V1TnFpVFp2OGdURUhVSlg2NktU?=
 =?utf-8?B?eWNPcW5RekEvZG11QzZPb2R3TStFYmhCZ2d5SC9jWnNMSHNJOVQvSjExUmlm?=
 =?utf-8?B?b29PZG02dWYxd3dwQ2J0ak1mdG95MkN1bnZrdyt2RUVhWXcyUkEzVUEyU3Zy?=
 =?utf-8?B?ci9qd0dPcUYvME5leCtzeUdUOGVEcTA0NDV2eHB3SHdsNC9seUxpVUV4N1Fp?=
 =?utf-8?B?Q3JBOHlzSkJma1BGbkhmcjlMb2hRQlliRzlQdW5KUUJ5VzZQQnlxUTYyUjFa?=
 =?utf-8?B?bjY3aG5pS1d5eUozYnc2bFI1YzVEblREaEkzcnR3Ym8xaGw3eTVPN1ZnalVT?=
 =?utf-8?B?WmRFbjZQUm43K0Yrb09Fd1N5VTVaWnV4cUFtSnJIRForS25iUlBFenBLc0l4?=
 =?utf-8?B?R0E9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4SPRMB0001.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c42e17-8e41-4cca-8c21-08dda8bc6d96
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 07:49:00.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yk/eSAAKlMEL6D8tj50NlZFC2wJQ5YzVFAidD7WbDURu7KJqDL6rknmBDccrQ56RtyvP651FAGii23jofqT+9eU4y2ZPaV/z/gn8jMVxpXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005031_967906_DBF40882 
X-CRM114-Status: GOOD (  14.09  )
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

> On 11.06.25 14:14, Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if no
> Starfive-specific pin control Kconfig options are enabled.  This allows compile
> testing on other architectures with allyesconfig.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile index
> 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f2
> 29a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
> 
> --
> 2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
