Return-Path: <SRS0=uiah=DN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9BBC4727D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 17:54:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A1C8206CB
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2020 17:54:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wYRXfuaZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="Bry70iMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A1C8206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+xWHasQ0dr0U/OM7gkmJ/zbdZZh+oYWeDvfhzJ4BYOo=; b=wYRXfuaZcFQBTWu1f3nOKPgla
	OQ+NfMMHuuqvAjFA+Ns/Mj1U77s8mSrHw0p1pwO6gMM/tX+Vm9MJQUoktRyqwY10ilYxtVeuU9O7A
	2MSxF9SlctOkYNuxe85bvpycfPtNJL+7/3HmieMnWJvN/bbnRDjrm3GdiL344G+L6xizPW+Wbq3SN
	+5SPn/Wp0W06hNCyIK99fvn6EPktmpXEaMBheP/7t7iMW5StFvQioG0D4b/w+KCeuOqV66IY/zOqG
	sJshuq2P5qHr/UQzp+dAt9REbAYfsQgaEiaR8I6jIP3lqlzrI5rrbZzfNKyCMAHKSaG6cINBeYaF2
	+JZu9Sqsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPr9x-0001d9-5V; Tue, 06 Oct 2020 17:53:57 +0000
Received: from mail-dm6nam12on2078.outbound.protection.outlook.com
 ([40.107.243.78] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPr9u-0001cP-HI
 for linux-riscv@lists.infradead.org; Tue, 06 Oct 2020 17:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD2KJWwjy4atR9IeDrWacZnhzXsc5uTu8mu1n9lFMopphHomwWFtmKzPf0c2l7maiNBllwLU0oWwxzMo6mkKlBnylA1nar6LX3kurCMjkfah2Hb5sKh7X8H9TnimrkM/XHTj63AnLKs0aZgyBokX768jW3dGohvZi9a+egGyxIBqZlcFJPaUrQD/VetY6FP64afKRlGrQ0iVAjqYq1nAoQ8NekFgEmAuoHvunJKfVkHYimjY33Wm785/7GoWXBt++vZrskx0vh4gxPjWUuw9Y03UQR5SzuEFbBo6LDgv+AJRVLobGowPmejFJufv+sOaRfxGx0d0xs4Um2Z6T1ZecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilcy4KDtlx40A5A1l3h/m5yIwn3HNtiHS6gHVLV+rPw=;
 b=Plfam7uAoqAhQMXj/OuwMLK05f0UEAMNowZ2n9xHDz/MRU+xpwbieK+fcQxkMElumYo/UOuUrXMMi2RMfMCCI3RjnO3XQjKsQDyEinjQz5gLIcP7j+c69zd0xu4H3aKc4d3jhKvBWUPgSiQK/kIYJ8fv3yzYsWYgs11hRO1p9fWlRHPUIfJ6TzlkLH+5doYrRY6WtB9fo67lixi24RDfq7dcX1wazHQpZqPG66dqZY+jcpG7GDcgYF67Ug5G957kkvnTrxG4YD4N2jUe8AK9MftO5KdqQJKjKDG/JI8DoO8mO78VtiiFkVxXZ3GK4476Tz8wRvczGrEkcCZN6WQGCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilcy4KDtlx40A5A1l3h/m5yIwn3HNtiHS6gHVLV+rPw=;
 b=Bry70iMZq1u7WXODl8bv7eG1hw6l2zKk2DaoLUPjNqc6mTxykvdUlbwOIa5BTrbREIBYU7NnrSRwgkYCQyjg5ZRRPCvqMpSZZFEu46qOM+YycEhza6nHd/lI/HjAQko9H7WgyTjHbV9jqnRDJ1PEfJM5v8fMciO1g2+fQKj7RnE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4495.namprd13.prod.outlook.com (2603:10b6:5:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.13; Tue, 6 Oct
 2020 17:53:48 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3455.021; Tue, 6 Oct 2020
 17:53:48 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
Date: Tue,  6 Oct 2020 10:53:16 -0700
Message-Id: <1602006796-273724-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
References: <1602006796-273724-1-git-send-email-sagar.kadam@sifive.com>
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by
 BYAPR04CA0008.namprd04.prod.outlook.com (2603:10b6:a03:40::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3433.35 via Frontend Transport; Tue, 6 Oct 2020 17:53:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c16a9430-ca16-4105-e1d6-08d86a20c6d7
X-MS-TrafficTypeDiagnostic: DM6PR13MB4495:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB449518BE5CF12BFC446BCC19970D0@DM6PR13MB4495.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0x+lT0weF1yLxbLE5m7i097M0Ex85eK+a9KAVhrauc+3TtmjAb2Crvj0PFzK2P1BRs4w5Y4H9eFh5s2rBJzLveX/vrJyccn8ndhMLpAjLveK8/l9u0wyMtwSg0nrDOLaly0glg07pTpehhi6xZreUIpePtvYgeEXRVNYf5xlz3AUZ2Bc6zlFGBpIXdmur/ZBMcv6EbwklVBpOVR9tzD0HitJxRO4I4B4UttnM4GOInFYhnDzyKKfEtVIdwcTgPuOenxRGAtBrtsHsImNCHy9eEecrkZbNoTXQ0JMvEZzACVh7ani8E0iMa2jMQpfFcz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(376002)(136003)(366004)(396003)(6666004)(83170400001)(8936002)(8676002)(107886003)(5660300002)(66476007)(4326008)(66556008)(66946007)(83380400001)(36756003)(6486002)(478600001)(2906002)(2616005)(956004)(6916009)(52116002)(16526019)(186003)(42882007)(316002)(7696005)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wLSr18GBGxv+/dXTjk2GpDNaDQrND6AxYjaQuDPWXJK0DAOfDV5tydrV+iAysTNiaSfG7xVL4zp7M5xCBJTyqYrD7VwOtGhOHF1CWgRyMg96fePmS8cq7QSSY16c0VIFgzcvbedZhtAmPK6aIqeAJbBViU9mgbHSWAsoRUbJjgTzxFsG1Drn4hF0f6UO3Jw4sGDfId3m4VnpqhMywK88TTx9+KkILQjXNykHa/9b3GnP+XvYC/CQXeEP2/LwSAY5PtmyQ8yachVrgqaWrRZCfVgP3ddI2GniSRcalWCpVkA4RyEOo3s6IS7jcj9fMWGv3xzT7+mHfg8HqjMWyMvZaiBtIDIq32GlwK2OQUot98hpjSs3mzhdoKmAWWttH5EI4kuFN4v8HP8JGPuNPCZxfVZz1X0RR1RRVG0oajFflk8HLVTd/mPCK2WLXUy/ygnzsJ1ZMh+qnDx4Pz/htNNRNJwyx4jJjCuduarxi5p0gqJFIj5FpANwh56cql7fMBXKVIqsuB6Vqcr5yk8chp4ekHHEf1JN3J3p9ZC6BWwYBsbCqL9kqquulbEKJzse0zclZiM46zRv1iJ9+03xBA7d84g/eBsQaPvvEV6wF7LlIPpLkO2VJlYLO95oow06A7o33Auv7mUvO3kKY7HRxUpQFg==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c16a9430-ca16-4105-e1d6-08d86a20c6d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 17:53:48.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRTonR9DYgxz51n6DBH6SLhlfUQzawvLH/clH414X1HF7suhAaehLOO2JC6PaTmeB9tCsirwHTlhQIFIQo552A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_135354_590322_6B23FCB3 
X-CRM114-Status: GOOD (  16.17  )
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
 palmer@dabbelt.com, linux-i2c@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The FU540-C000 has a broken IRQ and support was added earlier
so that it will operate in polling mode, but seems to work only
in case interrupts property is missing from the i2c0 dt-node.
This should not be the case and the driver should handle polling
mode with the interrupt property present in i2c0 node of the
device tree.
So check if it's the FU540-C000 soc and enable polling mode master
xfers, as the IRQ for this chip is broken.

Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
for Sifive FU540-C000 SoC")

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/i2c/busses/i2c-ocores.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index f5fc75b..4405244 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&i2c->wait);
 
+	/*
+	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
+	 * FU540-C000 SoC in polling mode.
+	 * Since the SoC does have interrupt it's dt has the interrupt
+	 * defined but it should be bypassed in driver as this SoC has
+	 * a broken IRQ, hence update the master_xfer to use polling
+	 * transfers.
+	 */
+	match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
+	if (match && (long)match->data == TYPE_SIFIVE_REV0)
+		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+
 	irq = platform_get_irq(pdev, 0);
-	if (irq == -ENXIO) {
+	if (i2c->flags == OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {
 		ocores_algorithm.master_xfer = ocores_xfer_polling;
-
-		/*
-		 * Set in OCORES_FLAG_BROKEN_IRQ to enable workaround for
-		 * FU540-C000 SoC in polling mode.
-		 */
-		match = of_match_node(ocores_i2c_match, pdev->dev.of_node);
-		if (match && (long)match->data == TYPE_SIFIVE_REV0)
-			i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
 	} else {
 		if (irq < 0)
 			return irq;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
