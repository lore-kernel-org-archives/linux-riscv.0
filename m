Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05AAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFbO+3t2yRPfiJgt/92UGqn5fUin3hAOgaqXqrC/qYA=; b=cgjdVrYsoO4rBb
	YMCyVR760KmH2MXt47INCXGuXIzWnufJt5uCKS6RNx41BpLvfDNPvKLOYPXjyumslrndwcILF4a64
	2Ry6N8m4Udq1HztIcZRbczkywTrNaK02cXDx+iGhiEZVdmeENwQlDk+SgGHlMxhvBjerXCoM1RrkQ
	9ezyZsq+L4XjH6zOMNevMiOLrHl2LAV+DMd9WsrOGD6QvCkDmt1VvMiZD6PBdM1iz7yKzJHHKqDSm
	9/KRP40rhoWBFVUtXV04mln5S3CkPzXgNcfAohmqwrGDBPur3lzKRbE20T/+qAZpSCA89wGK+l5Kv
	uWakGvraM/HgCFIV1Saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPVV-005udh-HD; Tue, 08 Nov 2022 14:23:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osPVS-005ucg-M4
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 14:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667917394; x=1699453394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SDqeLciWvzE6LO/FhpYnUJs3+XSv10TJPui7BgZgG80=;
  b=h92xIZcEKjAmD+6YxfD9ry62Z8KA5aXnZ6WoSW/B9jV7cPCoaaSW2XbV
   MAOqraJA6OH2Rag33jEzl90yxCJypobU5yWo0u8Hbft2x6j/vT2leNmg8
   9pZj3f4LgTlrXZO5BRhvHx9DW1oW0UUz9xoKCAo6l0RsNdHzpO/zEBfGo
   yqm0cE7tBGfdhiO3M7AGPLVLGvInDMEfPdZmmcOZmYfJBYDGUuVY6buEs
   LGB+s1oqvxhhDK4zlqoN30YnUj6x4HzL+3kZjZfYt41cRGwPi5VYQr60h
   hNLef16qkvoXF7n+OnHzrAh2MnZtb8JIjmBxQmiRl1DXJZcDJ1EDBaEB1
   A==;
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; 
   d="scan'208";a="185920740"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 07:23:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 07:23:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 07:23:01 -0700
Date: Tue, 8 Nov 2022 14:22:45 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <guoren@kernel.org>,
	<anup@brainfault.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<heiko@sntech.de>, <philipp.tomsich@vrull.eu>,
	<linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, Anup
 Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH RESEND] riscv: asid: Fixup stale TLB entry cause
 application crash
Message-ID: <Y2pmNUBocENfS4uK@wendy>
References: <20221108102044.3317793-1-guoren@kernel.org>
 <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D91557B5-7E60-4A29-8669-34FF42454F8C@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_062314_812472_8E17708B 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, Nov 08, 2022 at 10:27:51AM +0000, Conor Dooley wrote:
> 
> 
> On 8 November 2022 10:20:44 GMT, guoren@kernel.org wrote:
> >From: Guo Ren <guoren@linux.alibaba.com>
> >
> >After use_asid_allocator enabled, the userspace application will
> >crash for stale tlb entry. Because only using cpumask_clear_cpu without
> >local_flush_tlb_all couldn't guarantee CPU's tlb entries fresh. Then
> >set_mm_asid would cause user space application get a stale value by
> >the stale tlb entry, but set_mm_noasid is okay.
> >
> >Here is the symptom of the bug:
> >unhandled signal 11 code 0x1 (coredump)
> >   0x0000003fd6d22524 <+4>:     auipc   s0,0x70
> >   0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> >=> 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> >(gdb) i r s0
> >s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> >(gdb) x/16 0x3fd6d92490
> >0x3fd6d92490:   0xd80ac8a8      0x0000003f
> >The core dump file shows that the value of register s0 is wrong, but the
> >value in memory is right. This is because 'ld s0, -148(s0)' use a stale
> >mapping entry in TLB and got a wrong value from a stale physical
> >address.
> >
> >When task run on CPU0, the task loaded/speculative-loaded the value of
> >address(0x3fd6d92490), and the first version of tlb mapping entry was
> >PTWed into CPU0's tlb.
> >When the task switched from CPU0 to CPU1 without local_tlb_flush_all
> >(because of asid), the task happened to write a value on address
> >(0x3fd6d92490). It caused do_page_fault -> wp_page_copy ->
> >ptep_clear_flush -> ptep_get_and_clear & flush_tlb_page.
> >The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need
> >tlb flush, but CPU0 had cleared the CPU0's mm_cpumask in previous switch_mm.
> >So we only flushed the CPU1 tlb, and setted second version mapping
> >of the pte. When the task switch from CPU1 to CPU0 again, CPU0 still used a
> >stale tlb mapping entry which contained a wrong target physical address.
> >When the task happened to read that value, the bug would be raised.
> >
> >Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> >Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> >Signed-off-by: Guo Ren <guoren@kernel.org>
> >Cc: Anup Patel <apatel@ventanamicro.com>
> >Cc: Palmer Dabbelt <palmer@rivosinc.com>
> >---
> > arch/riscv/mm/context.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> >
> >diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> >index 7acbfbd14557..8ad6c2493e93 100644
> >--- a/arch/riscv/mm/context.c
> >+++ b/arch/riscv/mm/context.c
> >@@ -317,7 +317,9 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> > 	 */
> > 	cpu = smp_processor_id();
> > 
> >-	cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >+	if (!static_branch_unlikely(&use_asid_allocator))
> >+		cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >+
> > 	cpumask_set_cpu(cpu, mm_cpumask(next));
> > 
> > 	set_mm(next, cpu);
> 
> This is a completely different patch to what you already sent.
> Why have you marked it RESEND rather than v2?

In addition, it seems to break the build for the nommu defconfigs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
