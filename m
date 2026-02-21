Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E8BC5DF6C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 03:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aL9Pm3cqEuxQIDfhbZzJVs92REUa4Udnq97X/NB7Hww=; b=LVslgsg26sdzRu
	XtSHObdcDiZipZ/xYM22SB5gmyR+idHjgK3NvL5RRnPuMIvJsf4zzqoR4mB/timym6n9v5fD1x6qR
	xf6M0311BqbQimULxejNHJ3F9AaErvBj9zClT7ONoXD0+v3QztUT5903D8/IMdwmA8JeFXBZ+Wzym
	gAoLIDpFM288v7DMlvuJwERDy1ZedcIwPqyBF/nWjJhQRIsegMgkyqiTXmQet/gf98ZGOH4HmtKje
	rKzVYcfCBE/9kqFERl6LSfL62chSapv6dxbuV9evzcn4nhDA3SIbyJmgf1q/HJ2GxImJqqXYAGP6u
	yfLWebxti6QJzQrajyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdFG-0000000Fmkg-44dY;
	Sat, 21 Feb 2026 03:01:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtdFF-0000000FmkK-0Jpj
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 03:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5D94441C2;
	Sat, 21 Feb 2026 03:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF38C116C6;
	Sat, 21 Feb 2026 03:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771642884;
	bh=KwctpyjVLKsXQ7U5+18olYPJ9bygXjS/yrPcSLoGGVg=;
	h=From:To:Cc:Subject:Date:From;
	b=Mk/vOXPUXpDFG20dryKfkHg7K8wbnpwMFirn+E/2sfFv79+C81XlI/MkqJuaViq3X
	 Ma3EW5NSRwrWXJVKaDiimVMDDuvdw3LhT3RUZyCkHHN7+iOfy/S6OK6w8B4g9uffWn
	 tSfmZaDZhER9qKuTY7AqDyrsi2pXL9YY3u61X9DB6eJduqk/Z6zVqNdKw3fuhBCvFc
	 5+B0gkvZINPyY/JvZjwX/nVvkiV7i+s7AbaCdgASjil928ttfaql+ian/HF98iYk9m
	 zEMMkOGCODYkg8nbFonbYv1LDxCU3bQF1ul0KZb0iCfB3q6Sx02GDycjX3rk4bbmif
	 UQ3MpPIi4uLmQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: bug: Make RV32 use GENERIC_BUG_RELATIVE_POINTERS
Date: Sat, 21 Feb 2026 10:42:55 +0800
Message-ID: <20260221024255.3552-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_190125_159749_DD595B35 
X-CRM114-Status: UNSURE (   8.25  )
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

x86 did this in commit b0a848f4a47a ("x86/bugs: Make i386 use
GENERIC_BUG_RELATIVE_POINTERS")

powerpc did this in commit 1baa1f70ef77 ("powerpc: Allow relative
pointers in bug table entries")

Similar as x86 and powerpc does, make RV32 use
GENERIC_BUG_RELATIVE_POINTERS for "there is only one code path." and
"less #ifdef is more better".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig           | 2 +-
 arch/riscv/include/asm/bug.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..d0c8ffed1992 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -324,7 +324,7 @@ config STACKTRACE_SUPPORT
 config GENERIC_BUG
 	def_bool y
 	depends on BUG
-	select GENERIC_BUG_RELATIVE_POINTERS if 64BIT
+	select GENERIC_BUG_RELATIVE_POINTERS
 
 config GENERIC_BUG_RELATIVE_POINTERS
 	bool
diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 6f581b84d8fc..699c0cf3e4ef 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -29,13 +29,8 @@
 
 typedef u32 bug_insn_t;
 
-#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
 #define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
-#else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
-#endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 #define __BUG_ENTRY(file, line, flags)	\
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
