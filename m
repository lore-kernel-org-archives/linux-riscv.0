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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDBDC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240C723A5E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240C723A5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AqKBrxDNtWRdkMMThZxAnsqCP55SStQTddRwh5Itd6s=; b=ieC5Gb70fcpYLcfvqrpwFm/Rv
	a36jRz3/d5TDqt/tmKy6Q+swZMvQBBztMcC8i6L4Rg2CPwf5BUGdzJQZx3FneTNh6PRYyxJxeBDav
	CYG5bzFGOBP/c5jp4RMbP/pgdP/ldQRiWkrXRrfLOK7qlS6bDc/9tBFVD4iY4cW8NVTrENKEt7cYF
	VhocasbcL53i0l7usRrpRA8YDrXvsuUl2P2+a5jauNY58dPxPp9YVe321m6qZ824704eWmBaUCE7V
	lDimwJF9kNm78f5ZNbgQs304DRclwRx3qzcjabxxMCG5YYn4b3ZZa2fnVDe0I9e9xCI1eGL66f09U
	zSAgVq45g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV3C-00047j-IX; Tue, 08 Dec 2020 04:56:34 +0000
Received: from mail-bn8nam08on2072.outbound.protection.outlook.com
 ([40.107.100.72] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV3A-00046p-7P
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYjL7BGr0gMMB0tqtyh5Lijm4sl6pTybwEtfn5JwrAVTh9o9NZB2m7ToMFaRi1PkwKbFk75YmYvE+p0bcmCebVkRjDBnZ/3fK+68YhJpzH1fBonIcOyhB8FBfpflDsIE437F/xxp3lpB/VsCgwHYJwRrBJXsFg0Ok3QN9+XuHWC1EENLs9bVP1m10Vw6I8kJ9wisfHqQFUro30wY7oPzfRC6L618c0Ky8tp9ZwrVSEWY5QwAOzAxXClQ5J3s/XohXp3pNWAaRl1u/+LSQkJTRc9CiwA3MvMaHlcwb6wHcQe54fDo4OQ5/f8RzYsLQ+yzbdIZypLOOerjTXejakjQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIt/BAEV2eSwG4WzPv5M5r54ldmhsm8eqjF3OzbEboM=;
 b=B9V4gq02+5s3oQ1sP17iNG6ndSpl9wwP6WAxN1PJjoUbQsHmuNM9xxrmDe+vo5Ky2EjZ9JUiXnyIzqj4YdxNj/xwRELDdi7Xe63Y5ZwRnrT53EscChTCSbajTNi6qz/QY0XekCevYpOCsSTyHuNG/EHQXK9ACLmL3ltNRXlaDuAYd5EeqkHcHrhojD1M4MPJPOrbapTw/4M/gnc1GCB9IB/ybxUzpssZhX+0j32nrZhmjXq9detG1AMnmd8nSyClpGDcHB5ZGNNTnn45f80wxrD7uMSNGwS7Fl5Zb1m6CXm9XUmwIYPkPU4HhVIZ8IbcNQ1LN+q3Vvpm93B7WCGmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIt/BAEV2eSwG4WzPv5M5r54ldmhsm8eqjF3OzbEboM=;
 b=kSMfLD1u0SdQackWj3uJNxy7zTVHhvz0tK11uaB9h3jPJTkza9BMqMEVRH1TcPfb69w7Ygj8RnZwLnJY0s70dMzunckEsyMOuscvJyQB+OyUyUW1bqEGhRBya1R/mckgOknGX8qN2A7sOXfQ0V4Td3Vp5giwSi5gmx4F9S+Ctxs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB4440.namprd13.prod.outlook.com (2603:10b6:a03:1d2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:29 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:29 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 4/9] dt-bindings: serial: Update DT binding docs to support
 SiFive FU740 SoC
Date: Tue,  8 Dec 2020 10:25:36 +0530
Message-Id: <1607403341-57214-5-git-send-email-yash.shah@sifive.com>
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
 Transport; Tue, 8 Dec 2020 04:56:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 700a8ac3-d8f4-4a0f-362f-08d89b359ff7
X-MS-TrafficTypeDiagnostic: BY5PR13MB4440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB44403FDD7D3392E2542E6F9B82CD0@BY5PR13MB4440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4jY96Zukd01XPllKOMvcW6MBkRNNyuLRezg2QenfFWMIenyCuh3CxadaAo5P8P4MC9EHI8W2h5egceQJIVGaC1Gk9FV8APG4BUfHio/AEKYi0K7MiqTFGS4jAiPp5c8P+W4+391pfubLKqOYNOtuJKFb51WAIxwFPtKVEZ59GMPy7Khg0utcNG26WXZtfPMvEUhNDkZbDXMDFDz3UlGwZ4EMEpo+ps4udVQ3t/uBvgP4qsK2RiqnHtnQe9X+55PoDG6GOwKZKZnhcq3OptcgOGjT3RPH9cVXl9gxxRyeQRySpyv/E1aYMdQB0xju4b8q/bwpTJyR6h92zG1E87Nq0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(376002)(39840400004)(366004)(136003)(346002)(52116002)(83170400001)(956004)(5660300002)(4326008)(107886003)(2616005)(26005)(4744005)(2906002)(316002)(7416002)(42882007)(44832011)(6666004)(83380400001)(16526019)(6506007)(8936002)(8676002)(36756003)(478600001)(6486002)(186003)(6512007)(66946007)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YUD/Iy3rr/ayhWMSwp0RiaButoX0Fd28p2iPn7v8s3dw9CqJZAv1WYH2iC6U?=
 =?us-ascii?Q?uxg8qFQEHH8lX40yiEIfOoS3Mfnow6cq6jnEeErzE+TlAsyjzyLA6QNcHK5x?=
 =?us-ascii?Q?NVRieUaL1D+kWqO6n4H1JrLTj4Pfkzt74uhWL1x3OwyGbCYPXpM3T9RkVf+X?=
 =?us-ascii?Q?XOWVdSIko1pJsjDY9ilwGCvnLal4q+xxd2WCi2pKl8QFvWfPQ4j9DptfetON?=
 =?us-ascii?Q?hXh3+LLmWkNsV4BHYuUvwPB26huuoJ+rUxLCvLsvnNVvMjI2/VqN3VjijTVV?=
 =?us-ascii?Q?ZMor4/rnJh7MDJfK61H2HnpYx4cjAJshNGCly6J4kb1WDBtBDLKzDIOut8tz?=
 =?us-ascii?Q?490rCzZJl4VS59LHK3vmv58ePU+Ynz63YfDSuDMfjhbyoIccKlM3UaiW9dx9?=
 =?us-ascii?Q?3c1AMeGv3mi6O10x3XbNdnQWhgz6Di+y6CIksSG5kcTR1CyLliA0FzHZLjK3?=
 =?us-ascii?Q?Lb7pxAlKSbfDpjLIyJeP8BIpcKRM7om3atjd1DS8gtcn9VN2902XKFphfFMe?=
 =?us-ascii?Q?0bF2kQFcCUYNX7/6a/8A+k88SCVivg3dm4z9gJb+nzdkyDT7Ii0ynPGhfsSI?=
 =?us-ascii?Q?HcW5LU9CR+mXnX3v4PufhlLAPFvqYwtpWT+YcWJpG5q9HY/NKAb/gDLcadn+?=
 =?us-ascii?Q?exe3NYEcnqdi2VeLiv3+1dmYpZ1bJnU4n71zM86W7pcYMQEUnqSUj9B8rpZU?=
 =?us-ascii?Q?3G91TgqIbgSUzJQ4oS3ummZ+lC7WmH5rwdz5lKacAO4pmS6CS5WvaxH6TwXB?=
 =?us-ascii?Q?7VGiJ0nbZKctK9FFqFid287bLSxt+7EPjcJ/hsiv/8iZDoS8h4GOI6q1wvtO?=
 =?us-ascii?Q?DD2OyFUCLjnFhpHQahJG8mIuIgxH45vjApZYeilQJnQMTWAO8ldiHv+Qz3io?=
 =?us-ascii?Q?06dWKtStWNN4kPiUPOFCxPcQGl+XGxVY/DBzBooxVASDln4YxhWSIh1oUHfM?=
 =?us-ascii?Q?wlS4CS+5JZNBkUSFnPczEDOT5MlzqWf6JRQ0qxB+CcrgcYQ0OjOV4LqD53Af?=
 =?us-ascii?Q?1jN6?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:29.1021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 700a8ac3-d8f4-4a0f-362f-08d89b359ff7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqbyOCobgfl9X2ZmNe6ItDvItXHWC3qyj+LuMXIveV/UaxcTT16xlcvItyjbXrMiRYb/IwPtpsS/P+Ou4xPMxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB4440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235632_318120_C411D4FC 
X-CRM114-Status: UNSURE (   9.50  )
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
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 92283f6..3ac5c7f 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -17,7 +17,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-uart
+      - enum:
+          - sifive,fu540-c000-uart
+          - sifive,fu740-c000-uart
       - const: sifive,uart0
 
     description:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
