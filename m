Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEEDC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0QVp5Bi7We3fJF0gAJrBzS8tf00Ew976X010rgCTQw=; b=EmX4gb7JoVqlkv
	sWXRxxcUW3hqk2Ql9Mq3du/yjJdUSbZrHOr0pNguVU81RryeFS2QiFk0qZVu6QWQsEJ8d7pv4k9Ms
	ZWqRtEp4imH9KW2ok7f/g3MJs4o18Bf1D/0IbtHatYk7LY+aWP3xtbn12fWV3lhLzgN3ouonyO6C7
	8Ig3jyGDxSHqSyB6ilsLGZMEYeB/wD7oEj55WHw9nyukCTLPluUWCp8beMqmL6mLtiz2Iazsf4t8M
	FHbJqfbSrmVsmkIfQXAaHoTu8NIBrr5+VKhVzO7NDYRQz1sYg8CY+Ei5kh6OS1UhbhATg588RMK52
	nxY5SXoj8yZJnnUTSHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ5K-00000004lfw-3Mo8;
	Thu, 02 Jul 2026 15:12:14 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJ5H-00000004lei-2NRT
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 15:12:12 +0000
Received: by mail-oo2-x05.google.com with SMTP id 006d021491bc7-6a317229906so102209eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005130; x=1783609930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUdfn0E+HkL5zwEpZVP9/C/NdRDvTd2wtK5Vkg7/59k=;
        b=CX1mQMJUwXLggJbJDOYAYhZE9Sk0PJ+xQdpiI/5LkK1NYdJdPmDG0DcOl6L6kN212e
         Uzld0jP73bXRaQxFAq8qTTukYjns2nHVr3rZbHdIabssjxGKTsrGe1z8BjhQu4y9UVYb
         Le9eZGYZ7a/1tW0PCFBY7cg9fcr+R7tCRDSsO9d1RTYymVJGZxYV91SGHUIzh7H5PPvG
         yKWXw8lv0xgFxE7a41HX1jRXls8af9XTCxMaVvFmgZ6qcPe541/4ZIkTaAtUrPd9U2vj
         SGDyPYryepjorDI9QMAp+M1nlrlHgRxSvVpowKBz7CLnVcGDrMneE6wmaJCe3pyMb59L
         UKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005130; x=1783609930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EUdfn0E+HkL5zwEpZVP9/C/NdRDvTd2wtK5Vkg7/59k=;
        b=RKR30URoola6U9yodjds+P2dSztuzn8PHNLtNCYnmdgPmSqtIvGDn7FmMuT/zEZhbW
         a5wHFmIa/AOWAsQl0lefPXVJvxH1+k8J0xQ1tYtRQYQgq/NfMPExhYOCGcuSd/IV1rh/
         3C7E7ehJi3P5kDnL0vRflqPupiOG2RS52+G5gMuh7HAMIbGUZVVO0seFjX6o4oSqpCKd
         rafEVHZXdHb/l2/OykUi34tpUxRlHTVXkYWzeaYib6fS7jZYPvgeq4z0zfbpTZv2Zrl4
         hv8JiREIJKRH0O42qxhYibSZU8wmN2ZcmpiFtBZJT/rBgl4qZWVXa9UAUadKS2qC1W9T
         Mg3Q==
X-Forwarded-Encrypted: i=1; AFNElJ92IRSTHPswkkZGjlc2MUhrWGB4SlGuE1V+qvLotdooXFJU50TldgBNt05+KIC8DQvuyTUIFBnc0Om1Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu7zWAiploml1dpiOy5KUMCtIdKHnfL8OgFfGMOxDFE/5DF83s
	RaWxioRNPcN+6c7Oo7ZGCphaBYKK5lpAXF47DyHkSmzPAucPs22K9HpY
X-Gm-Gg: AfdE7cldhgkbyIRdzIx7Dw4L5slg/laVcnSn2HuR5rr3FdzxtSgi0B5ltYk9Lid0mH+
	Ryz6PSkFzzeZYeRq4TgTj3hbxNcymGOFot/KB7EuRPkmAI+rL5nLV13jFruBHjA4w3gL9gyrLwU
	mmyoGFDoww34kGzsOmzwimpPo/qnJm5sEvvA/lC4sOVHL/ccLOnVngrQRDQomaqzBRmpo7BeePV
	gD8YLc/VVZJkuv8BHFwjV4oRCbatTNpx8rDAZDhTZTudAafLltL0DUQsUuCjq1TDRbCcqsRScsC
	mLG32XtBnm9ZRb/5RWf/f6dwbssYdSEg8ed0lV2vtfsDsFLqsXz3jmxauaxABXrl9CVWn1qYOrf
	th5kalMNBWb+5Jyf/720ilX5t5umA3pEl1ZQEzyGGhsCsafwOO7yNTuNscyMPJOuPThFfMjDbJp
	VI4VJJGOEgYXHSvIr8Pnz4qkOsq0wNcJzLUUp2+cKrb8eks2ChXEPINJI=
