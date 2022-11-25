Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F9AC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFvWy+LY77FlcR98XmLerRfmpSH9R8s0hKf62hrnGLM=; b=bbSMtiUY7gu8UP
	pSVMEA8DGCkxLlm9GrWlZ7mlJqEuCeF62MVv8oIYihEkztXKEOBJFoEwgSz64yH30AdrUQmgvwu/T
	aWoe1Fhf78S5maVsNjGaByKn3AbY4IcMXtGxeBWunUEflgj3GPUnUzrUUPghv8GdnZQ464BRrkeoD
	Z3srb50G56mn38tc/gz4QOuoYeM0vgVJxotVfPFdUEtXWlYERu30Ise0UcvTe7swrvcdwYnPTEzAj
	QPim/2llZVUc7+zadBLxRa5swLMvYmKtlU/50R0bEAa/w27Srj4YDO+C4hXdD8PEJBBPGisT6xUIR
	Eqr9dBI+2AyTOi2x9Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiQe-002vaQ-U6; Fri, 25 Nov 2022 23:48:21 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPR-002ur0-Ia; Fri, 25 Nov 2022 23:47:07 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id EEFE35C00C8;
	Fri, 25 Nov 2022 18:47:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 25 Nov 2022 18:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420024; x=1669506424; bh=kN
	0WFCG125D5ehSdOWNDPr96iJsAT9nPUC8NxGh4TM8=; b=Pp3irVqVCSRxnfXPH+
	xB9CRTIawHYEgbbHWMbsJZkVX8eEQTN4wk/CxzaVpMJgdXC8cwPGvRKUNItsDbMt
	4CFXIyFoKZe+O9UdKvF1v0rOji8TeElbUI/R5ymasUAkhjNU26R06KiQWLbJ4l/y
	3Ay5y+QWCBiR7XYot+08Mjiit1cyzuu9uqkhJkfaxluKDd20QJgvQQTAwxItsuTV
	PzvELlG/G5dehDNmcfiEs+6hrezxdFtUxiYqoxtFrmbWcKWrC+6ehK8By9zf+lTU
	7e5D6itIJoN2p0eXsRThhV5Dfq+fRDDKijGtrr9KNYP9/12Jo92S/BVYibNMlqIj
	UxPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420024; x=1669506424; bh=kN0WFCG125D5e
	hSdOWNDPr96iJsAT9nPUC8NxGh4TM8=; b=PMpVovnUsahjl0PzQ6hiIwUbbmYCG
	poWN1Um5gg3NDIepxEFfOw3ugZn9GtmbbVldfPV0DnFyMmY/AhZVdRH2mZUNOeqB
	U+u65hUnPp1Rwh7w/WmTdgfYW0jmJ4m6UxccyuOF78IMEL8PCHZLGULJCRfjC0sp
	NV/HKsgJEWyY8TVkphZ1UdEbU9TZp6Hx4b5jU+wUyLZINMG0kaeFdPvcKBijrhiI
	biIvERyuTcnMzQfEMf1dHd4m6tkTofRuSIZy2jh1hqh2C4zuW4YJ2XCrLFItTPEP
	xIWYq6kL+mRa/VhQHc76iM9X8UNWSPGMisTvLFl+q0nKg7HbBBZxJDJSQ==
X-ME-Sender: <xms:-FOBYxTv8vvbeovW1mlaLjlGdvUkKCa7QOrKgzItPuJUJCwhoJZNAQ>
    <xme:-FOBY6zfoY8BhRT_upX8YPdg0BkL6CgeHnUP53rYrNLVSFC7jYwPDuZCd6za1wTfw
    boA9vphAmH6wRM9oQ>
X-ME-Received: <xmr:-FOBY20c0eh-O23QvN4iRHuhD_imTWhwuiiKMqLnj4QXNG5DnYFCdj5YkeFDo1CCRtfU3dLlgOGl-0TLBFEPNxAvijaw00fOJNG9F0gZWHCdME0inpLAM2-w-glVdCxf7fHMQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpefghfevhffgheejhefgkeehueffgeehffejgeehueduueeffffhhfeu
    iefhueffhfenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:-FOBY5B08v_2w2e14ZNipgVdHaS_OelJSM3CDzZWELLzsXpqrP-UNA>
    <xmx:-FOBY6jF-F_atWYglbLp4uCRRsu0k5zRnifoziph_qKMoajSnfa3TA>
    <xmx:-FOBY9q0R8b828YYZMOOBfrRXt9siW0uRwFSyo2EuD-C3IVD14QCmw>
    <xmx:-FOBYxS5Z0Lplo2R-5s4Ve5fwmb4v1bOvxvl-gNbatXkC7tin40f2Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:03 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 03/12] dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
Date: Fri, 25 Nov 2022 17:46:47 -0600
Message-Id: <20221125234656.47306-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_154705_697034_4263034B 
X-CRM114-Status: GOOD (  11.08  )
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

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
