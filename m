Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6FAC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B908613B8
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B908613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAvfWzXvELNYk4ZqIllaxTLrsuR5AX9/SzIbgLInPrg=; b=UlsYbPkV844F2m
	ieHGcz2pNq57I37lC72+DjqDnTmawsGEkSYLuCouYGDgxxMC7kPzGAkF7Qhm+nJteJez0B6DPI90G
	TtMd6wcGs3bKvDaMctXdGYvHmVgY1sD4iVRSnddOASPO0Ru1E+eFpnaG9HQAsixqtJQvzFk4qBfpq
	NLgoRqi+vXB8DnBjieXssY3sBu0qMfV6pqEI6jBJsdEyEzCjoC1luf5CBfL9IdnV1yF8vZwI9JM+P
	eehmi61zCeAzuzry+Sm13lSiiYJ+jXtjQCeLI91RwUsydAm4EvmmwTRSU9CG4TtwF6Se3v/MBhbnJ
	smo6gdvdwPpKbXyaiSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls68j-008muq-5Z; Sat, 12 Jun 2021 16:05:41 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls68g-008mtO-Kg
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 16:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623513938; x=1655049938;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=molq+9BvRBWgXvYu+GnJ8B3+6FgUyar1XzPFp4qPDO4=;
 b=eNSwME5M+O6kpcaPwhDm4db1h4fWYbhxxqzenWUe6JLTqH2LZl6L+/oe
 2r9IuJEob3+oPcrGHPes/9hpWw44J4bh6L1ufyqG/MqKwzcJ3I6lWNIei
 vgFeTlEJURpQwDcxTeoQSzyojAglREsNiWjJw9wkSji0qgFsX+4pE7yLH
 OmBeLL3qlyr4VEIhfGafCT/ExFfbmMcTAhh9kLKA99H9Hvl2ENvXF2ILS
 2ojJakLvtD2T06Z2yL6psaVnp7KK4JZ9ZvZHMlYDXlqAfPGk1plhgJrhT
 737R3x4wg/brzM0mLjVJh+Lnoi9fvPUvmSJqx6G++E/Jx6xU2VQTNeGOx w==;
IronPort-SDR: j1MiUtqm1ozeR+8rfJZCpxeaHRnHt1v1iQw+9pr1+0RaPMFt7I4c03fET5EtXj31moRgl2mGsw
 9vYjfhuYsB5FgcSV0pV9F336QBFBUk9ZlDE2ONHdvMFkDZ4F7J3dTWDxKovsbo4UMGePLCiBO7
 VcHdiMdHmjlZdNu4PjWZ/73TFowJ9gzdQ1UAcZq1/p3kGey+Q0lSh4pvxZpfCwPN9IBZNeVMJ+
 8veR3GuU+nvd+OkjDIBydLta/MAe+gajmM9FLqPgN+YG4yeWdETQ4wFH5SBq9E0ORdqalqpFLs
 V1A=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="170973902"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:05:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu5bQmTcf+nxjMdX2CcXQAWudjoMI4/AD/rlapCy5rO8E0Mo3lm6I15lpZUKbwS+SrsdZCUdkNI17zMBRLhJzN+50/7j3Ow3NrB2JZxKUK/zPQ0vqeK/S1JkewHJ4NYRXsnYg9Y22daY9B8WAy7ZItp7mDiGU5ieWBSJZIXs/M83JxN4lo+gv3d2A3tnpSOzlZEfysur9I7I2hSrNwJB2GkIDUeNaXdPrlByNpo7TCXAZd20n//8CFdwgkFVKF3ApjdvfpKlHfnTXbd4phBrcSZmSjVf05Zael4AhVJl4Zg3MKRY4fDlLW3g9hmaJHoB+8gm8ZKiX8rr6kEA3mKnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVTBhXVXKTMHpkREQc6xnEWE+Qe+xnXqnTRLhnY2lqE=;
 b=EXUHo0Yd+LSxxUIRQI5KOyActojahoxFqpJK5fO6CVeQ3rLjCgU+yMfDtXqrAdILVpS3Y95FfAAIVyudr8JIS2QSvFApkkAP8kE7NIfXIZjIYfWh5gjoGWDjkvD5lwvH3Cj8lZLedNo4lOmQ5JH8jlr3EkxbR32Q52sc+miMWbCyG8iyqJIXAsvrFZUyf8hOghUYfGLuS/SC+aH9AzebvlAmRzbG3WfK3spQ9+D5eBVXDiUJ1FAL5cAv61Kq0zE0wsyVyrpPkGl8O4x1yeZUgaC5ZiFQpPt7FUdqcfp1P4UmWcJ1iTKZMDl0Pem7coXQyYtA9bJvPNCBPW1nRsB68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVTBhXVXKTMHpkREQc6xnEWE+Qe+xnXqnTRLhnY2lqE=;
 b=kECHcgG2uC3xQhsXD9yB1h0SUaJkuPRPom5wQEROGg7Jhl77c1MUliJwlQXckrqYV6Ezgg+zoSZcoz0REbUWQM0xGhM+w6tHVtHbGS4tF8F0Kx0qCjf96LAGBBqfKCHsjCk3UFQuA+lmkca2BgYUHSQx8OiBsioASmJVCaD3psc=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7747.namprd04.prod.outlook.com (2603:10b6:5:35b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Sat, 12 Jun
 2021 16:05:35 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:05:35 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v1 07/10] clocksource: clint: Add support for ACLINT
 MTIMER device
