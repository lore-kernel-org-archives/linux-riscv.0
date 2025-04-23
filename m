Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF0EC369D8
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLQIwVFEDwA98T0XD6sSL2bsYJIO7jhJBRyTUqtN9L4=; b=ZJFNXH0Mxi+4HD
	eXmvsk03YozzBYjZwVCDjbSED2xB+0w1z5+1jsoyOapJZUjFSeMHbaKtD21EKhn0fqBj54jovnxOo
	NYyfi409jsbiNGulCsBNbL+E2jEUzo32lD+DhGPt7rHQNFot8BwIWP+EVlsnJrxQVBcM5V/uC9EAR
	wwpHzWcoU7TcSVVoTzSIjC/XLNRqnyA110gfqDkzoEWjVMxMmiWm5gvHT68Siu4kGvK7cXosC5uWE
	huEBDE22SbUR7/hSyjwaT8IFSWEfqjZ05rQhv5EPZSAiR2J8GIxFPr16sIWYGNkOVym+U49TWhVOB
	zGDIYvxm6L5ZPMK3obew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5b-0000000BIhD-19xe;
	Wed, 23 Apr 2025 17:40:52 +0000
Received: from mail-vi1eur05on20708.outbound.protection.outlook.com ([2a01:111:f403:2613::708] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bJN-0000000ArY3-1pi3
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 14:42:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/ZmfguYP1vK8saXfq3pdIvO+Dqb9VqXv9qjnX249VMiv73GPC4Gk9fewXjr4Szu19UjffwLfwlkP3ACwMB333HeSIJszmEgn1EPjacenGr9pd7ebq3lBZo3F6aCX2UHBbQ8LdcfcUKa2jhRj6fZ5iwwMxhg45v0B4OJEKxmwndcZ9z28l4JdO6ZkPR3D4ig232XtNC1p//mf50v1dg7nuexZaPyeWCqW8zhFyNJwjhcM8BZX13csFm4XqFLANmR+2OGPxZPVh3tbsKSPLFmrc9xnh2stdJ35KiaxVRDMMwbMUVPmoO2GfIzmbuPOx7Js+1zx6kv55FR7EyAvBZhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOFbjaOlNcVsrLrhnY17laDgODeHjy6cHXLeTcghvS8=;
 b=BRoSNf/aymXKrTb3RRoeLUTBQOdx6Jp/x6AyYP2H4AGuFXWlU1EKT3UuK8zUrVBY/4xC/cmMZswYYjrnih1h+VyT7dVdhemVbYmzgnKn+L94aR+k61svZbMq/ulEy+Fybk5NTlxYJVdeb/Ldni81eIh/2irsEN2j4mEhrOZicnYDJNdB9JkpXoJhOmTgbdK88SrcrT0yfedcKQoyIQ0qurt9AuOCM9D+uSmA3pf/Km55mkflM+JHt3PIEX5GnxDgiq+DIxnlIrN2fsBU4Cfq7ZF3SqxsWPbK3sOySQbs/HS9veNRN6UG1hxzcViSR+MfZkdMibTnFfTTdYcv5JdL4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOFbjaOlNcVsrLrhnY17laDgODeHjy6cHXLeTcghvS8=;
 b=ZoTGuObZHBAKtiCTuFtj82Qx3Do3/J1hmU8SO3ZGJCivTR+81m58YzsJMpjf7ySYh4A+3uSCf47J/a+ZZOY09sp+A8Pr6Hsuxi8wLptfxELg2QPt1NFn9ly1YjrW1VMTKyjVPs5D+m+lsbVYnJEPWJetTDI/WUbfbrIHjIAXpzATKwIkhc276Gh40c/X6Vin1Z/80s9pxc1db5X0hW+tWhbLfbhUXDzawqn2pQo1hGmiM9dV35iqe5A2mZTH7lFN1fm1PxnASFliVDQNk9qEB57tcVcPzN9AyzXz4ihYsiSL2TDVVWv1HBKD1pb/NG8S/ZIH0eQihd/bpvXthUrJcQ==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by AS8PR09MB5831.eurprd09.prod.outlook.com (2603:10a6:20b:570::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Wed, 23 Apr
 2025 14:42:48 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:42:48 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: Conor Dooley <conor@kernel.org>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Aleksandar Rikalo <arikalo@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Dragan
 Mladjenovic <Dragan.Mladjenovic@syrmia.com>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Thread-Topic: [PATCH v2] Allow for riscv-clock to pick up mmio address.
Thread-Index: AQHbqV0f0XhfF7yqG0aggt+vaqf91LOcsf8AgBS0YbY=
Date: Wed, 23 Apr 2025 14:42:48 +0000
Message-ID: <DU0PR09MB6196914EA17DC03C40DB3211F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com>
References: <20250409143816.15802-1-aleksa.paunovic@htecgroup.com>
 <20250410-squeezing-outcast-f717ff17817c@spud>
In-Reply-To: <20250410-squeezing-outcast-f717ff17817c@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Enabled=True;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SiteId=9f85665b-7efd-4776-9dfe-b6bfda2565ee;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_SetDate=2025-04-23T14:42:47.774Z;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Name=HTEC
 Public;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_ContentBits=0;MSIP_Label_d2ca9b47-09e3-4fe9-a702-e3ebef7456d4_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|AS8PR09MB5831:EE_
x-ms-office365-filtering-correlation-id: 9685d3a0-a585-4e49-e4b0-08dd82751dea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?sVAIaLl/pIc8JfJqoM76bwsOZ/pbvCRkKz28FCuqJJUE+IZZhhrltDYx7r?=
 =?iso-8859-1?Q?68m2Mtl5lyD3Syu7cLgGyLetefxwMO10hnxDOUvQ2+WDz6Wlxr6EJBS38i?=
 =?iso-8859-1?Q?t39HzxHALOJxrwuGZiD0dbf/p4rsb/KHPLgv0dFY9TFJkgRkcfNUk3oVAb?=
 =?iso-8859-1?Q?KkKHZmGXkPf3JOHd81k803p9NRHQu3Gc7qjNFHClnurAA/7MyvBBsCToZV?=
 =?iso-8859-1?Q?JSw5wxMa6X8y+UKHSOPIg+7z6p0L0OgaxYOUzByXm17awv+4PHeGH2tgx/?=
 =?iso-8859-1?Q?ElPNO1/CmtPkYdwHyzpK/RZL0dRg8qXOKLb+mWA9VxfkyFqVqjjDElZMjK?=
 =?iso-8859-1?Q?5QKwCCTh+scwkfLOFf85zykDjp9dF4CAXnOoib8gprVgK/iNfeoJzG7xnr?=
 =?iso-8859-1?Q?eTY5tKXinPdjgPcdtgXsTD3qZCIdSfSW7zgyb44MkR6lS4SGwnQ4K1yTh6?=
 =?iso-8859-1?Q?Ypjk+DFSpDlloRj/xkFnzvzDcjW1MB15CnfgbZcMznOAMMc6RsmCD3E73Y?=
 =?iso-8859-1?Q?homlfNEaRRCD7a7+9hZJnNw14JVpHmKjifkCaeqnetSQGPTOW9qsfoJ6l+?=
 =?iso-8859-1?Q?w9HA26oII8l6OwHWGQRRUXxMHcwIPgQi78HpYbiR77VKmYK4hkshgGFZKV?=
 =?iso-8859-1?Q?vGaW7F2Pr6KnfdyrHMnIwRVHBsHJkjO35djeQAm45fJ1g0Mltstx0SZDIm?=
 =?iso-8859-1?Q?vXy9e5RqfSfD+oR48GgDS/+rPh7AyliByX3xGzzlnUYmC2GdQi36LyYV0M?=
 =?iso-8859-1?Q?vH6zlF/6JYtAAC73Moya6JqpYBmMoHuADD6fepdDGiyGvbh8NEuBaWrONe?=
 =?iso-8859-1?Q?/GCPw9pW0Rj4wCoVe7wkrI++chw9TsKgHXk9zltUqDL0IIf1dUEUy7KIaF?=
 =?iso-8859-1?Q?LSJ40iK294ioQ0x7xdM27MfNwcZ9ZZYnbojVq9FGm1oTnWSh//g2qS7W/4?=
 =?iso-8859-1?Q?sjhfcIM00lLFeHf+uPMA7sVQscK36fA8ah/4X9ATSSBJZ7mL4sKdvb+KEt?=
 =?iso-8859-1?Q?ckMrdhWrnn/bvdCQs6o7w6j9iqcs/bOCH52TZkkE8RRytCI1FtIYeSMsK6?=
 =?iso-8859-1?Q?let2+nHZEVuWnYSFqBJ2sk2zgudV3a4mpX/d+3/9JQuZXhaootnJGdVQJA?=
 =?iso-8859-1?Q?av2WW/2GHBb0+AQscU+qmYb62yci/PdG683q38U75Xm4uXHF1/CbiGVEBu?=
 =?iso-8859-1?Q?Hp1VCRfGyoCofjvJEoODgK7NPcvo1AsSD/YSREjWonck/LuHf5Vp2S8pog?=
 =?iso-8859-1?Q?Rp6dV77q5Ccd57hg5JqeYKZLSPkvRqe/QPQ4CqLyZi9ofwEI2kB1RnXexZ?=
 =?iso-8859-1?Q?wKVNePmSDunZfK/uNg7z7m1S7P1+9ToPp0SHXWOTLVwH4nwwD2fW6Dytko?=
 =?iso-8859-1?Q?0w+klrkJxgh9IgpGgE6g70QQisVog/QJzRIm9CZlY2P/jhEMytKK26zoDA?=
 =?iso-8859-1?Q?eTskQkDzJEnbJO2CD3G8g7wxMMwrOnRQYu/BYi2LpGXGOZPvGyP29eJkvo?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PU/lHx90zxEWbT9AdSh8lT2LZltOg9TspvTD0YelpHdAudX/8E/s4V3kZQ?=
 =?iso-8859-1?Q?SsP/7+Q1UJGAXcUy4HrAapZDsTZIVX8hM8uDkswii8xHceCrnkUsTgr9cX?=
 =?iso-8859-1?Q?iq9EBOvJs9Dd2UuJyt1/u2KHOhgyeliwxD/rBKP40xPQ1sN1cF0aQ4AXDa?=
 =?iso-8859-1?Q?ND9cqIjwC3nOhY0PuGm3rNQjznVGu5k7WJEKvNqa8dwX3NsnoDdYRdXY4h?=
 =?iso-8859-1?Q?nJWk+x3Lvf1VwYqQbAATUI6B7eX0wMypxarfeviAnW+zFuwujv0gOb86xm?=
 =?iso-8859-1?Q?hBFuNf1vivd+le66NzP1YCaIZIS5WpUfOvcqoudaUH+ERynUAUDAH7Y5C5?=
 =?iso-8859-1?Q?zai/1WXT+MKXTq66TMQZOhkWoS054OUktuVnA+LIwaC4QWopitrcaKWihV?=
 =?iso-8859-1?Q?UWFxCyBTq0E3ef1+OSGtP1S9yMbqJX9/gaSWJ6pkFLw/LvSAFCmXhv+iQC?=
 =?iso-8859-1?Q?at/DYdo8QU3i8907qREuMeX38Yl83H7tieDUO6nQCF1rYxsx/RT2MHSUeZ?=
 =?iso-8859-1?Q?soyvIZbEEAIGAztQAN7DpPh5mf5QwZ0GbSfrng2eR4EXw2+zy6P9xDK/VY?=
 =?iso-8859-1?Q?911xMxtY/WhV/gEW2tOvgZGkbVEdi+sv2A+Ifmm1j5jODlRZsO+BFp1XhZ?=
 =?iso-8859-1?Q?JbkUMAnDpTXghPafK6+MFb1GjFsup4Bw+IyG01XjJtCBYOfV4QONpnU2hc?=
 =?iso-8859-1?Q?+nOgk4oZYy5bp468Y21HxK7rkw4MP8SzpRoU97p6MmzeLYPa9ECSqFp8EC?=
 =?iso-8859-1?Q?qh1G7XM0RychIho7WfwW3mqxqvrT2akebTA/3ivVGfOKdJVA5U+QTjk+8X?=
 =?iso-8859-1?Q?sZRVnWYKZJenznCiWefxTyHEJCDeMF4DX9CjVGpi/E1QBaZ96z2mqnOWsI?=
 =?iso-8859-1?Q?Yz2yO/GemTcAWwt1CMQOwXH2mJ5xgOkFyVNmjo6tqcpf4oeZlHpWnNKtna?=
 =?iso-8859-1?Q?6DMNIRvzd9sgLdooB3Ne1omI3BZ3l3ON2RBDFG/WZh8ZRySinQDLqL4GCX?=
 =?iso-8859-1?Q?RwNSm+AKbMl7eEny93fUwqCXfL8KR7r35Ddb1NxVPOSHZxsZQZxTHGyHCL?=
 =?iso-8859-1?Q?XU8/KP/JJ1jUlpSHXoffPTxik8yP9C8obZ0TC4US81fBiUnZp4vpC7D5Qg?=
 =?iso-8859-1?Q?GZ6LQIOyG3yfvy3Sip4/kTVyFUXcp8MZ++7y/NAV8zztfejqj347GDKF2l?=
 =?iso-8859-1?Q?JetY7pmk8dZZEGrZkwLoTCkaKleOmNoYo1GSsX/r693ikBbTrmH/NIjHdF?=
 =?iso-8859-1?Q?JAWZsbU494LlyWgPEIbsMO/V3zc8yBuaGrMZkNti944ShSlSEbSXae/Q10?=
 =?iso-8859-1?Q?OdzKSqrHAbbefuYzbYa1lvZXalaJK2IT4qTf6BmvcTnPupKPAjGc6CyTEi?=
 =?iso-8859-1?Q?9l/qI2+wwsygOsX/rxrHjSJwK0R5dz79sEf1jlDm0W0qmIXQtxOG/azG9h?=
 =?iso-8859-1?Q?ju1tobSoRZmI/2zhXrvTpkZUGc4C9QQ9fli3NUfx/y5pYhR/AVyj2W+jgP?=
 =?iso-8859-1?Q?lDhnjVMEoztSxeAijtQ+uON7LkbMGiWDvkleuLZHbTh8fo10pkCdLbq9Gr?=
 =?iso-8859-1?Q?CHXpKEeRnkfg6o7FWJBXdMr9ZuypefUd5RRwEWQlGJpjKPAfx5QPt5lPFk?=
 =?iso-8859-1?Q?5YwmpLKdOlXS5wcGjaWPvUB0J1ApOLOlP/mURZDf/y/PsDjTsR3wFU9Q?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9685d3a0-a585-4e49-e4b0-08dd82751dea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 14:42:48.0785
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7znBgGUQBXqEG8bQpKRzNSzhXBJmF3G/2uuSFsNEjazEqNMJWpBZxtM24rKykomUFLuuLCM64ZA438yxf/aFLhqcKv5Y7evIWV+nT0atYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_074253_499704_789F5D50 
X-CRM114-Status: UNSURE (   6.25  )
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

HTEC Public

Hi,

Thank you for your response. We have addressed these issues (and other issues we discussed in private meetings) in v3 of the patch [1].

I apologize in advance for any formatting problems. We had some issues with our email client, which should be fixed in any future version of the patch.

Link:
https://lore.kernel.org/linux-riscv/DU0PR09MB61968695A2A3146EE83B7708F6BA2@DU0PR09MB6196.eurprd09.prod.outlook.com/T/#t
[1]

Kind regards,
Aleksa Paunovic
________________________________________
From: Conor Dooley <conor@kernel.org>
Sent: Thursday, April 10, 2025 12:21 PM
To: Aleksa Paunovic
Cc: linux-riscv@lists.infradead.org; Djordje Todorovic; Palmer Dabbelt; Aleksandar Rikalo; Paul Walmsley; Albert Ou; Daniel Lezcano; Thomas Gleixner; Dragan Mladjenovic; linux-kernel
Subject: Re: [PATCH v2] Allow for riscv-clock to pick up mmio address.

CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
