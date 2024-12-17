Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A5DE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 02:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LM0djYqrZ5W/HR0JzdqO+nZjUhHv3lEwL+jGxqIhrbM=; b=xioqMZbzPfC543
	rC3ptXnc/A5NbLjaeaUy7KAZTDzQnkMUQz1qgTv1CFjJkbgfDD9wz1k58FP8qxDZM6dfYtHVBXiIj
	ScG/AaLaZy+YcY7codv7+u8qLRSxHIN2ddZ5G2s2Y/0SpBqh2kYAV2bKaT2GTG/MiJcfdhnXsRTMn
	PLu557OuZUucmZBXtkmFDGyuqFMKmO5licXgmxMqqemlcgQ06lFPcd7Acz8RMBeKN7+Dr1le0sdgj
	6HveSPkMoR66fAQcFUQiClBhbiUUASiVL+3BJUC/LnFzijMSEDHxOptNx+aH2Ih6emhnm2YcOm/CT
	p1OHr0ZjddgD6Jh2y6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMuO-0000000BvPX-0cCv;
	Tue, 17 Dec 2024 02:02:00 +0000
Received: from mail-bjschn02on20724.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::724] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNMuL-0000000BvOa-118W
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 02:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dezFEIWK21P4vfzFAjjPo+yHqy6jAvMIfHKeKqXVUO/vLWjuxB/1NOlbNlCISrekVX2q40LnPh8RxmLgbG7ricd956L6K50hUsDI5g82Urm85lL1BQ5DY2atvj70R0k3VYocKWNTxI2cBuUD6CmM4oCRYIh2YDTl8qmKXuuxkUsBtzrZNpVLx7fa5sb4omgqDf8gHUNr9SW++K+9SkUiQkMLVydiveoV0//1ff8AvJ1/BDW88CjfEwwXCHzvRKc1pjTtIXriIYTX2Q+iR5UYmc+l0KicZBBQ+kISYsxgDI+S3Nkq+49HPMvzpm2FNSKbcTazk29c0CBCykV955DkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjlAAGzzSGWSQoNDq5FLmqPdfUsf3xC/tQcck9NiKvU=;
 b=g000BkUHq0y7B7S4EiwZ6rDNNalU6nmur6qV1zs45S9wZ/ogBmJQ+GjhnTuXAv9vezv1p1c2C11GDPb9EquR4wKvnx7xjwLCqum4ny8YMUYl2MtqHlyrxcSXhelwJV39mmjFhiXYSdt/REkn7GI7SnJcjhrtnR9fnb1iK+Cc/TnY9mQkONYrt2Km4Lc1NYxCHKQA71idypRKKOohmF2G6Z8SMnFbJf1E0QGUJIfBFEQKYqIaJbfsBJ7zipoUF5slreGfmRFW4MBocEI/pUqn36mulu7xD2W3hmhzu8eXByJcv9CD2725HrgAgu4v+EkRVUDP/CqEdHpb4RBdeFDazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1163.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 02:02:04 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 02:02:04 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, E Shattow <e@freeshell.de>, Jisheng Zhang
	<jszhang@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>
Subject: RE: [PATCH] riscv: dts: starfive: jh7110-common: Use named definition
 for mmc1 card detect
Thread-Topic: [PATCH] riscv: dts: starfive: jh7110-common: Use named
 definition for mmc1 card detect
Thread-Index: AQHbT/cItPZg0BYxikqmhcJqnrbnzLLpqmPA
Date: Tue, 17 Dec 2024 02:02:04 +0000
Message-ID: <ZQ2PR01MB1307F1FC7EEB8701525AC9DEE604A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20241210040652.164030-1-e@freeshell.de>
 <20241216-elixir-cupped-f7a83bce4e12@spud>
