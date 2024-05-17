Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4FBC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UeQKU0B+xjLY0nPC4tHEDk+2W9u5luZeMmpXK5a4W0g=; b=BX7EvFrN9ipqsm
	CVc3GFaHHtD69ZBTW72hRGb0inRQy0FVYTMSO2NE2J6u8Y2vwIx8JbcgEZqfqBRZfMpcGsGJCGAvz
	1x9n4y+WrPV1BDLB0XEed3nXoejhSuQQaBxF85rTwta7WMf+AqZTDEt3rMeIa0AzUVhXQQdZ0+jCX
	ICMjIQE9OqH/pJgzzlnAkrBda02Zznb69HDYUpElCsKdFgs7nk3qiAuYi14VFN8IYZ/IsjKEKkTBi
	eDyIbXy3ADm9W/K/1VqNfEtSiETQqkBL5JKbTVCRGvSQXRdWYLkTLK1H7mOZ41j1TysLH+RdP/N+M
	368eob748TB/ORebBzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zCB-00000008D2N-2NPT;
	Fri, 17 May 2024 15:08:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zC8-00000008D1v-0w4u
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 15:08:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1eeabda8590so11012185ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715958505; x=1716563305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv54+/RYiMmMOtNi1mq/Z0D5fhkYk22Dy/dLYDtHm+c=;
        b=IgO7PxJs/I47PmqEBd33TtWe1X5pT9L4N2Uds44aKViKhAPlWsk2cmbfu1owRVNbTa
         jxULhVFt+3psAkRsN5IYzXCmzr+73KzsBHBZAs4pU+oqhuneGSdvnSI3/PxnWwPdqMmF
         JFTcPP0Odcle1Bfzx6gtP0eBRxm5Dreh3WECAMp+ftnZMHxyhfi1cmb7203E5n7OK2tV
         SLdwlrL15zExUx9Ws2BJAgkI+/SjuCRcCRjodi0/PwZx7sc8V0jlu43qiNozX1lMv6ju
         uzHp4ZaSnc2VJKO9ZVZpitz0CfRRsjmUyKdZW1izOTFIJgqU0iWzUltEX88SpZnetZ5n
         PrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715958505; x=1716563305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv54+/RYiMmMOtNi1mq/Z0D5fhkYk22Dy/dLYDtHm+c=;
        b=W6ncd0/Y4KfOkNshhsQgg0uZmuxAH5VmrdRu1bNvLe7+QUolrHujKO8hrPtebgZoV+
         CHEW1Y40K0yIIuxFYas/zY+OPH4bGl0f12alNBi0DVj0nIgmxevzmdAOU14ueTU0RngV
         IMa2YGUQwtvWhymt5wxl4hUYD1+2d9WrOtQQD6nMPE09Rnt0ZN2htbhbn3NvleGRQMmU
         rw6b7Dm1UnMh33mhncrKgOGdNJ/BmL3EFKmby3aCSyAEjNVBERjZjl4BF49rpX4BKSz+
         1cNHFiK+V915F6GNwPbb/eyh7aVYkVIFDC8FBuGHHwW4tIF3K4/ybEBvWhfz5a0k81AX
         Xb3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNNN661m4VGRs+aG8lYmUsOBhs4cx3xP2l8GJKnAYbQKmz2mmumNL6DSgKiPdKij8lmpk4pcKdlPKF5vmRZyW84Hbde80Q86aUgsxq/adG
X-Gm-Message-State: AOJu0Yxoo2EKKgXrl2uJVY6mUNw1wDW+ZaQmAAZ4+RGBNyOznqP8ma+L
	/Jw63DjTPj5SQiemCM3fc5O1ZC9yKwxnyYgBfVg+903ip44u5125
X-Google-Smtp-Source: AGHT+IFOk1Z8tKHx4PNlsmj1SdqKmikqavDjQTEj4ooLTFLGPr7uF21G5WM/AlInMnfWHnhIFhKhsg==
X-Received: by 2002:a17:902:e892:b0:1e5:9dff:a52c with SMTP id d9443c01a7336-1ef43d2e258mr262962585ad.10.1715958505178;
        Fri, 17 May 2024 08:08:25 -0700 (PDT)
Received: from localhost.localdomain ([223.178.82.123])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-64f61b921ddsm6563371a12.89.2024.05.17.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 08:08:24 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
Date: Fri, 17 May 2024 20:37:40 +0530
Message-Id: <20240517150741.181303-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_080828_289946_1D63DC9D 
X-CRM114-Status: GOOD (  21.64  )
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

