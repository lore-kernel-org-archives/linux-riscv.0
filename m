Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43135CCA473
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdveGPbK8jJb4vo/7uvG6s+KhzlesvoXB9HkgADa18k=; b=PFHLp4EcsKjZIH
	88idv5fI3UjulaiZ6gsekjpBxsi07rlfQNhWalFtkl88BGnnkyhRZs15YHoEzOiW+DXk2c6WJr6VQ
	pvlCXdoZzZfmIzwp573VwrV3wlrRoT1BRD7njHO+sD+X7XPAOEF7g8Bdd9LspgM59b/4n1VnAiG1t
	GCl9Xuso5n5Q8zVmAI+aUSrGWeOZG2pueKA4AtqcrkdklixM5QgOd3ddoxiEWCmH79NL1ift2ca/V
	6mdzNU/fNWz7hZCuVYmoTO1DBHNCgUEyGPhBjcXkTFhYi4/os6kJGYMHBnQqaeaGX53sd0YRFb6HD
	CN7Eo05hjAryYiCtTp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcv-00BHsz-6i; Sat, 18 Jun 2022 12:32:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcd-00BHVp-O7
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id w17so8782348wrg.7
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANXJKxbxI6u0tRhbN1AR4RFN+HN2j5iiePXGo5syCSs=;
        b=ErRXmSLorMjbdC5xWyP7urzRERR22/20eLl2XT0de71YUvLq9olsxJGpQ3PYt53udC
         MVVWn2OjFLzgo73dqk3/65ggchSO1J6/nfMBeW38N005pku7I4zSrpTv/zuaPfLKqJXk
         qjB07OxZX64wGSSlEDl91/abWVL2GYNDo4+scSLK83C9i4JROcieRdmp2gRhc8Fbnv7b
         b+9kOPXlfRJAEYkP1FzaLttvE+ReKggwoO5cB1Sf7ynv7N/LnmCtOMTXn+ccH3yxMsLw
         zDc7cjrPkXazBBOkKzNLuqxuVA3FOYoudEVTiel9Zmf2Ygdp7uXNnHjAvJ2fnRfqPbuk
         SpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANXJKxbxI6u0tRhbN1AR4RFN+HN2j5iiePXGo5syCSs=;
        b=oBMuBbbB6lTFKHLHW6VsT8rRoYy0RjI5XVRXzjOkcZu6p+zlaOKAnCq4DFG4LjEvO1
         UxBfiKie9pQZyRPrrMbYv1hZydYhMSgHegXdLgVuAowjbmunB/ULnphAJVyDhV6G3uZA
         hBGRVxC+n7PVqdPSjXmb1mcJFLn/+ybLLjmUJ0gFi/CsTy8+ZXCwWcTC6TArq2FEtxMf
         aaYsxxr/p7v6MnUdyQAE+KrtdKO2EoIkkjWAVM6PbR+BUePHseoTXSiHHN+tNiwNsDds
         9c7yUkj870fNzGwIkofcVShtUgToXnXaMvjFgCO5sssdWgVyWO84CgL1x+adM8ZWNTl3
         TmkQ==
X-Gm-Message-State: AJIora8S2NYonUdTPDWwxfkcriGPkN6giYSrVgMY1Z87EsafJzfzRysG
	mHK2lvIUpSrV8BLt5DADu0J9zA==
X-Google-Smtp-Source: AGRyM1tbrkXYGfjWsBsEjmtzpjiA7Ap83fqu9IJcwCnfQzpYaSuFuxLt2MogvQUzBnMlTPtFn6izqg==
X-Received: by 2002:a5d:584d:0:b0:216:a2a9:5f2c with SMTP id i13-20020a5d584d000000b00216a2a95f2cmr14168978wrf.184.1655555535278;
        Sat, 18 Jun 2022 05:32:15 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:14 -0700 (PDT)
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
Subject: [PATCH 09/14] riscv: dts: canaan: add a specific compatible for k210's timers
Date: Sat, 18 Jun 2022 13:30:31 +0100
Message-Id: <20220618123035.563070-10-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053215_861616_509E673F 
X-CRM114-Status: GOOD (  12.31  )
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
index 314f6da5d7f6..ef46ddf3c00c 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -310,7 +310,7 @@ fpioa: pinmux@502b0000 {
 			};
 
 			timer0: timer@502d0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502D0000 0x100>;
 				interrupts = <14>, <15>;
 				clocks = <&sysclk K210_CLK_TIMER0>,
@@ -320,7 +320,7 @@ timer0: timer@502d0000 {
 			};
 
 			timer1: timer@502e0000 {
-				compatible = "snps,dw-apb-timer";
+				compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
 				reg = <0x502E0000 0x100>;
 				interrupts = <16>, <17>;
 				clocks = <&sysclk K210_CLK_TIMER1>,
@@ -330,7 +330,7 @@ timer1: timer@502e0000 {
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
