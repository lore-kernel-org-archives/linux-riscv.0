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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277B9C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CDE23A5E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1CDE23A5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fpfs7AyMKjjAafqIhR6T9w0PfkLDXVNGcpbQpMhXGM8=; b=u7nHyH1/dDr2N4WSseHQQO5EZ
	GbHYjnW+CXRMsHdosublNHm1dUSBEXd/fhKoxsn3fzjq/KXODNSpf3lILFSdz+otCSErlab+5AzS0
	FZXbPG4gO6fZecXC+VJu0UUBDTP62amNUPTm2lYZlLCA8DEp5OMQRjVLnEeRr3w5EPZxSqiOx4JSv
	9LMwTXUWHvzi6RkB9w/75BXhwJz5L5ex0q78s7mrH/ExcJOLUXojQ0/feNXvFV2uyLD9QRmK65mq2
	R2kxhODv1XkWBerIkS1MyZHBdKTgwJXICPdWkVvHLWmHCkfBT1s8+TnxaxgVMuvGOFk2mzj/9brre
	EGMM1sO7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV3K-0004A9-4n; Tue, 08 Dec 2020 04:56:42 +0000
Received: from mail-bn8nam08on2045.outbound.protection.outlook.com
 ([40.107.100.45] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV3H-000496-Mm
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5zrYcRQMXxDz4QPrmvVsSEkH/1ervDVKD2lRjQ4kVpkIvK2u/iARAgUKBOvoGa9UslWH0AaNRsRcxnJKYT0/hlw3ZpBepXq5t3Z4HKe/JDrcB5EVy9hXA9727jnYGsquxnOmYr7p31aEhmz6Lt6v7nTyLIxx/MpxaE0/ZT3PyYRo3w9MglTm88d5VtNuO6kgtYMFy0n2ydxAsAkZ/b8epPKuKcr52IAwwbmZTM4O0NcmvrXBNhGpubxGvSeSPd7FqlvPLrngscJhF88v9HRniv6EJTPyOo2bFVa9KgCbOG+wPns8fL+VbC32oExh1knur9QYOGoA2Yw2C20kau3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZhEKCFJzCnNos2x7WD/PFnlxZ5e89Fqzk8AyLv7PVs=;
 b=bzxdFWUdjnIhQG3pRWhIXDyUu6fzYNWpi9Mj9ePEW6yxlqvRLH9HgHVgxZdr1Kpa8+083A/JdMqwU/4pIV4YvCQf9BbqxfYR28wPpMdlJ9Vi6XpCF2W5poRHlNRaY3ffYFQyJhMOtaVqx1vu/pky071Pds3rQLe7KiZ3mX1a655PnRuJ3p6stAwcmukWgilqg3ybNi6WIXpMIxG2elCjVacOXpekuvxLspGBqYM8t3Qbac40o9EUrC2+/EdjS+6U/yrM+dATmrTWg8hKZlXSjurbdJLBucgs3YV29VlQaX+DS/eVGgtMZo5RnnHNIaIjjXGFK6S5wYXibNsjcGDJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZhEKCFJzCnNos2x7WD/PFnlxZ5e89Fqzk8AyLv7PVs=;
 b=bU68HKIX8VgNCVD5EK2nCQ5JhTy4I6YCaFk802Le5FycONM0cfNytYzGG9hMRkLIChfkCNCuKmyeCWK4TbXBo9A/mK4XguB8I1BGZjRtWayndNtQgC3WvICDjokYMDjOli5EazUzJcMQCNmeMC0FGhXVaRe3OJzt7KDD2CLv6Nw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:36 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:36 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 5/9] dt-bindings: gpio: Update DT binding docs to support
 SiFive FU740 SoC
