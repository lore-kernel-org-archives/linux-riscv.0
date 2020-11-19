Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA699C56201
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:10:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B427241A6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udefew/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="NinK3vH0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B427241A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RF/3exxdwWGfgtet0lUAEDGaqr+llJmjuun0oXT3Zqc=; b=udefew/QcbKK3bug1AUdVbejxa
	yF+haO46AgZBkVZdn2kKEBMXwziwCy6uuED9Er64jQtiohfMOr/anYtWFnFqTKWZXQFrSzk9LWSQy
	i0HH7NCz+pcMnFGHO1YQW+HXxrf5UyI+vaU2jcfDfto34fEVQiout6T632UNo/wQLURlOGhsKA3oZ
	UvU0OIEQYODYRBtqUgKq4RfyxeevOOalv8hWs0UoRoocE4SPxP1LPfHF/bP8a2bWQAQ4g+M+bblig
	/DkqnoAmU8UgeDO/oSDNhE/F0HcWwXM5T/Xjm1iP2eWOzHw5BIWWFRh4mNroF7Z/WPkY7GOrSkKct
	0ur5y6cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnRg-0001JO-Dg; Thu, 19 Nov 2020 17:10:08 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnRc-0001Hr-Tc
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805804; x=1637341804;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Kl04zi16mIa54+tgPli2SWxBJHPluDkqBpHCMDOYEhU=;
 b=NinK3vH0QrFCciPwYmxRASH6cgKXEfwjgkGbypNTlIhRTN8PI4HpasMl
 ccD4z1IlqiWDdkynAdAxx6X5c/bSWKOkt4NLgtH/C+iwVGD067vzjG8mf
 pVeroHdbPdF9q+UTDY9ntd5MXIllNPJrNJU6G4D234NTckNXxuLk9Mn1k
 w30738g12jObGsRHspUl0iBa86DeK4gZVeVeKi9jOn2JgpyKWDyDGY+Pb
 QEfrR9ctIgiOf6IFOkPLrQVYmvFESWYI69JnSMB2GWX9G6oOPPOel+GY7
 QhmFWbPR0WYllb4bVApagZ+4BQUqWeLMPMmo8W6EYADQFTVwZigq+UFgB A==;
IronPort-SDR: 7VOD4RlZuvtzFBSaB+MIHNgxvWnU+bueIQt+ojEJqlhPqBPE1UnJSiczq3UCPchl9clHZQxHO1
 5BP3SWnLcGBENZOtjYcYjZEiHm/YwTFonrdFpPq/ETK0GJbdTgPmdqN62d2+X2D9YEyZtJgNd6
 MnXKq3qYiU+sO82/Gp9HuUlfB/WqYlqGFOac8FJ3Qi0pcz8z6dQjbKeQtOTEZ2Lp7Lgfrzn3Ap
 lV+QzC3khe6hkNYXFxb+swo10n7u2LVM2GyJdoWQjn0FcRDQ4JIXuMeizZxb5DskF3OGCxZmsC
 DMo=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="94258888"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:10:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:10:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:09:58 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 5/6] dt-bindings: add bindings for polarfire soc system
 controller
Date: Thu, 19 Nov 2020 17:09:58 +0000
Message-ID: <20201119170958.20984-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_121005_080699_D2300850 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the MSS system controller on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs_sys_controller.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
new file mode 100644
index 000000000000..a1c5bba5068c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs_sys_controller.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS system controller
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-sys-controller # PolarFire
+
+  mbox-names:
+    maxItems: 1
+    description: name of the mailbox controller device node
+
+  mboxes:
+    maxItems: 1
+    description: |
+      phandle and index of the mailbox controller device node. It must be 0 (hardware supports only one channel).
+
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+required:
+  - compatible
+  - mbox-names
+  - "#address-cells"
+  - "#size-cells"
+  - "mboxes"
+
+unevaluatedProperties: false
+additionalProperties: false
+
+examples:
+  - |
+    syscontroller@37020000 {
+      compatible = "microchip,polarfire-soc-sys-controller";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      mbox-names = "mbox-mpfs";
+      mboxes = <&mbox 0>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
