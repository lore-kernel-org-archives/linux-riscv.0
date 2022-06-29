Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70F4CCA482
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEuHc9xB45n/HUk/2seIcdwcUejqWcdGoo1XZ4Dr9Go=; b=uQ2Eg3TfQyiGmc
	D3dSkmfQdQoRstVwtr/ZmFvh1ijr2Y5lYDq6SUGB0OhQNTEGIxQKxR0F8UTKL42BIUvy0dKis/BOH
	HJSuR79J5DhqjV+d7Le5RhZ6lPAbg9c2p6eyQzcAW8pJb7snqKZZakhGDfzMeLF1A+WlyG24nSJdH
	bVIZkGI5fW8RnxIW2T8UUOXpYbc+KM+KCvTRq+zi/dsyW+eeluG4hVRZJEMndm9pFkDMZpspJ0638
	4Vtq8LLl4sW+dMawNIdXXpYL0yvwtsBH1jIEHgm2RmvP/4zhtLURTqgZd6Tx3qZZoAEejGPIfMjPB
	wWLLHkvXzk9bREqiwI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cg9-00DaDm-Mn; Wed, 29 Jun 2022 18:44:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cg4-00Da8m-LW
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:44:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id n185so9881921wmn.4
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lpjeVnS37MRZXTHhlWJRP5jSKS1LyxijGlzK/Tshm9g=;
        b=ATJhBJ9ugmok84wwSO+HYBz2wAsXjKYfnwZNqr4scgd0TZLvc8JVRwUZW3O0Q832jf
         DG/SQUKzkqUSVolgMZhDEbFn6nMeaCdRXFOqlOiulTMmYNxmafx9zS2dlWLSSsSCXjLR
         Z5PCawGeoInle7l9qzdYXzbyx1jz3mSIk6TXI+dYhK+E7sARTZgwJu93aZB7hRCTOiB2
         1fRFyZwJI5UvoofzuhSir/T3y2kr8bT0cCJR3FW1hNdGS2FGBoyDd+1aCjP/VCi377TA
         7+7xCBvGGA0Nt06Ps/ZZvI3hb3cmkq4S2dluOS75v2+k03kTrhNaWRtcM9hZgjyLU8cC
         gtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lpjeVnS37MRZXTHhlWJRP5jSKS1LyxijGlzK/Tshm9g=;
        b=aoUwNRztSj2pbhTw7feQLBVsxY46TkuTMQrCiU5rd2ILyAzdQrSM8DeO13kZYGrpA0
         WQgiSji954wz0LUCvn8nIA/FRZ/vmrI8zdEHAFS+G8zNMVV5h/wIF64M68iWpXBWrefL
         mGFJ00qJwrm/iUxOjA+v+6W6ZKCmI+y9YNPawjcFYYBjyxKjgzn0DsQcxAMlqslwOXk8
         2HNxp49aokco2nNRP21W65fFDRhwjO9gCgs2rFapC4LN3COkNldFUxDXWk53XnlFFnDu
         3ujaLHyDzGoXktQgzMLFIH33FUY8EJky/qAolxT1gHRycDVB5trveISTI50L79Uw4xqb
         ngdw==
X-Gm-Message-State: AJIora84sjk1cAx8/FPFmk7ku3AlLSjjnBUmBRJYTRZwDPRojizX3+3G
	IuUDwhqS7DdV1wCvfcwZ/D4tyw==
X-Google-Smtp-Source: AGRyM1vAd8B1ZGTJtHDdB37c3Ztn/6oKjQ+dM2AgrpPNGcXEijohVmjDFbvu8f/fC534km4KRK26HA==
X-Received: by 2002:a05:600c:4e90:b0:3a0:57d6:4458 with SMTP id f16-20020a05600c4e9000b003a057d64458mr5478121wmq.198.1656528279491;
        Wed, 29 Jun 2022 11:44:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:44:39 -0700 (PDT)
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
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 02/15] dt-bindings: display: ili9341: document canaan kd233's lcd
Date: Wed, 29 Jun 2022 19:43:31 +0100
Message-Id: <20220629184343.3438856-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114440_753996_02C9FD6D 
X-CRM114-Status: GOOD (  10.67  )
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

The Canaan KD233 development board has a built in LCD.
Add a specific compatible for it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index c5571391ca28..99e0cb9440cf 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -24,6 +24,7 @@ properties:
           - adafruit,yx240qv29
           # ili9341 240*320 Color on stm32f429-disco board
           - st,sf-tc240t-9370-t
+          - canaan,kd233-tft
       - const: ilitek,ili9341
 
   reg: true
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
