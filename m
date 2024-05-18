Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234AEC25B74
	for <linux-riscv@archiver.kernel.org>; Sat, 18 May 2024 06:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qCJjDl/tkrdpJSqqMkaS8xaerFmk7xUCE1PerzjVBuc=; b=a5qGZRZksjhMNS
	iqie+47VmgZ3BGzX2zMmZRVjYbbEfrM2AI8mXyVx/1FWk+NDpUpixksUYpO1XKKGK1WEznML4lwvW
	+7prLwaC+SjykvaUfQH/ktcrh4RZecC9WFvpVgNVATCj2aY12AIrYhcLtg1/4Ot6sL2oIhceTST2j
	WdF8/x7JyZ+8OBGinMg0dXpEMuusnzb1z01RRvM/OKMFxvvH+Xt9WWHDDydpGE8KaSdtdoCu52InT
	RFmf3Kgl2HW47IsI+mrA73c99ic6/aKadN+/Ss+p2bDuSyuL4a2JxQ89oMK9BkWvksMPCkuPs7IgZ
	+UReXmNyAwtZeTdFh/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8DTt-00000009eMR-0Hqq;
	Sat, 18 May 2024 06:23:45 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8DTp-00000009eLw-1aUp
	for linux-riscv@lists.infradead.org;
	Sat, 18 May 2024 06:23:43 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c99257e0cbso560810b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 23:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716013420; x=1716618220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lChIbpiKLjP/99jCI9/LiFKYC4nQkzM10+P+N1G1jz4=;
        b=LQCnQHgiUfjDG19+q2cYIzIdjsGOXsOUz5mc8InXALr2R+uekM6BFO0VeXysnXPPKp
         MtC75U9NMKukMq0eiSOEWMk8f8t7MRwtRMkriCwTU3f7Rii6ZMa+qCOBhkaL9CGl175I
         tMb6Qao3VtXjlXu4TAJjl3t+DVI/+e9V5SHZKXrA4EB8cTC6xEv0+QcHdYKsxfqqih+j
         Hk8a09vaoq55TxMufAg48t47upPiB2pisIuv+KfgKPjjUvMndSJ4xZIKv9ibw9ewENCr
         lkJavSVILmTtrTW1XLhiMfu2Tb/SRB67D/C3SSHIoBYTt/C8Al2NQMmaoZQ49WO9pWoT
         7mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716013420; x=1716618220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lChIbpiKLjP/99jCI9/LiFKYC4nQkzM10+P+N1G1jz4=;
        b=Kpe2Lip9pXpBx/SGug8uJRtkWiYNvtsmPKZJQCtvjyf1Ro86djzegZzh4XMLeX2KGb
         w7Z3zJWWsfQ06W3PAYmMyCUawQb9biSm5stJxSMMtM5I/5FTKgCHDF85YWltju6RVbN1
         A1bolhCC8tqoAPHGxdrI+9GZ+uBq5HgA8SIyV3In1Z4q6vAWstFFCcXCu8Q+B3WGHolC
         MFp4mfV6OUd2ysNxr/wj1CeWZrg03J4CexzhhRUNd5IeBUumpzD1bbrMSvLPEsjzGAJt
         yyO1pZvnIXp3ZnGN6D7wm9fjbxR2vc6qwtjnBYxf96+LisEVI752AvTZGOIti9BtfFX3
         R3wg==
X-Forwarded-Encrypted: i=1; AJvYcCUbAr5sjiJBvCnq8pYM7Aab+2p5lt9f/Bmeiq0azl61HrUgtOUMO8mj25a+j4sGU8PHto0ipi9F3LB4Lslcy/od7hIA6d2lo6Z+EUU618Vh
X-Gm-Message-State: AOJu0YxUTJammjvbmllALw3TS0POgeSwP2r9gUQxoiop34Kv5R//DHBD
	zBdpRIHFBmjQRWc3Z/O7sPbYJiV8peMfklR0yWnuXdG0nMjADL5P
X-Google-Smtp-Source: AGHT+IHs0B7rpGA8YYCnNcrbM/HW2ScrpVogeU4D5lviCUZIwCnatilzhab0d1p6drNssb7I4s0+gg==
X-Received: by 2002:a05:6871:8002:b0:245:2ccf:becf with SMTP id 586e51a60fabf-2452ccfc883mr10283944fac.37.1716013419743;
        Fri, 17 May 2024 23:23:39 -0700 (PDT)
Received: from localhost.localdomain ([223.178.82.123])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6669dsm15691233b3a.31.2024.05.17.23.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 23:23:39 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
Date: Sat, 18 May 2024 11:49:21 +0530
Message-Id: <20240518061925.43549-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_232341_453394_8A6D2F65 
X-CRM114-Status: GOOD (  23.68  )
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
Changes in v2:
- Update the maintainers list.
- Add reference to `interrupt-controller` in `riscv/cpus.yaml`.
- Update compatible property with the reference in `cpus.yaml`.
- Include description for '#interrupt-cells' property.
- Change '#interrupt-cells' property to have `const: 1` as per the
text binding.
- Fixed the warning thrown by `/renesas/r9a07g043f01-smarc.dtb`.
---
 .../interrupt-controller/riscv,cpu-intc.txt   | 52 --------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 72 +++++++++++++++++++
 2 files changed, 72 insertions(+), 52 deletions(-)
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
index 000000000000..e2da595ee389
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
@@ -0,0 +1,72 @@
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
+allOf:
+  - $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller
+
+properties:
+  compatible:
+    $ref: /schemas/riscv/cpus.yaml#/properties/interrupt-controller/properties/compatible
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
