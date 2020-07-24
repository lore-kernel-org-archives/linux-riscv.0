Return-Path: <SRS0=jwAp=BD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D020C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C842073E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2020 07:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VkIjF6AY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="I0rm9lOp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="p4adeheg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09C842073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aYv7stME65VRpxOcQAEZPZ/0DYtmlpACR4Px615Nuxs=; b=VkIjF6AYcTra44US0qXa6Ifyk
	aIj4w3Dq/W5EdkISpioNj6yFReytshGQCXDajrQwTfWeSiNGcDbkE1llSlAuIobYz9Y5/o55xOmbF
	DC3L31OIxIdbi6WTCYArP+OmdwPfrMrfRUiLPZvKQd5yy0Ys+mo5HBPBvCFah6ZlrRr8pudQlmAS6
	E+7nfYNb0KggBFwVOw0aIm5UhksEpkHR/9xykrW+X9rSCcdKDl32zeK3+5FlgGkxqgtoQzwVwUDLC
	6Of0MkLQs9VvrN2o90lawwONMjf5RPAsQxk5sSDQFaajhusR5hVCRNDWiTcvIxyFsAcUtb6Q2gCNf
	KXZ7R+J+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyrzF-0004OS-VG; Fri, 24 Jul 2020 07:19:22 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyrzA-0004M5-GA
 for linux-riscv@lists.infradead.org; Fri, 24 Jul 2020 07:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595575160; x=1627111160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LJQeI5GG60iH2WAVUgYieLtRxLAV/37QxIwLjpKw41Y=;
 b=I0rm9lOpgl6nuWzZXUD6IFlYg9fKnYgf612HBmPq6tuih2bFrqNkReH4
 EwZvLbcBdUZjIPzWtty8lXk5wat2eVgFgx8HZ8GoyyEP7qG/zX3m8/0V7
 YnZcHsD4FY5OWxGkFxfO5lldE1AftYS9psKzjdjWOMfFhrXkIf8YWQiMo
 OAM50AUAhAy+blhq0JEBFKRR3EaZXDDLAEJAHpujauyhOF6UgZderjzOt
 DVBz69rcP/f12vpDkziRYDQUwAVbHGOLHUh/3fdouxEeZquo2UHsRoMim
 DVbBOy9BKySAR2bxD4bBmC6rpa5TdlJ9VuP1Ah+P5/aZKVIWnmC7pYdYl Q==;
IronPort-SDR: QyZ6KNON6Pr2tEwRnqlAULI9vuthG/sZtRwTD97ToyU/7sHI3lKO09mDRQyg8vqYzoEaHRwXAp
 hVeZy+YXYhkvBwiGgbRJP9RrBcf8XiKg+xnkt6Cax9rTd8zEVI2WFWPc2gJeyNZRJpdroCY6vX
 Nm1dZgBXF80jdtQUIP18gcxdRkYLOelmBaNj0HN/gpbdKzmjlrZjaLB4ve84bPwKYfTaxOb80w
 255JjIVlsCdRR2bgyGcGHpGNL2Zn8zbH6w+hN8QgqBHaqA1xVizroqq2RGF3Ldzr5D9YmHLsXc
 DSA=
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; d="scan'208";a="246341064"
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2020 15:19:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGDpNv29Of/+uGYMSuRkaF4RQv1vus+BfIH7iFHQr4JdyAAGdsGC2Qz7NeJtROuym6lvSshDSCUMxvmJqdLNgirCoWsNbCLrubnuh0JhpWB5efsMVI2BeR3waBu3KDi62hszB30Q5NHDHuqiCcsq6u34N8FRRk00X+HuC1JaGfNpO9Nw87H0EhgAtWDjVWWEYqF1aaB/0qczlArAbobKLgYmVWx1ji3MBHaQKQ7KZi9LRNNNggX7DZcgBQ9ixGV3fCMAL0hO4XrwFpFluyFd0GQ7GhOuZiJy+vu/yks7KuLwp73LebCNDS1KpEMx0j0aFZpUA6ypuK0QfF4ige/r9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuejUo0T71kexSgpyOQzoD5K6voTYQU3ubIJuEssUGQ=;
 b=VgiAAp9w9Dc3l0rYAq0hXzZpJgnWJpAhWiKyNdFzbhKQtwNNZqQJTBZwX4Xo1s/xb39nXjxl+CVKDpUNhA+RqGcBUaHgRpsikd1hDVUJste7H9mTH03lDZ8hzDpqyqJuor++i4i8MhhbLI3XyBjxSXbwukfPhGPIMGwQKJmPSZCn/iBK06c42XprcZdizFHFt4fC1lSc0Y4i3kW5Qnw7zbnY07BzgLYytaO26YcTSQqelC906+0MSG36f8WoOelXZEagENsufB1/2PeuMhHlzZnee+if4JwbdJJwbS4xEP4GANNIs7N/Whwk62WJS8OF2KRSpHbKbfQz/0Nqsxeqtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuejUo0T71kexSgpyOQzoD5K6voTYQU3ubIJuEssUGQ=;
 b=p4adehegl5A7BeN56Jk6zbfDPOFA4K4yYi0Xmxhe6p6UCkP+j1AGNGBDwgiDzIl5k//GscWGurXs/xfkQMwLpnmOU5MG+vm/TRiJtVLYQf6FJ+GYjhQrVJ93CmtrNpUweO3k+7OshmXJ8d0TJj7FO4Lo1vMwpK4BW7NeKwYDAV8=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB5131.namprd04.prod.outlook.com (2603:10b6:5:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 24 Jul
 2020 07:19:13 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3216.023; Fri, 24 Jul 2020
 07:19:13 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v6 4/4] dt-bindings: timer: Add CLINT bindings
