Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE05C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5/octVSO1hqBS8iT5Tx5Z+XxZQhjEfgJxp3wrcPkGo=; b=4TiVds/9oT/bSW
	hUJKnanE6VnB9B+7KSnVRrqARY1MQLh8IW0JaTvcO6D4fuITXbSKRp5Ieeey39VVOzToAJjTIk6Qv
	MO1iU/LrzbbWfUAov4gKEPlMA+n30jJH78AcHEyQLafrRvO8dEjZSQkDXWknQhsQERbLfRtQ9NdFV
	CFZ4uBl4UE33htd4OVuFrx94lFHrt+DV0digMlLUSJU6k0s1AWcI9HMmtDWYPcNKG60RODl96GdXr
	RorN8KsUcRxUA2HQNaYnN9c1mVJ8Q0ANbG+DUILNeiZnuA+fTdyWMnbGmhziSPwU/IFoew0CeFVDN
	jlI5S7clSze977Anr09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBB-000TE1-HZ; Sat, 28 Jan 2023 17:39:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpB4-000T67-KA; Sat, 28 Jan 2023 17:39:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53EFFB80B78;
	Sat, 28 Jan 2023 17:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAA6C4339B;
	Sat, 28 Jan 2023 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927584;
	bh=W6NwJoOq7fauyX3aaR9QaMpoEnd1BqGf85SXKRegHDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D2ZxPGo26zm2P5Tb+gL6cWHX2PYGm+SMKh0gbzM9WpswULEijQBnsqxEZPRV2dSe5
	 ANQgIshYHzrzHUvdlX3y3e2+sRBYX4RRcQbhMr9lnUMuZ72wmPOQ9EH1bY3G2ugfQu
	 gbOOTrxfXtktVGPUrjMwe6wQS+XzDFcBSWCYeONW/AKgdnGD/LNS8fka9iCd/j5X0Y
	 vPjCu+T3rQSweeG9d678AQ9p2iZINKAqmHtR8TabklCDjUve5n2eYIFSEVUwu22izt
	 5dX5ysg9enyznja3ybGMf9CZl/XsxQXMdsEdpfEZQ2pnClwfQILiJBwPdOZ8C88F1F
	 ae4H1/9u4CT6g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v5 07/13] riscv: module: move find_section to module.h
Date: Sun, 29 Jan 2023 01:28:50 +0800
Message-Id: <20230128172856.3814-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_093946_834043_323CFC03 
X-CRM114-Status: GOOD (  11.98  )
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
