Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3528AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKqnyNXrN7IO3xjZkLvI7RgFN7aKalaLS00q2ZgEcFY=; b=fpSbbRXvCUzWC/
	zl+8K9yDEtQ+zjgTJGZF73Nu1LUPEPJ+4L6lLyz/Cyumk69upOmMi1D4kk3Jr5SW1lJ51kvNlahG+
	Ek4PSrCP8CxOk3rPITKc0mQY+tr5SpZMFrOXO3gzXJLm5ypvhJoZkdlZyHa2yqaocjUrtKjWwo6I2
	9gHp1x52z7kz8zAGngnaHd91wszpVEzqsBhtha4pJGsvMryDrm/CCldTj2v5RNlKjzVgmq5kMI7dc
	t0sP0eyK2U+5IoPtIwYYxLPBOmVP3orCVxDAV+nk9CNxDf2wThpdOTQT3akqtbyFGnSTYyTYe9Uj9
	rEp+aaaIiGDks9qvbrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQ5z-004NYq-1d;
	Mon, 17 Jul 2023 15:25:07 +0000
Received: from m1340.mail.163.com ([220.181.13.40])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTdd-007bzH-1e
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kkZ9RjR7KQKJrM1KYMvj+FXbCavvmVv0K3K41WkQlag=; b=K
	Oae8Z7TYJZLw0zBGtoGX8QlWVRMvewvs9I93wcXNrwPOLiRV45WHCiKxqVPB6jEp
	owLue/BEfiCTTIfkytTzzrowdjgHoLWUirBn8DS1YTc8OGGRP+IIxE9Px0FMiuy+
	dVnYWD+ttNLxSx/FyUK0p5hDHwgIpzr9c43NYalkro=
Received: from xingxg2008$163.com ( [221.218.137.29] ) by
 ajax-webmail-wmsvr40 (Coremail) ; Sat, 15 Jul 2023 08:59:32 +0800 (CST)
X-Originating-IP: [221.218.137.29]
Date: Sat, 15 Jul 2023 08:59:32 +0800 (CST)
From: xingxg2008  <xingxg2008@163.com>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, paul.walmsley@sifive.com, zong.li@sifive.com, 
	atishp@atishpatra.org, alex@ghiti.fr, jszhang@kernel.org, 
	bjorn@kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	"Guo Ren" <guoren@linux.alibaba.com>, 
	"Alexandre Ghiti" <alexghiti@rivosinc.com>
Subject: Re:[PATCH V4] riscv: kexec: Fixup synchronization problem between
 init_mm and active_mm
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <20230714103659.3146949-1-guoren@kernel.org>
References: <20230714103659.3146949-1-guoren@kernel.org>
X-NTES-SC: AL_QuyTC/+TvU8s5CScbOkXmUcahe83XMKzuPsm3o9SPZE0gink4CQqd31DGlzJwsGUMji2shq6YAhk9spDZbdUQZjRdzE5JbEfzzBDQn1lL58r
MIME-Version: 1.0
Message-ID: <6b766b2b.2e5.189570f5ee6.Coremail.xingxg2008@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: KMGowADHCmZ077FkZVEDAA--.26192W
X-CM-SenderInfo: p0lqw5bjsqimi6rwjhhfrp/xtbBbBStM1c7PxAewQAAs6
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175957_930096_C37CA467 
X-CRM114-Status: GOOD (  17.12  )
X-Mailman-Approved-At: Mon, 17 Jul 2023 08:25:05 -0700
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


Tested-by: Xing Xiaoguang <xingxg2008@163.com>

The patch works fine on Linux 6.5-RC1 which runs on SOPHGO
SG2042 EVB that has 64 RISC-V cores.