In-Reply-To: <20241216-elixir-cupped-f7a83bce4e12@spud>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1163:EE_
x-ms-office365-filtering-correlation-id: ef55491c-dba9-4c0d-d1d9-08dd1e3ecda3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|41320700013|366016|38070700018|921020;
x-microsoft-antispam-message-info: KjvX5tuOpz8qu3vCBtMOdy3Gu6/67rRtVVqZb3vFMwsoULqxOwrG72zvfDQMfMXJyawYn4tnOclMJ2Z9bWYiNlktPxTp8LbgWt3FBOH+LNju4nmFrAoQYIwRL7H81T4+Dxb7jq6E/NLM4CHwjIeQSomcv4+tjWhG+K9lrXmj7h0ZW/4MSGGfyi4D19DkUKFu9srBJHGigKRldI5MDm5sJJFdKo6M4IqTNrv53N6ftANFOWysnf/vL47OmQ8mlHJ3eNUqqKjK5jo695gNmtuWyAqw1RDW+DeRoLBSzK6U0eNflTD3Jx+Kq2dPNOcyCvpg4K4QTOa+HE4VcOa0MDhMpyeia8uoM8gXnYUlf3dLiNVv9eKD1AFCwO6yjGwfGvKQL+0THBIYZKODBhuvLFSAgrMMK73HvdgTEXXTu1vZcO+MeZC8KH0qVMGLMfAypfFflUKCr9rlfNU7QHS6obrJi3mMe6CFHtb0xl4Kt8CbuxkKCdYjd3bIJgDuEKEFyW893zHGKn5DZl6tWdoqNmYm8ecigZTzqltZGnbJYK3CwI/ibqrBwQRX1iA6h5FHFzkA5p3T/wannwk/tFL8wnPgzq2VCi9aKK6QlhRybNgiCgg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGZKUnZpMTVPdGZqVDVrby8zMjI3V3E1MTFnZU0xbGxDOCs1VGE3TUpSSC9D?=
 =?utf-8?B?UUF1clNORDZQWS9FWGlNMnJRYkEzRXdDZ3VwUGI2WTd5QTdvN3NCemw2bXpw?=
 =?utf-8?B?L2EwcDJ4b2JtaExEVGR5a3ZuRjl5RlpLSE5yRCt4ZlJwcGx0WExlNmVMQTFX?=
 =?utf-8?B?WmpxUmJFTHQ3dlQ4VkRZSUhOeFBITVdwQ0x3R3ZRK2pjbk4rL0d1OUtpdXNJ?=
 =?utf-8?B?bjdJY2l4RFVPd01seE9salNTbks5b1RZU0Q2bDRkVmdpWlVIV1k0N3NRbTdL?=
 =?utf-8?B?N3dFaG9GK1JlWG5QYVhaZjd0R1NhMkkzRGl2dlQ0eVlRTW5FdThRbmtNamlJ?=
 =?utf-8?B?dWtxSkJpNzU4bjF6SjBCUkpmeE5iOFR4TDRUWkdxc1NXcExBUndvaGVHQjdn?=
 =?utf-8?B?NEJkdWxrVk9yZTk0SmsveFZhdFd3OVFZWmIwKzBNOVNPUHVYNjc3amc3MGlF?=
 =?utf-8?B?ZDNZd0hlazZ5YloyamNlY09hVjVIOVFUakhwMko2YkpJR3NCaGYvVnNsYTJK?=
 =?utf-8?B?ODg5WVA4T2F2UzlncjhiU3pBak4zNmlQNndLSzRRcDRWeGlWQXIrYlM2bW53?=
 =?utf-8?B?M2hDTkFrTWlDeVJ2bnRrV0VsRW5aQjgvdWNDWFlSYjF1ODh4OG1tVGZ6WkVD?=
 =?utf-8?B?bmoyRUpmdkIwSWZZTzU4ZU0wQVhUbHZxNmRZQ01teFNkaXExajhpQlkxVTc1?=
 =?utf-8?B?OUFYTEpKb3lOMjBuRXl1NHU2aitVWU1kNjZSWURFckxPeWc5UFRUSlZZa2hE?=
 =?utf-8?B?KzhMWmhXaFNnK01OV1RkZUVndlZhU1FiaFdrOURwZmNobk9MSUlwd01SMThQ?=
 =?utf-8?B?V2J3NEEvK1dBRDN1dlgyd25HeWJRNGcxZEJvQnZXSG1Ed0lhM2NKOCtSUHpO?=
 =?utf-8?B?TUZkM2h1S2tDaUdLTndGN2lBS3MwbjZuS01ZZ3QyV1RReHM4YUNTejQrSzBt?=
 =?utf-8?B?T0lIRFgybm5ESFNOYWppUVdtWEZJOVZ2ZUVCYnptUFk2eGhwNHB4SU43TTNn?=
 =?utf-8?B?d3R3K0FzdGRHOWJKWVRWalVSaXJteW84eWF0NWxMcUl0MGpwajRvdXpHTVIy?=
 =?utf-8?B?ZWxNNmZTTmJJczNBVDNqTUkwZnlPckxJcHRydGNLMHpiUzQxZEFrVElyTlVv?=
 =?utf-8?B?WUd3blVCQlk0S3dEQlNRSnVpOTI2azluYUlIZlNsWTZyZldKUFdwdWpSaHhK?=
 =?utf-8?B?NmdoODFyTkVoN2w2eGZMRnVXTnFSSGkxaFJjdXJtcXhxMWpIczFmVzJOSFFU?=
 =?utf-8?B?VktJRVJXaHplY1l4WFZRZTM5Q0YxcGpIYlM2WnZHWmxVbWE1OVptK3FrR29N?=
 =?utf-8?B?VnpPcFZ2SWVEZTQrcHUwV0ZxdTIvVVVSWlNOVitORGRCRVhuejFZUk9LcTIz?=
 =?utf-8?B?MDNUWThiYStuOFZsYkF2WFJQL3FCZkovQjZ4NkE4OWdnUUZJeVZ3NEhYZ1R4?=
 =?utf-8?B?QlBZWExadGFZSlF6b3p6SzVocmNRZlM0Zm9LbVhCN0tBVEYxVzl6YlozUjkz?=
 =?utf-8?B?RzJ4QkFmRW9rUXArRi9KRnFVOW1GVHRMZCt5QTN5bDJVa3BKWVo1Zlpwc2pn?=
 =?utf-8?B?TS9VSDZkKytzeHRDMHRwVnZ5RjF0Y21NOWpxUG5QS0dEWmRJSmtrbElsNkQy?=
 =?utf-8?B?SFJUT0lQd0tGUTdtc2hwOFVvRkcyTDY4cDIwekI1bnhTYTRNVkR3M0hVL0h2?=
 =?utf-8?B?Q09ma1NjQ2lncTdtYklVVGczSkV5T3paOHZWbnJzUWVRM0dXWDg0YWhrRkYw?=
 =?utf-8?B?WXBYbDZ5WVh4V2t0dHhHZDdteWlGd2Q4VEU3NkF6K0pIcmI4VlVZZlBmcEVH?=
 =?utf-8?B?SEplUGZITUgvNlc3dXBua1VwbEJ5OTRSNWF0M1kvNE4vUFNLQ0M4WHRFSmdZ?=
 =?utf-8?B?d0VacEVDa0wrN0ZDMFBlRmcvaUFzeFp4VUQwMVVIb3NtTFZTQ1hvRHRicGtS?=
 =?utf-8?B?ZkFsbVpnb0RKaGpUMmtTMnhYdmZLaDBFUU94L09XaGQwenYwdncvTkdFeGFB?=
 =?utf-8?B?SjlKOXFzaUpvcGdVSUpmVVRmUFAxbnpVNFhWM0lKOWpRejJPeU9VN09CZVN6?=
 =?utf-8?B?MTRPZ3VKS0g5bzkxYzU3R2hXdjFEb3U4YjhQdTZlNnlwTnFxR1VEMWNMWXJl?=
 =?utf-8?Q?5EyJlTO7hl88jFmFRcyWEXxap?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ef55491c-dba9-4c0d-d1d9-08dd1e3ecda3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 02:02:04.2721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QnzSBKsX2AGfNYd7x2fMdm6pSugQ1CwwOnftV4PYdifp1mdVXVeyzxtUSTLjI4VVZKibmFgyqBlQ5NP3Q5Lj6vpzYXWvJ84WubqLUH7bZ8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_180157_291044_CF574264 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
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

> On 17.12.24 04:13, Conor Dooley wrote: 
> On Mon, 09 Dec 2024 20:06:46 -0800, E Shattow wrote:
> > Use named definition for mmc1 card detect GPIO instead of numeric literal.
> >
> >
> 
> Applied to riscv-dt-for-next, thanks!
> 
> [1/1] riscv: dts: starfive: jh7110-common: Use named definition for mmc1
> card detect
>       https://git.kernel.org/conor/c/c96f15d79172

No, here "41" means the GPIO number, but GPI_SYS_SDIO1_CD means the
multiplexed function and should be used by pinctrl pinmux not gpio subsystem.
Although GPI-SYS_SDIO1_CD is numerically the same as 41.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
