Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776B0E7717D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 02:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+DliMKMgN5ZvmmOnCUeyyfFDG0FHzyM+oq8eoO4duo=; b=o9IsDvy7EHcZJG
	GJeTw19nPKGw1SywGj8+uZ3veayY96lI1+rGuon7klUvpOssKkazjAKPhn7O0Qp6tFVhL0CvOPxyV
	XfMftFaDKdmeZbO9QkNHy1fjadRNz3Mq9dQGAf9FPOe3aykicT0BrG8DavOAx03k1iUV2NS5iBqWb
	n7YAFehjqOIbJw6mz+UjM/E8i+vRR4vh4ibI2ad0PEOnWv+DGsjU3KaCrhWhIOYiIVIm/UZYOfgWG
	48u8NggZjlSFIEpLLA3sOX1qEMJR/+vf3F+LUOvN9wgmbGqforb3xUMAt17LTzquS3SftqvlszAuJ
	OrkVF3gXgh3k5gIOsWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKplK-00000009wLE-0Z8w;
	Tue, 10 Dec 2024 02:14:10 +0000
Received: from mail-bjschn02on20708.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::708] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKplG-00000009wJm-0QVl
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 02:14:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5HPlLkXu4Z8Sh6nw4hondOtl93ComAU+k+Tsi8Lgo9BI3qP/Fw+9jt15lQMviArf0Co0TUTFhEpwNDy2hEMAJNCbe2oJ0CH4kUOWuspPL6vNm7Vk/QzO6wmTM9OsFz2raLNG2SqWvBrtYW7LeFvRM2x5ymiOYFKNrmxw6WK3padVleDv9l8FU7EtV5C68aa5mEj76JeBR3sytkgeLZG4lq7NLyRsfZ0NEf0AK731UKYMtB6JYA2ER48hHEsisSkeuqRaoVMC5BYiBfiBPzH4wM+ci6KPsyNSq5cX0bZPNiyMdBZf6c5hm+jMTmNVGlJBldpGuRID0tQdMrjB3jxHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wAOAvLjbhdnSCYbJgO7EORrb7sMAt9lA1NTVpxTHvE=;
 b=Tv6aSKuUfqp0vzxrUwQLv3mF5YftyfgKOs/8w9ctvbooiOsLuR5zKkBYap3PISbBR0db71pmDeuq93kTBSrutBxv9LkR6Se7W0vPRCJS2ruRSYsewxbUrizhz9Ac/SvANuxhD2lXZCOi1AAaTL10cjoCEi2I4Cy+vLy2D8HbemwHkthq4b4BMYAp3Zs5dKUGdZ02dXzlxc0m398JSEPbSwXaXL7r4vUrYwGq+QC+cu/xIeTYWbxTmmpMRzED3WTjjYQCoULX2RZZP+EDndMJTFS5T1VJjUd2qXGlMWRGAQFIKXDsE+Z+Pp3W/8Cduy0l3mKQ9XflGRPgA5rnIszIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1274.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 02:14:24 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%7]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 02:14:24 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Jianlong Huang <jianlong.huang@starfivetech.com>
