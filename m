Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCECC25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZ7OjuO+5dXNfuG67ZEdmv2Mw4TCM95uuTuy471zz70=; b=TpRkRYdrcdtmwe
	rnOLKSw0e/WT2zdr/EPtWVsrbMo0a6J5RvHJthsyWueJ/VvJqt554suIZP9NdGijkQiZ+yKcUSSrB
	Vd+bIntsII39WiLQlIg+954NcKBTnzWDB4/SLNcmqWM8olic5fTyJW4KlOgyu8H26Q7HhwuOGtTih
	FzCVLoPrMFZXXkjYiveDEwUGRCzFVmOglr0OixHe3nea/jm5GllQMVXX5ZBo3EHwk1BPeUSMMg9e4
	Lt9NqtqBDYD9SwfL9gTQF2CCe4b8NEP4FhKHYo1lsZl/TgiL9F87IFnZ0ivamMsMj2X5lKTymUzLx
	qensMDMEO7Ccg5vyuytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETh0-00000002P6b-34iY;
	Tue, 04 Jun 2024 12:55:10 +0000
Received: from mail-tyzapc01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:280c::801] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETgx-00000002P4L-1qmz
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZ2VTIdlN+J2HbMm0/Abb1SAhdccH32GLCUaZ9Oj0Imhb42jzJh5JGbvPdW6ZgTorGFMQojazcCl2EykvBZrFSt6n2JvrIA3WXuZg+gmodItvFwpxfkyhAcyxO/+jvWJgw+goFQlnQLxcbPAFeK3z9QIFJO4w4jajFZhKbiepPMsVYejEgAhhrK3phFnbBBtkj/m/ivOI1gze3F2fF9qqDpoC1U01ned/LMCHdYoR3v1aZCFUHxGgDJEazwHNnHWil4ed1geEWrCrdHHwEjA0jtAygFiiYZ3MekKJH85gp2YvEUr1WJa6OSI+apfNvKImbAYUEjlIFlE8gC1YDBFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM+ejfvNrJV006xmLa5xzTLCa1n1TQwI9hu5JOjd4Cs=;
 b=l9fm+QG/Zhh20ncA0/tXZ80XYVQYS/np8eKtecazC9arDusUh9dvzGcWfD9gFxChHG0c0+j6LBXNsn8fe1BLDWJ1lNnX795/I3/mDq3EY8LBubvhltx6fOrovav6Kln7FIK8eKzTUR2gN9gbZsL81fzTp3t0RxZzE/ztYSF4ExmWTyQ5ZS1dwWJPYLXoyuQTU0H1PbR4rTiMc3PVX+WHToHLPAEbBKU7DHFREb5Ruwv7rQwglccYNSuES0WgMMrPwE+mMp0WniKHx7kb+BcCB8V1NfQyfAD85jY8SPMi2eI2LoaHHuPN++hPdfUZKQdzHNln/ADK79J/KPRZx4Rfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM+ejfvNrJV006xmLa5xzTLCa1n1TQwI9hu5JOjd4Cs=;
 b=MsE2qJGVn8+vgLe0uai7aFaGPVb34uhAN/77nSjTbk4gZ14eEp/C2iZAaqy9F5TnCrX8dJ5ADRcVoykNzWHYqdeA2qvUS80Oz617Q6zLZtpgkC8DPKdqko0487LOva1h/R1i8llEdZiiivJtmqZ88yUoBGzQaPChsXeHoN6o6zVCVt6cir4dkoM2bDqMEoA9lhXMSnWeGbzoqiaHtt3Vclxv0Cj8gfX4+FFTBxsWTYBQd+OvQh8zNjFcfIV4X4MTn6xPdG/VSl85O8awvBGbyhJhVxhoUelDVZfxAFwn0DIcLqYRhzG2EE18ZttpbX5GuCTe8ybaUnty1K74/008sA==
Received: from SG2PR01MB4218.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1ca::8) by SG2PR01MB4386.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1b5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Tue, 4 Jun
 2024 12:54:56 +0000
