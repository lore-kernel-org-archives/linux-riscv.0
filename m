Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A11ECA0EFC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4P14cdwKaZafrKcaeyb7pHXpCiZgzKo8XB0KtANVM4=; b=J1qiAhyXHAuV53
	ajQj0wPtRqrg4CwBu4PdgSSDPlgAjWb3fU1wEC1ABne5276rMJNdUalJqc4rXWZFPRUirt7u3celW
	5ibq9ogc/6sHM3pyxfd6c2AMlgr0pFovKVBtNH1BcHfS9SXMJa77qYs33zkhAZy/3Vu1TKUf2cOny
	TOegnlNaAYlmg7ryYfVo4YgLsQCn264nQTV6ROIiOd3GipGtmemTAFYyTFy1dw6njxbmg08sXqE9G
	5G7JXp7FyW5+Rmsnlb31ZyIlQkE2AsCFGyrhFtEbmIcfvQoFEaQmrZZ7JRmIRG0LrfGLzKluQbSKB
	yGTZ7OP9YQTycv+8Mwcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqr-00000002I7e-1Bh4;
	Fri, 22 Aug 2025 11:22:33 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI6z-00000001LHu-2Egb
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:06:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-324e7600bf0so1718807a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832001; x=1756436801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaYtJX2FWb8MRA+YGF1PwcizqXL95f52x/ivDYOROU8=;
        b=ESaMKTduKbTlPEGlWfMTDlnjVGfmI1CuwMQG7UThb4hSsCKOtp5f8pqhUTWpPZdjPq
         S57Q4BXDQ/pe3yZ3P5+S23/+c9e5SIAjVZxu3hGgxGfTEFJ2WrtPRCRytNtqGQOBSxqd
         z9RnKOg7AjEibvu4cMAveopTp5PgIczNT9jb9TgmQpUGCPh9yRRZkkP9pksuFOs6CQJk
         kMC+cRNRiSozHLO1Dqkas01pZZkiabLOhbShxrt6t+VpZoABKnvf54r+hg3T9lWqgkHZ
         nuzgM/sddOhegtkeRyFR4aeuexGraUkdJos3VW4NpaadfCwESX3KW+bUQwqrO791emHb
         VAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832001; x=1756436801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaYtJX2FWb8MRA+YGF1PwcizqXL95f52x/ivDYOROU8=;
        b=BPEu5oYq58mazCbOcBKKjpOF9L2nPYvqPU41rRZcdCmJz8McEb4aY3wJSes+MSyQJT
         97PwdGWwJljITMXsHn5qdVQs9+vk5/Md9LlRpwertcIm6sesQjCClotT50H2DQIoXsqN
         VqKzJ+xPoYZd7aifsNh/L8m/IQFmTTRpObi+xPxYP4ILL1Gy4F1Rvqa9v46rjJ9OPwRg
         AH5uQBpfEe7hJ3pzyZI0OVV/DIJ7Y6s+ES2I1bjqPi3TpRq56rtaQBHxrzJB8jKKY/hF
         jv9CRtkqAI7sJ24IofORqsQcQ4xG6FP9aXMl7dMToae+dLSmUgRDwgZjodUiwCaKA1MC
         wDUA==
X-Forwarded-Encrypted: i=1; AJvYcCWKwkDh5V61DhVHAd94pgEThWe8CHOVaAya2ht4t6wqUoY8UoBqNpDX9GC7I2ZnI7HTT96HqhJGYnBwdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsBR/ZrKJwlZd0qHAo8UrriP3Dl2MkniMuWWuHji3LW2XqQ6f3
	RyU06Z4ynzRT3DkwpNUYQljQBI+LieFAr4atj46ea2DNn9G6zm18PhLdcODV+cuj3T4=
X-Gm-Gg: ASbGncu8/LdOgq8ytQJVylPAHzcrXAxK0l9ywa67OHs15fxoYbncsC/7ia/gitjTm7h
	LjMiOnWvse7vNoAOL8XwDoqjwdAHKr95yThNMF2eIHrqo4fsHNYxrGO/WtYQDKqlFh4iDsCt0yd
	qzv/0xUm0Yry0ves4Gj2D8xkIXe/Qzg6LjrSLW74zgbCL6k/s4M0AOtxPTFp57Zl0Gmawj8+cKB
	FAv2rc8VkUUwLGR+dS8nPAqpqnZArc8tCGZjKyJspEm/+NJUQBSfZEnRtyQLUXwIPzbAzcKVZOT
	w6IpaEhJKUWnVhVjVe9Ad5N3SbUEE13qpT9ctZ1Yr1gp16Wr7+8jCwLzptj6Bh1isQhe6D6DqD+
	j/pfHmUWpe0iSlGSrnZoYhsWdbgcZNwGWow==
X-Google-Smtp-Source: AGHT+IHtoiI+ywaKLlu/wESYvwFaF1Wdo5+3G/aByEkmXZSAYsSzFIutpoI18vcBU1inhQ9OszGlwA==
X-Received: by 2002:a17:90b:2c84:b0:31f:ad:aa1b with SMTP id 98e67ed59e1d1-32515e3bfd0mr2287803a91.3.1755832000590;
        Thu, 21 Aug 2025 20:06:40 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:40 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:27 +0800
Subject: [PATCH v5 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-1-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200641_581712_F14C7459 
X-CRM114-Status: GOOD (  10.64  )
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

Add device tree binding documentation for the SpacemiT K1 PDMA
controller.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v5: No change.
v4: Add Rob's reviewed-by.
v3: New patch.
---
 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ec06235baf5ca3ecffe7dba9bb425b242985660e
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/spacemit,k1-pdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PDMA Controller
+
+maintainers:
+  - Guodong Xu <guodong@riscstar.com>
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+properties:
+  compatible:
+    const: spacemit,k1-pdma
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Shared interrupt for all DMA channels
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  dma-channels:
+    maximum: 16
+
+  '#dma-cells':
+    const: 1
+    description:
+      The DMA request number for the peripheral device.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - dma-channels
+  - '#dma-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k1-syscon.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        dma-controller@d4000000 {
+            compatible = "spacemit,k1-pdma";
+            reg = <0x0 0xd4000000 0x0 0x4000>;
+            interrupts = <72>;
+            clocks = <&syscon_apmu CLK_DMA>;
+            resets = <&syscon_apmu RESET_DMA>;
+            dma-channels = <16>;
+            #dma-cells = <1>;
+        };
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
