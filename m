Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A87C77B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBsobsB4ILhAdTEqh6IGtTV+5dcc5eeGb+2kF7eM+zo=; b=PbnR/QQEViUGqS
	XRSbNaIixjbKF6aWQ7RcwOkxwgsvl5dIAQ4lwDimYZ5kHuZb7+G+yr88c1pAPdl1UKkg3GiRGN0Bb
	zH8yn7OpejIaNJWeOEGFJTGUR6Y5XCeY4NaNrtrWW2HnV/JihHQP6/dQkTM9HY5vGChe7JE9HPlUJ
	lzXf93XHwGjDtFBru/AMmJfY+tlwe+ckXD+7I6w2MpGxUVSCpLCgruRlC9Zby94N4G2SCFPyT7Ybr
	OfJj4v6AXnFlw+zW1ahdkAUVA6qITY6EISLKcsvVDe4aqd2SvB/8nlsTryGBbR/M7fBV7d9nmFCV8
	+/8/Bk7oEuwkkt+8zoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6io-005JFR-1k;
	Wed, 19 Apr 2023 12:15:38 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hp-0058Gy-28
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b73203e0aso15254003b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902630; x=1684494630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6zQom7c9ZPxaL0AlvEMhKoZ47HVwA0KXR3RYZHyFgk=;
        b=way4ScdIS96YRKdHcgBpyse+tOSSXOie7JmzQ3ruykWd+bvImdobFO37hhT77+L3/U
         kaqojTkCN3wGLtbhwA90MgVOAgFVGf4Dedela1TNzHBvJRZjXQSXWFwPwduhVj6TPdzX
         GIc+Nuk7F+h6MKBmdyl2qvDlk02/j2I47Ppo5mo1ZpuQIvpD572EFN7U+sOSUY8XSxOw
         WOi4FCrreEQEdHwpWijIg+JK2+Lnl3ALjpm7l3mTxtaHBsOCVR7Bn5fo01aFxF/GJUow
         MnGtG2IiDAagEyhqLKjTxyj+uGdYLVG4BA2My74jN6jA7ZYKA/Gg5Wy1kJphb7t+NVe8
         GiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902630; x=1684494630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6zQom7c9ZPxaL0AlvEMhKoZ47HVwA0KXR3RYZHyFgk=;
        b=Cutltdd3f9Bu+iGQlvVNG2grv/aKHxmPTkN7ZDb0vkJperr9pq0mtPeAEU148LIQrn
         qeMAnmT0+zOHde2+jqB5lVIJltlVb8FUh3TmMNWSMr4/iKuJA+BeLWsuDnG4XxKQlrZJ
         pkVWTmcg62An44SwKqCKggdF30Gy7+XLN8SRPv+BjpvmFJv4w+2GR6obO1quxSoBQGsf
         7YMyLVSv5JMyhoVweO+1L6bSC1LWbjd5q+fIM+rEjOLEMmTnZpjK14AaYJEdkPFJRIVl
         ux18KzJJF4+TJkb2BbvUMJ+t6S8FFliMR3L6jz6xZTLiJObEUrNOhxml4+qcrajWfjJ4
         L0aA==
X-Gm-Message-State: AAQBX9fOUopFNPh2o4DTzAMGgDvamybcDScjca1vCJdLWfyd7M236qzd
	DCQ2ljvDSb6q5YlN51fSReyHmq8g5m+VTZ3OtHQ=
X-Google-Smtp-Source: AKy350ZMyASO/6WHrB2YnJ1c5qAAic0H4uqyutx85aVkcy8OYWscNutmT//7hNt7yI5Yb0peas0zAA==
X-Received: by 2002:a17:902:dad0:b0:1a2:a904:c42e with SMTP id q16-20020a170902dad000b001a2a904c42emr1574829plx.24.1681902630432;
        Wed, 19 Apr 2023 04:10:30 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:29 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 14/21] DO_NOT_MERGE dt-bindings: soc: add Foobar SoC cache controller
Date: Wed, 19 Apr 2023 04:11:04 -0700
Message-Id: <20230419111111.477118-15-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041033_697865_4C2EE228 
X-CRM114-Status: GOOD (  12.36  )
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

Add bindings for an example SoC cache controller that implements CBQRI.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../soc/foobar/foobar,cache-controller.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/foobar/foobar,cache-controller.yaml

diff --git a/Documentation/devicetree/bindings/soc/foobar/foobar,cache-controller.yaml b/Documentation/devicetree/bindings/soc/foobar/foobar,cache-controller.yaml
new file mode 100644
index 000000000000..6348483bbe09
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/foobar/foobar,cache-controller.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/foobar/foobar,cache-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Foobar SoC Cache Controller
+
+maintainers:
+  - Drew Fustini <dfustini@baylibre.com>
+
+description:
+  Foobar SoC cache controller implements the RISC-V CBQRI interface for
+  capacity allocaiton and usage monitoring.
+
+allOf:
+  - $ref: /schemas/cache-controller.yaml#
+  - $ref: /schemas/riscv/riscv,cbqri.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: foobar,cache-controller
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in CBQRI spec
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    cache-controller@fff12000 {
+        compatible = "foobar,cache-controller";
+        reg = <0xfff12000 0x2000>;
+        cache-level = <2>;
+        riscv,cbqri-rcid = <64>;
+        riscv,cbqri-mcid = <256>;
+    };
+
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
