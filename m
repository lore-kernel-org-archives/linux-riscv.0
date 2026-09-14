Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6772EC88E5C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 03:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2Im9NlHebk7MAC4MkZusB1IbaUzCpKEdIPK1ErIKMY=; b=4snGgBVngWumIM
	6kPauPeCldkNHu2aMZwWpxkjXCIz0YbnQ+CZZiF4VK3j5xXYz8ljHM8m/59WW2X0E5hWAfkQz4omQ
	smsbYtx5oqj3kBiB1Jbjp7lc3YIZLD6DoSHoDAw/tVnJYTQWvyomTuvggxDL7q78qzBIl4DZ6L9RT
	EyvPkIfXD1rGOoQ4GDpsvKQFZxs/+A/AvaNLlz2QC1QnW1E/wKEuLz7WGQKMv0eSWva6fKF5jvbno
	evHU2JsNBTmXpz4aC3088JYOFL1DKZpZ8e/BAZ5TssPohqNGHq54hmFZySZsKYrBrPCp72A5Oiwm3
	wdrPtns+YC/aqyc8hSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wyI-00000002Ek3-2rn6;
	Mon, 14 Sep 2026 03:03:06 +0000
Received: from mail-bjschn02on2103.outbound.protection.partner.outlook.cn ([139.219.17.103] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wy0-00000002E6M-0Ww0
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 03:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W96VGio5qOmELwW/bmqm9N0eJqzMk4AfIymQaA4i43+QzkJ5KxfmpDKUoCtsZklqbA7BOcYIIXAXqzPrTEEopR4oydnyRIlv83lUck1377Xh925TYatr4B6Jy6ZP7VvzpLrusNAtJi51pjcsT8vydyGQlv3/IDUPe2+XR2oeeUo3oMAqKY38y0MVlDy4raD7G8Ex/TLllJBOTyU9qy7X8dwCXSJ2qzx7It1YzTWsNbx8g0K2ohtMvW3B0MY4uRPLp3pk3x8QAiExWhOwPged3fyJfaLOINC9x52j/JsW/uWbR1UEeSXQ3iX2droV6qSmeYZsgYWFF/qaDqKxBh8tbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hfGUpYNJPOndUHP7AvyATyJK8X29LlkPo9Y88enw00=;
 b=i4SSMxiypDCFDVD/eMRj2aN3tAn8EUH9MpEecCpCsfWV4VNz1OLFTCfgDmncTxAY2ptvi4T/dvweLl/pswoACDh5NLBcBMZChMP6tBQ0wZBsNb/akAK5X8qc/+TyhKf1SqoQaymAnL+Uz3HzSGV4kCaJ118POI75cdhbb+GZDxPlU9DwBHHD6P3BULpvA6cNCtab/jgQdplUFJLqp3QSiyUy49f6f476PWQ8I6h+h55ExjGcnPI4UQFTesaZ4BEL4hyoweZjKJS9AVUu9Sf+HsmV/VmBriRWPmcVjLTAe+Fi3HN64oo9KkI7AYmHQsazU5OsTB1itCB3rFkU+V4JSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1152.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 03:02:01 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0406.007; Mon, 14 Sep 2026 03:02:01 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Maud Spierings <maud_spierings@hotmail.com>
CC: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor@kernel.org"
	<conor@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "emil.renner.berthing@canonical.com"
	<emil.renner.berthing@canonical.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pwm@vger.kernel.org"
	<linux-pwm@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"pjw@kernel.org" <pjw@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"ukleinek@kernel.org" <ukleinek@kernel.org>
Subject: RE: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Topic: [RESEND v22 0/3] Add OpenCores PTC PWM support
Thread-Index: AQHdKHVcUHYiMwEYKEiLBGQTFfpjtLbDp0+AgAnuyqA=
Date: Mon, 14 Sep 2026 03:02:01 +0000
Message-ID: <NT0PR01MB110215832CD3F81372D96302E6BB2@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
 <VI0P189MB36879B75BAD80D203B6390C8E3B22@VI0P189MB3687.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <VI0P189MB36879B75BAD80D203B6390C8E3B22@VI0P189MB3687.EURP189.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1152:EE_
x-ms-office365-filtering-correlation-id: 1f34906c-8d78-49f0-6a4a-08df120c8ca8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|22082099003|18002099003|38070700021|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: lA2Vk2GkGaB1FbeCJLD1VSVL9tZ72rphHsmR8+obVlhXp1Bh/sj4u54P9ifwwKfTACE+A39FUWulX+OqOQi51SK2XfhTIk47jn3GEt5ykFs0G9r82HRxKrwLQeStrMnMcFtaowhFqeyhEyzrFMmEB1wroHV3UMNf2dIE9fWLsHPFsYFIy+vg+C7tNt0i6O+DkHzU6aX9ikczhTk5yryNhXeLPQR31YmCgfzA2aLpnlgbGiT6Hp4xO2x4vMrklZdRD+UUvV08KNphY6ms4O4Im65ZfuU+rmamcTosElIu8NgbIWHt3CbgNQjtDaYrHTp0oOsumBSpYZPaDwRQtGjMu74ynIzcwd5WbSc1XNdJP8AmK0z7pMBwbYndbdgkjdAWMLitYLWWwIsRIXEGIi6bscNZb3FCwueGnNPvU8RR/7YR0uLlVaaH7QbgCHjgpZrlXuiRcHovu++/Jsx3gbjwiqhELnJ4RTZ7aMdKRVmbzoD+y8LR8BqvXVyEEmCSSsIgmbDZO6p9zoDNuLjSjW6MeOjSS0uMQiwI32x+BDxP9Ovybh5+vULn66joMs4Qha2y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjVjZVhVcExGa0Q3S3FPcE9BNkovQTVlYlM3TzlDdFdITkN6eXlkdFFra09O?=
 =?utf-8?B?a1VrNkRjRTNRZ0Y2YldjejhmQ3ZMd0VKMENRdWJCNXdCc2dGZmt3SkgrV1BK?=
 =?utf-8?B?cnA0VTNpL0F3YjRtVVozeFBrR3BaeTVRcUQ2azJjdDVKTEVJWHBkZFdGT0JJ?=
 =?utf-8?B?QVpLNHhIbHZXenJpUVBLSWx6VGtXaFFOUmJ6UU9ETjdqZHg0cmhKa3pMVVda?=
 =?utf-8?B?Z3JpQ3Q0akxiSTNtNVlaaHhYWDMrTC9HNTJ2ZXoxTkh3a1MvMS9PSURkMklY?=
 =?utf-8?B?aS81STF4Y1hldENXM3FqRFlYd2VzdTBRVU9WWjhBbXUvNDVZdy85b3h1M0Fv?=
 =?utf-8?B?cG0zYUZqdTlwdWpZV2t5QjJoU1JwcnpkQU9FTXlBMUtFaHNxcTZXeFhabFZV?=
 =?utf-8?B?Mm1UMmJqTGQyU2FwODVPblNKVXlRaWs3UVZBZXpkRHJ3N1NkYnA4ZXBDYnBU?=
 =?utf-8?B?emowQ1RlSFg5cE9mNlFDYkV0bVhqVTI4NElMTjJYM3RTa1grb0JHcDk4UC85?=
 =?utf-8?B?cE9DWGZWQW0zalB4TTBQck12OExMOERlb0VWSllaZVJjOC9LWmg1Yi9xSTlm?=
 =?utf-8?B?b0xGM3Q2U2FSSHhsdWRtdGFjZlhENDNvSkRzZllsMkNTY2lFSVBNUmhtL0Fr?=
 =?utf-8?B?Vm9NTWtqNVRjK0JmQkpUSFRyaEltTWJ6WXo1Y3ZBcERnMVcyM2p1a1g3c1ZH?=
 =?utf-8?B?ZlJ2bnlPTVdvdXF4K3Y4R2JseE0yczdYMzN5TWVYZ281a2pqdTAxS1NhTVU1?=
 =?utf-8?B?NFpRbXZhWndXemVlYzlGdlViUGpEeXk4ZW5IR1BKc3BsNEE1aGg5ZlBSRWNV?=
 =?utf-8?B?amx6VEtURnNLZ0xOQVJnbkFDZjZLdWE4QVZySHVjRG80OE9vbEk0K1YzVkJl?=
 =?utf-8?B?bWtoV2Qxb0dNUGhNeHVmd3RPTHRIUjlEWDBFbWIreVZaS0pYanRUKzFocXpG?=
 =?utf-8?B?R3dwV3R6L2hibXV4NTYvV3RGa3Q3c1lSN3p6WGJEMXNrblk1WUZ5cURYZzhl?=
 =?utf-8?B?TnE0VVNrbEVZcmh3alQ2c2RjVWtMTEEwVDdtWEt4TkJ1aTUyc2VCT295UVdv?=
 =?utf-8?B?OXlKeWo0NGxmNisycDBXaUJTa3l6dDVTYmh3VEtIWVVmV0E1MnBNVVg4dEp1?=
 =?utf-8?B?M1l3QzJpa0ZHbHFmbk1NUitnZWxMaVAzZXlRYm8zVytWYjc5TGlBZDROR3o3?=
 =?utf-8?B?TXBPNUkxOTNacmR2RkNLZ1BoK0NYZWMxWUF5Q0pRKzFZY3ViTEQ2YVhvQWVi?=
 =?utf-8?B?RWdzRXp2WVBJNXJpQXhSWWFmT21TTVFRbFJkcVI4c3M3M2RHT1N4ZmJ6cjJS?=
 =?utf-8?B?RGlDVnlHbmw5a1BHdFhjSkhmSG1lK2hUU1hwendTTmVCRHhUMnFLU0FXVXY1?=
 =?utf-8?B?bG1EaXAzNERBK1U0ZElWcU1hOENhT29zbUpWdzM1WlpPZFhkclN6eUNJQjRm?=
 =?utf-8?B?SGlQckRBZ0RsejlJdVNCNGh0L1BUcnBoVERENFkyYnl0MHZOT1VScVE1TVNh?=
 =?utf-8?B?WHAycVpUcFR4RHlGTndBNmR6azJpaGlZTlpScHdxUTZMemJiaHhTKzc0YlBm?=
 =?utf-8?B?ejlUWGlYUDZoM0lsOUpnMVdvMU1qZ2tQd2V2Q2M1ODVONU1Zb1QwQ3JZQTlO?=
 =?utf-8?B?aHZiYmtyMGJTNDRoSTRLWEVuZVdUanlYaHp2Rkkxb2V0K2Ewc3VnUkN3K2ZX?=
 =?utf-8?B?RHBHa3M4TExEM1hSTjZFbUZUVGtUbUIzSTNKKzgvRERoQWZndlNjWnRUZ3JY?=
 =?utf-8?B?T0pyZEFQaFU3NHdMMnpZNWpQSzhhZ09zQ004ajhDYzdIdjROSHNtejBOdmlJ?=
 =?utf-8?B?QnYzMmJ3QVBNUGw1eWpSQ3dZUDNiU1JoT0tqZmVnQ2xBVUo2S0ZONysrREVz?=
 =?utf-8?B?SFhHVlE4ZXovUUl6eFhsUW5jYmdkSGlhak9IY2dqbDZaSXdGeUp4MXBHcXI4?=
 =?utf-8?B?akdzc0pCZ1VXL1pMaTlDSzR6OThmRXVHOXcwTGI2dmdDRGZGT1I1Q0VXSjBz?=
 =?utf-8?B?SzFzMjV4aG9aRk1sVnpyWlAvamdYWkRJaUNQcG5veklqZnZITSs2Znp0K0k4?=
 =?utf-8?B?OVRZNVBWdUFhc0Q3b1diRm02aTYzMUxEZXJHaVpkK1QxZkQwSHpERHVub0ht?=
 =?utf-8?B?dFMvY0djKzdveVFjRkpvTzg0aTVXQUExd2VEY2tURGhkYy8rRko5bmp4MkNO?=
 =?utf-8?B?UFAyL2Jya3czWW4yTEhNVm1STTB3RkdKVEhqQ0d6aWZUM0RaaUdsSVVYSHNX?=
 =?utf-8?B?MEJPVDlCeFZ4TnRWWDROTEpNbzRRcklid3lMRE1VWFhZcy9PSjRaV1gvc1pZ?=
 =?utf-8?B?NFRIV2N4UDRLYnRWamd4MjFsS1cwcnhYQW9iZ0ZOQkJHUHliSGpsdz09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f34906c-8d78-49f0-6a4a-08df120c8ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 03:02:01.7724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6CAAukBgAywUI2EKo9wRcTmiq/UDGH0gh930Zm/nVSjtWj+iqejuAo5LRo8qyVUfiA68rvaKTaxDEGCJZMdLEpCdl2Kt9Fui4HN0kXs7io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200248_298638_8B5C7865 
X-CRM114-Status: GOOD (  24.67  )
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

> On 26.09.08 03:07, Maud Spierings wrote: 
> Hello Hal,
> 
> Thanks for picking up this series, I've tested it on my fml13v01 board in the
> framework 13 chassis. Seeing the pwms split out into seperate nodes is how I
> envisioned this driver too.
> 
> Now to figure out how to get the pwm backlight driver to work nicely with an
> inverted pwm.
> 
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>

Thanks for your attention and testing.

To work with the pwm backlight driver, add the PWM_POLARITY_INVERTED flag to
the device tree.

Best regards,
Hal

> 
> > Add OpenCores PTC PWM driver which is used in StarFive
> > JH7100/JH7110/JHB100 SoC.
> >
> > I will maintain this pwm module in place of William.
> >
> > Changes since v21:
> > - Allow non-zero duty cycles shorter than one clock tick to round down to
> >   zero.
> > - Drop the .free() callback to preserve the PWM hardware state after
> >   pwm_put().
> > - Update the comment.
> >
> > Changes since v20:
> > - Fix 0% duty cycle support.
> >
> > Changes since v19:
> > - Drop the oneOf construct in dt-bindings.
> > - Address Sashiko AI review comments for the OpenCores PWM driver.
> >   In ocores_pwm_apply(), handling disable requests first, then calculating
> >   and validating period/duty for enable requests before taking a runtime
> >   PM reference or touching the hardware registers.
> >
> > Changes since v18:
> > - Address Sashiko AI review comments for the OpenCores PWM driver.
> > - Fix runtime PM usage count handling on probe, error paths, PWM release
> >   and driver teardown.
> > - Reject period or duty cycle values below the hardware minimum.
> > - Restore PWM registers across system sleep resume.
> > - Return the real error from devm_pwmchip_alloc().
> > - Preserve bootloader-configured PWM state during probe and keep
> runtime
> >   PM active if the PWM is already enabled.
> > - Use synchronous runtime PM put before possible teardown.
> >
> > Changes since v17:
> > - Simplify the code. Make it more readable.
> > - Restructure the driver to register the pwm chip for one pwm channel,
> >   because each OpenCores PTC IP core only supports one PWM channel.
> >   Drop starfive compatibles.
> >   Add patches to fix the dt-bindings and device tree.
> > - Support runtime pm and system sleep pm.
> > - Disable the pwm module and reset the pwm counter before updating the
> >   period and duty cycle.
> > - Improve the descriptions.
> > - Update the dt-bindings maintainer to Hal Feng.
> >
> > History:
> > v21:
> > https://lore.kernel.org/all/20260701074442.7714-1-hal.feng@starfivetec
> > h.com/
> > v20:
> > https://lore.kernel.org/all/20260629063601.63917-1-hal.feng@starfivete
> > ch.com/
> > v19:
> > https://lore.kernel.org/all/20260615155759.129210-1-hal.feng@starfivet
> > ech.com/
> > v18:
> > https://lore.kernel.org/all/20260515054723.25024-1-hal.feng@starfivete
> > ch.com/
> > v17:
> > https://lore.kernel.org/all/20250106103540.10079-1-william.qiu@starfiv
> > etech.com/
> >
> > Hal Feng (3):
> >   dt-bindings: pwm: opencores: Update compatibles, examples and
> >     maintainers
> >   riscv: dts: starfive: Correct pwm nodes
> >   pwm: Add OpenCores PTC PWM driver
> >
> >  .../bindings/pwm/opencores,pwm.yaml           |   6 +-
> >  MAINTAINERS                                   |   6 +
> >  .../boot/dts/starfive/jh7100-common.dtsi      |  28 +-
> >  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  67 +++-
> >  .../boot/dts/starfive/jh7110-common.dtsi      |  27 +-
> >  .../boot/dts/starfive/jh7110-milkv-mars.dts   |   6 +-
> >  .../dts/starfive/jh7110-milkv-marscm.dtsi     |   6 +-
> >  .../dts/starfive/jh7110-pine64-star64.dts     |   6 +-
> >  .../jh7110-starfive-visionfive-2-lite.dtsi    |   6 +-
> >  .../jh7110-starfive-visionfive-2.dtsi         |   6 +-
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 +++-
> >  drivers/pwm/Kconfig                           |  12 +
> >  drivers/pwm/Makefile                          |   1 +
> >  drivers/pwm/pwm-ocores.c                      | 298
> ++++++++++++++++++
> >  14 files changed, 518 insertions(+), 24 deletions(-)  create mode
> > 100644 drivers/pwm/pwm-ocores.c
> >
> >
> > base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> > --
> > 2.43.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
