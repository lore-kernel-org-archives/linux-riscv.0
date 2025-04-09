Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA29C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Th8LzeRxe+cD3hJK0DHM/vLBUgc9Yyk2jfDq3Rw05Y=; b=oGVFc8v0hsiOH3
	Yb+0VREW6mQnH+7k1N42gpE/ai/cQ0JjR8Ms38NFYJnUkpojxbekq2TD3JLsmimhmVFgCwptluQNt
	6GOcHoSb7XnoearzxR366JXTDg2EiVAQLW7KZ7hTILAI0RHpK2rlKP1JiPAprjLhvtaKzS/+NsvEM
	GhHxEpwy6UnJKliICBD7Bno3ZVtRwpT5h4uGQRNnObo1hQLYiqLXjaTB0ch4zTsRzZJSaHEB7yAgA
	O4hk32ArQGvUzx2Dr3NZKv+kCXA8M2gY00IL6GHBBR1RAj/qE2vIQBdBb8xvN6gW7N9NDX7vadWoS
	Om3YsIlkaNQj4GY0NLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OIL-00000006BaO-1Tm4;
	Wed, 09 Apr 2025 05:48:17 +0000
Received: from mail-sh0chn02on20714.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::714] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2OIH-00000006BZB-3yYx
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 05:48:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3uHu1siJ9+qc1yZMAdEOUNMGEPyzwPOQDPMqJvsGCABsMQGy+umixjxdbZfqVzzCirEB0Nlg3y37GEECww77YMvpaUVKWHeeVqeS4HhzUDE6cVAvJ4qwu2z1RzJr4UzmLuYIg1rzScrnG13h909f6jsEXGjVAbLVEyxWYW5GDppqgfa421yCr1A9aPNCyz/Ol4ZirdccxfjU3Pn006CDW/Z5xQu32RcaAUPK5TU9sCtFBhhASv8NiJR9vEfs4rS4Qn4Aod4/m6XVC3DxUZ869p7hZPfcXQkr2xcCA7A6hmjPpRJZ6+71uo1ZfbasW236Dgs3vkIH5SR956Aop0Agw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnRVDQRyT7/+BEtB8D08yDjEhDtMYUW1aB4KaZdLqc8=;
 b=m3/Z5NXn9Uvk15+tvGDRMKFZ3ErsGdCPtQECs2l2qaKXk/c8cLLofE0tZ8jkS5Pt4ixqdw/s9XhMOxQqswY2jMb84JAYmY9SBcE2J3E/oBhLuzXI9+W4ZwNi+2w3Z5mYuPCjebrLxgEKRpFA7ddFyOSiJJJossxMq/cLZNIFF11oUT+eovJJlzcB8p+OY6HQc8TxIrJmdIhYB7/hrD9qeSEGHpEcSD+evhzn1yXZixjblR7lUJiy9ITfDJGTAOqV+ai0Lc4ufV+WJ4bHmScc/AcKf4JxOxfEaH0ZpC7ma3MzUK60ARkhrklH78Po2IrHPni1It7TV2NHJNU6j7rlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1258.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.49; Wed, 9 Apr
 2025 05:47:44 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8583.047; Wed, 9 Apr 2025
 05:47:44 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Joel Stanley <joel@jms.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Michael Ellerman <mpe@ellerman.id.au>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] riscv: config: Set MEDIA_SUPPORT_FILTER
