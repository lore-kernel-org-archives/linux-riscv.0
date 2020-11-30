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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3A3C63777
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 05:43:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4F0207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 05:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zEvzjJT/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ls46MmPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4F0207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ohzidmrQR++KnFnH/GSUKb9KrpCQpyTa92CS40oDepU=; b=zEvzjJT/Tjo1xQQ3aP8dodm4VN
	oVF8GvkqIz4Ps4sLmVTXFYa5EZzaHsUNSU3zk2xohLfYCkJDf40WLLIuZZkoS7ORnAPpzshCX+1HO
	3xMRlCkUSNg//0IO5eCmPLQi8lfoOdXJkVTooBEqIvIL5UcIZn20MXkRIVIhJ7Zfvkn1SpWW7nRZR
	O1r+N4alWu7FD2DxfwW5o3EMPdFEgrFWfeKvOP/lLEczPCbco8Ot2QbggMmyWC859G5UQuchrObiO
	oW0ClWo6RyT6bPai5nuMmJrO0p+dta/1SBXjCiiDokmqy+/ANeuaPToNVMMqftE+bxw45Qmdv1aSQ
	Y8aaJEug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjbyQ-0007Jf-PP; Mon, 30 Nov 2020 05:43:42 +0000
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com
 ([40.107.244.75] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjbyN-0007If-Ex
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 05:43:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPhGbjxRSbMPD2Yp+ygmCWlg1HaKFjerSkK11xIThLKmKwI/62cEisUmZNFhNpWT/095Xc99O2IRPrbQCJ5DzfgAsxYxd9q0Ei9mffbGFkZ5LvODpcukmP038rruUK53RYqAnNZMQUE7ZJNQgaUFucxMWh022Byf6EwgG/b7TmF81hPbi7UHqeG1a3cRWIEOM170gAGQ9HKcviJC/wg1LdMDgGBKxdkRuJ8XACboLFpxUwio9vG4mm84/0WuK47MC3OnGV+NyqbR3F4zeIIMFqfnAGC95CQyuuyqPKdGnCDw56Zi65k4BAnqNrvdNl/LJvm3ZyGB5w/ZtzZ+4O8QNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpmaZZ49zlPkbh8FG6aGAJoSYp8F6ygjf42ozGBh2h8=;
 b=XWunLLr+Y6Cfae6XLuSoCbIb6Iy2L/I4bOR6bQ/HvB8ANDRLT3dMYyZKmvCg4DwqVwFHgAahms4H35MhmJ2c9uPbN/tz3Yr34cELEAp9Vs9hHFqk6g3sZpCXzv25eSMplSKpPLM4/fjsE56vEPZeSEcl4n7vXV8m657DrzSUC6v1n0CjeeOjabCOI9amOicEg/NgjfBlJk7SRIEGu8AFWLGl/dAORF9VImaapX0EtqMHQP+cNHBQCkp/7Xl0ojsyHZoOIQ6oGtdVAZxTLWZQ1dr+/GxnZyWBRvlBPzWJMpOX0/WZwRnvywm/sCalejuNcoFKxut+uIIZigMjXzrwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpmaZZ49zlPkbh8FG6aGAJoSYp8F6ygjf42ozGBh2h8=;
 b=Ls46MmPyixDlIZFbbr8Hsepa5Js0YZTxPL6h2fpii74AjKjg4QR8XuMk+Kt9bHEwgnBfs6lCN+89oNEeKiht0cfTTMKNIhOUIKLqGhLRa9GH3u7htUsacQV8HpVprLiiFNjDGwxjWNi7llCSJkvOEk2aYIRMDZ7XaIz6nu116W0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2440.namprd13.prod.outlook.com (2603:10b6:a02:ce::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.9; Mon, 30 Nov
 2020 05:43:32 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%7]) with mapi id 15.20.3632.016; Mon, 30 Nov 2020
 05:43:32 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] RISC-V: Update l2 cache DT documentation to add
 support for SiFive FU740
Date: Mon, 30 Nov 2020 11:13:03 +0530
Message-Id: <1606714984-16593-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BM1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::18)
 To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BM1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 05:43:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a69e8320-a87d-47de-dc3e-08d894f2df9e
