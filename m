Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C4CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RBs9dbH6GnB7LGECnT5mAsw1c79Hv1GZ09svWz5T0iw=; b=ncpeNEZ8HkvEol
	44/7wR0NNVxS5TtwOSXiXl7j4xvUdRO/+EU+ChKc/oAAQPmvmrf6XGduPatHx+L30yLUlD4WpZxe0
	aJZX/idC0coVnR6VAUwx21vu/PnkFBFRQvk8+fuYMZF5+sSCzrfFcojlb6XDAUxh+t+vmW89njArk
	kw8X9FfCuk3FxzNeegoi2mHOVXLLMq9F1VH2V8QwdIyCgLcKW5UGWRgShXiqacotEjCR1AgRXxVZF
	MosogaUxqIIJHVfJmBdimYRIfgKwdWBAHUSB4mTt8d0sxO548GN0AoDzPvWnq/xHZjCODH8Ob+fl9
	/o5Bd8q1ZabAC7Kph5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKV5-003tq0-BF; Tue, 08 Nov 2022 09:02:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osKV2-003tQE-Qs
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 09:02:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7F81614C4;
	Tue,  8 Nov 2022 09:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E7C433C1;
	Tue,  8 Nov 2022 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667898147;
	bh=40as9zy58r8i/rJfR7Z6TRRJsKNmmDmW8cmLv1ORktE=;
	h=From:To:Cc:Subject:Date:From;
	b=pkfJDph7m26p588lRvKtcu20kjCZlELls26LoNAh2HMA5oPn4okhu+02A9B5HV3wA
	 B6jM2Tx5CPm9N/P5lhalCJiQt42kptl2J5hRuWT6HjMUqjW08sO3Em22n0jZyCU3gJ
	 3y9HFKaL+e090LM91K1PI1j8enY9F0ucXaXMlQ25o6WheVnYeHLtcWhY9C7SyVvLV3
	 T5jrQqwTCPLZXTF3Ul4a7NHJKrq3Wu5wN/ILrFsxine91hKQh6vZkmLS5IKP41nWYk
	 0BcrifcoSpgRNaQ4cHm2cr3ey405LJ8I60X1f5QlJcKSat60uEUcgeT/9qfz17kjmd
	 95rwf8jqrAZfA==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexandre.ghiti@canonical.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	philipp.tomsich@vrull.eu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] riscv: asid: Fixup stale TLB entry cause application crash
Date: Tue,  8 Nov 2022 04:02:19 -0500
Message-Id: <20221108090219.3285030-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_010228_940650_E3132182 
X-CRM114-Status: GOOD (  13.65  )
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

When use_asid_allocator is enabled, the userspace application would
crash by stale tlb entry. Because only using cpumask_clear_cpu without
local_flush_tlb_all couldn't guarantee CPU's tlb contains fresh mapping
entry. Then set_mm_asid would cause user space application get a stale
value by stale tlb entry, but set_mm_noasid is okay.

Here is the symptom of the bug:
unhandled signal 11 code 0x1 (coredump)
   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
(gdb) i r s0
s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
(gdb) x/16 0x3fd6d92490
0x3fd6d92490:   0xd80ac8a8      0x0000003f
The core dump file show us the value of register s0 is wrong, but the
value in memory is right.

When task run on CPU0, the task loaded/speculative-loaded the value of
address-0x3fd6d92490, the first version tlb mapping enter in CPU0's tlb.
When the task switched from CPU0 to CPU1 without local_tlb_flush_all
(because of asid), the task happened to write a value on address:
0x3fd6d92490 that caused do_page_fault -> wp_page_copy ->
ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
The flush_tlb_page would use mm_cpumask(mm) to determine which CPUs need
tlb flush, but CPU0 cleared the CPU0's mm_cpumask in previous switch_mm.
So we only flushed the CPU1's tlb entry, and setted second version mapping
of the pte. When the task switch from CPU1 to CPU0 again, it still used a
stale tlb entry on CPU0 which contained a wrong target physical address.
When the task happened to read that value, the bug would be raised.

Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/context.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..843e86b63532 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -317,7 +317,6 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpu = smp_processor_id();
 
-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
 	cpumask_set_cpu(cpu, mm_cpumask(next));
 
 	set_mm(next, cpu);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
