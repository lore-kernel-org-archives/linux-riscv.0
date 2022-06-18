Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32860CCA480
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utiTjTryDf8OpfD6FWfk5YH6Ej03xSRPAgLvWszsI8Y=; b=Mf30FNJP9mgJIv
	b6ICK74GEqRzhR8w0PvU3cHhC6RKSfbVvf9uiYkFkdxBisn8PpIOZ6V8zQCCIJIo8h0lrlEX8tv69
	6NahATs+Bf2pWGmykg6eGtVqc36LVDMcX2YGyYycn5LmHdqZYH6Vb9jCFAoYkWa39zindHMlEczWI
	0J+YCiMxycMRIUOhix4IywYu5ABOIyHQ5nUYHaqPPsfFBFNTU5EE4T5CmsKaWF9jzdopkwQh4t9W3
	EeTWzZOYYukjQ2qM9OJdKzQPR2LLtwyv8uYPQUIVlIjc5uGxL709nX/yQwVqfjfcvpwNhJZjgkORn
	bYdEle4UBSOrXihAz4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcc-00BHbD-3B; Sat, 18 Jun 2022 12:32:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XcX-00BHWS-9G
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id m1so1046347wrb.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
        b=Q/DW33pApkzDugaxPE3P0mBkLxqeHFjsQF8z1VV2ne8TRKuN2bIqDfzxsSTkLEjBrA
         wpdDJgUWP+1wDHdQ9JS4O1x4Gq88lL49JAWRWB4H62ef/kDIyGqiJWklnIhvj7t3gOgQ
         m1btN41fR+l8tqU5xRyuBWhlJfRunVaRxbUCkNPjxFxCR7fgJ76b5iLyDoxgvaEFgta2
         Y7jzvGqyxY8ynrhbm2wsHOUw8jsjq4R2c+1hs16sLw8LkR/A8wnX+Rcz+CEvY4HTn+12
         wA1hi5h2lS6EglrFG2mc1iaWo2T8RWK90k4OmUe37mNSSxwVnWaTmTTERIaDVuiKnqg6
         uvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
        b=DrabDlD1lUGKYugAMhe9xhvMEDSKR2MArUPDMmRogdbOPzDoavX4xAn/RjAEDsZQrQ
         4hg0kl7jp+cQUYiuSin0FCxMsiSd1e8lx9/3Ae8QbG5mbY2S/X2tbNDUh07d0Odem0p8
         +bgbIopXgRZ8OmTOgJN8cry13ZKn6g0twTpxm/NozDlpBgcBPutvcVdEYECgtnkEmkpo
         7qWRABceDRcJx3b6scN2QFb44IZI/trGSChUWIwLqO/1n6VYUjMAL0jh96ilKsT3FWFN
         bOepTthqXAcKP7LORjzqYNU3kcE4J/WfLfbbzncd4qM8mTcuw6lcsskua3aVEHRvtcTU
         Iv0w==
X-Gm-Message-State: AJIora/kH7QyR7HT17VVf06gnDDZBoPs49xDuUkMYSqabHkg5SXD6HMZ
	kAfyXTrWgaua0oEs8OtUdFsjLw==
X-Google-Smtp-Source: AGRyM1sSSQqHjZc3Rjokw1+aDQhZh51cPdEwrDgxvVJw3mbh+xunRoRwhQyu4jAgaA6W5FK27IHXAg==
X-Received: by 2002:a5d:598e:0:b0:219:ea16:5a2a with SMTP id n14-20020a5d598e000000b00219ea165a2amr13955140wri.343.1655555528086;
        Sat, 18 Jun 2022 05:32:08 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:07 -0700 (PDT)
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
Subject: [PATCH 05/14] dt-bindings: timer: add Canaan k210 to Synopsys DesignWare timer
Date: Sat, 18 Jun 2022 13:30:27 +0100
Message-Id: <20220618123035.563070-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053209_381154_CBCFA0F9 
X-CRM114-Status: GOOD (  12.52  )
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
