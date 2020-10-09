Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0635BC433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 15:40:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B62C22261
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 15:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L6hkQZzA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="bfg5fdMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B62C22261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IBd6P55Q4WENt573zu/SEkbI+tVLB1TBj0zcGOpUsMQ=; b=L6hkQZzAhuQtQE+xYMtMfUBkP
	549hbBASoWAuUwMBSlPpNnPvsqpVXqRrFz4lQb8prIzKv/rdplZRygo1pwejah7PUak979+6OoA67
	HLTPxoh7jtXnL3tL9aAhy2oLRX5kF7wZqA1JoHbnPHwKeub4kbuu6UJlDAveUXel90/8WctDYzmYn
	PbGd9TbRkwRWUIm6SnkknDH9el2D0DP3h0aWc73l6s/5NobQz4T66pdAj8jLERcbzeqH8fHBH8E26
	ku6RKnwW5jK2+TnB99h55/NevUKwGTd9cU9Lhh1bqkMjSR7brOC5v11kEZDC0rUW3kOEJjqAdi08t
	PtJhvWhqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQuVZ-0007TQ-2Q; Fri, 09 Oct 2020 15:40:37 +0000
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com
 ([40.107.223.45] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQuVX-0007Sb-3N
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 15:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrHFeBSfogB/TT1y0rkokJbPBqXgPDZW8suxGcUYr4Mmx8x3FszONWMj/ql/DSsVnSNLRN9wvhZ17xwB6zC/7AvcpDWcAPmHGnRRs8xYXPw327Qqn4cSer/1IhXHcnI9UlLU7Csy5zSVUibv4tqIDOUsVbVxUeoJAM9L8CT8mgUTWNmDNEo6iOgjRAKwqvD1KD7+fj6icEBLwgzjTNatxwZSQ7584FvaZ1OOPMDzcMt7L9vKUiAVAwlCgKFd+jKh56+PFf/K5E9w/KmBUmTLMEHmt/KOyNIorqy2szBZ3Y48m5gmghsXC6xGCrEAf43rkRKxbcj65vGie1IoYwiYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFlkY2l+Iqkz+3hDlhXUWudB6E4GF7OSVthEBGzCU94=;
 b=nobK7thWaWIHMQ6eoO9wLZ6Z4L2dVc/TCC/VNQs9WKcz5GfqiVdttADO7VEqrLP8txbNW0cgcMYqVk3yUm9GfOnQ0ONVCstraHQV1a9kjWrkRXmlSWPyG744A1/pvExE0FMmAAaPa0UyK/wP5UshAqj3QBMdoCAuGJ/seknVitqpXEHGelssNt7mxcXs+ZLefAZnpWegNcgpQuNVodK/8WVReNZMXYmOS4Fg0LzfuAMbovCK5wKzLmSXGFzYGHQUeLzLB/CkqUsXJg34iCINRhh2PPf9BJzH2dOXsUjnQad6gYQODFR+bWD3e9ho971h0A42qs+YoBEJk+9GpqfDqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFlkY2l+Iqkz+3hDlhXUWudB6E4GF7OSVthEBGzCU94=;
 b=bfg5fdMYjw3I2ETcrozDnTI91bDqmsUOkdWuWGafOMdQ9vT4/bzym2qGnJ3xPAWg/1w43o5oF8EMg6HHgNbZk/6PWIFi72uJ/CP6h2jqH0nazGeq/z104TOYqZ/e5o4yZkNsl9+Jnj3PyrCPiN9phZi3otxLOEr/BjvvC8T3RRI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4479.namprd13.prod.outlook.com (2603:10b6:5:20c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.11; Fri, 9 Oct
 2020 15:40:33 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::f49f:d6d6:4c97:e5d5%7]) with mapi id 15.20.3477.013; Fri, 9 Oct 2020
 15:40:33 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on FU540-C000
 SoC
