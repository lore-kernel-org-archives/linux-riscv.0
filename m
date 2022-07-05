Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C2C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKnlG6aON+vHtTrxLaxGgPh/jea6jiLi6DBTsFSOsmw=; b=m8kjtBVwWhSPR7
	6RlueTDRp3hrJG94ni6IEW9QGl7eIg8glfh9fENwl+dt/qebtLk/XUOGfSJbYiwrWMG9VT9FPCMLC
	iGp3vq/73ArIOxOh/tS+B9j2huljAhnOnmBTiKFlBX+sYruQ9H899TKk8Zpp4rdL6wT/w+CjRRZ1U
	2QYOHXP7m28D0SZP33vGfM52ycBWtJ2qDHfmtC2JHAlOddp7prYlvutS59YhHWMXip2GMgjMezPzj
	G9knw9HaRm5iAufdcPlo+kx0woPwTBTV/k1i+cdz8CLOvLAky9UlMWrBR0E1M+9Qkv2jp9f35NvIX
	RCrNOwG4QnB2gAy5/PCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTp-00318S-8V; Tue, 05 Jul 2022 21:53:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTJ-0030Ry-5P
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id z12so9787320wrq.7
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWVsoJ84nebg5qEzx/IyFZjNfcxxChmP9JWxkkGh06M=;
        b=bNjVpXzmlR/oWM523pD7Hne1AQQQiJuJz7eymu4r8tKUB0QnUyvNkL1aZIAxqUooj1
         7ihDvcph+Hv85n2NhhFyIcvChV6ZYHBSuL0TfLXBN28IINhNsV8hUqQz/SlKfVTjTsb7
         LknjMoulh7s2k46gfpL15T51BpP11SIJPktkH4UR9iuaLkRyzjbYSadCvPzXbLcBjhoB
         tDXWYHDOa57EAjaRLpeFhmKYG2PSTbvCNdceBjvnTYwGHKteRI+1wFGI640cAeey0kmB
         IOuARbRZuqQW3V3qs8fqjCY+OmQ8YhPuJW4/bE1xcuBIY3hi1nCOP0qRr6w884X/VAxd
         dbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWVsoJ84nebg5qEzx/IyFZjNfcxxChmP9JWxkkGh06M=;
        b=g0q2UaQHzoSsjzXOztIzO5O+mKECDMcfcm3d2YY/JjnsHX5BCqdp9ZWaJLAWeWnkPo
         pBmFkS2YmkS9BOtGeZjt4NHeuC1DZEEEYFIkGF/uNptFXc1Z8FCchFr7CrUVETP+AcTg
         YybBh0IkrWDqZunfAlVisXS/qXYD1YZhFq8bzBrbPceJ4D5SKEKc4fK6uO3R8qu5xVfd
         cS4wqVv2RTgIrfb39Mk1EvevnXE0Q5Oac7U9zPojeePjB71OwegBBWsa+rIIxcQX0WYg
         yoh97N27LOvzhESQg9DST9v9eMJZT4rSXEUUrVg5V5oOXMNapxik462cvUy9etbydMCT
         XgaQ==
X-Gm-Message-State: AJIora/hYg7PTTKULxzk/F+pUcnKoQ0oBi4eF904dNmsqADxWGUVbLCq
	KUKi2m9NhLvPPyiukg4iZV5lnA==
X-Google-Smtp-Source: AGRyM1tU1s0Kd36TQuvH5KjPiRqTOb3JL0g6qqv8u238NyO/YXr5MyXJLGr8xZQuXd4xQnYkdnCjzg==
X-Received: by 2002:adf:9cc7:0:b0:21d:642b:85f2 with SMTP id h7-20020adf9cc7000000b0021d642b85f2mr16256358wre.21.1657057960735;
        Tue, 05 Jul 2022 14:52:40 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:40 -0700 (PDT)
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
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 12/13] riscv: dts: canaan: add specific compatible for kd233's LCD
Date: Tue,  5 Jul 2022 22:52:13 +0100
Message-Id: <20220705215213.1802496-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145241_243789_E6884C68 
X-CRM114-Status: GOOD (  11.26  )
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

Add the recently introduced compatible for the LCD on the Canaan KD233.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 4a540158f287..b0cd0105a5bd 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -127,7 +127,7 @@ &spi0 {
 	cs-gpios = <&gpio0 20 GPIO_ACTIVE_HIGH>;
 
 	panel@0 {
-		compatible = "ilitek,ili9341";
+		compatible = "canaan,kd233-tft", "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
 		spi-max-frequency = <10000000>;
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
