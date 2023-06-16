Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4409CEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vcfy7SOC0LfUixsPK/uD9BjsjNw9vnhbgE/ZS/yLJIU=; b=xAJv6Pn1sOfnuw
	K1+iPXA1xNWe/4ka9mdnRElOoP9HYhl1JBHAovPahi+iJAjxeNBKLpCmtq+1zgCuKHv+CaSk/xIN+
	irUQUNFKsuZyTk7EtRSosi2QcdbVQvqRYpfVO7hO9581XTXux1xalfh0+QrWFVke92dDqjG1T9Rdm
	DpBBHNe70hzeRGN9HmnXBBa1DxAoztBafwokY4sldIT6eHgw5Pn3L6sY8if5N08XmfAIbgG7OJaFb
	I4H8GWC20MjHvr+q1lYZLgxcf9cO37yFyRRZRYTZbeirIB9e3NZW9RaBsdQ4zEkNYCtAt2qMgPJg6
	rQ84ZFYEEe5rZdxhhjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA31R-00H31U-12;
	Fri, 16 Jun 2023 06:33:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA31O-00H30C-1C
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 06:33:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so342369a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686897201; x=1689489201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+E9GNUVpev13YAg9DBkxIqHR4HyT2vWr1j4jNPBgL6s=;
        b=bZE3yEb4sbWGRu5PWYoEkhv0ZERLgUP1HmCsCGGPh270f/mYXpWtkHpOQtb5eHnQRf
         AfyibpT6bBu0TbdxD6Oy60lR0/Ccf/VOmVii6vt1dCBQT+zqn16499+oMEw75PNVuT6I
         o59WdRbKIO/KexXHUiWXdgmq1OG44e4RnZiU0EH8mKd9pCnqOC+fezodViMU2rEFQVYf
         bdG8TGqnpy4wHXYMPttBzJw8LQE3unM3f9ORI4DL1HfxnWut+AfKirXU1HFOoXCB6j91
         R19uQzzAkEuF1YbyIwkyYv8sy2xOOMyLtdRb3ROivlfTluJYUfdyb9cfrIeUuVnpIzL3
         4nJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686897201; x=1689489201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E9GNUVpev13YAg9DBkxIqHR4HyT2vWr1j4jNPBgL6s=;
        b=lxDrkwUIbMrdnFkZr0M5JkqdvE5lXj3wFDIR59phNhyKDYxK8h0DwE3PaYHQH9Kwlh
         eLIpC9Iz8f66ohLNHZauB1CQ1WWah29/Vhv6ABRHWfYAi87Rf5Lz1Y4W7+6jFbew7JsN
         1LLGfb8y3/n1UFSXUgJk13WqLBZQpz67HhzHEdGsRhC3YDJPa/C+sfWfm6A9Lcu8Cn/W
         X9PBMUdDyj7XH7akVkDU/WMUs9Qc1HkxY99zhjXhqNC61rYxXWoQZI30hDm/IJ1PacaL
         fJylIkNDlYHDnBZiQqaCSGoajCvBBUNAC3c+krwSAx+tYq1sxxJv3uwkf/r4I8AFGOe/
         tVnQ==
X-Gm-Message-State: AC+VfDy7cobdcKzxGRm68MgFjlUr682aKcca345sHX3THoLo+wB4+WGj
	TY6i/b+W5BVf3T+XNYXTSZjM1g==
X-Google-Smtp-Source: ACHHUZ5XeuETTVg3HS7ANsWZZaudTqsBAvzVANoKKQGWACp3oqIesLrX/wtyl3tWrLQLkk82CTT+AA==
X-Received: by 2002:a17:90a:ad89:b0:25e:a9d1:8ad4 with SMTP id s9-20020a17090aad8900b0025ea9d18ad4mr1319918pjq.17.1686897201373;
        Thu, 15 Jun 2023 23:33:21 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090a410b00b0025023726fc4sm617596pjf.26.2023.06.15.23.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 23:33:20 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	maz@kernel.org,
	chenhuacai@kernel.org,
	baolu.lu@linux.intel.com,
	will@kernel.org,
	kan.liang@linux.intel.com,
	nnac123@linux.ibm.com,
	pierre.gondois@arm.com,
	huangguangbin2@huawei.com,
	jgross@suse.com,
	chao.gao@intel.com,
	maobibo@loongson.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dslin1010@gmail.com
Cc: Eric Lin <eric.lin@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Nick Hu <nick.hu@sifive.com>
Subject: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2 cache controller
Date: Fri, 16 Jun 2023 14:32:10 +0800
Message-Id: <20230616063210.19063-4-eric.lin@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616063210.19063-1-eric.lin@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_233322_413966_76DF3457 
X-CRM114-Status: GOOD (  11.00  )
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

This add YAML DT binding documentation for SiFive Private L2
cache controller

Signed-off-by: Eric Lin <eric.lin@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Nick Hu <nick.hu@sifive.com>
---
 .../bindings/riscv/sifive,pL2Cache0.yaml      | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
new file mode 100644
index 000000000000..b5d8d4a39dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sifive,pL2Cache0.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (C) 2023 SiFive, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive,pL2Cache0.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SiFive Private L2 Cache Controller
+
+maintainers:
+  - Greentime Hu  <greentime.hu@sifive.com>
+  - Eric Lin      <eric.lin@sifive.com>
+
+description:
+  The SiFive Private L2 Cache Controller is per hart and communicates with both the upstream
+  L1 caches and downstream L3 cache or memory, enabling a high-performance cache subsystem.
+  All the properties in ePAPR/DeviceTree specification applies for this platform.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sifive,pL2Cache0
+          - sifive,pL2Cache1
+
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sifive,pL2Cache0
+          - sifive,pL2Cache1
+
+  cache-block-size:
+    const: 64
+
+  cache-level:
+    const: 2
+
+  cache-sets:
+    const: 512
+
+  cache-size:
+    const: 262144
+
+  cache-unified: true
+
+  reg:
+    maxItems: 1
+
+  next-level-cache: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - cache-block-size
+  - cache-level
+  - cache-sets
+  - cache-size
+  - cache-unified
+  - reg
+
+examples:
+  - |
+    pl2@10104000 {
+        compatible = "sifive,pL2Cache0";
+        cache-block-size = <64>;
+        cache-level = <2>;
+        cache-sets = <512>;
+        cache-size = <262144>;
+        cache-unified;
+        reg = <0x10104000 0x4000>;
+        next-level-cache = <&L4>;
+    };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