Date: Sat, 12 Jun 2021 21:34:19 +0530
Message-Id: <20210612160422.330705-8-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210612160422.330705-1-anup.patel@wdc.com>
References: <20210612160422.330705-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.171.205]
X-ClientProxiedBy: MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::14) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.205) by
 MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Sat, 12 Jun 2021 16:05:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44bdd14f-9869-4c6f-09c0-08d92dbbe964
X-MS-TrafficTypeDiagnostic: CO6PR04MB7747:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB77477E5395392EA6493E116C8D339@CO6PR04MB7747.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NCHjm85vcPzerGDn4DV+PyVNwL95/7oxo/e0qpTSh3D7eDXIZN+XgLt/nQrkZSLBXFDtbaTpPl5N7rcBeGnDt7FqTCGT7803BO/yiHYx0XDokzw0tzwNEGtk+ECetK3c0o2lbD7XrQuwMGzpPG6fvNRIB9buoDTfY1CfzrA+ISCJbvUSFa2tFsdjxVV7Gx1sMTGW2pvQyNZoPvV0WJyHiJPgvF737RE83XgPpQAYK7kw9dbQIejjmrSIY5DUKLxDK3BAGFr+SPKokGsCLIDBvlQBk8Iz2zZoY2g1uBY+EMRodJRP1Evf6G8SF18u/dp0cjQ4hjxW5nU6lHuUEltqP3pftZWyy89sm7Nyt90cHKLgUicbnmBis2VNBM69bbpz/CEdIwASWmx+kVSHwamftzm08DlhHe8jbr//7QlQVGqp882j/6Iet4Rzi7DXkGuIUx8drWSvUoj/7cOtJM255sP3GpTWJGlFgkaQrK7htKcoQ8GUJOB3R7g0i8REI7072h+7ZJPTVhqvvGWHdbXDExXv+MCOHdj7PoE22trEVntscC73xH9eFvQ10SWb+K5jo8oUF1iuHRWEblJ1smMB7quwe83qUjO8UzGR5HoHy4LA8OpI+WxLYg7jnecm2jSXIwfrskBz0A1jRjqZ27SuzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(26005)(7696005)(55016002)(52116002)(6666004)(36756003)(5660300002)(83380400001)(478600001)(1076003)(7416002)(8886007)(2616005)(66476007)(66556008)(44832011)(16526019)(186003)(8936002)(8676002)(54906003)(4326008)(110136005)(38100700002)(38350700002)(86362001)(316002)(956004)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j7yBOZutKJXwEm/UzPW+erubUN1Wx9XlVndn3ZDtrLoQds39JkcwwK1w2RAV?=
 =?us-ascii?Q?IV3NzxVIFzSdcyOitGIk/pvfRl1aMAHNT5x98ilQCUZPQeAXLFHaKYsPouO6?=
 =?us-ascii?Q?THfA3TP71WmglXLL7IDSLXKqjGzH4pAcHC7Ejxcr8AWGT1UgI1Pz1kNls+dm?=
 =?us-ascii?Q?6LRzvdcALa0RjqfgO1d2enP1kVmsRb8S6P3KIUOLNTFC6XKRPdBFgNI1sp9l?=
 =?us-ascii?Q?/YxdKh64XKtz13mIWvJhXtFjCoTfUpEbZ0rZdFe6kQf6Sx+VXzth75VaYQsh?=
 =?us-ascii?Q?pVvaPNhaySOHJaNHFujIOSgx0fyEFgQ2ms4q8IDdiKZUu8y/P9czCn/uib4J?=
 =?us-ascii?Q?kY/393nOD9CbWVQNbiht/uc8UUb7TCq+mDHYgrtdRxpQcvzSn0BJQk1tXu3U?=
 =?us-ascii?Q?F0YV5e5TACIcgvAGItHNx/yS+sHY8QeT/R1EDNhAK+YUkwANH253nHA14jrm?=
 =?us-ascii?Q?Ou3SYs1vKAFFMuMPiAq3A6a4OndHlge6M29MkXzVAk6YacikeaBhEvIp7uyK?=
 =?us-ascii?Q?sOTThtGFe5SKqcf0ifAoMEkmsvrzcza8BwkYGrTlYSK004TWAcFjUVzto7bf?=
 =?us-ascii?Q?uZdfjGWQkVKjNXh7Ycik/1nAiJo47s5782aUjF23C+xeqUic9DDGIUgZWNi1?=
 =?us-ascii?Q?QdLPz4qhUtLQo4lEdCMrenuZvFkU82DjCf1EpgNQVQzztFBfsufWoj1L2h9Q?=
 =?us-ascii?Q?xFxpHJ4i+7s4PRRrMIumIKFJCY0+xerygkccE65va/hx2f0sN9MrH2oA+dDu?=
 =?us-ascii?Q?p2zE0Q4ia3cowuFEp4NrzkgzLI7tzDKwwMIsY+m+n5ChNhmYdCr5e237d76g?=
 =?us-ascii?Q?whHUdr/j6f2kf2KNTDO6rn+ULFsuFh8ThPrJPgyPiRZIACviohHQyk+TGFHu?=
 =?us-ascii?Q?ygGY6+isSlGtF2+/eDeeHXksId0ypxMM1rDvMRMOhbuic8wDo4dKHsnQstEQ?=
 =?us-ascii?Q?S99GUK/rmkFLIOW4u11cBv2NJEKI8wcD5QlR0U8p+86EfBSakZgwWCwgOLLH?=
 =?us-ascii?Q?KXphg5cw5fnCEO22ADijsQdKWBSk/DKrR5zFCyGumAph6n+XzY4VHDILrMhF?=
 =?us-ascii?Q?eQQvx1qkcN7VRBMYy+iborOXIo65l6yFXT4SBRUYX3joujQBegvSc6cVNr9l?=
 =?us-ascii?Q?sGAcqpH1AO+RKS/NnS+cKrTHBZLDks8ox2Y8VS7K3bE96ZKvPWqhPE1CVNWA?=
 =?us-ascii?Q?wDy5FjjKBf+InG1Lmwkzwv6aRoGxC5xprjBnqcy407G3d/GJTZUcISIU+79P?=
 =?us-ascii?Q?csoLnFGBzwW1fim+of4LXHsIETMcOIBGDLtEVwq2bkgXng43aX7rsAB0Tlek?=
 =?us-ascii?Q?umAG5nrJVf+B2w5CJvMwqIAy?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bdd14f-9869-4c6f-09c0-08d92dbbe964
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:05:34.9189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNPnYbImiQ9mWORSrDfT5mEYHslXMPJ1yKzCkae6bMu5+8uXTKOpSUovNYRA30c9/PL7iCgys6nu/9ynUxVIqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7747
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_090538_811923_0FF27C34 
X-CRM114-Status: GOOD (  19.40  )
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

