Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139CFFC6182
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVCh8iVv7BGiLKx4Xyn0H7L1W+/Nvnc/IRAbEz+Pt/U=; b=HYZO11BNi5Fo4V
	TTF+IMxLDhfo63rsYrM03z/bjVCbydIVck/MTvBBNJwuWY7P/jCNHOZ9MLwJlfb4IYe2qblXF0IUR
	jZQBRKsvw5L855BNTt6lyG767Z0MX7D5KGyv1+rmryQx/6hM5T9PxwvC959yihAo6szsuG5C2Mrm+
	zOmm5xo3C/s3tdgy6bg3RC71g8j1flRl0EieeEr7ACF4lBWIWMQ7iJpmrf+6y0aF/Do5Jh6NkJog6
	Kpf3gABJKEAMLyUeC2kyRmTQ2cQk0yJigU+kEDoaW//+/JsDEhhi8GbGSQkofgTFXA2i2V8gf3Wep
	qnGiP2akNtcOGl5XVFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9G8-00000009qh6-3YSK;
	Sat, 03 Jan 2026 21:34:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc9G6-00000009qgZ-2i5U
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 21:34:03 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 17127340E73;
	Sat, 03 Jan 2026 21:33:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 04 Jan 2026 05:33:38 +0800
Subject: [PATCH v2 1/2] dt-bindings: gpio: spacemit: add compatible name
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260104-02-k3-gpio-v2-1-07377739581a@gentoo.org>
References: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
In-Reply-To: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWYs7OKJxQ+GLwdCalTvgO2NvxHDJZvgzeO6Ai
 2otDtDkAZmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVmLOxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0qpg/+NA9oNETUwVZLqCxAW2GcZ4luKHnasG3wtplZKLO20nm+v+n55avq4
 4m7BG84VOCkVNI1ZxtbIv0uvAUoKNJQGhemcMQxZIne4CSvAC1JQxKzTY4nN80z7eQzUD6KTXuc
 9M8tn3wF0FZmzcQJNBqzowWORlk/x3qGpKJk2AOJl62ZcMJp+Gctj7hIvfTeqS3oWdOr9ADrrVe
 SH/5JMxBn14hRnQIMtXf10Cqtks210L8oFxLT5ejryoVEvY1RHdFJzcXCtRkT8nrwFPtmDRwooy
 36C5YVO8GQYmPcz586Rn99Iwj+Rd6F/MgkyNfyiyRDKuItDSTSq7PoGd0lsoXg2iTzFVpgCeGIX
 aQzlbENYs5QMf+8NkafHTLWQFsOkK237zYFNHeltq81GOqiwCypbpV8pfzE8Kn52Jp0z6OfwrQr
 mN+mLkM2zSZBn2oGU1R9K2gpzTFjFpUvrzQ8qyP9N+eugx9mfAFjqKlAhJTP2LPN/FI42Znh0a1
 6Xkk3/fp2TXLjNF/g/ZcTa5lcjAaQmEZs6aMWc0NQLST1AAD+/WcGhidYKnL7b2JOQ/36N9lZs+
 bjO+QWxwTC6eHIR3+SakdIhjhtq9yvWMCgdc0MkRnEXTqJhty3fJY7fQ4y5biSUys4Xq2aSa0EN
 HoDoMYtTAq5s2pNeA4sc8GaC5klB+c=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_133402_709973_661C23D1 
X-CRM114-Status: UNSURE (   7.32  )
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

Add new compatible string for SpacemiT K3 SoC's GPIO controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index 83e0b2d14c9f..24d22d95665f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -19,7 +19,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: spacemit,k1-gpio
+    enum:
+      - spacemit,k1-gpio
+      - spacemit,k3-gpio
 
   reg:
     maxItems: 1

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
