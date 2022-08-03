Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF8C19F28
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Aug 2022 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OxCL/WBgNXv5ED40GAoUCbE5YBNUGwTP+QpgznKtorw=; b=AA8FLSxpKYvAy+
	pOAQ5jnY0+bapHqO2AbROGl+riKH4hvUnTycqZbCi1+a+U4CQSTv+sak/VLW7VWw5uCsNqjPhRj5+
	6Bp56OAFrBoHj5tgjZYoYHACFHDr7SCarUl+RSZmnAcrEm22whJnjCjRYgNFYLbAqTW+PjqacfxH+
	B8Z5Ka/mTD7UF0SB5jtG7XzdmZr4V/bfR29SF5E+tFWi4RCkCmN18T62b5q3gP1sWiXZTherMqf0o
	sWKfyTWgatCtBIlmgWxamFHgbH4+B6UlfEHfNasHRc46Q0L+i2Bgw+87QWrcIDExlr5CCBJJXYGlP
	BA7R0dd6wFZkK00vx3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJGj9-007JIL-QD; Wed, 03 Aug 2022 15:56:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJGj6-007JEZ-Su
	for linux-riscv@lists.infradead.org; Wed, 03 Aug 2022 15:56:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id l19so2179533wms.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 08:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=mxMtG/Q251T7R62iX9Xk/wpEgTp311fOpnJ0ShthtKM=;
        b=B4+uBSxdHMiSA/FZHsjqRDTozx+JSIc1seFJm34ExPeztEVDD07wRjHK6FzULPj52N
         0EMMYg3C77CqUFN29Loe0BUvz9T7wymLNRWvAVD/cIeIv0TUhupDo7MN1Pz5qwUDAn+7
         BN5c/JV8oa3KMpsf5W+JM2rqd/VNTOpME5Zc9FtJVWEJYzaIQktD0/XCDYoLzNhYvn5f
         7ftKrnOMC/S5QQvtkDaDyjY63dAnPxsBSjdnN9I0z+Meib5U4r1inilkPVme/npe8a6u
         JMfE2ZYEVFLITL4oLRmvF3dRRMEYgoAiwOlWNDjQDUXb8Q2Xk+rL21TfON4HgoYl27YA
         0MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=mxMtG/Q251T7R62iX9Xk/wpEgTp311fOpnJ0ShthtKM=;
        b=o0D8DKuepcnLgek/MO0DS3A92SYGBhvyT91m/1D3BcHMofMp2P7SkpG9+uPnRFWEHg
         4J9s53mXsTbE1pHCziflbr0CA9pFkQTzFt9cakwYOOqK2agqGUmnAqPaEZSfUfpdbACj
         p0iUQTjwuZjGWwZJCpM4oSbyt6wWTMMbeV+GVcJJNEnjNfxiO6hpSR4qXlRHUKBg68+K
         hquA7ZKpAdfa3ND8WGg4AuD3S4K0HzzX1Khg3EeEhfbUoN3ZRMIkx3rrHwLUs2f2NZOg
         +4TjjIqvciZEYFJDlcVFXEBgWmKQX/03chWVRHQ5tdg4FhrSyelD/nCawQ4Qo5tkFbjU
         dR3Q==
X-Gm-Message-State: ACgBeo0aN/FVabAlsO+BIRU9Y1fIa6eDVnWXWQFRgqIGY8uBrV2jscY4
	Z/ufHP1gXUvXTjXYEWr/QWI4hA==
X-Google-Smtp-Source: AA6agR5BfqTfNvlJd1g6OG5xcTlUNOnmja0gCtgMu3jkzJTU+0HROXQ6ioslOvzyFPUGUa6hAhSIyA==
X-Received: by 2002:a05:600c:19d2:b0:3a3:2cdb:cc02 with SMTP id u18-20020a05600c19d200b003a32cdbcc02mr3313498wmq.182.1659542160960;
        Wed, 03 Aug 2022 08:56:00 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id w13-20020adfee4d000000b0021f0af83142sm18107277wro.91.2022.08.03.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 08:56:00 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atul Khare <atulkhare@rivosinc.com>,
	Sagar Kadam <sagar.kadam@sifive.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4] dt-bindings: gpio: sifive: add gpio-line-names
Date: Wed,  3 Aug 2022 16:55:40 +0100
Message-Id: <20220803155539.800766-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_085605_034084_84D34E8F 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Atul Khare <atulkhare@rivosinc.com>

Fix device tree schema validation messages like 'gpio-line-names'
does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
sifive,gpio.yaml'.

The bindings were missing the gpio-line-names element, which was
causing the dt-schema checker to trip-up.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v3[0]:
- Dropped patch 1 & the now unneeded cover letter
- Added Rob's Ack
- Changed the patch title to include the subsystem

0 - https://lore.kernel.org/all/20220726170725.3245278-3-mail@conchuod.ie/
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index 939e31c48081..fc095646adea 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -46,6 +46,10 @@ properties:
     maximum: 32
     default: 16
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   gpio-controller: true
 
 required:
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
