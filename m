Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0878DC83030
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Szt/Xl0+jvZWvp4dgWA+UyqvDjaaaIVEH3mEaW7gVu0=; b=pV3Xxy1uNUq/xM
	dcrPNxV/PH92wfDQx0/oWyA62AP5OAvjcCadSe7F26q63Frj1bB8u+hPHhrQ87ThKycZMTbGGYSQI
	fWO6kiLycN8sxn9UxSgkiwOe311gcSte/Ktw6kArP11SBZ7X9y0/cHU4p9ACiKcHIGr5Va8BJoz5o
	bTq/apj3aGusShLYZNSTKcHObq5OiGi5z4VJl3XvTtMR7kSNPPKAZIBCJMrC+VzWsmrYaQuCSZUYN
	fazgHgGkGnCTVUaVKan96GbKs/zR65ti0NbgWjIzKsBwqU9ZlUIaWlYtiNzHTJf3m18SerZCDL+ym
	In3ueDpw1AEsoDZG1lFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLc7-00000003SFF-1Wvw;
	Mon, 30 Jun 2025 21:00:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWLc6-00000003SEq-0eBZ
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 21:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9741B60007;
	Mon, 30 Jun 2025 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0009C4CEE3;
	Mon, 30 Jun 2025 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317229;
	bh=VpkFFoZxR8VVeaY5vlWpftgNiTxHj8o19hcfht9EpB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kaJ8PtpDNIjAXJQQeZWP7U5cBM2VUyLyNAzDjaLoaK83HrSLD4B7IttLvzzBOlNPR
	 Kc8pgSaSoZKdi+d8WzQfTBfPcxke7La0HDglj+NI+DajL8G5y+ZdYatsHs+s/w6RIP
	 b5n0quAiKOkAsYouW+XhdZAvPYb9+kwnUdLZxQVLn4wmiZEFkWjZ5e+OOApUj1G/Od
	 NjZsfBN4mOn3CpSHPhQfKUnsA5Rq5CJ02j8MWhjLlDW/FRhwZHZsj66Gcimpiw1WKy
	 zNXekiCzFMdkviMK1gB7s1Ax9TxK5AWViBGbP1KjANI+kPD1T+jKGrvzsE3EwdHoTi
	 reiDoW8gjjSGw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Fangrui Song <i@maskray.me>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	namcao@linutronix.de,
	thomas.weissschuh@linutronix.de,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.12 18/21] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
Date: Mon, 30 Jun 2025 16:45:33 -0400
Message-Id: <20250630204536.1358327-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630204536.1358327-1-sashal@kernel.org>
References: <20250630204536.1358327-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.35
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

From: Fangrui Song <i@maskray.me>

[ Upstream commit e0eb1b6b0cd29ca7793c501d5960fd36ba11f110 ]

.rodata is implicitly included in the PT_DYNAMIC segment due to
inheriting the segment of the preceding .dynamic section (in both GNU ld
and LLD).  When the .rodata section's size is not a multiple of 16
bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
is invalid" warning.  Note: in the presence of the .dynamic section, GNU
readelf and llvm-readelf's -d option decodes the dynamic section using
the section.

This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
placed .rodata directly after .dynamic by removing .eh_frame.

This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
specifying the :text output section phdr.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
Signed-off-by: Fangrui Song <i@maskray.me>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20250602-riscv-vdso-v1-1-0620cf63cff0@maskray.me
Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Regression Fix**: The commit explicitly fixes a regression
   introduced by commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
   ("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr").
   Regression fixes are high-priority candidates for stable backporting.

2. **Fixes Invalid ELF Structure**: The issue is not merely cosmetic.
   The PT_DYNAMIC segment is reported as "invalid" by llvm-readelf,
   indicating the ELF structure is technically incorrect. From the
   linker script:
  ```
  .dynamic        : { *(.dynamic) }               :text   :dynamic
  .rodata         : {
  ...
  }  // implicitly inherits :dynamic from previous section
  ```
  Without the explicit `:text` specification, `.rodata` inherits the
  segment attributes from the preceding `.dynamic` section, incorrectly
  including it in the PT_DYNAMIC segment.

3. **Minimal and Safe Change**: The fix is a single-line change that
   adds `:text` to the `.rodata` section definition:
  ```diff
   - }
   +    }                                               :text
   ```
   This explicitly places `.rodata` in the text segment only, excluding
it from PT_DYNAMIC. The change has no functional impact beyond
correcting the ELF structure.

4. **Similar to Previous Backported Commits**: This is similar to commit
   #2 in the reference list ("riscv: vdso: fix section overlapping under
   some conditions") which was marked YES for backporting. Both commits
   fix structural issues in the vDSO linker script that cause
   build/tooling errors.

5. **Potential for Broader Impact**: While the immediate symptom is a
   warning from llvm-readelf, an invalid PT_DYNAMIC segment could
   potentially cause issues with:
   - Build systems that validate ELF structures
   - Runtime loaders with strict ELF validation
   - Debugging and analysis tools
   - Future toolchain versions that may be less tolerant of invalid
     structures

The commit meets the stable tree criteria: it fixes an important bug
(invalid ELF structure), the fix is small and contained, and there's
minimal risk of regression.

 arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index cbe2a179331d2..99e51f7755393 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -31,7 +31,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.*)
 		*(.dynbss)
 		*(.bss .bss.* .gnu.linkonce.b.*)
-	}
+	}						:text
 
 	.note		: { *(.note.*) }		:text	:note
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
