Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D1DC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pabGVTUGAAEwIhASU/jzLCg5BkQRxdP9389qzQFKA2o=; b=4f7Q5cueS770ss
	tpViXTKUelVvUuWbmcz/B+V+mf6/WTlnz3D56AdH7dWG1sVrrw0G/ubvP6F8c2/IRJeGPrlwsNt1T
	zJ3F9+NnS9bKqX6DLzuhHpJJW6YpDsGheC940MnJzryicT5a05fQ8QqoJ7WsXJsusa/VgmGx1Ao1f
	nwoO0quagjka7DFgbF0RhP6d+LoDno1St7csT9OqM+B9Uc9ntpT6TPYFCjmAUrymTosZ771tGPC9w
	Muq7jJvw5xgSqvmt2WUj0VhgZCDwx2T5Zu2njP2CtJWV80gLOH8vSWspLErcA31HC1iIhJUWwEJK5
	38pPACPTZH0UHGd2NwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYT-000000066dH-0Cuj;
	Mon, 20 Jul 2026 07:36:49 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliYQ-000000066c7-2hc3
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:36:47 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-ca034c989e2so6505031a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533006; x=1785137806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdaqGWHkjITQmhPR3c1nuJGM5fgMQJ2LTHjMaX1w49Y=;
        b=C7yAThFnBY2U9s/QrfjGinxBXi5nakdsdLm2LEiZ7ehxkKNzJtD/vtDGXmu+Bs6T8V
         /2HoizZvfTpX1PtjCwRUBVsXyxes6eqxqDG05Tjbp79xMrlHAJb3O9O/rgzo7TIRLK7L
         Jyz4CN79k6aZk07Jabfa0H5rBTvtvkbNyd7OpL5vGUo0+DE/kPf5YZUdu6ffF0brexUU
         TKYnUCevm37Fg5JC6f63FqMPX7QhYaVOKMhnHDkNIyiYPosEJrXRSuwJHQ2Uu+1epebW
         99p0zirleQfwZ6O7IEhgtvjbjeO5Rut8wTg2vYUVFak/AeBfMBaCWkBbAJT0lWxNSI+f
         rSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533006; x=1785137806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdaqGWHkjITQmhPR3c1nuJGM5fgMQJ2LTHjMaX1w49Y=;
        b=Ip85ew7L4IwlP7aO4z33poeT31Wmpz56latmhmiWaImNhKUOYuRGc6CnrnsHGfYstr
         6310ZTeBbNOX1lKwa8vv7Te/QEKZ9W0ek5Kg4fD5IIdaOq7SFzA2/nwYJios/lfGpDkB
         g/2Vf8dJFEZaK8kAPEw15PcAJyB6PzKuBUgpWDmVhYM3PSIenzr2lJoJFq2TaDoctIwq
         4ZdeXdzsGHfe6+ycmIbcXR10AqBduhLRMHVo0+UXRKHCUZiEcWw+zmZ227PQk8naYx8C
         jV+VqqQWSwF3ryoj0Aob4yH9nk1LPqlsz2cC9pTw0DNLWO+GJZYQR06BE8fgpqnd4wnC
         yaJA==
X-Forwarded-Encrypted: i=1; AHgh+RoQFG5Q/PD/mOS2GJbajzAF3X7L+/0RCGcJ8CNHug8wRc1jQZv+S4fy6uu8TA+0rIT3yuvt16uPBo3zDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTkLQGT1ESuA2twSYpVqhjtDnXzVUdqq3l9rG9IQdi876azoE/
	b0TgjZFcOmHzHNAwQufuT5ZVjHFNNY/AlASjIXsYqDD6PFLd0NAN6OJi
X-Gm-Gg: AfdE7ck68gkp5VjchLfwENPIOfi+sPEIGwDIWThmBSuzvaeMS2eU6scooLTQ2SfFsaP
	fKGqsK7SNSQ3Jo7c50hJSgJUOZYHTczfQY0CI0zPg26Fbx5lh1kv/0qIoGNEc89TUyjJigFtyWG
	4OE9YPm38iwjDkZictFDItb7p53G8MrKX/CKGEyPeWoVdeXAUzw6m5dGwd2w2t6sksAKoiSbJ+m
	BLMKFmE7cWsj644FcPtxPYEnLvKHFdnw9qsWEDsgUxOyN/mQFSB5DBgH0tc6XNHWVGp5LeO7oPC
	GDgVfwrL7BKHIgCzDRXyfzFil4DaxFi3dgiXuA14fz2ZmswOc5dyLU6yBYBhaf+9Od9PrVoMMVN
	VwoS6Ft8usd/w1pRBewVqRIbf5gERouK6FP4MfwxrbDI+BDivj+YeF9JstzL9BJoHY2VNCIt0nb
	2b8do=
X-Received: by 2002:a05:6a00:190e:b0:847:b16b:46d9 with SMTP id d2e1a72fcca58-84c292efc9amr12800371b3a.34.1784533006047;
        Mon, 20 Jul 2026 00:36:46 -0700 (PDT)
Received: from ubuntu24.. ([216.23.123.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm5210536b3a.20.2026.07.20.00.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:36:45 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: firmware: add mbedtee,tee binding
Date: Mon, 20 Jul 2026 15:35:56 +0800
Message-ID: <20260720073558.799755-3-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720073558.799755-1-xing.xl.loong@gmail.com>
References: <20260720073558.799755-1-xing.xl.loong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_003646_690330_10A8B5D8 
X-CRM114-Status: GOOD (  14.30  )
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

 .../bindings/firmware/mbedtee,tee.yaml        | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml

diff --git a/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
new file mode 100644
index 0000000..a8f1201
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/mbedtee,tee.yaml
@@ -0,0 +1,109 @@
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
+  Two or three reserved-memory regions are required:
+    t2r-ring: ring buffer for TEE-to-REE notifications
+    t2r-shm:  shared memory for TEE-to-REE RPC payloads
+    r2t-ring: ring buffer for REE-to-TEE command submissions (RISC-V)
+
+  On ARM the transport uses SMC and a GIC SPI interrupt. On RISC-V
+  the transport uses shared-memory rings and IMSIC MSI; the TEE
+  polls r2t-ring for commands from the REE.
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
+        interrupts: false
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
