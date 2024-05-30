Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50EC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCXJ2Yfn33Mx5oF5TV0FthUytFL0elEA4mxmcT5gHrg=; b=kl+7EjMvrpy+WF
	V2N4NRrn53vN7ZaBrsdZ3GJXCk4fEbLq4ZrhcmZGZ6Aqu0BMVhFHuCM2ZHgpogLL/9Vf/0TWP3DdS
	7QiCJ3O8lttR0xIEXSbEki9V6EjOrF+oRFsO4TqZAYNrmLtxPVX7+JdlZKwM52bkilso4wtJxJtAL
	+pxqavEykSddr7sBdQEmPYNIGnhE/6g5/rL0clTBbkp5OcJvSULhukjeGhckS2zSr/hy9UxSRLZBp
	r87ze8lSKWnadkQYHJwqy2C4qzRVBM4sobbCA7ED2abRkVk395PaMFhF04KprNxGO7QvDjBCVvO64
	RdogiXT1hNtkBs89C6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg9f-00000007Qak-46qg;
	Thu, 30 May 2024 13:49:19 +0000
Received: from mail-sgaapc01olkn20817.outbound.protection.outlook.com ([2a01:111:f400:feab::817] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCg9c-00000007QYF-41os
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 13:49:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVlEyphrYNEqlYzXEgd7GiAkismHwjj61EUer2KF4Rfjq7sVC5QJjV/Jsq9zabuk3m735VJ0gXieb85vQzijYV9u6m2X4ECrklXX3X7iCoXInwxbD5akudnwo8SJqRKMCnJtkm23sK5ZcN/BGotd4Su914V/DTYJdpvBEEec616Iw3NRy+eCyQebe5QQHVKy3/7x9ceypaDuzC/qt28Hro6pUi6AiJQWJ5QHWPdld0o3MUT6uQSayOm8dF8ysXKWXv696dbC3MhKaqLaP4LI9pZFuHW9OMbQsjzf6ctR3olQWmSWYsfVg7ADueuSJtdHkemwE0Vv/7ODUGR9VKZMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEGmuEkXi/wCkmyMBV2vONT62dw/AEOJbhyOvWh1GW4=;
 b=loTeq4z8livV0bKomBHWyhquqhG/Xg73+oegI72l5RSOUMtjv8jlJ56EXlQDKvl/F3vB6LmQomeRaaojTyVpPwcSL3zPJRXa18xr2kGHc01L2ZyussyElXSc27fbvm8P+tQty25i7nK9XyxubMmg4w1QmazQyvTrNQvh2Z7NTGhkSYZb7YgDN9kBT3ENgusycAY3wDrEcoXIUwDwlg82OgRpJGty3TYlWev3kIuaLKwR3mtxgHYhzDTGHHRcS1673ZLhw8o3J3kHTzzN62OPIonSKulDEkbSHA/pdMlVJd/sgug9oyFryRv8quOjNasx5BMe2FXN2C8xO995fiquoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEGmuEkXi/wCkmyMBV2vONT62dw/AEOJbhyOvWh1GW4=;
 b=HPxtMEfAy/c5NMk27sclzzr/zJwg/QOLVRdptq4gQv1Q+Tu1Zm5Y4KVqLJVPjNdf0IUmGfkUGQO9psF2QtLGG6gr29VYExMwd3pMJTwnuUDjH27cLKb627wTAqoM3j/OJ84gk+UIEbbj25vf59Ri/97AKfZBGcfRC1Dh+IRuXm7xKipkH+9ihCeWByRRS2gBByNx9RCCgDDYLs6HJGfPoRFzuC1QZRJSCXm7ItGd3ruK+FaO9rXvjTglzRDOSIhLwiNiurZjkzj1P61xpaUX/LcTkfJttszFJAvZFIHKkRKzsunmMRDvtMkYNjlcaNYwHjU3L5kSKsdi0lswOQPMfQ==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by TYSPR01MB5657.apcprd01.prod.exchangelabs.com
 (2603:1096:400:42c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Thu, 30 May
 2024 13:49:05 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%4]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 13:49:04 +0000
From: Haylen Chu <heylenay@outlook.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>
Subject: [PATCH 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add Sophgo CV180x thermal
Date: Thu, 30 May 2024 13:48:25 +0000
Message-ID: <SEYPR01MB4221BD44992A23E2B0061023D7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-TMN: [SU+B3YdJ4JmdzkcIigLXR3szeJ0yfAP7]
X-ClientProxiedBy: SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23)
 To SEYPR01MB4221.apcprd01.prod.exchangelabs.com (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <20240530134827.53431-1-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|TYSPR01MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 344d967f-648b-411a-43c1-08dc80af44ff
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3430499023|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: 7e5W/w5rFkvBF4P0TkGfdxWPMSExDGTLnGwADNtMcT0ye0CvKgBkZHndOWGcj+0Qdf6UPwBSYiQIvLvZ6IHd9YSglXS6WGxv29zn5MscHUK7+hmlTH1D3ViyKCrYCHMi8YUs83W4tRzK4/3gqCtE/elXiKYBakgU81nGfwq5Z0+JkMBOupYItFAukNqW1SXWbx8FQOrS1l8+6czQqWBYI6q4+/VL9gnl7HJc/CEvMHno09aM5p2OqcycpGQGQ43DMcwlVga7FYJ/5w6wuo9eudCFyDQsSFSVBMld+T/XI1hK4rPz0TiMhlbDTF4awB0oT6PwGCkeTvWmhFE1VB3eVSW9M1pOIoVMIEmyPdRyM5ya7/mFVxf4K7t/xVe0gbTcfqsgKVFqprui27r0Eb9qDbR/h6KSBgtX6zPn+nB1gwtdW/5ou5SNoUmMPs5lUWXG7+3soeA3K87Aqb4uYwKYoOjT0+e4A8GEttOWy0J/sB+VUpWA7I6CLC6x+cgxEVc1745C2GaJBPbXpdPWmscpNLCOB1y9IlG8obqGTP5PE1rW7sWE7tM1YKld1okIQYzhtcvcdpoc6wQvXZtGaxWNSP4NACf++rkiJNtngWoXMb0xy4iE0a2By/EsTdCgDXiryFicOBT5vfgQlLXu4+jtXhbYVhRd6ev6LMVSdV2Vnn0VvURojKAUD4qbWwFRg4YhBnwUF8O3Mgt3OnmjsUIjNQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QXDpuFIsrpo4V9iKvZfdlF4K4vUGOdbc9EDXY9JiOpUmSLMiX0Q1sY8bo31m?=
 =?us-ascii?Q?dSROlOAC8GTjkJbA+I7KUtT0KbLblErpnn0ZvAH1G6jsy+jqvDnW2I32xEzK?=
 =?us-ascii?Q?PBcItiJNPcpJTea8B5AX3HeowUZoCoQ//eg3ZJdj+E2kymjqJzPCvnnbvBvi?=
 =?us-ascii?Q?pjoE6SfxcI51q1wpkpPG5Q2Mv8BwJSKx5wAH2ezvCOxpJXiWBBBDSD7DJ8i+?=
 =?us-ascii?Q?Tn0Y+4ScYcegLPF6wsNO5kye21nquyir8z9jA7JqtKA+bm1fnZ1JvH8M5xeQ?=
 =?us-ascii?Q?GMSnLmGoKOGk1MxaEPeg4hFKTqrHdjiEweiCcIUhxvYsuKRAOIj48h3uYhgy?=
 =?us-ascii?Q?oXas6RkHFoPb5JRqvLylFJXRLb+AnTUtFy9KAg952uf7ZHyqDDbNklgoeik/?=
 =?us-ascii?Q?NuTbTxLiCmWGDWHlB7JccUK99G5m88+6EZyjmbDNB6Qz2DtvajMRdIA6lItJ?=
 =?us-ascii?Q?Os8E95n/aNEM1hCumhgPI91aFrKy4FARjhFS/xMpo3fvBSIR/dPyvaZr72cj?=
 =?us-ascii?Q?7GCvel/wdoiXYPi+7dM6Xw74OTb5BFB6kjMGJ6O1uw2MyyVsnyi5/+D7Wyxm?=
 =?us-ascii?Q?+7ZjqS6Ql35FG4DtXJnEuaL+dDpP1QTgIECoocYo6oEihfIq70+Jw4U8m2qs?=
 =?us-ascii?Q?OlYTxXZrhC7kjEoujCMnSN8mIET1wA+zI2t1moLrBEsQ5tXwKdPV2bmitNaV?=
 =?us-ascii?Q?dBJb00zgTb4Z2fRXk48YWYaTcUAdLC3DzV7+IgZlr0dS96NIe4jepmtdfYWN?=
 =?us-ascii?Q?Ri7Yr6/YIRo8FpG3hid3ciPG1jgUEmVNnGoXWw35uHGFHovvTwYsZeYezLlK?=
 =?us-ascii?Q?y3x/vPwOz2apQAoHNDca4RXFraowN+wy4BmIG3vCz9YFLjGVqwSriLIo2GfJ?=
 =?us-ascii?Q?V2CV3rW1NZ/m0xRFwhLEG+o8v7H1iUfiXIF3yCSqGQSqQPypG+snZzzIRrZ6?=
 =?us-ascii?Q?mYLLr/DjzqvO7o2/okuhMZRBwzo8A/NGPz1cB2OiBhpbxZnTSxezMAmafVfX?=
 =?us-ascii?Q?u0M61M/+dO5Uu5mBI+V6rs7iVydm2qQz8LnROcLCznwwhZtcA7LMRbHBYCOI?=
 =?us-ascii?Q?SCRzwnqTXFvh876chnbenixU3W0YT/qSbHQti21jMhXPvvmY/x0HJN0Ly3w4?=
 =?us-ascii?Q?7nA7ONU7WFY4nxEcgOsyc+gTAMdqn7H/BLPNMPZhDNCW5lRAP9F01mepldpi?=
 =?us-ascii?Q?rqySZCVXrgbJm27k5o/uf7Zfmj/a5heYbiLp2CS+vRkMikLZI615yTWPdDs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344d967f-648b-411a-43c1-08dc80af44ff
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 13:49:04.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR01MB5657
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_064917_025310_68F3410A 
X-CRM114-Status: GOOD (  10.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add devicetree binding documentation for thermal sensors integrated in
Sophgo CV180X SoCs.

Signed-off-by: Haylen Chu <heylenay@outlook.com>
---
 .../thermal/sophgo,cv180x-thermal.yaml        | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
new file mode 100644
index 000000000000..0364ae6c1055
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/sophgo,cv180x-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV180x on-SoC Thermal Sensor
+
+maintainers:
+  - Haylen Chu <heylenay@outlook.com>
+
+description: Binding for Sophgo CV180x on-SoC thermal sensor
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,cv180x-thermal
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/sophgo,cv1800.h>
+        soc_temp: temperature_sensor@30e0000 {
+                compatible = "sophgo,cv180x-thermal";
+                reg = <0x30e0000 0x100>;
+                clocks = <&clk CLK_TEMPSEN>;
+                clock-names = "clk_tempsen";
+                #thermal-sensor-cells = <0>;
+        };
+...
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
