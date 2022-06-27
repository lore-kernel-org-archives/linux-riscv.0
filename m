Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F94DC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW3s2MgagqcXwTfghkieuyz5kRMIB7OenCtqCL7h6NA=; b=0VLWKwt66w2LFg
	Zhk8BErwwq8IwVHe0o2jFl9OWUHSQKHqFG9DBKUw1juXFCCSZ1b6MqS9pnwJpT0fncMNS4c/rHl83
	2eG6dByQ/Q9k32QQdUgtcvpIjL72E9wfTaS9o/G1ZZfUQhaWnZ2lI8KWKXCdsAPwPStbKlAFkZ4lO
	LhVI+3Rs5tX3ec3rPXfHWPgDkLwhvdjhDPedhgNHJIWzD+XNKWhN26iaaKhlpXD6VUubdz5EO/g6d
	n3vduk3v8YFnvDYGffKsIF+wf7wwR69Mmka5BBAUKpQbrcPhq5spi5yYlak0Qn+pVUYDhQhMjcEsr
	bAibXxNbUi2k5fTyUsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucW-002bHJ-Cx; Mon, 27 Jun 2022 19:42:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubz-002amU-DS
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id v14so14489788wra.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CI3fJo8A+eaieUlzNYpta6LCY7AsQa7tJxY+upYt5DU=;
        b=NCjs560wHII6fVECQB9/GdNlhvJNFE4pkOGLs8jP+UxuRPiuWEHK2RAq+jRyb7l21B
         lfShg0ET3/X/0mjEMGlwSBSEdfkuN/jOG4+hLlup2Q1NEGgyw8TvLXt6Sh1ng8wnUUF6
         ACyhrCvbH8GLUqGorfK03QyZ/EOUgFIIkp9U/rze0vaIL0pGtOjj0l2WGg8p0UVFtKdE
         2GtvloqzOeXu8KfiG3wMjVq/vAsjfcHvwx3Fvw+Z7IhEjjmeAf2mLbSlaMXjwCsQ5NF8
         F9+tVjwoFB7PMmDlGl56M6lK2Iw5z3M3LCYB6VBFZ/Gv2C7k/N+jEVee+9P4Wub30j/G
         soHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CI3fJo8A+eaieUlzNYpta6LCY7AsQa7tJxY+upYt5DU=;
        b=Pu3K7xgzYy796IyMswOSAjtdIFQIwe5L3BeqXlk/awsEgum0+8Krnr8if9Rp7GSXGs
         zlAQvKiVXxzSWxhyRiQegNwyiYGLl2DrP0lxYQs4QEtzVFjS1MDdBzgZRguUQpqu83Qm
         ckYhF0veaNnO2oLpMrG1rqR9NonxpEeDyyGVnsxfuge4uHXJOEeMht7cqfp7qpc+uW6Y
         52lyTPnsVogo8HJvc4QVi/s/MFAtqpIdYVAPdvptfY5Ctmh0x6qmf043zUOnlSdQIVCf
         ByzP7FGgMR1HAOi02Ew4Nn9Vo0oSUUe94jCQjv9vTnovkvvXd/Dw0BbpeDnNb4ReiQPr
         Tehg==
X-Gm-Message-State: AJIora/w5gFFju0nNamShbnLyxGeI4B+MsnknHD3wmdWedZ8+4S5yVP4
	y2ciP/LY/tH52gQVymN/JClqdw==
X-Google-Smtp-Source: AGRyM1vB7FfkKSm2wSwW9aXIKCoZFOmSwRYKxi54RsU01e+Y3cIcwbXfb6XLRuYxVHKTOGWa9mvMRw==
X-Received: by 2002:a05:6000:18d:b0:21b:901e:9b27 with SMTP id p13-20020a056000018d00b0021b901e9b27mr14202414wrx.389.1656358887406;
        Mon, 27 Jun 2022 12:41:27 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:26 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 07/16] dt-bindings: memory-controllers: add canaan k210 sram controller
Date: Mon, 27 Jun 2022 20:39:55 +0100
Message-Id: <20220627194003.2395484-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124131_525571_04933D94 
X-CRM114-Status: GOOD (  19.83  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string & document it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I made myself maintainer since I didn't have anywhere else
to point a finger, but I am happy to let someone else take
that on!

The corresponding U-Boot code seems to be:
static int sram_init(void)
{
	int ret, i;
	const char * const banks[] = { "sram0", "sram1", "aisram" };
	ofnode memory;
	struct clk clk;

	/* Enable RAM clocks */
	memory = ofnode_by_compatible(ofnode_null(), "canaan,k210-sram");
	if (ofnode_equal(memory, ofnode_null()))
		return -ENOENT;

	for (i = 0; i < ARRAY_SIZE(banks); i++) {
		ret = clk_get_by_name_nodev(memory, banks[i], &clk);
		if (ret)
			continue;

		ret = clk_enable(&clk);
		clk_free(&clk);
		if (ret)
			return ret;
	}

	return 0;
}

Which, without having the hardware etc, I suspect is likely to keep
working after the move.
---
 .../memory-controllers/canaan,k210-sram.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
new file mode 100644
index 000000000000..837eb65854fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan K210 SRAM memory controller
+
+description: |
+  The Canaan K210 SRAM memory controller is initialised and programmed by
+  firmware, but an OS might want to read its registers for error reporting
+  purposes and to learn about the DRAM topology.
+
+maintainers:
+  - Conor Dooley <conor@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - canaan,k210-sram
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sram0 clock
+      - description: sram1 clock
+      - description: aisram clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sram0
+      - const: sram1
+      - const: aisram
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    memory-controller {
+        compatible = "canaan,k210-sram";
+        clocks = <&sysclk K210_CLK_SRAM0>,
+                 <&sysclk K210_CLK_SRAM1>,
+                 <&sysclk K210_CLK_AI>;
+        clock-names = "sram0", "sram1", "aisram";
+    };
+
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
