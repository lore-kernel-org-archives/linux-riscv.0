Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57858CD1299
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PIIrUx/CNO5TtChZk7ODq/cQx3N4ZxbgmWl7cum3Quo=; b=2f3KCfO+/1F6A8
	YXnwkDdyc+37iBhgkKu+4PieuRBKCNWHAsDpUW/T5pori8Q7dyaZymrPkCXALIyfMShBMueMkQ7pc
	k2AsfP/wAGASK5Q9Ycz4ZljEl1+Kt99Cy7FVbczysuLogssxoW9OJpO6ZWpCsyP5BNJ6NJS56yBL2
	eRP0nsg782vYadHWfb1EnHgi5x+N3KuWBWltlwr70OcjIxtOZHjCv0K1xdNbxJYCD7LAnTinoqZ+v
	37PVLoLcXhKVWQFBucWsVUJoDP/uFWVMgWaeg7YyE5PnsG64RFHko6itRCLgfgzLPk9Cx5INwEBSX
	TJ0zWcWdTsSnTgZCsfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNu9-00000002zP9-0fHM;
	Thu, 04 Apr 2024 14:17:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNu6-00000002zOC-1mb8
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 14:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31600CE0EEA;
	Thu,  4 Apr 2024 14:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1B4C43390;
	Thu,  4 Apr 2024 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712240237;
	bh=fCiV5G+P7hLxL4/i+fatn5exEfxvCbsdD/tZJnnspDM=;
	h=From:To:Cc:Subject:Date:From;
	b=Tctwqk93E2w4iLsFrEADOfQFuky5b4wNMuH6FA88PWnTMge2gd9Hb9e396USZ965X
	 X/JhrcRRgI/hyNaxrYA09P4GxYq9t47w868GKYGKvaniHLwu1zKEAxTpKaDGH7nxSf
	 4W8KuZfZkJkqDOJFMU1VdzBKY4pn4H7sVRNSvr12C+/Fa0YIIikqPxf1h2qBXYD4Y5
	 WdLs9hr5Oq3lVO8TRXPTLgSXdunvgNpBkHQ3I7iL4lmRbVcSNcSkonFwkNyhmYFnGT
	 YV8WYH87o7DqMAdJVbzimEHAEU/Ma+NaEH5xRmk8N7gl5Sa4vjwGmdii7BFYbAjZt0
	 7yFjs9n5jPC4g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev
Subject: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
Date: Thu,  4 Apr 2024 15:17:02 +0100
Message-ID: <20240404-providing-emporium-e652e359c711@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3u+yX39PQ8dR4zv/dMqW8YPDJelB+vvZV3YqW2204hQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGl822LTjwUwHJoqN+fKFFm3BycEP1hoNrKwX41vS5S+1 bXxXr5bRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZiwMHwP7PP/eEiv1sfLKq0 V2q68F9UjXt3suRX0LdHRVEsSySmaDAynC5ZcfReOgfPsxPyDuYKEUVMiYz8wtM8kp7O8fjXWGT FBAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_071722_741541_8AC069FD 
X-CRM114-Status: UNSURE (   8.47  )
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

On RISC-V and arm64, and presumably x86, if CFI_CLANG is enabled,
loading a rust module will trigger a kernel panic. Support for
sanitisers, including kcfi (CFI_CLANG), is in the works, but for now
they're nightly-only options in rustc. Make RUST depend on !CFI_CLANG
to prevent configuring a kernel without symmetrical support for kfi.

Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
cc: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Sending this one on its own, there's no explicit dep on this for the
riscv enabling patch, v3 to continue the numbering from there. Nothing
has changed since v2.

CC: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@gmail.com>
CC: linux-kernel@vger.kernel.org (open list)
CC: rust-for-linux@vger.kernel.org
CC: Sami Tolvanen <samitolvanen@google.com>
CC: Kees Cook <keescook@chromium.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: llvm@lists.linux.dev
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index aa02aec6aa7d..ad9a2da27dc9 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1899,6 +1899,7 @@ config RUST
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
