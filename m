Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117B6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z10eneKNzYma3BeIj3LeLZBIyGQB7AjwpqplfOMzeLI=; b=zersETTyFAlRDb
	+cIk8hfL50q15lsMcZkfvqSMMbq31dhrlWIkX3Dq3BNNv3zfL7RLqEjBeFq7apNJ3SPPYI7dKNjc/
	DZtcagmiDz8h3OKGA4Gtn9jT8kWK9a5U7SUgVP6VjVDOwISbKAHddgaiaNbltxguPDgqwtMpse6kO
	9GVWkCbbrgfbyz+NIJ6gncaEVANCuf2B6hYAF+PXdcVh4Nx3aORIcywU651Im/wKcf6sZngqlygcT
	fv3Xk1QTxkNZqogkcsKt/2josi0/OgnymCMysbIOotu3ebMULh5tU4qish9k2Hfu5/gYN5umGtVqX
	hjBa5CIeSHHQlqADK7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTC-0030Sj-6V; Tue, 05 Jul 2022 21:52:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qT8-0030P6-75
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v14so19385848wra.5
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8/fojUw0EeEcK+rqcJSp3I2q4GoLWZt/YWa+Regpf2w=;
        b=Jr18FWZSzSRSneVObsSjnVJxBEUXAHsbqU/4W10bboXeXN2L2pGC6VHQ4lgo/UBYrp
         J0CMP0GRKp8dUKbMzK9I1qdn1rq3wK26lnd4XTIQ0sX7h71LptFUbULc6iaAnW6WGhm/
         okjirNplhv/WA9IcoywKUcGHw+BXG46zwI2GDKyZOkmqjyOn04Z5BJhC7yJplgdtIB49
         wuTwK1SUud924+xRGcyrhru3Yn2If8/5ynnTC895rXmhv7F9KKS2ySwpJDiF/o/a0tk6
         AVZPaubBcC4eXqg35e2ngXfchcbpzRQnzCgaBYEME++JqIp0fl9txiaPCPAGuTEtjsUi
         YJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/fojUw0EeEcK+rqcJSp3I2q4GoLWZt/YWa+Regpf2w=;
        b=YJXHzZGtOaSNnhpUyN3gkzaZ4AosvRXLzHzXV8zl0kV1eDmDlZAIpQUciJ+QXMBb32
         rJ7vnkNEF54iCowjTiQ5yNK1jCDt+MJWFvTX7ksoWyhZtcIwFkwQlFKj84zpY8J9c/Oq
         4mJjhyYKNUephWfMKgDS538clbL1yP5TKJbcqMDZv9CSKVNtdvWGDeAeHm8AKjEkCKIm
         LJh7V6hgoc4gf/YOd8wBZm3hLrznHgn8UNju/la4YfUAMlNEry++7RM/To9kqWplyr8Q
         5VPHxmxUhTyv3zMI+Y2W8UhSnr5jfY6CmuNP8McrcVQnjZMYAWedqyOoQwj29b9DkUWK
         lfrw==
X-Gm-Message-State: AJIora+EUd9Vnt0hZlXBdZ3Z30CaABEMoTsToFvMcMW/ypxqfjU32aQU
	JwVsPAxMex/IHC/l+8NVmMGFaA==
X-Google-Smtp-Source: AGRyM1tX5bERlh6TaveO6GrgyXdZI+WLqirgKBhUqp4y28CVn8caA9+OntupBTJIPlHx+MDpz9T9Gg==
X-Received: by 2002:a5d:5985:0:b0:21b:c74b:5a7 with SMTP id n5-20020a5d5985000000b0021bc74b05a7mr31952683wri.242.1657057946655;
        Tue, 05 Jul 2022 14:52:26 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:26 -0700 (PDT)
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
Subject: [PATCH v5 02/13] dt-bindings: display: ili9341: document canaan kd233's lcd
Date: Tue,  5 Jul 2022 22:52:03 +0100
Message-Id: <20220705215213.1802496-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145230_352799_ECA073E9 
X-CRM114-Status: UNSURE (   8.91  )
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

The Canaan KD233 development board has a built in LCD.
Add a specific compatible for it.

Reviewed-by: Rob Herring <robh@kernel.org>
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
