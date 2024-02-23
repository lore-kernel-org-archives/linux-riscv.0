Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2FEC5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XsNvPDrRz2iPQbo3BgBT9b0mCiH2vqq61Xq2LoMlQ70=; b=bdwnUcZmDeZSaI
	oC8ADPS8+E8M2fmqUT5WjkzLYZq+4x7IOlnHH7+lVA+ep7XoPENl5ldp5njlc8578yPkNuh24vu6n
	Y/7iY1vUZXkczRdUjzZJ5bb03eSjn3YieinFCs/MKBF/LJkIEKIdXdxIQ7b0QhvoaEgP8Bu7DVkvJ
	9aPqYxyvr1x/FCoeRzRVPcJiWJJSzC6qWUzpG8cutImkulb0e0FHA+wmB+6XhtHeJmCJqJynjSQY6
	NxN7PGoYwEZf8hb8+s+krVVyo9c3+YXA7nIkXVJDV7orOJoA1gp9Nl6BihDUSZGvZg5RRvgiSUh9f
	EDKqDTHGdgSx60KNcB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVlA-00000009b75-2OPV;
	Fri, 23 Feb 2024 13:38:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdVl8-00000009b5T-07Pv
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 13:38:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63D68634B4;
	Fri, 23 Feb 2024 13:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611A5C433A6;
	Fri, 23 Feb 2024 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708695517;
	bh=VltUvQLlmLwkpl8kRnLO58R3H1pbUYjiNeAYAhm4vK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Na5p+TP86HhyZXIS9INaL8dQBTOiswdRzULSa5FNq46+4a22pnBtTtloyqFR8cWc8
	 n8yn1MMy2W7P2cqPCBcS0OBpjP8xSadnJJcXmWRnWauvwKGLaTU4cll8SATYAhUv17
	 cYr9GnNe6g5JhklC6GcTpLtBe8w85TjlaGno0uWLbIrlH/aNG/uJRDYpZM3bkdYj3O
	 6K09xONc0jMaq1Kpvw0KdV/Jv/lw63QSQ/NRvdyygkYqtcjNvcy+e76orulwxLVITl
	 SAMd1plaBCYXZCO4bQkgBlK3+NOpjLRsMt5hBqFLEl/aBsq/mk/quDjslSCEZG5OE4
	 rVGmCyn2+AIGw==
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
	llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
Date: Fri, 23 Feb 2024 13:38:03 +0000
Message-ID: <20240223-perjury-preshow-fc2cf73d552e@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223-leverage-walmart-5424542cd8bd@spud>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CGpXuPYcXKOyMHoYWd5SM3467xfR+bc0vpqwYOI3iyQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKk35u8JtHm+ZsH5Sc/CPbpmzj1yYUtL5lVNtfKQGyezj SYVXz8p0FHKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJzJRhZHj+yWvHNJapDg0f b5+5HpMl+Cir0HdTfvXKf1lxFjVqwf4M/4v2a3lvq1kyS7umuGfKg7ig3pUBuwU4+zsuViUvVFZ YygsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_053838_213472_119B80EA 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On RISC-V, and presumably x86/arm64, if CFI_CLANG is enabled loading a
rust module will trigger a kernel panic. Support for sanitisers,
including kcfi (CFI_CLANG), is in the works, but for now they're
nightly-only options in rustc. Make RUST depend on !CFI_CLANG to prevent
configuring a kernel without symmetrical support for kfi.

Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
cc: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
This probably needs to go to stable. The correct fixes tag for that I am
not sure of however, but since CFI_CLANG predates RUST, I blamed the
commit adding rust support.
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 8d4e836e1b6b..6cf05824859e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1895,6 +1895,7 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
+	depends on !CFI_CLANG
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
