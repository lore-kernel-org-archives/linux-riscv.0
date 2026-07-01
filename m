Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610B8C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 13:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYWxs+82yyfcJ8F8WrvsfLx6ln1gyVRqcIlDCySfUn0=; b=VzDZl1dYYY3MUZ
	DyLD4yzLO+gk0zp6BDZNatV1IaBxPn2JwxDIjzxKeiE8wGIPFx5ww182vLabxGPWZUAJP4Jdez3yy
	B2yO5FXxxtWEVDyV7YXZkgB+z2uF73W3S98Yvoja8/OTtL5xAIU/35CYqTTcnvhAevszVIBIVQqdr
	9uO/lY4bPcl/JieZWHK9wpMbU4cUvXuAIFnOHoajwml0f9LXSOCBFc25tKA0aixESN+KEb6UDiRm2
	VWejRiUI7dQ7MWjKE2vM/jq7U0n7mGjOwPUKZiOR1F0sv3ShcSeIAlTHxRYfipwqLoB96cNd5sYbP
	VEdDCFRntAXoIzQZOjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weux4-00000002Ayj-2u6J;
	Wed, 01 Jul 2026 13:26:06 +0000
Received: from mail-oo2-x03.google.com ([2607:f8b0:4864:31::3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weux1-00000002AxC-0NYa
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 13:26:05 +0000
Received: by mail-oo2-x03.google.com with SMTP id 006d021491bc7-6a141094948so69815eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782912362; x=1783517162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELOPtvzNiOcxwPccfGZqo+Tk2G5SqUaj+xktV7uuecc=;
        b=pdZM1MPQlXVTR0gqNAz+j+A7s7pA7yaFk9blYekY/JBCVg9a5tCuGvsjhliY24aF2h
         /yDoQy325cKvLzzhApt4GZcrQ7cStFpdBc4ebXWmByOJ7lJ5a3Pjm081jRh65kJxZ81H
         zYRwaLw2THnCSP6gUpsE+JATbXtOnZyqLsKnydmCf1A0NA6Zbh6jRNMlNCknJ84tVvo/
         FwmKOQYSZy77LaVaS79FhvZ8HXfBpkQ4VzzJbcJJq0El0E9V5MWRB2ElpqaUojKLP+cW
         v0AbZVBAoe6AMqJ62IREUse6sQ9pkZ8R/QzQduDZoPVzCGwn6cLIktoB2hApfeAAXDKV
         Oasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912362; x=1783517162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ELOPtvzNiOcxwPccfGZqo+Tk2G5SqUaj+xktV7uuecc=;
        b=NpqHdlfZ+XHrCwmuKCxsFrD+WpBke57dQvFRA+/ibqQqGCZcw4ikGGfN3ShKc78oIw
         Z0UGegORCRzN98wbBJTKx65HLJUNrhLnXYwZzReYu1ceOvyVfYTV3Okg4vXj4s8RisDm
         5Oqs+nxMyIqMFZevh/ppVprcHLd59I6zjfd97ypvlqa3DqH5hzWOdAGIg/Ui7hAGP0Sh
         zTM+DVP12qHbF4YXEgy6WyUOyi92X7UROsErGupUV23Sr4/ww6M64N4EnlXQgv9iWcAK
         NuOocozYN6T4Oe7Zh9sLDRCvH62xf84D+DOeqso/mX/2qaTnoiWNHB2c6yIOcY9Y9RTQ
         HXIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Mp08+r/5/8ZQp50CDRNW/QLMudMpXtWLQljWN+Ay0Z92s5vs5WKEQWMat+0rkvQccOlDKQASkEWOu3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw14CmdZekTVo983nT12Wz9hN5fO0SunMYiJwh+5qh0XKApc+b9
	5lJy6wxtwbvXZ8xZPW1RjST1rlEE8QPZ1IOF0SKZmbY5Xm+mTHz9+7Tv
X-Gm-Gg: AfdE7cl1IIvHAqJ6ercjzmOaGNhBefO8ttTL+T2WUgsl0CLjPCiloJGiZtFuwcwkbw/
	uXAZvomYRyV0vFfPKokysjc9tPEF3RLC1OF3kp3gHFpwxAJemNTl//RwW2btOY+XKoy+IXcQ570
	ii4RC9sKCJj0jCzJZAVWYKx7L4RkVEj2fwIsDP8HmuNY5+CO855OQ9LOy9NNnVYJVNr4apNKIxU
	bTL76PfHs2FgLkEYlaitv+bclf+rQ/vX6VWJjJll5AeI2CneJIhItd/guhMMnYiPMkPZgOKLTIx
	WhZWZydi8s9vRWt296AvOZ/pY79PFNwviQmwOBnu3OUda5DhsB0zBGGRLBw2qT9WKWniNLvvJas
	1GXW6j0j0YgiZyEFaIaGV2Dj2OvDCgqftn1VQ7vMQqQT+zkJyhyk0wX2K2PCNGTSaXsC0lgYqB3
	htppMfGNTtEzODPEnSOZZKuW7pFF5uHcsFp8kcCPLtBdxM/ZIN9favnOY=
X-Received: by 2002:a05:6830:3e01:b0:7dc:e336:c828 with SMTP id 46e09a7af769-7eb48af3f30mr859806a34.10.1782912361959;
        Wed, 01 Jul 2026 06:26:01 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm4938144a34.27.2026.07.01.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:26:01 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH 2/3] dt-bindings: firmware: add mbedtee,rpc binding
Date: Wed,  1 Jul 2026 21:25:13 +0800
Message-ID: <20260701132514.186953-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_062603_144186_6EF8D31C 
X-CRM114-Status: GOOD (  17.42  )
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

Add YAML devicetree binding for the MbedTEE Trusted Execution
Environment driver.

The binding covers two platform configurations:
  - ARM/AArch64 (TrustZone, SMC): two reserved-memory regions
    (rpc-t2r-ring and rpc-t2r-shm) plus a GIC SPI edge interrupt
    for TEE-to-REE notifications.
  - RISC-V (IMSIC): three reserved-memory regions, adding
    rpc-r2t-ring for REE-to-TEE command submissions; no interrupts
    property (T2R notifications use IMSIC MSI allocated at runtime).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 .../bindings/firmware/mbedtee,rpc.yaml        | 221 ++++++++++++++++++
 1 file changed, 221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
new file mode 100644
index 0000000..08ae255
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,rpc.yaml
@@ -0,0 +1,221 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,rpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE Trusted Execution Environment
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  This binding describes the shared-memory regions used for RPC
+  communication between the Linux REE driver and MbedTEE OS.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain (same CPU cluster, coherent caches).
+
+  Two or three reserved-memory regions are required:
+
+    rpc-t2r-ring  ring buffer for TEE-to-REE notifications (all platforms)
+    rpc-t2r-shm   shared memory for TEE-to-REE RPC payloads (all platforms)
+    rpc-r2t-ring  ring buffer for REE-to-TEE command submissions (RISC-V only)
+
+  On ARM/AArch64 the transport uses SMC calls; TEE-to-REE
+  notifications use a GIC SPI edge interrupt.
+
+  On RISC-V the TEE notifies the REE via IMSIC MSI; the REE submits
+  commands via shared-memory rpc-r2t-ring that the TEE polls. No
+  REE-to-TEE interrupt is used. No SBI ecall is involved.
+
+properties:
+  $nodename:
+    const: mbedtee
+
+  compatible:
+    const: mbedtee,rpc
+
+  interrupts:
+    description:
+      GIC interrupt used by the TEE to notify the REE of pending RPC
+      responses (ARM/AArch64 only). Not present on RISC-V platforms which
+      use IMSIC platform MSI interrupts allocated dynamically at runtime.
+
+  msi-parent:
+    maxItems: 1
+    description:
+      IMSIC MSI controller used by the Linux driver to allocate the
+      TEE-to-REE notification interrupt on RISC-V platforms. Not present on
+      ARM/AArch64 platforms, which use the interrupts property.
+
+  memory-region:
+    minItems: 2
+    maxItems: 3
+    description:
+      References to reserved-memory regions for REE<->TEE communication.
+      Entries must match memory-region-names order.
+
+  memory-region-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      enum:
+        - rpc-t2r-ring
+        - rpc-t2r-shm
+        - rpc-r2t-ring
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      required:
+        - interrupts
+    then:
+      required:
+        - interrupts
+        - memory-region
+        - memory-region-names
+      properties:
+        msi-parent: false
+        memory-region:
+          minItems: 2
+          maxItems: 2
+        memory-region-names:
+          items:
+            - const: rpc-t2r-ring
+            - const: rpc-t2r-shm
+    else:
+      required:
+        - msi-parent
+        - memory-region
+        - memory-region-names
+      properties:
+        memory-region:
+          minItems: 3
+          maxItems: 3
+        memory-region-names:
+          items:
+            - const: rpc-t2r-ring
+            - const: rpc-t2r-shm
+            - const: rpc-r2t-ring
+
+additionalProperties: false
+
+examples:
+  - |
+    /* ARM TrustZone (SMC) */
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      gic: interrupt-controller@2f000000 {
+        compatible = "arm,gic-v3";
+        reg = <0 0x2f000000 0 0x10000>,
+              <0 0x2f100000 0 0x200000>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+      };
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        mbedtee_t2r_ring: rpc-t2r-ring@85f10000 {
+          reg = <0 0x85f10000 0 0x20000>;
+          no-map;
+        };
+
+        mbedtee_t2r_shm: rpc-t2r-shm@85f30000 {
+          reg = <0 0x85f30000 0 0x40000>;
+          no-map;
+        };
+      };
+
+      firmware {
+        mbedtee {
+          compatible = "mbedtee,rpc";
+          interrupt-parent = <&gic>;
+          interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+          memory-region = <&mbedtee_t2r_ring>, <&mbedtee_t2r_shm>;
+          memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm";
+        };
+      };
+    };
+
+  - |
+    /* RISC-V IMSIC (ring-buffer polling REE->TEE, MSI TEE->REE) */
+    / {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@0 {
+          device_type = "cpu";
+          reg = <0>;
+
+          cpu0_intc: interrupt-controller {
+            compatible = "riscv,cpu-intc";
+            interrupt-controller;
+            #interrupt-cells = <1>;
+          };
+        };
+      };
+
+      imsic: interrupt-controller@28000000 {
+        compatible = "qemu,imsics", "riscv,imsics";
+        reg = <0 0x28000000 0 0x1000>;
+        interrupts-extended = <&cpu0_intc 9>;
+        interrupt-controller;
+        #interrupt-cells = <0>;
+        msi-controller;
+        #msi-cells = <0>;
+        riscv,num-ids = <255>;
+      };
+
+      reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        rv_t2r_ring: rpc-t2r-ring@5f10000 {
+          reg = <0 0x5f10000 0 0x20000>;
+          no-map;
+        };
+
+        rv_t2r_shm: rpc-t2r-shm@5f30000 {
+          reg = <0 0x5f30000 0 0x40000>;
+          no-map;
+        };
+
+        rv_r2t_ring: rpc-r2t-ring@5f70000 {
+          reg = <0 0x5f70000 0 0x20000>;
+          no-map;
+        };
+      };
+
+      /*
+       * The riscv container avoids a duplicate /firmware/mbedtee path
+       * with the ARM example above when the DT checker concatenates
+       * examples into a single .dts.
+       */
+      riscv {
+        firmware {
+          mbedtee {
+            compatible = "mbedtee,rpc";
+            msi-parent = <&imsic>;
+            memory-region = <&rv_t2r_ring>, <&rv_t2r_shm>,
+                            <&rv_r2t_ring>;
+            memory-region-names = "rpc-t2r-ring", "rpc-t2r-shm",
+                                  "rpc-r2t-ring";
+          };
+        };
+      };
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
