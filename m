Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D516D29C41
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cekPaDL4FnD0Vj5DB1djeqPZL/76WJGNmOtFfD3eEro=; b=BdJlrUCuqbE1kM
	rw58FKhD+RZJVteFGC9QI7mbNaYi8ilRp0NArqBilrpza1m+mOt1v8Kjaq3A1ZdwOa+0dBibsRLof
	RF+mf41COM6UlMk6SLWGwRX4pzBGTUXNaJBT15oAWWmH3P9Lxfjunrcl33eEIz4G6xPonjHC5gbjp
	pOoA2+7UOoozZwAddNJXGNWNp6QEfT052YqAb7pb0+KL6TR6CrsYay22xXyahM9Nuvi5ysCpD8Zmj
	GTTThAn3j06V8Yrig+UZbS/AatFUEGsJqIwqvjKSf++tngsIcq1sFkuJUrsjcIGM/GVIc+inwEWU3
	yqrnQxp/A9To0C2FusAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9g-00000002V8U-03ek;
	Mon, 19 Jan 2026 16:31:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9a-00000002V0n-3mvf
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:31:01 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2520426f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 08:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840257; x=1769445057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=nCi4OyB5BPsmGhaNFbOXscVsTzvANl9m+G/ntmag+0YkuttWPB1Ar68z2ccPXDumHN
         KSoGxf0C1Bq9LLA3LlzA8KL/U32Qv4WjTFo6OStryp5w9aK/CdT8pTMDDie9P0Oqv+jk
         Nj/lOca2GHEYR4dFlSCdKiIZ/JoF+JflmB/hWDe0EcfgSn3WOcpICYdfiKf0Kx5nzHb4
         2J/bEqFVCUW0nnEtxPK3YfiUgkKsztpTG9pXQro7D91TGlQ+UbnNx26nX+B68oOUfQr2
         dAgjmi3FHOM6xLouOYJBFk7NZXed+T7HRF7Lst0N0RWYx+mmSUR3+loF4y455Y/2vwoe
         pmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840257; x=1769445057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dO/w705OwMsU88LoVwjVUON1I4DFKZluQtaxNiuxS18=;
        b=kZNO/gCgFoI6UnpNG01ga3PABQKzZVdHMcYTKOdNOflJWmCVbh79S8c3iUvH8KXoa8
         gdSALnQJ9NITMw7IeIu5NBcoth7wk0naqVEKf+9RzolVsukAybEf47cV7Q19Ee2Df7Pv
         a5tEXlxVW2Ha+i66QcrmfCu3KJolCaniHY+LJUgTqoeZ+N1AtZeQ3Ry7kWcGo77c/VJU
         E0kyBgUOTDin+xZNjYJpNieb+2kKONyQSMmXnE46r9ID1IT+DX/MolvDr0eMuKLbSSqe
         O4S0/XKiL/raBVTEHpMtr7l6kI2ObPObBjoRhVh0VsDd8v2gxTSI0ATFKKaW8PyZNJcP
         qpfg==
X-Forwarded-Encrypted: i=1; AJvYcCX9UP5PhqMt5Qqq1wlRP4Q+DYNXzMP4rJWRQ8MtgzgcE2hwDa81Vi3oTsnAZGRrfkM8fhqVvEfqeoPkXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxglD0HuyQoZTzwBIjogMS+ucs1NGxmBjuqwzPmfSM2Gm91fZNw
	BCNIaMzKouCScEp5RksKgXeXBZDPmUfBZMg3pNhf24IkaH0EgFdURLGI
X-Gm-Gg: AY/fxX7M2U25F/rdEVfezgpRU2eivseff15VCmawAjkXB57dwwtCeurhq/oBPBoz6Ma
	9PqAllRisAIvE8IbxoNQ61XmyJiV1aRDDoOXBrOBvdb9hrmR9C2Vj49/LysnS3nyPPPUO1vfVJr
	lDEA5ARXbXAvmr3f7iG/dK/neEzLrZEpVeph55nDbMzxhsQtobc/WefquAVTlSr9ku1C5+xcH6o
	jpUBVcWNsXc7lN65ZMeb9qe+jHGmg8nsWK1gWw85e7spv9t9JCLTK70VGA2eJs7kZYvCDc8FbJ9
	IygO+fFpPerDJGfb8/g2qdZakvDemFb+6iEps3aJ/vR1alsHcriTBPKoBU7TWnC2Jafzg1KoFbD
	NVy9NcHikswAPmxP/eZuwo+N4utNl06vC4yfbwtX9owE4VWlwTcYVtxKk5MaQNRtjVHzFppNzJ7
	FVYLuMRNxPVrphOg8VqLm54ecyN4oDVgow/oEmb9U+QZKq
X-Received: by 2002:a05:600c:548a:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4801eb12369mr140158025e9.32.1768840256778;
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:56 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:44 +0400
Subject: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
MIME-Version: 1.0
Message-Id: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3011;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=Uu914q6UODLItA3vvK5l88VgJwM32DdfsJmtfwi/rkw=;
 b=nqI8ujgfXvOhrkF22+SO+FuPdj0nXLzd7iSHNw/zYATKuwEIQGxLxETgbdJ6NdnCicyO5vUUa
 U9BiyYztgEqApft9pm9i+stRZcA7NDW5Id/dBr2XFP185F3gMq6otZT
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083059_796160_F45F9A2F 
X-CRM114-Status: GOOD (  10.76  )
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
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-adc.yaml
new file mode 100644
index 000000000000..d3b7e92f9758
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
+description: Internal ADC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single DAI and is intended to be connected
+  to an I2S/TDM controller via an ASoC machine driver.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-adc
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
diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-sound-dac.yaml
new file mode 100644
index 000000000000..8457bddcea92
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
+allOf:
+  - $ref: dai-common.yaml#
+
+description: Internal DAC audio codec integrated in the Sophgo CV1800B SoC.
+  The codec exposes a single playback DAI and is intended to be connected to an
+  I2S/TDM controller via an ASoC machine driver.
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-sound-dac
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