CC: Conor Dooley <conor.dooley@microchip.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: dts: starfive: jh7110-pinfunc.h
Thread-Topic: [PATCH] riscv: dts: starfive: jh7110-pinfunc.h
Thread-Index: AQHbSqX38N+Nr3esXUuMC3p9pKWswrLeul/A
Date: Tue, 10 Dec 2024 02:14:24 +0000
Message-ID: <ZQ2PR01MB1307099548C99CD6650BD57CE63DA@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20241210014903.154551-1-e@freeshell.de>
In-Reply-To: <20241210014903.154551-1-e@freeshell.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1274:EE_
x-ms-office365-filtering-correlation-id: 983f2a4b-9781-416f-e4ec-08dd18c05db0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: Qljjfd+ao0pmvOzFjV+w3kUacVZmS5JGiYb4JqqtPdKnBhAdwFgzXUZIY7/GeVS4eHIGQHM8zR99cZIOzMroaIOeda4i/9yj8syLox2eLjMr1vNYN30wYTm6YhlGz4gp70jX6Pg/acc4w9f9ggKA9OntTlHfSsBaBFrVK2+CdUmiSgrqN86p3JxqcofaIZg5uvYc7WWULpqQsZ+rL10EIZ7AnnowwJXS4DozpIq5ezvEhFgyMfX0ZEds9QYHk21nkez5Ex/vSXIWwRCUfpqsRZxIsYKGRh6VAL9Rv+p1vPNEG+nQ0KTCgE8+8E65pkbNtJH8/own1jCDYxHdUAQNc+H7zFeaqw0QpDs3ygepplZwuKFyCgX4V2w3L1po53nYVPX+A4YRsYd+M1Th12iDNFiZVGzibHhlyUcpknRjtulbRxVeoMU8T1nnlUCXNC8ykO75q3yyzH2v9lWoFvdaSjNmKGg/lhH3Qn7xB0E5lAX9eny9eurSJj9F9mbKvPiBbntkjjPcq0zxYHJOTu7/akqiOlavCcNPaZdVSPgS9XmG7uIazIGWPTht6BryKviOLtDeLEXnjDG2/3myuJ46Hf9cv/51Tbk+jvXWVcQltDg4e1IeZVc2QTHABbfKrQAZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kEYFE2A9jks6b/BKwiAUy9eAQsUhU+h+cbOeFUBJDSdX4oL+gSGrHY5UrG70?=
 =?us-ascii?Q?Yixd2SXtyyJtNyb7B1FO2pDzDB3oWaVjslTvp5+SnzdYllRnXbbzePn33qeC?=
 =?us-ascii?Q?afVcEMTs2JFVT92FhD8ROpB3Fr0MrHp5lngEwk7G9vXbt2VZvXRvi4DcAuAb?=
 =?us-ascii?Q?PPSUSibluomYCjpzPB8DPtQHSgGCfCjgqjxhc+3wdjmewr1uHCORKzNAr6Q+?=
 =?us-ascii?Q?BvtPC2O3g+U6TpjDzifBOGcj6aOLIEtsor2apbJST3FbR5KEbUzdnMHbkLZ7?=
 =?us-ascii?Q?aN/1OQ0fsopP+tSEfrl0TMjvw9gZaBq2UkKRCaZK4UNXDppkJEwXPFRaOOKa?=
 =?us-ascii?Q?0OVqu6u3RNKJqk99FDyTvGJpnLBmk08Tb+U11fAJEhzqTa7cLiZO3mFr0oXp?=
 =?us-ascii?Q?O4HrNx+j6QA6iwDpRJlfJDbLENUvD4hk4kaiCzXd8ecSriNXZRYYIIr6O/Wm?=
 =?us-ascii?Q?Dfh9FD4KF3MOqxlJ9rOZygW/mHQXmYxreS4AaNYkHg+clrmljQrC8l9uacQC?=
 =?us-ascii?Q?ghSXaYWDMvbD3lBRtUkqUZv6G4/e5J458Sm7mFJGM4oc13Yf07j7c5ebWYYa?=
 =?us-ascii?Q?dCZ+kC/K/5NB45ue3eZuabB4N03pKBDbIKMtZOjUuJZ2wxNJ02SbyB1MS7iG?=
 =?us-ascii?Q?lB0Dtldn/U/fIjG5YL/oI0eQJwDZCL5LWURClBOMT8XfuvOTofOneejtQTv0?=
 =?us-ascii?Q?OZBlT+hhmXtQSy9hVcS2fpZXRClmbJZaRRjNEyLLjXH4OOf0iUHYqkicrey7?=
 =?us-ascii?Q?ymc5jzvowluiID7L2xT37C2KaeUYuslEiXeeuAB/exelpBmJVej3KxodsWMP?=
 =?us-ascii?Q?7ddEbAhpqvCkb5YeqLneU8LVnRyutvMDLl3t/MonaVGiHrfvIYpElMOo/7tw?=
 =?us-ascii?Q?FuPj7SNl35AhTqBtPBTt1S50Il42xDkchyWB7VZc+0hjqqlYqYCIgwwYHu0e?=
 =?us-ascii?Q?TAszTOy5/f2sg45NQ+wchGon05GKpSSFu1/8EYY3fwXyVbKQQfiYTt6zclFs?=
 =?us-ascii?Q?41eYqCdaC6OeRUW8URT/ckawZE0pku//eHdspWPxvHqDVmsc2bWtedidbNwP?=
 =?us-ascii?Q?Qo/FR0omPTFVFPudoJv8c1YT3pEDtjR1rT9nPgAEBEhQLaARlQed0aCtJFyZ?=
 =?us-ascii?Q?55nBRDp6+lcxgk3bkpZAKSjKa68KE+BduRp6UAr+Tr8SFFO20atSAGBJSZcU?=
 =?us-ascii?Q?YdWk0QIzAJcWdcPwNQU1OsSY6bBqldV/yjS1MLlWxZa7BRjtML6tzXAzvDlb?=
 =?us-ascii?Q?xWgweyXOyUi65IY82/6wl0OCBYP/NKyPGo9bPaNhfXUXV6MQAqDTTkHqu8Il?=
 =?us-ascii?Q?0mbAYysM5cQsyq62JieG535RUVOy64LD0QO5pxPt2yqdRNKVdoK7ONAwi2on?=
 =?us-ascii?Q?6bZQym8Bjwzf5lMSuPCtnEhi21AJIvCXkMhYgptKE+yEmFsSs7sMutxJoS+B?=
 =?us-ascii?Q?m/fhdeQT9+zmFEZ3SIXGQPyTXX6jgg5thtNoIGJbxIk0DAhC3/s0+3jbLG+w?=
 =?us-ascii?Q?UVSA6QVJZVjoSQIo5n5vhRbjhIyqjrdRdc7r2xu74mZVY8BsxdpRMfBghnBx?=
 =?us-ascii?Q?3U2aPEBvnmWij5t6IWDoTIA7E21UE3aN83LVUdAd?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 983f2a4b-9781-416f-e4ec-08dd18c05db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2024 02:14:24.0835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUO0Ox+YQ2rkgjm+3G+BlXxpARwXJvm4bkQkNXm+yKR0jfyJPEdIe93pkypKheAGd7av6zLDEsg48ztqTjaq3toS0nyN1pr8hWCZbbzqckw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_181406_137011_C19E9BFC 
X-CRM114-Status: GOOD (  11.88  )
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

> On 10.12.24 09:49, E Shattow wrote:
> [PATCH] riscv: dts: starfive: jh7110-pinfunc.h

Describe something in the commit title?

> 
> Fix a typo in StarFive JH7110 pin function definitions
> 
> Fixes: e22f09e598d12 ("riscv: dts: starfive: Add StarFive JH7110 pin function
> definitions")
> Signed-off-by: E Shattow <e@freeshell.de>

Acked-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

> ---
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> index 256de17f5261..ae49c908e7fb 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pinfunc.h
> @@ -89,7 +89,7 @@
>  #define GPOUT_SYS_SDIO1_DATA1			59
>  #define GPOUT_SYS_SDIO1_DATA2			60
>  #define GPOUT_SYS_SDIO1_DATA3			61
> -#define GPOUT_SYS_SDIO1_DATA4			63
> +#define GPOUT_SYS_SDIO1_DATA4			62
>  #define GPOUT_SYS_SDIO1_DATA5			63
>  #define GPOUT_SYS_SDIO1_DATA6			64
>  #define GPOUT_SYS_SDIO1_DATA7			65
> 
> base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
> --
> 2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
