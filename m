Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214F9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LbJ4x7h2sN817cTBkHgp+oZW6lQdZ5d8rFwXMP7Wpq8=; b=JGwKrwrdPgiXDB
	GEUYJ7Z/bh7NQRyE3RVD2sAJQ7VeOJHEzA43RAAIyBcsgqcaBQWtWy55YflN6b9IvsF33mVt2JHcZ
	nWHHA3VlBPG3c3/y06CRj8p3ICrR+w5QVjXV6+ctSzpx0m08rpOQuM9eM7Gz1Sb5SZdHS0QEtCeLQ
	lH6pI9Mmz50WtzEBsrDgtrDzzbB77ObRulPDvGlOqqFwV098SVphrSR+/AgGwoafg+soZIIOPDgAI
	dRQdLmCmi4tW2TjoT0QMii7yh+Kq7dLX3bPv9J+ksAM5Pi7xsWv8kGiNfYWxkNTxkPMlU8lOcGhGN
	pJ96jl5t9py6CDxBvC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9B3Z-00319d-Mx; Sat, 24 Dec 2022 20:23:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9B3L-00316d-KM; Sat, 24 Dec 2022 20:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IX/nQu0mKtFFYmJ5Rvz+J89r1jcmS6i1Kk+78EcU4SE=; b=kQLbAGzpyXNdc74dGLSXLGnECe
	erjpEPZIv6oXqu8J0XVIHVwlecCZV0eOt7QarI4GlWPQK4qEuCyMwWJUI2yT0b1P9tDcriexpfXlf
	xFU75FotA6qeDxYNzmmsnu0eYuRbjo++dJt8kwbvf84V1Irg/vobGtZqiPQJBB21xxswvcnxInHpG
	GZjYgf1UfmRTF3fZhE9X5+KDxrBB8andDFaChXd+sY4MZDh7aflkWpfALwCVaHRE1ZOG35w7AVbns
	566esOoiP6yABlCirEP9l+d9uCSQuW1J28Lw2mJsiU75Z306sN3Jz5JLCy6l3D/Z7i43NoqoQTbe8
	opkoZwNw==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1p9ABu-00EhFJ-2b;
	Sat, 24 Dec 2022 19:28:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16751B802C0;
	Sat, 24 Dec 2022 19:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A0CC433EF;
	Sat, 24 Dec 2022 19:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671910092;
	bh=UQnfmGWpjZxvdevhblki0v7ZzFcxxRalPcpyLzVn6JI=;
	h=From:To:Cc:Subject:Date:From;
	b=Z5QB2B9WNLl5VOrzUNo0txpZ6VIJYGVDHCH+nwR9luPwWds2mSlHGNBIJO7lozNhO
	 rdFdovyAsB8iRmKcwBjULiwQCbK3avqS0A6tQc7lu4SPb0m0ThZmLLMTjhPQylrGcA
	 BbNoZh4CnJ9T6EKJEAENiUfDk8GfMBn6rJWde6vjhr7FWCwAeOw5dQ804F4M/ZDkXR
	 65k9Y0tgUoGpzCSK+LlqI2CLA4kXFmBWcPEfmKWnT6hIZxpd77+lxGYLDzIhXW5LYG
	 nsxJWyNmGQmKvPj12ADF7gzCtbrkH2gHdznoidrqiuOo+Bc0OnHF48JPsAJa2dgbwR
	 rs5qlsrB9UaRw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] arch: fix broken BuildID for arm64 and riscv
Date: Sun, 25 Dec 2022 04:27:51 +0900
Message-Id: <20221224192751.810363-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_192819_093529_44EFF910 
X-CRM114-Status: GOOD (  16.21  )
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

Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
since commit 994b7ac1697b ("arm64: remove special treatment for the
link order of head.o").

The issue is that the type of .notes section, which contains the BuildID,
changed from NOTES to PROGBITS.

Ard Biesheuvel figured out that whichever object gets linked first gets
to decide the type of a section, and the PROGBITS type is the result of
the compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.

While Ard provided a fix for arm64, I want to fix this globally because
the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
remove special treatment for the link order of head.o"). This problem
will happen in general for other architectures if they start to drop
unneeded entries from scripts/head-object-list.txt.

Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.

riscv needs to change its linker script so that DISCARDS comes before
the .notes section.

Link: https://lore.kernel.org/lkml/CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com/
Fixes: 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
Fixes: 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
Reported-by: Dennis Gilmore <dennis@ausil.us>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/vmlinux.lds.S   | 4 ++--
 include/asm-generic/vmlinux.lds.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 4e6c88aa4d87..1865a258e560 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -31,6 +31,8 @@ PECOFF_FILE_ALIGNMENT = 0x200;
 
 SECTIONS
 {
+	DISCARDS
+
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
@@ -141,7 +143,5 @@ SECTIONS
 	STABS_DEBUG
 	DWARF_DEBUG
 	ELF_DETAILS
-
-	DISCARDS
 }
 #endif /* CONFIG_XIP_KERNEL */
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index a94219e9916f..2993b790fe98 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1007,6 +1007,7 @@
 	*(.modinfo)							\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
+	*(.note.GNU-stack)	/* emitted as PROGBITS */
 
 #define DISCARDS							\
 	/DISCARD/ : {							\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
