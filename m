Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABD8C25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uobUcKyH75qb935WinkcXvcrPpI8Nf4ZmdqCdYE0hmk=; b=FE1R17+GOsc0Ld
	2y9+V6xgqNC9L6fgwfg10KD9F8UKoy4SkvxxK4FCdM4zSL4yENQEvYdX7aBiYhdpGsaC9xDr4uUfd
	PYdTk9yiSr/ZtoXNzBw9zr2LdpDJb7kL9TuJHbfHPG8ea6Zc1lMsMQYsmOWAg6ULo3eZLBVYfI1yB
	Jd0bNCIOTS7BfXBn79JPB8idvt03cBgKHSnMpeKI7tBWl1EtI86/b80qwKnucdLDjfgQSy8ME8Mny
	GfRdDerwWbry32N4Rv6yfAWLYV9WnJoy5FbVB9uGPTrrEaSKNjC8FLcdXxhlQ41M1HslJkbEVVpso
	CgGZzaZehnN0sKYhyjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o3r-00000003OgZ-1xKC;
	Wed, 22 May 2024 15:39:27 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9o3p-00000003Ofo-0k75
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 15:39:26 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-662aeb8d157so1364642a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 08:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716392363; x=1716997163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hOXQ/41pPcOGvj8BDEvVxZO6mfZsuadhgYq8hgiByM=;
        b=igJm83EUKGG6ITwMKAAn/atcQW3Aa3ZJxlWeaUJuyqoNdtGOWMQ+96VqSIXZrEAjy8
         YoPLjJAOaKy29+kSLHAf2DfLwq7hS3qZSTWBz+PmuKoO4fQT4y5mxf1USOdI+8/vjk4j
         Xp4BH/7eIEhtb94mRqmkjklVkSYRApIgXRfz64K0HH0po8qcJiV6XolLIAs9peNHsOzs
         nTWXq3Dvx237zYWu2aU7xkNRECpy+03YviHQgVi8/rcnsx75wQxGvd8RcvteChEhuL+g
         CngU+hB4GdO8VsE0uLI6gN+R+aySPVHWVtRI5lwo7Q1RMesorszh8GzOBACtycT2PWt7
         APwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716392363; x=1716997163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hOXQ/41pPcOGvj8BDEvVxZO6mfZsuadhgYq8hgiByM=;
        b=BJrSRWvSaufAmzZhQrmi50+m/l/pagiZxsMjvf5yMRb/BcMLGbARAM6F7d2gnx6/F/
         HLKdtLMSyOf0/OPLOdb2AZdfeyC32Px4GNwoIiTaiOe/WYYzQutSPDCE+O19ReyFOYtT
         ZJPtYQWsxj1i354iex03QSmwLI00sQpLjH3Jy4J+UPZcsvSNrfU37pJUN11foQsSXru9
         sgbyBUhmh9ooAY64cOWV+pq069zgW9D6j4pGWEQDMAODATqc8zcwbDnVu82LCto1zx+0
         m7tzzazYK/Ca1FIhfW87NcAbjvCO6dXxTDn1rYYDzS6kxpGJiCxnhR/Lb5sXCQZ8WftC
         ABFA==
X-Forwarded-Encrypted: i=1; AJvYcCUD3EsUwuSBhLQYYVJGMlJm5l3SJCNQ7Vq2gReWQXUr6QKipZcakC7ywXVuIy5LzkO+xTEvRzUAm4M7aQyOO6FCf5oGkJGYEt0JTg18tJD2
X-Gm-Message-State: AOJu0YzxPDdZQ2/cIVIon0EvG4U1NidWJoLm1tu4LI/1fJKxxmtlJFpz
	MiF9NllNg4iTObzkk/OmBOgppuooClZTAa1RKhP1x5cKLATmhFM1
X-Google-Smtp-Source: AGHT+IEdG/YJtyj4V/iHZoT6nPh92OTkLumJkQga+1EKiYtW1m9PNOuKN/IZvV+kazbpVt6rlj0rOg==
X-Received: by 2002:a17:90a:2dcb:b0:2ae:78cd:59fe with SMTP id 98e67ed59e1d1-2bd9f5a1821mr2571771a91.31.1716392363083;
        Wed, 22 May 2024 08:39:23 -0700 (PDT)
Received: from localhost.localdomain ([223.178.84.74])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2b628ea59absm25574077a91.47.2024.05.22.08.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:39:22 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
Date: Wed, 22 May 2024 21:08:36 +0530
Message-Id: <20240522153835.22712-2-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
References: <20240522153835.22712-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_083925_258131_33CFF41E 
X-CRM114-Status: GOOD (  24.78  )
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
Changes in v3:
- Remove reference to `interrupt-controller` in `riscv/cpus.yaml`.
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
index 000000000000..c9c79e0870ff
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
