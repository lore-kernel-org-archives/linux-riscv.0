Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6FDCD343B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LO7FEgsNZoL57Yb2QjO6VC9ta1Lusp41sVlosBWa/Hk=; b=n/ZZrGsDvQvhH/
	2tyAY9rjORK37Mei+b9Y82YAaAgAWeJdPEKMj66Zd/YFxmQ8A5Wv9sM4yEXw4mMhwtsamE7i+yIuP
	Qcnh0tHunxpHHRrYx6rSp+wYigcbyhCxvD2hH8WzoM0oPFR7Y3sj1nEbBzxBFNsBFjsjC7e/FUYNC
	hHNXd43j4FXdXALuTk9Rx117xKbOvZlhbq1FaBiw02y0PIwrpnKb0956hOkeoZpCMQLLtcRNtH14x
	FifJLDoUSuyCyW29hcfA191nnT8zwwZ4RhtxQRhNKYTUoCJXXqs15MpaDpuq3BH/P7YZ3lwklat7K
	0ayM0iNYPRx00OHLR/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKs6x-00000002t12-1eLe;
	Thu, 07 May 2026 06:21:27 +0000
Received: from mail-bjschn02on2106.outbound.protection.partner.outlook.cn ([139.219.17.106] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKs6w-00000002t0X-0y2v
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 06:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyEiBECynlyO2v11qdLD489oa4xWWsPxTFw8wycSHCabtdktSreAC+W/7xgoe5SIoogMZjbuYAuFT9oW/AW4/HFmjJ/twgUte9RHvfZB/nNdUbdQwM+EJnNduymVGG6iuINpRTj87927xMVBifNSxTgtlCUjCkeEdGGOPnWdrlIKkoaKu7HTPZd5+GLqaPFOv+k49M3OLIIj8IT7Hx8XcMG5Bjl6TLVJKgiKGoGf1vDX3z4GeSbQYlB5/22epmDapdDU/t3FhF7gnMLS3yBLEyZZd+cGIOCsvcL4sJ0ax+AMVWuDx+M4BOc9AriopF+T3CMSOrliheNFXXSkuISiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ/532IYXlc85i4dZtMhqmnZg7K0maUBx8jLRCOdVns=;
 b=Sl8uA/3E1v4h2GXd2qCjqxnC91g+SkSJ3rmDA+b2e6m4ZX1tIIrRsm5wfM8VBCPHOkTaSmiBF34QvD29InUERwEDcnoxpXHC/e5i3PKLjTMl0OAq1hgsJNbz6xTPxQjJziXHSqOaToBvkGzSDO9n0rZvN1Vu7TBMtI4QMSdU4oR5S4NWbwclcSHcfy+1jf/PcUERI7Y1PPVKvTTonXqLTCdWQV2MnbcXxa1SaJiEdGZO74lu8saCCu8bpVNKGVVwMlh5CQA77AP35bUJcYyRiKHbZJXAE2Qh/DJQuFMamYLzgICwqPvSu866v9ULqPHWe+onNmwxq9OqaBDraNtjkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1273.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 06:21:06 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%4])
 with mapi id 15.20.9891.016; Thu, 7 May 2026 06:21:06 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Thomas Gleixner
	<tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Thread-Topic: [PATCH v2 3/4] dt-bindings: riscv: Add StarFive JHB100 SoC
Thread-Index: AQHc3Ta0o4EXmzMgyky8fIcOfSrv+LYCGPEw
Date: Thu, 7 May 2026 06:21:06 +0000
Message-ID: <ZQ2PR01MB1307650729917943CE4B8465E63C2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20260506085937.754808-1-changhuang.liang@starfivetech.com>
 <20260506085937.754808-4-changhuang.liang@starfivetech.com>
