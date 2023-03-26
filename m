Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A47CC74A5B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 16:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7O58PTfdfjhOrEWJitybmQtGRxiVaudZOqMyK1spxgk=; b=nmi6FIPX4DlpeC
	i4Sbgh4vFNKFAWmIza7wnA3nmgSRuv6w2PjmkyY1tSde3Dy0454sXoFtIJ7jfaE5OuR1ZyS/Pk7Sb
	Q2/2RCzeFPTHm+T7QSblnXZyKBE7O+mn9OICk8Iu8GhvunAap5n8GEPvXmGpQkOdpamHWHtvgeslf
	TCEcfcX9fe2Tc8j+M1HrvL+TFpe27aK/KZc8VXbqVZ5hLasrSBu+LTR8rWBtOlLeY0Dmpmd1hEe3O
	DSLWFxBNFaoCURCbAlFd+OowUxeV+Zx4E2oqKhZMBk6SdID03nQBWNqzAa+bOdNo4dDAC64eyYukR
	QQPxSJyp+q8UXTtb5gIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgTXD-008pps-0Y;
	Sun, 26 Mar 2023 16:47:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgTXA-008ppT-1U
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 16:47:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x3so26446336edb.10
        for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679849274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+t9quZI40H0SICIWubeZOL2PZ33/cypkKWWx+K52uk=;
        b=JxMvIUJymY0NKfVB/F/uMVb5FWt+KL1HfEmNopAn72YDZIgund07S7NAGaL/MpgwN+
         hKxdZmk4LlFQdYqKoFOOhdJQcZh+h4YeU2rWNsw+rQG+/rutThmyXqffqzcIyd5uuUFS
         j3KYU4BupFN/o22ClumZc/nypMne6wG60BZhQpOS9q7pQ/vsKUMKTd5onpTWWHpeTlnq
         M5561tYpHlNn7/Na0JR6TAdUZCRpXfoJjGfPwbXA4zfnu6OGTeKxrIYdeaQ9lj8k63eI
         8C9xFNinlslsZ6tCAtyY5MTQ1+tD4xHrtmie2ebjX0AV9OSSZJf3d8wzqfPlV5fmoa7l
         C73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679849274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+t9quZI40H0SICIWubeZOL2PZ33/cypkKWWx+K52uk=;
        b=4Jo9SAyvyyfuGyhN2VWH/AqxycWsdZVRr9QI3JOBf6nTqfZYSDLDA7sxW9C6mdPirw
         f9+vkSobdy2m4OysnJdi0wwLsr7TqkjSqRsgUlQdplmR0cDDgleVLiTBbTYSDiLkRZgf
         44O4/tHGYYpZf/mvAgwNILAbg6BzsCyHIsWPtl4qg0uZ367OzHBifbZE0FWXdPHoKZtu
         140w6tfPirq/1h2XrgxqqZ7g18p4wVdwQW5dzhk/FBMux2NaX0P5PcawtiQM9gsCrnKC
         AqzC3TMFhTObbWAPsOVdlp45dqlfQAAnpwuivlS2mM/7/MFHDs5slsAKh0vPym00hd0w
         Wo9A==
X-Gm-Message-State: AAQBX9e5iaVkHtvHvmrg9KWMNDfZ3b0XEl8t7OEJVpsgDhpkpeDlxUqk
	dnD/6/1coaArGfF1Lr0z/Erveg==
X-Google-Smtp-Source: AKy350ZvBl+hiLf4EcOy+Xnugmi4VSxHZTjFBB5xT/Pg62Ee+OlYhDqqJRN25Uj/HQbYxzy11U4B3A==
X-Received: by 2002:a05:6402:5146:b0:502:1cae:8b11 with SMTP id n6-20020a056402514600b005021cae8b11mr10862531edd.23.1679849273974;
        Sun, 26 Mar 2023 09:47:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id u20-20020a50c054000000b004aeeb476c5bsm13559502edd.24.2023.03.26.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 09:47:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: canaan: drop invalid spi-max-frequency
Date: Sun, 26 Mar 2023 18:47:51 +0200
Message-Id: <20230326164751.104789-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_094756_505496_8A75F84B 
X-CRM114-Status: UNSURE (   7.82  )
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

The spi-max-frequency is a property of SPI children, not the
controller:

  k210_generic.dtb: spi@50240000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 07e2e2649604..f87c5164d9cf 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -259,7 +259,6 @@ spi2: spi@50240000 {
 					 <&sysclk K210_CLK_APB0>;
 				clock-names = "ssi_clk", "pclk";
 				resets = <&sysrst K210_RST_SPI2>;
-				spi-max-frequency = <25000000>;
 			};
 
 			i2s0: i2s@50250000 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
