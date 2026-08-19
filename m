Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DE0C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40NUHbfa2IteNwfSzSPIsy43Z0KF424NssPqK91Ha38=; b=N+pYLZgL3zOeZb
	zt6KHKRvonmOolt916ZA6hh6rusJBrFP6nwCuw+QV6Pg12a7xH49p4ZqSLrk1yqBfu50dt2rH3m8X
	7OXOD+sQ7MtUJddlnh3dYCooEeTWoSlB81ERdusc/83heRluY7lRUN84BzkG1+Kl1zKg6AViHggMs
	mAHUhQex7HqZxH32UVSIoX9I4EaXju9KK3Q8RornG8EgWyiukBDhRX3lljpUoiWs01fO6XfOAzsv6
	/FR406tqU3bMHSBobkVXQ9c2kVcf0ihO9D1BdlbIEfRgeUElGhEDxJTVCZqg4Z7AOPOH4OVk+cK45
	jIo1RmT2GgTPD185as6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmz-00000009Jye-1oAR;
	Wed, 19 Aug 2026 08:36:49 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbmw-00000009JxU-0Osw
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 08:36:47 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca92f36c4acso183521a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787128605; x=1787733405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/nqPj16def9ZnxDQwFpTtIBuj8LfIQAUc8OONxlNco=;
        b=EF6peuGuSw58agYyPHZK/WS8aemJgbVP6w/z9SIzm4UFdAje6lYOR3gGyp9HQJjhRB
         DL5IFSDqa7lcOv/lJG84q3ZS8IGmZk3x8uCZLUluL9YaN/0tSU88z1pn0PSBC6ieW8fM
         asBFCEFXKsyrvO4LmTpEIVd4bvsxkTNIp6LTWMFxXGDF2d+Fm9oHk8eGR+8JoOuhjwqq
         WBKY1R0k4sh96NBrgVUJKSGTal1oHfiiU+sH9D3hTw4+2ElQ2HY5eGarwmsBhwbOhwN0
         xNclbVumFXymN/JO8+WKE32cWdA6V9qxaAtV1qWdXNMIt60ZFx8EFaHgq1wEEUBGR+Oh
         7bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787128605; x=1787733405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/nqPj16def9ZnxDQwFpTtIBuj8LfIQAUc8OONxlNco=;
        b=nEHZU+mctzZg9/feZyS3k8VrQrt4rOKaAzgKD+I8XCmWUXP9RFS7smEEQ7O+RdvRKj
         KGimPSWy7gmdiO7Jm00GsfsY3fMbG8yTlvpDwiVSBIH5CStXVUQFUTkT5SbqESVgjNAo
         tDh1MCl6UzGm4Wvm/b7eLGIUT1LEfqSnO6eTQgMFRFjrHc+cDSCkCD7jIng9gYiyubTg
         SUf+t+EJSxbTapHihtmw9O2NdOjStvNUhJ0k7Y3c/r0b4ITYL2LbT3rnIH6tHsqmOpoa
         +cLRKPcDwAoy4tfpo+g96i2JkwUcyUs64cVaggElN/jtkrQ+R3pUWUEKHTWT6ELGyc0w
         e1Xg==
X-Forwarded-Encrypted: i=1; AHgh+Rq52BwgkqCcMvr7G3L6EYKrNCdFWqO0knHbQsEQY5J3gJHDsUW5AWKWgBDvTHcdv2kQEk1ZIA0JoBN6OA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz88f6x6GZwfrnzfr+QcMxWAzo1rheU++7sX+K8SBGvKk8ShVws
	7uqyvFtHA9VJg3H1CTEYTiqEauQ8SmoAY9axwg9zO+X4AXCsATdkPXzX
X-Gm-Gg: AR+sD12XjpxXooKEbLfxLEsdUhev7WIkuaS425MFMCCEudapD0b0QmUcgEeuzjQkPBX
	5DTQ7GyY7+A94JSDxoFZcUmzKvcNhKker9Q06Qb9A1fsGrhYpLc9Rktqk27Jwk8u99Isiq+RrvV
	ZnTKH2kmBoL27k3ktwHMYrVwFwDwHwsT6z29FN1beXP0epCDHuLmwBsN8X8W89/p1rx2bmN5jWC
	DmImoyNdmCmCjw+bbdqJkh2Ptj4dzrVpaZ1L64ebqxDb2oMVGwRA5ehUv8ArI3DsKMlrGdGa0t2
	/Z1h88OlQuNGnUJnMqJZQsyGpg3QhcULo9ebGl2IrTP36Lhdeea7BD/ril2d3iX6HWSdRNy/YNf
	+qRXobLuHxdaU0rJUy9tU0BL1LCruTVWfx3ShUv6wQ678hgNBZCTLFdRp/yLA72ZbL5Q7KOoOyp
	Sztux86ioNt2DZ5adkIECuyat5gJR2IlLBgWemgbfxOeIudTW7x48DXtDtemwajzE=
