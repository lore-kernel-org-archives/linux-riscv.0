Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1DBCDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DVLk4oPiDUPgWiMoioGDETB8HpLW4dl9pj1GgH2//oI=; b=QPaZbStm8pLGBO
	lFL2CPHWk3NgE/MCNEQ+0g4qMyL1pzOOZrvERTL/8Q7OaVvtjdpvm5VSXhmpMruBN4s63bHYke4SM
	dySR7+zHsHYF5B5ePv7paXqclCAqqC6BiSoR6YR6sgwBqKRglemocfDA0kp+sygzgro+Y6/XoK3nx
	5yd/L/XoOxXrdNFcmGWSamLzm5vkqx06U3kRIWCfAkq9Bi6VVI0sqQgZc9p4jZJ+ucWynJUSDsX2D
	vaNy6RONB/SIm4kkcKoy1P/IRkyqwP2kY2qx+d/OrWE64uv3N4l45CjPIYKVbNxh8/NY7PGkYwN2b
	uru7KK1zUB/xm2tXCxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4lO-00EYUY-2d;
	Wed, 18 Oct 2023 11:30:58 +0000
Received: from mail-dm6nam11olkn20813.outbound.protection.outlook.com ([2a01:111:f400:7eaa::813] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4lL-00EYTD-2X
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+TZF7kzTcMTWgOV8LgQgrGYIMrG43RMPFyDs/5WrDMUVakNu8XCsJQkXkZrIISY6Oxj319y6CQjS1feNvpQOIzZu7DFSAV8787PqIZF0b3K6WVdUamNIyNIrYgjnjwHFoKkMvvTuojZFjA/7zTdFcKKg1uYa/5dT9pk03BXDxyPwdnxdiddeWxAhLg1Fc/eOmTB+SF6DBng4I1V3rgbrnnKFSYKN0TJnx/+ezkaVISwGhIisil3Xb6J3a/bJaJD9cFBul/pE+W2+W+jOGvRgGlqfbmJHJVwTVFztnQKZICipb2Ufxr/tpGnSVrRt8cqqkGYfmzttD7bRHBrrBo9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmF9y8nmjJXKvRBJifeR5HdGVzzGW1tw5HGH5RUvpMQ=;
 b=Ulnxzov4qzxKWeRFqdYqEtPlMp1xuoGO5e1rFbfvBuhakLvNr/PZHgQuviDgaSXxLn83CMx0ZiwsAHp8hWNzgpr3O9tWe1CYtuwVHMBPifW+6TErQ/pFkX2iY+Y+kSltl+IjAjxFY+1pJw4nlaCpbbYSdF/M1Eef8htAR6HKAbe8iJ/HO49frQNjJItxtmt11NK7zAxXe52Os1z0VZMQoE/mskuCOOtPH5z//JK8alfxv3DmgPqDj2Djvhja8a2yLAeAvmofFqJtazReZWu7wiCIqAEynRO5OEHqqxZsKdhgHYcB1EruqUIJydtn8JEhkw6mc6MSBX4Tmy5HYjOK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmF9y8nmjJXKvRBJifeR5HdGVzzGW1tw5HGH5RUvpMQ=;
 b=tbum83Qn+vADq7ke98R3jcqsM8mVQ9gYPCoN48MD3SFN9sN84uiXYpbbVR9cOPcghvnaFKhXo8fFx09Kc++erKmDcDe7gZLbmaWWgqEvU7hxO+fWibYwC8BLWCxcpHA0N43fUtmE8vKFZeoYkYYu3zyA9tThmSsyCZWqisGcCrJTSyX2wQER4mLPt2CbrXxYEp674NkFZPl8w4J9J5p58qi8CGEr/P2xV9I0d1P/Nwgw6J/2CMzXtXPkd5JvCO/rUbnQq8k5l3yoDvSajhgr0+ggX2DGba00S4Apjnh194x+y5LogZkFmMGYnL4hfVJmvAEeB6JPNAMkH4uCmPRAsw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB4059.namprd20.prod.outlook.com (2603:10b6:610:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:30:50 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 11:30:50 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/8] Add Huashan Pi board support
Date: Wed, 18 Oct 2023 19:30:52 +0800
Message-ID: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
X-TMN: [MnphO5VqSjehvkmyGjRHCjMGY4+dXs/st0Gl0OggFGk=]
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018113055.1605263-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 55217145-a0a9-4861-71fa-08dbcfcdae15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yR83TfUdUppMzvIHWR8iNv1tQNxG9b79XUTthnNZhBhlbtK+giP95p52mQeuUN7WveATlUOCUkTmglPDGlg1MDC9Ki6URn+JUfpXeI8nByd/pO+mGHLEghg8CseLjr7uzFOChaoSR3IA7pv3xRVguvrBJa9Ui7SuO2b7bR47eKL7XYT7k6gtxo1uzZAdOTiVFWSKCGBjIhsT6U9xOTpgdP8E6gcS2muQ0d6mPxIT2aTpCMYIwwSYsDWpqjw3sdJVWGVngyl9mE8VZNwkliEf4zvoNAAh+Pl23uWqUZFU5mrGnfrsKXPGwHX1mkV7Jy3gORhBQYquzM42PJ344EKZ2a5MHYYgsfKpYgdBGET31Zv6bDcGc/P5G622/qB9WSyN2Nlux4/5GjUTElvWdd0hXSHkyE08mNJt3lIMbP1HVwkBSUeiW0jaFhUNBmYzT7WXtU9jDMU7zD9B7EXjwptu85ab1AeEYLVsHLe0F6gKrF2NWVNzv874uoxaN4BFfG2oafHgHvhgz9lmDCuu8OEojyc6n0eUBtfzNTk2M2gKc2Ji7sIN1GNZ90I0yNQ/qxqov8bQfJ/+YMgzjv9dSkDlgGVXGJIQ5aaKBgiDsDPErkgd40keJnXW9zJD00VMyDVaarw8x0pV4NCrKUfXOfMAKVvbCIwqp66XBnGW7QCAcwc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zjW9A2a5jjbohgj0LhMfDxe/VfzhFSvy/FT/ROcm/OPwQuFxI3srYYitaADy?=
 =?us-ascii?Q?r2LZeSipIYk20PSIg9M3rtM14QVdNf2qBdBl+xwqcvM3rPRF2jfhHLdIMz/N?=
 =?us-ascii?Q?Hi6Vrs1qwQsZk0S1mxA1uc+edvS2IV7Hb1FZS87hhMj3RZ/TxPtMLpGMxMGJ?=
 =?us-ascii?Q?bVO/t6cbLShPnVIbwwoe5Tl7270GSAwVWqXma+c7Yfh5uhwEkr3RufJvd8yd?=
 =?us-ascii?Q?M5hTMLyVouLXjxTIq/DAldCZXY+40QvOaMeA7jmAxVW+akAFx8u2Eq1oQxLf?=
 =?us-ascii?Q?pZSAqRuTkXEMQy7K5bbeZ3flub+AEKchL02EJiZRGS6djMeoaFbzRV/4m5l3?=
 =?us-ascii?Q?+xH+bKUFm5B921FHp2ZStfVLB+gVbEl0zTeh89qFV0wHkTCCci0ViK9KoM1Y?=
 =?us-ascii?Q?wcr4vKsvgVk4a0vZ6tAdsyLFJs+GaLztRavDdPpf+esM+kTJNR+vGC1oTcmJ?=
 =?us-ascii?Q?NDpro2TD5JARl1lTPxgq6wx4Ivv+2ZNbGEH0tx7Il05c0EmgYTZduLue/V2B?=
 =?us-ascii?Q?H562Vun7JyiazKowjt5d8QVaKKmZ1WHakQ7VO4nAK9Hv5wvAQewSGgYm4z1+?=
 =?us-ascii?Q?CGfBzJD8TDNarh256gZD8egLtfHzt8ZVIkj0HqxHXqTv0IWVwnMxvt9KC7Lv?=
 =?us-ascii?Q?DthbIh1C4xBTbP5JO1eWIjTT24Rq+FI03JVBc09C0qypm1lyoqodrUtEMt4b?=
 =?us-ascii?Q?0L/XC8wf7QLC8H1i0RR5obGcRXbER54znS6jkbHaiYO5DwAZK2rGFe5WxXhv?=
 =?us-ascii?Q?z5vFNjkaauvbHl6J0VBBRcuiHRpzkVdk82fUoYmYO9LZIC8YHLJI2pQriGAC?=
 =?us-ascii?Q?SqQnDLnDF75nKCCxPTtI2cfhprfsX1SxOSzV0c3ApRKlYS7FhfCrp+YQYGoX?=
 =?us-ascii?Q?tyf7G2tlXj+V7/sUglfXg3F8AjyxS2+9X0LdbU4Wu+wh9IqUnsJiBnx1GOQa?=
 =?us-ascii?Q?RgTbLsWLHK3SWNQZTVJfZbdcapvCQdRYwBZslHgRG+fRQwQ3wrkQ2/pzHXMH?=
 =?us-ascii?Q?5YNPVwKqyrPr2vEKCQr4U+uYYiioXyteZYlsYbBS25iUpwRLCApmm8WpHgir?=
 =?us-ascii?Q?Z0TBSdcUvLvJbQxzS25qr/k/9XZaGLCAHlssSdMglz5c9spPgjz7jVsq3t5U?=
 =?us-ascii?Q?M/9eOqcM2EJbaG2KA71HIvkg91n6Ilm5tj39cVSIsD5luvlJzEvJwNKNRDQU?=
 =?us-ascii?Q?ukhU2Bcpe/JrtSUrvIXCPrAC6bRONEzZgxxzCj/fhXuKhOS35L97O899uqA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55217145-a0a9-4861-71fa-08dbcfcdae15
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:30:50.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043055_854552_F9E2318C 
X-CRM114-Status: UNSURE (   9.02  )
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

Huashan Pi board is an embedded development platform based on the
CV1812H chip. Add minimal device tree files for this board.
Currently, it can boot to a basic shell.

NOTE: this series is based on the Jisheng's Milk-V Duo patch.

Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html
Link: https://lore.kernel.org/linux-riscv/20231006121449.721-1-jszhang@kernel.org/

Changed from v2:
1. use dt override to save code.
2. code cleanup.

Changed from v1:
1. split the patch into several patch and refactor them.

Inochi Amaoto (8):
  dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
  dt-bindings: timer: Add SOPHGO CV1812H clint
  dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
  riscv: dts: sophgo: Rename cv1800b device tree file
  riscv: dts: sophgo: Separate compatible specific for cv1800b soc
  riscv: dts: sophgo: cv18xx: Add gpio devices
  riscv: dts: sophgo: add initial CV1812H SoC device tree
  riscv: dts: sophgo: add Huashan Pi board device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 119 +----------
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  48 +++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  24 +++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 193 ++++++++++++++++++
 8 files changed, 279 insertions(+), 112 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx.dtsi

--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
