Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21C1CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 03:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKqKh7qZ0KqaqPSY5cxdSPVxLUeNCYszUUSjNn9R8p4=; b=gC34u06gjxWtQ+
	Kj5/mDDaWZg/LxthOUwYK69ususRw9w2cvyUX3UbTW2Y4HBBf0Cz4EZPhx+Qa349x2nKVHaZcq84A
	VrZtUMWrohvv/CdMngAUYAkNtDW72x1eqtIyTNHYyZ0XhcQ9h2hnp97LEv0Z5rHoZnE6smLaC0abo
	l2yzjAog+8z4iMAwfsnelBrPY2CRas2n9t94+sWLXBepCTxfLtF+fEDVXKH4CifRkxex5wZMWzWj6
	rZ8cW/gzlnmGnqBGwD/kjLH6Rt1Bkl3qVKmQwjt70FIc+PCJkBCewqQ7kWkkHSxD4BGlclXl8Gu20
	oZpW8xs33c5qBD/N50kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC880-0000000879b-2LJb;
	Fri, 24 Oct 2025 03:06:08 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC87x-0000000878i-49TT
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 03:06:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7a27053843bso2196010b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761275165; x=1761879965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pQ7cw/eYIuJvEdOndGkOkiOfxNm4SkQwTboprdy7EY=;
        b=i3gZ2plCAFp1iXmvUB7W9MeGl60o88e3Ae7zKP3ybgJGtMLzdGgUl8Yhpk53c+twXJ
         1cdbJu1VemcrKVUZeOC9+JDADPT1bz41nQaEaiTslhfA5mZiui7mUUsg89ObJEYi2DLA
         +4gDqzgSiy3WNFe+D9pnJcqpgrO2BmND6mzk3L/Imk5FL88yuWfJM0vO29JwcLl84lTY
         PCSJnfvz9P37NEPLFsP4I6UC9QboFWrnzPmPm93UYTPEHWGjSDe6OCWzI8Tl8OV6E2Cv
         bz/1w8Pn2I5MpTkdVy6mo+OcHq3MATCmsI0TCSevuK6umsv8OhoTbNNIoawIMuJX85cv
         5ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761275165; x=1761879965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pQ7cw/eYIuJvEdOndGkOkiOfxNm4SkQwTboprdy7EY=;
        b=H4vEgCP0z4TyElcaa5VCgcYXMt+DMylya7e2gpLBmWm+vOSFxSF62uSC3/SunQSN7Q
         AFlR9jTEN9FObOcJkFP32pgHYgm9zTqRJ/Dh8xR1xABX+XVfAS+VrsI3UDV3hPmDNjDz
         60/2tIdrNqZl1Sc00Wr17q0IwjZctyyMMAQ3M6YbY0tHuCm4pv2Fyjtng+T0b0bnvLHh
         /K2B1PT7oQHcXyw8IsKVzMx621u+iJwJK9FEDTXm3svEVg6uixQnVrPz+lC0hZHU4yAN
         R70i0lWf/QW7VmPANPs5mK3oAPVv79BD0319UpuLD7FXfN6a7uxS3w25KuMJ2xM57nqC
         midA==
X-Forwarded-Encrypted: i=1; AJvYcCWYpPnO8s6Nv3Bgd9fpR/LUaJ+umDAobUv+mAbc/lB9nFt221Ol6XeRJR7kxsxR2R9aC/QvS0Tqy7q9PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKq4ExBGo/yoUuXyC4ytUMHEZGSI2h1aYdGh6ohKuKfF4k9k2c
	vshlByXtCeVvAn2xD5b9NLSCM+h9CsBkJfq/iWnAFIuipYKYy6k0Hy6x
X-Gm-Gg: ASbGncvTWMlaLOMbrSK+qn+tCAJw+gzx1+0EYYi+jO+OoXf6byU+I3G2jfkhAgaiIpH
	/dG7mB/eS/BlcyUmakO75MfG5xbnZXE0m0A2bBNtZTB/DfVVffY+fLQcOzkoGOX10idCjJvukvr
	KyhUnyJWoaKZX9nZlolX1OQ74QNNdh4ava7Z7AVZ6EiiDAAdpZybMoAkkBEQQXyQh+dVSV3Zk4A
	uwZqIAj8Z0EjXoZd2qrny318YvCjar6fMp9xsvpvXcXhS/ZDhTD0+NfhnaXQ4PJpXDnbA4WYE8U
	GlmaZQlq1mRCaxWkru0E0RODFYnObftSRXv120W27EMcRav9OmI5P3A7yRUm9sVk3+0NxSfUA4G
	V/Poy+Zn3lylx5d+TU/A1tLznmoDyVNkABzysn4lqmTkIG6vrTsfUwvt38ojqPCg8zDd17RPIqG
	80RsDNW4VvNcgb8rOf
X-Google-Smtp-Source: AGHT+IH6m88GOzv4ruiUFmy0KxUAD5xi8gFnH40Y4X6IxplEL8oLQu8svkKTRzRK2vev5GUxpR773Q==
X-Received: by 2002:a05:6a20:3d05:b0:334:a2ed:5fa9 with SMTP id adf61e73a8af0-33dea180ff3mr788936637.9.1761275165082;
        Thu, 23 Oct 2025 20:06:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb86cbsm3574172a12.7.2025.10.23.20.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 20:06:04 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Fri, 24 Oct 2025 11:05:14 +0800
Message-ID: <20251024030528.25511-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251024030528.25511-1-looong.bin@gmail.com>
References: <20251024030528.25511-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_200606_033109_9209D0C2 
X-CRM114-Status: GOOD (  12.41  )
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

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..d044ca661fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      usbphy: phy@48 {
+        compatible = "sophgo,cv1800b-usb2-phy";
+        reg = <0x48 0x4>;
+        #phy-cells = <0>;
+        clocks = <&clk CLK_USB_125M>,
+                 <&clk CLK_USB_33K>,
+                 <&clk CLK_USB_12M>;
+        clock-names = "app", "stb", "lpm";
+        resets = <&rst 58>;
+      };
+
+      dmamux: dma-router@154 {
+        compatible = "sophgo,cv1800b-dmamux";
+        reg = <0x154 0x8>, <0x298 0x4>;
+        #dma-cells = <2>;
+        dma-masters = <&dmac>;
+      };
+    };
+
+...
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
