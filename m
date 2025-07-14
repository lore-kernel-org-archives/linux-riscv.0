Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E5C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 10:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRvUbhRvvx7tfxWV9DkYOSIXw9RU98BVCiPgvJOwxuw=; b=cTN0YLFlR9MVD0
	yURYn1b84oJJnP/9mLzzgzMJJhcIqfQT0f+Vbghr+bosXTBhsU2snBFbfntflOP5v2egEhLOjIkEN
	aqUQ1T1eUPkuY7yRRWxQNom+sMvwVVBwxv3gdqiXYmOoyYwN3dvKad75D/7hG7YEyq7X5TqMhk735
	3nFxNKH0LGlF2EmNlqcGsCuS2wjqxt27GB7FMlAxABjV0Jnj3kDLIu4LQfgUD0ViG8VqSVcF6jkap
	uJNiEz7DMceRGksOBg5tZXOOVRjwFCTOXHBEOpzCX4PPYYiTbJQwdYXmmdPzm0/7yYKBQGOeZwys7
	VQ7kqTEQxjRPGb9LLtHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyK-00000001rSR-29zb;
	Mon, 14 Jul 2025 09:59:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFfY-00000001o6D-3j6A
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-451d6ade159so29559505e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486019; x=1753090819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNWYOZeX7/6WvQlTq10OWDC/eEvu8idMvnYMiM3ozYE=;
        b=ySKcC/P4FGdJxkbJy6LLK67MdySd8uaeaiZNXy7222U8PJkAaS0PrAwCeHa+cMSrPS
         GvtX0NC+KsfBK3U4IyWKf7C8beAljBzfNa5+8zRSmduQtmG/ZWVSWKcQricVK5S1Hqm6
         dUKqNWgem+8erBGm68CGql0oW5dTXb5MRQk/oruqruomcqQTLaHUuRfGOxIkl+c7h0Gh
         Qm3EclQ3727lwuFtd9PJTHCCAHCU5iqBID6+Ed6G3cMeRhqYmbTvnnYbDXaQTrvUgOIZ
         YTv8rT12Cnhw2jHgYS0W4O3aPbeP/pIG8eQzdTnEFqNfuDBOg3ja+5vc/NLkOHWresGe
         xBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486019; x=1753090819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNWYOZeX7/6WvQlTq10OWDC/eEvu8idMvnYMiM3ozYE=;
        b=GQfx8Vykalu71WH/qC7w5QdV4PPd0apA1EMjdfMfIlTKPgRjwarxr73qYhRtTDxeaT
         VPgsWJnAb60TKwsMkohercYY/MaIR2+0G2t/stPCGU8HvtjbwkDP8w/JXTu9to3XvTfL
         D39yxHL6hGZnymlYixVjKAs9CRtZQWlBkMLT1946mKVRM9YzMIEwYCE3ayQ+8CbXPCPL
         bABVVwT5G5srJltoAi5zkT2OrTbe57pp39dXYwPEEkyxgNFsv6at9wcombPBDULDz0g1
         ROeId0SJLFUCwKl+nmROCmlOxFoIzDOsNteDFgtnmDMhQegyiW8Ehim3fFRXL3osaZM5
         AMDw==
X-Forwarded-Encrypted: i=1; AJvYcCXFHaWUuYtfNzAoQfvReD8ertX1k+L06gQn+Y546A/3EifZPljjbkIhnAdDCmk7Gr1fhmudsEe3rMp8iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhy7jymfGXab6g5m7i24EHfT67+y1X+uLWb/8efUPZcy3Pbw/7
	+V7fFl20JpbyFmlvJLyVLVaRkv4yDb7/5iz6W7E9KEaVk6MNwvYab6dZhTFJEs1BY+g=
X-Gm-Gg: ASbGncvnlhd6sAdbPd+mJf3gB/tJSUV5N7fJH6g52930zjNZhXfgsunr1Qz/ZjcbOhR
	5heKZBw67lIWMRX1aZE2JovoZXVnH4ro3aKFUVpgdgVnSfKqHquk/RqmVMLYSVPAsDsjXMlVqMx
	NnNLFu95iYiY8HQ1TrhIoRWVrwnLT+ANDxkFXuR0IDVDs/odZejBKji8myO7Ovh5PDbfQBcZbi6
	PAkKfynyuC8o6EF3Jkiz8jVx88WQDypTlSKzOZKzRRvLHciIL407zdKmb7lhuwXufg0LlFIG9fU
	b5dNIPOGLD56gKEXeWdu4cV+kc+epVstjetxC3KMZtvesb3FPsh5+VEzPh9SgX3mdPocGjFp9g=
	=
X-Google-Smtp-Source: AGHT+IH7LWrI288pfqr0DobhXiBAETFLObRARl9QHaXZq8n40/zrMI7hQXZgqc6YvjtV174ymKHG1A==
X-Received: by 2002:a05:600c:8b55:b0:456:1204:e7e2 with SMTP id 5b1f17b1804b1-4561204eb05mr46649275e9.12.1752486019172;
        Mon, 14 Jul 2025 02:40:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:18 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:28 +0800
Subject: [PATCH v3 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024020_934152_17FF7F94 
X-CRM114-Status: GOOD (  10.85  )
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
---
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
