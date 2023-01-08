Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919BBC63797
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKGNx8q7cL9ZvIWZCLm/SYUzZ690IR3gZ0q2x5GpQ8k=; b=dNFQoixDV9oc9N
	27+TAsdx3RipubgdE4Sh+761Qa/6mmAD6lzApxT5RFXp42PThdkrEEHEuh/2KxCqk4B2caf5TQnvU
	sd38S0cdSTafqySkMZwcgi4+mwabYWbrCtWKKyoC+Zi72j6O8vBEAtUALPxPq5VftPeD9D0OrKDmH
	O0ky+3izxsmNoiy6FhuxJZsnhZZYNNAXMIcP4tQZhtefHDayiWVuL0xk7/b+LV4kTWHQvnDeysa3C
	oG6+6qF6Tgp86VaTcoybZfVkk7G8d9udnz8DCKctnjq3Z4Zdt+bNZU+NID16KaoNvtpkUz7YE8oTQ
	akHz3vgt1a3eyIcOk37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYd3-00EMZi-Mx; Sun, 08 Jan 2023 16:34:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEYcz-00EMX0-Lr
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 16:34:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E9D3B80B4F;
	Sun,  8 Jan 2023 16:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6637C433F1;
	Sun,  8 Jan 2023 16:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673195671;
	bh=/waf9UjWx+ALUN0kbtig3a8OqNW49/7BA50sh5A7xBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/79xZ5qidfFnxWgpefnBriUT8Fvm9XBL6194AonqkavHeLF8KIP8BYJxigvrxpTq
	 d6CzsdEu04wmkaqD9D5Iz/P/68sfEinwW6v/o8todxB+ggEf28rfI/VwbcxiRfxTe0
	 vq/uAQ3p+QjCe1YxWcBN6isA1a+HKmcIQMt+X9CCrQPQ8oLZf9KT35CalvLYjTvrLY
	 FjbHV2aeyiTEEdFJfgFmBVGd9zLHqjAnCGaub9AL0LU5WuLW2vYZX1T23ylNzC78vl
	 ygvzsTPDgLbs8DdYMm1cD0IFxbjLPLGqqVlDvNUs+gZKfu2Ws92a5qssun3AglSPxV
	 ghvHtvtIig/HA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 3/3] RISC-V: remove toolchain version checks for Zicbom
Date: Sun,  8 Jan 2023 16:33:56 +0000
Message-Id: <20230108163356.3063839-4-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108163356.3063839-1-conor@kernel.org>
References: <20230108163356.3063839-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_083433_996956_A68A0F84 
X-CRM114-Status: GOOD (  11.81  )
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

Commit b8c86872d1dc ("riscv: fix detection of toolchain Zicbom
support") fixed building on systems where Zicbom was supported by the
compiler/assembler but not by the linker in an easily backportable
manner.
Now that the we have insn-defs for the 3 instructions, toolchain support
is no longer required for Zicbom.
Stop emitting "_zicbom" in -march when Zicbom is enabled & drop the
version checks entirely.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig  | 8 --------
 arch/riscv/Makefile | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..33bbdc33cef8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -416,16 +416,8 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
-config TOOLCHAIN_HAS_ZICBOM
-	bool
-	default y
-	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zicbom)
-	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zicbom)
-	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23800
-
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
-	depends on TOOLCHAIN_HAS_ZICBOM
 	depends on !XIP_KERNEL && MMU
 	select RISCV_DMA_NONCOHERENT
 	select RISCV_ALTERNATIVE
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 12d91b0a73d8..f9ba78ddb5c6 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -58,9 +58,6 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
 riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 
-# Check if the toolchain supports Zicbom extension
-riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZICBOM) := $(riscv-march-y)_zicbom
-
 # Check if the toolchain supports Zihintpause extension
 riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
 
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
