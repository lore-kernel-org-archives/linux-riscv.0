Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B3606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 06:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hgw+C45i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iYRd2ZGHn1GrfulyE1SkZPmwzl/TO0pHifZGQej5r8Y=; b=hgw+C45i1+lh/KpJJfgEL4QQJ4
	RrJxO05gRMxooIr8D/+q0qB3HtNDb5TtlHfr9p8Gnf5hI2TonDXcsEqflaSvWL0ZoAYHcQuPf4xS4
	ZgDiS9Cv7gUXWF/MxgbAeJnScibOCBqs08mgrE7MCYj8RsY925Cm1uDT+jwYipPT4OCpnIEiMStbG
	lmVllTOEhki8Wkde0MGp/llM2kbXBORTvmn/Y+1LpsmYXO+OmniF62Vbu+XfaFlRcJQ45ApTilsM/
	ngQcpMdb/EtOrsIRnEEz6dm4HnqDxrwKzONkdQKGctVlEdZY8ATHRxypPnbKFgYmme7OVDtWuH+/I
	uVH6xf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNnE-00000002OJg-3eup;
	Mon, 23 Nov 2026 06:44:48 +0000
Received: from mail-sh0chn02on2071f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNnB-00000002OIc-2oZX
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 06:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4XsrTdgfDjD2DRVOWd3rrraZKar3H1LQKnao9n0b5aN7YJom5EonBRojCpAi5t950K9jUCcM2LxYFHyQpGWSUw7K45NvwFQkEPYekUSwg9QkSiXspx71dh6uI0I7PLMG1L9XGrfIHmvLzNPey3IeeSHq2S+SgWTfiIU1zFQ72lbKPdV/3Rv5/4Dwe5dZmgOjnFPwS8gGmq+V07VK5HNg5tfhN1PvxFb+XJLWWwV07lJCJ0tywSkPnwWDHA4jJQtEqC4ZWhNPjoB6IzHKVaE7iR0gg+SzSWnuFQiF2UcxfLNFtfuaH5dOGBGNBq83LxE9GSL+yxkIXdNXswudMCfFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OH/X/0dKkdBC+GZx67jQhRYFOlATTQ7OgI6LfisTiU=;
 b=JObEzTCKQinMpH0xObGyU0Jd0r4mUGyFsOmHur98JFlDwG9ZRkQ6fxPlAj/LPlmIc3Y85d3GTbIci3kiwZItqvZBS1CYrFGG+qYePGHigj7hnS6pXJFWlx5hkDqCGwL/BjQ8xC7GZXODa+/+rBDEgSx5P+Z+hyWa78JSTyTAvis/qEIU/EwrF/4qUuBKK63KxWbE46brIfTlxY1za0D3SBRYrIuYVB2sChtAkiaiALH48q30jilo3pjyd2NO1fwba+Hchnyn1RJs8ia7r0dlPpmZ+KovtfSrzgMuRRyDIn8X0CryJxPsQ0vQofYE7pCsNmBOVy+n8FGInEcKe4yA7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 06:28:47 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 06:28:47 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney
	<bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner
 Berthing <kernel@esmil.dk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v6 01/15] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Topic: [PATCH v6 01/15] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
