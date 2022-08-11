Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FDFC3F6B0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6WBbmNlq6lO1pFqFn+iYpcgtrKVhRV7nCqLVYjESjU=; b=apsSWkotqhKJQZ
	5cD0FCCxHqIfdvozZ69oItXH3zIDRKTk8HPdVsWCIezdk04UjvRQeK1oKbVf1xbB8kVUcbV6GaArv
	cCOW93Em1KmH8wp4m6wQqVH+gO0rO+tFaDwOSb+Iw/nYfZLG5viWAZsxEoL3UUQfGmQDLkyYoG8i6
	sxjqJ9hkIcHdl/815Uo5ACXXblpaUJG4M3SZfsY3G0LBOBIMVlPA+OwkIr3lclMMNupmgvUPFQRHt
	wWUTGlUhWYziNt/vndMB5IVO897Kes52TiAZuTke9p/6skbEd6RcuImxNgKoP8oh+LbqOnQMlACJW
	n6nsjQKV9rKquvMd0E0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErt-0056aa-8P; Thu, 11 Aug 2022 20:33:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMEro-0056V6-3k
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:33:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id n4so20781349wrp.10
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QxkmtF8asgPVQHFJENq/ehachAsL+qmscZvCCu05yWc=;
        b=XaRcrphLz19LTNxZ0dzKwHA8K/MkiviSjiw49WVWXeVE5qRONAyZyq8QlcuzrvefVq
         DVNMQX04znal0vPNRmcNC3MbIYAUaAwumKVcp1t0JK2JWpjZ/cp5ve/O9xgtHIB9jYp1
         a8nRH+Wy1LAZE51EqhGYykiH3KzE9PEX9dP0kwd3yenGFVrqs5lMmYFvz3ozZW8IIaAJ
         Bj4EyFhC9G2D5gf3y3F2K/Htv7ZqH11Y9ovKD1Bz7OjfH17QcK/dDGLuF9YkGgrMvCco
         4DIJtEW+NiKBMz3o+dzkdKU5lyhNrWpghKTXW2kDbXlMfdJOmER6MuwSLRX/k4n+MNIT
         Ftcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QxkmtF8asgPVQHFJENq/ehachAsL+qmscZvCCu05yWc=;
        b=sVzZArB0sl9SI4IzfNPpi105JzAtYG5AR5ztXKQYxx8M5OsjccaqsQq7GRkrvbtkyW
         KFhcWjhrHq7dmKmaP8n2kBLTZS9+LD4i54xB7TnPEJjReXDvp/R3hdg5JSkzD4HzmOJh
         ZKnqPGEAS0KksCYEBorL/KgwQHkmBZzXvelzNU+9SRVbGAcPMLm1nrOuktDHE3rL6Y1o
         bV1vQELkZkAZzgwjTocKf1TOE+NkqHD/dHEqufmMxkAim589j5I5w1H/QUlnYcu8dOj1
         aa3PCgx7DWsP8t9hdpOmrPx07a8MNnLETke/SDYBmcyIEohd2/tO65+gARjX/Kh+WCUg
         PfGA==
X-Gm-Message-State: ACgBeo0E0AZvSS9jFRa4UvVuvgypnwNgWDhCDSQQDCqHQD4+lecj868m
	jQMh7A8Cl4nO9o1s58mUoQo2bg==
X-Google-Smtp-Source: AA6agR5//7v1W6BSWMIoYqn+Fu+wgEM3FNII37M+y/PlRKeC6C5AWj7949Ozxp/ApCOBEqaRSPZzpw==
X-Received: by 2002:a5d:59a5:0:b0:222:c5a5:59c4 with SMTP id p5-20020a5d59a5000000b00222c5a559c4mr337239wrr.656.1660249997915;
        Thu, 11 Aug 2022 13:33:17 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0021f1ec8776fsm86643wrp.61.2022.08.11.13.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:33:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
Date: Thu, 11 Aug 2022 21:33:05 +0100
Message-Id: <20220811203306.179744-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811203306.179744-1-mail@conchuod.ie>
References: <20220811203306.179744-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133320_190245_27C566BD 
X-CRM114-Status: GOOD (  10.13  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Upgrading dt-schema to v2022.08 reveals unevaluatedProperties issues
that were not previously visible, such as the missing clocks and
clock-names properties for PolarFire SoC's PCI controller:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
        From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

The clocks are required to enable interfaces between the FPGA fabric
and the core complex, so add them to the binding.

Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pci/microchip,pcie-host.yaml     | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index edb4f81253c8..2a2166f09e2c 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -25,6 +25,31 @@ properties:
       - const: cfg
       - const: apb
 
+  clocks:
+    description:
+      Fabric Interface Controllers, FICs, are the interface between the FPGA
+      fabric and the core complex on PolarFire SoC. The FICs require two clocks,
+      one from each side of the interface. The "FIC clocks" described by this
+      property are on the core complex side & communication through a FIC is not
+      possible unless it's corresponding clock is enabled. A clock must be
+      enabled for each of the interfaces the root port is connected through.
+    minItems: 1
+    items:
+      - description: FIC0's clock
+      - description: FIC1's clock
+      - description: FIC2's clock
+      - description: FIC3's clock
+
+  clock-names:
+    items:
+      enum:
+        - fic0
+        - fic1
+        - fic2
+        - fic3
+    minItems: 1
+    maxItems: 4
+
   interrupts:
     minItems: 1
     items:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
