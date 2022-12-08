Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84396C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQ13RR856aZaGpwFvZ+VhHBzmH6zsZ6Odz1zw5QZ3wY=; b=tX98cgpUaD5Fro
	62BIWmjJ4bwEv8cxlTfm4hZSxSZuwhu/oENfeGp3TylaD47J5apt6MWNvNt9o81iZqYqrqV6nY9Fp
	HPQE1EYfQ0LjoVJ3Tyle0W+Q3Fsb5VnpoDTZprEirMM+G0VvidS7ZMw9cI+b+K8x4iTycVaYDVSB+
	Ox3KfsdoAC3pVPbzP0HtlHi91x/P1WEyLfyrjNrsz2xI38b1SOZdj6jeCRISMSr4v9DJb3DWbaPOL
	jC4V/3qAgoMIAUSD4MeACJvlzgk7chGPNCL3znX8JYpniXDhqZtx7tiLaR4sItYmW2HCj8HwNjFIA
	PlfG5WMlCZT0A7P5FYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3D3R-00AlUZ-Kw; Thu, 08 Dec 2022 09:18:57 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CoK-00AXzu-Q7; Thu, 08 Dec 2022 09:03:22 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 91D793200201;
	Thu,  8 Dec 2022 04:03:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Dec 2022 04:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490198; x=1670576598; bh=7n
	dj8RGGBT/QK9BEfd3mzkS31gYDZfSUsJkFbK+ScLc=; b=Jz0X0ajG+HQSVTAHS2
	nRLwHBG+GyfaMjXV1W3M17DsnHoYoORv9XsqvPLO1qO3r0kC5YtovZ8otsgmP4cl
	++fHFDwmSL+alGmk0fH0PDl4uAMuikCXG5UklQRHwt6+ZpK26vE8SgKNy64bAbO+
	wqka5oXEG7NZq+aN+4lMF0W15qo36UUFXaH8tfNk+M+oOCkjQIJxZ+0mDxR56wnr
	y5kix9vjIjmwE/rlaK8tdNi5QR/UiSJUK6SY3y1TPSjAAwRThk6GIzoQVdycoTuu
	OFsEvQFK6Nf5HB+eP/3ik3wq1hayFv2A3qaEbl/wAthtSzH4NDdpVxWUdzpjWjD+
	oHtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490198; x=1670576598; bh=7ndj8RGGBT/QK
	9BEfd3mzkS31gYDZfSUsJkFbK+ScLc=; b=U2ExKK28DP0DtshX/1AX5R7aMnRoy
	DX5X+b4shf0I+/HqgvGq45I6Z/N8NVkbj24eny3tovjUJ146vl8NvDQmey+ZJFbJ
	hCUd4GDphHEYqWNW/NyEzPazlguaciGO7/otAZ8fPRK4JNsITn5zS/sfe5MqFrOl
	vahC5ozrK2h0VnRNDz0E0JmgGAl7AqfYAxUKsnF6GK0IsLyoQzfqzXrZNOeu9QQ1
	/EPCPEEFRNCCIEyYf4mXlqh7p0BHEZE3AyPP5Asojaxbq+Q6+ym4EmMS08/rLs30
	xHASUuuNrKhAKgYJ09GTNRS9HR69xUIDbt2OR2iJPe7fC88+UljMh4ybg==
X-ME-Sender: <xms:VaiRY5wZY7BtPk361H23Det_8YqlpHnfWNCjrHSyYUNzbg_P-MEkpw>
    <xme:VaiRY5Qr-k4TfbomY_PK_p_XLrKrMBqxsLz2_04XTdejYNyed9yim1EOYn6LURZPZ
    4bbqe-lcye9p8BGkw>
X-ME-Received: <xmr:VaiRYzXee9_wbPG26mTfJRgr9QfcBIL1tBRK3CeWw-Kp2Qg-OvEA32iRADcbJHUWL1jKVkjy1wGzTaauASPv6G1fuYANb8YwPZ8qADxlbubYGk-iIxntXvjUGymKwQtLYlEnaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:VqiRY7imIIW3YI0HgPvUnoWS9IopezA0svD4Na4JBh6Y9oLbCf_fLw>
    <xmx:VqiRY7AQlIIJF_t_vppaX2KJKRec4MypP85DgcVMH46v5le8Y4SI3g>
    <xmx:VqiRY0LXLyN-0WcwpxaiLuuzi_cxIBCOZyq1MCpshgf9bS9ZclzlFQ>
    <xmx:VqiRY9RY-0Gy0R8W9YxlpUCaDp8pMfrujOBfVuQauN3rLrsB1qdK4w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:03:17 -0500 (EST)
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
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 11/12] riscv: Add the Allwinner SoC family Kconfig option
Date: Thu,  8 Dec 2022 03:02:36 -0600
Message-Id: <20221208090237.20572-12-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010320_937109_D1657F09 
X-CRM114-Status: GOOD (  10.91  )
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - ARCH_SUNXI depends on MMU && !XIP_KERNEL

Changes in v2:
 - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing

 arch/riscv/Kconfig.socs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..f655dea86d69 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,16 @@ config SOC_STARFIVE
 	help
 	  This enables support for StarFive SoC platform hardware.
 
+config ARCH_SUNXI
+	bool "Allwinner sun20i SoCs"
+	depends on MMU && !XIP_KERNEL
+	select ERRATA_THEAD
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
