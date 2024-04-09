Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B378C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sfl6hjBv+BNfyfALDqPra2K6D5JJqHukXsWZZ1fCAfw=; b=Xd4NAXmAMGncdg
	iEtfgbxZT5/sdNbIxv00E1stJ4jCPnu7B3lW6pSIZ0vUSZNoLuwik7E7I4g525OeTNwqNU3GqXm7I
	iZCOSmgEXo439tLN4ktlykNuiyJa+Z7fLuPo4AyiUoK1v7qsbI6Hii8EAjKjPTjHQ80ahObr9R8xD
	vVZeHPRssEcxqP4xnt0HbWf4gdhtd1IJY3STCwdJN1MIhmIMPEVhUqiVzqZ7AtepJbK6SPEuytArI
	jPyrt02rNrhxy3gU4Augi1FxZSaye4Vh/9rdbHGjJJub3iw9cSVeBH1sErtb8M/cg6cg3dmxagcRT
	QHatCowL5Y/kwWTXAwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFDv-000000038jM-2oHr;
	Tue, 09 Apr 2024 17:25:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFDs-000000038iJ-11gb
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 17:25:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCA76617A2;
	Tue,  9 Apr 2024 17:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED38FC43390;
	Tue,  9 Apr 2024 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712683527;
	bh=x1jZKDXk5BIGm5YDGoFHpyFK8MESp1T/4nGKvbEdUqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nm3QmdtWJMpsaezPQSCLPU64PyopzwqKHY+C+/58W2rbRQtJPh18foqyBdn7G3+tY
	 ghd4gkz0OnemGzENKv2WlusuxNcqOWssiD86ubV0InlcjPbHR+QwNTkopI9tabDcrI
	 jXNS9ZyxdM+oqjxKtHoWCmZAAXNDRgXifdSqbUqrQkYoOac1+fmcZp5+PEvwmorDqj
	 6EM949f/MOITEJ9OL+O9FkVqNrwzj6ACzuBjAqsaRku3kzWYrbz3aUEh4mDKh1v4lK
	 Ag4y/dOLPTlBYVBbPM+qfa5yIrXk6v1x2ew6QhTw0vI8fRg1iDhANw+sqFIyCREzpM
	 8vaB9fhwpeFaA==
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
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/1] RISC-V: enable building 64-bit kernels with rust support
Date: Tue,  9 Apr 2024 18:25:16 +0100
Message-ID: <20240409-silencer-book-ce1320f06aab@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240409-unsaddle-skittle-c93eb77732bb@spud>
References: <20240409-unsaddle-skittle-c93eb77732bb@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xZYTGLjiCVE7JnahWB3jOeGgmxcSsO+7d9P+DKrpXO4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmilb/fbD9+eAMvK8f6K/+rM37NX9Jv4jHxBE+sX/Gkp fHn/qxd2FHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJdHkw/FMMCz316UySUMJR 50tJ/ss1ODiY41yP3FmxXr9Kpe9w8gpGhusFq7fx5sw9+0LOMP2dbOY2E2Fr2+6YL54Ra2cePnJ qBTMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_102528_399703_8304B015 
X-CRM114-Status: GOOD (  12.04  )
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

As 64-bit RISC-V is now supported, add it to the arch support table.

Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/riscv/Kconfig                  | 1 +
 arch/riscv/Makefile                 | 7 +++++++
 scripts/generate_rust_target.rs     | 6 ++++++
 4 files changed, 15 insertions(+)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 5c4fa9f5d1cd..4d1495ded2aa 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -17,6 +17,7 @@ Architecture   Level of support  Constraints
 =============  ================  ==============================================
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        -
+``riscv``      Maintained        ``riscv64`` only.
 ``um``         Maintained        ``x86_64`` only.
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..cad31864fd0f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
+	select HAVE_RUST if 64BIT
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..adbc9023d7f0 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -34,6 +34,9 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
 	KBUILD_AFLAGS += -mabi=lp64
 
 	KBUILD_LDFLAGS += -melf64lriscv
+
+	KBUILD_RUSTFLAGS += -Ctarget-cpu=generic-rv64 --target=riscv64imac-unknown-none-elf \
+			    -Cno-redzone
 else
 	BITS := 32
 	UTS_MACHINE := riscv32
@@ -68,6 +71,10 @@ riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
 
+ifneq ($(CONFIG_RISCV_ISA_C),y)
+	KBUILD_RUSTFLAGS += -Ctarget-feature=-c
+endif
+
 ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 KBUILD_CFLAGS += -Wa,-misa-spec=2.2
 KBUILD_AFLAGS += -Wa,-misa-spec=2.2
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 54919cf48621..8f7846b9029a 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -150,6 +150,12 @@ fn main() {
     // `llvm-target`s are taken from `scripts/Makefile.clang`.
     if cfg.has("ARM64") {
         panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
+    } else if cfg.has("RISCV") {
+        if cfg.has("64BIT") {
+            panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
+        } else {
+            panic!("32-bit RISC-V is an unsupported architecture");
+        }
     } else if cfg.has("X86_64") {
         ts.push("arch", "x86_64");
         ts.push(
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
