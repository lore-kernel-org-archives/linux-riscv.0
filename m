Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A4FF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cnX9o2t/FPl6L5AlsyiZ0YhVlieKYPaerJJp92RlNg=; b=gntNGTNU0cJNLd
	t9k/Nu15XMYwDnC1mzcki7EE59wzKz+akPgn+yYwo8wkR3E2I+NlnH6hfJO9nQPrUGx2v9waOIjGT
	90QAAD0XqT+caF5FicZiExJu7XNS3Eq23bKH/GiVqcZCi8SotQVw0pSoon8km/wv03oQKiLO57G8f
	e7gx6T3BMUgEihBSWq9Q73msVmnJML0+643TaCvPmm7AcsYBSFv0W4atsdHiYQmBe6zGlOX2U4nw+
	bqQXmzG9MMO5gFH0F5V+SfOd51ZCdx/J7AxKbZ91Sso4Ywj8OtZ9EEPgGiNSTS8IN8e2gRysgNQOc
	4Wvg25LRcx1ezUurr+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHttx-00000002j7c-40Xo;
	Wed, 29 Apr 2026 01:39:45 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHttr-00000002j42-3XYk
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 01:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777426759;
	bh=wUXoDWfKSMmaRMhMXzMvroZGWtAYAAcr+bc0qP0VGz8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JNMcrLj9w0X+h79JtqCxyAl7se6EjSuxeYu/iFxErHjhO3RYFXyk/yI5+i/d45xjk
	 WAVUyRnpSRcnLBNsZociW9Zj9Uc0o3VCY3UsHmFIQdXsya5Nw1sTnJpzZoyvT3htyv
	 L0JWCzP3HV3o/7DbR73oURJS7NntdzFQ6e/YQjWw=
X-QQ-mid: esmtpgz16t1777426751taed3181a
X-QQ-Originating-IP: vI4sGNfIgv1/h6mK+YQd1WJmQOsZPj6r30Cg1uCqF3A=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 09:39:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11863181746122903502
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 29 Apr 2026 09:38:49 +0800
Subject: [PATCH 4/7] ASoC: dt-bindings: add SpacemiT K3 SoC compatible
MIME-Version: 1.0
Message-Id: <20260429-k3-i2s-v1-4-2fe99db11ecb@linux.spacemit.com>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777426731; l=2426;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=PyG99/8R0TpsWO1jWHnifATKcOhOPS8LywBZeCYZFZY=;
 b=XPnYB5sjZ9lutwmRgfjnz0oFWS9Zl6AxEVe+jvTb9maBaSi+h5G1J+ifvsEpt1vdxM4vWqIly
 r4iSsTIbzNCAFX10bIHT7pe+HZc1V1QBdd7FpLdew8mK2kPqfcC5oxk
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPoQK8KTupOnYkgjQupuMK6nkUZUsCjJhw3hcxuL+Zh2RPDFOXi8iT3v
	QpVpTKQkdSj8HiSwe7jQJr2hS2TV6ADY8GgU3iiiIXK2o13GEbzRO/aehXO/hwaPZG5gu/d
	oV9Jlu8q9use9RvIXVsH0vZodt34Xms2DWGr0ofb+4BaqGH91taclaKqNk5dWBsuX+O2haM
	vzOhqZf4G3rb3gTrxbtC5Bu++pBuw/zio01HrIHI37b6uG2QahF4auEpPnK8It2acIzMzqm
	gmC3fiP6tZPEnwnGIs5jmThO9SutOkkTIzik0bBrbFr/NhAv87OVscvkb8gBXz0EJfOZEB9
	BwKNn4YEY8qOU0yxc40oerigTWkARzRVVya2i4vHzomouZvo2TZEaMXKyJd7gplKvF2kUiR
	ZE9YEixSyfqWfirDQ1BGUtc0c+HQSdPbXQo9hkdokb+6LyuuAMKi2C3Cii0aslzd2XdOBWm
	KfEL5gnhQ+17CNoQCEhts0lzyMsmSQMbqmepFEYq4Qez66p+BJO2ymABtdwTKFkyk0V2B0Z
	FV0HgjdmgScIRcVFFxH4uBhMrBKFbxjYoay+pLgLtC1q/UXe2caXggHI46PKE/re+D2Xv+W
	HW5JAY794rz5Pz9A4otzb9ugO4ogHbn8ssYK2gM/22HsNH7Bs0feLye9cKFRESUK7DS7kSP
	Zb+VD1cxaP5TUBxD2ozWWqhIFfmOz2H/8r6rCraHwx+CFZtunFvlCOdHP3mQgtsMLvhba9U
	fjdNfXW660lnTNkYE7zE/sCdvxuX3TKjb6KXA4TOnmUH7M6ZxlM0EVWv9UDngNEKk1sdzvL
	XnGCHyvCGPp90ekxfyQDJVrGUG25Fi/FhwfKvpeUqbFk4T3/HmRRoP9z8ZZWbt1OImxNWMe
	cwp5GeX7F7rA4GxPw4ujJj9DlVq+0y2HlMkwPugiIJfELxHLBs0cl/+i3MSywoURJqP6ENv
	asg8PU5bALyffBOD1m8HUlLq105km4EacNTntot4sye26hcZxx/wGb1JW2VBRbXVsGGtclv
	Z95TlfD2jbABeg3qTKf5IgiYphmqj75xP2lyJmxiC9o4/XkSWWT4hC4cyD9tPx7DzASlm5k
	5KFNq3hU/t491zjLzAoMhIbA5zH0V1y6Y7KGwJk5BTIS01yaWd+xjc3626roLEc7X+FvGU9
	7tqsQw8l1FumGdpX/NKQT8CxaidzOjzqTLMx
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_183940_395126_E864D17D 
X-CRM114-Status: UNSURE (   8.60  )
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

Add the spacemit,k3-i2s compatible string for the K3 SoC I2S
controller. The K3 I2S IP is the same as K1 but requires additional
clocks: sysclk_div, common_sysclk, and common_bclk. These common
clocks are shared across multiple I2S controllers on K3.

Also add the spacemit,fixed-sample-rate property which constrains
the sample rate when multiple I2S controllers share a common bclk.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
index 55bd0b307d22..240d90402e4f 100644
--- a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: K1 I2S controller
+title: SpacemiT K1/K3 I2S controller
 
 description:
   The I2S bus (Inter-IC sound bus) is a serial link for digital
@@ -15,27 +15,54 @@ maintainers:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k3-i2s
+    then:
+      properties:
+        clocks:
+          minItems: 7
+        clock-names:
+          minItems: 7
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
 
 properties:
   compatible:
-    const: spacemit,k1-i2s
+    enum:
+      - spacemit,k1-i2s
+      - spacemit,k3-i2s
 
   reg:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: clock for I2S sysclk
       - description: clock for I2S bclk
       - description: clock for I2S bus
       - description: clock for I2S controller
+      - description: clock for I2S sysclk divider
+      - description: clock for I2S common sysclk
+      - description: clock for I2S common bclk
 
   clock-names:
+    minItems: 4
     items:
       - const: sysclk
       - const: bclk
       - const: bus
       - const: func
+      - const: sysclk_div
+      - const: c_sysclk
+      - const: c_bclk
 
   dmas:
     minItems: 1

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