X-Received: by 2002:a05:6300:2284:b0:3b4:5ff3:45cb with SMTP id adf61e73a8af0-3cd00e24fb6mr6745037637.8.1787128605149;
        Wed, 19 Aug 2026 01:36:45 -0700 (PDT)
Received: from ubuntu24.. ([85.149.220.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm332268a12.14.2026.08.19.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:36:43 -0700 (PDT)
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
Subject: [PATCH v4 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Wed, 19 Aug 2026 16:35:58 +0800
Message-ID: <20260819083559.1303348-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
References: <20260819083559.1303348-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_013646_145082_BF44453D 
X-CRM114-Status: GOOD (  14.74  )
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
Changes in v4:
- Move reserved-memory region descriptions into memory-region-names
  property (Rob)
- Define memory-region-names item order at top level; keep per-branch
  name count constraints (maxItems: 2 / minItems: 3) (Rob)

Changes in v3:
- Drop all phandle stub nodes from examples.
- Remove redundant required: - interrupts from then branch.
- Simplify title and description.

Changes in v2:
- Fix DT binding review comments from Krzysztof Kozlowski:
  - Drop $nodename, "YAML devicetree binding" wording, property descriptions
  - Rename compatible string to mbedtee,tee
  - Rename memory regions: rpc-t2r-ring -> t2r-ring, rpc-t2r-shm -> t2r-shm,
    rpc-r2t-ring -> r2t-ring
  - Add memory-region / memory-region-names to required
  - Simplify allOf constraints (drop redundant else-branch items)
  - Rewrite description to describe hardware/firmware, not the binding or driver
  - Drop all irrelevant platform nodes (gic, cpus, reserved-memory)
  - Add maxItems: 1 constraint to interrupts property (Sashiko AI review)

---
 .../bindings/firmware/mbedtee,tee.yaml        | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..a67ac43
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/mbedtee,tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MbedTEE
+
+maintainers:
+  - Xing Loong <xing.xl.loong@gmail.com>
+
+description: |
+  MbedTEE is a Trusted Execution Environment for embedded systems.
+  It communicates with the REE (Linux) via shared-memory ring
+  buffers using a fixed RPC protocol.
+
+  We're using "mbedtee" as the vendor prefix for the open-source TEE
+  project at https://github.com/mbedtee.
+
+  The REE and TEE CPUs sharing the RPC memory must be in a
+  hardware-coherent domain.
+
+  Two or three reserved-memory regions are required. On ARM the
+  transport uses SMC and a GIC SPI interrupt. On RISC-V the
+  transport uses shared-memory rings and IMSIC MSI; the TEE polls
+  r2t-ring for commands from the REE.
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
+
+  memory-region-names:
+    description: |
+      t2r-ring: ring buffer for TEE-to-REE notifications
+      t2r-shm:  shared memory for TEE-to-REE RPC payloads
+      r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)
+    minItems: 2
+    items:
+      - const: t2r-ring
+      - const: t2r-shm
+      - const: r2t-ring
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
+      properties:
+        msi-parent: false
+        memory-region:
+          maxItems: 2
+        memory-region-names:
+          maxItems: 2
+    else:
+      required:
+        - msi-parent
+      properties:
+        interrupts: false
+        memory-region:
+          minItems: 3
+        memory-region-names:
+          minItems: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    firmware {
+        mbedtee {
+            compatible = "mbedtee,tee";
+            interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+            memory-region = <&t2r_ring>, <&t2r_shm>;
+            memory-region-names = "t2r-ring", "t2r-shm";
+        };
+    };
+
+  - |
+    firmware {
+        mbedtee {
+            compatible = "mbedtee,tee";
+            msi-parent = <&imsic>;
+            memory-region = <&t2r_ring>, <&t2r_shm>, <&r2t_ring>;
+            memory-region-names = "t2r-ring", "t2r-shm", "r2t-ring";
+        };
+    };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
