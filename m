Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD165CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUMhHrug2Ecg85bauexG/uxQ26T3Js70fmCy9iqqA2E=; b=Wx5LvSq4mudCCF
	6yE2juM7pq0AmTANu4skW/Ey8KiUVbhPEwnxXEOO9ht1IR+xnmZwy7+1R54wRQUGMXvaN5LlPwWs0
	Phyx5YZInabNhTGPG/UfC06Rmt+ei+uZgQPK5c0r8dWReGhmkgxcBzZ34q5vqSxm3LYVbJG42yQhC
	X0x0SMnZaXS+Z3vv2lt72fg2/A80P2V4pIBhl3BW7fAAc0++1OaJCESi/094XY6S2qt018jax2uv6
	bS8kxFbfOBo903VIDPtqEmF9hQWxy16ft00psNx5ekTH+IS5gCH33t6hnGEPYDlJ60xAz5T+aQ0XQ
	WNyM6FPp9JhjrAS9FREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvIf-0000000Ebsx-0BK2;
	Wed, 03 Apr 2024 07:44:49 +0000
Received: from mail-bjschn02on20718.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::718] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvIa-0000000Eboo-3uiY
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 07:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmahqf0E/V9XUsvrM4NCPz5uU+civopkvzH2YTl2muGqxttUJOosPP5ozJ6e/gvECIDFwIID7Ig18vaqILZFjv+gram+8ntXsDMW+QIaRoq/Ls0oWOh4vCH58nM3o9k9Rgc/Ed3gWiuDC3jcwck0P6jn7l4aGz23xWtA0uc53L/7Bl4ad0VG5AgR+WCLGmYs3RkiWqqMdjk64zZ4mZSJjuD8ko9NuTf6GqvAi+cc7P4Awae+ka03sgDk9mgu8uRKrdGkJDZsHPj8eZ8EhztdWGGpbZByZWv495Ss5YWGmu5MAtiLr+FyClfyCpfmBGyRPbbMH9HhD2blbTwA1n3jwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2/VYjL8+3n+GjD1ETA75SEdhuxr9kuJQinwlENNJFs=;
 b=StBxjoWQ48Zw2oUcARDf4zuyN4E+stv0zXOOAsSVNpzyvtb05SdNjdFB+Ll2dNjcdEMAGfsFaf6h57HE/nbjR0Y0+bNzxbiDdhDHZ1lIKYjnfEFA25HX4BKKRGRjNI6+cN4jI7T93h+c/rClZ4mEeJbvBpoXieXvxGkI/DTAvVKivtS6BLgDmLQLTUDEX2f3h2paE0t29Epb3WgN6XVdXap+4V4MsVJT+AIVd34WPe2TtPbN1si9OzUOMOjVo47HWhybmJdbZpwGnlaE4RSL8/2MaqMtbNzqu3wK08ltLei8SAlm4mHcoH4MVLC2aIxmAfLR8wTTdMdakqJK610gSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1114.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Wed, 3 Apr
 2024 07:44:36 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::9a50:2c82:c5d4:2b3d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::9a50:2c82:c5d4:2b3d%4])
 with mapi id 15.20.7409.028; Wed, 3 Apr 2024 07:44:36 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Conor Dooley
	<conor@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng
	<hal.feng@starfivetech.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Topic: [PATCH v3] clk: starfive: pll: Fix lower rate of CPUfreq by
 setting PLL0 rate to 1.5GHz
Thread-Index: AQHahN18qtXBKBZlXUquUnYUH2QsmrFVKPiAgACsqfCAAFBPgIAAA5cA
Date: Wed, 3 Apr 2024 07:44:36 +0000
Message-ID: <NTZPR01MB09566AB865A0266332268DC69F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240402090920.11627-1-xingyu.wu@starfivetech.com>
 <8d21b1bc-9402-41d4-bd81-c521c8a33d2d@kernel.org>
 <NTZPR01MB095662C4A6FCAEB7B35C48FF9F3DA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <bcf12c0b-d569-4d64-adfb-bad053c182a8@kernel.org>
