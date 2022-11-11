Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F49C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qecOGyjcQgS77jTmx+htIUJ5XWqWD3w6ysNK1jUr1BE=; b=IpWm7uur5A3so/
	dRSiDQVNQdiUwbXwNkHLEv0DdPa22+bA8S1B5oYghMxEQqWgSeP7+k5Lwr/Yfz7s5kqzhReYzjv5P
	/2QjH17BNcSgqM0ZEfW7LW1JTCG02roP5g12RJiaEZN/eIKx8ae1DMrmGWkcaOvb7WG4SUZ24Wxdt
	r1QwoTY2g+hQDvhtipJ1PUmv3+2JHvNnq4xgHM4IBGTK07ufhhEKhSMM399PFUDjyQ9uEUFHc4jZs
	SoQcx9sdhZoH5dbAGkTq4NTES0WyzgcJXt2NDECI3aDhs8a4VRtDduyvPHWDGKGlcqggKZbR2HvG5
	72YgVb4T9CG+kqvVLT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsz-00CzEX-K1; Fri, 11 Nov 2022 04:43:25 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsv-00CzAi-MI
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:43:23 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-13be3ef361dso4330704fac.12
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88dbZKnLEUx7Ht3ijEWLgxbktVAqIkhhdLqR4LLY0Pg=;
        b=bv6ABeD0FMYwosnkSOwSDcCdQ0TnBV/dnIsn2N7jCXZAmg2jAQy6p247q6+2vaHGZw
         vOGbJQZ+584D2/VmgsF1o+w17/Xybk9XUDhXqKyH71c9F8kK5bjjbG4wguGyWTFO774j
         2s1RnnOwx7aGHKfuKC8002TnsCQao6J/S8GVHcd8d3MiSN1NcJ+6qKhpYaf3B4tU/Yfk
         bW80dr0z2Dume1ve0WXk1Kj+8DuahSjIcX7S/1wfLz/fl9UNRBZ2X1u/N3JvCEuMoCgm
         UweVvUYWIR5EKPyJId6E2EisaZhpDSOKXjRBN9tNaWQMNmxzhAXP4vTkHu73hEA5bzxk
         RAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88dbZKnLEUx7Ht3ijEWLgxbktVAqIkhhdLqR4LLY0Pg=;
        b=cN2pHiI+EQeiphf0dNxY9Og6Dq8VVzDf1drLa5Wg6RWL6PU4jPWYMTi+yicxS6djfa
         SAnKW0C4MwReN5h9+YOklT3XHQC2rzBQA5vMJMJ6mr6UsXDemm6Rip0pMkLE6Q2I9oX7
         FgJK5zTbCBtT6+2VnT5mvhM+9Cmzs+Z6L8iep4HXsyCU8CreNiH/V0HxgfdozdlnD3w8
         sxES/OMxD6Lhlx/utMuLPkUqqyhxplS1TGtqAkWKNoGhhe2yfnZ+eQrH08nPVd13CiE1
         glAIA499isahcuOeSpmcKcQUsgRCx7jZ2+1OxZtsviVjgWWFi+t+cAXQH/92+5S+rDXS
         VCkg==
X-Gm-Message-State: ANoB5pkngpgF7jJegdClkX2y9NqSeuOITDb16aSnc0Al6hgJaodDobYS
	1A56Wih31hRblk/28/DTEyCgHA==
X-Google-Smtp-Source: AA0mqf6CqtSOVM274vgjmTQ112E0vxr/SpLMG1AlHX7CjYrn05YgouV1wHjkvregNZxrS8J6nwtsGA==
X-Received: by 2002:a05:6870:b01f:b0:13b:2f1f:8327 with SMTP id y31-20020a056870b01f00b0013b2f1f8327mr30099oae.15.1668141797235;
        Thu, 10 Nov 2022 20:43:17 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:43:17 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
Date: Fri, 11 Nov 2022 10:12:04 +0530
Message-Id: <20221111044207.1478350-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204321_778054_C7E88F35 
X-CRM114-Status: GOOD (  15.09  )
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

We add DT bindings document for RISC-V advanced platform level interrupt
controller (APLIC) defined by the RISC-V advanced interrupt architecture
(AIA) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../interrupt-controller/riscv,aplic.yaml     | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
new file mode 100644
index 000000000000..0aa48571f3bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,aplic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Advancded Platform Level Interrupt Controller (APLIC)
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description:
+  The RISC-V advanced interrupt architecture (AIA) defines advanced platform
+  level interrupt controller (APLIC) for handling wired interrupts in a
+  RISC-V platform. The RISC-V AIA specification can be found at
+  https://github.com/riscv/riscv-aia.
+
+  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
+  interrupt sources connect to the root domain which can further delegate
+  interrupts to child domains. We have one device tree node for each APLIC
+  domain.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - vendor,chip-aplic
+      - const: riscv,aplic
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 16384
+    description:
+      The presence of this property implies that given APLIC domain directly
+      injects external interrupts to a set of RISC-V HARTS (or CPUs). Each
+      node pointed to should be a riscv,cpu-intc node, which has a riscv node
+      (i.e. RISC-V HART) as parent.
+
+  msi-parent:
+    description:
+      The presence of this property implies that given APLIC domain forwards
+      wired interrupts as MSIs to a AIA incoming message signaled interrupt
+      controller (IMSIC). This property should be considered only when the
+      interrupts-extended property is absent.
+
+  riscv,num-sources:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 1
+    maximum: 1023
+    description:
+      Specifies how many wired interrupts are supported by this APLIC domain.
+
+  riscv,children:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    minItems: 1
+    maxItems: 1024
+    description:
+      This property represents a list of child APLIC domains for the given
+      APLIC domain. Each child APLIC domain is assigned child index in
+      increasing order with the first child APLIC domain assigned child
+      index 0. The APLIC domain child index is used by firmware to delegate
+      interrupts from the given APLIC domain to a particular child APLIC
+      domain.
+
+  riscv,delegate:
+    $ref: '/schemas/types.yaml#/definitions/phandle-array'
+    minItems: 1
+    maxItems: 1024
+    description:
+      This property represents a interrupt delegation list where each entry
+      is a triple consisting of child APLIC domain phandle, first interrupt
+      number, and last interrupt number. The firmware will configure interrupt
+      delegation registers based on interrupt delegation list.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - riscv,num-sources
+
+examples:
+  - |
+    // Example 1 (APIC domain directly injecting interrupt to HARTs):
+
+    aplic0: interrupt-controller@c000000 {
+      compatible = "vendor,chip-aplic", "riscv,aplic";
+      interrupts-extended = <&cpu1_intc 11>,
+                            <&cpu2_intc 11>,
+                            <&cpu3_intc 11>,
+                            <&cpu4_intc 11>;
+      reg = <0xc000000 0x4080>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+      riscv,children = <&aplic1>;
+      riscv,delegate = <&aplic1 1 63>;
+    };
+
+    aplic1: interrupt-controller@d000000 {
+      compatible = "vendor,chip-aplic", "riscv,aplic";
+      interrupts-extended = <&cpu1_intc 9>,
+                            <&cpu2_intc 9>,
+                            <&cpu3_intc 9>,
+                            <&cpu4_intc 9>;
+      reg = <0xd000000 0x4080>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+    };
+
+  - |
+    // Example 2 (APIC domain forwarding interrupts as MSIs):
+
+    interrupt-controller@d000000 {
+      compatible = "vendor,chip-aplic", "riscv,aplic";
+      msi-parent = <&imsics>;
+      reg = <0xd000000 0x4000>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      riscv,num-sources = <63>;
+    };
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
