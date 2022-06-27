Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBADC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hm6VG3jX0F3Ih+JyFZRqiNgOiKLfvv5wVBySIFRlZ/I=; b=nVLL/G3jF8n6Je
	TF6ZvbH5IR4qpXg42vohhlRaf6C5+yxrjiCp62fUAItTQqOAQIfoX+CixWlJkvXKHtH9O93/KUypG
	7kbWN2n342H/xLjTRgkFs8IiiSX9od4n7Dpwir8sfvu/H79RBHSMZYVfVvu0LCDQER7E7mTiIQPf2
	DmBy9AnT3vslGEfXSomlOU5pU8aHrxA6l8rtoUu1ZLrh1QsGRhV0opJIYikBMct2H+M6/sGVR62dt
	8+H8vwLPeKqVJzJuGE6uHv1vdbzxkRQkmMW/QRNQfDnFcF59ram9Jw3VOQwt402bvtq8RqcMkKZ4S
	Q1Wg9rB1DtTWFUzY8J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucg-002bSx-Sj; Mon, 27 Jun 2022 19:42:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uc6-002ar4-Jc
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id n1so14464238wrg.12
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0yX9mBCtyn3dt/LFcnWYLnHjmmtyKFR5605f1mLuzSM=;
        b=AtMYN6PSkLA1y0PqfjVZ9B2anDv7fpdxjk9Z2GEBmdgR3Y/a5AVf7ucMgQk3IvAslk
         Q0FldXcJOm2h1zMZQtoN6HX/VUa9z6V+celDZ6Cf6uyoZ436qN3qrQ4XzyB4kEaC/OCy
         hcHOUjibIOU8Lfa1bhhnNuso3DiXNufNqD3OC3JF6FBFpZWJXFeM2Ph8krHKA6xsWkzO
         fu96DPwW+8Wa2B9/eZ4mV4u23G09Fp5aWq/QeIOVXKmMAqyQFsynIPrm59xnsG6Zk4C0
         oWRHhkY277ATUfplHzV4oeIn1Ke23xrVrGkP/kyz5t1D04Mi19ZmsHObET6qcXxwAAAm
         jXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0yX9mBCtyn3dt/LFcnWYLnHjmmtyKFR5605f1mLuzSM=;
        b=Uqic9di9ZHF1N0EaaWkzxmeG/BTfkhRFG2+XeoU1s3+uL7fecTcE/bj5+VPNOzPG2h
         1ArXDFyWVSvglNOH44BHf3+pnB0Lnc4yEt3bKc8Dqzc44WRi6uQzvmjsBMb7+uS6jFRa
         DgaxzAsjOCIxXIOu3PRjqUNBUE+3mxQ7Jnnocff2Mdx4rSTYZc9RsKn1XnIObhMxNkQ5
         wPi0Fc61Ut07xU+nhLT9MGQ0z1X1lb8eVb5M18fBVfWl7MrCnmyFGiFXdT067YYPo1o+
         hKhOacuihb+hbBE/X6kCwOp77nPcr31JCCEIaCVqA/NBrqHzccDJ+GFrcH+Cr88GOdRf
         QL1w==
X-Gm-Message-State: AJIora9QD1Y+PjQYjD+nw9Jjert2iYKUx3UXfUVbPGBppwcYa+e8WoNk
	zDLnh8MA/lwqbNFvBo1zGQF7fA==
X-Google-Smtp-Source: AGRyM1v+CiQCqjbnq4vRMZqSCSRDlEuyAPNKkRp+mF7UYQN9jimLW4SxHvA7KTYHLOBZVxNPsqPSbA==
X-Received: by 2002:a5d:584f:0:b0:21b:a557:98fa with SMTP id i15-20020a5d584f000000b0021ba55798famr13392886wrf.462.1656358893163;
        Mon, 27 Jun 2022 12:41:33 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:32 -0700 (PDT)
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
Subject: [PATCH v2 10/16] riscv: dts: canaan: add a specific compatible for k210's timers
Date: Mon, 27 Jun 2022 20:39:58 +0100
Message-Id: <20220627194003.2395484-11-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124138_701195_2FFAE73A 
X-CRM114-Status: GOOD (  12.95  )
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

The timers on the k210 have non standard interrupt configurations,
which leads to dtbs_check warnings:

k210_generic.dtb: timer@502d0000: interrupts: [[14], [15]] is too long
From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

Change to using the newly added canaan k210 specific binding to avoid
the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 45ccab36618a..be42c56e770c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -318,7 +318,7 @@ fpioa: pinmux@502b0000 {
 			};
 
 			timer0: timer@502d0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502D0000 0x100>;
 				interrupts = <14>, <15>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
@@ -328,7 +328,7 @@ timer0: timer@502d0000 {
 			};
 
 			timer1: timer@502e0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502E0000 0x100>;
 				interrupts = <16>, <17>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
@@ -338,7 +338,7 @@ timer1: timer@502e0000 {
 			};
 
 			timer2: timer@502f0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502F0000 0x100>;
 				interrupts = <18>, <19>;
 				clocks = <&sysclk K210_CLK_TIMER2>,
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
