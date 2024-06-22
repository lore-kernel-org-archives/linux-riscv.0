Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF2EC41513
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jun 2024 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkzj99fRCD2j6USrBUuX8FqKCN2onO3eqlDRim0zlOc=; b=chM+IN+s+9MuEu
	9/ZO3bxiZ4FwXbQOqfprbz/644BXVTrEwscr15XknI1ufSh/ACYqigsosNJVIyU2Jc/KCo0OayVX1
	T1IZukalK/Imu3aBQtpMONYNBnRa7+iVz1Bci0sWsxnqUtaBhW9+3pMH0ihEqCE9gF8iFSJyXcidt
	JdUqMHuAhch737xt6N9LTA6ziglSc2pSLXAd/ZAuhsMQrxYfvOnJVRGArLBfYOQcJ5Z7qc6rozl5p
	w+oOaLyh3v4ySs0Tvxc3cWqW7Noq7cnEz0STMfIaQe48jg64nMD3h0Vmg1qLlwdDhfIip8g14wkpp
	FG5hobyEGXTPhoiZuDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2LG-0000000CIF1-3Ain;
	Sat, 22 Jun 2024 15:07:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL2L3-0000000CI7G-1eBR;
	Sat, 22 Jun 2024 15:07:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C4CDCE091F;
	Sat, 22 Jun 2024 15:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67ADC4AF0A;
	Sat, 22 Jun 2024 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719068854;
	bh=IkrAfY68bFi4o7WHsDeoec80a79Xpih8gQk2O74LGVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d13D9FyjAlFWXRdMgr71ZKD1qPOw+wJTwoX7hVGFBBoiAjJ1STpWSbehVKbnj9Zxt
	 o0+2Ta9E1ngJpPDNlVDg2cSgRNp2tMncWQX8l5r/q7SAQRhlNBcKfbpjPgjS+iYVy5
	 8PXDJQ07Uqb8VTecB+CNOjMtTnIeiPSNtDY3qTtCgFDjn9uTl3ca31H16l956UEJT7
	 57wj8MXzl3rhmTgYllDOUTriq2lDaAe+lByy085XEHrHcgLr0jsB166JjMTi4FtQRT
	 CR2zam6ADrcnmUG0bjckvePbNAELQ2YC2+kkoznM+8x1Drb1e3uMgKR8G8kKaKcf1P
	 SqF7Gk3eFx9zQ==
Received: by wens.tw (Postfix, from userid 1000)
	id A31E15F725; Sat, 22 Jun 2024 23:07:32 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/3] dt-bindings: sram: sunxi-sram: Add regulators child
Date: Sat, 22 Jun 2024 23:07:29 +0800
Message-Id: <20240622150731.1105901-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622150731.1105901-1-wens@kernel.org>
References: <20240622150731.1105901-1-wens@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_080737_633737_D3CAB63A 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

From: Samuel Holland <samuel@sholland.org>

Some sunxi SoCs have in-package regulators controlled by a register in
the system control MMIO block. Allow a child node for this regulator
device in addition to SRAM child nodes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../allwinner,sun4i-a10-system-control.yaml   | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index cf07b8f787a6..d9322704f358 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -56,6 +56,9 @@ properties:
   ranges: true
 
 patternProperties:
+  "^regulators@[0-9a-f]+$":
+    $ref: /schemas/regulator/allwinner,sun20i-d1-system-ldos.yaml#
+
   "^sram@[a-f0-9]+":
     $ref: /schemas/sram/sram.yaml#
     unevaluatedProperties: false
@@ -130,3 +133,28 @@ examples:
         };
       };
     };
+
+  - |
+    syscon@3000000 {
+      compatible = "allwinner,sun20i-d1-system-control";
+      reg = <0x3000000 0x1000>;
+      ranges;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      regulators@3000150 {
+        compatible = "allwinner,sun20i-d1-system-ldos";
+        reg = <0x3000150 0x4>;
+
+        reg_ldoa: ldoa {
+          regulator-min-microvolt = <1800000>;
+          regulator-max-microvolt = <1800000>;
+        };
+
+        reg_ldob: ldob {
+          regulator-name = "vcc-dram";
+          regulator-min-microvolt = <1500000>;
+          regulator-max-microvolt = <1500000>;
+        };
+      };
+    };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
