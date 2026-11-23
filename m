Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E25A606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mez5Zg0t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nRauizOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0X+ycp6PKpaomyRzMxhTF87KQ0KByj+UbJH76luRzhg=; b=Mez5Zg0tMHDG4mKTKr4jtx8rP2
	zT1D7Ze9Zy8tXaBE+YZexUZ7ru6viGPeRckDNOLsDGtcHjFMKrzwrX4yRah6kMoWcGWPKOD7NKUme
	bFMfrsB3v8R2rBnd0FCUqNwnVoBSpZGVayD63wmb2wpao0l494DqzET80hYm+RkU0gKV1EIFSzb8k
	+7LqvzBnb3Dx9vaZh1jM/S2+mvId4k18numKdrdLcyIkELnLVDsawGXwchCjKovmVQZ71HydmSVk7
	Zvimx566Ca6eNgAOyY2EzwZYRTwLerLA2NAjI/5bPcom4PXZJB7+PZ+0elnAWhBrsZ3fI/eOYJoBQ
	l17JF7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7b-000000038kJ-1rcz;
	Mon, 23 Nov 2026 11:22:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7U-000000038gz-1TxQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Nov 2026 11:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IrtHQEPCjmN2KkjnWHKOLdQpJFbIeGMSwfVqH+MYfKs=; b=nRauizOc/VGf7AYAEhZuwSkM4j
	12+cUKAIbRL/kixvATQxoRAXxrFCk70BTm8N35o8JE60qLSkw/hZVe2nDXsqEVUP3oVH9i7AiYyB1
	YJizlLgmCdPBLyPS1imNIkwguPzIM08r16CT+VcmqnggaIwieK0dkZwS1z8fBE1d8WOpTq8zzcGSJ
	k/BS1CNzlCGOkQLyWZMYtoS+bHK1cdDrszIhsdXVpkIQF1NYcB3JWAvb1F/TDz4kPUnQkLLf39AD/
	/rIFqf7tf4f/SseFR9PWRu5//NHztuwld7pyaaCbFrc5EWJ6cKbLIA/RQ4/r0SBYl6yVgrnmB90hK
	6YB14kQg==;
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7R-000000032pT-33V5
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPEvAPszMqCFvWNzLMJUpS78mv1vHbrKSOTbDl+z4ndms9Rjwzs+NPTPaDUUqVYzXYzKlBpuyFOUZZLtzcK9HTiuMySDb1uqT8AB/nrhgIw+TJKFd7bC85TOEHDkYOYxzkz2+IilhcTu/kHjPF+cXP9rtNdA3YaZy+hhL5A3Irtmh3IRDB40E3wAGxkHgnTezAHuonj2lqhZumZKkYiGBkHVVWOS6OWKTfpNEnuPuW7iV/7iRNrmjmCycBYxbFzVthc7NJbwocnm14nRQgiZn2iK0wc3UQEeF/694tJlICQo/ilZdrCp0FEo9HL4n8mOiJrTTgg8irIctF46MhR4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrtHQEPCjmN2KkjnWHKOLdQpJFbIeGMSwfVqH+MYfKs=;
 b=Jfj2FriRMhEI0kcwwbyhQAcPXKWSusbGMn3eMyR5FjEcK2bJqzY3K/wwyAt1uNFlQ939r7K6mmXPhPc56nVNU0E5YbIh+s7GiO02IkzoNUv+9/QmXm4/PRd5VagMifSN8RFgBu2QN3VpAABchPblkfQUuDIDAaawOnkkoS+ZPZ7D/JdrCHZffQpNhWRlijSc9I+cZSf3X6HwhtAeoAWwr0jQnB53LjVqXI/wWhrBII3TYyfw2JpNzQ2xP+LnonPzepg6eWiFhA4jwXAIRvipvTdBd/i0i2b08QyswCMz+oF/JVo0YOEILB7eHUUZZSPCfM/jjYeHrix2GBJeAcTExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:10 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:10 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
