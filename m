Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 05:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qnhkt+FU+sv7Gh14xIkqJAKSgTbEKWasIV8QOk4vz4E=; b=X/v6lilQ45ZM6k
	9GTjPXhJJC2+o+wXi8wQdH9BRypuqbX1szKrZYR88o7/UmgVBWTvU9XydJYfhvBHJq9AK0fRQNALl
	BRMhTHcoUjxLHwkqhH/epzh/VekzXIOHjL9ztwYaq6LbNJP5lLXv2kKnUBVXIKg9Mhlla4BvQWAKJ
	aemv8+939/t0yne1Whai+090Dv0SjD/D66EI+PPoCUBzfI8oGUVqQKWwmBMkIQnBwDXP4X2ALiHgA
	e+/iCNs5fhJw9kF2EKZQzp5kurEhgndl+2jYkl23LrIFlnJlZIE96J6bYQfFBf1gLW8c8Sj3ekK7T
	TD8xJqUysQCryA7L55jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osdpu-00AyE8-4w; Wed, 09 Nov 2022 05:41:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osdpr-00AyDR-K6
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 05:41:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7C33ACE1D11;
	Wed,  9 Nov 2022 05:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFE4C433D6;
	Wed,  9 Nov 2022 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667972468;
	bh=NcYwem+RG7CdaZySwWGMcxlQ4IDXuYGi+05zOMk3sqU=;
	h=From:To:Cc:Subject:Date:From;
	b=A6Aw7vrV1Qw79HjJWSBXybgU6SvB/JtjMlUsZDpNHtY2LEdXNSvGuJLFtGYcHGhEc
	 aC3iMHT0hGIFvCiuBfXC9IkSOz8qFt93aDlipKpAM7d66Ly9Tx+3YlbcgZgmSYVmXw
	 bp0M4sKs68iWYMdt6nRy9Y+7ffGBggcwDA/eqKNzTX1n5u9htXGntKqR8BxnCZ7TFx
	 /eXUZwdqqzEXY0uwdZd0g004hvGz34Z6sHwIUmbQUINoITLqWHZqfFxLvDnwOwe2z/
	 /2RC24tKCtWD0jizM/3zT3YMU1oC1uE00dAqSEjtUkisUc3t1sw3Tg84vupN8VMloy
	 h+uxN54KsUmhw==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	philipp.tomsich@vrull.eu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH V2] riscv: asid: Fixup stale TLB entry cause application crash
Date: Wed,  9 Nov 2022 00:40:56 -0500
Message-Id: <20221109054056.3618089-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_214116_225079_B929CE15 
X-CRM114-Status: GOOD (  16.35  )
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

The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
which could prevent losing pieces of stuff during TLB flush.

Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
Changes in v2:
 - Fixup nommu compile problem (Thx Conor, Also Reported-by: kernel
   test robot <lkp@intel.com>)
 - Keep cpumask_clear_cpu for noasid
---
 arch/riscv/mm/context.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..f58e4b211595 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -317,7 +317,11 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpu = smp_processor_id();
 
-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
+#ifdef CONFIG_MMU
+	if (!static_branch_unlikely(&use_asid_allocator))
+#endif
+		cpumask_clear_cpu(cpu, mm_cpumask(prev));
+
 	cpumask_set_cpu(cpu, mm_cpumask(next));
 
 	set_mm(next, cpu);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
