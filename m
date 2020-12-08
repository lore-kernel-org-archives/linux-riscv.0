Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B70CC4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:57:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCFD723A5B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCFD723A5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EsuAn7/Q2JDV2LVu1mzoEVR+fxcn/gD09ckeK5r4Gtw=; b=bbNRtAJyBTLSBgV3rOLkkwkXw
	v6VfQXEVLgcLHmWH+98Bo3uIIPxLSY8qIf8jAuY0zr9kSdBMHTPjZ5uGGj3fPqh7AfeYNfwXz8qx6
	c+GdJ2nR+GX5rCWHDCd7OjtYuwwWALwGgLVFg4aQqaQ1yERDyUwbhZan2RGmy4vHBeYPghgikHW2C
	3TA7pjuNs/UxqXBbEYRQUbup1PJqV8PoMaFfKR1+a1eLdEWrUF4iRnYybfjYCF8OT+xVjOy3erC+I
	Jaz6xniaSk+DsjDdaq75N1HfNlsLyVnzr65KaeDaO/Agy9sODaW5m67DmYVWl0NNu9kcYZJW9qgNd
	uUqZYjR0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV3c-0004GG-5J; Tue, 08 Dec 2020 04:57:00 +0000
Received: from mail-bn8nam08on2041.outbound.protection.outlook.com
 ([40.107.100.41] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV3a-0004FQ-Fn
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSPLqsGX0UzCxByamv7jUVCxA6UIsPwq+ebavztvjFBjShs4v4hheM2kIB4T+kolX3MG+XH5+H1O62BobvYM+IayxFiu5d/nMPXRPIAtMQgzYX+sTReQ+DRx9AqxsbSv+FeNGbA44l+9NQEp88pRem7MQ6CR/aO1VK+tzr/waiAQJkWuEQ1tLxgBDdafaUd23cHZVGAI2pQ50SL5NA5adOon22rLmfH+UGJPDY6OsEdQEmzWi5L8DzAZmbIlwz3a4jxCo4QSma1YTX5AfxU0ee2Q/DfCCTJE5wAj7qA9n+eTPt3l7C/ztQBRlEuUjCIIZOk9SteLWcsOFmtbh+MMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=BbwuzsOP/pFJ3BaL/mOskfj0SpyD+p5yhFJQrw12NP6DYxbq3e56NuuzeVvuGAKf9eqnxs4cmoe8/nspL3mnvz0Gku1uXuw0U+pjOv6yYT5nvkAClXT21XsCQyj8P+tk5gVDPDCJUCRGs7gESFhGTlhEgT6JIoHB/m0h/Bnj0Zy2dKRm08A1s6E4aIK6cfr71rOROW8Nkl5XLns3p+g5qAnna7Y619Gdb6D/HfdtMTudlInLX5wEG3ChHvLTIrGObBzbnNUjZqBl4dGsFVNX2NDJctbUBo7DhWNupvxkvx7/xiILLhWAPEbxUkrj+/SzErCav1nazRb3oJv8J9NUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXeNfZTJwTQH4URh7Z09c8XBBl3wTwyVUsnPEBEg/I8=;
 b=U7qfDgooZx2lUpHY3g8QYb7oi0Ojm/5iMBNtiotYrj5Uw6QAOcLnR/6ic8pSNrKsmnyKAxg5T2z/3c4gtEccdgitU6Dp1Y+md1QvQChlskG5GT2ED3TMI2E8nLBsauPSFTREodYCS33eiDaCganxbnJ91kwWMViAMGJE25BpgNI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:56 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:56 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 8/9] dt-bindings: riscv: Update YAML doc to support SiFive
 HiFive Unmatched board
