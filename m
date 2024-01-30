Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB408C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPsrSbbCYrTePVuM998tlglZ7jGj1jGDepsQz6R4XNU=; b=hugIVM/NVBr0a2
	zeWLNdoztjO0qpUQSob5LgGGpmuhfqxK7xm+W3OMHwd+5OBjIA7tm/K+YUSG5GCIA/rdqq8F24yIZ
	YDKVk145bxVHicvg4QH/ziZed1moyUvV+hXdKsqDNM1szJk+r5HVjrjLRZVRaIQafgkLjmC8Xt1B+
	PybcxuAJXwIYTfCOL3ceFG62/kchrdC+sQjmziWQmIRAu2Ff44R083XxdSo4oiwDypn4PCuLpcXwI
	EkOMmOHCWzPhFpbQpb8Hxmq8+YI1Vy8FGZNUsCgKv533m/3yZWVYRKyk+FpQtd2uiBfeR/T6Of4sr
	Kt0vbCoWVr4j+MYZhb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlUR-0000000GD77-07Ui;
	Tue, 30 Jan 2024 10:37:15 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlU0-0000000GCmU-2ggv;
	Tue, 30 Jan 2024 10:36:50 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TPM681h4bz9scH;
	Tue, 30 Jan 2024 11:36:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZwUjiuwfEk7; Tue, 30 Jan 2024 11:36:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TPM4X1FsXz9v9N;
	Tue, 30 Jan 2024 11:35:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2229B8B76D;
	Tue, 30 Jan 2024 11:35:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PHLQbxrVfhNu; Tue, 30 Jan 2024 11:35:08 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.134])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C7538B76C;
	Tue, 30 Jan 2024 11:35:06 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-mm@kvack.org,
	steven.price@arm.com,
	Phong Tran <tranmanphong@gmail.com>,
	mark.rutland@arm.com,
	Greg KH <greg@kroah.com>
Subject: [PATCH v2 3/5] powerpc,s390: ptdump: Define ptdump_check_wx() regardless of CONFIG_DEBUG_WX
Date: Tue, 30 Jan 2024 11:34:34 +0100
Message-ID: <07bfb04c7fec58e84413e91d2533581be357a696.1706610398.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706610398.git.christophe.leroy@csgroup.eu>
References: <cover.1706610398.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706610876; l=3171; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=bb3S88Yvg8QpRseQmACLuXZiVFZjaEpDowsFLtdjjAQ=; b=x0gpc6EGu0yH2XscctlYCktpakujE8CZJRZncJQIF0g06b7Y7Hq6Mvhcu1/d2nAOLeJFqfmh6 BTlFYvDjZnaBzRZ7joo/Zb7ANesjnwXYbuz1WBppoGr+Zl+SP+ywNIp
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_023649_145982_8DCE4379 
X-CRM114-Status: GOOD (  13.63  )
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

Following patch will use ptdump_check_wx() regardless of
CONFIG_DEBUG_WX, so define it at all times on powerpc and s390
just like other architectures. Though keep the WARN_ON_ONCE()
only when CONFIG_DEBUG_WX is set.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/ptdump.c | 7 +++----
 arch/s390/mm/dump_pagetables.c  | 7 ++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 620d4917ebe8..b835c80371cd 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -184,13 +184,14 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
 	pte_t pte = __pte(st->current_flags);
 
-	if (!IS_ENABLED(CONFIG_DEBUG_WX) || !st->check_wx)
+	if (!st->check_wx)
 		return;
 
 	if (!pte_write(pte) || !pte_exec(pte))
 		return;
 
-	WARN_ONCE(1, "powerpc/mm: Found insecure W+X mapping at address %p/%pS\n",
+	WARN_ONCE(IS_ENABLED(CONFIG_DEBUG_WX),
+		  "powerpc/mm: Found insecure W+X mapping at address %p/%pS\n",
 		  (void *)st->start_address, (void *)st->start_address);
 
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
@@ -326,7 +327,6 @@ static void __init build_pgtable_complete_mask(void)
 				pg_level[i].mask |= pg_level[i].flag[j].mask;
 }
 
-#ifdef CONFIG_DEBUG_WX
 void ptdump_check_wx(void)
 {
 	struct pg_state st = {
@@ -354,7 +354,6 @@ void ptdump_check_wx(void)
 	else
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
 }
-#endif
 
 static int __init ptdump_init(void)
 {
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index 8dcb4e0c71bd..99da5a5602a8 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -121,7 +121,6 @@ static void print_prot(struct seq_file *m, unsigned int pr, int level)
 
 static void note_prot_wx(struct pg_state *st, unsigned long addr)
 {
-#ifdef CONFIG_DEBUG_WX
 	if (!st->check_wx)
 		return;
 	if (st->current_prot & _PAGE_INVALID)
@@ -138,10 +137,10 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 	 */
 	if (addr == PAGE_SIZE && (nospec_uses_trampoline() || !static_key_enabled(&cpu_has_bear)))
 		return;
-	WARN_ONCE(1, "s390/mm: Found insecure W+X mapping at address %pS\n",
+	WARN_ONCE(IS_ENABLED(CONFIG_DEBUG_WX),
+		  "s390/mm: Found insecure W+X mapping at address %pS\n",
 		  (void *)st->start_address);
 	st->wx_pages += (addr - st->start_address) / PAGE_SIZE;
-#endif /* CONFIG_DEBUG_WX */
 }
 
 static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level, u64 val)
@@ -193,7 +192,6 @@ static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level,
 	}
 }
 
-#ifdef CONFIG_DEBUG_WX
 void ptdump_check_wx(void)
 {
 	struct pg_state st = {
@@ -226,7 +224,6 @@ void ptdump_check_wx(void)
 			(nospec_uses_trampoline() || !static_key_enabled(&cpu_has_bear)) ?
 			"unexpected " : "");
 }
-#endif /* CONFIG_DEBUG_WX */
 
 #ifdef CONFIG_PTDUMP_DEBUGFS
 static int ptdump_show(struct seq_file *m, void *v)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
