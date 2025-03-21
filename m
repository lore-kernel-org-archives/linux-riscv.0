Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED854C36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXMapTEHMFtdkq6yn1mN/K/dg8lw0Opu7aJmykiQhTY=; b=o2bN9697mhMDqV
	NWvKQqcyHS+52UAUWcKNfdkGggizIYdsFhVoKpPdeIjGtfLUquRYZNw5uPT/Am9ZDQcioSRZ9sm9M
	3lfkVIImdCD4gi3v4kqX+CYuPhS+al+y/Mw/hVDaR8N7/uXJccWyG4nu4+HHySGrRDAZ2z7Jn4Kuw
	6KLkwPnIST99YG2EFoIIKT7/uTI1Ip2dtS93ZaCzPhkAHk3OoeUmMExnQO3YHvjWsB8DLQXxJMw4W
	Q4qsV/ipmp5gQn/6a1+nOu/zdxUUAT5NQTYvPIiuGWswWNgtuj2wczg0aBWR9rXgKwGitFz5IAqDO
	z//cNNHzWweAu/cGr/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaVo-0000000EeyI-3z1v;
	Fri, 21 Mar 2025 11:26:04 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaVm-0000000Eexh-2fKI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 11:26:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwNykYkXcxSRTuXAvQHbw0QkjFVSlWcVb2cPAPraOeaxGcQpruNYDxI0P+cx0VCW1SJc1Kmhx2qonpj3Dp24zOtpU+NHGbu3sgBw7PZ9Xdk/ZQ75SZ91vJoZ/q26JzRbDSeQn1TSXnXSwLMpleLpy1hcsrI49xihhKXeOSr/hJ8s2X2APRcBwOhcC2/KF8Vib+PDNXYu5uQsHxHVtZF6dZoCX/158mxoRaW7okCta5lgh3aNsWBUl/iHyib/urEpEPExceKEdeEhiKGaTJAAfHMXkDwtAEhkM6Drn6Rfj7XGPaoqZmM55TR3Dk9jRK4KTbqA08AcI6i0j9r00zmMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7z0APYeJy7yURnQeOtoEC0utGJy816d4d4RVY0E6bI=;
 b=Z4CgRUJDYE+i7WYsGX7r0oyM0WdKoLXtp/AmTlj70O4TPnpO+xG6/mjNcmEaMoY1tkRp5vXfAr0bgehLA89HxoLRbtEM6um2iw4wh317J0tPm7ncsu55tjH3Zc0Wpre4WVD3JLRwsnfYdVD8ptwC03WRZqA/Gq8WvqcSXv26E6UJIqyALBLk3heClpibSrGw70VG4ATmSr8x6cD8ySVcxVghU45jReBQ+iCgJ9gsz+LgH/8Yb4+NwNmbWFiFriWXlZERdDWNelM8kxw//cTO5GNuCBN+wi8AFGF0O8NJ0N7zcQ59fRe1xh+mGC+Td3ZMLPkzJf1yLCBFbfrlC7XKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7z0APYeJy7yURnQeOtoEC0utGJy816d4d4RVY0E6bI=;
 b=LgMfr6RAw6xAutDfLW/+p0QGIwAztaumvQ0JlFY2VCYYB4bixS2y6Z4jK7aNs+xerEmVO/3DwYaoEzxjbf/onD+V7mbhxB/61MDUWglyh4Y59F+lcvPbhbJfUeKBTWb5HxT0jI6hcQBA+yJ9OQBmBPRiB+u2yr1eyAo99VRlSYY=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by LV3PR04MB9220.namprd04.prod.outlook.com (2603:10b6:408:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 11:25:56 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 11:25:55 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
	<linmin@eswincomputing.com>, Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin
	<peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel
	<anup@brainfault.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Topic: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Index: AQHbmlQDH0NeIyhgX0KZua2i5HA+WQ==
Date: Fri, 21 Mar 2025 11:25:55 +0000
Message-ID: <SA3PR04MB8931D68EA57B0A4275FDD6E783DB2@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311-backdrop-porthole-440ae005e8fa@spud>
 <SA3PR04MB893164FCD6C4CB8924FC8DE583D82@SA3PR04MB8931.namprd04.prod.outlook.com>
 <20250320-uprising-couch-0af012a1fee6@spud>
In-Reply-To: <20250320-uprising-couch-0af012a1fee6@spud>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=e992cc37-5758-4a78-b717-c94def3b5169;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-03-21T11:21:58Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|LV3PR04MB9220:EE_
x-ms-office365-filtering-correlation-id: 99f0678c-ae70-4454-29ee-08dd686b25a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ylvbBuVizme7sNP9mSAv7esia4G9Y51GaV3XvF9/8zmnzaaivudeNc9MyEZc?=
 =?us-ascii?Q?HiIdHeGUGfbf3xtL2WT0zgIZSE3xkMciIz2zEVMZVbMPrx83W+GB3y6P6BdS?=
 =?us-ascii?Q?VW8B4hhqfkAqbQXoWICEZ2UQghZiw7IcC/Y1izADkNHpjFSJ5EFk6jwR0n1w?=
 =?us-ascii?Q?kd2nHRmqR3szpyZB7HG9Zu33/JDu3UNLii2Qzv3nB88/XCI3wED2R4xsPSfT?=
 =?us-ascii?Q?WVzmdGGrWxFIHdKBPNCGvu1Y6Rn1ZRXH2Z/meg0tt0OXGq+aYf704AIDM76p?=
 =?us-ascii?Q?Sw3Kwg4JjIqYuiNCmlIJq66xevJkh88lobtIIHV/p0r/Pi+9n3J8MYDrTUF9?=
 =?us-ascii?Q?aInralk6KPoFoz0Vl59EBW4Lhc4ISUF0/0PqAizS8ZROKQlJowfFKcKTZO3O?=
 =?us-ascii?Q?Pgvi6ryN2XOepW08Z0VSUtBFTZ1iNllk+cjCA6TVrhTmi9PsYHCEooR6CsHd?=
 =?us-ascii?Q?b5Tr5IoSyXMYMBbCd/EnxhkzPfJzjC9Hatd+/hmzJfvShYpIRw0jSCmf3QfC?=
 =?us-ascii?Q?vtPohgaioPE9lWHVOvsVYSbY5wxyOBzUqNHDef6QfObz+JFa1Vxh7srfOGIl?=
 =?us-ascii?Q?JxmQe8kbSp9aLa15knBAbUVY6SOAG0CuFEoBPaZCvd5P2z/t9s7W8TMM1zpE?=
 =?us-ascii?Q?l1YfxhDfO3hGFt1omZeIt8gTtApxyHlZ1lsgjYymP2l3XIaP9lza4rMitzEi?=
 =?us-ascii?Q?Qoph8J4tph7dGn2vaQtRuNSmyoveFlZXXNcDgpWLIKSCDgnTNGIiBibNBJBd?=
 =?us-ascii?Q?EnHIf2MTCLDrUZ8PIuvbVzPSZTACev1hTAkqhd7MwkqNyRZ0avUYqAX60oDx?=
 =?us-ascii?Q?YUOqA8tycx7Qgwu8vR7qki4IInQuhXoc3Q3G/dVWhaONh3jo9WSJJhx3a4qL?=
 =?us-ascii?Q?EhU1Fr4H1nxBpXnqvwm19wKZn1o2iP1/nvUPLOfxPPrkyaydND3FMI6O/39Z?=
 =?us-ascii?Q?uxQKh9dkBGmGieBvr2jGhOIBp5yTC43r1TEHyu+QE7gsttftXO2pKuKK9obl?=
 =?us-ascii?Q?YwB97xZq7R/WedIbK1O2eIVI0kV1TouymLDacaGPNXy6blmw7r4A2hoPi58w?=
 =?us-ascii?Q?hulX+5Fd9Rsq/hPHedbHPZcPZbCCxnkwkGJcNqTMDMlBFpPwxDtjeJhhW5uU?=
 =?us-ascii?Q?pC/df6g8S/weqE8O6hg4nlf/gZA/LR7noxcx2gqcU3zT9l98+nLjfxS9aCJo?=
 =?us-ascii?Q?YYgnxVs/gVvXFbaGK76t28yH8v19mQNe+EnC4NsBuafzYwz1Ft+HE/mAWzJq?=
 =?us-ascii?Q?EmxWLq2fDueJ2BT4Zs8V4qxTOQ00N3gnSvFyq/zuXM77ZvZeKvu1KCoWT5XN?=
 =?us-ascii?Q?4n5/i3XMR/FrOJ8kmvLmrjCNhyYkX8OStbca7iobWXml0PqqsvkKhj3ONrx9?=
 =?us-ascii?Q?Mu9msu6csbEZ7fIpDTOCW+G29HkKVbcRpR/bt5czfIaNctd8gL2LEzuODU2g?=
 =?us-ascii?Q?NJwP7EzHZrkYxv5Dbl8XONX7sa5ksJQE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O0fr4hggPqxT2btZ0dyZaE2/HPg4JbKp+Sl3lBEiDTIrnVJ8JiSD9dTG6s7O?=
 =?us-ascii?Q?zZhfW5HWDJmGSHW0CWFYGErwzYVeZHh9rTheXk8rRcl5TMbK7/7ki9g9D4B1?=
 =?us-ascii?Q?qUIteYixh7FFvxLFxz9YF8+7ISJ8j6UDIrA4mOqBlOmh22l3Mn6C/h3PI53e?=
 =?us-ascii?Q?HIENx4/HhIcpAhT+MM+fc7ZjfjpcW3pGWYKNGYcAny7iAkQaSZN6gGkCcnSa?=
 =?us-ascii?Q?/s9Upa2zX9VzX4MPhacHEdwAYC+Fkbd8FOLklNIwXynE6qMRQ+T2HMD0qBui?=
 =?us-ascii?Q?T/uMDlyHnxA99PBqk/yk/nmYtiXv+DyG0W2hxqQEx8UVuncrIcx0TJe5JEXA?=
 =?us-ascii?Q?bF/CzLI+okHLQl5Qdez6KpdTxArVTJLF+c6F3Wl6SOs41aC7tV7S9Jzygy+Y?=
 =?us-ascii?Q?FoG7ypbNhYz4d1JT/ikpuk/oLI2Vu/7nHp9OwsNaEoJEcRhY1ryz9nudrkYo?=
 =?us-ascii?Q?/fSRaDHr2ZBX5i50KFfeCp77HxqPiva33HG9fIsA62sAyvok8jTKUqkdK9lx?=
 =?us-ascii?Q?G1ks8WmyJaTrTD2kHFvpTQ9t6egMs3gHx1PZGrUEsk2n4DGC1dib1oKNW9Xz?=
 =?us-ascii?Q?grYtAvatrgMY4dZX9mYOXhyH1D0fXbrCmds1fwYKlkb5otQnv8PGRPwxvnx9?=
 =?us-ascii?Q?5U+qFZr44xWvq4CKr9x9JnXgE8TehI3NeuLtyPWaspCYxEhbhNyeuczZ2MA9?=
 =?us-ascii?Q?n/MRRInoVhlP66aedjW0ZoP4h4tPY3FsIPtr9xFVtl2TpIGtXWNS1IS0OtH0?=
 =?us-ascii?Q?ShgD/0oIP47nUd1h1KSLpuGrHbRxCLkaA2fJQMsAMvIfsaIYT+oEY0ddTyYm?=
 =?us-ascii?Q?FMEwsBdEPM8+yjoorT0iUhAJGEPKb4wJ31hBZuWInUligaTRsmWmKQlA1rss?=
 =?us-ascii?Q?aRcdFY5cnYnptwpWGjco41hNSTdkfYCHSfyhHrPhnbQeee2QCGhc7qV3DFsv?=
 =?us-ascii?Q?RwlvUZDttXZwrKI6iK+e2k/3owy+A7VkCZMLCx2+3TSSf+SqDd3YfOtFftla?=
 =?us-ascii?Q?E74jyXxh/dcj7W2mluIawDvLBzJGA5iXo5DHMVm40mchHu9TQY40vBLixFfv?=
 =?us-ascii?Q?8qyz5c5Z6jmtil4MJYnt772AMmNv37LVF+NwKrv8AqulAnFBSDam3/5kJgFA?=
 =?us-ascii?Q?SCQ/Y08tW3qQi0wcaAQ20SOCJCyJjzHmBklvvw2Xb6wnXKGwiy0C4nWxnGkd?=
 =?us-ascii?Q?N2UnIxyr7FBpCW8hz5D7tVWTTtqiOxYefF/+3Dykfzz+dFD+68Fs1dLAI/ZT?=
 =?us-ascii?Q?dmjFh01ivvuMQqYicgQSb/KpgzqPOHtaH/1WdlGQp+PqAIik36F1OdPkBxxv?=
 =?us-ascii?Q?cf/f47EwJ+andgEj4jGEGjHZOn8XIH62aiFmDOQgt8XF95KSK4JrbP4sJpFs?=
 =?us-ascii?Q?kFoiVHy9CuTBwGT9E59NNxH64RQ12UOEMZ1+BMWoqolUQftO8SdsFzgVDoxR?=
 =?us-ascii?Q?Vo/JymbqAVEb1ipv4j6ehC+63u07FzDDD9tYMZhzRq76zd32lSd5Zmyahktq?=
 =?us-ascii?Q?qDG+0mjXAbTlxeWKuP/RBIzvf/0WR62qcf+V8GWfx0JTVsQ4kLiE6r1xNdXz?=
 =?us-ascii?Q?c7EcmbfQ88xZObMP1yV0IaXSJDDrS5SAmUL59KLtrX9wCLPc2cS1p9yIDCBp?=
 =?us-ascii?Q?yg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f0678c-ae70-4454-29ee-08dd686b25a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 11:25:55.8448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCIy5Q5MznGtXu9mwq4Vf55CuHlXbymyS5RKHdvEoh0QGvQbI4LadXmMjfTjj9gm85lfZ+SSBcJGu34C1Uoxhz9VNzGxfL37uf7DEAausKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_042602_690414_FCA21D45 
X-CRM114-Status: GOOD (  23.32  )
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

Hi Conor,

On Thu, Mar 20, 2025 at 5:31 PM, Conor Dooley wrote:
> On Thu, Mar 20, 2025 at 10:39:52AM +0000, Pinkesh Vaghela wrote:
> > Hi Conor,
> >
> > On Tue, Mar 11, 2025 at 11:38 PM, Conor Dooley wrote:
> > > On Tue, Mar 11, 2025 at 01:04:22PM +0530, Pinkesh Vaghela wrote:
> > > > Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> > > > P550 CPU cluster and the first development board that uses it, the
> > > > SiFive HiFive Premier P550.
> > > >
> > > > This patch series adds initial device tree and also adds ESWIN
> > > > architecture support.
> > > >
> > > > Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive
> > > > Premier
> > > > P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> > >
> > > There's no git tree in your MAINTAINERS entry, nor mention here of
> > > what the story is going to be in terms of sending patches to Arnd.
> > > Who is going to be doing that?
> >
> > We are not currently set up for sending signed pull requests, so for
> > now we plan to send changes to Arnd as separate patches.
> 
> Undesirable, but sure. You didn't answer the first part of my question though,
> and there's no git tree listed in your v2 series. That part is not negotiable, you
> have to have one and get it included in linux-next.

Thanks for the clarification. I was in impression that if we send patches 
to @soc then we do not need to mention git URL.
I will add this in v3.

Regards,
Pinkesh

> 
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
