Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA9CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gshEyq3YBs020pIYp8PWESeVTdK6d7oSGO4aD1/Eegw=; b=cRpg2yeMdeMZ/8
	8j29flBSfO2BlJtvQU9FPzpTaGVHeJL1mzVBhXLYmbgMoP8QUpDWxvsRwWZ0aT+0nvpnPLHfjjb58
	lP39Ej0zfQibpjKQFnF/us5rjDIfPZ5OOaa1vJ7LeBleIP0JB0WUTxnekkgZ/3UNiUAaU1dHpJebB
	2hTlJItLIkVDlSQJu5sYi1OE91PZz5nWEMdHNd+j3zBxElune6G7bcaUH4X4OvyGP4axMmKycX6k4
	RDTdeCF4MziOPusyhEh+7acjCljRuH4AEUVQcZzvugHgspA5uvRr3llZMYonBjjG6iXkHudAyGTMi
	/hr78gm4WlAnL9oQghuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrg-00Afzj-7j; Thu, 21 Jul 2022 17:21:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEZrc-00Afsw-WE
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 17:21:30 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bu1so3200810wrb.9
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRltm9CBKXROfT3TUcmTyCGbNeVKq4rgRYEpJSVmOTw=;
        b=BE/cWNCZlI0Yl2QqiuxKv8xSMdjJtWyLI/XATrhxomnVoulKNVnl6BscEEGiBjoi9J
         BZOY1voXavMn91Z/eD4KGNkYrKldYtbHnOVL31JiY9igICQa28VuBFpx1hmSWvjqUBMi
         EAF89C6f9VFQib4yYUeWDY4QnawWxcEGZaqJxhodUJRAMPnLNgBM1MsV8JAH3Pm8Q/K3
         QLWhvk4FjCGQ8/NuTqbwo4jLB77Q/+7i44oo4RfpKwLjr/T9JMa90ra6huIGyOmB+4rE
         rnWdSdTKQ60CBLLWjeIuFgpJMUz3Ao57HKpHTsKgf5FKN+P/m5U1ukj43M+l8uMN9ZR0
         BWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRltm9CBKXROfT3TUcmTyCGbNeVKq4rgRYEpJSVmOTw=;
        b=JWlMN7WmouK+O5XrKmqcGSx7n6X2VtBgac9QygTJCs5K9E3rGnUyYmSMAvT5lIBeU8
         wkxjVeUzLpIVTXK6wFqnBss5VYQ+mS7Z0qCTJjUpOArVmeekAJlK3DoQX9NtO4ailfTz
         eD3D+kg+lxxjTprxJQdHELT9KLiL6vWMtjvgIip20NwCuYUoiNgCnqdukRlva5ovNzjw
         wxpwFaN9g/y6wUyT67QaPeKy7Xbbd7ZuM3RwVmkrCoxLUC8fFW/siFRMophsCJU7ro9l
         RXJRtMFNAT3vSVvaJW0BcrLxpp7tU90V1vpkrxAWbFii0utufjmKYkG8M87hS+GMwDlM
         W4Yg==
X-Gm-Message-State: AJIora+ItWkix9r1xOg1pVvFjXcHuQW7iFSLTL7ZGZe90JVFrV71YflQ
	KBdah0gUy2tzBs+RcuhSKrNhEg==
X-Google-Smtp-Source: AGRyM1vbAYGz2xsyca/zeMEjF8XABXoOModC93BUJZC9+XeAjfvxiTzDa0Td1Cv679XzakodtlQW7A==
X-Received: by 2002:a05:6000:609:b0:21d:92ad:562 with SMTP id bn9-20020a056000060900b0021d92ad0562mr34175479wrb.369.1658424084463;
        Thu, 21 Jul 2022 10:21:24 -0700 (PDT)
Received: from henark71.. ([109.76.125.251])
        by smtp.gmail.com with ESMTPSA id e24-20020a05600c219800b003a2cf1535aasm2455697wme.17.2022.07.21.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:21:23 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: u.kleine-koenig@pengutronix.de
Cc: conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v7 2/4] riscv: dts: fix the icicle's #pwm-cells
Date: Thu, 21 Jul 2022 18:21:08 +0100
Message-Id: <20220721172109.941900-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220721172109.941900-1-mail@conchuod.ie>
References: <20220721172109.941900-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_102129_081930_E1A0DC30 
X-CRM114-Status: GOOD (  10.48  )
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

\#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
blindly overridden by the (out of tree) driver anyway. The core can
support inverted operation, so update the entry to correctly report its
capabilities.

Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to icicle kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 0d28858b83f2..e09a13aef268 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
-		#pwm-cells = <2>;
+		#pwm-cells = <3>;
 		clocks = <&fabric_clk3>;
 		status = "disabled";
 	};
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
