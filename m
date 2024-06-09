Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7ECC27C53
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jun 2024 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kE8yNFkA7tvYEERWx3jZxBsJwX5o7M6tEg1YnMkMHSs=; b=d/2v42P59j8jap
	Mk9/+Lt2TWG+oR9gwoXV05Yq3dl4HbW6DT7hjDkU46avIoXevZc/DBYFddedOX1L10ia8sJcCebYA
	lo2Hb7LPncipbNh1RoFpwjO5EfNHRJUTPClqB4XVo9Ip5pAdA40/vFdPSs4m+B6oRCdl6mw/y/jLh
	YRxoBlwDbApIFOzz9Kt7zZG+Md43Li8Gh9hVLRrTMpIOpeXbidTGEC/GSSRCibqnGyioGKD7wjRvf
	GHfL5hVyRe1M8xsEwYym3A87C0nUN9PA4FmAw/nnzuoPka9WXIvav845MysejO0EHdMBfu0H/nXFj
	SiSNa8Y6SYGbfb3npGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSk-00000002Meb-3kot;
	Sun, 09 Jun 2024 10:07:46 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGFSh-00000002Me1-00vO
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jun 2024 10:07:45 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3758fdbd2a5so6116895ab.2
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 03:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717927661; x=1718532461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrGcPYJMJhishfsKRnQ7kYXDZI93Ds4JWA94AUqTVuU=;
        b=QRA5zbc1UPoUm55kSHO+vveYz1Y0hQCrtSK0ETqzBKaByLxMl76DXLFtmYWtwpGq+2
         8QJ3QajD8Nuw7HUZKj99SvNQ2fEg0SnqaGh72bfXXW4NCvIdOb1MINobG8dXdn2XUPSC
         DiWWNU97jBL20rpkjP98D7+r0htqLr0YJ/0jvQurqD7odMNE7plwl5wNThlxTiqL/6rP
         k/1wvEYA/wYGW0uUiPPw1Bhxq8/NEtmJiguC1a2unhIdI6oUsrW9z5mZahzSaoIUKGhZ
         I5Wf8KTEtqoOZK8UEG5eo+qPMg9EklmWDcV7DGCkecYE8gQtbVr5EnY/ZO3bYEtKV5Vo
         LMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717927661; x=1718532461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrGcPYJMJhishfsKRnQ7kYXDZI93Ds4JWA94AUqTVuU=;
        b=Y4eoD4IQsisHmpBM2UT4ZsX2aEl3Yy7vO3rooNdWkyDmCa9la+acyRv1JxS/YQ3dbg
         wv/IbnsoD1tqVGULCYCHoR8KAhK1yazZMKLdJz4y8Op3ZXlw0s1q0V8pCYlij4DY0lyT
         eNHtf4k6UZzRUHmEJiHIr+RhQ2NyIeRJ+WYGOnHNsag3xipexbOyfMmtNpzPDNMnwmWt
         s/jLtrcpS2nBxlPm3hu9+32NUsBM70Bkttw5zOuFWVw7yDZufaI9ACgIXNHvtZEHIcdM
         TNq+y/eSyCAGNEojB2VeGCoDEpJ2cRbDKzJFdLGMSw8LCUCefTE5LFaixyJKIXCy18pp
         H/3w==
X-Forwarded-Encrypted: i=1; AJvYcCVDSlhUG52SEyqse7fSEHPbyD+Qx661tXsnrQcmXbvgxBe+4b5W3uPugLe5rhr/3/eYBcUmu/vPKRv0QqwlEsGlqjWAT7Tf5PBpCOpnqx9/
X-Gm-Message-State: AOJu0YzOwSnBsc8nkUU2K1SjAm0AtF+nY1JfuBEOXEWSTg36L74Q8Umo
	ouoKWc75abxtJfmbbn/e+i1bmBahqHJpii9a9zcqpZLPcbI3t3H9
X-Google-Smtp-Source: AGHT+IGhnopr1rEFpd+oheUq9TRm3b8JotiKAk1cnMv/x3wNf4V5aQMge/e1RjDVzYdr1u+tylWzLA==
X-Received: by 2002:a05:6e02:1c8d:b0:374:593f:9158 with SMTP id e9e14a558f8ab-37580375a71mr70344885ab.20.1717927661378;
        Sun, 09 Jun 2024 03:07:41 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1cc9:92b2:ce0f:ca96:5cb0:62e5])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7041c78ac20sm2817534b3a.154.2024.06.09.03.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 03:07:40 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: kanakshilledar111@protonmail.com,
	Kanak Shilledar <kanakshilledar@gmail.com>,
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
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
Date: Sun,  9 Jun 2024 15:37:07 +0530
Message-ID: <20240609100710.85055-2-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240609100710.85055-1-kanakshilledar@gmail.com>
References: <20240609100710.85055-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_030743_145384_685DD75D 
X-CRM114-Status: GOOD (  24.17  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v4:
- Change DCO email to @gmail.com
Changes in v3:
- Remove reference to `interrupt-controller` in `riscv/cpus.yaml`.
Changes in v2:
- Update the maintainers list.
- Add reference to `interrupt-controller` in `riscv/cpus.yaml`.
- Update compatible property with the reference in `cpus.yaml`.
- Include description for '#interrupt-cells' property.
- Change '#interrupt-cells' property to have `const: 1` as per the
text binding.
- Fixed the warning thrown by `/renesas/r9a07g043f01-smarc.dtb`.
---
 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 52 deletions(-)
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
index 000000000000..83256cc0bd5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
@@ -0,0 +1,73 @@
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
+  - Palmer Dabbelt <palmer@dabbelt.com>
+  - Paul Walmsley <paul.walmsley@sifive.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: andestech,cpu-intc
+          - const: riscv,cpu-intc
+      - const: riscv,cpu-intc
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description: |
+      The interrupt sources are defined by the RISC-V supervisor ISA manual,
+      with only the following three interrupts being defined for
+      supervisor mode:
+        - Source 1 is the supervisor software interrupt, which can be sent by
+          an SBI call and is reserved for use by software.
+        - Source 5 is the supervisor timer interrupt, which can be configured
+          by SBI calls and implements a one-shot timer.
+        - Source 9 is the supervisor external interrupt, which chains to all
+          other device interrupts.
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
