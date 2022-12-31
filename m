Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C7CC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gpLW6bGY8O8wrZhUcz7XIWL48tqX2+ftA1SeNUZp1c=; b=Dmd8t8z49o/Obq
	EChZH3xhGOkxn6otgrjCnUDDYrOoinfGOIvR0zWd/dz3XzTKLfEp6/Zawt8wJISUtPgwCEEQueryy
	Xx8xmd5N9BOFyPuifcaa8riWL0UnCwgkGrxrbAu+KA/PjwVjhqG8GdPqaUszM+89bAn2x1jbrsPx9
	n4y+/wwmiMUlm/mLWqYIZ8Sw2oqyIufX/k698KsLFH5nGE3kVELxJ/Hje6pOwXmwdxrt3mQoSqjp6
	2nFaeY3frnfvmQyWVoYfnfNMah81vVc0GxkC4v0COKq301VG3OPyKY7SoVqqM20Qz3Vzf5irrNRKp
	+f/QyFhWMdPsW8T68AoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlTx-00BZJ2-Bh; Sat, 31 Dec 2022 23:41:41 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRK-00BXjE-ES; Sat, 31 Dec 2022 23:39:00 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CC6D15C00AB;
	Sat, 31 Dec 2022 18:38:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 31 Dec 2022 18:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529937; x=1672616337; bh=1I
	mKfp6mi3k5y3IxQlr3G7vHr9aqIhKTT53gvo+gyWE=; b=XV86o/RF/CRjWqO/eU
	yGsjWW2THBLcCo2wCcmXfr2V2i8L49kMKz96VuVfpe07qo+0S/2XfogXAtbF4okA
	0aD/MFX0fyXJ5G5ROinFGb1sbVkiBa435Bl1xqyk5YsC0QIHIWLuyZ9gB9+EsMk5
	c3+p4i7RAyoCluoRFx5MxHSKJa47J4pFTn0C9S4o5/waBCVx24yrEHhcnKv3bBMo
	KiW0gt8LRfrrdYwQSyHVf+KF2oqhqNKdnkGTW9Ss6ZXCaG+H3yorEbakyMbXgIbE
	HnX/LdEnXxsffuoD+Zgebp5x83Nywu9sQ0JCThqzv5LgLMvB6XEjtTrqwb1nob5I
	LWWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529937; x=1672616337; bh=1ImKfp6mi3k5y
	3IxQlr3G7vHr9aqIhKTT53gvo+gyWE=; b=D03YZprMyQ9rJBqzs5/KTqhbEgVKk
	w7BasElU3IQmfNHYlvn7oRQ6NK51hVvN6UMoIyzzahs/tSEmHKFWf3JwhVQnRvXJ
	cmLDvikbHtno03CHFr6feWT2Ggw8KoseRqsfhDV6qfZ/Wa89l+TsrsO6g1NPdHWo
	x/PmdX4ycpK5SiRF/tbX/x3ihJj9YwDmwRydNoRNmlFnU6vKbWwc5Y+L2p4Ec+u1
	suY9+CxaP6zSyXfaJ+/7fcnaEvhF3HtzuC7TKcm3+kLjbwIB107cTjxu1TjrypMz
	ZBPHczFK1NE6RHUkiPCtPcKr7PHDoGpaj26JHZVovgPNY+I7Qe0RR99vQ==
X-ME-Sender: <xms:EciwY8SNtMfYn2R8Tc9ho1-MUY4GxhHFtNpH5H3tnC_wKA9qswm1jw>
    <xme:EciwY5yQ5C-c6wMCplE4_5-Qdm-al-4AGcHINOkUUSzqShY3l2FTOUoedIkfD8Q7U
    CRmoIl3sJbdiPQ6qA>
X-ME-Received: <xmr:EciwY50Sbk2SP91XXF5hcMVql_yNs7oXZwcjWnhti_wAcYO6GPL_foT8ch3w_mHpsNm2nJjkrk-cdkqD1r7vrw8XUU88PaUUlFlu5UnxaTi9zEIS1EoyrMBrxKwbbc0PxlxOIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefghfevhffgheejhefgkeehueffgeehffejgeehueduueeffffhhfeu
    iefhueffhfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:EciwYwBnNnAS2FsK1a2X_rKZ8k2pcGdGot6caADAkw1n3_ghzB_s_w>
    <xmx:EciwY1if99cROLHoFaFMLY3Irhrc-kx7CRMEKH41EMIpdYJbJN288g>
    <xmx:EciwY8qEniPyQ1gP6ZUiw5Z6EuNQY9rAxd7l9uLj_jffVwFybqc2cw>
    <xmx:EciwY-a3zkn7NIvap9tTYKIkeAz_NqtkotoovGi7sGEKniGA4bE-lg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:38:56 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v4 03/12] dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
Date: Sat, 31 Dec 2022 17:38:42 -0600
Message-Id: <20221231233851.24923-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153858_600596_802DBE26 
X-CRM114-Status: GOOD (  10.30  )
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

Several SoMs and boards are available that feature the Allwinner D1 or
D1s SoC. Document their compatible strings.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v2)

Changes in v2:
 - Add MangoPi MQ (non-Pro) board

 .../devicetree/bindings/riscv/sunxi.yaml      | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml

diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
new file mode 100644
index 000000000000..9edb5e5992b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sunxi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner RISC-V SoC-based boards
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+  - Samuel Holland <samuel@sholland.org>
+
+description:
+  Allwinner RISC-V SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Dongshan Nezha STU SoM
+        items:
+          - const: 100ask,dongshan-nezha-stu
+          - const: allwinner,sun20i-d1
+
+      - description: D1 Nezha board
+        items:
+          - const: allwinner,d1-nezha
+          - const: allwinner,sun20i-d1
+
+      - description: ClockworkPi R-01 SoM and v3.14 board
+        items:
+          - const: clockwork,r-01-clockworkpi-v3.14
+          - const: allwinner,sun20i-d1
+
+      - description: ClockworkPi R-01 SoM, v3.14 board, and DevTerm expansion
+        items:
+          - const: clockwork,r-01-devterm-v3.14
+          - const: clockwork,r-01-clockworkpi-v3.14
+          - const: allwinner,sun20i-d1
+
+      - description: Lichee RV SoM
+        items:
+          - const: sipeed,lichee-rv
+          - const: allwinner,sun20i-d1
+
+      - description: Carrier boards for the Lichee RV SoM
+        items:
+          - enum:
+              - sipeed,lichee-rv-86-panel-480p
+              - sipeed,lichee-rv-86-panel-720p
+              - sipeed,lichee-rv-dock
+          - const: sipeed,lichee-rv
+          - const: allwinner,sun20i-d1
+
+      - description: MangoPi MQ board
+        items:
+          - const: widora,mangopi-mq
+          - const: allwinner,sun20i-d1s
+
+      - description: MangoPi MQ Pro board
+        items:
+          - const: widora,mangopi-mq-pro
+          - const: allwinner,sun20i-d1
+
+additionalProperties: true
+
+...
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