Date: Mon, 23 Nov 2026 03:20:52 -0800
Message-Id: <20261123112053.20400-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::13) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c4f7d90-af68-44ff-6997-08df4953e015
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261102130727099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: T3fs19x+mciw3uVlep4dFYtjcXbpsv5bNDkoLDK5PhlqzcrCJJjJVERLYwRNXQeibtTpCNKSEWWtS/+aTiuKXvy9pR94ZqPlulsBPEG7qWlOa7Xj1qF2ZlJhorN1OKsG5JVmvwx157TCs2AWLRJuNneL22oPqFr03d/zvS6ME1ssJONJLbkURXKP1GVbN7WPxN7YVelbbJ458/PQZSi02lexaSik6VLWskO0bRrvUIXeamLyZOgxeZ6ti43vuyITgl7/8QhSj9QY39AMQfBE8IHyowj1EDwF30xqeJmd3LHhzOT8LK4dMSLTAN0WXaP53QeqsaWYuc7qS+ao8aoMsp7yq3jHRG8DU76dNXSTyYKTSj/maA21AcB60yA9rCxQ8bJOXzXv+EA0pTha84yA4mTR97xZu8uRYl7qzIgmkO1rOf2+H7pWMdJjiVSYjBe2Z/B6GnlhOt4QyFxYNRUjmUB6q9Qd9AISUTFW06OtoMZu7EpeRwhLhJcyaYCg+z7mOwZZrS37vvm/tFyqmvmxHukeXIVdsfb+fqkSqPdUOXuslQ8IGK6LIyvtFwG2Nwto
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261102130727099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHBrR/XpVAaalPXEoGqVXODi9zKNTSl9KirVfhZPYsONprwiwOlzUDPXFMrv?=
 =?us-ascii?Q?8Jj29aBUMf9ZsRSEEsUI+N80Ny7WUm8FU89Crtqt5YLL6ticaVRHLPRmRmYx?=
 =?us-ascii?Q?0eEt7WU/5lkek9eKDRyPkrNImFZr1iaV6xmfPjqlkvWL68YEQf3YGLx+KoLX?=
 =?us-ascii?Q?KLFvxkMI7BwMaZISoXKr/VigXfHuCoM0q/iiNnScMpnwiOG4g8Iew6kaRJyl?=
 =?us-ascii?Q?ATVJhjgK4aJN7r9cQm/JysIfdj8twhGEku3WB5USGCY+eFd/kwalL0anhHIh?=
 =?us-ascii?Q?QGBH0s7YqPcO06+lgav0RI0/C2uVttwiu4jK4wCOJk2RpKuGjzQnr8M0q9UW?=
 =?us-ascii?Q?fbs99feSg2707nvy2BVdQSsqVmSwFvfoiyPF4uxm5GbUbIWKr+aahlctJKG6?=
 =?us-ascii?Q?eC3Q6yFnUv8gMfHpbHmxii9zkuXkQpvVXmc80a6c3yhej6j2xIFfvfYD1/aI?=
 =?us-ascii?Q?r/nOfCF4DK47x3t2Bl/ozs8mnajSBJjYFbsQcik65EcIIWRpYWWV0UNA9AGA?=
 =?us-ascii?Q?KNbtiuLSEk4H92lHceXfw/sLDPAGCG3s9UjDPJo4dy8NCL5qHKAZfZKBH1dw?=
 =?us-ascii?Q?eR8neKRmBTp0XpwAZdZlOApWP7yGzU/DFDF2jhnl0ehKhBslfTCFkRtC7Fn3?=
 =?us-ascii?Q?+RQgWMw4pX8wk4VK7gDt51pkoU8GsjurDtXLOqh5XxHUb8oT7OXEteL7WeXd?=
 =?us-ascii?Q?z87ZjjfxoE7Sh904yiifHiOiHSosnIzKX3l34EQHlKnyWE7MFPNGaMpxCUof?=
 =?us-ascii?Q?FpiXR9zxP6F13qTZM5wE+oW6iJ7TNK/IqME9W5bg0I+0y8ji6DDmjY4ejBI/?=
 =?us-ascii?Q?3Ym33j928jj8yIxt/zRKNT2+m7N1rUVugBDqRKgO1tXa0kpb9H2rQp8YySTr?=
 =?us-ascii?Q?SsP5H0sWYeGjExurUxUnUouQlO/2BnWoLo4a1tST4bo6AZIPh201ko/CH+r1?=
 =?us-ascii?Q?1aDpXt9A0wuMUgxbKlV1qj6VitlgCk0KQtk3glXFLsR6ZxjsI+T1O9JUmDtf?=
 =?us-ascii?Q?4B8JHAucvqE2fqVqCWKCkSchYsMa7Novnxh2sTlBuQO5SOTTXoHByl8oqY8c?=
 =?us-ascii?Q?pu+fDTqcerQWaRxb87MAYCZHUXzfz5vVlUyQLsqPPjBp6oqzsm+F7EtZuB3o?=
 =?us-ascii?Q?Yh2hRoJe25wgC+ZOIyCUMB9JXPd2ws9faUhAyrEN8GeOCf/qX28cm7xhuru3?=
 =?us-ascii?Q?5fEQClY5dKkNwRzTiTUCLwd2eqXn6BEV5LcviynE7+Xe+t7FO7nQFF2Utl45?=
 =?us-ascii?Q?Csa4w6FiUzXrgzV3ACMBfKx9WhUulRuoqdazZ10x6JSpnxIev8egMUrnfmc6?=
 =?us-ascii?Q?gQelAjZ7StXs9JdfWlyIqeo12Si12tbt3Qbef8T0hmuunVDu2A8P7K6W6aLn?=
 =?us-ascii?Q?S2O4fQ4mZB+KHXdFtmLhyOg43G9ebP+MyZM8k+D4B9Lc7eN5pAtoWL3Owegd?=
 =?us-ascii?Q?Yhi2Jv5rRg2wk2mEyI5NCJmjiis62E1ddgEGYPi0dfUpPE+zCEVZ2Rz/KnL0?=
 =?us-ascii?Q?Fknsadgd4Ds2kuNVPoFwM7eUOxpX6E8GyP2iJbARkqXBRJYQaa6hBiN3VX1U?=
 =?us-ascii?Q?+WaiEv/AeFUUCTeYEQEBXoDGMTBmmAV73T0osj7pQqpjR9AWxRdDZEU5ZN8f?=
 =?us-ascii?Q?0/KdfVycwmV/QZBKDUxaSTS3wk2jUkVDhsI4sw8e5oOCeznb0PEA8rl4xcYh?=
 =?us-ascii?Q?HoN1fOAZmAbhzZqwJMn/EaFYPQq5BkwK02xpofkxw0TLXOCXDYqX+zBfsUfA?=
 =?us-ascii?Q?JDDVmm7CPtdUEH1MVRNTgWkUTckcYZOrEsNN+9XfJ+yPMvG8MUB8?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4f7d90-af68-44ff-6997-08df4953e015
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:10.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP3TEnR58+RVpeXXvCNK7geadr1OJvbVWCZLeyFyojcooc5CT2vFl2gGaDXgsE+yhkenyIJzrBz2g620bbEOcLyxKTPmCPdMpnjUViMzzuq73ziEV1z5dhIKeJ9Jgxrp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_112157_777703_C181A80F 
X-CRM114-Status: GOOD (  17.80  )
X-Spam-Score: -0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The reset IDs exposed to consumers of the StarFive JHB100 reset
controllers do not map one-to-one to the hardware reset bits.

