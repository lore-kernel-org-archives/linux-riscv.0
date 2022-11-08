Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D518C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7XNmiXcpQhFhU70anjC8k63DeIcI0TCKCSYUPj/wjY=; b=TPg9UoQpvy1NT8
	2m1d6UWrYBJfwhKfoWTDkXBiGhO8sJ03PHZJMXmXHT/5shX3Q8gSI8Kl5yERWWD+bdGk9FzTqGMrT
	Lac3iVuCTgasHcw4WNR8sJJYAJqgBwCGlf4HeG4l/ZjuTY61WIf6v8wwyuA3eBNmaRe1g8uOzywC9
	5oCwSP/5CxOyl21yvIeRphsQmIxumNHx3lzXkCBQ1Klp4LS9tp2idvzwvXPZrlPhK+VpFLrB+DDzw
	urJM0xxoT8C6FMHou2woNMWBa53pj/FuZw+6aU3xORVbCjIVEk9EJfBD5XWrIX6iXMcC2vaHkqCqa
	gvDZfcidtSwyb1VdpB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLpq-004SQ7-Em; Tue, 08 Nov 2022 10:28:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLpn-004SPG-Dv
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 10:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E68AAB819B8;
	Tue,  8 Nov 2022 10:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B151C433D6;
	Tue,  8 Nov 2022 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667903276;
	bh=XmXAMhLprGXDMRo5fiZJmyS/+wonVwXxZx5NgkKFdeM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=q8c5nrc987RX11a4APalb9zO+ZIbGbiAnje+fmuo710RL+hB5/IIzHlv+fcoxiGyf
	 nqye7T1N4JW9WqHVidOCBzTt2v9Lvf76eGGx5Nk7N6yA3Co6kHEbIu7i+fIrx2W54d
	 PIJ8NC+4VxgveAbA0txKScaMqEqMELjrh7zxRGwtmAJge1LcMBdF6L0DPFAaWOTMEs
	 4CXwpq12p5Dr8zuIy2bXamE/XA7F2dmbcW0x/chT0VYnY8r7iV6s+ryoHqNZ5FJpCH
	 eU83U7pvZ07c4tQJw7IzAM9nIgiBu3HBVZc+mut/GJ5e/KV9FLzm0pmh1GsNY32V4u
	 qgMJiNYRgDaRg==
Date: Tue, 08 Nov 2022 10:27:51 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, guoren@kernel.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 heiko@sntech.de, philipp.tomsich@vrull.eu
CC: linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_riscv=3A_asid=3A_Fixup_?= =?US-ASCII?Q?stale_TLB_entry_cause_application_crash?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221108102044.3317793-1-guoren@kernel.org>
References: <20221108102044.3317793-1-guoren@kernel.org>
Message-ID: <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_022759_768967_1FFDD962 
X-CRM114-Status: GOOD (  14.08  )
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



On 8 November 2022 10:20:44 GMT, guoren@kernel.org wrote:
>From: Guo Ren <guoren@linux.alibaba.com>
>
>After use_asid_allocator enabled, the userspace application will
>crash for stale tlb entry. Because only using cpumask_clear_cpu without
>local_flush_tlb_all couldn't guarantee CPU's tlb entries fresh. Then
>set_mm_asid would cause user space application get a stale value by
>the stale tlb entry, but set_mm_noasid is okay.
>
>Here is the symptom of the bug:
>unhandled signal 11 code 0x1 (coredump)
>   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
>   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
>=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
>(gdb) i r s0
>s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
>(gdb) x/16 0x3fd6d92490
>0x3fd6d92490:   0xd80ac8a8      0x0000003f
>The core dump file shows that the value of register s0 is wrong, but the
>value in memory is right. This is because 'ld s0, -148(s0)' use a stale
>mapping entry in TLB and got a wrong value from a stale physical
>address.
>
>When task run on CPU0, the task loaded/speculative-loaded the value of
>address(0x3fd6d92490), and the first version of tlb mapping entry was
>PTWed into CPU0's tlb.
>When the task switched from CPU0 to CPU1 without local_tlb_flush_all
>(because of asid), the task happened to write a value on address
>(0x3fd6d92490). It caused do_page_fault -> wp_page_copy ->
>ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
>The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need
>tlb flush, but CPU0 had cleared the CPU0's mm_cpumask in previous switch_mm.
>So we only flushed the CPU1 tlb, and setted second version mapping
>of the pte. When the task switch from CPU1 to CPU0 again, CPU0 still used a
>stale tlb mapping entry which contained a wrong target physical address.
>When the task happened to read that value, the bug would be raised.
>
>Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
>Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>Signed-off-by: Guo Ren <guoren@kernel.org>
>Cc: Anup Patel <apatel@ventanamicro.com>
>Cc: Palmer Dabbelt <palmer@rivosinc.com>
>---
> arch/riscv/mm/context.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
>index 7acbfbd14557..8ad6c2493e93 100644
>--- a/arch/riscv/mm/context.c
>+++ b/arch/riscv/mm/context.c
>@@ -317,7 +317,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> 	 */
> 	cpu = smp_processor_id();
> 
>-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
>+	if (!static_branch_unlikely(&use_asid_allocator))
>+		cpumask_clear_cpu(cpu, mm_cpumask(prev));
>+
> 	cpumask_set_cpu(cpu, mm_cpumask(next));
> 
> 	set_mm(next, cpu);

This is a completely different patch to what you already sent. Why have you marked it RESEND rather than v2?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