Thread-Index: AQHdVyFFNPsaGiCKfEOycsVRdPWCg7c7eK1A
Date: Mon, 23 Nov 2026 06:28:47 +0000
Message-ID: <NT0PR01MB11027EC0BAA285160F92DC2CE6452@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-2-changhuang.liang@starfivetech.com>
In-Reply-To: <20261008123338.11081-2-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1216:EE_
x-ms-office365-filtering-correlation-id: 0324972b-4276-4750-9868-08df492b07bf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|4143699003|18002099003|261009223027099003|22082099003|56012099006|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: CdUAYWSf8Ed7Q2aNISjC2Yy2JaFM3uOOUwphcjavtlevLfybjn8tnpQoO4IONSAowbapYh1rCA/nPVEwOVgTxkqHtFBgIkE+8WES3zMePTwUHBIA9BWH2XSNcz84eT8aV9h7TmVEABv3Gdn/YEHSSXcRX4wazgJajF1kerIq8vURxOouGY5IU+WGXev1KWFc3g2wF7Sgyci6q3hVPEWaIPg9Vkd2pXSlfE5lvsQGqBNsHgB3c9RK+N59r7eaBI+KBHgqJX15iI5RVxYxUNXm4a9lLX9/Pb6TkSnmaKYItaF0fhSnXndt9fZM9kq3OjGqA49S3QSJCqHW2vSWF+UNAiBiFP7EeRClojdOEMyxgAFdcDQMtdlrRAjABqIgWmrWivrOKWDeJ+IZ5xgm/yF7U04NlP/FIPVc0JdNmcRsyH5175HMR3Zm/KngrLkDZLnBCuRKtDGAw4ZdGQDecgR8bxI0+jXzoU3BBolluaQqQ6I5+p8L3r4IPCsgC0DHdTwp7yu07hKPlRfF4D7cCWXlEpZsDY1SuUU4wvbxK2g36KQwJX6DutQ86bi4lkD6D8+k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(4143699003)(18002099003)(261009223027099003)(22082099003)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xIFNBVgb3xxU4YxowW63sV+LMZKWYntgyVGP4tQtQRUOjwxuuV0Ci2YgrmAw?=
 =?us-ascii?Q?8EgixD0oa9ePaDjJu+FZwmbrd6fNz/UsCKmvqYzUhYgVRywxFXckys4DfQQh?=
 =?us-ascii?Q?M2pAT9wJGEwYrNzthDbfHRCf4TMBu/9icjmENsZNvD2qqhtKeQmlKK1sQT5C?=
 =?us-ascii?Q?KTkMQqyGrovqZs0Chr4ma4l5RmQtfjJvCbIOwPA1FIRC85ZI88n5BGCgK3x/?=
 =?us-ascii?Q?5RYugo2vxq8Ll/WvqkGWVvBCkZiAaSjLjTu3vB0I7S3h3X1jjeuiUrQ/nkfn?=
 =?us-ascii?Q?tc+J8LpDK+MDfIx1XhiA24C0nY4NafKC7lcCbBYg++AcwXS+sFQSumujuHt4?=
 =?us-ascii?Q?CRAMSptE73n0LpUG4NtxckEvudr9Lo1c4maafUJewRjC3dryDwC5rdbKzZZn?=
 =?us-ascii?Q?iHXl+AQS7S5sKWlywEjgBZqwx9lAAl1ydcgerQnhfm1jSbNXwUMwmEy0igcR?=
 =?us-ascii?Q?CqR/YMtBZyBrXDEFrqiW9icvJqJA+OIVWMfiwo5AQS05UMp4aevoxFYp128E?=
 =?us-ascii?Q?EwByuGuI9hUgiW92hR5U20bfC1YvXtex4BzLoIsdMqJRExKZAqO82p+OROZ2?=
 =?us-ascii?Q?DKBvq6f+F/NGVORkXAmq4ZZ27h2+gKYcrw4RCf+lW6mdRZS6fX6ATm5+xmLU?=
 =?us-ascii?Q?oRyFob4bb9vKWuzCbJB/CZHFPOq8fvk5+bg4Cn2D2ZBRpSetCvHsF1+Mb8iw?=
 =?us-ascii?Q?ubMj9LwKcv74DuocCUFLunPPs0unDNHJ+rYca4YIWzOGhkFYxu74TjzZE3QL?=
 =?us-ascii?Q?Uj6C8GEp24/4x5af007GKefHowiwiiANWQefHXNYs7rIfJO0sCDO6ov31A2b?=
 =?us-ascii?Q?tebW/RbQXMtTJoZDTKtqCC162LEb5MOcXWtE0U6mNC16DlPXmYdsBjKVxgN+?=
 =?us-ascii?Q?sadtQmAXiYLu3Nrf+LO4OuislFlhRe15jf9M2KM2M4kpfDkssI/yJ4JoMqNE?=
 =?us-ascii?Q?SqhOFHdlik6GatxzcfAmtYRPPJJc2uo5JKy4OMMzPG7eMX+FDXkjHLkX9wgm?=
 =?us-ascii?Q?pnuwJC+YxXJYux2MOmQl9RA7eCDUveW9x0Z+SIO+U8lhGP2HUN6XZGAJLeyB?=
 =?us-ascii?Q?QP+Oyu33W901NMw//UD2K7lrbxcT3IrVKHlbA52aIjMQ+mTYHW9w9XlsxGN9?=
 =?us-ascii?Q?6+ayjijTXR3KX/RqDdFJCpAsHynZlkOpfl01FaFxJKLBvOGV0ji0v9MA5U27?=
 =?us-ascii?Q?WTB/pITI+r5lvKGuyLHAQ19QyP8NE4ws5AMDuabyGjxnGJr2w9wUG+jkLTsv?=
 =?us-ascii?Q?cc7IlKmsKOOIK8hGqip6sfHgYNmK7VGET6m8CuxG58tdKBpE1kY/Qo4qZ8Ah?=
 =?us-ascii?Q?Bya/hBmqKGJ1eBqThFaRqxQx937xYOaaxnrqlkgg9e3hZ2+5g1u/+hDiH5Ds?=
 =?us-ascii?Q?G+9HP/rm6JBZezO64TsD44xE4muFkb4PWrm/9FJMSU4geZL3wbiqsMXXIC+w?=
 =?us-ascii?Q?X9/J6RLPHg2oOlvOr7mEQkOT5/Dpco++zgzka3efHgkxMePlheXHKlIUI0BB?=
 =?us-ascii?Q?8peATu0GAigy3Kh0kMmhhzzv41NjsteEz9f0I4sgDU/dCL2PlepUXE8kUwaD?=
 =?us-ascii?Q?+iHssq0UVaoJ5jH6VhzYkF9rtABRdQ3vbi4PWJ85XENJoRmKgUl1TWRYKTv3?=
 =?us-ascii?Q?QGootdVlYk4DkDX6FQHLsMT8HRSq9MERJSBEtpQHqvokACfcJAu/2hwqceyI?=
 =?us-ascii?Q?OPG0CMOzpFfu/htbSHLFkFswaJDaFA02BO32TJak7N6QlMTjmrDiacWpeXzz?=
 =?us-ascii?Q?c67C1eKovg=3D=3D?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 0324972b-4276-4750-9868-08df492b07bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 06:28:47.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXo6tneZN+d6/P6RumMF6tK69VJc3QE33z9gNwFvuR4FvXZs1czoVI/PJ0uxNGbesZuYmqyig+9duj1RnSVDxDBH9LGz1H5KzJpBz27hxac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_224445_704820_08C8A313 
X-CRM114-Status: GOOD (  13.30  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On 26.10.08 20:33, Changhuang Liang wrote:
> auxiliary_device_init() returns an error before device_initialize() is called, so
> the release callback never runs on this path and the rdev allocated in
> jh7110_reset_controller_register() is leaked.
> 
> Free rdev when auxiliary_device_init() fails.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 847c0a39e5ab..1d460a03f936 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct
> jh71x0_clk_priv *priv,
>  	adev->id = adev_id;
> 
>  	ret = auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(rdev);
>  		return ret;
> +	}
> 
>  	ret = auxiliary_device_add(adev);
>  	if (ret) {

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