Add struct jh71x0_reset_info, which describes the number of resets, the
assert/status register offsets and, for such controllers, a table of
hardware reset lines indexed by reset ID. Add
reset_starfive_jh71x0_register_with_info() to register a controller
described this way.

If a map is provided, install a custom fwnode_xlate callback that
translates the reset ID of the reset specifier to the hardware reset
line. The translation is thus done once when a reset control is
requested, and the reset operations are left untouched since they only
ever see hardware reset lines.

Existing users of reset_starfive_jh71x0_register() are unaffected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh71x0.c    | 58 +++++++++++++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    | 24 ++++++++
 2 files changed, 82 insertions(+)

diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index d410a5a0ded4..c0137b8a8970 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/device.h>
+#include <linux/fwnode.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/reset-controller.h>
@@ -21,6 +22,8 @@ struct jh71x0_reset {
 	void __iomem *assert;
 	void __iomem *status;
 	const u32 *asserted;
+	/* optional hardware reset lines indexed by reset ID, rcdev.nr_resets entries */
+	const unsigned int *map;
 };
 
 static inline struct jh71x0_reset *
@@ -29,6 +32,23 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
 	return container_of(rcdev, struct jh71x0_reset, rcdev);
 }
 
+/*
+ * Translate the reset ID of a reset specifier to the hardware reset line once,
+ * when the reset control is requested, so that the reset operations only ever
+ * see hardware reset lines.
+ */
+static int jh71x0_reset_fwnode_xlate(struct reset_controller_dev *rcdev,
+				     const struct fwnode_reference_args *reset_spec)
+{
+	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
+	unsigned int id = reset_spec->args[0];
+
+	if (id >= rcdev->nr_resets)
+		return -EINVAL;
+
+	return data->map[id];
+}
+
 static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -132,3 +152,41 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
+
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner)
+{
+	struct jh71x0_reset *data;
+	int ret;
+
+	data = devm_kzalloc_obj(dev, *data);
+	if (!data)
+		return -ENOMEM;
+
+	data->rcdev.ops = &jh71x0_reset_ops;
+	data->rcdev.owner = owner;
+	data->rcdev.nr_resets = info->nr_resets;
+	data->rcdev.dev = dev;
+	data->rcdev.of_node = of_node;
+
+	if (info->map) {
+		data->map = info->map;
+		data->rcdev.fwnode_xlate = jh71x0_reset_fwnode_xlate;
+		data->rcdev.fwnode_reset_n_cells = 1;
+	}
+
+	spin_lock_init(&data->lock);
+	data->assert = assert;
+	data->status = status;
+	data->asserted = asserted;
+
+	ret = devm_reset_controller_register(dev, &data->rcdev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index db7d39a87f87..918ecec3975e 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,9 +6,33 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
+/**
+ * struct jh71x0_reset_info - description of a reset controller
+ * @nr_resets: number of resets, which is the number of @map entries if @map
+ *             is set
+ * @assert_offset: offset of the first assert register
+ * @status_offset: offset of the first status register
+ * @map: optional table of hardware reset lines, i.e. bit numbers in the
+ *       assert/status registers, indexed by reset ID, for controllers whose
+ *       reset IDs do not map one-to-one to the hardware reset lines; NULL if
+ *       the reset ID is the hardware reset line
+ */
+struct jh71x0_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+	const unsigned int *map;
+};
+
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
+int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
+					     void __iomem *assert, void __iomem *status,
+					     const u32 *asserted,
+					     const struct jh71x0_reset_info *info,
+					     struct module *owner);
+
 #endif /* __RESET_STARFIVE_JH71X0_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