In-Reply-To: <bcf12c0b-d569-4d64-adfb-bad053c182a8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1114:EE_
x-ms-office365-filtering-correlation-id: 6a8f81e3-fc2f-4b34-4548-08dc53b1e94d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Re+irz25jQxh6ToxJivlA2P9uc4YJlXfP9LkfCbSQ0+SasNuwef/PpoME/2PuUL8hMziq2ox+eFcCGe6VqpPJxfjZ+cBwKBuJZm0sIwHjtgADnh9FrEtWIncESA7emXOlH87JrCl6DF9HFKCWCiuOGnD78XQCgr76U5xR0LUV4ImcFYBIi1R47yVE94pY3c+YRwf0l/fn7NCWA2D1bII4iW2uYSHGUoEPs/cFSxtLani7bM69Vt71qMYML6yT6yne5c6fifs6LrBCZEpjEGGoO3KRR3zj/kpgDKxCAKW9l1Rb9CjkFB34jH0C1kL/cQVv4CgaNZ/3hpaKek5rKPVov3uYHFqZIK767t8xusTMDU3sXCf7TB8k6XqroX7xlaOI+nN2TZ5shq3jiO2nlAMukaIlTdAEHUeW5V4bM/Qk16/PWF+BeeQ+1W+h8Yl/aBINXcEfOR2fAddImE5Ue5JCzzIKR6RVAij6EnZAM+gadUwYebIkLaHdrkiTGlOFVXP6G6zwkigNVgPqxRuYSFjJfmL6IcsmjVDPYbT5Ttfsc3td/w9utmGq3fSIA+TTHNAEme51sMcxKxAf0n1gQsMky5LE6EKNkRmhDDFhD3MdPJwcAkcWp/3n1X1HlXfUBep
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmFoYVpBbUNwY3UyNGNrazdycG5uUnp6anBKOTBGcXFVQVpkNlFXWVREZ1lC?=
 =?utf-8?B?UThnSVVZK1VCSkhCeFJVUW5aVFhnbU5HSHV4b3JVV0hQYThEc3hxSFIrRksx?=
 =?utf-8?B?YngxcTFUMHR6L0lRcEVNcWp0TDlha1gybnJGTW5mbm9wRUdyV1dhTk1rQUVH?=
 =?utf-8?B?bFV2eFh6SldObGo5dUpmQkduTW91RkUzcVpmTG9oMkFXWHNuQkh6V3FNblBH?=
 =?utf-8?B?TWtaSTVKRSswL05vbHRKOTJhNTVkK2x0dU1mYUxOOHAxekdJdVJuZXhIVkhB?=
 =?utf-8?B?UkFFRTRVbFlieHRhdlBEc3dCNllMeVFQNlgyVFJnUHBLcmw0MmpHU3pySi85?=
 =?utf-8?B?bDZjd2xHU2VPSkZoT0lFQ0Z6UkZ1TVp5V0pjSTY2aERGVldRYWJDY2JzUmhm?=
 =?utf-8?B?Mk5jNXM3d3F5cUtpazFoNUhhcTdYYVJLaHdoNXRxNGlmdDErYkpnVDBDWnYr?=
 =?utf-8?B?V0xwTXRCQ0gvRThpYXczaXJnV2taT2l0czhPc3RMU2VQWm9QZmRja0tKQjRp?=
 =?utf-8?B?NFhDWEtSQXZBdk9VVzd6V3pTSHJDanJjU0xjQTBaZW1ZMEZKQnFCM2NjRWIw?=
 =?utf-8?B?QTVSUEczbjl5ejU2WVN3Q0V1RjBWWFJDYnhSWG8wQ09IM1doWFcyNnExUVZF?=
 =?utf-8?B?VUN3TUpKUFlJckNsRDlvMkhQSFlsUnhpd2NzMG04NC84VnJteTJHNEJxdnVL?=
 =?utf-8?B?UmFXbEZpREZMaFdEU0Vvelc5eWZNZGpnazJLTGloYjl5TEpVRzBpWnRpaUxD?=
 =?utf-8?B?ajh3MWpoZjM5dk94NFB3cmJzOEhoMFFxY09KdzZyWjdxZUZkZnNuclRZdXZL?=
 =?utf-8?B?bU9UZ1B1bndYcnlsWXJaK0RIbHM5VGVzSXBsU0ZXWlFMNFArTFFVT3FSQVJw?=
 =?utf-8?B?RDc5bDY0T2ExVWVBZS9uVDhSVU1FRUpGOEdTanBUem0rQlpDVmplT2tQV1oz?=
 =?utf-8?B?VWhBTzRQM1JQeTZEaWJ5Z0ZYNGVDeFFNcitNeFk3T25vT0NpWEVjSUdYOG0x?=
 =?utf-8?B?RjRxby9NMWlxTGpFU1EzdnV3TGx6YmNkVE50VTlaNTNQN0xQTWwwSXJWTmg5?=
 =?utf-8?B?eXdENHl0eW5HcmRQYVlHNHh5TlU5UHVZcGFYNjgwMW84bWVQLzJ1RnFsVkI0?=
 =?utf-8?B?cnpWSUM5MThyTTJDR1JJbG9ZSGZTd056MFVaanh5Wi9JYTBzbWlva2xMd0Nl?=
 =?utf-8?B?dHprK3MwQnFJdEw5akgrQ3h4S1p5SU0xNmFpanFFTDZLYk1ZaWZPK3VHb2s2?=
 =?utf-8?B?dWxnQUxERG1UUkg2YkdxYTRRYTRqMitYNHRvNWFHMHB6RFZqL1ZrVFZRT055?=
 =?utf-8?B?T3owdVNpakRIOGZQOGY0UkZ4Y0NBWnFkYjVzWmRidkZKYkp3cmZjODVkNWtv?=
 =?utf-8?B?dk1YK3ZTOGlMOXo0Q1k5TnVzT2xsVUhDQTNaRU9NRXBWVzNVRExpVGVWWjZB?=
 =?utf-8?B?MUQ0c0xGZzNDN2kvRjJaWVA5SG9DeW1QMmRGUXQxb2E1OEt6c3Jia1E4QWJz?=
 =?utf-8?B?TC9mbVdidjIrUVJlK25zaHdKTTlLOVRSU1pRZHA1L0Q4RjY1aTJNUVZ1TTla?=
 =?utf-8?B?ZHZvWnZRNVdwVGVoUjRrUDQxVlhaaUEwbzViTENzdThiY2VrZVc2ZTUzYTI2?=
 =?utf-8?B?QmFKSTJxdEloMDg4RjZoOWdUR1k5LzQ1MFBLajZyNGFGYitGc2JacnAzTVJ2?=
 =?utf-8?B?M1g0eFRhenpmejFNWHNOQytMcmM3Yk9NS1V2MFM2YzYyL2JJUWQ1RGhPMGEz?=
 =?utf-8?B?UERVUXBXVHFmMXB1VlB6MU5wMk96OC9rQTQvcGxBakljemkzY1R0ajhNcUs2?=
 =?utf-8?B?bHl1RWoxQkczU01KRHZjME5FeDdGdWNNbmRNL2hiSXhBYnBkUlY5UzVPY2dW?=
 =?utf-8?B?S00zZ0hVTnpiYU90QjlnWTZKcXFTRDVxemsxVFZtTlhJa2lQdXlEUVAvcXFY?=
 =?utf-8?B?aFJYUlZmdG1uZS9tTlFJNGhXNE5XQjN0WEVJTzVnVkRSdUlDRHFmL0o1cG5E?=
 =?utf-8?B?TFY4NmZ1TWplT1E2MHg4Y3RlUzFsRjVVU3hmaGptZ2ZtNW01VkxjbnEzb3pY?=
 =?utf-8?B?bVAvM0dmSncxQkRDbi9BN09tUk1yVzh3dDFkc2FkRFpLWTZrdURxNVpxOStF?=
 =?utf-8?Q?3Iun1j9AhUOQSvstHLVnwyhqQ?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8f81e3-fc2f-4b34-4548-08dc53b1e94d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 07:44:36.7969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpwxDD6PRE8p1fqLUR/iIHwPu7IqxAbVa61DJWLfa42XUHRMmnpcnU8GcB0MTs6ACV5e5tvpgN4l3q0W7zrh2rIt657CPkzhrxJdyZHyJTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_004445_001367_594607C5 
