Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B61C41513
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMz9GduqwT2UKvK0qWohKbxnw5KnfgBoegCn4UHO42Y=; b=pSwb/DTHaOOcLj
	vLeQwsgqkitm7r5XT0NpWCFXXT1d4j+eo7syUkGDJQ0vrqlUFr+RoBWsqZg9oSJvYhKtWVDa1te+L
	owjLaRMGpfCFGORPQT72O0bp4crY1PDF1VDRUbFjlTDnW8LdS6+F4j97V+fM4pXtJrfYAb/od1H4K
	q5uBCvfvVOH9KneUi6Imetj0yCVtdS6WtZZSV8Vr6XJInvOFw9h43Rnum8vfOAPBkDhwolWdvHo7S
	1VZzpnWQLno/oKJr0rzaAWwEwAPOPAWk7iWb3Ry2gS/guoXTAU+qu9uj9OcagPQiHiZP0StfhSDXt
	Lqh7f23QinJziNi315hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT2E2-00000004nHh-2EcT;
	Sun, 14 Jul 2024 16:37:26 +0000
Received: from mail-sy4aus01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2819::801] helo=AUS01-SY4-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sT2Dy-00000004nFc-29LB
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jul 2024 16:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZ17XHAfWym515OazZwhqIYe+9wCn+mw9CPhmuLsMJXWtJFs2qqong3fI+ia3YwirtTuJwjT1pgl619/Lqkvy7fop/OjPr6GS7tRh82EqvxQl5EDl9ls1yHHHj7MTW6wOtP1OkRI369wpIGp7cxBHz+xyrsH5UXYRqePNGrryvu15oGv8pbCle81SftpN4eI7qpzPpIlMrSI9Qb5xV1XR4epNAzUNhpjff5FXVi0TMDdyhCPKVWwpwRhEFWEC7UbRnWw1YtToohtMfizgDG4ouVhVfCHFhmXmNNj+in4xV60pu/yu9zyKHGjuCRAqhdS4CimmyRQu+k+45+gAX+Vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoRKN6Mu3kCu04d9yWGkbD8UbUx7RC3KusjBQoYS0Mk=;
 b=elqHiheSa821GQwZ7cvv5tziF1pLolkvV9CkJn7MsizMbUNcIOZpXU0mkZQe4MU9fGZwOq5x6mcfFLmBxYL1NdShQyYw4Orks7YR0ZxdrPqe5hNx79IC2leEFvIBk6K/shhpDbUL5o4+gELpfS9vmAK762IuUTSVI3XcncL1UtBBsQRsP8HuMwsISGsmCS+6gxabilOKwGAP2fxgOWa+qSsogJf5hycOm9h0PaNYv56FVRWsdRDZlRbpfNJEucaRHbY7Ll32siw/YnR0/1uiZvdzj8Zq2lmyNiHjMtUG1BD4R7WWVnlZc2ZlR2YPc2C8CtSYUiJUcGPsSl9jDOAFxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoRKN6Mu3kCu04d9yWGkbD8UbUx7RC3KusjBQoYS0Mk=;
 b=Ho+ztfWR72SSj+zGu7pKgEN18seo2yzi9ZUa6Y4rgBcBVb03nx94O7BU19YedGzv2BsyashQ5EQ5e+T3IijIgOm1clEsgxkSc5GtsRZ55ejEnvNfAdgjgbdaUyqmUteJlYLhypQPvHzqHZ1E62bB1+ktQrUw0uvAsKqcUwTaPn/sijtAeKuA5ZFo00GqZcscsriRE9Nh0XJ7lj0w7C5z3yX5mzP5ZK1neKZ1IqP57XPJrKgdBPuJzkoXN+Cle+HDfNzzj0ZCrQROvIxVQLqraE6fTAfY2BB8f42PaVbyWSqPzISTxFCgNbhurL2CFm57zcvZQXGuwfqcIfLkrWPxrQ==
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:9b::8) by
 SYYP282MB0991.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:b5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Sun, 14 Jul 2024 16:37:10 +0000
