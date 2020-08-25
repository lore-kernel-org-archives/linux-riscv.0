Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2231DC433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 12:07:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E194320706
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 12:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfY7aXfc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="bogxS5AR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E194320706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4CL4ePV+jcbgKiOUQiAyWBWZ8mNVs/1fJgf674qLcEI=; b=kfY7aXfcoUaRW9fzQZKI5Trpy
	hOlQAs1Q/K8y1geAAMgtSF2cbJ6OydcXTdiVNhfuWgVWiiWK/5wewuLGF1mzM11D48a6tHFUUzBOt
	dW6nEZ5dwvdhcOPqrch9k705vvOgI19RIo+prbShZO4jaoTWL6fARqkdGX+RSppXJDfSEMR7PmtGm
	ZQA2xz1LPN7EPL5qEpbwB3ytMxOlYQpi3j8g7KQCBY+kEvaJGz3q/zH6GkBedPSXoDvJVAb6gjk5D
	0q45mMmAZR/VIjRTs8SatH7SkyLvQy64U0Wkf09oapXbASYBOGhgOZsFH4e0uZVaWMBtu+i32B9/c
	h/MjWFItQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAXj6-00009D-BE; Tue, 25 Aug 2020 12:06:56 +0000
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com
 ([40.107.237.50] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAXj3-00007j-TM
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 12:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFqe7vseEot8pBtjiXYE7GW44nvgPNzCeCdLc6lspVj+sfM5EOA6gDVzC/PzBRH9LHU1rqdR1rVIwDMcewv2sEByoL9DdGGyOstSzV1QLk2SvT+byIu541SR79LsuXJdkj2oYiNnai7R5n65YDcMjAU3SzRcH4ittTTZNiRJnQA6yLVtWPaU2tEXSi2uGQ3aqVQ5oCOEY8MAEo7qCPBe9A8t3zlVLQmJ9JJZxW3eZE45yR8lwnOoNooJxJUehQtVlBW+mkssLZYGFh/8kj6ZbQKGZtKRxtfQ/WTQkWoEFgwrXV0H5eA21ME5rX+yrRJKyY3bdHgVAqS8pK20OeZXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMG3mMAb2nWg1X8f1twtmFnUZI6uF+kIIY+RhsQnODc=;
 b=L2uDmQ4JZ7poY49l3hlckYRTXkYLWNDG+Jo3D5JuFgddPlJLCf2H5feJ5jFf22cfkqH8jkkftUYnetcUuvM6JDg07DQKIWg3vrmnKPj4IibCi0xiUSgzVq1vTfxK7ThKjI5yjeS+/Jc5xo9XKVaATY0GMFlKd1OyMHIdUsWHLDBn10OXvtBfyOb6yvw+017vLeE8/H/t9QlrrVazjTA44WzuElyb8M0kYxnaonc3I6ebbLkZxbp1NLJ945qHs8fdQlmNhXQsuMQeG5hZVZcua6PezvvsfpVtRymOwfKDQ3H7drCWDRQuPoi0x6dH2cXgCp7nyF0L3zS0Z19e5M0y/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMG3mMAb2nWg1X8f1twtmFnUZI6uF+kIIY+RhsQnODc=;
 b=bogxS5ARNZeRj15SNQEEZnSDWz1qBgV4cM4MOPbpsuKv5ghzlXH6sWdlpGlT/knu/EjO3mTGneKcUOcsinWoJ9GZHsiZ0AIGtqf2bGaVBF8QQ8q68OIqfZOcKiBPHNe5aGACEm2NjvYw9onMrLtIf0fnZaDa9uJhNqUWudaap0U=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34) by BN6PR1301MB1873.namprd13.prod.outlook.com
 (2603:10b6:405:34::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.11; Tue, 25 Aug
 2020 12:06:50 +0000
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::a446:9877:b346:93ad]) by BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::a446:9877:b346:93ad%5]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:06:50 +0000
From: Yash Shah <yash.shah@sifive.com>
To: robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com
Subject: [PATCH 1/3] dt-bindings: riscv: Add DT documentation for DDR
 Controller in SiFive SoCs
