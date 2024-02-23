Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D6CC5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJHlC7yBRPgi0K1i+jk9N0aupOofgjM4p1RR7LMSCZ8=; b=atBN8Fr5Nixua6
	DU2Zr0OXzyHu7ISaIsWoRoZ5CDdihGlpctEWjQiM0k00DscYVmJ53dInJ92H7l8MVIn9frXBOjaul
	YS4+tdzZ9b1M6VBcKapl4Licbxl2HrBW0B6+o+NA+h/+HfNKI3dFJsT6lRW1o8NsbXFm87OnDRlwP
	LlTFZtkxXeIxeeKHaloI51rbk0s8fN0Dk7l8XZYkbdvzFJOHnTcQmsQA38AOkRgYuTh/avUChAhKp
	bOFPuX0x09UokCygpHpLZyu0xg+DzCc/0FCeQRUgZcjcbHf76ECNRQ5P/GFwh5HxqlrgTo60/bso9
	10/g83B/N7jOf6ZcwfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVlP-00000009bBM-2cYU;
	Fri, 23 Feb 2024 13:38:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVlG-00000009b9K-13Ho
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 13:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56F5F634B7;
	Fri, 23 Feb 2024 13:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0BAC43399;
	Fri, 23 Feb 2024 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708695525;
	bh=n7EJGb6r/9uWhXBTxysKjx17Y2iaQNTqlPUbVd030hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YnagCjM0KBRU4knIa5ukmyCLbIBQ79mVq8ZFaUsG4bPoq3W2BaAfbzZvmZXqEfMtQ
	 YYmdDI6hwLjWm88p8iugiOesjBI7iZxep5trLFczsqllK4hpZ/qXJGzNeDR4h2fg+J
	 XfR4Xs48Ge1PZ8kmw6IVM1ETX8+ykApcfKU7+kbEl0YfhUTmIh/6bCoD6J+79yZO55
	 2jPbKdE3fhQQWwIKWFQ8ZJSH78wyHoY0ZMjuiBRZb+ZZ9dEoc78qmnj6RZKr3Vlpot
	 L6eYVy1EjkbMwlLCm3iCTXf2YQDgGfCqRjRbPBj0PCbYI0ErS8EEwSqwMYIiQ5hXi8
	 6QYi5pY8GEQnA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/3] RISC-V: enable building 64-bit kernels with rust support
Date: Fri, 23 Feb 2024 13:38:05 +0000
Message-ID: <20240223-palatable-quintuple-ed221a517407@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223-leverage-walmart-5424542cd8bd@spud>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2571; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dXiTCnXsPq6szb52W4FfTLrkIWRphwTLGk/WpEPIpxA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKk35u+R+n7i+OwT39IUWaQPMGd9WVleuj/N9dhv5lkZX 950bXrd0VHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJeL1nZNg/wWKXZM7OpDYn 8zeiOy94+N68+CslNMT1aGxkUqdO6GWGP1wisa+2BoUt0/q+ds2FPTL/DtavLuPzr4z/Oe/D15q /ZWwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_053846_397187_932CC2C3 
X-CRM114-Status: GOOD (  10.25  )
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
Select HAVE_RUST and provide the required flags to kbuild so that the
modules can be used. The Makefile and Kconfig changes are lifted from
work done by Miguel in the Rust-for-Linux tree, hence his authorship.
Following the rabbit hole, the Makefile changes originated in a script,
created based on config files originally added by Gary, hence his
co-authorship.

32-bit is broken in core rust code, so support is limited to 64-bit:
ld.lld: error: undefined symbol: __udivdi3

As 64-bit RISC-V is now supported, add it to the arch support table,
taking the opportunity to sort the table in alphabetical order.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/riscv/Kconfig                  | 1 +
 arch/riscv/Makefile                 | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 73203ba1e901..9e18a81fc2ef 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -16,6 +16,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
 ``loongarch``  Maintained        -
+``riscv``      Maintained        ``riscv64`` only.
 ``um``         Maintained        ``x86_64`` only.
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5c59e00405e3..3eaae08e1d5c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -142,6 +142,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
+	select HAVE_RUST if 64BIT
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index ebbe02628a27..22fdb1e83744 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -34,6 +34,8 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 	KBUILD_AFLAGS += -mabi=lp64
 
 	KBUILD_LDFLAGS += -melf64lriscv
+
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64
 else
 	BITS := 32
 	UTS_MACHINE := riscv32
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
