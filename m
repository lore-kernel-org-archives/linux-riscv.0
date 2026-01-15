Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C3CD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrscQrRqOoO72fCvYhdhL7RpeB8Ud/U2Um1z61I2lmE=; b=xK5JCqBJAh6MUW
	eM/oBZ1fB7iggLtxJB07RWfaWs5dHR9M+58cRReMn+VgxDVYNHZdfVC+AkZKqHAp2jDHYZOFxg8gf
	fVigSM9yqfxvYS8FeckP59NFgBl8sehlpEj39p6gHA9/DyJQRB6gOtfWajyrBFsCCjuh5Ry3DzAME
	ie9SehX9K769TId4A9QziYBLBglUSOoiqAnO1j8XZLemBsMvm8MGMkPIACDM7klQmOgGa9vU2v6Bd
	G9WVqbyJUZ/GCJcQQ/jmHNmJAWP/6ylItyPWXTUDMU2TBJNw4XjW/ZoR87btjAcIKkzJja/rukY7x
	uUGlTgi2wJ9773fgPVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrH-0000000D2dZ-0Cyy;
	Thu, 15 Jan 2026 19:18:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrE-0000000D2bp-26V4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1114871f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504690; x=1769109490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=Sqnr09Aap+TYsGZ1avlN6NqmI2s1I9GK/c+/5k1zle0CKxjL8agwJOUAMl6xcv/qg8
         Yr6GlS3zT9gh/Ju2hQCqPvpoTaTVAy9a7pSiJ34Sy7Y5MNmOiFW9Z3C4+3JUbtT/OOmo
         DTSuoXurXRRSZ3Jfbli6nPYPVBI9Qe0FjgiZt2l/NJ0Km07WTmhgzcXKbR+FtaAQQyk+
         /uyRoaMMoVnRFpgMHdoXw1znWRcNJqlX8IB/LZrLNRomQ6+K9ha1XaFUeh0M2YYdnRmU
         j7AY/RImYYO0TBBUJ8jBdOVnU1QzEWFLNsiQ9qvZ/Vkw1GPJ2ucUR+7A5Gs9NzAVQmB5
         rO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504690; x=1769109490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=vKlLzsDuuxL2PXmib6SL3yDikWsJVsFZeRefNqEoZlit3wAdZT3O5rSg4iqM92WcNa
         iNJttnCTEvy3lSumBob9lkz+E4LSr/Vj6d6kn/0qqdKFVYfvmP0vOZAnEKWYOPDJQvYZ
         z4Eu3uH4GbY/+3IRw70M7D7n40DvgGQS6DZRbG2klXbH3NjxDhFF0ffZPChuPC7As5/m
         vEBJE3z9GTHAf84s6EopS1/hJH9m75UCq9iPzroth6hx1jfoV2Rq0vPJ2NyxNyikJQGy
         qniy4e/Jc6gpjstdjQix9HgpMAhmmHrU1V1wGnta5EDqOL9daRnEuxuoCvR7V8DJbw5e
         vLZA==
X-Forwarded-Encrypted: i=1; AJvYcCWbj1FpsVxjc1x7dvgSv9NDEOwpIikvaFRFIP6bk+U/eiBC5rp2RiCV/tohzqBiro5ah+Hx+OhguwPXig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMp2IidT7/josFWGdYkj1V30EsGNkxSShphsGy/mese5MgjFW1
	zaisczNRzXClwKxSuMkwsKTpPnpSWuc21JMzzZfoAMOllSzVuC7WPsSA
X-Gm-Gg: AY/fxX5zBXvUi7Wr6p/A9tBAzvB1bqxACqhnU89BHzdgegdu9qIKMNCYubnTpCR6XgU
	ZFLofMrcErQ+woPXmkqS5Rl0D/w/WEazNpCMJT3dM3m20k5CIgfprbMRlnIN5NTM8MfAowmhZzR
	fhnGaQGw8PWFhOEE8gERy3BWNbMJi0Cm+UMqlXKselUp5b/5iZ3zKc2VGIoaMmcOfy3NLA5zJAn
	mEmNmrfn9KL/39GQE1RgO4xr1bzc6URGOnCZamhfMwfcvUfr3aJqZ/yb5nzNe2bR/xWGyIjOIJz
	hxZUH0VsRns0lR/cVBt5Bf5x0iI7xlQha5A4wtZ/R796w9jThkXYvUGjbywWxXW/hgd1Jjw5sGM
	N1mLDrvPX8pS9+M8KxZehKINdbQmO3EHUdkzaNUa5AqHs+Fgi6801QqrE7AMAI70gBI140R+r5G
	VC7W18zShuGYszjA7jvaxTfrjJ3fXYEcn2EdIIf35CqiGK
X-Received: by 2002:a05:6000:26c2:b0:430:f6bc:2f8b with SMTP id ffacd0b85a97d-43569bcf1b1mr533301f8f.45.1768504690389;
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:10 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:40 +0400
Subject: [PATCH 3/8] dt-bindings: sound: sophgo: add CV1800B internal ADC
 codec
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-3-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=SQniyJ8r3rp4gJLKkMe/RuCjhYd1U6T6Xou1eZP38X8wwCyHO4bzGi5Ane4ARCg4LHldz4dOK
 Wzh/SCWOZwjCVC/3yMCdble9F+bcH7/0nBnSX9sk6GKlfWbbVy5qbyz
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111812_571999_69E967E9 
X-CRM114-Status: GOOD (  10.47  )
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

Document the internal ADC audio codec integrated in the Sophgo
CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..339b60e317e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
+
+  reg:
+    maxItems: 1
+    description:
+      Base address and size of the ADC register block.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec@300a100 {
+      compatible = "sophgo,cv1800b-sound-adc";
+      reg = <0x0300a100 0x100>;
+      #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
