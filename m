Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E54EC7EE31
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 00:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGRtFaOkSauCyfLgoZ0ReXWGpsl4GkhkAjQrd+Jw2DE=; b=z1uqmG5rcclcgL
	HI/RoR7EmfEDmaZtciWwCK/939ib0/N1qvxF2/ozFipbcg7BKbXH+oLAtGIXv4KFn3ct030oLuNG3
	G2WU/0EUk/1nyOHGpJ51Yb40uGpznWD7D1js6TUAZPcwRuga4RIhMfIE3uTBqcYr5xh+VfxnKOx1P
	5qJ0+YXp29inKU2igLTrHBVarIvppqGYbgsCUo+ix0S06JFFhhfZkUfc82CWE26sFs+ELYDTbrxdt
	YPe00xUJIugmzIyYzafLhI38TEcEBoK08j3TKv6MNQvCvck94gTLIl8PLH39cbbjjNbVXoPprfzT1
	1uyOPyQQ9t7DLVwz+Wyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVX-00Bbuk-Ir; Tue, 28 Feb 2023 00:06:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWnVT-00BbrH-7r
	for linux-riscv@bombadil.infradead.org; Tue, 28 Feb 2023 00:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4XfOZzBTLrkXeLb1AoL9xwnvJuPxBkjdTHeJkZ5ScYI=; b=T1BA3b5ES0cMZVeDkY1m+chGlk
	h8dUwO0jgxPmOUXT5uRdhePDRgQpIoFg6Zr+i/01M1WGNWypLHyXd4YKHBoDMmSuH/ckbjnn4AhBX
	8sGevg3nP1iJIXxLT3JrJTCZtY134xhZ4/V83S/6wGG9a2V7x5Q/XRzWwIcwkzDYDMqO2jwkBX/eL
	t5wW9kkUSoF9r/z2Skz6e7Ty6asHJ7iXgQXAiIEOdCFB275JMpZnGDMeiHd4Bn+XQ/p0BaMJs57Hm
	65NHTvNwunw5FN7Wn835VLFd/10+Y+Aiq5DxzNVwmrMOViVRRyLygb7uMeEbLhi8j8d6hwES1Qi75
	gx/FxJnw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pWnVL-00ENgP-1j
	for linux-riscv@lists.infradead.org;
	Tue, 28 Feb 2023 00:06:08 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pWnV8-000552-Ax; Tue, 28 Feb 2023 01:05:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@rivosinc.com
Cc: greentime.hu@sifive.com,
	conor@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH RFC v2 03/16] RISC-V: add Zbc extension detection
Date: Tue, 28 Feb 2023 01:05:31 +0100
Message-Id: <20230228000544.2234136-4-heiko@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230228000544.2234136-1-heiko@sntech.de>
References: <20230228000544.2234136-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_000603_966489_295DF3DD 
X-CRM114-Status: GOOD (  11.54  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Add handling for Zbc extension.

Zbc provides instruction for carry-less multiplication.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/Kconfig             | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h |  1 +
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  1 +
 4 files changed, 25 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 179e52c7e531..471f0f42855d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -450,6 +450,28 @@ config RISCV_ISA_ZBB
 
 	   If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_ZBC
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
+	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
+	depends on AS_IS_GNU
+
+config RISCV_ISA_ZBC
+	bool "Zbc extension support for bit manipulation instructions"
+	depends on TOOLCHAIN_HAS_ZBC
+	depends on !XIP_KERNEL && MMU
+	default y
+	help
+	   Adds support to dynamically detect the presence of the ZBC
+	   extension (carry-less multiplication) and enable its usage.
+
+	   The Zbc extension provides instructions clmul, clmulh and clmulr
+	   to accelerate carry-less multiplications.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZICBOM
 	bool
 	default y
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index c8c69b49f0ad..8673c2146d20 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -60,6 +60,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBC,
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_ID_MAX
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 8400f0cc9704..5d47a0c75c69 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -188,6 +188,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index af201b2b8933..696b39de7e09 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -234,6 +234,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 			}
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
