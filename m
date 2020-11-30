Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CDEC5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 05:43:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9EFF2074A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 05:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iz6wzihr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="onQ6Oxl3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9EFF2074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hoJlD3yg8ISIXEc7/wI+ClrdW3qDREQr0idoRekV7Q0=; b=iz6wzihrW7p3zFDJW6VSlhyjG
	ZNhAwt79UYGZCPuiRbpTfHpClRg8AlJtuBTK0UZTw2ArcUdLqqOFgPQg68vzvR9cSm/ibBGysCUkq
	Er2rZBwGcY1gzFYoBRcUinpD8YvYagzHU+QYy24BpwM0+ixJqccDM8LNQ6i7OCiJAvOA45Z1Ch4zS
	4ZUh27UrxOOubiVsAM4DAS2Ltj6M23o3m1Gk/eJ5mxtRYG6qiIN80ZXAN5yP/YFMUlcTqKRfjgbeF
	UVP/sitsoJQcVS/LYcxS9IwPLEFsITRJNu3zUJCZziFunnAIg5l1c3+6xmqd8Jvo/oPauOkwnjgx/
	cds+IcLbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjbyR-0007Js-Bp; Mon, 30 Nov 2020 05:43:43 +0000
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com
 ([40.107.244.75] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjbyO-0007If-KP
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 05:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNNzOJrYCmnYHlydc9JQ6oM4Oi4OMs/wd/F1hhpF8/RLeN1KqgX4813iVkWmw0OO72TQFMUfb0HxEnoddIXdrT+rwGXbFO51wkcSZuhvaongsiuE7iQ8ue3do0C6kM2rk7WPtAOsYGEcpVUirUM05QNkO+tHk+JP6y8oGQJ2B+eYDSvqxyl7PMUTdoY5tEWQSjMCt+HUyC5hpIDPiXh/mOLhDXHexil0/QMNzU8soVdZb6eW82yKd/thXrUlXof1fSO1+5xlHAkrkDmQqkTS0Xz7qwbMI9Gn04vCX4st/I3nSpNeh6leRzrbIGd68vWCnoPkbJ80gBAX/QHSBOewyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b046VNj3IhwS0BCHOptnTZEAzIOXOM9b2618hByBYNA=;
 b=Pgnra1ylttSaNO5zkVkdSmir3FeppkhpnIVMZY+9cO+fN+WuWu9BIut3UoCix9Cs+2FXkss2O3NyhceW6l/dNEXBaUnwtE326x416ypXi5thRHKwrFd8sBAz7S6DF+b00HzA+ztoe7XinapeUTg1TZlQT2lN4xN9lvaz6tPld6K5iBz6FVQOY150ld8KFXlconjv7p8tdCk09tIDAT65ozUkcpMqhNfy2To1ksxHFh6e8TM/VQM02OJV/CEtSyUgEccYAOr2JN+OqpXEorBOAsJNZKrvl+tz/bwrQiSe/WgKSaD1bdIXo774VfDHsc6FySzT+yOvE33oTK50OynmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b046VNj3IhwS0BCHOptnTZEAzIOXOM9b2618hByBYNA=;
 b=onQ6Oxl32GKolxEQkCr2/2K6+X7wso88UREGJFGwabHjXlzLzeSUSpRYYeSpEZL/uolndcE1y4CWM0NXeJvbNCeFpfG2LycUEb+tQdjUUIsXjoUrhgxcISUsmg+ZGEZTY+h69ExyKRzPdR8FTnCRjuI6nIu9+fHIQNTRX3ySdII=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2440.namprd13.prod.outlook.com (2603:10b6:a02:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9; Mon, 30 Nov
 2020 05:43:37 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%7]) with mapi id 15.20.3632.016; Mon, 30 Nov 2020
 05:43:37 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] RISC-V: sifive_l2_cache: Update L2 cache driver to
 support SiFive FU740
Date: Mon, 30 Nov 2020 11:13:04 +0530
Message-Id: <1606714984-16593-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606714984-16593-1-git-send-email-yash.shah@sifive.com>
References: <1606714984-16593-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BM1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::18)
 To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BM1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 05:43:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a6290aa-138a-471f-837c-08d894f2e27a
