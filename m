Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04119C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5/octVSO1hqBS8iT5Tx5Z+XxZQhjEfgJxp3wrcPkGo=; b=dFUhZ6Y0XvbSYe
	IWJ6IGvsEayi5af5RHFm39cr+dY/KA5Y1rfV5AaqJnQWqJd9cn3RCUSrL5lDo8ajRA/KD4Bjb3VBD
	7PvpCXPCGCQWsl1S7ZApzqzI2o3Nnqgh3bQP21OMhaarxzZwhZI9eqc46/V7dzqAGQ8HeXFYnNtkV
	MEeWyJz7XopNZIy3wdaHuCV44U/PzdpkroBOkuGVEEq6CKkRQWgqvNjTqShX+MjQdGNT4o0tyQ/LX
	lPRO7oP0F2Z+1OX+fZUqZLQ7+kBakTtJmgqph7g0dkke5OZ8MduO/u5hWz701bfL0jRqCbssEhQBL
	Qt3Q4lYhrLsg4Mlwvcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemq-00CMHL-J1; Wed, 11 Jan 2023 17:21:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemn-00CMCS-3w; Wed, 11 Jan 2023 17:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE2D0B81B79;
	Wed, 11 Jan 2023 17:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29E1C433D2;
	Wed, 11 Jan 2023 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457670;
	bh=W6NwJoOq7fauyX3aaR9QaMpoEnd1BqGf85SXKRegHDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D75d/A9S64ANT2vjpZ+W99c0WJYeqx+r15lfor+IxsMitzgTgU10xNLFTWpmbRDLN
	 6jW2Zr/fM9GV0/5QYkLSMvxupgVx2erpfOTVicmDa1psTbljVBz6d1ZubDKPL2L3Rp
	 1YkkbIU+r1h7nk+TRby5FwlbSvTAM53aQfl4c5+TMePgndziOABuxLgyWxYe6p0NDs
	 l6Qg4Ec0UoJyjAcMDJQwV4IwhBUzd2EKU6AO7tthfq0ke9ieI9+UJdAHz7SK6dXpkq
	 SuYQEe190aAoWRm+S9Uc1ehFjUUZBp94uClqma9e3x5GghUChM9yD2tR/xHMoXT6rF
	 +zcLfe4WuD1kw==
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
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 08/13] riscv: module: move find_section to module.h
Date: Thu, 12 Jan 2023 01:10:22 +0800
Message-Id: <20230111171027.2392-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092113_343308_206ED049 
X-CRM114-Status: GOOD (  12.90  )
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

Move find_section() to module.h so that the implementation can be shared
by the alternatives code. This will allow us to use alternatives in
the vdso.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/module.h | 16 ++++++++++++++++
 arch/riscv/kernel/module.c      | 15 ---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 76aa96a9fc08..0f3baaa6a9a8 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -5,6 +5,7 @@
 #define _ASM_RISCV_MODULE_H
 
 #include <asm-generic/module.h>
+#include <linux/elf.h>
 
 struct module;
 unsigned long module_emit_got_entry(struct module *mod, unsigned long val);
@@ -111,4 +112,19 @@ static inline struct plt_entry *get_plt_entry(unsigned long val,
 
 #endif /* CONFIG_MODULE_SECTIONS */
 
+static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
+					   const Elf_Shdr *sechdrs,
+					   const char *name)
+{
+	const Elf_Shdr *s, *se;
+	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
+
+	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
+		if (strcmp(name, secstrs + s->sh_name) == 0)
+			return s;
+	}
+
+	return NULL;
+}
+
 #endif /* _ASM_RISCV_MODULE_H */
diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 91fe16bfaa07..76f4b9c2ec5b 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -429,21 +429,6 @@ void *module_alloc(unsigned long size)
 }
 #endif
 
-static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
-				    const Elf_Shdr *sechdrs,
-				    const char *name)
-{
-	const Elf_Shdr *s, *se;
-	const char *secstrs = (void *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
-
-	for (s = sechdrs, se = sechdrs + hdr->e_shnum; s < se; s++) {
-		if (strcmp(name, secstrs + s->sh_name) == 0)
-			return s;
-	}
-
-	return NULL;
-}
-
 int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