X-CRM114-Status: GOOD (  36.65  )
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

On 03/04/2024 15:24, Krzysztof Kozlowski wrote:
> 
> On 03/04/2024 09:19, Xingyu Wu wrote:
> > On 03/04/2024 0:18, Krzysztof Kozlowski wrote:
> >>
> >> On 02/04/2024 11:09, Xingyu Wu wrote:
> >>> CPUfreq supports 4 cpu frequency loads on 375/500/750/1500MHz.
> >>> But now PLL0 rate is 1GHz and the cpu frequency loads become
> >>> 333/500/500/1000MHz in fact.
> >>>
> >>> So PLL0 rate should be default set to 1.5GHz. But setting the
> >>> PLL0 rate need certain steps:
> >>>
> >>> 1. Change the parent of cpu_root clock to OSC clock.
> >>> 2. Change the divider of cpu_core if PLL0 rate is higher than
> >>>    1.25GHz before CPUfreq boot.
> >>> 3. Change the parent of cpu_root clock back to PLL0 clock.
> >>>
> >>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> >>> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for
> >>> JH7110
> >>> SoC")
> >>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> >>> ---
> >>>
> >>> Hi Stephen and Emil,
> >>>
> >>> This patch fixes the issue about lower rate of CPUfreq[1] by setting
> >>> PLL0 rate to 1.5GHz.
> >>>
> >>> In order not to affect the cpu operation, setting the PLL0 rate need
> >>> certain steps. The cpu_root's parent clock should be changed first.
> >>> And the divider of the cpu_core clock should be set to 2 so they
> >>> won't crash when setting 1.5GHz without voltage regulation. Due to
> >>> PLL driver boot earlier than SYSCRG driver, cpu_core and cpu_root
> >>> clocks are using by ioremap().
> >>>
> >>> [1]: https://github.com/starfive-tech/VisionFive2/issues/55
> >>>
> >>> Previous patch link:
> >>> v2:
> >>> https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfi
> >>> ve
> >>> tech.com/
> >>> v1:
> >>> https://lore.kernel.org/all/20230811033631.160912-1-xingyu.wu@starfi
> >>> ve
> >>> tech.com/
> >>>
> >>> Thanks,
> >>> Xingyu Wu
> >>> ---
> >>>  .../jh7110-starfive-visionfive-2.dtsi         |   5 +
> >>>  .../clk/starfive/clk-starfive-jh7110-pll.c    | 102 ++++++++++++++++++
> >>
> >> Please do not mix DTS and driver code. That's not really portable.
> >> DTS is being exported and used in other projects.
> >
> > OK, I will submit that in two patches.
> >
> >>
> >> ...
> >>
> >>>
> >>> @@ -458,6 +535,8 @@ static int jh7110_pll_probe(struct
> >>> platform_device
> >> *pdev)
> >>>  	struct jh7110_pll_priv *priv;
> >>>  	unsigned int idx;
> >>>  	int ret;
> >>> +	struct device_node *np;
> >>> +	struct resource res;
> >>>
> >>>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >>>  	if (!priv)
> >>> @@ -489,6 +568,29 @@ static int jh7110_pll_probe(struct
> >>> platform_device
> >> *pdev)
> >>>  			return ret;
> >>>  	}
> >>>
> >>> +	priv->is_first_set = true;
> >>> +	np = of_find_compatible_node(NULL, NULL,
> >>> +"starfive,jh7110-syscrg");
> >>
> >> Your drivers should not do it. It's fragile, hides true link/dependency.
> >> Please use phandles.
> >>
> >>
> >>> +	if (!np) {
> >>> +		ret = PTR_ERR(np);
> >>> +		dev_err(priv->dev, "failed to get syscrg node\n");
> >>> +		goto np_put;
> >>> +	}
> >>> +
> >>> +	ret = of_address_to_resource(np, 0, &res);
> >>> +	if (ret) {
> >>> +		dev_err(priv->dev, "failed to get syscrg resource\n");
> >>> +		goto np_put;
> >>> +	}
> >>> +
> >>> +	priv->syscrg_base = ioremap(res.start, resource_size(&res));
> >>> +	if (!priv->syscrg_base)
> >>> +		ret = -ENOMEM;
> >>
> >> Why are you mapping other device's IO? How are you going to ensure
> >> synced access to registers?
> >
> > Because setting PLL0 rate need specific steps and use the clocks of SYSCRG.
> 
> That's not a reason to map other device's IO. That could be a reason for having
> syscon or some other sort of relationship, like clock or reset.
> 
> > But SYSCRG driver also need PLL clock to be clock source when adding
> > clock providers. I tried to add SYSCRG clocks in 'clocks' property in
> > DT and use
> > clk_get() to get the clocks. But it could not run and crash. So I use
> > ioremap() instead.
> 
> So instead of properly model the relationship, you entangle the drivers even
> more.
> 
> Please come with a proper design for this. I have no clue about your hardware,
> but that looks like you are asynchronously configuring the same hardware in two
> different places.
> 
> Sorry, that's poor code.
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

If I use the old patch[1] like v2 and set the PLL0 default rate in the SYSCRG driver,
will it be better?

[1]: https://lore.kernel.org/all/20230821152915.208366-1-xingyu.wu@starfivetech.com/

Thanks,
Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
