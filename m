Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0896DCCA47E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utiTjTryDf8OpfD6FWfk5YH6Ej03xSRPAgLvWszsI8Y=; b=2QZPtaDjePSPn6
	Y0UcMqQ9Q3UEXJxDz369H1rIVhl5YieEG5io80/vN9FhCRR/ePaRyR4xC0MBUXNsn2UMbANDvvJK3
	wsac8eX8gI9CHLrbQxzD/3iTE3xJMHGsEdzaxqCmWFKL5J5qHPzz4Zi7lU0dM4Nb5tsSqunJ4KGfq
	EEnFraeexH92TwTQIDpuqpWh2IlrwqcdSjYLnYVYbydtjrxmltIOFPYkhSdp46rN8EG+MhcZiFqdJ
	CCXYevSL1duuMKJgbZZ907xYBKksgXzaRMrybaZRk8W8uh4faNtODYe/mtaZLM/wIAH8pPqXDOor8
	YsXfG4ChVkNx0kZIIrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucJ-002b43-67; Mon, 27 Jun 2022 19:41:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubu-002ajr-UC
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id r81-20020a1c4454000000b003a0297a61ddso6656450wma.2
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
        b=cUa3Qgj83LJO9FwTx4+4xOL790JLFgJuhmgrSJi2YTyi4TgZ3QHn23OZlSeP4eGr4a
         +enZvFjacedK5hJJSmGuCcyBjxh6MEKPUZcAKWykCCkkzvwUXNfJsUoFjLQwQryYFGEJ
         SEbmehS1/iTbEmVVTU2q3WXprQHUDo8Yv+5IRCY/CL6szKGQQ7BpxVYKxwivyntZnwWp
         5Xv8KR8mPYL/SOmWZuX8ct7NDa7Xzt9ST4L4cgfrh9H9lYDK+db/7RreYUhPECg4PNpK
         JaGXGh00MEhhzcMG33inGWEsNDk9YWUpGPQgCmkOL0K2m2AjTH2Zi02b+cHy0MmqI0tK
         MzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
        b=0UBzeaFI5N6MAMgAlfRTkRu9seM/h7nPArgW8Fbfx7nH/g1XLfBYfAsTlTisgPTkag
         fHaiWaEPqzlNo6P846HcdsK3R8tCw+BiyH6cWZMAhkDAQdlvS5Z11m01PQjfJ5Pto/E1
         4p5wJ7r7t2KMKjjzxeN7jgm2GTonrWutwW/i0L8T+IivwHXrLi9sP+tlKI+BYyjREpCv
         GHmzz8JKpqogPr7ccInpnO2WLwND/NUmjIfQrNiZUEW555/fodVLX1Lr0WaAuZxeAnXt
         0nwVXnjgS7Hl4IVZGIMfv+d6PNwl3rtHD4Q8+PNbW4OwtpqKSPYb6u+slL4LZBkg6yTT
         WFEg==
X-Gm-Message-State: AJIora/GnddZPbLzWvGg1yPn3I5wU65DvDuKNDHYcZgw3cv+w4tnY7cx
	07H79J0ioMuR2o1nJbC6eJdBXA==
X-Google-Smtp-Source: AGRyM1t6tJJ0mxAtUsYUzthMYkrnacnVvnK447unbGgsisXeL7ZGVx2xR03CLUvVfWRC838snmZcVA==
X-Received: by 2002:a1c:4b05:0:b0:3a0:32df:533 with SMTP id y5-20020a1c4b05000000b003a032df0533mr22012475wma.155.1656358885670;
        Mon, 27 Jun 2022 12:41:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:25 -0700 (PDT)
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
Subject: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
Date: Mon, 27 Jun 2022 20:39:54 +0100
Message-Id: <20220627194003.2395484-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124127_034683_FC9D6765 
X-CRM114-Status: GOOD (  12.92  )
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

The Canaan k210 apparently has a Sysnopsys Designware timer but
according to the documentation & devicetree it has 2 interrupts rather
than the standard one. Add a custom compatible that supports the 2
interrupt configuration and falls back to the standard binding (which
is currently the one in use in the devicetree entry).

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index d33c9205a909..9a76acc7a66f 100644
--- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -12,6 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: canaan,k210-apb-timer
+          - const: snps,dw-apb-timer
       - const: snps,dw-apb-timer
       - enum:
           - snps,dw-apb-timer-sp
@@ -21,9 +24,6 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
-
   resets:
     maxItems: 1
 
@@ -41,7 +41,23 @@ properties:
 
   clock-frequency: true
 
-additionalProperties: false
+unevaluatedProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-apb-timer
+
+then:
+  properties:
+    interrupts:
+      maxItems: 2
+
+else:
+  properties:
+    interrupts:
+      maxItems: 1
 
 required:
   - compatible
@@ -60,8 +76,8 @@ oneOf:
 examples:
   - |
     timer@ffe00000 {
-      compatible = "snps,dw-apb-timer";
-      interrupts = <0 170 4>;
+      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
+      interrupts = <0 170 4>, <0 170 4>;
       reg = <0xffe00000 0x1000>;
       clocks = <&timer_clk>, <&timer_pclk>;
       clock-names = "timer", "pclk";
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
