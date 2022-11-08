Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B86C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 10:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Mn5C58wbnyVeUVCr1dCRgvMoKHay1WBj/EOkF1RX1Y=; b=zIyksoMWo+tyg+
	5CwRcnUYZWIOOhEOqf/4/La9iufsU3YEsp2VCQMn/VmyGsNRp3dzt7vtumdiQCUacrmAsILTOj1tg
	O9ZMWRLhy4Alhf60QKILKacnoGPYgh6FOFFSDYFs6sFKvH5xLyhlqdhuPT5ar9glQ+lRQT/I3Lpz3
	8XgjyoNHn5aamBeCRIdbCmiqpWmEMICD1S9Bce90TcUESRa0rnIBbfxF9GqTduuqYAIq7L2pGWkWA
	ZUMHf0P1r2Eu0iUL9kLFp1HT5aZvhT9dKORnAaV8AFMQthN0B2bD+12hZ3Wu0+I5QlqbnTMk9VKVm
	cF2Lb9puqO/fLYgqE1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLj2-004R4A-DG; Tue, 08 Nov 2022 10:21:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLiz-004R3W-Sx
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 10:20:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB617614DE;
	Tue,  8 Nov 2022 10:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60360C433D6;
	Tue,  8 Nov 2022 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667902854;
	bh=F/nbJavY2ngyv2qilaghZTRYq7104XTI4SbSBrKfj6A=;
	h=From:To:Cc:Subject:Date:From;
	b=Vv2jY7ePU9EU+XlBjjUeNuBt5yQSJOzSP/YPK7SREsFQis+UviJOQbecC/xfk84/C
	 SDNd3+tEafVEd3BNGlCAmLsS/URxu1YJPSeBz5qNio0yggJDeLt4enGuXQammItIy5
	 p3cBEbPhi10OXvzBJJNeMvhTJHmNQ5dXaTGpQrlswdxaoGurbudiCiFO0f5g96x1Dp
	 +susVOPCtC5aqyFbVA57huKXFTJ1YuwPZzcvbZQJpLJxzz8mgrZzkz5pMWQPrNngEN
	 wL3RcyDHpMNCrK5WX8whHqCRVS1BE69i41nKqBWZlf9UNo1u9WR20SMUowOq9IR8P/
	 366T4Qs0iYubw==
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
Subject: [PATCH RESEND] riscv: asid: Fixup stale TLB entry cause application crash
Date: Tue,  8 Nov 2022 05:20:44 -0500
Message-Id: <20221108102044.3317793-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_022058_040257_6CF48E1E 
X-CRM114-Status: GOOD (  14.91  )
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

After use_asid_allocator enabled, the userspace application will
crash for stale tlb entry. Because only using cpumask_clear_cpu without
local_flush_tlb_all couldn't guarantee CPU's tlb entries fresh. Then
set_mm_asid would cause user space application get a stale value by
the stale tlb entry, but set_mm_noasid is okay.

Here is the symptom of the bug:
unhandled signal 11 code 0x1 (coredump)
   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
(gdb) i r s0
s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
(gdb) x/16 0x3fd6d92490
0x3fd6d92490:   0xd80ac8a8      0x0000003f
The core dump file shows that the value of register s0 is wrong, but the
value in memory is right. This is because 'ld s0, -148(s0)' use a stale
mapping entry in TLB and got a wrong value from a stale physical
address.

When task run on CPU0, the task loaded/speculative-loaded the value of
address(0x3fd6d92490), and the first version of tlb mapping entry was
PTWed into CPU0's tlb.
When the task switched from CPU0 to CPU1 without local_tlb_flush_all
(because of asid), the task happened to write a value on address
(0x3fd6d92490). It caused do_page_fault -> wp_page_copy ->
ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need
tlb flush, but CPU0 had cleared the CPU0's mm_cpumask in previous switch_mm.
So we only flushed the CPU1 tlb, and setted second version mapping
of the pte. When the task switch from CPU1 to CPU0 again, CPU0 still used a
stale tlb mapping entry which contained a wrong target physical address.
When the task happened to read that value, the bug would be raised.

Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/context.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..8ad6c2493e93 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -317,7 +317,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	 */
 	cpu = smp_processor_id();
 
-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
+	if (!static_branch_unlikely(&use_asid_allocator))
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