Thread-Topic: [PATCH] riscv: config: Set MEDIA_SUPPORT_FILTER
Thread-Index: AQHbpSpGspuoGK0jVk6O/IRoI+qSEbOa2tXg
Date: Wed, 9 Apr 2025 05:47:44 +0000
Message-ID: <ZQ2PR01MB13076ED99BCE3ACEDD4CB895E6B42@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20250404062235.671872-1-joel@jms.id.au>
In-Reply-To: <20250404062235.671872-1-joel@jms.id.au>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1258:EE_
x-ms-office365-filtering-correlation-id: 0d376156-7ac1-40d9-114c-08dd772a0ce5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info: RKhazPGlVjtBUUKrUi/9a9XBCiDhnbMVRZVXusRBorJeMjhu9PftfjzRpzAmvZP+yY5YfwvnidMM0MSYZLdeVLvfPFLsznNwLFPFSzZY0mViewiWNaOI/DgjKjrgi96rMmzxb5mXXEBU8LqT7VaWk4v/vk4g8ueQzJl2pzWE/A/AhMCz/n/q04Jr9XyD2qVUNE02n+TOZgpvSKo0CTArh3TqOzw3C5veJ2NaYgd8qCaRqw3w1feYRPqolR1TB5nprQMyMWdRYwPgpX2bKZ/qHG1cnF/zcKS/aNODV/TrTs9e17qfiphR3MXNQv3osqJQiOe+958XinwTleOtdcDptMM3bUR/pxbq2SStfxmKZ++Kz/3tD5NC1KLHj2RlOjosu16S6s3Rwm8acCcvf1y9ZZRakdPQV3TuOpx60uOnt9DtZps/RvKhVUW/045dBJR5R83ArnfSXd/HpSvthdUInXy6fV8kMJXHPsBPHSsQBVyVbqhNdFAOB1OvMboBbVkEOZ1uHmojPtIMHbD+ZXeIwVK5RsbbiuWCNHbkgqewyY0Fhat97DcM103y9HdD9sNMHMNsz1teh+BB0wzBTrObZZDILiDf0/ztaGWhli0Mjj0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lbqksBtBDRNi44IRNw3Kfq8wMDYsZPamO6d3UV6xUyl45YFJcqd9d0XnP/v9?=
 =?us-ascii?Q?yMXZtYkGaE16fxrZiNGnq0x5mnhUzlQ9dt/v9Tb6MK5hz7ziusjGNJniWQ+o?=
 =?us-ascii?Q?XK7NMcm6BtpxOMcDefWYFOZIo/gzw0HlvMp1u7nxaE7zpQQj/g316SmSXm+n?=
 =?us-ascii?Q?d3S29PWaU33gqWd/OW2fIcQQcSx7axPBeKmMH4/ZL3j6b50aWI8o6qB64RGK?=
 =?us-ascii?Q?CGJ7vD5THf1Rv6lwlM4m0vLwApc1wqr3XBZ7Ek1sKxfrO0ym2eIzihwP9tb8?=
 =?us-ascii?Q?Pv5Kd8YZt7zdPKXS9Z/6nn23nJ78nxl3nBDR9p0AfmLbYZl1z7LJ206x981W?=
 =?us-ascii?Q?0a039//7Y5Bc73abwNNvSm6Nw1NlMMZkHbvB5x9HlmIA4c43IZvjLLYNvXYD?=
 =?us-ascii?Q?n+VntZYOtxt+u6ER40i04Ve3314mj1M6tgc8aBJFaYFx7m1yOV6JfhFpuO37?=
 =?us-ascii?Q?tfgWZ1+EUZVM0EjLD8/nToeZKXV/27aJaKCu/FP65oS3fYcgSZccUHqcuXUa?=
 =?us-ascii?Q?2smC+FpAXznQVW/AvJvsgq5HG3F/nne8rC3AiDjxG8Z0DhwOGRtwv6if0v8/?=
 =?us-ascii?Q?Sr0iQcXxzGfAyNhO2HFCO4k6L+jUbMIuWeuG6LZNk6Vefe1saPgn86CuXiKg?=
 =?us-ascii?Q?Ys0n66SJg8P+slRVQwYzmwolsszrYm0V7rM7/QQLOu0v5LV7CR/PD+UTLaWF?=
 =?us-ascii?Q?//X1YyinZ0wKm9qsBA64HtX+3o/wFiFClN5MAuUIaWTh/0wgZrRjLjYBUa+Y?=
 =?us-ascii?Q?LHBxUKClCgW2g24CXJIRgcQWQNORt7qYVhEO0dfZfXoTwpSvUTurNIxsl28X?=
 =?us-ascii?Q?blGp27A6/st/rQdq336lheCeugJ+jhQu950+10fsCsE5f93CjUarqXn9urGB?=
 =?us-ascii?Q?1zqHzlRkcfGMJv23x8YcU2lduSLWASARAR0t2j7TmrjDzTEjdFsMWKHpp822?=
 =?us-ascii?Q?abnzueeTYZy4PdhBw5El58WFo0HhG6SN0DUqnEh4qvP20+KYgVwW0loExwlX?=
 =?us-ascii?Q?kyPqoR+JI9Xx1XJYDe3pD+0twvt06+5PO/jly3SLyA8Mim/lvReKk9FcBIX4?=
 =?us-ascii?Q?+uPNGK9hvLmj3r+T6SK0qJJL81TbKHgYphqnnxyQJDWAA2WKrzATP38VHsIg?=
 =?us-ascii?Q?GEJs6NDPVlpDc8KyM+1UVZSa71I7LJSyDr7KDxjZjHQv0eeVElE1n9tgi+tM?=
 =?us-ascii?Q?9x4jSXWEReei9aoXsTvCbAD0no+FZkuUJCqIwCCxSccxo8r+tzP6eyx1kx7P?=
 =?us-ascii?Q?Cprlpm8nYgj/XT8TK59AQQTJL3+cmFIhLckKQci0420lLwjeKvPRw7yF2DG+?=
 =?us-ascii?Q?5wAOD7vUoMwlyKqhkyAaQ0HUSC9g6FOiIuiBfj3LOr9hNWKo2T9+/aW1Prj/?=
 =?us-ascii?Q?5InDLsvKbpDA1HBnzcHs7iGklKYU+PSnsAgtjFLZjDt7OyJOjt2MMpPKllnJ?=
 =?us-ascii?Q?7jC6bPp/Zme+G89Tpu+azhxjxHr8RAXB5xKNkAqwI0XEZpyvHOMUbs2AA1cN?=
 =?us-ascii?Q?OCi3VlQqdu2Jslmy8Oj3r8SB35tGv0SONvP+459H8kDw1rkWopZtmR8+xM0I?=
 =?us-ascii?Q?VbLsV4U5Fjp9NuWXwEdbtgjZv7vKQ4tJecqRATRWGTYsBIM69DvvA4B+cECZ?=
 =?us-ascii?Q?Yw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d376156-7ac1-40d9-114c-08dd772a0ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 05:47:44.5086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yOxPhnpbAJzYKqYCHoL6oJSPja/w2b8jRbnCsw4pPDpyNm1/53NuCF0X1XV0j1cNgbRw8cCfwylgtQ+f3uCAhyfuNstSMD/qr4rXbuweRfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_224813_984146_33B7828F 