Received: from SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3]) by SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 ([fe80::ac24:7d2b:92fe:20c3%4]) with mapi id 15.20.7762.027; Sun, 14 Jul 2024
 16:37:10 +0000
From: Yuntao Dai <d1581209858@live.com>
To: jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yuntao Dai <d1581209858@live.com>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
Date: Mon, 15 Jul 2024 00:36:45 +0800
Message-ID: <SYBP282MB22382E1C032FDE2D36E6B58DC4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [YsAHNOk3yT0on2cfC8wMiIX7ZIDhylmbEH1erL3PARI=]
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:9b::8)
X-Microsoft-Original-Message-ID: <20240714163647.10814-1-d1581209858@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBP282MB2238:EE_|SYYP282MB0991:EE_
X-MS-Office365-Filtering-Correlation-Id: d6cd2863-e7cb-4c81-00b6-08dca42334db
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|19110799003|440099028|3412199025|4302099013|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: ONBMCIB1PeFl4vxZ1x378QRgSmCeC4Eq54BDgDnPHCKJpWHw3NUGj0UB7taF/AYa0tKm1tebZi0JVApkUN4Hmq1YuRKPi/E6arn1B8eDx0qBkL0l+KxIw+h4BUF7O6yOzEC3JH7yONnK5X/HlnmyZ18OCM2PjhD7yeTioNe0n334QSdU3ZiXafH+eh3NI3y+/A97+v/Agoi9YVUWQN8mEDJO0zMWxJn2JZhkuk+78CU8PIaaI9WAaYmy9/yspzmEae0wKkkXSqawCsQx2kvGu3Ue/7yso/8oxlDMkHghXLOrnZRnecCfWTbzL8b71ze4vTtpduT/BJqjMDc6hz8PA1P8/5cAJzZ3AouPqSEOvs541czXlwit/nTlix5I77MJilizp65TSMr5lpAZrHDH1KRlsUo+Dcs08yqYzrNdBQMjbuh30hJfTJdEQkMYOGU1rjfneIWqUO70L3507E7W35lRio9cH5Ub134tuqKkTHmJHktFVqr9piqSjjqTCU6HG/Sahs1AIBIw912h1VgRdHQ1/uXJRCx5A+ykaMCZh8IemMXRgYUaklH3eQPr6gG+IQ2/2orMNRVoD7RDQs5WlUE5Nul0FjSTuVOnmjRX3rFfXJZW5IVXLknJpMG1pFXy0FpcC/Ndic+9l3Kbn86NKVb8f1OWTg6DlGOuzxLrj6vNlU5mrl8fgHd15165eeeCJvToyFI/q/CBqj1HF64BKWPYVjbpogFLZklWjLmrdCAYs7jgwwwuvQRXJpq/TpiNiMA1rz1zgGstUbUdG2cwtjzLwEecbtUTShRW1B62bWk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M4nHuT+hPbWbXyxqZLaHKczskGWFXrrSXNQEMnixFuaNeuz1xFH9gDqx4BZK?=
 =?us-ascii?Q?YCruyQGakZJs3xgBVk5f5ZTLScuZnLtPrcnakEboOK6hZ8o2qjGsf17dunEd?=
 =?us-ascii?Q?+fQZKBNThz6qPXKnEJRYfiAAiK9UDd+KLmWKOq//IJFKuueU/jI1hsvxuwiA?=
 =?us-ascii?Q?w9tC/tPObedJ55ZWcSm7TowrTLOz0Ln7DpKhNvCzK95ifSj113XSe3WWe/Ey?=
 =?us-ascii?Q?eOvzU4STCawdWb4WcVDKtbeOzDNUAwGn7308DW/Yug8w++7kO4Td7IF+RDeM?=
 =?us-ascii?Q?FdZQBxtkocSWd61QcGv/FsWO77hMhKt3J3NytZdSkL0S6fb8oX3o75ukhMBE?=
 =?us-ascii?Q?QPQgAD75QRl7F/KAdZXt2RkpjqmV/oBCYvvzsbrxgD6rnR34N3EoSe5hjmD/?=
 =?us-ascii?Q?+WssBP8kXU8ZVhKZWLd5nW480cKTdnRUJ6CG2zQKqyKKwm08YxuFS29UJ8pm?=
 =?us-ascii?Q?jWZ0o0rDBuwK+E2yW5A/YXLZTL+LK8G51T3IAo+RxdtKWxj5HUwv0VN3kvZv?=
 =?us-ascii?Q?H3wo3iJGvoJU2hXp6LVml+d9IqxLT1oG7CJ2CchwL3iMD9isF78mu0USoNvm?=
 =?us-ascii?Q?oB6hQbIUoWb4N+4ezwQQOhs7tjTD4w8q4NkWl+Y6ylVW/y/pWveETYCmhV/F?=
 =?us-ascii?Q?EYFeLDU/fsn3lfQ8lUqjwZtKOMG/zrywfE+MKADfVqQSL0z4Iu62CnCnTNch?=
 =?us-ascii?Q?fGwem8r+lXwO5rc/sSQzLOtYv5K/5U+GHdoB/9hgOhdx6rT3XAklI5rk6T3V?=
 =?us-ascii?Q?Mt5YUaHqImG+2c0XwQSqFG2gYJb/8ddh76E8E7qnPdk97D57Yuh9YZ5eTOzA?=
 =?us-ascii?Q?XL3gFZQUTrQRSZ/KYPYPDzReIgLO+jxP78ykO7tEUhHxeNnhmTlyS+vjjDRg?=
 =?us-ascii?Q?B0tLU4ZJbIJhMgIoEog7CcarPMoSC6XnALiq/00/FdpNuWS/SY98w2OJpgOf?=
 =?us-ascii?Q?YtRflC8yJavo8rSBJJ39gkERmlc8iUXrXtmmIsKD4hCQrBSCGzr/z8qbddK3?=
 =?us-ascii?Q?kaG3SR8O1Gw4SqCLeZZlfy/lEvzAZMDxovy0Ni0tq7uFmE5Ktzk91SL+m/Ta?=
 =?us-ascii?Q?Htty5Ejr0+lmFzVFWQUK9oWWo/L4GWNdKtxE1exJKeS5zhB6JIaKj5HH28oY?=
 =?us-ascii?Q?TID5zTz+c8L9XfgScXcV3tuFnyvGRQ5n0ckRgfIVe+orykLDbLLG2OTBDt/h?=
 =?us-ascii?Q?P/59DRaVPbVASlgm2+RRcTJxCj+FLA/d6utUkEq92ykjSNRk7faTR5gaZIQ?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-722bc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cd2863-e7cb-4c81-00b6-08dca42334db
