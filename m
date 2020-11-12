Return-Path: <SRS0=fdZL=ES=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB75C63697
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:01:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5102085B
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2020 12:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GzIkMywA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="OPeURLMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C5102085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BmoKDgdBeNS22XedRoplRzWbBUlpyO1aV9dBY3FrBkU=; b=GzIkMywAsBOTVKIX1yKpDtArN/
	AuXcHahWNngfH0pbWETcAG7zEC6C1h9114BGQXrM0LdYkoTbX+LPbhwcVNEUhoIX1llSQ3lkFwlKt
	+a5jUoFGNEizne8hMVB6+COGennGoUfxOpXJn0XtlsDsXvpVhb48ZDugZ4IXECFLRXiM7oXK4MDQT
	hnpFr+DLQ6qM1Ip7RTPcFeUhkHL0UtbzFwA0BG36cJryx+GxocGM8f/RvjUGo2IXS8nsHM/Q2xVCx
	mAaS0q3nfxSaGd/Hg8Fkhoo2uiwZlciGghmCE7TPuljTdar4y4aOUdC+0d30Yk6SIkVqOx49PKYQV
	7b/i4VEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdBIH-0001Gz-JM; Thu, 12 Nov 2020 12:01:37 +0000
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdBIA-0001FR-F4
 for linux-riscv@lists.infradead.org; Thu, 12 Nov 2020 12:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN/vTo+yHRoZlemuQKgXBVOaEov4d7aYz2HTxxEBIMzNhsixzdM5G7WPErPyPKrxO/J3TfoANuueM39VngED9jF37dK5HGVslyRc70uQa/nYIPD6RBIkBQpJD4jnSS3tq6Ddnc7B5ZqAmzDD8eMJ20GWCPhYsCDZBIIB4kTcaxqG64PrkB5Rs5DGZl3LMr2QAPDnZ7Odxf8ixl3DFNQ54XB1uwqLjFz3JXMY9z2vGWKVpAjHhTNPU5CH2J432RyJERul92b16DJvORZ61aKiofv/4+vx+8biCfYQrPVXZsnRHU1MHJrjBFYDH5wTB5NOvJj41YwrQADmxFKt4HUZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8OBlsS7A63dZW1tRakBnxsQUjm3Xy7LciOTf5OSHeE=;
 b=Xzzy0SXJDO9XicqbexWnuapNeb9JCKTK30Tsm2TN6cL8bIbJJl2maArdWZpP1rst8+BuN+TxI4DWzoZrj6hYrb4VrZqqwuCrrajHi0lKT4b2/yaKdUJ5Xi94uZ/0hVIRMJZedUkLG9Dt/NgjKOA6qCtlTYVNl55PySFVErbjegTRRWGqxXMvIkOONQDUzN95eJCYrifGEBamBI5mvifUe71/XovOUAqSzknF6CcXsIREYqfNC9qoiig9QQ0iNuSriQwgHMGirjo65dyRe/Rl28VQB5PERul7WkMOjho3NQzwiotmlRIctsvlH7O1Bavr25bmA6UOzzKAZtJ3JHDk+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8OBlsS7A63dZW1tRakBnxsQUjm3Xy7LciOTf5OSHeE=;
 b=OPeURLMMUc+x4No6ER81FrHdqfKHV892cgXAPtVpqgcGmqCUDC1eKLd3TidnV1GGjBDB+w2qt1QLHAVKR0fQHckmdTzgeBxqCY8ALH3IE9tjFEiBDlLEeKx56POBpdL7ZbAmlYaTpAzCIzuX/uVhiN07Tlxe29xfl2dz3OsvoJo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BYAPR13MB2392.namprd13.prod.outlook.com (2603:10b6:a02:c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10; Thu, 12 Nov
 2020 12:01:24 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::2c46:9095:ba12:6513]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::2c46:9095:ba12:6513%8]) with mapi id 15.20.3564.021; Thu, 12 Nov 2020
 12:01:24 +0000
From: Yash Shah <yash.shah@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com,
 rric@kernel.org
Subject: [PATCH 1/3] dt-bindings: riscv: Add DT documentation for SiFive Bus
 Error Unit
