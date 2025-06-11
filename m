Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C13C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25dp6C/YZYOhYd7a7m24Mzzlq4kW00L+PU1LsMwn/jQ=; b=3vcydrk0cVql5P
	LF6seccXtjBJhGbGmf2Kh6G6APQ1sNFJtVYCOoy5uOWwlqXMo6T4hqkIUejYl+e9RotxN20btT8sx
	Gbc0rLoJrQeWtY+a16eY/GJsVy11wxIfVKYr0uhQOPOHEBU9gX7h2ejMfwvgEI3Nkl0c7Cqu0XmrU
	s2P6Eg8Q39Vta6r8YzR8O6YU5ojyYLgqBQA5d0Cin3NFvLF0LKKP6IlnvskF6uwrJ6Bh1LwyVSsfn
	QsAYWuvyCUsd2ef2oWvEWAlNJslGgFTo1kpVnh2WgIZXqzEBGENiG1Bv7IbfT5nm3C4on1+G929Zo
	Ta/tU4XtncsHl/gwgl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGjK-00000009Fcq-1WhT;
	Wed, 11 Jun 2025 08:22:42 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGR6-00000009CdF-2D0S
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:03:53 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6faf66905adso39877416d6.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629031; x=1750233831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDPKzl/HokW1bKViSHJhhALGLh7FDXnYOeKnzw1e8Ss=;
        b=VtTn0vrOCT090iuNRcRcJd7K5IR9NlG4T1Sda0Emu6PNEItgrQH8HePdyc+tuWCfxV
         S0hDHvxKSixo2nGodvPs3uqp7hMhQgIGfGehDXwlXauXSObvjX0nviQhs+6z3S9NH6nj
         73zmn2vcR4Y9c8b4T5VgTrjQ7LsGdsEEsLHOXk8W3/sTJkHVgTBkksIQ+rTq2xrf17wz
         z0jDfEeYVnHvq7+RY0qjFJomqfT6V5ax2n7NpDFq8wABxrTnT7NE4Wjqf1Fj3VWFNoF4
         EvXDmtv6JlhYMUMh7JcBHeZCZg5uW1qg45PrYrH4BUCSOU/IaVI8/iF1Y9CWKuUChnu3
         r9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629031; x=1750233831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDPKzl/HokW1bKViSHJhhALGLh7FDXnYOeKnzw1e8Ss=;
        b=CZashArdsbyndo4EqL5FfHJ6VSnD87qZFwy1zrbaa2/Z2tAzaDQwM5OrSAS53Bi2P5
         7uqzsZunhdYfy0wBQaBJgWIW9k7hqTdljFwPXz+6ogWUSoy2Ny1H832CLtimu6BIHlPD
         pY3q6JwAQ6sN1R1s13VVXibEbI/kDsq4OW/Gzm2iDBLmlVwVdOjXNQpeJPn3cWPvdHj6
         J/IaCndJj8AQ6WdL6bNq2T7DqXw+mqaNxmPqCKNjTH6LNu/XHYt3pEfCcEleG+kTucvj
         3iHIxB044wd7txGrMbH+sPdzQ2K3EU4mMMGuL4HJZxt9k5tDSKklEyx5HSgCUlkYO543
         LSoA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Yrng1u+xQOthqAX8S82XVkoLDwMZUKPsrPD7yAahxvgu7ODpGOshapJiwf9rauyd7wuAfJAO4fy8HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEstqvYvak9UzLpiY7DqFuvN/yUm6DgDMn5yACu9zRW71MAk62
	9QRjzHwD1UUJqoMGjIcTv3rGEKUSaLonZJd4tPMb+nwHUVQ8llTnSgWl
X-Gm-Gg: ASbGnctiwXSThWitXaVHWvuBpzdYnOOeIrJnMjhOY4qJqgPwgsZ6zJOhCJuOZkX11Di
	OM04DNyjWPTd60W6T2NZDTSYFyv5252MfS/hdqjj0Zpho6NKDlOh7gZIb4OLyi5AOkti6hhXDUa
	D7lUkwinYggzCviZhJrJT6xS/tKhpSpNAohj6dMvl/IOD182WoAj6KMkDRgWsij4CaSUHaD50Fc
	RMj3ENUlEblk8IhrSYRKz/3HAdAIzmGRz3vDX1F4jakwpzYqugSfERBcDUq9hHDGRKZYRf6GgoH
	jxh/XUVXH0VqegbhQk6pWsAWby3ibZ1/Dk9UDw==
X-Google-Smtp-Source: AGHT+IGmp+EzAiX+KAE1F9bGl2MqzBQoWq5zi9NmJE6sYIlDWxZBH2JCYpju3CBjIhOcLVFq1e+owQ==
X-Received: by 2002:ad4:5cab:0:b0:6fa:c46c:6fa6 with SMTP id 6a1803df08f44-6fb2c32a9bcmr35065916d6.12.1749629031132;
        Wed, 11 Jun 2025 01:03:51 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1ce86sm79639716d6.61.2025.06.11.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: Add Sophgo CV1800 MDIO multiplexer
Date: Wed, 11 Jun 2025 16:01:59 +0800
Message-ID: <20250611080228.1166090-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080228.1166090-1-inochiama@gmail.com>
References: <20250611080228.1166090-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010352_565161_FBBA03E4 
X-CRM114-Status: GOOD (  12.59  )
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

The Sophgo CV1800 uses an internal MDIO bus multiplexer to handle the
internal phy and external phy. The internal phy is always on MDIO bus
address 0, and the external bus can be configured with different MDIO
address.

Add documentation and compatible string for the MDIO multiplexer on
CV1800 Series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,cv1800b-mdio-mux.yaml | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml

diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
new file mode 100644
index 000000000000..abe0004c8b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/sophgo,cv1800b-mdio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B MDIO bus multiplexer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+description:
+  This MDIO bus multiplexer defines buses that could be internal as well as
+  external to SoCs. The external mdio bus can be configured at different
+  bus address.
+
+allOf:
+  - $ref: mdio-mux.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-mdio-mux
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@3009000 {
+      compatible = "sophgo,cv1800b-mdio-mux";
+      reg = <0x3009000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mdio-parent-bus = <&gmac0_mdio>;
+
+      mdio@0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0>;
+      };
+    };
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
