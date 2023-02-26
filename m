Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D44C6FA8E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAlYPI/1GBO/CyFI2h5ZbG5QcACxQrRppg8/DAA73Ng=; b=BmVxMb7LpHR4Gc
	KJdCLKU8Si+IpX9ilxo3jQg+TWDLvH9c/HvpoesuA99+xIJigib7yaaGsohRZ8iRFj+kHthi2BZV3
	2UyFS1nCR4dqGW1eyJ1weYo8UfKzyqhVHeShRjdhuexQWBRPAYs00iWiNy6lKKgpW+K1ziRXLB/pS
	1HOU7QrsUJrNbXTfIJ7jokqlVT3jTpvCgw9XZeC+RyruI88awqTirskWNrais0PfIk1zyGR++OP0R
	WmFzilR5Q0FcnqTZVYB43ARcHetT1X3JAbXKYBF1BZ5zRMnObC/yflo7H527UzfaSgkjNW4pLIvj4
	J5vtzmR8erFBVEfihomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXY-007Uhi-Kh; Sun, 26 Feb 2023 15:02:16 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWIXU-007Ufj-4P
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 15:02:14 +0000
Received: by mail-lf1-x12c.google.com with SMTP id m7so5314760lfj.8
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 07:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjb1YqsDLTS2qdiYT2rZwNeNUUk92H+uK9H4KlMN7d4=;
        b=UqGnFzGUT4B52Z6de7bV3co9AFBtft9IX+FQgcyCYLkPF5/L/CxpuFahqEpBC4cQlI
         HtUXDnbOKS2hwSyupY9HIp3zlHS9+yDzV3F9Vws2L32p/poly+yLETWJqZgz4RivuFmF
         Oyz3/qHFaEVJCRKTWPFTKZFTP7Dtex/g/jDLH0gaYU1bWxq6kJAQQFReu89rYKLHCZ7n
         f3JKrDu9WB+OaAz/ImVKv0CdcRvaiTp3HKBgWBftfactclQYMH0D+AlX+8G63anp1sJa
         r9e1L01yTD2L8Mt9xWHXWK8vLvb6ZnU48oYEE5FhECbeVyKps4B2TUi6/sfzG6b+8Nff
         PLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mjb1YqsDLTS2qdiYT2rZwNeNUUk92H+uK9H4KlMN7d4=;
        b=wGYaJDmLmMXy3f5E1hBCSYKZwTV+EZHaISj/jtBgH/kLVipc9RKcQ3l8gj32FN5egU
         pPXvX7Gln9Gcpr/Bsfn21KWT04HvHaeIkSTRzjjb8Rr5klFfz8iCSMFCH88YbDWRO0IV
         UOKHnINGEMKYkX/EhazXsoJlNcwgQ0ysAl/z53hSBaxulfEH4HjkftiYEBIpRN1m4G2V
         CcY7ONSi9ynD1htIu7hY5LbIU5XRXu8iL1Dr5MhjXMHdP3CITisYfUQfUgb4R9MAIRu0
         scnJE+npSKb+s61ub4ys/80hTjP5Ls+nXw36y8kreuzq5JoBotH0vwdDy6jqZLvhd+zh
         errw==
X-Gm-Message-State: AO0yUKV1wqsK98CyDd67v8YWSG2aUQyGZeGoGQC4CVH7HTAdhOUhLq/i
	4G/XBUz8cUe0c4EM3aKlKEzrB4fCuU6Adx/Xg2g=
X-Google-Smtp-Source: AK7set8+8r3q+FXjO+JZWpxyQEJ8dKuL+74eP8szhnLyjEsLJVQ8yaU2Y3Xg/qAQejpcCyZyuBw12A==
X-Received: by 2002:a05:6512:244:b0:4d8:5e8e:b138 with SMTP id b4-20020a056512024400b004d85e8eb138mr7193205lfo.14.1677423723351;
        Sun, 26 Feb 2023 07:02:03 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id z7-20020ac25de7000000b004db44dfd888sm580715lfq.30.2023.02.26.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 07:02:02 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Zong Li <zong.li@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] riscv: asid: Fixup stale TLB entry cause application crash
Date: Sun, 26 Feb 2023 18:01:37 +0300
Message-Id: <20230226150137.1919750-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230226150137.1919750-1-geomatsi@gmail.com>
References: <20230226150137.1919750-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_070212_220722_05C4B7C7 
X-CRM114-Status: GOOD (  21.26  )
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