X-MS-TrafficTypeDiagnostic: BYAPR13MB2440:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB24403C4B39A53F62CE39EE3282F50@BYAPR13MB2440.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bb1tFfISLvrpz0oh93DddQI8Kx5Vdq58UyS0X3dUmjDiEighS/EmRfuXs4eWzU+6yl9J0qJ7EElzch/g3TnhCAxXm3u0sUHdtJC7X1D2P+fyX1CCq3U8aaol30II4umLhVne+BXu00cZyWQDr/ktR+Ez4EG8426oN42SB6vs1nOKUGIJjTcOauVLaZ9CfhPI8jwqNmNxlqh4Y68n89ktsOMGiM27ac855xgh4XkZSav7O2A5z2zrhYRLpOCEDk/FG4CllwBTuVnyIMWPt5/ldyjNpR9ANETIdv/aYgxI1ckha2byX9UIp7iQRPHpHNqZMbnok8HTV4M+TWdgjqe1Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(396003)(136003)(346002)(39840400004)(366004)(83170400001)(15650500001)(66556008)(5660300002)(36756003)(6486002)(107886003)(6666004)(316002)(4326008)(2906002)(8936002)(42882007)(2616005)(6512007)(956004)(44832011)(478600001)(8676002)(52116002)(16526019)(66476007)(26005)(66946007)(186003)(7416002)(6506007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4ZIQhfPHGneGGE8u0N04Qm64z6e94BZvQLYz2yOQEhsJMQmbI/gpltdYri+h?=
 =?us-ascii?Q?l+eG7xT+1aZVn+XPVGNvjaJSK4XW+fLkJjQXIOatl+Qvu41hz5jdua46nCYV?=
 =?us-ascii?Q?Rp9WL3mGYEka67OlGm5aBc/UStwpPvcSScWWYNnMsMUrDl9QUZu7Clt5R2Ze?=
 =?us-ascii?Q?xa9lmyKMwrNWR0PXFM0es4p9pplOktM/tWVxmyGXEHVTKAnavbzDpeyJ/o+X?=
 =?us-ascii?Q?AMKC2vDtNZSGLbEDT7x244Ry7JbDsiFevqwcGNunXJFbNGj1czD8Zi424Yrm?=
 =?us-ascii?Q?fehwqj2pQBw/JfUGxVzrlfjlTADljl/JZYFvXBrYFcVWYrf6sKsASvKsr6Cy?=
 =?us-ascii?Q?L7CJ69xxrglImFHMhUrwQQLwSDU+mOuymGDHeceTWVUZGT+voU7OORZ3nzX9?=
 =?us-ascii?Q?3Nawu0NdJJ+FP4Nb8ALuzr5h2TsYDTkl82786WRsJy8HIarXaiv39z4L+Vgd?=
 =?us-ascii?Q?caF7peKcok8IN/s+bsD/tJSR+uwr5IdQuGvPPGmpqBh9cxYUut5yxYxTX0jZ?=
 =?us-ascii?Q?KDWzDPNZOv5y+zEz4ic/tf3kHVl7d/U8YbXFmSXSSP83YKUtdbz/RtkUvWjr?=
 =?us-ascii?Q?JJIuUepSyZ9+C99eVdGTKZDZGRsISIMpDx+htnZn1QsKgWedcEOxlzvMyIo9?=
 =?us-ascii?Q?qfjv5fHXENOpJsv/YUJKBUwAc9S+GC48usU9Lz2IeMM2V4MssMItTC2CSn+y?=
 =?us-ascii?Q?VifM5EUtbuPx6aaBhb1D31G1Yzy/wTp0voAz5r2YK4ioCmWbX24//yXsvXvn?=
 =?us-ascii?Q?1xXOnbJy6KETAz847KO9VUXzPHfQA1r9OvYLlP7wmHAkQddvYk/KpE4gCfnO?=
 =?us-ascii?Q?EtiibRS02Lmu9FDbXbGH7n5mc8kxrxdYHAtMhK3eBFqWIl6Y07TAVaEphx8S?=
 =?us-ascii?Q?1nQsFUhbZnE6gkITwON+kGFoBSe+T+w/j9TZqOFGnBTwU8wHncSKKXDWu7+x?=
 =?us-ascii?Q?l1WXuEJYRIdLcOWX8hwGfgEVPeGzbU7hTxUQa4SRyhk/s65uD6bOzYgYWM6f?=
 =?us-ascii?Q?hhTx?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 05:43:32.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: a69e8320-a87d-47de-dc3e-08d894f2df9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI3ueqy4+W6mfTV8GcclzPhJi1ZnzMbm1cIjXif4g7DGOO3Gk57dKBs5DLzX9QyJNOl8AT29CbpAyQy0qAfJQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_004339_754134_A0C3E7BD 
X-CRM114-Status: GOOD (  11.08  )
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

The L2 cache controller in SiFive FU740 has 4 ECC interrupt sources as
compared to 3 in FU540. Update the DT documentation accordingly with
"compatible" and "interrupt" property changes.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
Changes in v2:
- Changes as per Rob Herring's request on v1
---
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 35 ++++++++++++++++++++--
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index efc0198..749265c 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -27,6 +27,7 @@ select:
       items:
         - enum:
             - sifive,fu540-c000-ccache
+            - sifive,fu740-c000-ccache
 
   required:
     - compatible
@@ -34,7 +35,9 @@ select:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-ccache
+      - enum:
+          - sifive,fu540-c000-ccache
+          - sifive,fu740-c000-ccache
       - const: cache
 
   cache-block-size:
@@ -53,9 +56,15 @@ properties:
 
   interrupts:
     description: |
-      Must contain entries for DirError, DataError and DataFail signals.
+      Must contain 3 entries for FU540 (DirError, DataError and DataFail) or 4
+      entries for other chips (DirError, DirFail, DataError, DataFail signals)
     minItems: 3
-    maxItems: 3
+    maxItems: 4
+    items:
+      - description: DirError interrupt
+      - description: DirFail interrupt
+      - description: DataError interrupt
+      - description: DataFail interrupt
 
   reg:
     maxItems: 1
@@ -67,6 +76,26 @@ properties:
       The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
       The reserved memory node should be defined as per the bindings in reserved-memory.txt.
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: sifive,fu540-c000-ccache
+
+then:
+  properties:
+    interrupts:
+      description: |
+        Must contain entries for DirError, DataError and DataFail signals.
+      maxItems: 3
+
+else:
+  properties:
+    interrupts:
+      description: |
+        Must contain entries for DirError, DirFail, DataError, DataFail signals.
+      minItems: 4
+
 additionalProperties: false
 
 required:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
