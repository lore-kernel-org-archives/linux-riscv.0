Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EF7D2628A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnZEDgKflXWGajAqrqg0wOvSZvA+BA6Lrc3WjLIrR7A=; b=CoTwn5vaCBzUdF
	1Qvxq9L4KsW5r2dGGtc5TTkBunSZ6LmCK1Sk2dpFzK0yICDgqNDcH9syQCD94he8oQXvK7G+AhRVm
	NsFsDYj3ncDBgrevg456B9w79oabSz+wZnGKae1T1+tZNhoqpGRyR+tgHPvt8lsef6G2LX+7PK6OI
	XVB4MMEyM8dPTLrKluzl9IvN0qRN/J5PSn6DV7i2K0TdFWJDZk8+z58ctj6pgIYfGoYoxTWZmQpbh
	U55/OEfkGYoYPIflmrlOUG9M0NjL4yBlkkchN6zwyC4v41MozKoV1BO0zjvoI6ccylwCmLe2WmEhQ
	mNA4BFtObkKU+QjLWKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3U-00000004Ks0-3p5K;
	Tue, 20 Jan 2026 19:06:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3Q-00000004KqN-0zb6
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:06:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4801d21c411so20721655e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 11:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935973; x=1769540773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=K4H+I+nTY+/F8Z0PX5saY17ageRbtfks2UJFhhc581cDw3cMyv5r/B6BLaZGKkJSJK
         LpzPNjie16jEHxVoIFMCy6SGCgr2v9kn8s3RmKGvwYRTkQ3dcY9A0haD6KEjjAnWmVpH
         sMM1nQn/AfNod8gQULgaj6nW0GzncU7l1/pqxMISe3QVdVJ73gvAFfsvaJH+MXunwBrE
         1lJmTZfD20FR9qGQ1R4aTL1/GLS1yHSjd8FYkNg8QELlrizXq2kcH2BPk2cblI1UJfXk
         ikrMTIeCXT38HVSE1Bu8b0iYG5O9ztT/V6YYoXR+Tj9WTz6M2sfm7HHThFwSURWQ2Ml/
         LNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935973; x=1769540773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lfs9m2lS0OGQ6AFUB84Kj8F2HzMlL+m5vSn33xsuh6g=;
        b=W6jICEdLZB7ggd4JtRdUPYD4kZPvmwZ2Yw7jVVsfM5grgrTDG2/fD+vIuEiguGtwX5
         zEaXKMXYC3L0sLnUu2UP6eBhPZk8zC7zFHX3bD9xO18g65XQiYL7A6Mv8oKZsZ87xaAS
         fGKnLf8UuhW9jhq13paFQhnYzvpM7O5byg0sHgiVa6BHkb3xgTNvaSyJhfYcz/XpVrAc
         XPtSofDCw8SKg6StwBnPp2nJWL2qjCnKR607Mx60Q0lQkxi5B5w28vFZZ5AcgVt5dp+8
         k3rhHr+YdpuuTCGFDin3tt1Dqf7doTDcct0NbeZswNRpNQolqVbcQTWAOEP/xG0Vr/Cf
         iDEA==
X-Forwarded-Encrypted: i=1; AJvYcCUe9GTkw673KbgDK3v97ewK+effp8PJk1+Hb4bktPXApWzJscOH+GPYcjyI5PH0aMEfNdfm2PeCPoDmFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT9zPQ6HXnqdxrbuY3AXrlz+kU4bjdVDiWxZx+Ev7/jCelGBh1
	UOjgd9OgH8v1xqGs3JsvrXcjTfdWveD5T4lwmArGVnrTMrQceNz67aLL
X-Gm-Gg: AY/fxX6JrL27O0NRQLGZCLUXDPQzIVhhmlAKKHoZkiIl1qu2EVmKYRVvT30XEMUkmUr
	n459dHUsimFMKFPBCr9vsBNNghoOU4ctJOUBZsK9+EbX9qzGIK9vBjD9QOTlhZUJfWoOcTrgtei
	aNrCLuNE5y4HU74odEiz13LojzLWZOsIa3X0k5MHzW1mnUDYl1jniapOoIkG4in8w9raYkBT97K
	msKes2DosJXzoXUGCkixGOGvqO9MPnKCNGJAfYH/3AYvN+xTYWEyYZH01SxhxqIBnnxWj5HMWeP
	MWKHB7TFvN7jbBe1LiMuyq5S7DyrKsGyALtiGfNedP65rEhkXSN94SXsDo9RfUQqD4AljQ0+/px
	yBhOaZ9R7FOmM+P4GvbEG28dUvtq0SXlMoL+JNuWBDYYKkfjh4PFlNap+K8dWsk0ukn54FpBbBQ
	wSsCpojCF3CKd/VQF6szYa/eoNKdlfELhyc/tECT67vSdS
X-Received: by 2002:a05:600c:8b58:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-4801e345987mr230321595e9.31.1768935973027;
        Tue, 20 Jan 2026 11:06:13 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:12 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:03 +0400
Subject: [PATCH v4 1/6] ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM
 controller
MIME-Version: 1.0
Message-Id: <20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=2363;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=yxnEx4BU+xefwn+EfFU7iFurmvPml9i59k/P1RLAJgs=;
 b=4ceWN1YSmA/dnUJiaFeJ71H2kKEEf6TSCxHE16GDFpBeRQWyCoDj31tNuqPWaIX99YvDyeYG9
 RGXjBukPLo5AiTzR0C+aXc52BnXDsS/mUZse/wpVQT8d4TjzUO4zggA
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_110616_314501_51909AA2 
X-CRM114-Status: GOOD (  13.07  )
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

There are 4 TDM controllers on the SoC. Each controller can receive or
transmit data over DMA. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..f08362b0ca5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B I2S/TDM controller
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-i2s
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [rx, tx]
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