In-Reply-To: <20260506085937.754808-4-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1273:EE_
x-ms-office365-filtering-correlation-id: a771026d-7aa3-43b2-40c8-08deac00d279
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|22082099003|921020|38070700021|56012099003;
x-microsoft-antispam-message-info: CcpysAfoeyOVpnswaCxD8dufJ9cndKS4AuLVfSlaYC940n+lvJpOJ5jvUWGrTQpLn5f0S5LpeBlSrKLVxUHLjF08xmynCNEOO1NtR7hBptkqkn74AEGkKgJVf5BtK+JmxQFH3dOKGmqQ3tlIQ1yal9pstLxugZcqjwBPpEt2hV/QXJPRNZYIBpoxjUXXSprT/7UyTwjTwzSy4NYhnwCWDkeOmAz/2Ig9p8hageB2Zn5pkWMoW4jGoe7OkNuBkZ8scGZ2pHtGPIBrW5E864dpaoecnwZu6OZJiXJOfddQf+JiWCp2eDohf0laz4M8udsccAR1A25gshnnOF2qJASsmJV/LsK5MCE7EJmel+6klMvpaApZeiURwGs7fkJlZiMnkwfGvVHjj8VTWw9wneuSfOikgFsWyNx3v7nEF2tyjnRvyB4v2r0isl7jAEVOofSY8FBObhQGnLkzpSj6WKdtbN/hYgNaDUYdb8HV2zxEq6r/KfyFC/G/8bOoG4wZHPcO+KeBSejsyuzdCwvov1c3vT8xcZcHbma74KFdJaWb5Qx2q584RphOJnV/k6uC2rn1rAteH48P/4wzECk0p5iOrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(921020)(38070700021)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lk5G2sZE428Q6CHmycPI8f9NpJVudUngbhBRBHGBlxNDo3WH0IxYy5DOeSDK?=
 =?us-ascii?Q?CPG2wAxhMmRXqfH4LO7G6b5yl3isrbd/jvQXT5XFb2SOxIPRCvi2AfMCXvIU?=
 =?us-ascii?Q?jAZ8qodyffuHEtxBaoAsxKZ+lotwiJtRZLmmNaZ7maKqZRoT88S00NkAType?=
 =?us-ascii?Q?azVzBFnZStcPtfBjt9IPo+jelJbpzOsUzpHaZW67I5gB1qgjbMiqZYqtcqq/?=
 =?us-ascii?Q?9V8YLiqt/Lz7QMs6JEHaOLqW7UrF/nMSe3r/9+RZwDGK68LXcS21s9c0oWGN?=
 =?us-ascii?Q?F+8boMogKBUncZIa6V9Is9a3hFdCa2IAyFIeHn3zP2SEa9VUpdthwkJVfKnV?=
 =?us-ascii?Q?wYjoe6DpqiKqTaRWuYy/HtAlm6hl4NNNthLisqGNr+kjBkPtIBU4ONtyJGm0?=
 =?us-ascii?Q?gCt6szV7XHyn0XfPYAWg3Xl3AQJLYYz+8vx7AIB6sCOR0EWQzRsN5+LgX1a9?=
 =?us-ascii?Q?ww4MmisjagMU/9nDDET7bbPv0KRQ/m/tWiYrWmaRLf2b+LWtLZotINHAHse1?=
 =?us-ascii?Q?0OZjhkBXpZkZCGHIyHc2Az9r89wSfLqHC3nLqcJaHxNvna4KyLQTx8XNxdhZ?=
 =?us-ascii?Q?5aVdJJms9qumCDaMklJC+ZiadZMQucWf4XSrz0rq38y8LW4+AR6IkXnGKBrq?=
 =?us-ascii?Q?3cClSvPJQ04vKRZ1iJ2Zc7KK+2b7r3vahlhc7Hfn6cEBAnFSeYEW5o9vw/0I?=
 =?us-ascii?Q?bcpvjDbR90K5qcSNa4LM/6vJgVZRARS8ByNYLYikavdUDmRd8cO92T9AiYCs?=
 =?us-ascii?Q?V2+/FpUHJy9WfCoygibgvmU55rWJeEwk9ABLbkHORO8HBpNID7ErziERR78+?=
 =?us-ascii?Q?LwxB4RCTq8twIez35hNeRer1nuWAXjF1y5PAV8ncgaJWoUmPSHZ2yIuSOCp4?=
 =?us-ascii?Q?TqKFGgLjqGAZQqNaxzdYKjbyuoF4lTY1BtRPvrqh0EGVvHZs4iK3f5SGEtTl?=
 =?us-ascii?Q?TstnKARAjhUzoQzZ6S0vMU0ZULs2Tk+R1M8FdUrf4DCiQEjGjqcMs2sNjdT/?=
 =?us-ascii?Q?gTs8ODuMhXpk7QShsqWqm3nDUIUHQI1fOJNfPLI3QveWfBnGTW2tl0dnyKuR?=
 =?us-ascii?Q?XYF2ek/KVn8IewAFc00yFtSYCZhNTVPYwb3p2lscviszwo3Oyydyu23IXoxO?=
 =?us-ascii?Q?S6KmG6lOTjsT2k36Jd/S2Cv3wVNYdfPmYjtxSKlZPKhSrsEHp+Wd4n/earfg?=
 =?us-ascii?Q?5OtLRFr++bCpFZ31IITgKwNwyc7m9PTH6xpUv0B6SwMYdN8/jsHeg2K3BGhO?=
 =?us-ascii?Q?gF0XTO1jO9oM9zYDMFEwP+N/WTG/vX0JxeohBX0B3a2IR5/Gqldk0Kpo2U5J?=
 =?us-ascii?Q?2rNyQQJcEIXivDEuNmhCEwZNvx/N86j1Kh2yMHBYziGCRJGFugP20GrwcOn0?=
 =?us-ascii?Q?j2qvHUASjALF9cFkjvfvW7V0F4G5NNYu6ErPnEwxeqy2bOrfXCwXhX9q4niH?=
 =?us-ascii?Q?4x0ATV5lHHQeQhkqIkn5oPFQqNcMf3991caLSj+Ef5k48EHt/A0ni8/VEzcR?=
 =?us-ascii?Q?RUj4st8LKLze2kydWKU7DT8mHSfBWf4T4dQ0c9SiFlPXPoUDVzwM7bzAt1EP?=
 =?us-ascii?Q?+DB4xNLkf38Vxnwt4AkLtX+3vIf/9yhefgQaey0G8bl4MZOKyeVFhOak9S70?=
 =?us-ascii?Q?peC8VWp8lgZN4rWiy4M6dSL96sA58jYEVJ6FX/vnAwvPuYoTJ08Fv8Ogd9uY?=
 =?us-ascii?Q?up+Em5Aodpx6YKroCAz+BI48+FskRTYZDyg4cNrorbGk8PBvkUymgj6upQSV?=
 =?us-ascii?Q?avG+eeygsg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a771026d-7aa3-43b2-40c8-08deac00d279
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 06:21:06.3942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aiYLKvYQjwjAgiDBXrbaMGpij1jL1jViiWe1LR1txsWJbbh7RlMvQmHKeSSg7MD0F8eZi1ojSJhc0SWgCXhpXcWIdcOmKVgCwLll507WUSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_232126_271016_DD925663 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>, E Shattow <e@freeshell.de>, Anup Patel <anup@brainfault.org>, Joel Stanley <jms@oss.tenstorrent.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Drew Fustini <dfustini@oss.tenstorrent.com>, Guodong Xu <guodong@riscstar.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, Yixun Lan <dlan@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> On 25.05.06 17:00, Changhuang Liang wrote:
> From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Add device tree bindings for the StarFive JHB100 RISC-V SoC.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml
> b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 8ba0e10b529a..277618efff6e 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -43,6 +43,11 @@ properties:
>            - const: starfive,jh7110s
>            - const: starfive,jh7110
> 
> +      - items:
> +          - enum:
> +              - starfive,jhb100-evb1
> +          - const: starfive,jhb100
> +
>  additionalProperties: true

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
