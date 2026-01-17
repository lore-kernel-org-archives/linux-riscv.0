Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0356BC9832A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N+DOtAhm8hryec952NdonwW/fLtgrRnzjgoCrn31W4=; b=u8r2buvRSiPUs5
	3HR+11xOjfW99CVXuSvnkLthqxO5CQovscaSdKgFwyf8L+I/PUvCkJI0+Zv9z8BEW9tv4vpegv8oh
	7BaSjCPbRLbWZGf8o3fsFygLYTz6w3h3bfOMnhwgv6ypgTJ8/a5UqeioG5wjCYJCXsyVoPfcp2eA9
	MHxWQGwRQYBG++SaNjtfj/ByGceTYP24dxv6ZRTzhb+PsEvgP4IJIWIWRSIK+cgkDf8Wgk8o0PTD1
	FpqFjbZ0cNTnlflrcCUMR9/KpPxYuDwFBZbX+o4eP9zBsnEXu8byFXjOIySwWQNZ15VcMsiWwgW0m
	wqnBJI396Il5rBeJ6ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClf-0000000FtOF-29v6;
	Sat, 17 Jan 2026 20:19:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCld-0000000FtNj-064o
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 20:19:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so16710585e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681167; x=1769285967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=B7FRXGEF7gFzMWCgti9J6nkC5JlqRDZxG9dKnPnL2HpF+ehjuz1PNs6HgOXNz5yNAD
         rpXNulTQXXQHv1ow3YbRcdhV6PuG28MfRNxPkkfVai0zc9ZuOBRBrSxkZipw1gl+41cV
         Zh2sem2HtB0Ux1+zNuFn6igVUc8ZXc1xX9HPyLKO0KGuyz7BFIU4cijfj4lMbpHABJvS
         YggoOt8BBUrb8Hwdw8ttYSJ8wnal+rDDvWDXGka3n8gCy+/8bINaADmP2uqZaWQ078i9
         SHSOgjkEVjMzYtz3eF+WUyojqxcFYa6SQ+vM48EQZSKlFN1n/vDdVSX7ZZLLkd+fx4An
         EdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681167; x=1769285967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwzBVPdseqequoGznSThkBiNytvS8vOvSDEv5f5uB/Y=;
        b=I+uivv4LR3YtTW7peO89DavbZWzXUJBaZRmeCkk/qpCzWmNXXzk22nhdXmMjvk4v7U
         pSHCRgMVOBZY9kx5Yx594kkQihQD0hC0qFwlASXN178dYnqiUG6r115QDddTh1q4qCen
         nm0E5Jl/GIBvIc04hP04zrXMMbZYfMXiHKofb54nSf6TDnfwXT6V2cwYXWbF+pQFeEmB
         L9hSJbbYKHwM+xtPtmhd9C56roSpPtYv3anAQP37tGWOZRNE4b7gXDyh3FKWs/7iYuzF
         bLaEPgRiIAkJzrlcdMQieg/SOGiXg38zdoqwYGbo9cOndD+8To2sqdZXccXkILoG2pyX
         PR3w==
X-Forwarded-Encrypted: i=1; AJvYcCWcPCQgrIIonh8J9BVUfDe+Ql8+m8u1tDS1jngNQKnWCiKzL+2RbOFfBLXJYN7tpBpBf/Rzm4f65/BBJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpBt+09jJtu2y+TQ02lqns/2Iy3/3dX5AwXoHfTzMbK+yYGK/h
	WUiTqQddIOVBYET5rZIAuWDJm1iiOTx7yI3QZN6rZ1B+Wl5qmM5KZUZp
X-Gm-Gg: AY/fxX54Yfz6Z5zViSPOkussbnAGb4AL6Z/6lYYb7/s8pzyWSABysyS7y3XVovRUmRk
	sBzz4P1OEvRHl+VA7jwNr6bJpdFpCCBE/bPL7fwrnX2HdwQgpsISj0+q28jHD7MjqMl0bDAYgcE
	YfRyDPpFfrFX8wWCxnah1Xemqha14UqplIyb7VWFpSS4B4fY+fPBtsLKQplt9QMrMO6SUqKnOVP
	UmAo6dQK50gHMWPKSwS9ZNfNMJiTlNPM1RElPdNRNUikWmmVf5ORKOMAzl9ZYNKBa2yVenXFWq5
	OoMgZYi6/C7OmBVGUdzCphbpKP35Y1POVdjvsTejKho1PF6hfTDq9V98A1rk/EJld6yq0bHwBOF
	bujMRrJZg9HWVMOyEGzCtojYA4PBYpHqIAtk/89PD2AkiSgxw9/ygxVXgBK+o+HX4pE85tsbDpT
	+9XdqAstgZ1sLhfCD1wrzUDzpC+xQa89yTqWbri7IlwNfR
X-Received: by 2002:a05:600c:4ec7:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4801e30b6f4mr71192545e9.11.1768681166795;
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:26 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:53 +0400
Subject: [PATCH v2 1/7] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
MIME-Version: 1.0
Message-Id: <20260118-cv1800b-i2s-driver-v2-1-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=2586;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=xkpcY06T5wFRQA45eU8MgJ1mdP3AEvbYjLzx5NAKsb4=;
 b=pC6DV7GcI29FzrC3Bw4ofC67X6yqQvXg4mNStfo506jWw3oV/KO8EwPu9xuatoEK/rpgZTG54
 zNxte7NQmWECIAwaPL6+eJ/2yQ9EfbdX8Lgg30Tihx77gEimpIQSPnn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121929_083528_32C54C5E 
X-CRM114-Status: GOOD (  13.63  )
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

Purpose: introduce DT schema for the CPU driver
The driver uses dma to transfer data. The dma it self has 8 channels.
Each channel can be connected only to a specific i2s node. But each
of dma channel can have multiple purposes so in order to save dma
channels the configurations allows to use tx and rx, only rx, only tx
or none channels. I2S controller without channels can be useful in
configuration where I2S is used as clock source only and doesn't
produce any data.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
new file mode 100644
index 000000000000..cf30880a62da
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/sophgo,cv1800b-i2s.yaml
@@ -0,0 +1,75 @@
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
+description: |
+  I2S/TDM controller found in CV1800B / Sophgo SG2002/SG2000 SoCs.
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
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: i2s
+      - const: mclk
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    description: |
+      Names of DMA channels. May be omitted. If present, one entry
+      selects a single direction, while two entries select RX and TX.
+    minItems: 1
+    maxItems: 2
+    items:
+      enum: [rx, tx]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    i2s1: i2s@4110000 {
+        compatible = "sophgo,cv1800b-i2s";
+        reg = <0x04110000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        clocks = <&clk CLK_APB_I2S1>,  <&clk CLK_SDMA_AUD1>;
+        clock-names = "i2s", "mclk";
+        dmas = <&dmamux 2 1>, <&dmamux 3 1>;
+        dma-names = "rx", "tx";
+    };
+...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
