Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC193C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZdPd2IlHRwRFrX4CG62ZWuHsk7eDRM5pEVyxbP6gjo=; b=tNkI+QH4K2KMDN
	hZ/+VqSeb48+tRRNNhdNM4qVpkMXGELPPwExnAodGOlgRnDSgd6pined+BEoYis6ofXYHvQZP046t
	37+elBIkWz5PYKfzAUyKiQpTrLKDHqSZqKrA7wrC0J2PC1rmRAdKxAkYCjECuAy1stgNHjjgXPUoU
	thoXM0YB/VkoWrJ7WCVoi9TrMQbSxso6oif+oGGugTfYudqq9GcJbvBamAcPI/DWY3PxNSOB6EBpC
	V12DSvDYMvg5/ZApswAgH7KugWW8i2rJCDkrzmgnTUOvp4fGOFvdBP8BYJYEQCWEcJf1tXeKqOYbv
	PAzeMfyPdDpyGyGkC8/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Crz-00Ac4B-U7; Thu, 08 Dec 2022 09:07:07 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cns-00AXdS-Vj; Thu, 08 Dec 2022 09:02:54 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id B1EB13200201;
	Thu,  8 Dec 2022 04:02:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Dec 2022 04:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490170; x=1670576570; bh=+D
	3H6ZZlXvxWkF84FpeHXaqAt9NC1A4IUpFvvi4MHzA=; b=O/lPBWPlCRCVSHqvLI
	WE9EZQRBBmdd/M426G6gnYJTsID6IR1tBCT1Zdg10iPLceeG7W6rqqB07P3123VD
	23Z5+ruywsxALjL7MeKNuMiQJSxrG8NXFiT+iG/diZ23qWlDc2y24cl5XH1agaR5
	hKSbq40vMymYE0l0XoMZSyW7l3+xwrNGyLqQq7Cn7GsILCkpGJVZTLyRncLPKfj+
	b0j5+Z3p0wv5MAnvXbS9B32UDv3D1BvbkXiveYZ5zK8WOITYZuzMvjH1MB7gJWbi
	ewZ84q/6ubY7KfCB2MR+XXMHHF9seB6ajs2xJjnuJuiaqXsNNmKG916OF56aMaRg
	tsmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490170; x=1670576570; bh=+D3H6ZZlXvxWk
	F84FpeHXaqAt9NC1A4IUpFvvi4MHzA=; b=qkMeVt1iZNFgCcHFkysPxL9s1kV6J
	PdBwKZYYS9yhlAq0fjS8Nmi89KVL9V1HGX6OjaRG92iwDtNRtm9bZ/vjMcAXADHT
	/GV3wylsKMX/UHtfoqocsjofCFgiUhCsq7c2hUeN9siIVGbQrJ01rIOzTewV7r70
	Dyi81R6tUtiZwQx6aHS03YLd7BBz0qZhhLglgCZoAd9MtSdOnh3RPtxQPOfya752
	o79SH6Hbh2mKiW044Nt2e1TT/eYRwRqMhOEayTeyflp3ptYrpAA57cSxvIzo1Mh9
	8WcemfQanQQn1bZbF9PBe2XXeN+YGp6om9vBMzzwT4IHPp4Owei+ggBsA==
X-ME-Sender: <xms:OaiRY99RIbWD_g4ujfSl3as_uExYvrZFMTKXZj4Vm4I4sVln4g9dhQ>
    <xme:OaiRYxtSSDLa2OzZI2A5ZX-_OoUIHZ_sbpibCzlnZ6n_dzB-Wg9o9FG441Hz4R3fd
    TcXLxutgi6AwHRXeQ>
X-ME-Received: <xmr:OaiRY7CP03T2lfEjOt9pj-mx9Vp_kK8hCao6T23zMww8fIXDmciXs6Zz5A3SxGI-fUeIFpOkYk0sL__YX1iPrIVbABtXglKGRz1FqEKKUKxz27eOVezVakUJvQbezuqKBoqoNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
    ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
    htvghrnhepgffhvefhgfehjeehgfekheeuffegheffjeegheeuudeufeffhffhueeihfeu
    fffhnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:OaiRYxe6TyznHTf78d60vzRT6c58SznULoQYAGiIpBoJpupctn-w0A>
    <xmx:OaiRYyOqmjrFatkyveSu3ERPiiJgcoJcHtbAMXZZT-4c90h6qBBfjw>
    <xmx:OaiRYzl_4JsnVHU7xO09eVbgdMUdTwth8SOdAp3LcB0sI4MNzX_3kg>
    <xmx:OqiRY9HRKtPFaG9g-VTTsNsW9Z5D_VXnOifDG0oat1C07l1WB9v_Yw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:02:48 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kerenl.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v3 03/12] dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
Date: Thu,  8 Dec 2022 03:02:28 -0600
Message-Id: <20221208090237.20572-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010253_087290_12207BA6 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Guo Ren <guoren@kerenl.org>
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