X-MS-TrafficTypeDiagnostic: BYAPR13MB2440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB2440889E5D59D6DAA6FA715982F50@BYAPR13MB2440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /QEPBOkmazR30a25ezLhCCMtTwOVEHMA0SsGXZwjCootg4gkEC0rXRlB0Ka/0+P0AiIk5O9P+qQbtmS3hmZcOYK5JNHuugLLmiWWwUv2myqrKCGCzCia5bnRNA+yfKMtJlC7XDC5/fXnybDUsMqBl0xhEpb8c3jhegnRaeyHp6ojdlGlAZRbpYm82N/sKSOqe++Q7Um2QVPNgEdMrT2cXRawoHv0cVwayviM6EA+Y5xwlCH+uRkfCDswQ6gUwnkBt7Xf9jX6HCqqZ0DygmHtsxW2uwps7XKZEKiJMAF0AaGO//ptwH2cDjOjicAHhgaW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(396003)(136003)(346002)(39840400004)(366004)(83170400001)(15650500001)(66556008)(5660300002)(36756003)(6486002)(107886003)(6666004)(316002)(4326008)(2906002)(8936002)(42882007)(2616005)(6512007)(956004)(44832011)(478600001)(8676002)(52116002)(16526019)(66476007)(26005)(66946007)(186003)(7416002)(6506007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lAtSOJVpmMWYRx5oc1GXKmdef2ztcOVQvxnVpJvf0IAZ8V+9vStI03Tv2KZU?=
 =?us-ascii?Q?nUZwgZunNT835CHHlL3jZWbanqwRFksOTZH0U7rOczdiLyQTl5eu2td2yCX0?=
 =?us-ascii?Q?Uy/lZHaFuDmBWYA1kB2VbbGywsk/x9eEQeoAS3qN7AThvaAHkrgTFmfUSXgx?=
 =?us-ascii?Q?s0BCbnv0B9O64ZGw7Jt07aEPLVdXnd9VBIF3edndR0n2X0CNxtJY5a7Oj60f?=
 =?us-ascii?Q?HnuBvSThXuVwJ5Nqe3GsjTNJFwXYo2pZkt/tamfdVwPhO5KDPm9x0gR7iKwC?=
 =?us-ascii?Q?llUmPRYAc34vvERfrlGVJ2JXPPr8pxbmenNjoyeWFHoK40kmJwG+xyWa/IrE?=
 =?us-ascii?Q?Pg7nHiOlojG7M9nu9PBgXWekzxD1hNatPyWjJVgHlONT3xXRMkti6atKSqMR?=
 =?us-ascii?Q?dTbwUWSYnz4MV7P1Ido8F4YGnRs7gUqxUTDq4BcnOMV0DIRw5jualRMTu5kU?=
 =?us-ascii?Q?jDWbMs2TNmam5EXbvK03g+3m6/TxpUvbuMhzqyrsdMvNIT7r0oBq6xbKp06F?=
 =?us-ascii?Q?HrX5asFZaEk5UzS5Sr8drC+4PFFS7/3qB32itWzl3rD2nF1OVupS9kD/UFH+?=
 =?us-ascii?Q?v9+Q0CWgFs01NU2Tee781u3jG4TvanJUZMq3q/yvd47BfeQ3E/T1IAzaMV0F?=
 =?us-ascii?Q?ip8xJN/32LL5FGeVyy6vrMO3v+itLgRCkiKd7DcejIBG/kgyJ4rlTj+PXXXH?=
 =?us-ascii?Q?RSXSyiyvWPRF1etq7BoH70KFRmScVp76c0rgNGpFSOdcs8Wpnwxx6+DOQVZp?=
 =?us-ascii?Q?17ahfEomVE5Xiqvj+JQ5Q05mj1iFA3KVozf8a40FRUCdKKJs9vu8EuLHP726?=
 =?us-ascii?Q?X1N7Bz6Rrp2EcTOdn78qYVHSGvSzIv/BweZmGXBXkX4YY/6nGA9/OtgQpvkW?=
 =?us-ascii?Q?BElUwzK/oz5DeW1YjlKNqBbx6qWYl8vMLUwLeJijPG1jLb6KWP24SnB+tER0?=
 =?us-ascii?Q?LpTRt0vrKEpFH52KZPD9fTpBAi2Iq5/iqhZDSg7RFml4bnqd0T8lmp3iT/o+?=
 =?us-ascii?Q?AK6F?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 05:43:37.4147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6290aa-138a-471f-837c-08d894f2e27a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3KWshbZUpaAueEfQokQqu1u/nHTXjt+/kDip7x+yxnA+gYPvDvhUaRfdVDCB9FZFhyW5ybt2zK18rpF8ZAL1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_004340_949210_33E83FB3 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, paul.walmsley@sifive.com,
 wsa@kernel.org, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, palmer@dabbelt.com, sagar.kadam@sifive.com,
 Jonathan.Cameron@huawei.com, bp@suse.de, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SiFive FU740 has 4 ECC interrupt sources as compared to 3 in FU540.
