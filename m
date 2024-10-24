Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC83CFA478
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQrM0Qz3t2Fxn8iV5v5hVUJn0EmAFuS9amsGtPiJNoo=; b=CJma8FYk3b2Dv5
	4OOpWwVVbD+C2/IqNFVhmVglXXAttrwmRQwaCrJFBSupplKupuwQevL2AKi6QwWbFWpryyGv3+QrA
	fDhoPwww5dPTfpwINDavWWuGKyYqxRZD2dC9/mQ3MqxLlUd7D7JEn5Q8t8V2/wRyUmlWZVzcJZ3yN
	h5xQGhTzSuMmTILt54OG66/RimphiCIR4DdBzGKdFpthP69qkNU2437vgnsNPNm9m9wAzMuDP4qSq
	r40fBWORDGF3tOV0Rk8AYSY3fK2AcqetfqQvD+bcpmeEM6Dwa/sCdt7CpPXFwBmeXOktSKSMaEOMZ
	uBLIZl27QxGFd71vQ8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uxU-000000002sA-1sQ1;
	Thu, 24 Oct 2024 10:20:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uwl-000000002fK-05DT
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 10:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7C86A4532E;
	Thu, 24 Oct 2024 10:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB15C4CEE6;
	Thu, 24 Oct 2024 10:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729765201;
	bh=t6qXY29CzwvkAmigVfocrRJlQh3OdqhWqzaw1QZS3PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mglViwfR08zIxTBNHSBGANTzSzSLOklLiFt+ib2SyPLimzW/akAflTjOMstZ24hX7
	 xqAgDMPdXQcmGDl8jraoSE1vt7Q12TQauI7H5HHCfZhil0T338Vd0OLOVspku+cdi3
	 mEcJWCtNYg1JAuojw3SDJSezseLtcwzUxZ0/3vzZkEwhYwSyXVLbw7ko4EQdRIFrBV
	 Q3sHtRLkYFnhfNbzQxYy0bZbyoosEJuod0NsgGYz3PLEYE3ieIK04up/wUcskcXmGD
	 g3yVMcAUOWYF3zrMfpNSUeSB1hOM0rzKkLF2zHIt+e5ZZuk1bdT7V68syqMZPehhxI
	 ZNCozRMwswWuw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>,
	pulehui@huawei.com,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH v4 1/2] RISC-V: clarify what some RISCV_ISA* config options do
Date: Thu, 24 Oct 2024 11:19:40 +0100
Message-ID: <20241024-overdue-slogan-0b0f69d3da91@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-aspire-rectify-9982da6943e5@spud>
References: <20241024-aspire-rectify-9982da6943e5@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4816; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3yJLValW/VoFMfVO6YI87JTMWn+8zsqnfBmwuqlkS34=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlS8vaz7gQ+u150x9Rz57YzdVwPp65L8It0ba9scrcr7 7EN+z+vo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOZe4vhr0Rsw8+MR4qlS38k hHzYtmnnhvAfxQWn38yR3NzP2Kjt9p6RYeOh/985Xu+60p+XsHRGh6D2dOmSR7e71ljYcIgvnbp /FS8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_032003_223277_CE67007A 
X-CRM114-Status: GOOD (  18.25  )
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

During some discussion on IRC yesterday and on Pu's bpf patch [1]
I noticed that these RISCV_ISA* Kconfig options are not really clear
about their implications. Many of these options have no impact on what
userspace is allowed to do, for example an application can use Zbb
regardless of whether or not the kernel does. Change the help text to
try and clarify whether or not an option affects just the kernel, or
also userspace. None of these options actually control whether or not an
extension is detected dynamically as that's done regardless of Kconfig
options, so drop any text that implies the option is required for
dynamic detection, rewording them as "do x when y is detected".

Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf43..278a38c94c5a6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -527,7 +527,8 @@ config RISCV_ISA_C
 	help
 	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
 	  when building Linux, which results in compressed instructions in the
-	  Linux binary.
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support compressed instructions.
 
 	  If you don't know what to do here, say Y.
 
@@ -537,8 +538,8 @@ config RISCV_ISA_SVNAPOT
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
-	  time and enable its usage.
+	  Enable support for the Svnapot ISA-extension when it is detected
+	  at boot.
 
 	  The Svnapot extension is used to mark contiguous PTEs as a range
 	  of contiguous virtual-to-physical translations for a naturally
@@ -556,9 +557,8 @@ config RISCV_ISA_SVPBMT
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the Svpbmt
-	   ISA-extension (Supervisor-mode: page-based memory types) and
-	   enable its usage.
+	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
+	   page-based memory types) in the kernel when it is detected at boot.
 
 	   The memory type for a page contains a combination of attributes
 	   that indicate the cacheability, idempotency, and ordering
@@ -577,14 +577,15 @@ config TOOLCHAIN_HAS_V
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_V
-	bool "VECTOR extension support"
+	bool "Vector extension support"
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
 	select DYNAMIC_SIGFRAME
 	default y
 	help
-	  Say N here if you want to disable all vector related procedure
-	  in the kernel.
+	  Add support for the Vector extension when it is detected at boot.
+	  When this option is disabled, neither the kernel nor userspace may
+	  use vector procedures.
 
 	  If you don't know what to do here, say Y.
 
@@ -667,8 +668,8 @@ config RISCV_ISA_ZBB
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the ZBB
-	   extension (basic bit manipulation) and enable its usage.
+	   Add support for enabling optimisations in the kernel when the
+	   Zbb extension is detected at boot.
 
 	   The Zbb extension provides instructions to accelerate a number
 	   of bit-specific operations (count bit population, sign extending,
@@ -707,9 +708,9 @@ config RISCV_ISA_ZICBOM
 	select RISCV_DMA_NONCOHERENT
 	select DMA_DIRECT_REMAP
 	help
-	   Adds support to dynamically detect the presence of the ZICBOM
-	   extension (Cache Block Management Operations) and enable its
-	   usage.
+	   Add support for the Zicbom extension (Cache Block Management
+	   Operations) and enable its use in the kernel when it is detected
+	   at boot.
 
 	   The Zicbom extension can be used to handle for example
 	   non-coherent DMA support on devices that need it.
@@ -722,7 +723,7 @@ config RISCV_ISA_ZICBOZ
 	default y
 	help
 	   Enable the use of the Zicboz extension (cbo.zero instruction)
-	   when available.
+	   in the kernel when it is detected at boot.
 
 	   The Zicboz extension is used for faster zeroing of memory.
 
@@ -760,8 +761,9 @@ config FPU
 	bool "FPU support"
 	default y
 	help
-	  Say N here if you want to disable all floating-point related procedure
-	  in the kernel.
+	  Add support for floating point operations when an FPU is detected at
+	  boot. When this option is disabled, neither the kernel nor userspace
+	  may use the floating point unit.
 
 	  If you don't know what to do here, say Y.
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
