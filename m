Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D352CC98338
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrscQrRqOoO72fCvYhdhL7RpeB8Ud/U2Um1z61I2lmE=; b=LObuNicNVBEDgA
	EprvIzaX2+eNzV5KjeW58h52157zxEn2gEbQvgwzSV/HJTB2z68rOMtYAEPzXdjIY2B3Zu+B5pC1n
	D6NM+m5W5k+/7zW2fTu8Q716W79filcOR+rTZN5R87Xdl5l4pNpvgX5RRvks4s3weqM16xomL1rFH
	Cdb1CDIAlJ5Fmcc7M/FmMv/Pu9bVAaQn3DcAE8zOg4+C1JfewaDeI9SqvoT73gYYDdlr9ZPY7pt5Y
	OzGWpsX0wPA3qMf8f8fPd49ZRKNTAnnThyG7k3Tc36/EEkPun/Cr8SZZqM/sZ8+YxdLS7wRzAsnlW
	rm7yHMqsSW8cVqw3nDhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClm-0000000FtQB-0ebb;
	Sat, 17 Jan 2026 20:19:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClj-0000000FtOy-1Rii
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 20:19:36 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so20309595e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 12:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681173; x=1769285973; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=j5v0MWncdFBUiwmYql8Xm+b2PZ9rfgaPn07pSf4xuOJIys9vGsB3VWDCAyRS4SOSbQ
         Vg2Zh52Il6x/p+tJn0I2Q0+JVaUEe0pZ8yMtSUiRhjiSYwfx3mON0kiyzBmNTN5+mfT2
         BJg6o6Epgf+E71UOZEU4his2UJWc2Qz22QC4FgCSZvrSMCwAjpsGgoEv5k/20uqrwNg8
         RsYAG4UdY0h1H1Yjd4p9CZGmcxZ7IAv/voGHLCdPQ6CifXoyZxlSiDeU++DhJurpt0Zo
         j0yy3zPboziBADZ7vYUAdjaNhSAKgYmpXm7UXWcdkG/KQOILIEK1vgRrDW4PmA60pDUs
         z9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681173; x=1769285973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bohYG42KR5qp4xz2qlOBlGbhjbb9bQhbV9gX3/v3Mk=;
        b=fhwxV5BPYHU6kkfJJ+2HfJJDm2ctrxlnguHZUqRG1wSLfyTXBLhtTifnOdYBLAj+ug
         USxDd3jXv+CGyu3UVNFF4rpxAkT0/gxB1wWrakP8jx+VV/DvRhya3aUAEpqT3G2v77MZ
         +Ip9Z0RIgbI8MephyzbmT+WtfsnhkqAODL+QriTfI0J5/Ldt5sHWLIX7AXAXzpsFgUFa
         Q6Jj4icj8Mb0QvpVXgBOubzT3CS0I2mXHPPpszoyRTao78tHstmwUTRyFG3/nUAZLMPo
         99/7voaVzbiWe4Z64IWXzEDhR0r1Z3OXFQKjteaRzs3MRHLrXdcKv1T4rPSsJ0qpsjJ1
         vnyg==
X-Forwarded-Encrypted: i=1; AJvYcCWMMkGIzPMpN/znQX4i1YbaUggmcEE0+B7l8nBiNmaL/M5CKK3f6MM1YGY5g4hzB/X+hxSgtUoec1TO+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/aNk6T4BXDsiN7x2rxfwNy1BaLaJwItjfxwKxNCn7miLjkcsz
	m/kf6wOrR18iGBwPuiPoox7rtw7/TeeUzE8rcrUAtrnFr3b7l/AgPM5g
X-Gm-Gg: AY/fxX4tGdcY2PEEEPZAKCM+2EkVLYp6tLmzS70AMX36rc/FrpVk8SA+qQ9zSCRkFda
	HXvvqpyY5Ep5US6qT56QAV5eYN9Ok3OR1s4XMLVHpcAtL8/payXdSqtTLiEhposUVxOGeVTt8ce
	MQen8WJOANuag33/DeebsGGHLclSWsKjCggQMynrnRcz8aPJ7RNR82blHHPHzZA6apoutKODbmQ
	5JCAA0EuA2WFVVmnixk6ZR1NmU2ISd+Kv+nTT9otjCSCiL25DLMuAnEmk4cqOhpfkudGX9FaUf9
	I4E+2V8aKCfWQx+UBWZUoTpTJCLLVd2WLq8sVenfeF+00Vk6fvUM2Ri9VYZHgr9u4gWItMBWrr7
	KPB9fxHAndRk71DxLt+8DdM/cJBOc/utQeqYdkpIeCxe45fAmRXhpMG9I4Jl7LGPskhml1Uj8OQ
	eliVbSv80fyj/9xhBKZci8ESUiXzcPCsTlXHmcU4XT5EyHkaaLUk2+fKw=
X-Received: by 2002:a05:600c:4693:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-4801e2fe194mr88194305e9.7.1768681173087;
        Sat, 17 Jan 2026 12:19:33 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:32 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:55 +0400
Subject: [PATCH v2 3/7] dt-bindings: sound: sophgo: add CV1800B internal
 ADC codec
MIME-Version: 1.0
Message-Id: <20260118-cv1800b-i2s-driver-v2-3-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1630;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=dLNnA22RKAohaAguDDfnNkXyaGGOSbGYv0h2Zz9YQM0=;
 b=EeFcn+GCVjQQk9AlKztuSLRvUBU20OcxJTOUV5Zv62e8woM+6/UmsJtbuI2XJHrjfsIZYIG4g
 pEFujRYgLMPBsgyOGXn6+QLsWcx6nO8e2+oHmZSTG4XSGcGekrlC1RN
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121935_427363_08B97E45 
X-CRM114-Status: GOOD (  10.23  )
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
