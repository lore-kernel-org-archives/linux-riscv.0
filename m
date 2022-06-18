Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF22DCCA473
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFowfAjKSEL3F9jTzQNKPB2H9Z2vi92x4pIGJdce3vA=; b=fJ22xQ9QYXekZW
	x0zYpEVl97kYQX/6Uto+f6YgCjxgdZz3qjis0z2GQTEiJt+s9gt0s/Ekii4AXXaMz7wMz8xGNZQE9
	gGmvU+gA+rt2ndkCEiG+oQbbIWpOJmE9nLspvEnLlm28FTLa/N6q38cxxDEwvNvejjmxSTd//VLt4
	Z/svjBf9/7ANxfL2iJmkaWa/j4cjErdmz9m+Fns04kNYtHmggLawV+TNlp8BURYOKCXjwTaWuIsg7
	x1m9C9Sjx37MmqTr2YnyksyY7G2o3C/B6VDZrfB3WP0lBZU59dx0mBPXem5OVQ8cYJUvxg6tWOViO
	vsndA6y/psm5mqdj0Yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcs-00BHpm-1c; Sat, 18 Jun 2022 12:32:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcd-00BHbQ-Kt
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso3553139wml.1
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
        b=aHjW5VkiLOJuMraDAkim12MSrvxYtcnkUa+6XugCv/phW+l8JDcGEqmFOjtiPLghjo
         iDjWHIMizesLDejsxE38i+OtY7WWj3x11BBfb0BRUdXpK4pu3MkmLgAa5dvPF4Y79U7L
         UBw2DK7UQ4hfNaYZxuStYUEYkp5i7TbAmelLvl2Ui/7w8TkzozVKIQaX5ZY57N429Zl0
         xgWDMpxIW3ayHXhWUHqQjQuXwVBfy/ElkaLVd2hLdCEkKi4zy0N/eTrZ8OwQ4dltk65u
         J4kCuiGGXyE3akVz8UzRk2HQ3opmwMzKwoXk0plpXwMqySPXygB+SYToa/Kb5HF8Q3nD
         BP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCkvd1rq89W/6SrEihtrV93zPOh8bp4EvU/AesUDp5c=;
        b=gMTJ2eezFk7Od1GrfNlbylBvFhJUO8Y1upB7AGuhiD0JYbEgZDlgXY2S9O3bRYbOyq
         311DD77L78RBKlG+8/ZZRpfjZ/0AFUxZbUmefWJ6SRJRp5mliL4Yq3MQ8kuPptMT7f/k
         pPwk5E5Wj41yNReLHP5q3I0JwSI4Ei7rrh+Qz4iqpsJsYuQrkpo/Z1JuO30RTD4rNF9y
         YzTa3pCMmz+OQmDM7FFqi3jd2pRoi1KN3E4LWUrajUBt9dIE3YdVD96haUCwNLJDuXhY
         m8PnSXLES9MExQE86Bq6G5cv6AiBDG3v9bEKNv7ODV8Z8Tr9kvBTXX0tR3SEC6EiCn+0
         Djkw==
X-Gm-Message-State: AJIora9EjIbUZ+CaehaLITY5DbFD7/lWQIaoTYIFD9fZISb+LM2wpXg4
	FpZquKivNZf61Knb0WqJzK/u2g==
X-Google-Smtp-Source: AGRyM1s4BntBiZAtPtsynxF7uq+efiHJQnjp6f4ztefKsZzCsrAEC1MDiI+wsPar7tnOzz3WAfpCIg==
X-Received: by 2002:a05:600c:1906:b0:39c:8573:f330 with SMTP id j6-20020a05600c190600b0039c8573f330mr15063952wmq.5.1655555533520;
        Sat, 18 Jun 2022 05:32:13 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:12 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 08/14] riscv: dts: canaan: add a specific compatible for k210's dma
Date: Sat, 18 Jun 2022 13:30:30 +0100
Message-Id: <20220618123035.563070-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053215_748835_01A581A1 
X-CRM114-Status: GOOD (  13.27  )
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

The DMAC on the k210 has a non standard interrupt configuration, which
leads to dtbs_check warnings:

k210_generic.dtb: dma-controller@50000000: interrupts: [[27], [28], [29], [30], [31], [32]] is too long
From schema: linux/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

Update the binding to use a custom compatible to avoid the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 287ea6eebe47..314f6da5d7f6 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -135,7 +135,7 @@ gpio0: gpio-controller@38001000 {
 		};
 
 		dmac0: dma-controller@50000000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
 			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
