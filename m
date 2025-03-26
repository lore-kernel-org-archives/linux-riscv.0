Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DF2C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B2zz5Egcvm58w94I9edEY2IHcVgFknHYThkSQVs4BUc=; b=b6619sEKEcqBZd
	hgved+5gFvfY6R6jeoHbjLt9ADoOZZX0Yg0NAjr4XtnVG+C3m6O9hTdC/K2TIY7/gNb2jcsC2gwuA
	ZebE/R3CaF9TYjvNazVSNN2eDpZnk6Ziwg92c2xZ1hnHCNqGZreRVpmyYOuu8jTmt8YYByGnFz9kb
	+OKnczDhKgqjfsymO7j8F8gk9mdElGDv79zkq+ItM0jIbA68bE2hNPEcUhWOvQVIGVUY9IrlhKkPs
	xcIRDOlBs/AgZ8Drn5sA8U9fI4GDrfKr8lJ6XByY3JgMSAAiXSx32ifBsxpL8jFBRowOFBf+tXr4H
	Hrmj1G3iI4lOms/C2VeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLTO-00000007p2j-2fFo;
	Wed, 26 Mar 2025 07:46:50 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLIf-00000007nsl-3xCO
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 07:35:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4C65F259E3;
	Wed, 26 Mar 2025 08:35:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cd6IB-_Ad6AY; Wed, 26 Mar 2025 08:35:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1742974540; bh=8N7TAnjHhbKKV3hx15Gcf+pRqRaCeWje8X3aqvBWj0E=;
	h=From:To:Cc:Subject:Date;
	b=Tr/3aKcQ+8CotaUqVINbH7EOqQDZhkNXJiE+n1Sj2dx2Ec8bEY0b7i4wr5+J2KxjP
	 ziT3cs+zBIRqLYoeCCTZynbflqX3QvZcYFzavAURptAug+YejH40kxrcgz0ne5K8JU
	 N4/AMevpQPUKDsqRURH8dX5SrY8rwJWbMjdOZGxSC1JrGhCH4Eq+gz4y9v2plzkyAK
	 0tsB3ubi+1ZqsFNCbh0ISe0hIRNfXblrqvF71P+4/ACOABCCzyw3kil8GKDfiHyqrO
	 wvUjLVQKIkF82EjpqYpjtp50V3XI4NqK5FEKUFNiY2kjhOUJa9mXuRY1aTNiqhK0c9
	 T054nxgv6CxlA==
From: Yao Zi <ziyao@disroot.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ying Sun <sunying@isrc.iscas.ac.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Yao Zi <ziyao@disroot.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Li Zhengyu <lizhengyu3@huawei.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv/kexec_file: Fix comment in purgatory relocator
Date: Wed, 26 Mar 2025 07:34:51 +0000
Message-ID: <20250326073450.57648-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_003546_383838_8024F784 
X-CRM114-Status: UNSURE (   9.90  )
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

Apparently sec_base doesn't mean relocated symbol value, which seems a
copy-pasting error in the comment. Assigned with the address of section
indexed by sym->st_shndx, it should represent base address of the
relevant section. Let's fix the comment to avoid possible confusion.

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/kernel/elf_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index 3c37661801f9..9b8ff87630f6 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -390,7 +390,7 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		const Elf_Sym *sym;	/* symbol to relocate */
 		unsigned long addr;	/* final location after relocation */
 		unsigned long val;	/* relocated symbol value */
-		unsigned long sec_base;	/* relocated symbol value */
+		unsigned long sec_base;	/* relocated section base address */
 		void *loc;		/* tmp location to modify */
 
 		sym = (void *)pi->ehdr + symtab->sh_offset;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
