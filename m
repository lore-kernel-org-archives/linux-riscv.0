Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ED4EEB57A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 07:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vp+ERIHh3tdv3zhPBUUvJ/pR2CdPUCbA7vNJeh8NTC4=; b=mZ9kcUnbIF9xDg
	EjrjmXOItktjE25M1i/UHwuzpuEmLr+dFSmvfSG7LvBet+bNhMqp4kXGqgTVG/gEbCI4K5ncH/0k1
	hVPNjzmQufiqdXoE0qBdbbvdB3tXzhYPwEW2+pKHQzNK4rFnuLlWDJpEb5Gg7Xo950MsRca86VNOq
	Xj2msUcEalrAskcxEfFCVFRNKsiZrLVXnjrt9Ut0XpEJ7VDb51nDMqAQb8o9Sc64V1zD+/ijuWhyf
	1O+4nMp3s5/KVbcKIzBjRo5rC3hIjsYd9JY0QhwvH7iieXGxQX6GU4a14sfrYOwmYJ/FIQxKf/gNl
	sv0T9ZEofNszFRgZ3aeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZA4-00000007sLZ-3NrD;
	Fri, 02 Jan 2026 07:01:24 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbZ9z-00000007sHN-0q3h
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 07:01:22 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C2BCA341EA2;
	Fri, 02 Jan 2026 07:01:14 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 02 Jan 2026 15:00:23 +0800
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
MIME-Version: 1.0
Message-Id: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CkrLUVXxpWysujkEFBNhXJWBIS5qj4KiudgLlB1FfKs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpV20mEQe9Qt3KK1/XJlVuHSxuLm6AvIFghLmhd
 06pN3cgbRyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVdtJhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0GwhAAka9VP676eVFbawkMbsAryQtqgduKkgr27PobGT1snFQLceg6Q1c9A
 4Q2J/25Buwr4plkGKBx2QLJEtLT+DqZToB2qB+JWhXFB/BaUf/XsmclCvadNsFjbDZvh8O5Zehr
 Aosz7dHGOvRBvxFmA4RiFYJP1n8KSEpCF65IzMt3jJGysTfBp6isezPBmQ6ukUWphIdeJw+cwA3
 6RGTnyFueM4F67Y8a36clpbiKSTSMUswbEqULpY1T0bgQc3mm2/pvH1CUNzPOeS+jnPc1YoxHZv
 evQH7jWwUhEBn8SgqR7tWHNethYPPRWwqG4v0gnHJCuaXhGWxjyhJjjogLH4kwRM1orU3A1L6rK
 kucuMGwZaaBiDlb15pLV3NWVOM08CXRkoBbysRYujG6f5C/BxI3+jUx1ygVizu5U4DwA136R+TZ
 4Emh7+oxCMDiIS6EMH853srL9D3sD6JNUe5ou1c61r8ckHLjgCMGGgqFTW8ju6SEdI8AMSNOG7G
 7eq+MbdgdIfLlYNv0JgIADTrdkcCJVt1+SadJzvMBIMmSIYWPyEwUPXQRCZQ3HDIIlIDUjbLXfj
 36eCDjZQdhp0dEHXDybAWTpHDcTvpCY1d2ACwcClcaOSO7YgP59XbhqQ6h4ypwyoek76aAdD08z
 4j5a5/4sIjzpPzWrGan3aq0sIqgo20=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_230121_291410_1CBCECD8 
X-CRM114-Status: UNSURE (   8.03  )
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

Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
almost same logic with previous K1 generation, but has different register
offset and pin configuration, for example the drive strength and
schmitter trigger settings has been changed.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 609d7db97822..9a76cffcbaee 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: spacemit,k1-pinctrl
+    enum:
+      - spacemit,k1-pinctrl
+      - spacemit,k3-pinctrl
 
   reg:
     items:
@@ -81,6 +83,12 @@ patternProperties:
               - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
                 description: For K1 SoC, 3.3V voltage output
 
+              - enum: [ 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 ]
+                description: For K3 SoC, 1.8V voltage output
+
+              - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
+                description: For K3 SoC, 1.8V voltage output
+
           input-schmitt:
             description: |
               typical threshold for schmitt trigger.

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
