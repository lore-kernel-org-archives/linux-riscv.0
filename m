Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3020C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+6YNRe16AiLTW2WoiW7v7eMONz+R+0yQInL8za7s9g=; b=rkG0RQsDRI9XPq
	+kWUua3HkmSFRH9qbtASxv8ery27w3xcU1cnpqYRVFuTVhHYLS8lvSX8VZ5QxUxntsYIKsxDhaBrq
	FP6N9mHUtuCMGcCVg7leuhKTszV55Li8RUrtNKnJEGNTeQaeYl/KMK369P25+a6f3JqVpUOVAn72+
	vhVQ8AYbufoV9740cKd+gymr2sYtcq0YQyffXhtw7BgqczEmAQ4sPx06iV6W4W7Fjr+tZY/siuo38
	aB8q0vL6bYcmFicnea5lmXWmkEuEzKJo2Sj9mRlLwsRcfOy5azYoI3YLpmmr7HEo5jCm0wgAHMVBy
	xZ8GcMyUuplR77hsniQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYGQ-002dDt-O2; Fri, 24 Feb 2023 13:37:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYGM-002dCN-Nj
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 13:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677245847; x=1708781847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zxyy6A23kw6IrlgYDJt5MU6IfP1fNW8NpMWRI27Z4YI=;
  b=oJkcZNwn/+bbLmyvtemdU7PFKXY9YpAB+eee40idvXUIAQ/DwuyYFsj4
   sxJXmjlvg1R9JEJUhVI0c7h6EFEUwcu24Gc9LFZ7tTk1d/Uro0XLBMIJl
   84jhg1HheLQ0xjb+LmVxYUjqdjgTiYk1XnRDd8uhW2LHveYyda4N2CY1+
   ricrHoOogKse7/33XPL7VbntjIhZ5U3Bk+sv90oZi7iumSMWTb53Q6QiC
   UZDp3lA6F04BG7YIAo597FmH1Bd+pC4g7DCuryzKD7ONxO+K6bSAwo4Zh
   7Xdq06wTtFQt4t/gQs443KR7QpADBgmd9eN5P0pH31L5jslEA72g4t0/Z
   g==;
X-IronPort-AV: E=Sophos;i="5.97,324,1669100400"; 
   d="scan'208";a="202424687"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Feb 2023 06:37:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 06:37:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 24 Feb 2023 06:37:21 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Miguel Ojeda <ojeda@kernel.org>, <conor@kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [RFC 2/2] RISC-V: enable building the 64-bit kernels with rust support
Date: Fri, 24 Feb 2023 13:36:10 +0000
Message-ID: <20230224133609.2877396-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230224133609.2877396-1-conor.dooley@microchip.com>
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=conor.dooley@microchip.com; h=from:subject; bh=aaMnOWRcKygLDf2dZAPyBV3QPo/ZEMMt7m1TdDcBtFs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMk/9rrOEpLPe6KkszyUS712Y8XHqcdrI9QORtuon8s+m3Jh 7YGojlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkTRXD/7yPq97J5pfbKerH1jh1+V i6xhtKld6+1VVvzcb+S0LzJMM/Kym747N9EktYPpQwF3paq2xacz/9fIWHjZYGu56fwxR+AA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_053726_871637_D47A663E 
X-CRM114-Status: UNSURE (   7.71  )
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
index 76989561566b..f8b3f58f2e40 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -29,7 +29,7 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 
 	KBUILD_CFLAGS += -mabi=lp64
 	KBUILD_AFLAGS += -mabi=lp64
-
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
 	KBUILD_LDFLAGS += -melf64lriscv
 else
 	BITS := 32
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