From: Guo Ren <guoren@linux.alibaba.com>

After use_asid_allocator is enabled, the userspace application will
crash by stale TLB entries. Because only using cpumask_clear_cpu without
local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
Then set_mm_asid would cause the user space application to get a stale
value by stale TLB entry, but set_mm_noasid is okay.

Here is the symptom of the bug:
unhandled signal 11 code 0x1 (coredump)
   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
(gdb) i r s0
s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
(gdb) x /2x 0x3fd6d92490
0x3fd6d92490:   0xd80ac8a8      0x0000003f
The core dump file shows that register s0 is wrong, but the value in
memory is correct. Because 'ld s0, -148(s0)' used a stale mapping entry
in TLB and got a wrong result from an incorrect physical address.

When the task ran on CPU0, which loaded/speculative-loaded the value of
address(0x3fd6d92490), then the first version of the mapping entry was
PTWed into CPU0's TLB.
When the task switched from CPU0 to CPU1 (No local_tlb_flush_all here by
asid), it happened to write a value on the address (0x3fd6d92490). It
caused do_page_fault -> wp_page_copy -> ptep_clear_flush ->
ptep_get_and_clear & flush_tlb_page.
The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need TLB
flush, but CPU0 had cleared the CPU0's mm_cpumask in the previous
switch_mm. So we only flushed the CPU1 TLB and set the second version
mapping of the PTE. When the task switched from CPU1 to CPU0 again, CPU0
still used a stale TLB mapping entry which contained a wrong target
physical address. It raised a bug when the task happened to read that
value.

   CPU0                               CPU1
   - switch 'task' in
   - read addr (Fill stale mapping
     entry into TLB)
   - switch 'task' out (no tlb_flush)
                                      - switch 'task' in (no tlb_flush)
                                      - write addr cause pagefault
                                        do_page_fault() (change to
                                        new addr mapping)
                                          wp_page_copy()
                                            ptep_clear_flush()
                                              ptep_get_and_clear()
                                              & flush_tlb_page()
                                        write new value into addr
                                      - switch 'task' out (no tlb_flush)
   - switch 'task' in (no tlb_flush)
   - read addr again (Use stale
     mapping entry in TLB)
     get wrong value from old phyical
     addr, BUG!

The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
which could guarantee to invalidate all stale TLB entries during TLB
flush.

Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Zong Li <zong.li@sifive.com>
Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: stable@vger.kernel.org

---
 arch/riscv/mm/context.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..0f784e3d307b 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -205,12 +205,24 @@ static void set_mm_noasid(struct mm_struct *mm)
 	local_flush_tlb_all();
 }
 
-static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
+static inline void set_mm(struct mm_struct *prev,
+			  struct mm_struct *next, unsigned int cpu)
 {
-	if (static_branch_unlikely(&use_asid_allocator))
-		set_mm_asid(mm, cpu);
-	else
-		set_mm_noasid(mm);
+	/*
+	 * The mm_cpumask indicates which harts' TLBs contain the virtual
+	 * address mapping of the mm. Compared to noasid, using asid
+	 * can't guarantee that stale TLB entries are invalidated because
+	 * the asid mechanism wouldn't flush TLB for every switch_mm for
+	 * performance. So when using asid, keep all CPUs footmarks in
+	 * cpumask() until mm reset.
+	 */
+	cpumask_set_cpu(cpu, mm_cpumask(next));
+	if (static_branch_unlikely(&use_asid_allocator)) {
+		set_mm_asid(next, cpu);
+	} else {
+		cpumask_clear_cpu(cpu, mm_cpumask(prev));
+		set_mm_noasid(next);
+	}
 }
 
 static int __init asids_init(void)
@@ -264,7 +276,8 @@ static int __init asids_init(void)
 }
 early_initcall(asids_init);
 #else
-static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
+static inline void set_mm(struct mm_struct *prev,
+			  struct mm_struct *next, unsigned int cpu)
 {
 	/* Nothing to do here when there is no MMU */
 }
@@ -317,10 +330,7 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpu = smp_processor_id();
 
-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
-	cpumask_set_cpu(cpu, mm_cpumask(next));
-
-	set_mm(next, cpu);
+	set_mm(prev, next, cpu);
 
 	flush_icache_deferred(next, cpu);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
