Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F269C47426
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 12:18:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3133D20759
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 12:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfFQvlbh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="oJXHNoEk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3133D20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x+qw63EZR2pj1o2e4cKlnuyW1QYgl2E75hS6czk8o8g=; b=FfFQvlbh79ueF8zxnaJ+nXR/D
	JLtaKjL/xreCohzKi4K0VmGrh+tSKtliONaHJ2WuehTcCr7IgB8H+4xXMyCdzzQ3gtKpMAtMt+V8M
	2a1LZPn3ti85MLE55I2iL2DvY4jJk6zQhF7d7nE0YtfMmhlDQtIM4wq2SfN9ltF/fREAzBguPPQYO
	eBUkQb4mans2wOEGq/HqEaR355FKTmccXhPkNQzCpyNmgz8Geps1CHoCs83aiHKFL1U/042yjEjjs
	PhD0zNiSJIKxatmYt3rGJZKnDwYKto+Ll+AmgTCmokywZxGM7aLoYViHfq9OVPTrbVRDtXGZTCYtK
	8O/ZsrSvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEah-0002G9-6m; Tue, 29 Sep 2020 12:18:43 +0000
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com
 ([40.107.93.69] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEae-0002FS-S4
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 12:18:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNK1XyVT1wWmQwD43zWq3cX2HvbduNrMqozINNwphPGP+2Ee8WzjVgchwjPaOwPaP08BPasf8pKwXOShFtQVt8sFn3+2EgKRFYxBOMpDK8486wrAZ6HDk6ef2GNR8+WLOO461Yp7TJuxMVRFx5e5ZWrYQShmkPRHoAEo1ml37sNTIdv6epLkVwOvgDf2P40s0hyCsRNAVnBTXyt/JcUHkxm/sdySdgzCsDjVMopNqztI1NeBordM+7YoxT8cA8AzjNf6nbwIpRayrFCUcG1p/97u9yEEvQpT0w2N9zMe/hsas74nrVd54hgp4PMkyYMwedyJuIb48GGrvddRlM3i3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxg1cSWt4hnGpVriVsdZUKDb1DgNcWR/Y/yohKOnSFI=;
 b=CpEH4PFmNjHjv7FUqTLBzoTelutyjJrR1Wvd7V5fxJzi+AgDmJjlhWEA73qE5E8qKbF0gWAVCyP8dMZmn82Kvh/brZl+Wbk7UuzGpq2SY7nIz3Ek2EnjGPUurpx3NdlvJw8lrsacyP69yaZXbLRDPl4S1M4MMft1u9BSo3voRjUZL2EsGfIPiahpvQtfKOfGS8R/stK4mJxyrp/mcOzqgl+knjBItmKaQR//IStMr0yqTvbH9SCnjPiaq8Hjn9fcLtPfzO5hTzEt/H5RbtdlvQrFUrLf8tpTQ586nM27n71w1QE8EuAcr8YbKfMqDoUZTNBMhrt9Hd6T+2I0P9kxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxg1cSWt4hnGpVriVsdZUKDb1DgNcWR/Y/yohKOnSFI=;
 b=oJXHNoEkYmfRvJBkZInZTKnZoRWlOIhNIfv0HSg3dZr9R2QuaHODeZT9E/8wupge6UiT0Tku4VmI8erfiJki7PgruziQKIdwEkJaqywg0/aGWE+qcab8OW5gfgw31Phnr5n+0zoOOBf1eA1LEkkdbFRvPQJyGQhbsSxctU7+dEU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4050.namprd13.prod.outlook.com (2603:10b6:5:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.20; Tue, 29 Sep
 2020 12:18:39 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 12:18:39 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] dt-bindings: riscv: sifive-l2-cache: convert bindings
 to json-schema
Date: Tue, 29 Sep 2020 17:48:16 +0530
Message-Id: <1601381896-29716-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601381896-29716-1-git-send-email-sagar.kadam@sifive.com>
References: <1601381896-29716-1-git-send-email-sagar.kadam@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: SG2PR03CA0149.apcprd03.prod.outlook.com
 (2603:1096:4:c8::22) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 SG2PR03CA0149.apcprd03.prod.outlook.com (2603:1096:4:c8::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3433.20 via Frontend Transport; Tue, 29 Sep 2020 12:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6b81b47-e42e-405e-8f04-08d86471cc06
X-MS-TrafficTypeDiagnostic: DM6PR13MB4050:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB40509CE6E76CE6D9BE4ECF1E97320@DM6PR13MB4050.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3pBso/Kcs1AtYUkhqbyoHQF1VoIToJWD4Lt1vIkTQvaTN9X3AK+VDgQm0QkDGPB42RS9NTztb+Yi+UMvM1hn5powf0h1xvqvj3nzrZtJS1eYefYojLD/LsnfXTZJJcPn+uGeZBdP+dwf9OnJCb+8QWfSw2VjTOASlJnM7X0UXmNvo2LyPdKr+FIa0FtMmEZT05XxpX2bjPJ3y3TmSDZc+rFEds9zH1vD2d32ZYYG6cJVJhSyMJ73bfXFYaxh4Rj0VsmckmfYNEY2NXvxz+DXGljq7uHtOJffOjCGGB+iAWyvwq/AxwCV9lnkXnG0b26ug0LMlWUjQcy9ecpO4ENN7V7pyYKOGkW0mUJKL/djTSgvGhpqxalVctIJEX0k+dClHo90rlnl/HaLIcZLNmXWOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(396003)(346002)(366004)(376002)(8676002)(66476007)(66946007)(6506007)(966005)(66556008)(4326008)(107886003)(6486002)(83080400001)(52116002)(6916009)(83170400001)(83380400001)(316002)(2616005)(186003)(42882007)(26005)(36756003)(956004)(44832011)(6512007)(2906002)(478600001)(16526019)(6666004)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hBZsacNTgVD/jCLSwqGGmPunOOdnU6Hr2oR1Byb97vClThDwnxKyZYS+KuhDKB7/ZDM7slRttEkKGML7lY/a5JJf2i6weOv4K/knaT5D+dsVqb3XzOvibSpyhMZd9M7Uvovzmyq3kV/FA3Vvhzy3AZ//DsDaloP8o2OYqQvvTOjDUlhlLFRuOPF3miqG4qnFkp3oIF+ZxaofOpN9tQkrkeyTB3A7yXTRU5yalus5t3y5FLnL/omsN76Ve9GSFZFIdgNhTqK5xRcbXJfoWvCOUcQjMm8hCIVEFT29cTCK9DS33Z50GJDbzzf1Lyo4RN9qQRK4uU5U+vgykQL8cb0/PtCwPOtIHMA9kqIryYmc4BBhRnS1bNobGdMs0BCjrNO87XSy4g6AJpXLsmo9NipgTrdkS1C92L/VLa0za958ADo6SxMLmE7+WEIIBNZBp4lFVtahFwj/SbNCNH3iq3ytYwwinXZC/5WbLaE6p+3QmJWMrw9pvj7L+xkCIG1BppfSveychhJhwBq6zT2vhXvyC7uaASaxWmlHMjQfh8EWPArY1IcM1x89ex17ehAXBjHPestkqNSmze3Z3nfrQjw6sk+rHqu2ratLs5koDTNxGZeOzefWFrt87puTv6JpftVxlwN6EqKq9t/CfCtO2frT3Q==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b81b47-e42e-405e-8f04-08d86471cc06
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 12:18:39.1848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qON6pGmzJ25ftdjykKPdbXPZP4L+BglSldSxqV8pCFrIT0n0xKHvs4STn6hFtoXLE6jz7//WXK2twSUEHf1TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_081841_011612_006653EC 
X-CRM114-Status: GOOD (  17.49  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, yash.shah@sifive.com,
 robh+dt@kernel.org, palmer@dabbelt.com, Sagar Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert the device tree bindings for the SiFive's FU540-C000 SoC's L2 Cache
controller to YAML format.

Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
---
 .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 51 -----------
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml | 98 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
deleted file mode 100644
index 73d8f19..0000000
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-SiFive L2 Cache Controller
---------------------------
-The SiFive Level 2 Cache Controller is used to provide access to fast copies
-of memory for masters in a Core Complex. The Level 2 Cache Controller also
-acts as directory-based coherency manager.
-All the properties in ePAPR/DeviceTree specification applies for this platform
-
-Required Properties:
---------------------
-- compatible: Should be "sifive,fu540-c000-ccache" and "cache"
-
-- cache-block-size: Specifies the block size in bytes of the cache.
-  Should be 64
-
-- cache-level: Should be set to 2 for a level 2 cache
-
-- cache-sets: Specifies the number of associativity sets of the cache.
-  Should be 1024
-
-- cache-size: Specifies the size in bytes of the cache. Should be 2097152
-
-- cache-unified: Specifies the cache is a unified cache
-
-- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
-
-- reg: Physical base address and size of L2 cache controller registers map
-
-Optional Properties:
---------------------
-- next-level-cache: phandle to the next level cache if present.
-
-- memory-region: reference to the reserved-memory for the L2 Loosely Integrated
-  Memory region. The reserved memory node should be defined as per the bindings
-  in reserved-memory.txt
-
-
-Example:
-
-	cache-controller@2010000 {
-		compatible = "sifive,fu540-c000-ccache", "cache";
-		cache-block-size = <64>;
-		cache-level = <2>;
-		cache-sets = <1024>;
-		cache-size = <2097152>;
-		cache-unified;
-		interrupt-parent = <&plic0>;
-		interrupts = <1 2 3>;
-		reg = <0x0 0x2010000 0x0 0x1000>;
-		next-level-cache = <&L25 &L40 &L36>;
-		memory-region = <&l2_lim>;
-	};
diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
new file mode 100644
index 0000000..3f4a193
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2020 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive-l2-cache.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive L2 Cache Controller
+
+maintainers:
+  - Sagar Kadam <sagar.kadam@sifive.com>
+  - Yash Shah <yash.shah@sifive.com>
+  - Paul Walmsley  <paul.walmsley@sifive.com>
+
+description:
+  The SiFive Level 2 Cache Controller is used to provide access to fast copies
+  of memory for masters in a Core Complex. The Level 2 Cache Controller also
+  acts as directory-based coherency manager.
+  All the properties in ePAPR/DeviceTree specification applies for this platform.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      items:
+       - enum:
+          - sifive,fu540-c000-ccache
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-ccache
+      - const: cache
+
+  cache-block-size:
+    const: 64
+
+  cache-level:
+    const: 2
+
+  cache-sets:
+    const: 1024
+
+  cache-size:
+    const: 2097152
+
+  cache-unified: true
+
+  interrupts:
+    description: |
+      Must contain entries for DirError, DataError and DataFail signals.
+    minItems: 3
+    maxItems: 3
+
+  reg:
+    maxItems: 1
+
+  next-level-cache: true
+
+  memory-region:
+    description: |
+      The reference to the reserved-memory for the L2 Loosely Integrated Memory region.
+      The reserved memory node should be defined as per the bindings in reserved-memory.txt.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - cache-block-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+  - interrupts
+  - reg
+
+examples:
+  - |
+    cache-controller@2010000 {
+        compatible = "sifive,fu540-c000-ccache", "cache";
+        cache-block-size = <64>;
+        cache-level = <2>;
+        cache-sets = <1024>;
+        cache-size = <2097152>;
+        cache-unified;
+        reg = <0x2010000 0x1000>;
+        interrupt-parent = <&plic0>;
+        interrupts = <1>,
+                     <2>,
+                     <3>;
+        next-level-cache = <&L25>;
+        memory-region = <&l2_lim>;
+    };
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