Date: Tue,  8 Dec 2020 10:25:40 +0530
Message-Id: <1607403341-57214-9-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 04:56:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cd98e1f-097b-4b84-6196-08d89b35aff8
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB44404EFAE4CD6B7273DEBE7182CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnkfHXfjOessFa5QWD8Tvmo3RlfCTw54EOi9fJDpFh0Sh7hG3LV1/7cLkVlTyCByy3G860e+ajePASaX5MI928rYivXsaOzWKeIX8Hu7jY2/IbBqPPKCoxSw9G1WNZuPF12IU6SF1EwOumCbmThXsp/T1N3H93JWa03sDAD2t6z/1btwREvDppmf0cCA9lFPsPd42tIYVcZs4vx1+ZoJj9h+tAnC3SETC4C4QE5P1EOYo8GzwCpAgB3ms4ocrtS8QVyXzaHb9FyaDbiwv3AoYsN3TsoR7Bdsyhaopnqqa8QfT9g2Vy2BmwfExbUoyXFEkEazFDFtMrQdelkNHwsjtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(376002)(39850400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(4744005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EU6rP71jEmrsdIZt/tspq2mP4Xj8U45TAT1z6qWzAhdUsnIqTdDvDZvkpQt6?=
 =?us-ascii?Q?Nsi/DV7RFQ/ygKx5w3xFQRLz22khl7ut9+/GHQJyqCslMc2618snCSuXLGrQ?=
 =?us-ascii?Q?0xS2WXI7WR3Bd6iiUAsc38zyxYb9u5RYdZk3ucHlbSo65otV8YlrDwIvEyjK?=
 =?us-ascii?Q?VLP4jlO4qqzmkvMCIumZv9ZwXzGBawgw2cVeEhAMP17R7BELXLTduCQkiY4s?=
 =?us-ascii?Q?NHHcDwUnM0528keO+IthzFeRGLkcbCDmx/MKhFu4MvJ9nmG+Gw7LYDEADXj2?=
 =?us-ascii?Q?qKoe5cACxIFj1yQP0ELSJMWggO4j3K59xo43MVUAv9YaIfb2s4Ub1J9CGuSD?=
 =?us-ascii?Q?07ZYO3NgCON3zDhvnWGQ2Oeo9nibcktiBfwaSkz7FElzObuFBsroZEDQkF7u?=
 =?us-ascii?Q?ab6ANYdVAwj9O783OJLWygd7HCZZdB27844e1qWrrgtjHvLdCsMNidFk6p82?=
 =?us-ascii?Q?8tMNW5UJOqjfSFbr5Xy8XzSvihgXfmnDCRPHjHPMNLpYbNJOIzp26L7tUuMK?=
 =?us-ascii?Q?rK1388jq8/M9CxbbFSePTEep2U/tv9lwJ7ht+3gMP7AKoBunDVOPwOpY+kAb?=
 =?us-ascii?Q?KS7/uZnMLXx/36C1j2n8/7jNi6v2vue2d3zfMrdTLbC6ygMj7C3yhvwAyhSP?=
 =?us-ascii?Q?36eeEfdhJ1v+usjt3MXzMLrd//IpML8oDEXnkYhIEkGu8uQIgFVDW0sRe19X?=
 =?us-ascii?Q?8B2gG1CrRzwfKmw6KOP+E2NqT7XGLgA6/vwr7dIqQQh5BvMwuNpcvx1taqjT?=
 =?us-ascii?Q?X7HH210ob6TaeEw7flo9WAprayzNEuOOPFFFsoSCD72hcXFHWGcd9awBwQgA?=
 =?us-ascii?Q?fKLap55diZSkiRqTii1FCX9zPI+DsgDv6cLK1eqfFJuQpuT4RgGM31juLwwB?=
 =?us-ascii?Q?vVIfnFXVI4LKFygPyDipziYT1gFzWBqExK3pPajLBMqdNsRlRL0rfs/ErY7U?=
 =?us-ascii?Q?cgog13UAzNtpqnYkcN8NYc9Qpx99ICQgIwcZsw3e240S21IzS8mFJqo+NN8j?=
 =?us-ascii?Q?IVqO?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:55.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd98e1f-097b-4b84-6196-08d89b35aff8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9onxORMxzVGeSJEfa3rfCocvHc/AT19xrzyKKkunnZvc/9l4UIviPBNcgY6HygDp61Wye2ns5aK7FREX+eqhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235658_548391_E615CC79 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, broonie@kernel.org, paul.walmsley@sifive.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add new compatible strings to the YAML DT binding document to support
SiFive's HiFive Unmatched board

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive.yaml | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive.yaml b/Documentation/devicetree/bindings/riscv/sifive.yaml
index 3a8647d..ee0a239 100644
--- a/Documentation/devicetree/bindings/riscv/sifive.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive.yaml
@@ -17,11 +17,18 @@ properties:
   $nodename:
     const: '/'
   compatible:
-    items:
-      - enum:
-          - sifive,hifive-unleashed-a00
-      - const: sifive,fu540-c000
-      - const: sifive,fu540
+    oneOf:
+      - items:
+          - enum:
+              - sifive,hifive-unleashed-a00
+          - const: sifive,fu540-c000
+          - const: sifive,fu540
+
+      - items:
+          - enum:
+              - sifive,hifive-unmatched-a00
+          - const: sifive,fu740-c000
+          - const: sifive,fu740
 
 additionalProperties: true
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
