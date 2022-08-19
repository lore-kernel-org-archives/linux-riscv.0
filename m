Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474BC28D13
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAYfk/mctmXeJEtKL/sHk1i79/tHVsa+Mb4YTP5JbrQ=; b=JE3A0GQc32K281
	mQOIFK2+ILjpWwVEqahclK1ydOVuoNPrC2WsvZO4rFHjV4IbE45qE/nSHrMKKhp0WptcBbMnghHrP
	0pxiLQGBqNWNYgaDsiyIhjjevVr4g//SZHfllRU+AFsDjawG6Ol2AUQ3TOb48rcm2BUtl6NgpcyOK
	qsaA3nTkBuwrjoh9o1itv3Ae4sSDXMs4JVdDP9I9i6KXffgE07cBCcwqf25UJBaO3IgLLtSGAXD7O
	OcqeEjuuRuo1K7ZHawkKXKoPdxhD9dVKWqQV83RKj4EeskRCYfAPu9s45TMLIEu70CV5n79QtR5sQ
	8o63m9iAU12/MKdJ1NLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCG-00DHb8-Au; Fri, 19 Aug 2022 23:14:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBC8-00DHSg-PF
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:30 +0000
Received: by mail-wr1-x432.google.com with SMTP id h5so5909336wru.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DWhXZZFAZhCnIU4fgoPIE8pwmZNnfCyeRQd6/ThxbP8=;
        b=TlHri4rXXzgpOkPtCLjuGJ1mPrjJL/4KdH3rMQIdvOOrOUXEki8NgXCDfrl8xltG/Y
         xyRc7iJvLuKqvcNsrzPpTNM/lfOcWd0/QRQehj2lGgmGG3fpL+6Wyu3BzVOASjMNKWCk
         apFHqHXAp25MLTIzwJz1KuT2wyu0K4KOSuIdtKD+Y3T7osGjaVIj2gOTEJds0qmjFanA
         mQ3SNn3CZ8Ytc3f1+nbzwv1XAduJ00V1IG7vGfMkLMl3uPwJdfZzpo6yP/e7bMBKxR/S
         1ptgZmk15AnDXat7ziGc19VedjhfPSzcS+Ckv/T2r9yM/7TqqikNV3W35ELd2QHKCtIN
         DYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DWhXZZFAZhCnIU4fgoPIE8pwmZNnfCyeRQd6/ThxbP8=;
        b=cpmlS+Az8uOTGFBz0xevz+uhv6KpqBeMJwT5gRJu8xZlaLUTslJjuIVXnWfNtlDxLH
         rJubvzSJy2HxTuNPP+WxEpAqv2zfhGf8RFmIFmnEzftYu4QV/qtSxC08z9k975pdi4tk
         QBOJxWEJaFlcMPbohKpNTE7Be2X3kHU7VY5I7G4c02BRmtlT28wU/Kkoi8XhNg9trDtD
         uj8nDyAS1/yxhrIJe1IeYqjI+XtqaKE8JSqQhldMqczB65uJTIRfuhZwf22UXEuZf6uB
         T16wHb9GCg9JGj/4AWFKZb4MUy76sx/xoxFE+q/uzIPLkYeDCTzKMMQXskOUTBbzSEoq
         xLYg==
X-Gm-Message-State: ACgBeo0yRt3065ufJ43gO3hwszQbHi+KSOCJ+RJdU+qUzoBza00OgUvq
	n2MPLUfmtowcJV5euYmi3c489g==
X-Google-Smtp-Source: AA6agR4v+IICZ3bclYWDQkb0DGxyv2hQHAvTlMTrWB2qMnF7A2A2AVYqWTgQXMw3/HeIhAsI5Ns4lw==
X-Received: by 2002:a05:6000:80b:b0:21e:d62e:b282 with SMTP id bt11-20020a056000080b00b0021ed62eb282mr5271465wrb.557.1660950867592;
        Fri, 19 Aug 2022 16:14:27 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:27 -0700 (PDT)
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
Subject: [PATCH v3 3/7] dt-bindings: PCI: microchip,pcie-host: fix missing dma-ranges
Date: Sat, 20 Aug 2022 00:14:12 +0100
Message-Id: <20220819231415.3860210-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161428_836212_EE239E6A 
X-CRM114-Status: UNSURE (   8.80  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The dma-ranges property was missed when adding the binding initially.
The root port can use up to 6 address translation tables, depending on
configuration.

Link: https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide # Section 1.3.3
Fixes: 6ee6c89aac35 ("dt-bindings: PCI: microchip: Add Microchip PolarFire host binding")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/pci/microchip,pcie-host.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index 6fbe62f4da93..23d95c65acff 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -67,6 +67,10 @@ properties:
   ranges:
     maxItems: 1
 
+  dma-ranges:
+    minItems: 1
+    maxItems: 6
+
   msi-controller:
     description: Identifies the node as an MSI controller.
 
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
