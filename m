Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AE3C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 05:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KdXa5MMJvBNh0yOmijPkEBLZnCKTVnEJKEMGZThxPg=; b=J7D5U8YPwui8VT
	HlWniCarHaF/+YP3ganbBNXxrtQwlXi+Gk4bgX+WujOyaWHn+16Gqf+G0vrIwu1mbljeLs19Ce4T1
	mSud+hi5kiCgmj42MFQRoNin/AN6lhJc0bP8bJvWz/wfwanYmbm3HqdNcHvvIB0eNGG2oWwvWMGHG
	3vHT1PIVt9Lwf2p1aJZ6XDCGlbJffWmk+zJX4kSUetOWAm/g2/QC04qCEAbAEuaKQQ7DrbuGDqEWy
	ujQKF4NfFhifo8i4arAj4kfhZLqEuVMEmw1Gr5WJ15DSY79pkUfxVXtWCANwWGsrrGgs45HDq3Yoi
	VdrWNkJq/m2QjhrGSxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUhV-000000003Wv-13Yr;
	Sat, 25 Jul 2026 05:13:29 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUhS-000000003W6-14We
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 05:13:27 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so898478a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 22:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956405; x=1785561205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=Bilk6lK93oxvTJOOwqLecsyFUMm7vsQdKbdY8/u/Ce1H9n5UJqwB/E9THWaY2z+58P
         jhP54pSjH/GT1pJ+EeT26ArDyKBQSEkG55LrasYkoUHIeojlHBbxZ1PXVY/ZPwALX2WO
         Az9LRNdvxOcJSb+fIs/RQBDl56nz1RRU0Kf9/KACUun68AB7nu+E01UsHYda177dUkZk
         kPIztu9mB780NpQnpJCK9l1vQFF97eyn3RcqCxRtfbQTBxvZsgeM6Jl3kfPc23hYhnRA
         Qw/8I5/+OJ63CNk/K2w2gWjUUpz1rI1qsu6gMgZVJjeIh3BSzwrVUNH8MdLx2hpz0xlV
         UorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956405; x=1785561205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fhok3rvowf2V2ZvTr/zIVWuKYiTyiporNQXpy3ArInQ=;
        b=bMnYo6Vkhdz2ywNbWwrdTfGGx181bvDoe0fU3OA53Fg6ZYyONs+8oyYQ4eDOm+l8Xz
         NonCma3MBEBvtbYNnfBblcqRImdWJI8DNOBe6TzFpjpa8ZAya2pwex3KN/L+che/vDGW
         q53pQnGEAOmwoIc3tV1kx+IUnx9+AHYPkcPTbYdoz0Tx3z/pkiMP/4g1Y8U7085n0lfv
         5vEh6Chqqwpqi6Ehg7vHuUE+l34M90eHZgiNTpKM4PrcIwxif1HbRVA3HON3QvTAyvPI
         10VI09V4bF+Mv5WB6+xeSbKVIaKffiDn4dE46XADxryzuF8FGQG3l7aAIqdkADPNBnzU
         nPgg==
X-Forwarded-Encrypted: i=1; AHgh+Rpvbk3ePV5YAGICgsRmsMTIsjtNdmqYQkJe2DXPGVzlOMxHlZ3Y90k0Y/PW9TebjzALnEgmyFJR7DoKzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXeAucRpNCgCze4XheXq+yZYdPkwmYMp9DNEL1YDyXDXONqtM5
	I5FRaLxJo0+ViOSlyKhvwJiLGzlr+kmnYPyGgVblhJMa71O+efUD8w/mLpQtgkGYpHYbwQ==
X-Gm-Gg: AR+sD10FJOtsAPI1/h9IzHBuX1KAuiIo59U7jQBQzNZapkjRbqgRkCa92rKXesvZGKR
	WCoHyPuAmNji1BzbnI8mcUHPAM1YdSwgbcVAoId6TrfxCr0QJo61U0pRqIu/YKWH2cMfs5fmOky
	9PqbkXoNW53qu6ccd28RjPb2Iz4lEwATXthIuRsa2HnYDT5oYFgpH7EhlsqbkIVJxtRjqAW9Gef
	KZ1Uv2pmzSh3jEuFA3XES6Ua8N/4FCQJ3fblxn/l/MGPKD+Rvhakf26TAeDymMNjNmFAqZUmtGp
	nFSynevRljxVwRdK1B1igXSGQt27geFYB1BEnfxdFWipet7z2KJd4gSKSpUE263gz101zM8aDjO
	bc1E/g+OQiiTv699E5lLP1T4pLRKcTQYPylB5MuTBlLFLkNHrwCj2az0UvsD5w5mHZg==
X-Received: by 2002:aa7:8885:0:b0:84e:2bb:2d3e with SMTP id d2e1a72fcca58-84e594330edmr623584b3a.9.1784949446508;
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:26 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:34 -0400
Subject: [PATCH 02/17] dt-bindings: phy: add SpacemiT K3 Innosilicon DP PHY
MIME-Version: 1.0
Message-Id: <20260724-k3-display-v1-2-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_221326_306984_8FE88F16 
X-CRM114-Status: GOOD (  12.32  )
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

The SpacemiT K3 DisplayPort controller drives its four transmit lanes
through an integrated Innosilicon DP PHY, one PHY per controller. Add a
binding so the controller can reference its transmit PHY and the pixel
clock the PHY's PLL sources.

The PHY's registers are interleaved with its parent controller's inside
one MMIO window, so it owns neither a reg nor a reset and is modelled as
a child of the controller.

It exposes its PLL-generated pixel clock through #clock-cells, so the
APMU pixel-clock mux can select it as a parent through the clock
framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../bindings/phy/spacemit,k3-inno-dp-phy.yaml      | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
new file mode 100644
index 000000000000..f8f1ef372951
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/spacemit,k3-inno-dp-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort PHY
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon four-lane DisplayPort transmit PHY integrated in the SpacemiT
+  K3 SoC, one per DisplayPort controller. Its registers are interleaved with
+  the controller's own inside a single register window, so it is described as
+  a child of the controller and owns neither a reg nor a reset.
+
+  The PHY provides the pixel clock its PLL generates, which the APMU
+  pixel-clock mux takes as one of its inputs.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp-phy
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy {
+        compatible = "spacemit,k3-inno-dp-phy";
+        #phy-cells = <0>;
+        #clock-cells = <0>;
+        clock-output-names = "edp0_pll_pxclk";
+    };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
