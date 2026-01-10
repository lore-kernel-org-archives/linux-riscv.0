Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52DD277E2
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XGLy/puPdyevg4YyJ23vFH3jX2wMT+kL4EwIKrPbi0E=; b=d0Cs5NiFrK59/L
	iHc6slNYcp9m5qwdz7CVTq5tZ9earMUVKm0usk3hk0NBHNPTsrnLIZXZ+mSFfNtL8ml9wFuDkx/ST
	4zB057dpzWw0Mfp0bWnqXpw4VOuWctyIxZZcGmGcCCQ2cFctpYfqHMEJ88In0nw1zLA1tzPjZBg1M
	iLzws7ueMEDe9ap3es6WkKbsWg/f9NAJjtNc68aOs42mF/x3/Uqk6uR5Sp5LITg2+lMbKULA8j/YB
	sjBtOZmiB7VMbYW8gXEpYjvf3oRnw0mDCrALit7Qu1BkjTzMOnkmimicTUf17axwSN7n+U1nkkPdz
	0SsmKAZ3wTEK9SKRnTvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veXy0-00000003RpO-2zbr;
	Sat, 10 Jan 2026 12:21:16 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veXxy-00000003Rp5-1cSi
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 12:21:15 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EE425340DF9;
	Sat, 10 Jan 2026 12:21:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 10 Jan 2026 20:20:59 +0800
Subject: [PATCH] dt-bindings: pinctrl: spacemit: k3: fix drive-strength doc
MIME-Version: 1.0
Message-Id: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>
X-B4-Tracking: v=1; b=H4sIACpEYmkC/x2MWwqAIBAAryL73YKPCOwq0YfoVkuhohFBdPekz
 xmYeaBSYaowigcKXVw5xQaqE+A3F1dCDo1BSz1IpSTuBjNHf5YDOWFIHhe+0Vkne0O6H5SF1uZ
 CTf/faX7fD9jFAMFnAAAA
X-Change-ID: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong@riscstar.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=QEkMOPUSiXrsltFd8l91d2pXVD0beckR7SwBr+HLR1o=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpYkQv6HD00Az30tkvVGPLJJDti8oa9SNNOlSg8
 cmLqPEiJl6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWJELxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0nHA/+IOdwYROOiP/Swt1yt4Sa/fBACzM+GHOPsYxfPrBj3bie5dmkddB6W
 eZUddUssihaeNSUufi6hbgVMorGwT6R0fyWK/jWF4CaUVgPklT+7iloKdBlrLgfYtKo4iyD254g
 6bFIgWGy797OUVWdY+7K5cU41N31m5EiyvI5KKih6MfoHdDR0QcBuqwEiyTbtiqqlMzy6/5uSPT
 k69UuwT91pndJkzCSvogG7Zx8dbpbQcBv+2Td727uDEATINOf3Opd1WYo97yP7DBvM92Rh9kXpY
 smB0kkDBu5Ak+mRj7TELRxVMraejYe1hIVRJlUoD6Hmfsp/FN+qhCdDEQLGYC0iDtQ3X4/upuW4
 MVBX0iwW7ZkPxtFnNY6gq4DKHx+PH53IxtdpR+Q3y86Bg8b2dFycoQU7okzbjO2JMp+zy8EL+96
 cbem+WlGea8Slbq5rY5qtBs9e+QGSFiuDZ8uIikDkvbH4nInQ1MjP29Xf2p7BdE5HdMXVS/EFu3
 gaxAB+blEJYU961cg8WjyVm4k2Ymc6nZRbqu+OaGJFjnPRW+yGywQcBXGKXa4qBZJY6gbtvDn7o
 eQC2Ys9blqcwlYqytkqVSp+HJlFjqVrWXAO4YCb/VH60OpWpVgOH10oT6IYh/RhjggXiLHEhIdL
 oAAYqJ202DDpxmidheg0GAOHdWsjOo=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_042114_476755_B2925B0A 
X-CRM114-Status: UNSURE (   8.93  )
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

Fix a typo in the documentation, it should be the 3.3V drive strength table.

Fixes: 5adaa1a8c088 ("dt-bindings: pinctrl: spacemit: add K3 SoC support")
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Hi Linus,
  Can you also queue this for-next? thanks
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 9a76cffcbaee..f009fed87e6b 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -87,7 +87,7 @@ patternProperties:
                 description: For K3 SoC, 1.8V voltage output
 
               - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
-                description: For K3 SoC, 1.8V voltage output
+                description: For K3 SoC, 3.3V voltage output
 
           input-schmitt:
             description: |

---
base-commit: 3f20bdf7151834547a85231c28538f49601481ee
change-id: 20260110-k3-pinctrl-io-doc-fix-a9a043e24619

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
