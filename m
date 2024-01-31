Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F49C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NI7eMxeNtZSVYmVIpv2gn2tWfkujNGlA5YOg9/xOLqw=; b=akCd+tsD65Ey6B
	0+yeKCXu6uBv6Fq4DbAHx/OyuZg8Qnyf1nqehK2M0YmU8aDnJKn3cr241mOnq34btgjefGUB9KdlS
	SiQ38I7mj221tN/n4bzW+nnJcsfA9luOLBtpY6FoDysNtiJqcuCXQ15aSdLUcxouuhDw4WvCs+mSu
	J8I+QpbdgArUskKA7UPdAgcHIEz6Dcq7dFYBZKXV76ZfjUxm6V3mzFKIDzPg+a888Lwogfn0BhtHr
	OvlFXYjpz3aJ6tpTbQfas2z4DGb/TCRTiukkTHbEJ5+87+T32ZvOleDuiWLF2t7MY4JAUPNSCRDA/
	3VJizUZ585g5+7eWGnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD2v-00000004O4r-1yyY;
	Wed, 31 Jan 2024 16:02:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD2t-00000004O3K-0us3
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 16:02:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a30e445602cso238115066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 08:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716957; x=1707321757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roEDJI/JlVTVXh0TwtWic11MC5sMgNCSBaun+agzxOw=;
        b=Jgc8LPFiTWsuR49JbueLnCA1Ff2576ntwLQ2a7YDHLMv2oVvobBjibj15ycebUZtWa
         sEMam7thgQwtu1F01kNRPxVgmjWajpnIMPeDT9QX6bR3xLy+HIlUc0Y+XHQrcjBZ43Lz
         gu0VmRMQV5Krq2x9nn317wLZ8wnEJLYCogrB86dcoUzxYlTOqpJpKDSfBfiHJajDlxGG
         BMfkm9SyJKU5WkiqwAnQhYcAcDvF4CQvSOHCqTTY+djbFtdbrpTwSoOIK7zLE8DKMVny
         qHMb+8UZNhnjM9vP8oCO33kYlPmJ4vBAzEfye6q4CNwVKHT7PDMiUWw7F/KmKmxO4+au
         ESrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716957; x=1707321757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roEDJI/JlVTVXh0TwtWic11MC5sMgNCSBaun+agzxOw=;
        b=GR46JE0dvdlSfato9OcQXl8HCWjgW1C6fizPKPRd+gBnTbUlGHo9E9+m9NHD1Zkcm/
         ytpNaK3JBc8pSH+MPbZoxx8Ajp5AtChf7JOAq0RmwKcWdBeT/Zb3SOMp4FaxhTTO1qxL
         3m76D+frklPuvDT5tHyCq5JhlZtRKjhhlHP8/E+3f0nVjZiZ9mq+aSZW/TTjNQ0nk78r
         mnCpfk/h9laJF0ta5QpW18EeQnIq2dlml2ygFzgL/nerlCmtQN/cApSdonMQYRJfiBdB
         v4KLwfpHV2kTEpkCFkb8i7bxq+OzW0Br2OQZTvOA0sG9p9WgmqztPlGuyGlL2asB+HZQ
         ODTQ==
X-Gm-Message-State: AOJu0YzjunkV4F69rH6UDa/BgIIQ7v6oELAmxQw2ym23xoncCeBsrhKa
	3clXaiWUeKSklqzOCWbGeE3gSSoJL+fDvYGF4r8hpJTV6reDV/4P37gI+h2DgDI=
X-Google-Smtp-Source: AGHT+IGv2jgdsIvvr3em1Asod7wMzF0cwySX89l1VDTNJRgzTu/LSzdp9sUvQ6blXvUGsP80SoaKkg==
X-Received: by 2002:a17:907:a642:b0:a33:8fed:b9d5 with SMTP id vu2-20020a170907a64200b00a338fedb9d5mr4201411ejc.3.1706716957070;
        Wed, 31 Jan 2024 08:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXfm71N3T9h/F/CiQJuplDKsyuZZyOxCnpmTyjV18wHTQsMSdQnNkDDdJ4IMI8MOZMMdnUoibCHWjlKo3QMlFwAcKN2+h/dhl9NOsGzXN1JsWeY0jSAXt6kygdx5jmO3bK8iZoFHuM2PCTSYsG7ZfsOCsijcVgRagvcQVE7W3iHU8yMR10JnIGM7RSSzqhflRVpTacDW+JT62844/5FGpifmIx9ZrJrM32TGTe40Mjtw8mBvhFaS6bJSQuAKlFrcU4DEPoIWsMIUm9fjVLrTF8RvqX/J91AqrinE9UD4tO4ISOhc5MQDo4RKGEVsopkso7aPjriJ0cD9+Fss4m7V8IDYYZMnwGS9GvlGIDV9Lpae7a5DoYsVx56yheDZ7eUUC3WsLxo3l24ZoumYteEnZZiZMbL+5fvvxzGV7neS1WG53zX6tmFIdvnLEkuWqR6qDg47MOvifLiRGbtfsAarzJgey4UMkS9f6zlL5NDt6UJmERiwr0V+mC8T+2+z3IXDIyygRYyz24aCKxBXWJVx+XxUH3fJWDXb0YlsqC+SlGK4xdQccCUJyTO8t+9ksDUDrwdR5XNwyKgcWRZY7NyfNHedMNeXUVCCVKsxJI5vH9PqtlKzjTXdPyWbekeU+53OewZjRnfybXkDRYbEg==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id vh8-20020a170907d38800b00a3040040011sm180335ejc.45.2024.01.31.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:02:36 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive sfence.vma for new vmalloc mappings
