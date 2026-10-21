Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E434A60A6F78
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hnBCNNn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxFEhNEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/greKJ9X/79FXRoOPP8l8wh2cKba920H6h99hasQWo=; b=4hnBCNNniP79JL
	a+/jChNZo8utHd95eeoor8JgccOWRRpBu12FLKhMFoaqLyFqzzzvRmq5V1bQWKfojrl0vkEW05vQG
	6bNDE3zUL+yBXdjGqX1Hkumw6d/cxCJAHdXaob55hlZKOgRK+sTx9VlFTrhPMD/E/t4xUTbsDdLzj
	72XuJd+7tWRH0vdpDl5/lWgx0A76aJIMmUwmVPULD+ObuQ2oiXToasIczbTk6dU/1LdUEd+U0w6Qc
	W2HeL+tvRLedL3LhhjSYCgQuZ8bzKmUN1jpn25jJilL3/KU0k8Q5LGwZt2lA5gk7gdR44g3hjYeiL
	MN/eApo4o1QHd30/hkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNP-0000000CmYv-1wnE;
	Wed, 21 Oct 2026 19:53:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNM-0000000CmWw-1ArC
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B6E2A60A8D;
	Wed, 21 Oct 2026 19:53:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612407;
	b=tpHZZtq8klMJW4ex4gOgmJGXUAwd2inX19it5rVsLuP7zm6FPvhJNY6kEkkAH1M2NJlg
	 iUXyQ2HYFFOK/lxI5PFznEHH9uloJJDEWOUCjPfNOMPtXiHT2bHGf+aCgKNWTpizueJyq
	 Oma3RUxztJrczDBQFLrkTI2OlcNxXK9T15FPR5DIDl++WgRBAdi9aVvHM48xssw/rqzzu
	 LSkorwRCBhr+LYRC3c1JeGXtJ96fOEpjxCyx3EWBQKQKuQAY6U2XMMizuqWsoNhsviaHI
	 0YdGSdNK/p6Ad67lW/9Oh55U8Rhu89K5hCECR8JhDO4fSUY58rd71pUdhRiV+/U5G5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612407;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8zdkSy4S9d8mahCstou+MAd3++gCJOCaSRrb4UBEAWU=;
	b=KxGlpzeSrMMJU5Rp6vziFtgm/m3U68ouU59LiizCXoy2oZ7PwPWDECcaCDmHTP1qWuOy
	 4hssL6SoDfNCKage+++FesHYC3KiOtPv0fefsONo16o8fty+9OfA099D6p1GklsBwu6/S
	 X7G7srqnmZqfayqLixWq9Rd2i7rCrpsKhhnp/cP7BH1oup3+MzujlBssxuLukeE8hbdKD
	 3Cil6CQpqYx9TIHcdnGkQxMxRK5Q0g6mfczHb5uBdSqzvS4FSxC8TZE+rCM7Cm3Cq8sku
	 Jxs706Tj57uo3Acqr5Xv+syAEZPvYySggjqKXTjHjv9JGNyAQbTj1J5GbO3K6FXvltg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63E901F000C3;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612407;
	bh=8zdkSy4S9d8mahCstou+MAd3++gCJOCaSRrb4UBEAWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PxFEhNEmIopanfX4B/znryk3y85NsA0oa745b2Nym+GDWwkAyLhuYCidq3Xqc5+l9
	 uXZqcebvqZFFIiEkDcr/KSfLBi0wbDctC9ET/Z8qkwTQZM69SSGaaxN+fI//+s8Vqu
	 vWHVoI3jsAw62UHjWDk8E0+24nKI9rctOQgtmiPQE8d2ogno+MPgn3ZrOd/HuNwn37
	 5TqMp/gMZ8S07+7etMHTedhhF4zXlSgMmHsWNKRtXUdUqOsg5n+66u8/JKwDgxWj+Z
	 dubUQN8WnvEXkKtl00JYmQPA9VTOhm+3guPhs/ckv/dtgjPirXgDI2hACy6bEOnBNr
	 9IOZjszGibY8A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7A424342F;
	Wed, 21 Oct 2026 19:53:25 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:22 +0800
Subject: [PATCH 02/18] riscv: add Zhihe A210 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-2-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=1013;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=4BCg+toIRbmSQPVtgy4Q0XzWNjGrXKkDc5R8if2Rdc4=;
 b=ABWPT2/vC2QfeXMG1/w9VVAjTJqqfTPVM/54tCmkLQLDLnCqT6XiKVKu6QeSqctxfeROaimly
 ON8hQqfPoLCCyeZZG8KvXFMFwq3DHpbth19Te47OI7Ps3hU4AD7JxzN
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the ARCH_ZHIHE option for the Zhihe A210 SoC.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/Kconfig.socs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c4983..b9863ebd88c7 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -91,6 +91,16 @@ config ARCH_ULTRARISC
 	  This enables support for UltraRISC SoC platform hardware,
 	  including boards based on the UR-DP1000.
 
+config ARCH_ZHIHE
+	bool "ZhiHe SoCs"
+	depends on 64BIT && MMU
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  Enable support for the Zhihe A210 SoC.
+	  A210 has four C908 and four C920 RISC-V CPU cores.
+	  Supported boards include the Melon Pi V1 and V2.
+	  Say Y here to build a kernel for these boards.
+
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
 	select POWER_RESET

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