X-CRM114-Status: GOOD (  13.97  )
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

> On 04.04.25 14:23, Joel Stanley wrote:
> 
> When Hal enabled MEIDA_SUPPORT in order to add the
> VIDEO_CADENCE_CSI2RX driver in commit d8a7d89abb09 ("riscv: defconfig:
> Enable StarFive JH7110 drivers"), it turned on a few hundred (254) other
> MEDIA drivers.
> 
> The subsystem has a option for this very case that keeps the other drivers
> disabled: MEDIA_SUPPORT_FILTER. Turn that on, and
> MEDIA_PLATFORM_SUPPORT, so the CSI2RX driver stays enabled.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> The filter option only appears in a small handful of arm32 defconfigs (and I
> maintain a few of them). That's because MEDIA_SUPPORT_FILTER is normally
> enabled unless EXPERT is on.
> 
> The root of the issue is the riscv defconfig selects EXPERT. Most arch-wide
> defconfig don't have that on. Need to get to the bottom of that, and perhaps
> disable EXPERT?
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig index
> 0f7dcbe3c45b..c34fcf2c6a2f 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -182,6 +182,8 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
> CONFIG_REGULATOR_AXP20X=y  CONFIG_REGULATOR_GPIO=y
> CONFIG_MEDIA_SUPPORT=m
> +CONFIG_MEDIA_SUPPORT_FILTER=y
> +CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_VIDEO_CADENCE_CSI2RX=m
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