Date: Thu, 12 Nov 2020 17:30:55 +0530
Message-Id: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::34) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BMXPR01CA0024.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Thu, 12 Nov 2020 12:01:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09f871de-310b-428a-11ce-08d88702ad64
X-MS-TrafficTypeDiagnostic: BYAPR13MB2392:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR13MB239244F159A8739D260A545A82E70@BYAPR13MB2392.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XVMHETvUiGZyQuAdiFJZZJn6/JIgeis7YOzV1E5Ob5hT6eV4IzRKFTnNXs5JzzZeCdPnv61xG4sULG2lXOZ5Y4RT6gFBwdTWz9YKy5kMl57DmMCE8oTib6Q0ymFyFtZcymySJNmBbefdne57ykKATV0IW9dh+AZHmQIZ3yU3eg0yMmJj5Nr8CToSN++9aOsycZLZvjLsIDHk/pfPkbQWuQVjplHIRCpF6Jeryt1FroJRMKLNtZ1grlq8kmbzDl3Qrck2R+SuyE4SwJT0GqyOurmH3BY96qHb8PAwsbJWrbAP+xSVnuPJLEbiq833czMjY5Nqpiy1+Gx9QQbYy8KjQxt4mBER/tMRyyaiwQNsiMmHc7xZc2YflUR2A49Hc2ocNL5bJQa9elQDY8byhYBCLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(346002)(376002)(396003)(39850400004)(136003)(366004)(8936002)(42882007)(478600001)(5660300002)(66556008)(66476007)(6666004)(6506007)(316002)(36756003)(66946007)(6512007)(44832011)(26005)(16526019)(52116002)(107886003)(2906002)(6486002)(7416002)(966005)(83170400001)(8676002)(4326008)(956004)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: q1Tuz6UKRXsjDl41N0LkOGU3VTrexliKfZhTxo5KCfe/c6OiIDZQelz3b6sFG53RRhEciGgUoOph2/EXia03uH/Nw/ul4ajOCyVGytxMHaPvZN2Mlkaibmdjcv5mzhdVmi5ZyHHzHj7WOQZqnUUay3WDb+J3TjV2SIqH+IJSuNCeUTyVNRnL2Uhtp47BkWqKtdyvlE6N34hPfPJGgIrqcTtdqeIOlbG8P3/eg0eSOfIXpFNzKSawzfBOE6Mn1jpbXdwfRS22PwADy+rHv5h14dNkYAJ1g0U7GLIvP2UNWIGdXGX5eB8EZKYNtur/PtYNR4P863DWhXXPABFWr7QWF28PIkXPetXvW+C5lmd53n01nz3qQYWCUTz0DZboTKZjOmhBeEoLAcmPI+gxdJSzSvyvX2lQfFHpYsLpKItB7YWV3IhrMIwUVUIVjgMNwEHO1DQ7oKs2T2oE3imG9WHrhPlDETB7wUGGOXuldHOh+dUytYI3P/k8a/47elv08Qz9m9npttCQ7M+9sOfCBzUx5UfSI7ioQZfivT4BmdDvvUdJyuhyw56sfwhgI6G2mnHNkoXy46iV/nx8yn4XOoyofa2DaNxYQPBrHe2EbP+9Fb5THe4KEWzBnWZqg8L2F+t7ziiyU+vZDKbMegeBay/8/GqDqtj4+aHwukjbLKKeLjMkt/SjeQVPyOrTa2RHSlVikakdJCQYxDdkT/uloUt4E0UbRHeiJ8POxN9Q1X1ZeWMeAHaNXAmt7/AdDw9YTC3qV4Pk4WpH8K8EcfIHqGIW0t3k/CB9QE/iz7x7tXGFf8A2GL3Z1X0IBG/ZNp7lB51BYeSmFk+philiCWHKnE5PhZtU+iPUb9CKK70wS+OEc/dqON2lP5hGjbuCTeLAT58fvHpZsstROrx1yxkOEodBPA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09f871de-310b-428a-11ce-08d88702ad64
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 12:01:24.4164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcsfSmLahV7XscyHJqm0HsRm8uEvcXKfnQxchID0esNG8Pc27r4SytC6BkBd/6l9na5uaBXgHUUlFqL9inkUvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_070130_846046_31F523BB 
X-CRM114-Status: GOOD (  12.50  )
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
 Yash Shah <yash.shah@sifive.com>, linux-riscv@lists.infradead.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add DT json-schema for SiFive Bus Error unit present in FU740-C000 chip

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/riscv/sifive-beu.yaml      | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-beu.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sifive-beu.yaml b/Documentation/devicetree/bindings/riscv/sifive-beu.yaml
new file mode 100644
index 0000000..4697787
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive-beu.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2020 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive-beu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive BUS Error Unit
+
+maintainers:
+  - Yash Shah <yash.shah@sifive.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+
+description:
+  The Bus-Error Unit (BEU) is a per-processor device that records erroneous
+  events and reports them using platform-level and hart-local interrupts. The
+  BEU can be configured to generate interrupts on correctable memory errors,
+  uncorrectable memory errors, and/or TileLink bus errors.
+  All the properties in ePAPR/DeviceTree specification applies for this platform.
+
+properties:
+  compatible:
+    items:
+      - const: sifive,fu740-c000-beu
+      - const: sifive,beu0
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
+  - reg
+
+examples:
+  - |
+    bus-error-unit@1700000 {
+        compatible = "sifive,fu740-c000-beu", "sifive,beu0";
+        reg = <0x1700000 0x1000>;
+        interrupt-parent = <&plic0>;
+        interrupts = <65>;
+    };
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