Received: from SG2PR01MB4218.apcprd01.prod.exchangelabs.com
 ([fe80::7155:e92c:291b:fc1c]) by SG2PR01MB4218.apcprd01.prod.exchangelabs.com
 ([fe80::7155:e92c:291b:fc1c%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 12:54:56 +0000
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
Subject: [PATCH v2 1/3] dt-bindings: thermal: sophgo,cv180x-thermal: Add Sophgo CV180x thermal
Date: Tue,  4 Jun 2024 12:54:19 +0000
Message-ID: <SG2PR01MB42189977B4172405F5704CC4D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
References: <SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com>
X-TMN: [+ImABJjERh4UXXPYTHM1l2EeXgXjRUA4]
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To SG2PR01MB4218.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1ca::8)
X-Microsoft-Original-Message-ID: <20240604125420.22638-2-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR01MB4218:EE_|SG2PR01MB4386:EE_
X-MS-Office365-Filtering-Correlation-Id: a8be5eb6-0ab5-4ab7-7607-08dc8495888c
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|440099019|3412199016|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: EqxwBX7dckghar72CBlMS69z7Tjg8ivANyYBmAbog+mq8s/c/oRLqpHl2442XR0gUxiwFTnTcLo3qLrfBo2QyO0SZb7igbSFY3VpI7GzYhaTEOQJz1Npmtfsl/gAAbq0hcXNaGJoQPM99rHAGhTVlWflzGIekO6vQPE74xtLSy+w7yxAnf/OdGqKPutUpOjjVonOb16m7pN834nDucUvEW+DpvmX8y1ZRZVFrkUPOW5qdiT2sj5jqIR33u+Mk86Oj9KpA7FOmqk93aOtyfWQbniWjLgYOLwhR2tD0kaRZmHQj7gsLCgK61WmJasrz8ZermFk95ew4ZeHj/mMc8SeWen+ht8XXFFWu5DdP0A5PomuieB6IaovsrsTiDkcB01nGLT5sCAYhhJsLlzTLH/xiwoxriaM/6ewBxzoCdl0e4xihObb5mp6leMNG40kYqr8+Ai//8U6ZRUPKQJigKLNlWxqZm3LSNjQSnXo4CxslnJ7OZtpWddiAf9c5wBbcDq1Tmbb52pn7B3RmDRkofHwHNYiofeEdYQKzR0NEHAudlPcXWJvo6n4OTy9fSW55qQnmP4fAFy2EFV70TyRcK+/0CofmHLlgBHjzllZFyIZNAImimwBCV4iNjhCiGB10cE0i3Q4Sosv9aXGebM6wXjrRxAGY7xYUvTUBT0H3hv4GIhGG548yK4OgV+dEynB5QRX08I/dR3gaSeVsXKbe9fqQw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2e8mta+YiHVwgiwrNNP5GHVUkx9J4c/3yL7ybAC/Sgt5rHKPKd2m5qyRMtR2?=
 =?us-ascii?Q?luhtHFIr8p7xSFXG1MhKIkeJo80ev+Fh6vC3kaba3utubPU54iRnWKMzEte3?=
 =?us-ascii?Q?zM8mcp6mkmBesyuhZ3HoR+VtDI1tF7GV6FQmc+JyhCmJeTparG4dsBBZDOH7?=
 =?us-ascii?Q?dJYJrC/9hi9oER4chNkCS03gOafUHc7U3cR3+DKOSJh8DsJDXAfClD9t2IMr?=
 =?us-ascii?Q?LJhBlijvUgiPSVxGH+tbNaHrrRqdXlaDRcO30LZP/wDx8EgXK179rAmsz5jf?=
 =?us-ascii?Q?X+tF+FSQAjS+CQPQbolfGUcLNo2YdLQ1ICsolYZKX5kqU4Vl1pX5A8RasEC6?=
 =?us-ascii?Q?uK6Smfy10de8EuBXfyyN+ZJXAA8PwFjC8AbxGhUd3TsIIZm0eNZXPtJNCsfw?=
 =?us-ascii?Q?fS8K+Rnv2jrdzm3bpLj1fzmqmsxe+29X1K53LR8QuWBTSOB7ukOSbDNKm/dh?=
 =?us-ascii?Q?PeV9Qm8oZFXA5XzykOpvah+Oj8CIH66K8oSF/HJ1PuwQn1i/SeXcgFkCdBWB?=
 =?us-ascii?Q?abwslKxXK/fSog12trXbBPJWP6/T2qOJLjeSgtgikzAiRHbYSFXK034hn7il?=
 =?us-ascii?Q?aqtP+JpGEQmqfR2oEa7aqGEltfaRcOP76P3TtGrrfJswv2S5cPZQeWsz8OOl?=
 =?us-ascii?Q?MmRcU8XPFjFynRSl9E6zObkd9wkb1Bb0j7isy9RgYHAK9Zmzy1U4d06f/ybz?=
 =?us-ascii?Q?SLBO8StwehhTq++QPgYyaAIjqmFPeffa9+z5WOLG/0rDQ1SbQJvLdSaEk0QV?=
 =?us-ascii?Q?Xq9p7H8Fy2IeMmjDvPEOfNnMJ1LjnbVOBROLyCT9ORNMRSf8jF7yvaXXaJ7+?=
 =?us-ascii?Q?b9zDwNz1EzoY2vRGyhu2Lc0rMqPhU8tAIC7Qo0K/c1+6IxItIN8PN6SLR102?=
 =?us-ascii?Q?YqivWIpQ+m4Ein/iPsECFqriyROtdiD4SwXSq+5DX/+q0BFveq0+wb4Hz3aV?=
 =?us-ascii?Q?yGG5z3+BLps7IngE5ltZCJPYNoV/iKPJchTCmlm0r/KHDUvDwykHbViSC/Oo?=
 =?us-ascii?Q?HaeaZEcFW1ILgUD6Ex6Z9T2c9DasMXAbtQjpodJTVwyWSnsboHRcNecVUDHK?=
 =?us-ascii?Q?ywcSoMeuFEplhQkrj3u7RUpH8kv9W4Xk8DpmEoguaPUbAsxAlPdFD8hSzphS?=
 =?us-ascii?Q?C8H2gMKJuLQnDgJwSjgMuHWobAdukQswyCYU3M4Ai3m1G7163KuQsNVFlc8/?=
 =?us-ascii?Q?exZsIEsWVllFljuVsTwMu1XuHZfLin722HODKAqX9uHYpdZXtQ+UJPKrHRI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8be5eb6-0ab5-4ab7-7607-08dc8495888c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB4218.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 12:54:56.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB4386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_055507_521163_22805095 
X-CRM114-Status: GOOD (  10.97  )
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
 .../thermal/sophgo,cv180x-thermal.yaml        | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
new file mode 100644
index 000000000000..1c3a6f74ff1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/sophgo,cv180x-thermal.yaml
@@ -0,0 +1,82 @@
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
+    enum:
+      - sophgo,cv1800-thermal
+      - sophgo,cv180x-thermal
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: The thermal sensor clock
+
+  clock-names:
+    const: clk_tempsen
+
+  accumulation-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Accumulation period for a sample
+    oneOf:
+      - const: 0
+        description: 512 ticks
+      - const: 1
+        description: 1024 ticks
+      - const: 2
+        description: 2048 ticks
+      - const: 3
+        description: 4096 ticks
+    default: 2
+
+  chop-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ADC chop period
+    oneOf:
+      - const: 0
+        description: 128 ticks
+      - const: 1
+        description: 256 ticks
+      - const: 2
+        description: 512 ticks
+      - const: 3
+        description: 1024 ticks
+    default: 3
+
+  sample-cycle-us:
+    description: Period between samples
+    default: 1000000
+
+  '#thermal-sensor-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+        #include <dt-bindings/clock/sophgo,cv1800.h>
+        thermal-sensor@30e0000 {
+            compatible = "sophgo,cv180x-thermal";
+            reg = <0x30e0000 0x100>;
+            clocks = <&clk CLK_TEMPSEN>;
+            clock-names = "clk_tempsen";
+            #thermal-sensor-cells = <0>;
+        };
+...
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
