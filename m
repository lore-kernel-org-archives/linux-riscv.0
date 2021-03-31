Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0644C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 16:30:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A04A61008
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A04A61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7IMIxc4neCNqps+3Z0YDe9R5w1g3RYqaiKqgMHxm3eI=; b=Kq5muhJGnuw2VhwlwELCgIZtw
	6y7gkfYN17P6SlYfCo6ck6sTyPwPU/bnhhKdJdyUZufSHEiALR52dVtAO1wQT2UluGTJZTm56WM1h
	a1ppPk0M8YuABQEfgUX28KhqL73o1zJP7NPrp/SjfUfkVce68Bz+9557/eujeORTOMdP3vSYJY+NE
	KwSr5jI3jpYrYxYuthmTUKnLOrIPCDsvb6booFGFj0AOxfFc8GC1lUiIJhZdLhFfEj+elONeAsD5j
	L3cfNRkizyuCVEV19mRkiJieh9pLWLTEM4ZTk/GgOMpS6XCdwbqzp9dZyKTH3b6vF+yvqpCF9Eesx
	E79K0vZKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRdji-0076G0-Cp; Wed, 31 Mar 2021 16:30:30 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRdje-0076Eg-Kg
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 16:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=DB/sloEYmz7VRvujZiwTWQcY6o1S+cvefB
 jxUT4Goqw=; b=HibTMtPMHatWdR2T2i27KbLrG4Eg9Qc1ki7i8U7JqLnciNHWlw
 uvUNkZF94nSMSf//u0X387N/cRww7tsgKViQKffbi8hV1KcAJv0Rz5kPZic8cjBY
 Go2RrQOSIiEy0KCKADkcgC/6kcowbSAH0sgneFyfQ1Zvpb/RH6oPC4gBo=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDn7EyWo2Rgrbt6AA--.6768S2; 
 Thu, 01 Apr 2021 00:30:15 +0800 (CST)
Date: Thu, 1 Apr 2021 00:25:18 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt 
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin 
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey 
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, " 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov 
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko 
 <andrii@kernel.org>, Song Liu  <songliubraving@fb.com>, Yonghong Song
 <yhs@fb.com>, John Fastabend  <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Luke Nelson  <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH v2 1/9] riscv: add __init section marker to some functions
Message-ID: <20210401002518.5cf48e91@xhacker>
In-Reply-To: <20210401002442.2fe56b88@xhacker>
References: <20210401002442.2fe56b88@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDn7EyWo2Rgrbt6AA--.6768S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuryfXrWUJry5ur48ur4xtFb_yoW5KFyUpr
 WkKa1kZFWYkFWvga9rAry8ur1UJ3Zaka43trsFkas8XF17ur45X34kW3yqvr1UJFWkuayr
 A34rAry5Aw4DAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU81GQDUUUU
 U==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_173027_371242_BEF47581 
X-CRM114-Status: GOOD (  11.01  )
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

From: Jisheng Zhang <jszhang@kernel.org>

They are not needed after booting, so mark them as __init to move them
to the __init section.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c  | 2 +-
 arch/riscv/mm/init.c       | 6 +++---
 arch/riscv/mm/kasan_init.c | 6 +++---
 arch/riscv/mm/ptdump.c     | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 1357abf79570..07fdded10c21 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -197,6 +197,6 @@ int is_valid_bugaddr(unsigned long pc)
 #endif /* CONFIG_GENERIC_BUG */
 
 /* stvec & scratch is already set from head.S */
-void trap_init(void)
+void __init trap_init(void)
 {
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 067583ab1bd7..76bf2de8aa59 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -57,7 +57,7 @@ static void __init zone_sizes_init(void)
 	free_area_init(max_zone_pfns);
 }
 
-static void setup_zero_page(void)
+static void __init setup_zero_page(void)
 {
 	memset((void *)empty_zero_page, 0, PAGE_SIZE);
 }
@@ -75,7 +75,7 @@ static inline void print_mlm(char *name, unsigned long b, unsigned long t)
 		  (((t) - (b)) >> 20));
 }
 
-static void print_vm_layout(void)
+static void __init print_vm_layout(void)
 {
 	pr_notice("Virtual kernel memory layout:\n");
 	print_mlk("fixmap", (unsigned long)FIXADDR_START,
@@ -557,7 +557,7 @@ static inline void setup_vm_final(void)
 #endif /* CONFIG_MMU */
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
-void protect_kernel_text_data(void)
+void __init protect_kernel_text_data(void)
 {
 	unsigned long text_start = (unsigned long)_start;
 	unsigned long init_text_start = (unsigned long)__init_text_begin;
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 4f85c6d0ddf8..e1d041ac1534 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -60,7 +60,7 @@ asmlinkage void __init kasan_early_init(void)
 	local_flush_tlb_all();
 }
 
-static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
+static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
 {
 	phys_addr_t phys_addr;
 	pte_t *ptep, *base_pte;
@@ -82,7 +82,7 @@ static void kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long en
 	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(base_pte)), PAGE_TABLE));
 }
 
-static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
+static void __init kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long end)
 {
 	phys_addr_t phys_addr;
 	pmd_t *pmdp, *base_pmd;
@@ -117,7 +117,7 @@ static void kasan_populate_pmd(pgd_t *pgd, unsigned long vaddr, unsigned long en
 	set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa(base_pmd)), PAGE_TABLE));
 }
 
-static void kasan_populate_pgd(unsigned long vaddr, unsigned long end)
+static void __init kasan_populate_pgd(unsigned long vaddr, unsigned long end)
 {
 	phys_addr_t phys_addr;
 	pgd_t *pgdp = pgd_offset_k(vaddr);
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index ace74dec7492..3b7b6e4d025e 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -331,7 +331,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(ptdump);
 
-static int ptdump_init(void)
+static int __init ptdump_init(void)
 {
 	unsigned int i, j;
 
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