Date: Tue,  8 Dec 2020 10:25:37 +0530
Message-Id: <1607403341-57214-6-git-send-email-yash.shah@sifive.com>
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
 Transport; Tue, 8 Dec 2020 04:56:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd728beb-dada-4abf-6489-08d89b35a409
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB4440C1D87D63D5EA62D0D05382CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSiPzJ2VrCiH8pIUaY71wp2QW469Mh3nxQUWzmTIGBDlEGkL3Ien4XcZDVWNE5s6g90KaObdZ8rloIausqIGl0BfiN2ciHMhary1I2rmCNLFh/OCxbAtZ4W0K61SVDDwwjyf4J3A0WKJDqvHiiOiBhNPuwuIDTcECUew7qPgo4WQD7gO3QpReXR4eW02bEKlu590KpOmkelUJxEGtcNCGjqFbAuoGp/RlpmbNoRh+ESeTXhMkXchw3wis9mTGeyovgfcYNSc8XrbnEVuOc+FBApAva20yr6+6JQCgSO4P3MHsd8hb8stX2x0SADvhWjiUcQsxCkOvB8Opd2rd5Z1IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(376002)(39840400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(4744005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qklgi6aeC/MFw1QoJSOC+Q9RidOpfoGWub53rLxrbKNO3toHkjzvzHunlJCf?=
 =?us-ascii?Q?n/AvPjyoXi7b1OTZwdCt5rKVnvFH6gY6IYTnMdyNVUzdWVfQGkkngWqGzo14?=
 =?us-ascii?Q?V9JRDQuPgBq/4eFsBQVgygLO5tVy9zwT3mJk80b2b/7TAJ9qZba7xDlnMbcR?=
 =?us-ascii?Q?Qbi676NLLzXiqQUTzfjiXQErQgBZ1oOkjiuEQekvvdzoGUd5IeH/+6a4Hq6S?=
 =?us-ascii?Q?21K0D8ynhcEtRdQsu+1LHVd84TedIyRpm5WRZuBvhamACewB8Py5BDBt31x5?=
 =?us-ascii?Q?pHWZAjZTlF+kY7AdShje1O2k963dqW+QbC01hHSxRPIrpMECV4mvnD/bUCpK?=
 =?us-ascii?Q?n/dqdNSoJeDOmwpkI0Nzs+mLN65E6wHSPPmJnd5hGFpJnd/rTjrFoepvIoRQ?=
 =?us-ascii?Q?8fOgM+MohXKQ2f0LEx+iaYWDQyp/NYpsJ3UfT4PwlmAwGh06j8kGlHEIIpvO?=
 =?us-ascii?Q?SQJiIcTkqEXJJtQCFoUQCQElD4iEmSpeS8ybs9SK/Jmcse4YyZrWTgKilyoc?=
 =?us-ascii?Q?lMBqjtrZ2vV2vFBqvtGyWt+TnsWvwu41aNryjTwlIYV+asVSvto2yjF/e4Hq?=
 =?us-ascii?Q?MuFUMpRrzTnN5M0kTdZI1d2A4MC5D7G7VFkk5veEV1ZFMI6/1iFDsTqogna3?=
 =?us-ascii?Q?HeWI/Lq5pOyjbWPPs/qMN+8VIw6eeddJH96g62oq9zbBwe+vP4PaOm61BNjy?=
 =?us-ascii?Q?sqyNdJ1qwsLjK8kosWe4rkzwWjQETtHlFdHERP0Wh/zZryq61KojpG+8hOTJ?=
 =?us-ascii?Q?nVXJdoJbSHzJ26bJrfj4Ur+0NEsngtl53XFYMFVMrdgNw08kHPUC4DaiccLW?=
 =?us-ascii?Q?Yr58AZqLe01Fh+R6XzENPB/kNEUPOLxMuMgT66re6/wOCvAcnH5VuMjtPJ9c?=
 =?us-ascii?Q?veWYV50ltnCCFhBSEYsSotvDvaYT4fVe6hLior5Q6rgONMfg+j3rRhXXu+Fw?=
 =?us-ascii?Q?PlmBVUEf2B/MmjLnWr6yS6vWCjwLwGk/RtuX3oNyxeb+r3Wd2yfYb2FZn4YJ?=
 =?us-ascii?Q?T5PG?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:35.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: bd728beb-dada-4abf-6489-08d89b35a409
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSz9aYASvsgWiKs0ATsXUk1fX/ERTXQkTkGQvWV738b+Hp5qL2ZUDbljF3KJaKNkHlL6XFeUkgDE0o88EGDYzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235639_796098_2639E60A 
X-CRM114-Status: UNSURE (   9.58  )
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

Add new compatible strings to the DT binding documents to support SiFive
FU740-C000.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index a0efd8d..ab22056 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -13,7 +13,9 @@ maintainers:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-gpio
+      - enum:
+          - sifive,fu540-c000-gpio
+          - sifive,fu740-c000-gpio
       - const: sifive,gpio0
 
   reg:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
