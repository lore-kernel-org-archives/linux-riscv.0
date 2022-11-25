Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22327C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8qQXodyEjYbg89VZfKANtKwuH73l2JWaxzPaEnWwFg=; b=xHlsT368WOVvN1
	eVnF6M9cp2wJ6/O+5AropqX+fneYJMMIvWCbf5Ck8g1cLVwlOJ4LwXtRTaNuxmyV66Wocz8VnJspg
	Ha9BJfSIDWNeufUb1BHPN9LqS7rSXK9lFhXDk7UZ+RE7Ehufh+WrGM3gYLpOxzwJltMunDkn5yFcL
	sbWIX9IkcRiXm4Viv4mZD7SohAVyBzzVv36+qU1olMqG7Dep5auJTIgciXp5pzOrVhSJ45i70lXqW
	qT8r8wPY4qgzsqGI6cWVvLWs13KhNEeDxGq0MgW+kxZZgSGm/878M6q/B9L/yD5ycJLWr/otas0lw
	2jm22qWjQEYb+gJbwtvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiWE-002ycR-0V; Fri, 25 Nov 2022 23:54:06 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPe-002v0V-9j; Fri, 25 Nov 2022 23:47:19 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A2CDE5C00FF;
	Fri, 25 Nov 2022 18:47:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 25 Nov 2022 18:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420037; x=1669506437; bh=jW
	7hMrs2yRGXm4ZrKeCsDCSPx2KNwLZpuisfRrm55zw=; b=OeuzKKVNueXBL9qRWe
	xkukNPLU1E8j9LIRjH5AitYJgKpXdYIZ/4KJF6Ee59NoB1XLhVJD+IZ8hRjNuG2m
	TWPODTp6GwClWvP8V/BVrBFva9kAOyp1+lJJL5xRGcfbk6c8ga/haW0kU9PVNEB+
	Kx3xrvkF93GKAY3PAN7L52BOPNwcCdJs/OBVp000tcUasdt5LIp2QL9vUiEqi93R
	fYiYhe0O2Wiu4f6nAZ3nE08ia0Lon3OCt0LjwqIrskNL9HNxdyz3f9JWS4D5+QVR
	uSJwDeXxQVtd2whXjxcWLA1AjrLw6r5Y1LNJzEKY103Q8i3lX7yb4j57yNsTP7TR
	/0gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420037; x=1669506437; bh=jW7hMrs2yRGXm
	4ZrKeCsDCSPx2KNwLZpuisfRrm55zw=; b=UU5loxuNG/twZMBBUxC111manfA76
	MGyVRpu7EOUngJRiJePYXZNA0z5lrPHqukJUn94BySc5GKIW0QYJUrPRRo4M6Uyr
	buKnSz2Fjvk1cIGeIwloYTTJ5yixyVGFeW9cbAU7B6pA3Odtk0MD6nUOn7WLwY+N
	URZ2bDUsjjcoqEUUKIq2W6jpb5Er5VzUOa5qpBuATjxr74Nslu+OmFkzgvqLO3Tm
	OEY/JUVvp2pUeSqXv6tCeI518ruk402gC3oHf2/CSIpep1RahrWlDqrw4vGbPk0T
	imQjo2/bjXD312MSRMy54/L+LmXu8Hb+r2q2dTUv7jGgZTJrINA/EqeiQ==
X-ME-Sender: <xms:BVSBY8oniJrbjUlpcGGJBsUo8xJZhy7nj5hYzK6Wm0yuO--KCSg5Ng>
    <xme:BVSBYyqJ5kH4kaB6OO1uYV0u8aVaIcN_59Ydc9c1AoO-LV8fuhqH9xynIgRI8T-Aj
    LCu5p-3KGMoL3z4TQ>
X-ME-Received: <xmr:BVSBYxN7fASOmEDti3aGwY95LuZXLmePt0_OlMn9FVH2fVQ5v6SV87OLR-8nkZaZVc9WNL_82y1DaJSW3X3gzwJoORi8EpRhz_3Xjsc8lgjdPZKLk_1w9214iUSmOVQLsBelmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:BVSBYz7l-vNlG8FPvZN9W0ImRwnB_ciCE3rczOs0l3RsEuiDDm3-Cg>
    <xmx:BVSBY74TNaEc-kw2TmA-b1vZoKZwOJFzI0OcCwfMBHRvgyL7-jsXCQ>
    <xmx:BVSBYzi4ZMsmU8Pxh8QwstW8F63Nb4Hi7KauWwqB0MaXXSzUPacc0g>
    <xmx:BVSBYyJWiVwGJNTMpmR_-ZEV_9RjiJp2gk25ly3LFqU_TbCdmP8Snw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:16 -0500 (EST)
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
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [PATCH v2 11/12] riscv: Add the Allwinner SoC family Kconfig option
Date: Fri, 25 Nov 2022 17:46:55 -0600
Message-Id: <20221125234656.47306-12-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_154718_445921_D139644A 
X-CRM114-Status: GOOD (  11.66  )
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

Allwinner manufactures the sunxi family of application processors. This
includes the "sun8i" series of ARMv7 SoCs, the "sun50i" series of ARMv8
SoCs, and now the "sun20i" series of 64-bit RISC-V SoCs.

The first SoC in the sun20i series is D1, containing a single T-HEAD
C906 core. D1s is a low-pin-count variant of D1 with co-packaged DRAM.

Most peripherals are shared across the entire chip family. In fact, the
ARMv7 T113 SoC is pin-compatible and almost entirely register-compatible
with the D1s.

This means many existing device drivers can be reused. To facilitate
this reuse, name the symbol ARCH_SUNXI, since that is what the existing
drivers have as their dependency.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing

 arch/riscv/Kconfig.socs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..4c1dc2ca11f9 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,15 @@ config SOC_STARFIVE
 	help
 	  This enables support for StarFive SoC platform hardware.
 
+config ARCH_SUNXI
+	bool "Allwinner sun20i SoCs"
+	select ERRATA_THEAD if MMU && !XIP_KERNEL
+	select SIFIVE_PLIC
+	select SUN4I_TIMER
+	help
+	  This enables support for Allwinner sun20i platform hardware,
+	  including boards based on the D1 and D1s SoCs.
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