X-Received: by 2002:a05:6820:2903:b0:69e:98c0:a9c with SMTP id 006d021491bc7-6a30d747a2cmr3407719eaf.11.1783005130487;
        Thu, 02 Jul 2026 08:12:10 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cbec9a113sm3094561fac.9.2026.07.02.08.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:12:10 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jenswi@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Thu,  2 Jul 2026 23:11:14 +0800
Message-ID: <20260702151115.544016-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702151115.544016-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
 <20260702151115.544016-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_081211_617261_CB513E5B 
X-CRM114-Status: GOOD (  15.13  )
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

MbedTEE is a Trusted Execution Environment for embedded
systems (https://github.com/mbedtee). It communicates with
the REE via shared-memory ring buffers using a fixed RPC
protocol. Two platform configurations are supported:

  - ARM/AArch64 (TrustZone, SMC): two reserved-memory
    regions (t2r-ring and t2r-shm) plus a GIC SPI edge
    interrupt for TEE-to-REE notifications.
  - RISC-V (IMSIC): three reserved-memory regions, adding
    r2t-ring for REE-to-TEE command submissions; no
    interrupts property (T2R notifications use IMSIC MSI
    allocated at runtime).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
Changes in v2:
- Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory
    containers, reg addresses, riscv wrapper); the ARM example now
    uses bare interrupts (matching arm,sbsa-gwdt.yaml precedent)
    with only phandle-required stubs (imsic, t2r-ring, r2t-ring)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)

---

 .../bindings/firmware/mbedtee,tee.yaml        | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..62f2522
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE Trusted Execution Environment
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  It communicates with the REE (Linux) via shared-memory ring
+  buffers using a fixed RPC protocol.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain (same CPU cluster, coherent caches).
+
+  Two or three reserved-memory regions are required:
+
+    t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
+    t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
+    r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
+
+  On ARM/AArch64 the TEE is invoked via SMC and signals the REE via
+  a GIC SPI edge interrupt.
+
+  On RISC-V the TEE signals the REE via IMSIC MSI; the REE submits
+  commands via r2t-ring that the TEE polls. No REE-to-TEE interrupt
+  is used. No SBI ecall is involved.
+
+properties:
+  compatible:
+    const: mbedtee,tee
+
+  interrupts:
+    maxItems: 1
+
+  msi-parent:
+    maxItems: 1
+
+  memory-region:
+    minItems: 2
+    maxItems: 3
+    # Minimum across platforms (ARM: 2, RISC-V: 3), constrained by allOf below
+
+  memory-region-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      enum:
+        - t2r-ring
+        - t2r-shm
+        - r2t-ring
+
+required:
+  - compatible
+  - memory-region
+  - memory-region-names
+
+allOf:
+  - if:
+      required:
+        - interrupts
+    then:
+      required:
+        - interrupts
+      properties:
+        msi-parent: false
+        memory-region:
+          maxItems: 2
+        memory-region-names:
+          items:
+            - const: t2r-ring
+            - const: t2r-shm
+    else:
+      required:
+        - msi-parent
+      properties:
+        memory-region:
+          minItems: 3
+        memory-region-names:
+          items:
+            - const: t2r-ring
+            - const: t2r-shm
+            - const: r2t-ring
+
+additionalProperties: false
+
+examples:
+  - |
+    /* ARM TrustZone (SMC) */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+      mbedtee {
+        compatible = "mbedtee,tee";
+        interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+        memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
+        memory-region-names = "t2r-ring", "t2r-shm";
+      };
+    };
+
+    /* memory-region phandle targets */
+    mbedtee_t2r_ring: t2r-ring {};
+    mbedtee_t2r_shm: t2r-shm {};
+
+  - |
+    /* RISC-V IMSIC (ring-buffer polling REE->TEE, MSI TEE->REE) */
+
+    firmware {
+      mbedtee {
+        compatible = "mbedtee,tee";
+        msi-parent = <&imsic>;
+        memory-region = <&rv_t2r_ring>, <&rv_t2r_shm>,
+                        <&rv_r2t_ring>;
+        memory-region-names = "t2r-ring", "t2r-shm",
+                              "r2t-ring";
+      };
+    };
+
+    /* msi-parent phandle target */
+    imsic: imsic {
+      msi-controller;
+      #msi-cells = <0>;
+    };
+
+    /* memory-region phandle targets */
+    rv_t2r_ring: t2r-ring {};
+    rv_t2r_shm: t2r-shm {};
+    rv_r2t_ring: r2t-ring {};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