Convert the RISC-V Hart-Level Interrupt Controller (HLIC) to newer
DT schema, Created DT schema based on the .txt file which had
`compatible`, `#interrupt-cells` and `interrupt-controller` as
required properties.
Changes made with respect to original file:
- Changed the example to just use interrupt-controller instead of
using the whole cpu block
- Changed the example compatible string.

Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
---
 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -----------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
deleted file mode 100644
index 265b223cd978..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-RISC-V Hart-Level Interrupt Controller (HLIC)
----------------------------------------------
-
-RISC-V cores include Control Status Registers (CSRs) which are local to each
-CPU core (HART in RISC-V terminology) and can be read or written by software.
-Some of these CSRs are used to control local interrupts connected to the core.
-Every interrupt is ultimately routed through a hart's HLIC before it
-interrupts that hart.
-
-The RISC-V supervisor ISA manual specifies three interrupt sources that are
-attached to every HLIC: software interrupts, the timer interrupt, and external
-interrupts.  Software interrupts are used to send IPIs between cores.  The
-timer interrupt comes from an architecturally mandated real-time timer that is
-controlled via Supervisor Binary Interface (SBI) calls and CSR reads.  External
-interrupts connect all other device interrupts to the HLIC, which are routed
-via the platform-level interrupt controller (PLIC).
-
-All RISC-V systems that conform to the supervisor ISA specification are
-required to have a HLIC with these three interrupt sources present.  Since the
-interrupt map is defined by the ISA it's not listed in the HLIC's device tree
-entry, though external interrupt controllers (like the PLIC, for example) will
-need to define how their interrupts map to the relevant HLICs.  This means
-a PLIC interrupt property will typically list the HLICs for all present HARTs
-in the system.
-
-Required properties:
-- compatible : "riscv,cpu-intc"
-- #interrupt-cells : should be <1>.  The interrupt sources are defined by the
-  RISC-V supervisor ISA manual, with only the following three interrupts being
-  defined for supervisor mode:
-    - Source 1 is the supervisor software interrupt, which can be sent by an SBI
-      call and is reserved for use by software.
-    - Source 5 is the supervisor timer interrupt, which can be configured by
-      SBI calls and implements a one-shot timer.
-    - Source 9 is the supervisor external interrupt, which chains to all other
-      device interrupts.
-- interrupt-controller : Identifies the node as an interrupt controller
-
-Furthermore, this interrupt-controller MUST be embedded inside the cpu
-definition of the hart whose CSRs control these local interrupts.
-
-An example device tree entry for a HLIC is show below.
-
-	cpu1: cpu@1 {
-		compatible = "riscv";
-		...
-		cpu1-intc: interrupt-controller {
-			#interrupt-cells = <1>;
-			compatible = "sifive,fu540-c000-cpu-intc", "riscv,cpu-intc";
-			interrupt-controller;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
new file mode 100644
index 000000000000..6fe86d243633
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,cpu-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Hart-Level Interrupt Controller (HLIC)
+
+description:
+  RISC-V cores include Control Status Registers (CSRs) which are local to
+  each CPU core (HART in RISC-V terminology) and can be read or written by
+  software. Some of these CSRs are used to control local interrupts connected
+  to the core. Every interrupt is ultimately routed through a hart's HLIC
+  before it interrupts that hart.
+
+  The RISC-V supervisor ISA manual specifies three interrupt sources that are
+  attached to every HLIC namely software interrupts, the timer interrupt, and
+  external interrupts. Software interrupts are used to send IPIs between
+  cores.  The timer interrupt comes from an architecturally mandated real-
+  time timer that is controlled via Supervisor Binary Interface (SBI) calls
+  and CSR reads. External interrupts connect all other device interrupts to
+  the HLIC, which are routed via the platform-level interrupt controller
+  (PLIC).
+
+  All RISC-V systems that conform to the supervisor ISA specification are
+  required to have a HLIC with these three interrupt sources present.  Since
+  the interrupt map is defined by the ISA it's not listed in the HLIC's device
+  tree entry, though external interrupt controllers (like the PLIC, for
+  example) will need to define how their interrupts map to the relevant HLICs.
+  This means a PLIC interrupt property will typically list the HLICs for all
+  present HARTs in the system.
+
+maintainers:
+  - Kanak Shilledar <kanakshilledar111@protonmail.com>
+
+properties:
+  compatible:
+    const: "riscv,cpu-intc"
+
+  interrupt-controller: true
+
+  '#interrupt-cells': true
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        #interrupt-cells = <1>;
+        compatible = "riscv,cpu-intc";
+        interrupt-controller;
+    };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
