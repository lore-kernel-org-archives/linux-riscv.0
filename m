Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D81C32789
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZ4L68x8a8MlFDKiZBGO+Jr7tGMaBqRq/TNFDo8gF1g=; b=gkzcp8r0tD/9j7
	IK680DeFT5G0bVw5jADmAFV8gioeBCjoD+rumyk+j5bxAs3Qg/GSmXulgQXFDSDjcJkHJh/3o6ELi
	ak4hGbGel2IyN/FgMZ8u734/2Bd1IXm+6k9MPkikJOh++4m8O23XELWfTZR0+ijJz8Cmos/OC4xX6
	zgyNFBAcpf7gCHgYtD/ZFn6pHUSXiKmawomXv3WMhUtOUwkbIn8ISTMs0r5fGZr+A8K5rXdP62Rid
	P5xvaImnclPckzSPKwihpwkzlqVQ5rCS8nay6OmmYVUG52N/mqjgDYfpjappnMsppdXgpzhVkpIm6
	C72yDdvBebcRIpSlu7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCE-00DHYu-Ci; Fri, 19 Aug 2022 23:14:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBC8-00DHPQ-50
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:29 +0000
Received: by mail-wr1-x432.google.com with SMTP id e20so6221625wri.13
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=wh/YppWbOFIra6XEEBi8TGN83nz+Cc+tSET8IzCpaZI=;
        b=W9D4Kf3qouskAMJZ3q6S/VeXqLdByauzGngx+X+7e6HXVLyRJp2qiV49imrSF0crmZ
         L+/lw+44dXb25H5IyJUD9JCCTqUzJA+1/oxrn1Ci9GzGUNH221jW2FkfphFIrHIejF7U
         ePmkg+areMAdab8CVPvpshz9cX8IBKJS5PaIZLQACojidQmF+bbc24BtVq+G33logClN
         ASxboCEXR/ooftCzJuSRf6o5XGW/B22Jh8rfq9tjHTZzNEsGhjbvZO3b6LnW5/tZqv4O
         tzWIHhx8HZxn4AmZouZVFEcaBTlSqJRDFKEQ2wi310TqNvc8s5m72sM67xTqkWIDnjim
         mBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=wh/YppWbOFIra6XEEBi8TGN83nz+Cc+tSET8IzCpaZI=;
        b=YwGcGCaE/ZG0bxH84mtVP8GCNu21G5mvKtqJBaoMgMiXuoNL/0jFHAKx/Sk9DKvskk
         53C955xAGesDhi+ecbSUmnkLH9kzZueZcl8dXCxBdSBWWGmSGKYwXdOh8lKFCiKRF35P
         jQOLYFb7etioqtyt4sHI6AVY7o6KnVIRetiZeZNscqOFK5x4BlBbP/grGTsw1YtvlqdH
         WfzYKVjD3b86G/svl6+1BsiPrdWHyY2iZQbug42GDKnnDhydOccFtmhYjPZ7JuBvz3Lw
         wDcFZMkFkkCp0B4JfPmoqJu6u9fW8Jk4ZwPozi/XiuyfvqSzgoBdihXjwMCNLidjddpX
         3Ifw==
X-Gm-Message-State: ACgBeo1c/dDDuWSHVI5unNoCRGzvMDc0VtC9Jwsy1MnBIxiIoDytoi5E
	2a9pVyl5FeLyG+oLDhaljVGv2Q==
X-Google-Smtp-Source: AA6agR7HfQWIne/Nx7aBs4qRkDfV2raD5Z03KapbYexai/QZpgSfagbRv6cbGle41aqc6xYQGADp0A==
X-Received: by 2002:a5d:64ca:0:b0:225:48a0:d9cb with SMTP id f10-20020a5d64ca000000b0022548a0d9cbmr98484wri.399.1660950866431;
        Fri, 19 Aug 2022 16:14:26 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:26 -0700 (PDT)
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
Subject: [PATCH v3 2/7] dt-bindings: PCI: microchip,pcie-host: fix missing clocks properties
Date: Sat, 20 Aug 2022 00:14:11 +0100
Message-Id: <20220819231415.3860210-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161428_225398_64236716 
X-CRM114-Status: GOOD (  10.89  )
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

Recent versions of dt-schema warn about unevaluatedProperties:
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'legacy-interrupt-controller', 'microchip,axi-m-atr0' were unexpected)
        From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml

The clocks are required to enable interfaces between the FPGA fabric
and the core complex, so add them to the binding.

Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
dt-schema v2022.08 is required to replicate
---
 .../bindings/pci/microchip,pcie-host.yaml     | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index edb4f81253c8..6fbe62f4da93 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -25,6 +25,33 @@ properties:
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
+      This could in theory be all 4 interfaces, one interface or any combination
+      in between.
+    minItems: 1
+    items:
+      - description: FIC0's clock
+      - description: FIC1's clock
+      - description: FIC2's clock
+      - description: FIC3's clock
+
+  clock-names:
+    description:
+      As any FIC connection combination is possible, the names should match the
+      order in the clocks property and take the form "ficN" where N is a number
+      0-3
+    minItems: 1
+    maxItems: 4
+    items:
+      pattern: '^fic[0-3]$'
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
