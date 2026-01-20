Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C5AD2628E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+yr6npmPXzVgNnnY/O8YcKEgUJKGvz7fAjzd/a5DUA=; b=wuYX1XDz71Kri8
	1eL6arLPd4w6mkNiAI0zfUcZG3vHVyPauivZXxe7OcRLpSnKrWpPsEbMSKp++yj4+L351ZR/V3hKO
	fSk6vgugpP+4oAVOJhd0Spq4F+9za3UERuDCUVpbcGz08GdmBVA3Y/+xdLhIftcBh2pFeQx+zBvNG
	6IVmzD2Esgu13DCGcPzzXh1TDHPlH2KrDBeFURgTFdduWcF9S6RfeoTi5wOw5VhCDszCE6lcQHtUQ
	m9bOjC33sooZQg6HMMwUYBiGhBai5fHt+KlPkUE+vp74PWvc609gyB/9qtxXHpMoRAo5KmAG2kHMw
	J51v00XZVsukqpF5k5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3f-00000004KuE-2VAE;
	Tue, 20 Jan 2026 19:06:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3V-00000004Krw-4ACi
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:06:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so37333015e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 11:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935980; x=1769540780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=mRY5KlgLPB9ZBbOL/HCrc+Pw8y6z++XlpA+52QoLGQ77t/baoE15LjmxZOeYBesRD3
         FDR0Zlk+Z9m/Dt9A6qLtFK2yACvU7VS5KByPq7nDVlFMOihWSkLr2vpq9dzJHvwljLiy
         QMCMK4nJowzNVvwmldMwNrsdPZ0bMKL3LpWMI7QwzS/rFN9Epyh37vBNUhDxM4GhayKb
         iObJTf2vNADlHClUsmhNYAzaLU7CgFvF4avJ9HdNVSHoJfl7JeM7AqR5xWC6SvPKSGtt
         v/QPbORqF4B6gY6DHjRzKULJADeZuoEUFVio5/IH+mEg7sPfLcsIlLrigsfA58MiRuOr
         QRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935980; x=1769540780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9GX032ri3Hp5Aag2ArhTas5Y0poDu9fr9e60o7ncMVY=;
        b=Ze6U7i4Z9IvEoiSL0q3FsBwMBhqdQqLxKQj14DViyxTX/keO/HI634h7t8OJgwcGw1
         cWP8I1ApPi5JCIxl5Gs8ccxu21K9aSEnhE+F2HS2QVh0rjwDRr5CT1susdWgOfutwWnP
         eX4RJLSM/vHtnr9bMphNoQV4/cFD02mecP+AQO1eR+UYxiwdldjEfLoLhP4U+4FQk81P
         zNXL48cSLvqwJwSrVPrkXWXcs/cqsyVoIi50D8lnesUvJ0rz4Uo2frM7sCqDF5QArQZx
         dGAOvnB+PhTNFB5JPM+tmr7Zb56M+NYWwl4cIAkPq6U6moT4FOHFLEYfa4fOqiUcmdbQ
         Lklg==
X-Forwarded-Encrypted: i=1; AJvYcCVx9sMB+t6EZhRW6QrYD9mzfHP8CaPdN8D4cGGba0UDXk+WwY+EHhjdpBsaKoOZokOc9ii1qMN5kKInyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxREh8Nav+fddbmcmozdi8Rq9PT0F6xaUI/lGIF8BqsezWqcsqg
	+oYpORw6AWQ/OAj+VUYJ3IiyB2LFg666zJG7l+icqxMK6kGu5PRGaFQW
X-Gm-Gg: AY/fxX42WDGR3IQA3jsyxVqHP7807fw2WfJUhDPq2S+cXkmZJ9VT0otPFkzAE3S0mTY
	yEYvNEYKXjz1mvDiH97bDg5i63enpI60clSQXTe62t/FHQ0RnUhR9bNT71Or9RetGcVZXyAn4go
	C2ZmkYgt6+6qGT99a2GVtddn0P0IxJlnmY5RsaqppkuppIom2yvv/KzJdkrml/+FNgjZXdPCDdo
	lT5pyBXooiNERXY8oo9EWH1FqCBHohAJgSviEj3TXrDN1ysM7Cd9KsYMHP44sttqIXV0J+Vsep8
	+hLTrKBs6sX6a4wJwchcWxU/EpSNJR2OP2HrKsL+92C/Q/J3mFNPHS2zGrrbAZcOn9LKuoBXe+5
	qq2XS39SefkS/ZaUKMrbKhDBfy9MhrcoVfxpu22u+s0SNVBGsSfcKWzge1Z+kf7iBTEbylIg2KE
	Y5zfP7uU0wQvl49kNok27dR2JXJYPU0GOBw9l3lRPDENjj
X-Received: by 2002:a05:600c:a399:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-4801e345c96mr162137445e9.27.1768935979456;
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:19 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:05 +0400
Subject: [PATCH v4 3/6] ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC
 codec
MIME-Version: 1.0
Message-Id: <20260120-cv1800b-i2s-driver-v4-3-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=1645;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=fackHrxNCrfa3xgCHjTAFP66CR9dRJ4J/Fkm/B2DbIE=;
 b=MItEiN4e0HSpxL80NDn0eZTclssaZrsUM/KZNeFCT959G1OEcAPzPf8NwEb3wNWTi6MTxuqRD
 tECwH9+NBH0B6ZgBODGPQ8GWqs2kcND9D1gq1HJzvYB+JCItPqdJMhA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_110623_977965_A17D5532 
X-CRM114-Status: GOOD (  10.77  )
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

Document the internal ADC and DAC audio codecs integrated
in the Sophgo CV1800B SoC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-codecs.yaml      | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
new file mode 100644
index 000000000000..7293a98e98c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-codecs.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-codecs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B Internal ADC/DAC Codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description:
+  Internal ADC and DAC audio codecs integrated in the Sophgo CV1800B SoC.
+  Codecs expose a single DAI and are intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-sound-adc
+      - sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
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
