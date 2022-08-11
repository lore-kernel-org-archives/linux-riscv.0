Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F6BC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1k1GlFcz2645grfis68UHUXE8xqFAj6uV3C00Plw/Y=; b=DFkoAvFQKjGJRC
	AGpYLXt9m8qOlt9xbEcOd31x42UHbIk1IwKQ8phKlhV6CfTlLvOdEHcDRBF2GPBkN1reccf55Olae
	loAXfYXQftjdlJXC3LqXlX9LGbmbpafP+A8rP145Z5j/bZ0E64iTN/V55gvoUxfEmXkzQBcqOe2tl
	+GA6raVeYK96pkThTmKwbAlJ63WuBqOVLjLrcIxPlRk72TPxZLBnSr5zXTiP2uO5zlyeTXPL7Jxsz
	DqoD/OO+H1UMA5IVD1CE0RhyOHcY+xeLaLtd1UNaf7gb1J4jDbWh0xm8rO7svc0QzqKpjKe8GnvG9
	wqatkjEMM0lDvXk32+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErv-0056bv-1f; Thu, 11 Aug 2022 20:33:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMErp-0056WP-Dv
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 20:33:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id n4so20781425wrp.10
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ClSH5MXXgUZguA19Coz32EYS83xElJy9jIFIyLAmeC4=;
        b=HHhe+yarKbkwIYZ1mXaOthZ0VXyo310D1cBk8s8PGKXtS+FAnYRo1gNG6ylVj/7gLo
         BD1+qLMXw3jHjaKmycrt6e1OAv4CCWriwslsnWnsihoR/ceQgpKaw/ZZ6agol8h0tpdV
         l02Ole49suUd2QEsa7+uNZY+ANEboqWovjQ41L3onQLVlcUDQTarQNGtsJLt8FArM1MM
         H2MDT+rXQSH4wqI56vlK6Bwt19CVBV2XqoaYwT8ClmSccYovi+z7rS+pap22DWMy7KMA
         jJBA8lhBOgEw9qEA4SepES7pXBFrOAfewHEorcKXkVi7YaO9c1U7I4skrO+n+EWweBdU
         rtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ClSH5MXXgUZguA19Coz32EYS83xElJy9jIFIyLAmeC4=;
        b=uzrXMi2WuyaMrfPigUmynb/MjEYBGttAeUoOuFCvKzHItg/3DL9OnzJ7zx/cJTmRVI
         gsk02N+7xz2Sv31EVGn9afCkUaPN0Fh+h4c+I6eNwlSW6Tij3+yWVROQfuABFXW7Sfdp
         G2+cHX8vq3a7KkeFhFQhAoTPl1wjZjbHeGJRrVRs8K2foXQqEELgL5jMxjDnsIrAnNGn
         RTma1lQ1a7dbRZTaYMyC1NuSCUfQtSCDKWOyc6gv46Br8gXo4plhXS3PDMgFlRJthjrp
         9c0TdAERjS9YLj4eKIjynMhtDvYD9llW4nefIxEzWdqNWOEiFHNtHJ3B2VG7ir8Rbc8W
         eQew==
X-Gm-Message-State: ACgBeo2JxDqIQZsqq73us/GQzlOI/5xOOzPywo3B9JiUqvlfN6EZcXTH
	VHEdigxyqQE+E5Hj2/OgPB8/ug==
X-Google-Smtp-Source: AA6agR4uUqIg2eHjtpt4HwLt+LlA2AAP/WjAN+bsQ7P2wHGzFMVwBV3+ZG92fs39ZgDOkKMy3JKrZg==
X-Received: by 2002:a5d:4345:0:b0:21a:3b82:ad57 with SMTP id u5-20020a5d4345000000b0021a3b82ad57mr361149wrr.176.1660250000231;
        Thu, 11 Aug 2022 13:33:20 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i12-20020adfefcc000000b0021f1ec8776fsm86643wrp.61.2022.08.11.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 13:33:19 -0700 (PDT)
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
Subject: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing address translation property
Date: Thu, 11 Aug 2022 21:33:07 +0100
Message-Id: <20220811203306.179744-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811203306.179744-1-mail@conchuod.ie>
References: <20220811203306.179744-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_133321_495097_4238CDE1 
X-CRM114-Status: GOOD (  13.84  )
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

When the PCI controller node was added to the PolarFire SoC dtsi,
dt-schema was not able to detect the presence of some undocumented
properties due to how it handled unevaluatedProperties. v2022.08
introduces better validation, producing the following error:

arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'microchip,axi-m-atr0' were unexpected)
        From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I feel like there's a pretty good chance that this is not the way this
should have been done and the property should be marked as deprecated
but I don't know enough about PCI to answer that.
---
 .../devicetree/bindings/pci/microchip,pcie-host.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 9b123bcd034c..9ac34b33c4b2 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -71,6 +71,17 @@ properties:
   msi-parent:
     description: MSI controller the device is capable of using.
 
+  microchip,axi-m-atr0:
+    description: |
+      Depending on the FPGA bitstream, the AXIM address translation table in the
+      PCIe controllers bridge layer may need to be configured. Use this property
+      to set the address offset. For more information, see Section 1.3.3,
+      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
+      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 2
+    maxItems: 2
+
   legacy-interrupt-controller:
     type: object
     properties:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