Date: Wed, 31 Jan 2024 16:59:28 +0100
Message-Id: <20240131155929.169961-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_080239_294737_D0A07507 
X-CRM114-Status: GOOD (  23.64  )
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

In 6.5, we removed the vmalloc fault path because that can't work (see
[1] [2]). Then in order to make sure that new page table entries were
seen by the page table walker, we had to preventively emit a sfence.vma
on all harts [3] but this solution is very costly since it relies on IPI.

And even there, we could end up in a loop of vmalloc faults if a vmalloc
allocation is done in the IPI path (for example if it is traced, see
[4]), which could result in a kernel stack overflow.

Those preventive sfence.vma needed to be emitted because:

- if the uarch caches invalid entries, the new mapping may not be
  observed by the page table walker and an invalidation may be needed.
- if the uarch does not cache invalid entries, a reordered access
  could "miss" the new mapping and traps: in that case, we would actually
  only need to retry the access, no sfence.vma is required.

So this patch removes those preventive sfence.vma and actually handles
the possible (and unlikely) exceptions. And since the kernel stacks
mappings lie in the vmalloc area, this handling must be done very early
when the trap is taken, at the very beginning of handle_exception: this
also rules out the vmalloc allocations in the fault path.

Link: https://lore.kernel.org/linux-riscv/20230531093817.665799-1-bjorn@kernel.org/ [1]
Link: https://lore.kernel.org/linux-riscv/20230801090927.2018653-1-dylan@andestech.com [2]
Link: https://lore.kernel.org/linux-riscv/20230725132246.817726-1-alexghiti@rivosinc.com/ [3]
Link: https://lore.kernel.org/lkml/20200508144043.13893-1-joro@8bytes.org/ [4]
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cacheflush.h  | 18 +++++-
 arch/riscv/include/asm/thread_info.h |  5 ++
 arch/riscv/kernel/asm-offsets.c      |  5 ++
 arch/riscv/kernel/entry.S            | 84 ++++++++++++++++++++++++++++
 arch/riscv/mm/init.c                 |  2 +
 5 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a129dac4521d..b0d631701757 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -37,7 +37,23 @@ static inline void flush_dcache_page(struct page *page)
 	flush_icache_mm(vma->vm_mm, 0)
 
 #ifdef CONFIG_64BIT
