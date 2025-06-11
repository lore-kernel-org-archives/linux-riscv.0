Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4096C71141
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXQVVErMCfPAeB8GDaFIcjXPZQb8nUkbFFkWi0bvQIo=; b=U8ik9hdCuzIAa+
	H5Livq0Tc9CLNda+/qKSRBWH7Z/8XncuVppCR03fArmutu/6ZpUEu0skd9C94700G193G6mpxFUjT
	7qTVpOyfh9ruSyGLY1hmWcXSOBgafay+a5DYFNDYSl7jYCOzWZvQQg83zpBQLY+3w2eqM0BeSXJOC
	C0QA80zp63CzatwmHzibvjuZ4k3ZwmiGKScnnXanf8rH/FMEGTvNpHzBSX0qpKsVebgiOa4MGtHcQ
	DOdiu+XKjoIe04m/txiD9ijFWi2aa83wgsUSm6ONWtl5XjrtjdFwtJLSRTIF+xEzw5aFFivyrgmOK
	oH87TdMAV1DZx5uxuSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGwD-00000009Hlp-2GSj;
	Wed, 11 Jun 2025 08:36:01 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGgD-00000009F8R-3ZiR;
	Wed, 11 Jun 2025 08:19:31 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7cadc92771dso543914785a.1;
        Wed, 11 Jun 2025 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629969; x=1750234769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=AX9lVmQNYZ1bjYVkH5C9P1Xtj5wrMvfyamBjHIQls6KuJkFElbjnOHey/3mLLq6boh
         x8Ky1+awIniH8JuV7WmR9yRz97w7A82vcBGHEbecEdH2fY//P9dQUYhcTSkjVKow4k6F
         EH2aozWblMKGIDcSciL1Xcmb5Bp8tA6pmKUBPSdCD6nmFTxDcvaU8DzybzNS1WoQISkU
         AJ/QwMHbvg4S0RbjGbY7HTDWclOrK0IPgWhIDM9LywADQtiZM8gH36yGFPgeqtDrESW2
         DxM0DePPCA78+GS19EWd9Bh4LdekPloBT37LngRWwlNQvZ55j+jUvSAB1gh+gQDa0ycg
         4wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629969; x=1750234769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTihKaJdX7lICF61Unmn/1qC+7hZZfgUEsDAi37Fi1o=;
        b=iKMF5i0ePgyHrh7tR5yJZyH6UfcSGelng+gYKNIKmGgmDOUwUYMv9CE1ihZjXbwi7I
         0iPtSQVQgD/XS2qPAmcorgmibHBsiNfFSfPldzxET4x7YI2+37EZkoeGFYU+RvUgAvKE
         2m0utmhIZKIGp62u5ZLHt4D7OrCSxnvKQCNfx5Q/t2YX5pmG7p6tbiiQA/xflSouN/ct
         itdKZkwOGMN+IM+Ln/o9nyu18MthxlCisQZwPSxD0jM5GcwkaljxdorQM0OvrhAgfOqY
         Qes2xFIhKxKLTVlzgiX1VeRJjH4PAG8w/GINBlniIibR27Uwo7Awft+O0l3IFYU+peOc
         Pjxw==
X-Forwarded-Encrypted: i=1; AJvYcCWG6rR9QkL2xUL/58yHvFfcfPE4YcbAD+7NwgwIZ9+ppHsgqoicvKtytD5aRocupEJFf4SVWCxj8JRJrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwxd88A7GuOA0K+C66BqZ+QjMN0anqvJGi92eSAoNSNHDDntJ
	5bFCfdaZ1xuTyg37dGVq0gJq/vE3FHRY68PMfjNEAXbxNZNaJQ4mkkLm
X-Gm-Gg: ASbGncsXKtXBHgq6RgnZFaGQXbDiTzh2zof/tvqyGn7DZSDKemCakg00Oi9ElTy1urb
	0cRI+MRwwvC37MwgsHCFxDVH+NEpQHXUpzMZoGTrR4ARl4B0G6eMK84VNaTC6I50Kr0pLTqTq+t
	UkARG7vxZd7oT0UwaMSW8IesCxwNmiQ9RvFYWlK+JloyKbDB5uxjXG6PLPrk24gj06urliy6G/C
	RvnHZYvxDP5Vb6mMzzU2qWobK1XRLl3cuv43nba6omTkg9W2L11G9jXgcrHThNc01qCN8rmeOoe
	noE7cGykRj2dRbWZ2yR+9kAw0cPXDyTTHzHpU4FVJIu8AwDx
X-Google-Smtp-Source: AGHT+IE2k0Y0Y3XpkqJoreGwvkWiu0A5c1I9LUjGwUIsU+Yx8pfb5KDzmXaWEDQQc73dwOMzOri2PA==
X-Received: by 2002:a05:620a:298c:b0:7ce:e010:88b9 with SMTP id af79cd13be357-7d3a8820ef4mr372285385a.13.1749629968697;
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ac84cbsm79224076d6.32.2025.06.11.01.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Wed, 11 Jun 2025 16:18:02 +0800
Message-ID: <20250611081804.1196397-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081804.1196397-1-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_011929_887244_B6385A4F 
X-CRM114-Status: GOOD (  12.37  )
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

The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
"VBUS_DET" to get the right operation mode. If this pin is not
connected, it only supports setting the mode manually.

Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
new file mode 100644
index 000000000000..2ff8f85d0282
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800b-usb2-phy.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X USB 2.0 PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-usb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY app clock
+      - description: PHY stb clock
+      - description: PHY lpm clock
+
+  clock-names:
+    items:
+      - const: app
+      - const: stb
+      - const: lpm
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@48 {
+      compatible = "sophgo,cv1800b-usb2-phy";
+      reg = <0x48 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 93>, <&clk 94>, <&clk 95>;
+      clock-names = "app", "stb", "lpm";
+      resets = <&rst 58>;
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
