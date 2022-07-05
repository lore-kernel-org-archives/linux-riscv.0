Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C967ACCA47F
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTJIu+Mxvk7AxdTmXzt0MB3zw2OY7O01cllbCJ81B9w=; b=FjHUdp0a0drO7V
	VjQ8xh67dKkP8wJuETgMwI2caiXbzAH/efJVmTW0Zl5KGV3RV8+pmH2t6fIBwOILVi9sniFNLmsws
	tDGoTr1xM0I1jwS/dPA4r+W/hjv4EZt/SVRuJVyo4UwCnxTepSvQq0BEIwb85NMQT9bwK9uyyocaY
	X4GbZvUSaAdl021D1XFSUOt8xlO+JRc7uG54Dk8bPlnlcAChIjwHmXNMG8z28HAqNr+xplVVjrPmW
	GcvcH1+UU7DwC515PoAyu42WkmzH5KUix7y13tI9On/H8lu1tSEChrQ9TG2LLE9ZD9A3M60mn8fuI
	OspfRdIPwCjz1wopCVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTE-0030UD-As; Tue, 05 Jul 2022 21:52:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qT8-0030Ps-6y
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk26so4314310wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bn7NMU6i2JipaHjilcDVj2dVJzF0Mozbq5+lea1OdzA=;
        b=Slkpsl7r9Kp451ZNey0oEZzxjuQF0suIIjxL9cZ2NQwn/t1lFAU9Tnh+suky4eMS1h
         YUmFPg8cYA3FAofnfJJV8ocNpuN2u1BAa+fQ35PTOkwttnxQ1zDR1Qc8de64sYsXnBUH
         ajLI4JkOsiOJ4FmFcWefB6nrvs/7GyrBRKYz+6/eOYVP/BE+xSu4DAnMoA7m08+pWwaW
         ELJHDcXeFjTZU4OrOCwONiswxxTNfceAQzWy+UcN47rs6g67curC4Asuc1MmU70KlF/V
         nasOCrdsJTNHCfg3y67UHtpYybbM7aKBZTTjA/5NNdVuWhbOCRNbKDRc0WOCbLp1OcZd
         jA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bn7NMU6i2JipaHjilcDVj2dVJzF0Mozbq5+lea1OdzA=;
        b=4zBTwsNzy3+lddvW5Thw1mx9R/176OXXPYknoLVvb54GKhuVB/J8uQD9/Wy1l24kVI
         +v6sI7FLtaAs+lg8NzbXB1G/2c0pku4WcMrwwvQiusseomB28fPq0RjPYYq8pCD7CAg+
         plYbnqGu01+yG54+H/TaJVCAdLQ/7Kt98FcP95F9YvHak7iEseyX8z6EZwVYDN3RHshN
         7w8VdqDbWR1HwwkV/hh1j6VwPToi6Mu24rLMJ1uiLPJcbDU4PTLXWOXuvePZNn4HWigL
         HX1z6KCQUzMbJk7yKh0N+UNpT/PA/2dnhkys1Q2MmoN7iAJIADin2h5FhQDrhag83Ze3
         g0nA==
X-Gm-Message-State: AJIora/f0viv/do3sA/hVzWnD2qFZht9uCc62HzliDUJlf9R91RFXsPi
	H62z3q80UvBbf796RJsGZ8NpRg==
X-Google-Smtp-Source: AGRyM1uDlF2/DUTmOv95q9ml3VpkOLRHZuDe6OmNqYM6t+SWDXd/DCAq3Jod5QPF4ItOmxcBKE2/jA==
X-Received: by 2002:a05:6000:1888:b0:21c:9a16:5cdd with SMTP id a8-20020a056000188800b0021c9a165cddmr34342146wri.562.1657057948113;
        Tue, 05 Jul 2022 14:52:28 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:27 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 03/13] dt-bindings: dma: dw-axi-dmac: extend the number of interrupts
Date: Tue,  5 Jul 2022 22:52:04 +0100
Message-Id: <20220705215213.1802496-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145230_333615_396CA4FA 
X-CRM114-Status: GOOD (  11.83  )
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

The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
controller, but according to the documentation & devicetree it has 6
interrupts rather than the standard one. Support the 6 interrupt
configuration by unconditionally extending the binding to a maximum of
8 per-channel interrupts thereby matching the number of possible
channels.

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 51
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/dma/snps,dw-axi-dmac.yaml          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 4324a94b26b2..67aa7bb6d36a 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -34,7 +34,12 @@ properties:
       - const: axidma_apb_regs
 
   interrupts:
-    maxItems: 1
+    description:
+      If the IP-core synthesis parameter DMAX_INTR_IO_TYPE is set to 1, this
+      will be per-channel interrupts. Otherwise, this is a single combined IRQ
+      for all channels.
+    minItems: 1
+    maxItems: 8
 
   clocks:
     items:
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