-#define flush_cache_vmap(start, end)		flush_tlb_kernel_range(start, end)
+extern u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+extern char _end[];
+#define flush_cache_vmap flush_cache_vmap
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	if (is_vmalloc_or_module_addr((void *)start)) {
+		int i;
+
+		/*
+		 * We don't care if concurrently a cpu resets this value since
+		 * the only place this can happen is in handle_exception() where
+		 * an sfence.vma is emitted.
+		 */
+		for (i = 0; i < ARRAY_SIZE(new_vmalloc); ++i)
+			new_vmalloc[i] = -1ULL;
+	}
+}
 #define flush_cache_vmap_early(start, end)	local_flush_tlb_kernel_range(start, end)
 #endif
 
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 5d473343634b..32631acdcdd4 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -60,6 +60,11 @@ struct thread_info {
 	void			*scs_base;
 	void			*scs_sp;
 #endif
+	/*
+	 * Used in handle_exception() to save a0, a1 and a2 before knowing if we
+	 * can access the kernel stack.
+	 */
+	unsigned long		a0, a1, a2;
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..939ddc0e3c6e 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,6 +35,8 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
@@ -42,6 +44,9 @@ void asm_offsets(void)
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
+	OFFSET(TASK_TI_A0, task_struct, thread_info.a0);
+	OFFSET(TASK_TI_A1, task_struct, thread_info.a1);
+	OFFSET(TASK_TI_A2, task_struct, thread_info.a2);
 
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9d1a305d5508..c1ffaeaba7aa 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -19,6 +19,78 @@
 
 	.section .irqentry.text, "ax"
 
+.macro new_vmalloc_check
+	REG_S 	a0, TASK_TI_A0(tp)
+	REG_S 	a1, TASK_TI_A1(tp)
+	REG_S	a2, TASK_TI_A2(tp)
+
+	csrr 	a0, CSR_CAUSE
+	/* Exclude IRQs */
+	blt  	a0, zero, _new_vmalloc_restore_context
+	/* Only check new_vmalloc if we are in page/protection fault */
+	li   	a1, EXC_LOAD_PAGE_FAULT
+	beq  	a0, a1, _new_vmalloc_kernel_address
+	li   	a1, EXC_STORE_PAGE_FAULT
+	beq  	a0, a1, _new_vmalloc_kernel_address
+	li   	a1, EXC_INST_PAGE_FAULT
+	bne  	a0, a1, _new_vmalloc_restore_context
+
+_new_vmalloc_kernel_address:
+	/* Is it a kernel address? */
+	csrr 	a0, CSR_TVAL
+	bge 	a0, zero, _new_vmalloc_restore_context
+
+	/* Check if a new vmalloc mapping appeared that could explain the trap */
+
+	/*
+	 * Computes:
+	 * a0 = &new_vmalloc[BIT_WORD(cpu)]
+	 * a1 = BIT_MASK(cpu)
+	 */
+	REG_L 	a2, TASK_TI_CPU(tp)
+	/*
+	 * Compute the new_vmalloc element position:
+	 * (cpu / 64) * 8 = (cpu >> 6) << 3
+	 */
+	srli	a1, a2, 6
+	slli	a1, a1, 3
+	la	a0, new_vmalloc
+	add	a0, a0, a1
+	/*
+	 * Compute the bit position in the new_vmalloc element:
+	 * bit_pos = cpu % 64 = cpu - (cpu / 64) * 64 = cpu - (cpu >> 6) << 6
+	 * 	   = cpu - ((cpu >> 6) << 3) << 3
+	 */
+	slli	a1, a1, 3
+	sub	a1, a2, a1
+	/* Compute the "get mask": 1 << bit_pos */
+	li	a2, 1
+	sll	a1, a2, a1
+
+	/* Check the value of new_vmalloc for this cpu */
+	REG_L	a2, 0(a0)
+	and	a2, a2, a1
+	beq	a2, zero, _new_vmalloc_restore_context
+
+	/* Atomically reset the current cpu bit in new_vmalloc */
+	amoxor.w	a0, a1, (a0)
+
+	/* Only emit a sfence.vma if the uarch caches invalid entries */
+	ALTERNATIVE("sfence.vma", "nop", 0, RISCV_ISA_EXT_SVVPTC, 1)
+
+	REG_L	a0, TASK_TI_A0(tp)
+	REG_L	a1, TASK_TI_A1(tp)
+	REG_L	a2, TASK_TI_A2(tp)
+	csrw	CSR_SCRATCH, x0
+	sret
+
+_new_vmalloc_restore_context:
+	REG_L	a0, TASK_TI_A0(tp)
+	REG_L 	a1, TASK_TI_A1(tp)
+	REG_L 	a2, TASK_TI_A2(tp)
+.endm
+
+
 SYM_CODE_START(handle_exception)
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
@@ -30,6 +102,18 @@ SYM_CODE_START(handle_exception)
 
 .Lrestore_kernel_tpsp:
 	csrr tp, CSR_SCRATCH
+
+	/*
+	 * The RISC-V kernel does not eagerly emit a sfence.vma after each
+	 * new vmalloc mapping, which may result in exceptions:
+	 * - if the uarch caches invalid entries, the new mapping would not be
+	 *   observed by the page table walker and an invalidation is needed.
+	 * - if the uarch does not cache invalid entries, a reordered access
+	 *   could "miss" the new mapping and traps: in that case, we only need
+	 *   to retry the access, no sfence.vma is required.
+	 */
+	new_vmalloc_check
+
 	REG_S sp, TASK_TI_KERNEL_SP(tp)
 
 #ifdef CONFIG_VMAP_STACK
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index eafc4c2200f2..54c9fdeda11e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -36,6 +36,8 @@
 
 #include "../kernel/head.h"
 
+u64 new_vmalloc[NR_CPUS / sizeof(u64) + 1];
+
 struct kernel_mapping kernel_map __ro_after_init;
 EXPORT_SYMBOL(kernel_map);
 #ifdef CONFIG_XIP_KERNEL
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