X-MS-Exchange-CrossTenant-AuthSource: SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 16:37:09.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB0991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_093722_741493_FDDEB66D 
X-CRM114-Status: GOOD (  10.76  )
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

Add devicetree bindings documentation for Sophgo cv18x SoCs mailbox

Signed-off-by: Yuntao Dai <d1581209858@live.com>
---
 .../mailbox/sophgo,cv1800-mailbox.yaml        | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
new file mode 100644
index 000000000..05099d819
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo cv1800 mailbox controller
+
+maintainers:
+  - Yuntao Dai <d1581209858@live.com>
+
+description:
+  The Sophgo cv18x SoCs mailbox has 8 channels and 8 bytes per channel for
+  different processors. Any processer can write data in a channel, and
+  set co-responding register to raise interrupt to notice another processor,
+  and it is allowed to send data to itself.
+  Sophgo cv18x SoCs has 3 processors and numbered as
+  <1> C906L
+  <2> C906B
+  <3> 8051
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800-mailbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: mailbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell indicates which channel is used, the second cell indicates
+      sending to which processor
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    mailbox: mailbox@1900000 {
+        compatible = "sophgo,cv1800-mailbox";
+        reg = <0x01900000 0x1000>;
+        interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "mailbox";
+        interrupt-parent = <&plic>;
+        #mbox-cells = <2>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