At 2023-07-14 18:36:59, guoren@kernel.org wrote:
>From: Guo Ren <guoren@linux.alibaba.com>
>
>The machine_kexec() uses set_memory_x to modify the direct mapping
>attributes from RW to RWX. The current implementation of set_memory_x
>does not split hugepages in the linear mapping and then when a PGD
>mapping is used, the whole PGD is marked as executable. But changing
>the permissions at the PGD level must be propagated to all the page
>tables. When kexec jumps into control_buffer, the instruction page
>fault happens, and there is no minor_pagefault for it, then panic.
>
>The bug is found on an MMU_sv39 machine, and the direct mapping used a
>1GB PUD, the pgd entries. Here is the bug output:
>
> kexec_core: Starting new kernel
> Will call new kernel at 00300000 from hart id 0
> FDT image at 747c7000
> Bye...
> Unable to handle kernel paging request at virtual address ffffffda23b0d000
> Oops [#1]
> Modules linked in:
> CPU: 0 PID: 53 Comm: uinit Not tainted 6.4.0-rc6 #15
> Hardware name: Sophgo Mango (DT)
> epc : 0xffffffda23b0d000
>  ra : machine_kexec+0xa6/0xb0
> epc : ffffffda23b0d000 ra : ffffffff80008272 sp : ffffffc80c173d10
>  gp : ffffffff8150e1e0 tp : ffffffd9073d2c40 t0 : 0000000000000000
>  t1 : 0000000000000042 t2 : 6567616d69205444 s0 : ffffffc80c173d50
>  s1 : ffffffd9076c4800 a0 : ffffffd9076c4800 a1 : 0000000000300000
>  a2 : 00000000747c7000 a3 : 0000000000000000 a4 : ffffffd800000000
>  a5 : 0000000000000000 a6 : ffffffd903619c40 a7 : ffffffffffffffff
>  s2 : ffffffda23b0d000 s3 : 0000000000300000 s4 : 00000000747c7000
>  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
>  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
>  s11: 0000003f940001a0 t3 : ffffffff815351af t4 : ffffffff815351af
>  t5 : ffffffff815351b0 t6 : ffffffc80c173b50
> status: 0000000200000100 badaddr: ffffffda23b0d000 cause: 000000000000000c
>
>Given the current flaw in the set_memory_x implementation, the simplest
>solution is to fix machine_kexec() to remap control code page outside
>the linear mapping. Because the control code buffer was moved from the
>direct mapping area to the vmalloc location, we need an additional
>va_va_offset to fix up va_pa_offset.
>
>Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>Reported-by: Xing XiaoGuang <xingxg2008@163.com>
>Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>Signed-off-by: Guo Ren <guoren@kernel.org>
>---
>Changelog:
>V4:
> - Fixup va_pa_offset with additional va_va_offset.
> - Add Reported-by tag.
>
>V3:
> - Resume set_memory_x to set the _PAGE_EXEC attribute
> - Optimize the commit log with Alexandre advice
>
>V2:
> - Use vm_map_ram instead of modifying set_memory_x
> - Correct Fixes tag
>---
> arch/riscv/include/asm/kexec.h    |  1 +
> arch/riscv/kernel/machine_kexec.c | 18 +++++++++++++++---
> 2 files changed, 16 insertions(+), 3 deletions(-)
>
>diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
>index 2b56769cb530..17456e91476e 100644
>--- a/arch/riscv/include/asm/kexec.h
>+++ b/arch/riscv/include/asm/kexec.h
>@@ -41,6 +41,7 @@ crash_setup_regs(struct pt_regs *newregs,
> struct kimage_arch {
> 	void *fdt; /* For CONFIG_KEXEC_FILE */
> 	unsigned long fdt_addr;
>+	void *control_code_buffer;
> };
> 
> extern const unsigned char riscv_kexec_relocate[];
>diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>index 2d139b724bc8..60c1ef3c2232 100644
>--- a/arch/riscv/kernel/machine_kexec.c
>+++ b/arch/riscv/kernel/machine_kexec.c
>@@ -86,7 +86,14 @@ machine_kexec_prepare(struct kimage *image)
> 
> 	/* Copy the assembler code for relocation to the control page */
> 	if (image->type != KEXEC_TYPE_CRASH) {
>-		control_code_buffer = page_address(image->control_code_page);
>+		control_code_buffer = vm_map_ram(&image->control_code_page,
>+						 KEXEC_CONTROL_PAGE_SIZE/PAGE_SIZE,
>+						 NUMA_NO_NODE);
>+		if (control_code_buffer == NULL) {
>+			pr_err("Failed to vm_map control page\n");
>+			return -ENOMEM;
>+		}
>+
> 		control_code_buffer_sz = page_size(image->control_code_page);
> 
> 		if (unlikely(riscv_kexec_relocate_size > control_code_buffer_sz)) {
>@@ -99,6 +106,8 @@ machine_kexec_prepare(struct kimage *image)
> 
> 		/* Mark the control page executable */
> 		set_memory_x((unsigned long) control_code_buffer, 1);
>+
>+		internal->control_code_buffer = control_code_buffer;
> 	}
> 
> 	return 0;
>@@ -211,7 +220,10 @@ machine_kexec(struct kimage *image)
> 	unsigned long this_cpu_id = __smp_processor_id();
> 	unsigned long this_hart_id = cpuid_to_hartid_map(this_cpu_id);
> 	unsigned long fdt_addr = internal->fdt_addr;
>-	void *control_code_buffer = page_address(image->control_code_page);
>+	void *control_code_buffer = internal->control_code_buffer;
>+	unsigned long va_va_offset =
>+			(unsigned long) page_address(image->control_code_page)
>+		      - (unsigned long) control_code_buffer;
> 	riscv_kexec_method kexec_method = NULL;
> 
> #ifdef CONFIG_SMP
>@@ -234,6 +246,6 @@ machine_kexec(struct kimage *image)
> 	/* Jump to the relocation code */
> 	pr_notice("Bye...\n");
> 	kexec_method(first_ind_entry, jump_addr, fdt_addr,
>-		     this_hart_id, kernel_map.va_pa_offset);
>+		     this_hart_id, kernel_map.va_pa_offset - va_va_offset);
> 	unreachable();
> }
>-- 
>2.36.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
