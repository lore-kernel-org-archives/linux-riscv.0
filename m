Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A782C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MC6ROmq85b/wmD4Wkp3UIHuJuIxz2TXjQG+UGwLiCpM=; b=3lNQu5oQwGAE/w
	KjArnlLAVKKXQhYWtQDHWhQt1u5qal6fp3RIl71ZhwlO9lv3W8rAXYi1QqAbcquHzT5pjg1Ys4NtC
	A3+bkUipXqwSNqLq5voqywBn3bq1GSE52dscWsSvDdXKUR0x8Rs8MVnyA1puwoRctZanG1Cot8rer
	AH9lCH9AD/T5jCPESLJJCedA4CgR8jiqisRcK5t70+64xNQcBm+/2vqklTxXz/ZS53Zy4dcwaYtcf
	WuiLWHcQ4NGXml/CDwZnD+kef1cHBft9W7AeIfulrvrr1aYQTG3sVPNSHpWp/Z4OugNYi8qI/b+B2
	FpRJZPbB/dIhTQjR5liw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBljv-00BhGg-G4; Sat, 31 Dec 2022 23:58:11 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRU-00BXsY-SR; Sat, 31 Dec 2022 23:39:10 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3C6A95C00BC;
	Sat, 31 Dec 2022 18:39:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 31 Dec 2022 18:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529948; x=1672616348; bh=Mz
	sHJZB9Zb9u/lShX7yOG5pgpyKuKVfap1nW1MWg8Js=; b=i8U/be36lSrUA3U6eq
	mLCtVEXcOY/T/ms8O7WnNiGkz+MUZIU/81hAWT6sELeBYxq3w/Qfr0PNooQZhP3p
	i/B95durYgeyMQ8y7PvTLpL5Vv+4G2R5QPJeBya/ilkPXDwGE5dTMlCqO6pIaj+7
	shg1+gk4f0gerPudzxc7M6sB/6kz33x2UmTU0C+kfBMpE8OEFXbkWeEZCrEuUFbi
	wSU8KP7XZ3mjhOoobbN+ssJHOrzQoJE+D+8iy9yEu4EeD6pRDwEXJXCp4nelxUHN
	AWh36v7iIhO4oDO4Ecx4RrauXabFpY8OA/Kl1/Mi8gckulatd5Fc8xGExfYeR37z
	hLxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529948; x=1672616348; bh=MzsHJZB9Zb9u/
	lShX7yOG5pgpyKuKVfap1nW1MWg8Js=; b=wzCtQBDifQdcAvBlrFLAD/40LJmak
	DltrXi+Ki9KmdkDhUZlusVEO9IeMhb9UNX7MM7hILHQn4jUXv/5NxxKXYiDmqZKi
	33U/CIUyvGSmTqx9+dmo6AGDLF3opMQ426LYsptZKehsuLN61fpykLit9FoQUwjn
	jA56OCRznJZ7ScbIj5VEw8bnAxBeor1zF+oXIArvo0m83WbzSIyK5pguS2FSuOxp
	fq2pomV1fcEJ+ttuClRP04eqVDnlF5Of6cy3BxJn5aE/+tpg9dS9/0KA4t7TJbEa
	ZkKrjQx4vHqNT6aTccBs5D2rgyfmacQMjOqkEPtfMTSwTfqU/aF/c03qg==
X-ME-Sender: <xms:HMiwY3fHgNI6NcJB1UBmh1QpQN8ODbNdiL4IAVc5kA-nCBNEmbh33g>
    <xme:HMiwY9Pzs68iyhuODFGADln5Zmh-l6lGqyuwi4wlX2B-x15xEZkoYzFEM385lR5YM
    q_2DDpB2ixWUqxRdQ>
X-ME-Received: <xmr:HMiwYwi7kjSyoi87zM44NO5OFAKkeeHx9XJ7O0TtI5KdULDJrWRhL6d5qUuQfO3iaKf4R56cicDumMJH-KfYfYnlXe2otP2n1EC_biSPrRWGpBiYe40kQ5LNUPJp6B7-HMUgAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:HMiwY48-xtZMXF97I6X5xAYU5s1MnkFfXDlJBQ5_UrcZV16h5sWfWQ>
    <xmx:HMiwYzvhtHjCT7IJQzYb4JIDHQGav5KI23nvVC4sbktLvOASatE-CQ>
    <xmx:HMiwY3GEqTTAlHf2NnNQFD1wMcJPXPUV-mfvV_P8cHzGtFj3GQ2_KQ>
    <xmx:HMiwY88BUAn2_bbsujHBfzv3yGijQ9vdwMHzu2X-VV5pnYRgmv6dyg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:39:07 -0500 (EST)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 11/12] riscv: Add the Allwinner SoC family Kconfig option
Date: Sat, 31 Dec 2022 17:38:50 -0600
Message-Id: <20221231233851.24923-12-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153909_189216_58086822 
X-CRM114-Status: GOOD (  11.22  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v4:
 - Drop the now-redundant 'select SIFIVE_PLIC'
 - Rebase on v6.2-rc1 + soc2arch-immutable

Changes in v3:
 - ARCH_SUNXI depends on MMU && !XIP_KERNEL

Changes in v2:
 - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing

 arch/riscv/Kconfig.socs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 34a54e5310a1..4b91367604ea 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -32,6 +32,15 @@ config SOC_STARFIVE
 	help
 	  This enables support for StarFive SoC platform hardware.
 
+config ARCH_SUNXI
+	bool "Allwinner sun20i SoCs"
+	depends on MMU && !XIP_KERNEL
+	select ERRATA_THEAD
+	select SUN4I_TIMER
+	help
+	  This enables support for Allwinner sun20i platform hardware,
+	  including boards based on the D1 and D1s SoCs.
+
 config ARCH_VIRT
 	def_bool SOC_VIRT
 	
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
