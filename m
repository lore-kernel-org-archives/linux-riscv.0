Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5654C98338
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMXVLDoTS5Q1O9iSNfQ8HlkWNGe8cm4FdkY+iawz/vc=; b=ByR++XqYQT98D8
	QMwYaKQUWqfMDH8RQvZwBdCWud3Tqv92osnV3HYqb3bu9gtG4sk/LjJnrrzHuGX9Wgf8I03TM4ij2
	PkEKvrvIfoPHZaj4uRrctf1ySR0efctg1SeplLjNUPAkZJ2GEas1lKHYkYa3j2KQV1V+iH7WuBx+2
	0uLee9cmpvMhue643wCnLWJCDKL5QUrXmSq8dWoq6iyoZGu7OBIn5oRWd+j+oG9xqoN5/e98pXhwG
	n+ZbnqHpDjK9GmhZLRMdmABhPVSHldpEm7LmWlBIQkJSv4LxxM2XfOXCVUqP3GypZKLeDCepL/naF
	/edIBwOp8cmg36eDVo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClr-0000000FtS5-3GHx;
	Sat, 17 Jan 2026 20:19:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClp-0000000FtRA-3G6w
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 20:19:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so28788185e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 12:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681180; x=1769285980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=GlZCfATzaoFjNp4MhaZUH3xCVrwCGWgTcDKJSo0eeVnPwaWLNjkD9jts4glMlPcKaC
         mT3tSvpbzVGN3hMXvkBOPb36ndg1rse7tiondNj/xTW8QnhQuuf1wD8CbFgcEHIYWepF
         bhnVOUAF+cdJGlsfIpjgNDEnuAsIfNPYtatHXSpvlpCZPBvQq1x34SEW0FV5Z79IAfiu
         NPB9Cwq9/F+83Y8LhxHrk4sehn01aS2GAAqtCaV1/t8pyq/KcSqxY7bdWBVfJvkYvxGq
         LDwIZPqQN78uiX0qQQ4QQ8IdlrsHbXRewr0Fj8NvpyZPTMt4Io8BqGsICVzv671ae0ju
         l1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681180; x=1769285980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UxSpNiV5VGrUBMb7ER2DKSz/PAOIwyqbaRxTfzD0/M=;
        b=qyMCpA5m0BviLRSxnHg/8oAE6kS8wrV56QqmxrrWZEIqtpnYk0FEAcDGdRqkU2RYJX
         ArccpbXGP2XUahnfT6XTv0eKMoGS9lYl7/oeZpkPo/LHfwQcDMxaiy7ofCqXgdQG+LI1
         9E1e2paeOcQiy0+p0lMUulyzEAouW/ThqkCU0jWxcwdh3cAyv5spoPKIncmOZ8xdBJS1
         THHjsaODJEKV/Wqmcsgo34NsQFySO3pi4KUpBsjpLGF+gcLC6h/lL0OOHGev52V/fr+O
         9SzdVWoiD+eVBvgb70nYEgSp7Zf2ybNKLthFOLp4Pn2+udKAkY9rWea6GhONgO0MiMfn
         jMVw==
X-Forwarded-Encrypted: i=1; AJvYcCVIb9nKNkZtq61eVwY8q4KvIpwNi+4mgFTIErnJ7p4Jii5UGMIeGXbRaTla+ynzmyXsCioKiZjZmYDaGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx6wK0VYl0vq0rpxZa8AA7kh8BX0lzKdFLvs1Hqc6XCcLiEanZ
	vWInbxoUXfIYdMJrfc/k2uzuAHOYbvqufoZ9Xn9DGvBNgYHVTjDlMpVR
X-Gm-Gg: AY/fxX554LemGVv0PlrZG228bxTcf9yxYFp3G5U/SUPROVCtAjRNXJJ7HGsqZ+646Fw
	4yKZG7F2ooN0jpsWzw1Vl6YcqC6YGuAQPXbpo8sh69KXT4hhLbrdXsHJ//rVw0ow7WhzbRLRmA+
	IxaSQBlbepnqooC4O9cosFdtnFKIVP9tYG0U0BV3FOy1qlHG4vCnD/vg1C8SgZ3KVDsxf1hM2Fm
	WZ0U0cMGBUbss56/E/vVb0J/igXmBVh4BUI6bn1GaWvh4y0r9QuSl5I/wV2cYcNK/8Q9id0c4OW
	8s1YsMdpkghF1qZ9X7acXpFqQETFUsL2zmz0I9D87hVvE7qtcIf6I5ZB++/8eLZikaSmcV9h35p
	hzCa/bBpVHoFttHTc2MiQj8VYDFXgUBkdEcyT4AVtZhBqPcPq6ioToxPuI7jskc3FLyRj1opeNa
	fx97lvCd1faWsYD35hSV/x/f6ggyegz5HBJsIo54ZFHzj5
X-Received: by 2002:a05:600c:548d:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-4801e2a4c3bmr88691655e9.0.1768681179596;
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:57 +0400
Subject: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
MIME-Version: 1.0
Message-Id: <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=1737;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=GwTIVlGCDzAackWj5fM/XVH5Lb9iGR97dcSVgftL+2Q=;
 b=gWseGCnVm2/lclbG2rn3qTW1KAMRYhjwJ6KXzgLpr24RyIRTPhxiEifZ6rXedoHGg4b2rRBJg
 0zD6SVMzvkUDOAMuPw4nvoWJS0mMvRtfBHAbR4UhgEvE/VkxZzHvzq7
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121941_861784_25A0C0DE 
X-CRM114-Status: GOOD (  11.35  )
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

Document the internal DAC audio codec integrated in the Sophgo
CV1800B SoC.
The codec doesn't have any special configuration at the moment.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..2a35e38dc7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/sophgo,cv1800b-sound-dac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800B internal DAC audio codec
+
+maintainers:
+  - Anton D. Stavinskii <stavinsky@gmail.com>
+
+description: |
+  Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
+
+  reg:
+    maxItems: 1
+    description: |
+      Register base address and size of the internal DAC codec register block.
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
+    audio-codec@300A000  {
+      compatible = "sophgo,cv1800b-sound-dac";
+      #sound-dai-cells = <0>;
+      reg = <0x0300A000 0x100>;
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
