Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2E9C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 10:44:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB23206B8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 10:44:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiqtb0xl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="C759Uyjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB23206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lu9AbcOIu6+giFsm5nUXBPQEfqwg6KglFOv66AxR3VI=; b=kiqtb0xlrpA8gt4XUXdcmvxq1
	mDeVc8UaKY/Bh9oTvamEH6FGd1oBRe916/GuRVk918sd04oBT4GSzVHidgCB12Ot+XSkIvUB9XP/q
	/4IUCyJcCBpGK7DEZbZHFp6KozGuGxb3YbshisJHyHomrdppUSpTOm0LU581JF6Yk3IxdmWFivRZd
	fbcDK/rWKSA8k7LYbNvyT7YUH+UEmbh1psRCPB1+4saMZMMQhihlYpnsJbppQjeWs9vM5ixMWDrD3
	KfwvyLmfqZ0w9uDHMXQLbk5lkJyz937WYEalYO/wEwhiASav41+bRi7Cn2wriO0E5V8wMONJ1P8iu
	mB70lXyBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGK4L-0005wx-3V; Thu, 10 Sep 2020 10:44:45 +0000
Received: from mail-bn8nam11on2077.outbound.protection.outlook.com
 ([40.107.236.77] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGK4H-0005vi-W0
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 10:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgV+4+KyGh3BiLjgq0f++tuPwWkk9POvfqmDtPfh4LE652/WAK2YhYRMb5xy05HVu+eJDV15X8QcNLAnachXQZ7AOX/Utco7kIFzFqQI2pTDjoo0r3g3/O1hVAiw5uPi88nzx7ad5FvFqWkMI41WZsaVj6BaQy62pnSP2Ef7d3zmNn94YAeT966F8Qz29mcLRaMDigmFf6eX9/NKM6HeJW7GORzJH8pEwMTZxwmzxi2TGKEKh1IPXoAlgp6GyQy0MtTEXAjZmO0ZlKb2iyRncO+i1pqJ0q5Fxr3H6p0usuQD9ZJIkeHbXAxd7asVp5BHFZRWYbEFg8HnXIKecp7wyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaqaCUJhAgi3lAVJYsBD4YdiLhY9UQ3wJ2FV2BnLYxY=;
 b=eFJ1PBadgQ1VOyDM+XfvUOgLgxL9Om8xp9i+DNmp6PeknyiiMEtDNccsepR5Kpkpq5rfmNWNGCPz5jno+WS9NLbZ+aI38sOEVPxAeut8/OR3IenXD3IrQjr3XmcOwBFw6ajoZPj20+Ya9r/i00sSx4Ezu5fWdqvSiltzxlhZhQW038jvv7D7LOdBLZ8x1dpE0QfhmnjZLw6HcqO2d8Bt8L3PJZ3jUcHq/+opVIHsqzM4unPmGh8SFwa6NaJnCPDwT6xpMhM474HiG4oA0+IQ13stXtf1yqLvMg0p2HH8OLpNFyQcwkcTPnm0+KrLuC9tqlLQTnpvZIipprBhe0jwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaqaCUJhAgi3lAVJYsBD4YdiLhY9UQ3wJ2FV2BnLYxY=;
 b=C759Uyjl6XJudP6E9ns+sMbVp+usZSMrwfDs4rzj5qQ+9C9g4WaBXC0qNOY2OEA3pgYVSmbDPLdF/4GQcLSJrAfDTNGqQVlcTgi8noIgOD3v7gCVCNa4rPaYD9omriDJqy2xgpiNHTYHL2auRY/pPQlnNfdiIXU4FS9Gn0eAPQM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM6PR13MB4330.namprd13.prod.outlook.com (2603:10b6:5:163::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5; Thu, 10 Sep
 2020 10:44:39 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::a48a:1f7c:267c:876%7]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 10:44:39 +0000
From: Sagar Kadam <sagar.kadam@sifive.com>
To: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: riscv: convert plic bindings to
 json-schema
Date: Thu, 10 Sep 2020 16:14:03 +0530
Message-Id: <1599734644-4791-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
References: <1599734644-4791-1-git-send-email-sagar.kadam@sifive.com>
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3326.19 via Frontend Transport; Thu, 10 Sep 2020 10:44:34 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 592754f1-4337-4731-e574-08d855768495
X-MS-TrafficTypeDiagnostic: DM6PR13MB4330:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR13MB4330370F07BF3FD5B1B0A12897270@DM6PR13MB4330.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bNywqtqZjs+rq9UdGtB1x7uhg/Ij7qtZS6tvE3GoJ7Uwc+p4CaYzZNPfV2g4UEdhvGrBTRzZv+/1UNl3yShwaiYI8+M/Ik7kJ/SgFMsCsHbXrubfZ/enMd8yR3s6IMGz5qMXQHOvJE6BDTiEpRVi1ZC95C8tVvReRxXTgFDIPMpj3Jt+sNCwaT5ZRj+hTg9sVXXBwuZ+iCz+VsTnP++3cV7Mu+xIB5d6QLmaM0kNm4osETycCytG6o/6MAUgEP7P+mCnUhySVqLEjlXSgw3t3VxUyYuKOQKoLIKCXF3CTHhmQgG2o3FQPN/108TePF9nrP1LrrEpCE03jtH5AlLEc8wLvz5t3u+xeubPNCyCtNBqv8wQ4WRgSRxD7mANBcwWbIcalfpdKXL+H4PWayGqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(396003)(39850400004)(346002)(66946007)(83380400001)(6486002)(6506007)(83170400001)(6512007)(52116002)(316002)(66556008)(66476007)(42882007)(5660300002)(36756003)(107886003)(8676002)(26005)(6666004)(44832011)(2906002)(7416002)(4326008)(16526019)(966005)(8936002)(478600001)(2616005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wPt1b0XItDYoA8SDJnWHU7+jcA7eET/6CWK1xeROZdRpSa1uPQLmzzqycSiv/7F8t5w0Hj48SFZGnM/jAMMmDYQXv3Y85Ab9eeHeeAQZds8OQ2+ZjvEtgyI/Lz0CtNkJxZ9L36yHP2j9aYtnVkYFwDIKFFz4XVlext1SvyIRA+orXoi7O8sv+IYw/3cfoIlCPz7JNDubbYQ9n4nTRuf/O2l6f9aUj0fqdOA6I4dDjcdQbmeNDgXfldx3gitYKSDCCM/q8sEhZIM/cBEJGBOn13GNC1lNIzMygGFlJ0qtvJCAiJvC4XZRTtTUvl8CLZD4ca4Efi7oyaOCvmpmi3h3t5SwFdLAm1pY2n8IB9A2shQvHRPh3LaVyJ6LXWc+9zM1+bDByU5eq2+SEwB+O9DjsT7nOYk/I5SUOitZXn7HIElxkve1wnOeqTzuLdBvPhJjNo6cLOnat8S0F19pufd6F2Cva6zScneS0nKWqHQqMFdoMlOoV2LBaIFSHWmdo0R8z6AN7YWa74EBuD1819+VzM1A+ZT9WjMDqijdqhQnJRjWacE3tLV+2Ug5XBVaW12DFh1aNVInHZdsLf2FIlB42ceX0WGEVNPQUYtpm7mTbxKWSUX3RyzsXVi6gbYclcG7tuyJ1w0g7fyhSsiOzjOfFQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592754f1-4337-4731-e574-08d855768495
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 10:44:39.3442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi4Ryw6U9oavVi7i8OaFvKXzrF56pLTI/CcVlVFKlbphIt9hg4UxOAk+nCstEQ8wK+xOHa4ObA8AnsMIfaDg1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4330
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_064442_050059_FB1EDBB5 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: aou@eecs.berkeley.edu, jason@lakedaemon.net, sboyd@kernel.org,
 maz@kernel.org, mturquette@baylibre.com, u.kleine-koenig@pengutronix.de,
 yash.shah@sifive.com, robh+dt@kernel.org, palmer@dabbelt.com,
 Sagar Kadam <sagar.kadam@sifive.com>, paul.walmsley@sifive.com,
 thierry.reding@gmail.com, tglx@linutronix.de, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Convert device tree bindings for SiFive's PLIC to YAML format

Signed-off-by: Sagar Kadam <sagar.kadam@sifive.com>
---
 .../interrupt-controller/sifive,plic-1.0.0.txt     |  58 -----------
 .../interrupt-controller/sifive,plic-1.0.0.yaml    | 107 +++++++++++++++++++++
 2 files changed, 107 insertions(+), 58 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
deleted file mode 100644
index 6adf7a6..0000000
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-SiFive Platform-Level Interrupt Controller (PLIC)
--------------------------------------------------
-
-SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
-(PLIC) high-level specification in the RISC-V Privileged Architecture
-specification.  The PLIC connects all external interrupts in the system to all
-hart contexts in the system, via the external interrupt source in each hart.
-
-A hart context is a privilege mode in a hardware execution thread.  For example,
-in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
-privilege modes per hart; machine mode and supervisor mode.
-
-Each interrupt can be enabled on per-context basis.  Any context can claim
-a pending enabled interrupt and then release it once it has been handled.
-
-Each interrupt has a configurable priority.  Higher priority interrupts are
-serviced first.  Each context can specify a priority threshold. Interrupts
-with priority below this threshold will not cause the PLIC to raise its
-interrupt line leading to the context.
-
-While the PLIC supports both edge-triggered and level-triggered interrupts,
-interrupt handlers are oblivious to this distinction and therefore it is not
-specified in the PLIC device-tree binding.
-
-While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
-"sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
-contains a specific memory layout, which is documented in chapter 8 of the
-SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
-
-Required properties:
-- compatible : "sifive,plic-1.0.0" and a string identifying the actual
-  detailed implementation in case that specific bugs need to be worked around.
-- #address-cells : should be <0> or more.
-- #interrupt-cells : should be <1> or more.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- reg : Should contain 1 register range (address and length).
-- interrupts-extended : Specifies which contexts are connected to the PLIC,
-  with "-1" specifying that a context is not present.  Each node pointed
-  to should be a riscv,cpu-intc node, which has a riscv node as parent.
-- riscv,ndev: Specifies how many external interrupts are supported by
-  this controller.
-
-Example:
-
-	plic: interrupt-controller@c000000 {
-		#address-cells = <0>;
-		#interrupt-cells = <1>;
-		compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
-		interrupt-controller;
-		interrupts-extended = <
-			&cpu0-intc 11
-			&cpu1-intc 11 &cpu1-intc 9
-			&cpu2-intc 11 &cpu2-intc 9
-			&cpu3-intc 11 &cpu3-intc 9
-			&cpu4-intc 11 &cpu4-intc 9>;
-		reg = <0xc000000 0x4000000>;
-		riscv,ndev = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
new file mode 100644
index 0000000..95c8c85
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2020 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/sifive,plic-1.0.0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Platform-Level Interrupt Controller (PLIC)
+
+description:
+  SiFive SOCs include an implementation of the Platform-Level Interrupt Controller
+  (PLIC) high-level specification in the RISC-V Privileged Architecture
+  specification. The PLIC connects all external interrupts in the system to all
+  hart contexts in the system, via the external interrupt source in each hart.
+
+  A hart context is a privilege mode in a hardware execution thread. For example,
+  in an 4 core system with 2-way SMT, you have 8 harts and probably at least two
+  privilege modes per hart; machine mode and supervisor mode.
+
+  Each interrupt can be enabled on per-context basis. Any context can claim
+  a pending enabled interrupt and then release it once it has been handled.
+
+  Each interrupt has a configurable priority. Higher priority interrupts are
+  serviced first.  Each context can specify a priority threshold. Interrupts
+  with priority below this threshold will not cause the PLIC to raise its
+  interrupt line leading to the context.
+
+  While the PLIC supports both edge-triggered and level-triggered interrupts,
+  interrupt handlers are oblivious to this distinction and therefore it is not
+  specified in the PLIC device-tree binding.
+
+  While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
+  "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
+  contains a specific memory layout, which is documented in chapter 8 of the
+  SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
+
+maintainers:
+  - Sagar Kadam <sagar.kadam@sifive.com>
+  - Paul Walmsley  <paul.walmsley@sifive.com>
+  - Palmer Dabbelt <palmer@dabbelt.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sifive,plic-1.0.0
+      - const: sifive,fu540-c000-plic
+
+    description:
+      Should be "sifive,plic-1.0.0" and a string identifying the actual
+      detailed implementation in case that specific bugs need to be worked around.
+
+  reg:
+    maxItems: 1
+    description:  Should contain 1 register range (address and length).
+
+  '#address-cells':
+    const: 0
+    description: Should be <0> or more.
+
+  '#interrupt-cells':
+    const: 1
+    description: Should be <1> or more.
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    description:
+      Specifies which contexts are connected to the PLIC, with "-1" specifying
+      that a context is not present. Each node pointed to should be a
+      riscv,cpu-intc node, which has a riscv node as parent.
+
+  riscv,ndev:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description:
+      Specifies how many external interrupts are supported by this controller.
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#interrupt-cells'
+  - interrupt-controller
+  - reg
+  - interrupts-extended
+  - riscv,ndev
+
+additionalProperties: false
+
+examples:
+  - |
+    plic: interrupt-controller@c000000 {
+      #address-cells = <0>;
+      #interrupt-cells = <1>;
+      compatible = "sifive,plic-1.0.0", "sifive,fu540-c000-plic";
+      interrupt-controller;
+      interrupts-extended = <
+        &cpu0_intc 11
+        &cpu1_intc 11 &cpu1_intc 9
+        &cpu2_intc 11 &cpu2_intc 9
+        &cpu3_intc 11 &cpu3_intc 9
+        &cpu4_intc 11 &cpu4_intc 9>;
+      reg = <0xc000000 0x4000000>;
+      riscv,ndev = <10>;
+    };
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