The RISC-V ACLINT specification is a modular specification and the
ACLINT MTIMER device is compatible with the M-mode timer functionality
of the CLINT device. This patch extends the CLINT driver to support
both CLINT device and ACLINT MTIMER device.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 drivers/clocksource/timer-clint.c | 43 +++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index dfdcd94c1fd5..ca329c450810 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -2,8 +2,15 @@
 /*
  * Copyright (C) 2020 Western Digital Corporation or its affiliates.
  *
- * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a
- * CLINT MMIO timer device.
+ * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a CLINT
+ * MMIO device which is a composite device capable of injecting M-mode
+ * software interrupts and M-mode timer interrupts.
+ *
+ * The RISC-V ACLINT specification is modular in nature and defines
+ * separate devices for M-mode software interrupt (MSWI), M-mode timer
+ * (MTIMER) and S-mode software interrupt (SSWI).
+ *
+ * This is a common driver for CLINT device and ACLINT MTIMER device.
  */
 
 #define pr_fmt(fmt) "clint: " fmt
@@ -21,14 +28,20 @@
 #include <linux/smp.h>
 #include <linux/timex.h>
 
-#ifndef CONFIG_RISCV_M_MODE
+#ifdef CONFIG_RISCV_M_MODE
 #include <asm/clint.h>
