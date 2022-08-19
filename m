Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E72C32793
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 23:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w47/Bplzz1t9noHcfjQKDRf1Q3GpZ9GssLdYhYtadXg=; b=khyk173ZaeRzUB
	zJepKauZl5vQB23uTz6k6i/RAzvoserNoBYtZOIMqPCBemN+nZ5aAgz3vDvh5kiGPlt/FGedkkoDa
	ykniwTSAl5IsqhbIY8AFR88I9DBCqPxv1oxfKfvGfV8q/FtI0jkNjNnT9ysnuXXIY3NCcB+tImqKZ
	U0j4KVI3ht1vrl83lIdwcPWtt29z5trNwLwUjBw5WwVJQuoyRy/aqhpYGECAMi0Nz07gn41gdu1v1
	r+c1FoWnmMvKpFaRKAdQBVPoNbDmH12TAaa70V9NYLkFNKAUjYg9MnQEytRlmqbAEKwx+e02xi7ey
	7fJIzxO6nP1uLjf1WU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBCC-00DHX7-D2; Fri, 19 Aug 2022 23:14:32 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPBC7-00DHP4-Im
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 23:14:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bs25so6722827wrb.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Ar1lQa9BYLA+2BrGBUjljW+ChrkaQLd3BjaRIH/JfBg=;
        b=LmAakIOkt77pZdPShAOdMDn7SLBNaNq8qTkoJm7Kzt5WdgHj61h0xehsNah9Hbmsxw
         NtHwxjAiqOJoaVY3IfYukzwm4sO9dJUGHpsVWLcRJesmz9rbDInhzYGz8l04Ve4UzYe2
         jO57QAr3Ca/teH+1Zs/2ccy3ZVf2KDAZZWfvQwu6tg3qtwU/Jpnfv+haBYrmvBXQONTO
         uKJig2BH6ECCpV/+eXqv8n/B0iFw/mq29k0uwvZgLH9buybKiCwV/KhtWmrj6cr36rZ3
         oZ0EuPC9RKo028Lc5J43eWev6blJCMkVAHaNbS/gRgvuSeh2BfinVEv3uH3HNnwnqTD1
         9tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Ar1lQa9BYLA+2BrGBUjljW+ChrkaQLd3BjaRIH/JfBg=;
        b=XZpzSfXAPCtA3ta7evciGp11BnQ84axvwJjkN3HRps+p39aT1fc98dqFkOv0mPLBZJ
         /ixePl4iPAEdayez1SKcETyjX6/lPC2wzEbf1Cv/oK5fss1QfCkeGlV9VSEnXb4HBbRl
         ZE2mj6pm4MnRde70Rc1GZWas1bXvvV206LrJExeJjDZut4n4TTJjPg+XzKRUEmNRQrCO
         aVeB7ul/YNyBEAKqgmz31YAL356c+PTILMdRF10gPCxsEY4ixD5IcBqxReGdQ0dB4ENz
         FsLXkkcz9G52HrBC2xf1JQqzjMZVAqo9pRN9gW7MpnEEgPJZ2bEJeeuWNWHYYP3uIsws
         3nbA==
X-Gm-Message-State: ACgBeo2G1vbZl/N1BdTqLavAE3L++96Zd9TIn4eeTeF88a5p/KIVOJxV
	ogBcQZR2ziTbqt3fEPAkSnTBDg==
X-Google-Smtp-Source: AA6agR5OOrwGni2RQj3G1GdLapCkg1a9eihP+hQCkGd2ZFMHSfMF0pFbvB6VJvqoRIgB69tPeKnueA==
X-Received: by 2002:a05:6000:1681:b0:21f:16a6:626f with SMTP id y1-20020a056000168100b0021f16a6626fmr5242574wrd.717.1660950865391;
        Fri, 19 Aug 2022 16:14:25 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d46d1000000b0020fff0ea0a3sm5198522wrs.116.2022.08.19.16.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 16:14:24 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: PCI: fu740-pci: fix missing clock-names
Date: Sat, 20 Aug 2022 00:14:10 +0100
Message-Id: <20220819231415.3860210-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819231415.3860210-1-mail@conchuod.ie>
References: <20220819231415.3860210-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_161427_642259_7CC0E162 
X-CRM114-Status: GOOD (  10.17  )
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

The commit b92225b034c0 ("dt-bindings: PCI: designware: Fix
'unevaluatedProperties' warnings") removed the clock-names property as
a requirement and from the example as it triggered unevaluatedProperty
warnings. dtbs_check was not able to pick up on this at the time, but
now can:

arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: pcie@e00000000: Unevaluated properties are not allowed ('clock-names' was unexpected)
        From schema: linux/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml

The property was already in use by the FU740 DTS and the clock must be
enabled. The Linux and FreeBSD drivers require the property to enable
the clocks correctly Re-add the property and its "clocks" dependency,
while making it required.

Fixes: b92225b034c0 ("dt-bindings: PCI: designware: Fix 'unevaluatedProperties' warnings")
Fixes: 43cea116be0b ("dt-bindings: PCI: Add SiFive FU740 PCIe host controller")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2022.08 of dt-schema is required.
---
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 195e6afeb169..844fc7142302 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -51,6 +51,12 @@ properties:
     description: A phandle to the PCIe power up reset line.
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: pcie_aux
+
   pwren-gpios:
     description: Should specify the GPIO for controlling the PCI bus device power on.
     maxItems: 1
@@ -66,6 +72,7 @@ required:
   - interrupt-map-mask
   - interrupt-map
   - clocks
+  - clock-names
   - resets
   - pwren-gpios
   - reset-gpios
@@ -104,6 +111,7 @@ examples:
                             <0x0 0x0 0x0 0x2 &plic0 58>,
                             <0x0 0x0 0x0 0x3 &plic0 59>,
                             <0x0 0x0 0x0 0x4 &plic0 60>;
+            clock-names = "pcie_aux";
             clocks = <&prci FU740_PRCI_CLK_PCIE_AUX>;
             resets = <&prci 4>;
             pwren-gpios = <&gpio 5 0>;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
