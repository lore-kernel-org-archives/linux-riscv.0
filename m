Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D22C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAAu5QLl8iUF2wnpjtvcPrykSwBMtDw3TEO135D65ik=; b=0/rqoVnfSsbAXw
	PpU7Mk2BSHbNElPR6ISXSmuvSQP61rbIdmG2kTTzLGKJ+FlYH7PXTndaouT1yohdhZjG+4N12Oi2l
	P0UCESIfsaafbG7qT86msdyV2nMTq9jccgjqdnNWLLY5w+Ke+V4eXzIPowgKz81sn2eutPqdtsp84
	pGJuRF1wdCcSr7QmsTbe1zqj8wCRkPUpJbxFSLnnUPI6LZ7j2nsyc1kA2x6CWEBhFmMnvSVZ9vmsj
	rYw8UKW4FRPRqibBxI7T1v4row+lOqtiFhAFOfCIAhNsnECG6ddHMonjt1pKvbUBjPGjzhZFuhinn
	Fc+efXqBYF7yC603KKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujo-00000000Jkh-0Jws;
	Tue, 28 May 2024 11:11:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujl-00000000Jjs-0fZi
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8795C61F65;
	Tue, 28 May 2024 11:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA199C4AF09;
	Tue, 28 May 2024 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716894684;
	bh=9SkVgN+jJ6U+RjhYCvIvSgMdPw5jUa8FI2daBnZwTiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OKIjhoZ2IEJjGJxbUfJcpt9fewysuOCcrQJ+n8VEJlk5hsJTWpSo3tMlclPD1tacs
	 Wwm4BAqqorTHWVj1+/bwSVjEUyoQEkBJumvVrifMmb1uf4plkvcL57ot77QsMNm2gA
	 zVwBKLQ6JZllqoOlJ4UTXl+oyCayT8HyX3+OkBwd9pygHDeJnmKnxT/2MjP5Eninpb
	 a6JXrjPYco/2Nodf9KWYUSFktt6+sqe/M77zhv9LcnRBCDqPPE8drqbUu5VHkMcuuZ
	 6TCgrlYe2QsnexhFGGUjDL2Bn3AfsgpJhJZQ+0YM95Z5IHv9EdPER40CAN3IUbI5gt
	 eqKSMhCKKS0qg==
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
Subject: [PATCH v3 1/2] RISC-V: clarify what some RISCV_ISA* config options do
Date: Tue, 28 May 2024 12:11:11 +0100
Message-ID: <20240528-varnish-status-9c22973093a0@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528-applaud-violin-facef8d9d846@spud>
References: <20240528-applaud-violin-facef8d9d846@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4825; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=cq+OXku3YrAv2y5jg9wxl7/QpkLZ9wy6Yyc6KRcZ7Ik=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmhuy/MtprhkrMo5X5OaZ2T3DIxX+U3X2bPUVUW+nSSz eXevo+9HSUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIviTDFw6fmKu9bulBsjcd 5XP2VJzOdFha+M3rtk6Oxvk30y4xMjI8Kn3DuaVsncRu28fduhtlxX6sDci/PaPhmta1Ty9jkh3 YAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_041125_316294_AEC697D0 
X-CRM114-Status: GOOD (  18.88  )
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
index b94176e25be1..3b702e6cc051 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -501,7 +501,8 @@ config RISCV_ISA_C
 	help
 	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
 	  when building Linux, which results in compressed instructions in the
-	  Linux binary.
+	  Linux binary. This option produces a kernel that will not run on
+	  systems that do not support compressed instructions.
 
 	  If you don't know what to do here, say Y.
 
@@ -511,8 +512,8 @@ config RISCV_ISA_SVNAPOT
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
-	  time and enable its usage.
+	  Add support for the Svnapot ISA-extension in the kernel when it
+	  is detected at boot.
 
 	  The Svnapot extension is used to mark contiguous PTEs as a range
 	  of contiguous virtual-to-physical translations for a naturally
@@ -530,9 +531,8 @@ config RISCV_ISA_SVPBMT
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
@@ -551,14 +551,15 @@ config TOOLCHAIN_HAS_V
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
 
@@ -616,8 +617,8 @@ config RISCV_ISA_ZBB
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
-	   Adds support to dynamically detect the presence of the ZBB
-	   extension (basic bit manipulation) and enable its usage.
+	   Add support for enabling optimisations in the kernel when the
+	   Zbb extension is detected at boot.
 
 	   The Zbb extension provides instructions to accelerate a number
 	   of bit-specific operations (count bit population, sign extending,
@@ -633,9 +634,9 @@ config RISCV_ISA_ZICBOM
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
@@ -648,7 +649,7 @@ config RISCV_ISA_ZICBOZ
 	default y
 	help
 	   Enable the use of the Zicboz extension (cbo.zero instruction)
-	   when available.
+	   in the kernel when it is detected at boot.
 
 	   The Zicboz extension is used for faster zeroing of memory.
 
@@ -693,8 +694,9 @@ config FPU
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
