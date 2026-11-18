Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6287A606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 01:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SSAeJkje
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NKeift2PRyeysSm/P1VCc8Z3Pz8BUBJ6k6YM5bVyYYY=; b=SSAeJkjejsb3WuKDoA/zOQy561
	aHrkm+xFUovVQKd24JcEaqjwVuerclm0oxo42fwg9IP/09zENfPaTwxWDPsoffnAmSIJ1T3lNgU27
	ySO/0vsmo0yhYr6W8clfDLxUSPCuxr/tsVyGSsZymqg41pXTuRCjPw/egogFQ6ALXR+D6kScV8YL3
	tOT6/9eGqL4BRkhx3T3lec1SmgUjU6VbMEizrtaLdoCHc73xqfN+0izqwkv8FfzKam6aVDEthFMIQ
	546UheWO5S1rwTECf86bv9kyj5eJGVjQCjsNkSstaiI2rhYWz0WU3diKaAyBpNSjLDpYEXOItY0GI
	zd5JWC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUK5-00000007QuS-1qHG;
	Wed, 18 Nov 2026 01:18:53 +0000
Received: from mail-bjschn02on2095.outbound.protection.partner.outlook.cn ([139.219.17.95] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUK0-00000007QtW-1Djn;
	Wed, 18 Nov 2026 01:18:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/6BKRuM37bvU0EGjkBJzleJvNst63+lYAZrw5b/IXYBjSqaGZVPIBN42pnp44v6+SemRqW895+Q06afGafllSlW9X+hrC3B9MhfCfShx3DCfau7I8oqvxaSzY8dha+8v+EZTqH0+QySqN1IrXd9NE1wrNgiVtiXtTSNBNxxk1dN335qqJpjMaaTlCupPFjanN7OWuA0tnihlxPdYltEQ2Ix619dlmdnWD07VnifzBftl56TA+BGBetEkKnOuR+Qja7y20/PWsIMKy8vBD7GGAJHjyS9YVAl8YwXWB4xAy+T3dl3d1HjP5+l+1QWUrqZDeJiRNyzQMmJqPxwxgro/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMv0YW0NIMm5mMHuOn0rWVFkG+82wqoBV7h5yD2M7+M=;
 b=ikNQg1puCd5BD71WnUIiUFJD925FWJp0Oe4+2DlxXVqSQsaJqfpGKTwDbG1qnCqTHMoGd8PRWPWbYunk95hGwETbAbzuVd/5HxkfDL/nwmFbZY5gY5A2KEju3l5S2cwjfujbgoHgT5HxqduYHfvvWZyvH3zntWigurmwip/83NjGc40oQHpjcWkEJpeM3e5YKUyNJjmcmzCU/cOMVmqH/D3MtbebAOIXAkNL3IC8bEb6wKKGmyvLObru3JNABwOUNbMZpegH1jBbI1wvE+q+ZbRDvDqbXZqEsblnpU+gCch2AmdMSmx3n3lQ14m9Zl0Q9KgtQXqCHAddVyhApvYw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 01:18:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 01:18:34 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Peng Fan <peng.fan@linux.dev>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Krzysztof Kozlowski <krzk@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, Tan
 Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
	<rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb James
 DeLisle <cjd@cjdns.fr>, Marc Zyngier <maz@kernel.org>, Miodrag Dinic
	<miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Anup Patel
	<anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, Qin Jian
	<qinjian@cqplus1.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij
	<linusw@kernel.org>, Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
	<anirudha.sarangi@amd.com>, Tushar Nimkar <tushar.nimkar@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-rpi-kernel@lists.infradead.org"
	<linux-rpi-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "git@amd.com" <git@amd.com>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Peng Fan
	<peng.fan@nxp.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
Thread-Topic: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
Thread-Index: AQHddEnOdOKyDAC7E0m8b1kTp8D2PLczDOBw
Date: Wed, 18 Nov 2026 01:18:34 +0000
Message-ID: <ZQ4PR01MB1202F7E2F371812215F5E06CF27A2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
x-ms-office365-filtering-correlation-id: b7b23c1c-34ca-4327-0ca9-08df4511dd67
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|18002099003|22082099003|6133799003|261009223027099003|921020|5023799004|261102123227099003|261022075727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|261028144727099003|38070700021|56012099006|10067099003;
x-microsoft-antispam-message-info: yKwXvzZ4qGJtqeK1TjdDMA4e0+8iYSmziMmJseD+oUwkLdPp2v4vvMGiElNVq+b/Yq/6N3KR0wkO4BG64FUDtPVKHeRU11ScRqAHTEojGMLh95ICgUarUvObcTQISW4sns66/frZ35LX7EZw9nye298fhx3K9FP3KRTtOCxBX3tqFdAMtQzBjy0CjKKV+FFrnqQ9Jy8s7ieHIE1TKBUr8Ckrz+D7nMwCRg3AM9T/mD9wkKPmJVXMq/OAEBS3rfPEmpuzfIgc4xneqLhBFjRUHu6luMCQwLhUU+h1E8ZkC/VBmf4yarKIo6t6oX8X2+EV7JiYrZ8eegx+9Wb9xmXNzuF5NV7e9uztMmSN9dy6N2rxpGG7l79GCMA7LiYUU4Bd957kHIKobNZpXWwiFh/gn+WUIHTlEgjgUCYT/kdvX7stZklWa3nNrM2KyR4/MGZa5yFQ8n7BrqjAVMX6/CK+G0aPxX4hJCj4LgmKH3gHllhZnJHVQJ5j8e0Q8uKAk8Pu11NdDnQ6uUvPOIkS5IQjdfAXEAMuFKQVwIwwg2xQDRMX5Fz5wRSzXHiykNwdXX/9A5rXZ9QyaWAN2yVYPph+dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(921020)(5023799004)(261102123227099003)(261022075727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261028144727099003)(38070700021)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qnp5aFRXODZFNlJldk9YVXhVTnBJR1BpcnZQNG16cWFMYTFxSVNXN2ZWR096?=
 =?utf-8?B?SHZ4ZXJrM25EY3NqK0IyS2hQbUZoZkdKRURhQmNuWkt4SVFrekVZWjdlRThD?=
 =?utf-8?B?aEQxVEQ2SERYeXBVUUhZNDhjZ0JPWEhWeWNBRWNoUXZ6VUloUUd5YUxyUFFD?=
 =?utf-8?B?K3BpbWs3cXduU0VVcWFud3JXVHh6dUIvdFlGZUdObllmVXB4aTNZdzVKcHdt?=
 =?utf-8?B?d1RhMDZETzZDK1lNc0N3bDlOdEVhbW5jWTNLMGYrcmJjQ1FvalcvZ1ZqTjcx?=
 =?utf-8?B?SFdva0N5a2FGZll2S25CMHlzZDcyNDJhdWd4Y01iMnVzdVBmS1lmTGxVUWxC?=
 =?utf-8?B?T1dYRFFheDUvZE41c0ovcks1R0ptV3habVU2d3pJUVI0TVljWUthWDUzblgz?=
 =?utf-8?B?c2VJSStaOERDalcveTF2WEFFdVFmQ25BNy9ST0U3aUVnKzQ1a0lIaEFJbkRQ?=
 =?utf-8?B?N0wzNFZxTEk0d0dYVVBZbzJaQzhDMVE0RFRLWm1kMDlKbG1rVmNEQThzZzBy?=
 =?utf-8?B?ZU9zQ3A4V2ZRMVB5TDhFU3BJZ3R2TVhTSFFyOGVSalRGWURlbG5wRHo2VmRR?=
 =?utf-8?B?Rm9tUjRtaTM2N1k5MXJ5c2dhMWRpVlFBUmh6bERZODhzZzMvbTQzWWVQMWYw?=
 =?utf-8?B?Z2JYK0liNGh2K1FadXZ0dTdrMTNPSUlRMFBnd004bFhQWmlMTEpKSnJPcnBs?=
 =?utf-8?B?MFlXSG5aTkpiYkFQL2NiRWowYktVOThMUktDSzQ5REpldVllb1NDVDVkM0Fj?=
 =?utf-8?B?WVY1c1ljV1BqQ0hmaVpwZ0ZtWDhtMmlaRGxRUVZGcUdGRkFrTit4UFVyTWdt?=
 =?utf-8?B?cmtsNnRlVmMraDMrTGhSZ014ZjQyeVllYjljWW81TnFXbTN1NVY2M04vRStB?=
 =?utf-8?B?NGNyMUlBSlhPZWtHVmtZT0F4eUNHMnlVSktBV01MMmlyTmZlUG14dEZJWU1B?=
 =?utf-8?B?MkU3Tk0reE8yUkRaODFKOGpQQ1VRbEFGVFhHb0kxWkd3M3ZzVUJEeitSVWxy?=
 =?utf-8?B?ZGlQNHVSbll2Rk1GNFhjdDd4NHZWbGgrRkNFa0NpWnBrL09uVkxOTEdwN3Bn?=
 =?utf-8?B?OXJoUUJCNG1EYTJCVGpUcGNJdFV2dVE3OXdFemJBYk80bW9JUnJuWi9ZdDNC?=
 =?utf-8?B?QjFVYktnT2JuNEFXZjQ4Zk0yekh5dGR4MGJhSDhZbjdCd2YzRmxiVzZualdO?=
 =?utf-8?B?L1I4YnUwbTBselNuWTBNQW1xSCtlRk14MjFCMUFtdjZwQmV2M0E0KzlvSitT?=
 =?utf-8?B?MjQ4NjRhTTdIODM1UngxS1BrMm9pZ0N2eitxUlN0aGdjNHlGaHhNeXpiTFds?=
 =?utf-8?B?VWdTcWoydEN4aDVidFVMcWo5aW1MdU1Vd05BMHZZelg4WXE4dEl0ZGNHaW9u?=
 =?utf-8?B?TDM2Yk4yOW81YjRPenRCaFkyc2NEOFNKYmg1bmROcXoyc0pMa3Zuems0ait5?=
 =?utf-8?B?R0poT2RENlBPb0hNV0t1dzJWc2Q4alUwU1hFbkxNQS8yRE9aNmU3VXFQQ3dN?=
 =?utf-8?B?N2NQRDR0b2xJa3hnYllLZFR1TG5oQ3E5Q0tJWTErS3lnZG9RWUJmN2R4NmJs?=
 =?utf-8?B?K1RpckJBMkhLQnE0QmtrNnhuOGdSNEVzN1VsemErbGxmQXFNeTM0b3FucVpq?=
 =?utf-8?B?OHRDN3B6VFBRN1pzdWxpYTBhOE8wMDBoVHVhRnloekhvL2J0VjZZUVpHYndW?=
 =?utf-8?B?VkEwTGhYbDRBMG9ybGVCejJlT2M1ME5PNzJVMHRxQnhxR2lYYWxBWE9mRVRt?=
 =?utf-8?B?WXpYb21UQmxsRndHdHpXMGZrZEZCV25pWFNxckExSW50N2NsVTlOeHEzL3hL?=
 =?utf-8?B?RytsSUd2SmpRckJBVEowUklpdlRpRzl5eFdNR3F3L2lHTDJnQ0NGd25JdFln?=
 =?utf-8?B?dW1GS2hvK2VtWkk0RFlJd1VHM0N5QTJuM21nUmRremY1K2k1RThKcmdZTVMw?=
 =?utf-8?B?WUFHOUtHN0FJLzRXbHhzZXIyUHZ2SmFNbk5vUVhQa2JNdVFtMTRVcTRhdTlD?=
 =?utf-8?B?dVB3cGZMc0x0T29rbHZMTFZad1RONlJkUGhaN1N2bFpzb2VJTkNQUjIzcVJ5?=
 =?utf-8?B?bk9yekJRUnMxVkRLeFpjWCtlUHdnSkw0U2NUdkxZZHNIL3hxdmVxRWFGdmgv?=
 =?utf-8?B?OEphQjBuRzV5eSs4OGxuVzdHL1RZZzNScnErN2xWdTFjMnpHcFMrQTVCNFJ4?=
 =?utf-8?B?a2FEVkR4aDdtZ0djdDROREVYYmdiSUZveEFvSFE4MG5FUDgzU3BuS1dSanlm?=
 =?utf-8?B?OEVFNWlyYWpDMUZSemthRnQrVXljeUJZamtXZ0pRRUdVSzJoazRBOVZsN2Jm?=
 =?utf-8?B?V2NYQ0JGTnNsb2x6ZEZXSit0MnJaaXQ2STRJSEhWQVhuSSt1SXNaMDgvc2hU?=
 =?utf-8?Q?3lhPMfT7Aqy9070g=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b23c1c-34ca-4327-0ca9-08df4511dd67
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 01:18:34.0978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qtCpoGJ+bCG24FDWg596I9jABKa+NT4vihTFEY8ZKI5fs1ukA6wgnRJ5Imrx3U4Pg6YJ9N/EEhfKfedPRHwWR/+DAE6Gws+LyAIMliUMBLQMrusG0WIx5Or+L/J5vJu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_171848_355876_D44874C4 
X-CRM114-Status: GOOD (  13.03  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hi

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use the scope-based guard_chained_irq() helper in all chained handlers under
> drivers/irqchip/ so that chained_irq_exit() is always invoked when the handler
> returns. Handlers that duplicated the exit call on an error path or jumped to a
> common exit label simply return now and rely on the guard.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> With [1] now merged in irq/drivers, convert the chained IRQ handlers in
> drivers/irqchip/ to use guard_chained_irq(). This removes the explicit
> chained_irq_exit() calls and the gotos that only existed to reach them,
> reducing boilerplate.
> 
> I use a script to do the job, and after that, do mannual checking.
> 
> No functional changes.
> 
> [1]
> https://lore.kernel.org/all/179417458323.2093942.14330197609841896598.
> tip-bot2@tip-bot2/#t
> ---

For drivers/irqchip/irq-starfive-jhb100-intc.c

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