+
+u64 __iomem *clint_time_val;
+EXPORT_SYMBOL(clint_time_val);
 #endif
 
 #define CLINT_IPI_OFF		0
 #define CLINT_TIMER_CMP_OFF	0x4000
 #define CLINT_TIMER_VAL_OFF	0xbff8
 
+#define ACLINT_MTIMER_CMP_OFF	0x0000
+#define ACLINT_MTIMER_VAL_OFF	0x7ff8
+
 /* CLINT manages IPI and Timer for RISC-V M-mode  */
 static u32 __iomem *clint_ipi_base;
 static u64 __iomem *clint_timer_cmp;
@@ -36,11 +49,6 @@ static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
-#ifdef CONFIG_RISCV_M_MODE
-u64 __iomem *clint_time_val;
-EXPORT_SYMBOL(clint_time_val);
-#endif
-
 static void clint_send_ipi(const struct cpumask *target)
 {
 	unsigned int cpu;
@@ -191,9 +199,15 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		return -ENODEV;
 	}
 
-	clint_ipi_base = base + CLINT_IPI_OFF;
-	clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
-	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
+	if (of_device_is_compatible(np, "riscv,aclint-mtimer")) {
+		clint_ipi_base = NULL;
+		clint_timer_cmp = base + ACLINT_MTIMER_CMP_OFF;
+		clint_timer_val = base + ACLINT_MTIMER_VAL_OFF;
+	} else {
+		clint_ipi_base = base + CLINT_IPI_OFF;
+		clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
+		clint_timer_val = base + CLINT_TIMER_VAL_OFF;
+	}
 	clint_timer_freq = riscv_timebase;
 
 #ifdef CONFIG_RISCV_M_MODE
@@ -230,8 +244,10 @@ static int __init clint_timer_init_dt(struct device_node *np)
 		goto fail_free_irq;
 	}
 
-	riscv_set_ipi_ops(&clint_ipi_ops);
-	clint_clear_ipi();
+	if (clint_ipi_base) {
+		riscv_set_ipi_ops(&clint_ipi_ops);
+		clint_clear_ipi();
+	}
 
 	return 0;
 
@@ -244,3 +260,4 @@ static int __init clint_timer_init_dt(struct device_node *np)
 
 TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
 TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer2, "riscv,aclint-mtimer", clint_timer_init_dt);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