Date: Fri,  9 Oct 2020 08:39:40 -0700
Message-Id: <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
References: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by
 BYAPR08CA0041.namprd08.prod.outlook.com (2603:10b6:a03:117::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3455.21 via Frontend
 Transport; Fri, 9 Oct 2020 15:40:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09b4a8c-a13c-423f-4401-08d86c69a8b2
X-MS-TrafficTypeDiagnostic: DM6PR13MB4479:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB4479C71EEF4555406E9CB95497080@DM6PR13MB4479.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V/pfvJgpb/7kuq9JLX9tsKMaazbdgtvw1047Kz1eZAyKRgOf0Kv8PucjOnrDBRrfp9EB9BwvlhJBUQsdibqFSsmhejwCx+sytC/Ode7arqBTCciE5dN4sc1sV1UVbOGtPO/jOUXTef4hixhyKOYj5pEqoaanZ9TrisqsdkjuYHYiL5XtYHZ36isXm/ofus5eOHr8lmo+a3zGhzqWvx0M/0CjgE+0DE0CE6yUn4kyu9xy1SZ1JeFaPQo2JsVl+vYuheJ/Y84P5e/QH/qPW6DAPCOtA4GXLRDhPSvtawQ8scLANERnM5ENjfczBhv4l5Gw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(366004)(136003)(376002)(396003)(346002)(8936002)(478600001)(2616005)(83380400001)(83170400001)(4326008)(956004)(36756003)(6486002)(26005)(6666004)(2906002)(42882007)(107886003)(8676002)(52116002)(6916009)(5660300002)(7696005)(16526019)(66556008)(66476007)(316002)(186003)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hVAt97YLTaojDVseOaU3+YbzhvV92vazZ77f44RMnUZLYlRbtXNFgZaf+JFRQNKUYNSJn41+3UZxy8MFG/q5v132VuAfl5XTcmSKL4iE4uUB7l1EUVqlP/HyfLurJk+A2Fa6ClW9Kk4lXt4eg34tt0qzNj7GpcaOYmNUA4UliGBi/T4KgTFDMynKwlpJqigwib5kp/wVb5Z0yvUcsVmxIemm63B8haAipbv8OuzV3LMhP5nqxU+9njcyGhhEb66UKa/oyAKGHO5zzmTxvl1lB8E9h3AYQXbyZULlNvCXwfgSGvGGAXC1naKklyIHp5EIlNfyd8mkcd0a3tI/raoWXxXmq0+iyEH7ujIGw/y4DVBtAuKDmT+XRxu2cHijyNV5bGz89yQePRd0tDVttkSzS5g9l/eaQcre3DDODtOoGBFfTpc7q+nyMOr3ba1BSWO/fAq6kVRY5tZK+h3zMioRVKkuLiejonbzscrP7mLeT8BkGDK0TzuKgdLeJCcVJJ4k6sHUzNbA0Ryxodz4bX6/k2IPK6f1i7v6pDIlve69fZaBzdpltXqtuJlKHHidpF1KlkTGqxa1NdKGVHBoPqXvjozHDBPrLKUKv5g4eV6VEECOpmiohDaXed1pDVCfNLC0uyEgYs5ddvvwV3MObavApw==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b09b4a8c-a13c-423f-4401-08d86c69a8b2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 15:40:33.2714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/7F2L5JAy9zEaZysIMcTUzkpfUl02WnQLZ2vJ2oqw8OSDIpRQMH66rFH/nljS0l5Pi0zANUUK0Z5HCq9Zofag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4479
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_114035_167543_2DAA0948 
X-CRM114-Status: GOOD (  17.25  )
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
index f5fc75b..9b3d1ab 100644
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
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "sifive,fu540-c000-i2c"))
+		i2c->flags |= OCORES_FLAG_BROKEN_IRQ;
+
 	irq = platform_get_irq(pdev, 0);
-	if (irq == -ENXIO) {
+	if (i2c->flags & OCORES_FLAG_BROKEN_IRQ || irq == -ENXIO) {
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
