Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0ABD3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdBawXuRFTD1IWlne60qbPZvJ6EDkpk++OKNL/Lu41k=; b=cHyFjLBFNzB8yo
	JmqV53rZ+CbafRWLp3TyjBasfQVJB5NKyvfqDuOKCY6O7JdjUyMjPcYfA4gohuGL1muFuac6IQcoQ
	CM6N9kfwE91wzU6bR45fl7EaA/3VCekvnYmV6Xv0uiN3HexlpwNerHYfpZTJEnitRELSliWgzj3yG
	VhCm/jLhAdYTxGN7ZMnOvxwLgKkEheXMO6ZuKfI2UEx2fWXTKYVp0vRBq4RsREBszMDW7YpgfCsCe
	ttD1e5jXv75EeAoNRQNcvjSeH1haxj6ubglXAmf5/oST+Fpx1JH8awdzphnCMPnVoSPij3EnpaIB8
	ysvyl9aAZaDHmFpF9zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCek-00000003hmT-3wjJ;
	Mon, 29 Dec 2025 12:47:26 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCei-00000003hlw-2g30
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 12:47:25 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 12006340E2A;
	Mon, 29 Dec 2025 12:47:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 29 Dec 2025 20:46:38 +0800
Subject: [PATCH 1/2] dt-bindings: gpio: spacemit: add compatible name for
 K3 SoC
MIME-Version: 1.0
Message-Id: <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
In-Reply-To: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=780; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=3Gk6q/GnszEdN5C4ic9teAA1/nlkqjFF8harrMGyQTg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpUnhMjHomYPwXglxIczDQWC8aDotR/ybUJNN4w
 I38SmUU7WCJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVJ4TBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0iJA/7BTCBPNPm1sPBLl0v4cH2cc0djOiTaVFPUxBfpebvvPrvQvRski0vN
 i4R1m3b0AWXJGcsJmrQ5Xkf0ELpFkJOs4/GbAJHUyIvDcaxgNo9Wy35oKQpSxsVAi1lfpFoCUtt
 pSW9Q1nh1QcawWLNs/dQ9rSYcSbs8NjcbvCcFppdZwq2E8QmgiLlw881h6iaScYd2w71EjjChS6
 w0i1m4xmz8GxdwZ2frb0/3qkwLI591DHdsUz57SBwJPimp5x14e9vCz8SZDLOPcu0lKmDQUe8UX
 BYpiIJRnYkd13pzTf4WJ0zBiTZF/4HkhI4sGpZEx6lv9Yb7Xh+6ITFGqIKfQPHHB0MvYsrzDRXk
 uFVKXRTdvLVU5xmSZUAb1ySW/ak8eQKvgHON1tzuiJaTDYOGEiYWNeRIYFWS3jf0zDGboUt4xax
 fZi9VheGSbY83oF+oNGkzlCq8DXDbRzW83nnC3fu+k/3zvZtJsnOkS4gbz5hbP3iWZsTuT/8eYn
 faJ+tDLwLxwc570LMQnVwArnlHc7rYrb4UI9JPGGgXaD+S/lsbCX0FbEkofhELdCx+9TSVw38Do
 8Exc3pcS0L09CXWR5ZqDYpC/XEruIBvuvF0K/a40lMhsvKp91AEgZvekFzT+tTbn3kAMZZG4aZA
 AIImMbRw81dx50gE5XmEZdZDN1tgII=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_044724_701480_7EB37507 
X-CRM114-Status: UNSURE (   7.44  )
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