Date: Tue, 25 Aug 2020 17:36:20 +0530
Message-Id: <1598357182-4226-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
References: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
X-ClientProxiedBy: BMXPR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::33) To BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 BMXPR01CA0023.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:06:46 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe1ef5c2-9584-4d2f-da8f-08d848ef5911
X-MS-TrafficTypeDiagnostic: BN6PR1301MB1873:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR1301MB1873C12462C0CD4188394AC482570@BN6PR1301MB1873.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLDlEQkhmBXWkpKyHfyc7xkRWa0RTNAxdKdscWwLsZKgjKB9HT8cxsUpiNx02j8XZ8j8ybcCpIBJDr5uIF7o27K3wMoaRakpvUSeH9zrmw4sYpw9io9J6UMmVbRTUIFktS/9Zqv5k9RXjDl1bZnhpJa3HkEMi2gFC8ca5CL528wDsYHITDJjR84IB7BgMG3MFJT8eBBOhi1qP6wxS226kfvxz2Ra8GD6/Vqvnhm8ehtcyPLVJ0AghAJXygVR6ku130qZCcsL4Mu7aN/ETTtt2Adx4dssDMu9y2YABFH/s3tuP9tIrGR4/SE0f/2aEmxbTuNQ8dCwlHQYvhYelIF9JPJdiMaGjeOT+NpghF2LS2t9uraUgPLxqSaLJXwDsu+JcLezYvuzBNooxAOeeho7qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1301MB2020.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(396003)(366004)(136003)(346002)(39850400004)(376002)(7416002)(4326008)(6486002)(66556008)(52116002)(26005)(66476007)(186003)(107886003)(8936002)(316002)(83170400001)(16576012)(42882007)(966005)(5660300002)(66946007)(6666004)(478600001)(36756003)(2616005)(956004)(2906002)(8676002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: fMOX2sk3tsK5vsJ50TKOJb3eZ6Z+V8MT3KlU9+QresCAdY4RPfTwORZQEnrtCQqea9ooEDtcFeRKjts5Jb97Dch1Pfr6WfI5NGLu1/5GkSAF/7Gfq09C1Ulmrtuf3FdW9hqZFJ+HzCLsN/0YoLaXhrI1k1XqiOxYu5G3SVMuCz3kqkAT/9LihIBOZz2qw3kyoKExzzWHO9orDGuEbEz3U7ROUv3PcHF9USOEIRXFU3QtnQ9cv0qb3URuV+uwP+m3gH972IdjYpKOl2V74Cpr2s8FjQQfxao0AUQTGaVuJvRRRPzkGAbJ940wD7Cr4E/jRf2LqQ2LaTFXng7lNwYLR1H5hVneci6zQ+KhRCxDjmhAOLh1UguNTkDUUxDpA9XTGtoZNpwedUNL1cFlCEoSb63O13PO6mQcnZY1NmgufWMUG0Hg1VxeKHZPkyHXJ70vXDcEvBDhBz2VpkhgwtO7ZivXIHviH/UGGgFp/kiHDzuDHUARQqwFrGMakdmOxObi+PG48KfeEWC1PbIRf8EGgYbkjAb4x/4c46OrbCn/KVGqLerciey6haI2VCEq6jCiYXPix42OzbyWVZvEqM07uqOSVNQaaT5a3h49/Zyib2arFGOPuy5OeXzgeyC0waOvgZzbnF6SNR06aETnXaL3iA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1ef5c2-9584-4d2f-da8f-08d848ef5911
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1301MB2020.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:06:50.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aDJtNMI3YPe/8Wk/kuQTmJ8ZEpNFUbfKn4kcH5Kzqidy0OUvgYux6aeVRXNcJwxhxoZTywXrl+yWYmxSgf5FcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1301MB1873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_080653_972015_9304A837 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, rrichter@marvell.com, james.morse@arm.com,
 linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add device tree bindings for SiFive FU540 DDR controller driver

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/riscv/sifive-ddr.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
new file mode 100644
index 0000000..0288119
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive-ddr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive DDR memory controller binding
+
+description: |
+  The Sifive DDR controller driver is used to manage the Cadence DDR
+  controller present in SiFive FU540-C000 SoC. Currently the driver is
+  used to manage EDAC feature of the DDR controller.
+
+maintainers:
+  - Yash Shah <yash.shah@sifive.com>
+
+properties:
+  compatible:
+    enum:
+      - sifive,fu540-c000-ddr
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@100b0000 {
+        compatible = "sifive,fu540-c000-ddr";
+        reg = <0x100b0000 0x4000>;
+        interrupts = <31>;
+    };
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