Date: Fri, 24 Jul 2020 12:48:22 +0530
Message-Id: <20200724071822.126758-5-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724071822.126758-1-anup.patel@wdc.com>
References: <20200724071822.126758-1-anup.patel@wdc.com>
X-ClientProxiedBy: BMXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::35) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.20.29.132) by
 BMXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Fri, 24 Jul 2020 07:19:05 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.20.29.132]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d242ec88-9e7a-4cad-e318-08d82fa1ddc8
X-MS-TrafficTypeDiagnostic: DM6PR04MB5131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB513110BDF97A886AB34BEE788D770@DM6PR04MB5131.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9ij1Wm0T080bCvRt/rZu8mNsX2UCs6wQVFcd0bhM6TFjX2OhYJc1QSI/4L6dLprS5vSrJIEL3Ral7O5HouZHTUS/q/F84ZwUSFUGwHj1G2fwANndcQfY1egGLGv9df0JkvW1+jk9rGT5sKT3XgBaSrek+oHySq+03hMX6fhtFPm5bK2CBIEEmpFHVsZX94VTbbMG1DJrdQo4UPmWq5kBkdlx02AEYrysAw7OMIg8voElMjm1G3tVoKafM8NEGHOjChMnW9ShSsZ+Fv8dhxC2J0RN6/LDl7X8vXID4LzJ+EhcnKMngADQjx95N4SsjpsG3sVmtiOQefA56J9gkxAkF9g4kwbeHCMZXQ7Plkt8EPtSbJK1HgsiVnO0oOJ+nfgCJKbiQI1cc/KoBO6hQ5+k5jeFL6EaIb6oc30dJlco4stl1xYOs+jr6u2omaULaZPvCbxYczdw3oRZ4ewiH9W3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(7416002)(55016002)(186003)(478600001)(2616005)(52116002)(26005)(956004)(7696005)(110136005)(66476007)(44832011)(36756003)(66946007)(83380400001)(966005)(1076003)(316002)(54906003)(6666004)(4326008)(16526019)(5660300002)(8936002)(66556008)(2906002)(8676002)(8886007)(86362001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: laogGKup7+P39nX0H712R1qLBpB5hsBSorMKvRIebyJXBUL7KjSVCLrRws6QOQU2kq1m5yiSWm3zId8D4qe+ldyufYGwGVyk1+AbtjLPdWH7gRn9uXHQ+AxTNtZCeesPt5kTJUPvLlXaIKI893GfMkUEvw1HsKC2P5jO+MSLM69l5CfZ/NK95Z1Y7/bVpbuOG90DKRcP6tSFoiVnFPpbiSVpNytF8bBZMKjM5Pt5wotqIBSKoG8Ys70zGEhmvObmn7be0b8wHwZqAG9hgrPQ5sKFbYFGq+LIg94Y668nkMdpbPzvVe85uBpAnekIi7FTlDXg5+k/uHqHk/9ew8XqgqHd7E+1SWaXbwNntuUL0ASupUDa+K5jw+L7aAUSvwOyXTN2oTGpDt221VLXmwwO2a8+OS/FGy5vv6DB9YGnx4jvXvvvmcswsaMIVc8YMsBlG4JGQaLD/iDNvUjkyiqdDCbv+kA+gAkzWjIiA9DKgeU=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d242ec88-9e7a-4cad-e318-08d82fa1ddc8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 07:19:13.1704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3Q2LC2EDiKdYXLGYm9Amq0/i7GxeMcNh+XQ/VDn2YdUw/K97dR2hzJng7AuKAX5dlmym0CokiLp7c2HmaYCSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_031916_732715_DA9D722A 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add DT bindings documentation for CLINT device.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Tested-by: Emil Renner Berhing <kernel@esmil.dk>
---
 .../bindings/timer/sifive,clint.yaml          | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
new file mode 100644
index 000000000000..2a0e9cd9fbcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Core Local Interruptor
+
+maintainers:
+  - Palmer Dabbelt <palmer@dabbelt.com>
+  - Anup Patel <anup.patel@wdc.com>
+
+description:
+  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
+  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
+  interrupts. It directly connects to the timer and inter-processor interrupt
+  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
+  interrupt controller is the parent interrupt controller for CLINT device.
+  The clock frequency of CLINT is specified via "timebase-frequency" DT
+  property of "/cpus" DT node. The "timebase-frequency" DT property is
+  described in Documentation/devicetree/bindings/riscv/cpus.yaml
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu540-c000-clint
+      - const: sifive,clint0
+
+    description:
+      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Supported compatible strings are -
+      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
+      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
+      CLINT v0 IP block with no chip integration tweaks.
+      Please refer to sifive-blocks-ip-versioning.txt for details
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    timer@2000000 {
+      compatible = "sifive,fu540-c000-clint", "sifive,clint0";
+      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
+                             &cpu2intc 3 &cpu2intc 7
+                             &cpu3intc 3 &cpu3intc 7
+                             &cpu4intc 3 &cpu4intc 7>;
+       reg = <0x2000000 0x10000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
