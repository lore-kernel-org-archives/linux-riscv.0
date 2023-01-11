Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5B6C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvIiHoYe+R5hvNcfyi6stWJC+pLfdlbHmzqFkNDgt1I=; b=EXzoKO7e0E+QTB
	cEFxRmanFZUaTdkY0HqJt5TyhIZFN+GZttNIVvmF63HtkOM2bJefDqTj2Undp69Ulh7Qobk+sQDtK
	OxFFeqbc4S1RULGh3OlXv19QJnmts9Z9t4xHtcltNLzoOA0EObx5Ndkicc4Vyv5Nj0ZOerHVQKLHf
	O740lilBBv9N8wdTfvNDdddxFWb8QkEqLJcZYbh3Kt58/n1VpIm/RUxaCbHy0MLqZSU3rPlMPYlsP
	SScytxR2tuvCi870/S4xPUs79FyIBttCy/UwGX78mKEZ8R8K+2mvs7UyPTryVMmyi9yXB310g2blV
	gfLVIKNavr2BTyiwajpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemw-00CMQT-P5; Wed, 11 Jan 2023 17:21:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemr-00CMIM-F7; Wed, 11 Jan 2023 17:21:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E87EA61D9E;
	Wed, 11 Jan 2023 17:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A27C433EF;
	Wed, 11 Jan 2023 17:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457676;
	bh=ANC1L0wfy1/P0+f7TDcL1iJdITEJZEnzKGu3tEgjcsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MA/U+XhExNf+fuYB7IqjgrugfJkHiRS6aw7i1XlatIvpnKCSUmj6NEGFRa4rsthPS
	 jibd7VDhON/0KD0gFuDXjtZan8MrILnJmpnAMuTh/rSWgJ2AcKE2tI5sdgCc8moT4f
	 v+3yvhyOXIMQR4tICFtxQGH9Np12dsL6SmUJWfMuMNMaaO5MMLP5udx1IxRU9ThKBf
	 kCmQZl6al1ZA/R2wcVbu3pn/iTeARnAWCG5fwRdKcTnf+ZYfroqVygo63+ZuDF6vdK
	 NWtOvwlG31jA98tq69Wcz8B1VGGA5UZ4PvA1m90xxAt+F6KG312mh/yMMoWvJRlYfR
	 Nt6rC9358gCXA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 10/13] riscv: alternative: patch alternatives in the vDSO
Date: Thu, 12 Jan 2023 01:10:24 +0800
Message-Id: <20230111171027.2392-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092117_617984_A7BE9C12 
X-CRM114-Status: GOOD (  15.40  )
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

Make it possible to use alternatives in the vDSO, so that better
implementations can be used if possible.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/vdso.h     |  4 ++++
 arch/riscv/kernel/alternative.c   | 25 +++++++++++++++++++++++++
 arch/riscv/kernel/vdso.c          |  5 -----
 arch/riscv/kernel/vdso/vdso.lds.S |  7 +++++++
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index a7644f46d0e5..f891478829a5 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -28,8 +28,12 @@
 #define COMPAT_VDSO_SYMBOL(base, name)						\
 	(void __user *)((unsigned long)(base) + compat__vdso_##name##_offset)
 
+extern char compat_vdso_start[], compat_vdso_end[];
+
 #endif /* CONFIG_COMPAT */
 
+extern char vdso_start[], vdso_end[];
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 3d4f1f32c7f6..a883a309139f 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -11,7 +11,9 @@
 #include <linux/cpu.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
+#include <asm/module.h>
 #include <asm/sections.h>
+#include <asm/vdso.h>
 #include <asm/vendorid_list.h>
 #include <asm/sbi.h>
 #include <asm/csr.h>
@@ -160,6 +162,27 @@ static void __init_or_module _apply_alternatives(struct alt_entry *begin,
 				stage);
 }
 
+static void __init apply_vdso_alternatives(void)
+{
+	const struct elf64_hdr *hdr;
+	const struct elf64_shdr *shdr;
+	const struct elf64_shdr *alt;
+	struct alt_entry *begin, *end;
+
+	hdr = (struct elf64_hdr *)vdso_start;
+	shdr = (void *)hdr + hdr->e_shoff;
+	alt = find_section(hdr, shdr, ".alternative");
+	if (!alt)
+		return;
+
+	begin = (void *)hdr + alt->sh_offset,
+	end = (void *)hdr + alt->sh_offset + alt->sh_size,
+
+	_apply_alternatives((struct alt_entry *)begin,
+			    (struct alt_entry *)end,
+			    RISCV_ALTERNATIVES_BOOT);
+}
+
 void __init apply_boot_alternatives(void)
 {
 	/* If called on non-boot cpu things could go wrong */
@@ -168,6 +191,8 @@ void __init apply_boot_alternatives(void)
 	_apply_alternatives((struct alt_entry *)__alt_start,
 			    (struct alt_entry *)__alt_end,
 			    RISCV_ALTERNATIVES_BOOT);
+
+	apply_vdso_alternatives();
 }
 
 /*
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index e410275918ac..4e631c098f4d 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -22,11 +22,6 @@ struct vdso_data {
 };
 #endif
 
-extern char vdso_start[], vdso_end[];
-#ifdef CONFIG_COMPAT
-extern char compat_vdso_start[], compat_vdso_end[];
-#endif
-
 enum vvar_pages {
 	VVAR_DATA_PAGE_OFFSET,
 	VVAR_TIMENS_PAGE_OFFSET,
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 150b1a572e61..4a0606633290 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -40,6 +40,13 @@ SECTIONS
 	. = 0x800;
 	.text		: { *(.text .text.*) }		:text
 
+	. = ALIGN(4);
+	.alternative : {
+		__alt_start = .;
+		*(.alternative)
+		__alt_end = .;
+	}
+
 	.data		: {
 		*(.got.plt) *(.got)
 		*(.data .data.* .gnu.linkonce.d.*)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