Update the L2 cache controller driver to support this additional
interrupt in case of FU740-C000 chip.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/soc/sifive/sifive_l2_cache.c | 49 +++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/sifive/sifive_l2_cache.c b/drivers/soc/sifive/sifive_l2_cache.c
index 44d7e19..4e5e841 100644
--- a/drivers/soc/sifive/sifive_l2_cache.c
+++ b/drivers/soc/sifive/sifive_l2_cache.c
@@ -17,6 +17,10 @@
 #define SIFIVE_L2_DIRECCFIX_HIGH 0x104
 #define SIFIVE_L2_DIRECCFIX_COUNT 0x108
 
+#define SIFIVE_L2_DIRECCFAIL_LOW 0x120
+#define SIFIVE_L2_DIRECCFAIL_HIGH 0x124
+#define SIFIVE_L2_DIRECCFAIL_COUNT 0x128
+
 #define SIFIVE_L2_DATECCFIX_LOW 0x140
 #define SIFIVE_L2_DATECCFIX_HIGH 0x144
 #define SIFIVE_L2_DATECCFIX_COUNT 0x148
@@ -29,7 +33,7 @@
 #define SIFIVE_L2_WAYENABLE 0x08
 #define SIFIVE_L2_ECCINJECTERR 0x40
 
-#define SIFIVE_L2_MAX_ECCINTR 3
+#define SIFIVE_L2_MAX_ECCINTR 4
 
 static void __iomem *l2_base;
 static int g_irq[SIFIVE_L2_MAX_ECCINTR];
@@ -37,6 +41,7 @@ static struct riscv_cacheinfo_ops l2_cache_ops;
 
 enum {
 	DIR_CORR = 0,
+	DIR_UNCORR,
 	DATA_CORR,
 	DATA_UNCORR,
 };
@@ -93,6 +98,7 @@ static void l2_config_read(void)
 
 static const struct of_device_id sifive_l2_ids[] = {
 	{ .compatible = "sifive,fu540-c000-ccache" },
+	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ /* end of table */ },
 };
 
@@ -155,6 +161,15 @@ static irqreturn_t l2_int_handler(int irq, void *device)
 		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_CE,
 					   "DirECCFix");
 	}
+	if (irq == g_irq[DIR_UNCORR]) {
+		add_h = readl(l2_base + SIFIVE_L2_DIRECCFAIL_HIGH);
+		add_l = readl(l2_base + SIFIVE_L2_DIRECCFAIL_LOW);
+		/* Reading this register clears the DirFail interrupt sig */
+		readl(l2_base + SIFIVE_L2_DIRECCFAIL_COUNT);
+		atomic_notifier_call_chain(&l2_err_chain, SIFIVE_L2_ERR_TYPE_UE,
+					   "DirECCFail");
+		panic("L2CACHE: DirFail @ 0x%08X.%08X\n", add_h, add_l);
+	}
 	if (irq == g_irq[DATA_CORR]) {
 		add_h = readl(l2_base + SIFIVE_L2_DATECCFIX_HIGH);
 		add_l = readl(l2_base + SIFIVE_L2_DATECCFIX_LOW);
@@ -179,9 +194,9 @@ static irqreturn_t l2_int_handler(int irq, void *device)
 
 static int __init sifive_l2_init(void)
 {
+	int i, k, rc, intr_num, offset = 0;
 	struct device_node *np;
 	struct resource res;
-	int i, rc;
 
 	np = of_find_matching_node(NULL, sifive_l2_ids);
 	if (!np)
@@ -194,11 +209,33 @@ static int __init sifive_l2_init(void)
 	if (!l2_base)
 		return -ENOMEM;
 
-	for (i = 0; i < SIFIVE_L2_MAX_ECCINTR; i++) {
-		g_irq[i] = irq_of_parse_and_map(np, i);
-		rc = request_irq(g_irq[i], l2_int_handler, 0, "l2_ecc", NULL);
+	intr_num = of_property_count_u32_elems(np, "interrupts");
+	if (!intr_num) {
+		pr_err("L2CACHE: no interrupts property\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Only FU540 have 3 interrupts. Rest all other variants have
+	 * 4 interrupts (+dirfail). Therefore offset is required to skip
+	 * 'dirfail' interrupt entry in case of FU540
+	 */
+	if (of_device_is_compatible(np, "sifive,fu540-c000-ccache"))
+		offset = 1;
+
+	g_irq[0] = irq_of_parse_and_map(np, 0);
+	rc = request_irq(g_irq[0], l2_int_handler, 0, "l2_ecc", NULL);
+	if (rc) {
+		pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[0]);
+		return rc;
+	}
+
+	for (i = 1; i < intr_num; i++) {
+		k = i + offset;
+		g_irq[k] = irq_of_parse_and_map(np, i);
+		rc = request_irq(g_irq[k], l2_int_handler, 0, "l2_ecc", NULL);
 		if (rc) {
-			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[i]);
+			pr_err("L2CACHE: Could not request IRQ %d\n", g_irq[k]);
 			return rc;
 		}
 	}
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
