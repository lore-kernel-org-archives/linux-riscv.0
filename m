Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DDFC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXpLhFf520nYEIf98I18ulfnF8uUb7Ckhw26Uxb8P7c=; b=1IqVypfUxBYhZa
	sTAZsKpzUhvpqHGtx3qtgpoP81SGu4pj/mkSBfCxvQGanDMXPkYatAIWkR1Qa+GeUEFjb5NIgSqAV
	uMjNcU+td4cGFEIM8NnGl3KtMTvw3pYUSe/UJIe7NSoEJ5pu6f4FTN44TVPWPn/CP+/HtndJb2JTg
	FiRum3knOeSvLyr00lhPe5BI9R/4UQeIvQPMfp/0HBbRH0Cs+IPbOe8gwlVZ3Hhc8b+a1czzTQ0Ap
	ArN1qDFaC6kikck410qMOeFPsu1uJz+kLzqNhe2OkUwS296K/vEJN0wmMF85OpLLRUCjBoCII7EZi
	ufjyu9Ts603bBXYbNb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYUB-002euz-5f; Fri, 24 Feb 2023 13:51:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYU8-002eu9-Ss
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677246700; x=1708782700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZukmKbhuckdgYPxcrfE3bKQ6TkEUIZBG4kNxEuFJMEs=;
  b=JWEcG1wIFwMD2pcYYmfCHBm2V8wkynfpAzbPhAvsOazBfye/FQ7k8P6D
   F2zcdP09xY+STZLaqmOmb6KtGfhsbj95Ypey8NW1+hb/mndxm8Ecdrqsv
   XcpA6A8b3SpOOODkdbsNTrMdv/lajCGAhaPSnL493tyBK4Us4BrbKaYJA
   D9OFWeZnkjrYLT3l7OARtl1N4q69Dp1+u3BD9Exni0fZzaseUsfU1jixi
   1SF0RftTp7qmZSEWBqIhlD8GsG/47AAoltuuHBzODrsboh7m8jJoTiyGe
   KWBFIQydIb43p8QgrvxUFjIjP2z9vJQct0r4iKMTLGCV6iGOro3XW58K6
   A==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="138923444"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:51:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:51:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:51:30 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <conor@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Wedson
 Almeida Filho" <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with rust support
Date: Fri, 24 Feb 2023 13:50:44 +0000
Message-ID: <20230224135044.2882109-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224135044.2882109-1-conor.dooley@microchip.com>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2374; i=conor.dooley@microchip.com; h=from:subject; bh=HpaH7oMTktYgKSCgvr9/FNMbXJinNGLWnda4ScFUHPo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/Dmwo8fSS+rnrslhV3QIxvewyGfVJjuHBOg8sXjq7yN4O SKzsKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETSHzEyNLGy7y/49uWRcuOr+Z2vC6 4smbJ76bE1dctbZCoUmMunr2X4X/Ar9bmz27Vrej8EeOez+1t/dfoyxTXEdtfO1T5qXzbdZgQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_055141_028550_93992EA9 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Miguel Ojeda <ojeda@kernel.org>

The rust modules work on 64-bit RISC-V, with no twiddling required.
Select HAS_RUST and provide the required flags to kbuild so that the
modules can be used.
32-bit is broken in core rust code, so support is limited to 64-bit
only: ld.lld: error: undefined symbol: __udivdi3

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/rust/arch-support.rst | 2 ++
 arch/riscv/Kconfig                  | 1 +
 arch/riscv/Makefile                 | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6982b63775da..197919158596 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 ============  ================  ==============================================
 Architecture  Level of support  Constraints
 ============  ================  ==============================================
+``riscv``     Maintained        ``rv64`` only.
+============  ================  ==============================================
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 81eb031887d2..73174157212d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -115,6 +115,7 @@ config RISCV
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
+	select HAVE_RUST if 64BIT
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 76989561566b..0d6fc4e25221 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -29,8 +29,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
-
 	KBUILD_LDFLAGS += -melf64lriscv
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
 else
 	BITS := 32
 	UTS_MACHINE := riscv32
@@ -38,6 +38,7 @@ else
 	KBUILD_CFLAGS += -mabi=ilp32
 	KBUILD_AFLAGS += -mabi=ilp32
 	KBUILD_LDFLAGS += -melf32lriscv
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv32
 endif
 
 ifeq ($(CONFIG_LD_IS_LLD),y)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
