Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD08EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOg80eaPyYktcoMfxdzrzo/ELrRRAyubXAAqFN3SS1M=; b=hckgZxfuaWKMwx
	kHThMQFE7+VwS84c9K8sDS9/SYWzIgBMCpqKvv5/co/hY0brsbo8ydcuKvZTU+bFMfKcTeqcQMWpe
	QPzMdxzB8Kef4vQF4YKef5hvkYmFwxP+ViRPGEkuibxEMp23IFIGiI8ONtPuk3JCvmQLTdUeR2vRW
	ClJJEdkJbx7W4vOnZ3kUa7IMn38CCz3IgVJRMhbfFL6jX1Gxe29/pfjFP60+j6K7yd0yw9JlYayo/
	tkFhGjKeCiPAS7kw4uDIdgDLDvsjqzpOwnHafAJbhczcSaYd/r8+OGcNQeIXdxsHjX6RJJX7uhyzP
	XNSFJWwTz7k2r797kTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGcU-00A6lB-1r;
	Mon, 03 Jul 2023 10:17:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGcQ-00A6dF-0v
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:17:21 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1363C60003;
	Mon,  3 Jul 2023 10:17:09 +0000 (UTC)
Message-ID: <2ab8ca7c-a648-f73c-1815-086274af6013@ghiti.fr>
Date: Mon, 3 Jul 2023 12:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] riscv: pageattr: Fixup synchronization problem between
 init_mm and active_mm
To: guoren@kernel.org, palmer@rivosinc.com, paul.walmsley@sifive.co,
 zong.li@sifive.com, atishp@atishpatra.org, jszhang@kernel.org,
 bjorn@kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230629082032.3481237-1-guoren@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230629082032.3481237-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_031718_616469_B84592B4 
X-CRM114-Status: GOOD (  22.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

On 29/06/2023 10:20, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The machine_kexec() uses set_memory_x to add the executable attribute to the
> page table entry of control_code_buffer. It only modifies the init_mm but not
> the current->active_mm. The current kexec process won't use init_mm directly,
> and it depends on minor_pagefault, which is removed by commit 7d3332be011e4


Is the removal of minor_pagefault an issue? I'm not sure I understand 
this part of the changelog.


> ("riscv: mm: Pre-allocate PGD entries for vmalloc/modules area") of 64BIT. So,
> when it met pud mapping on an MMU_SV39 machine, it caused the following:
>
>   kexec_core: Starting new kernel
>   Will call new kernel at 00300000 from hart id 0
>   FDT image at 747c7000
>   Bye...
>   Unable to handle kernel paging request at virtual address ffffffda23b0d000
>   Oops [#1]
>   Modules linked in:
>   CPU: 0 PID: 53 Comm: uinit Not tainted 6.4.0-rc6 #15
>   Hardware name: Sophgo Mango (DT)
>   epc : 0xffffffda23b0d000
>    ra : machine_kexec+0xa6/0xb0
>   epc : ffffffda23b0d000 ra : ffffffff80008272 sp : ffffffc80c173d10
>    gp : ffffffff8150e1e0 tp : ffffffd9073d2c40 t0 : 0000000000000000
>    t1 : 0000000000000042 t2 : 6567616d69205444 s0 : ffffffc80c173d50
>    s1 : ffffffd9076c4800 a0 : ffffffd9076c4800 a1 : 0000000000300000
>    a2 : 00000000747c7000 a3 : 0000000000000000 a4 : ffffffd800000000
>    a5 : 0000000000000000 a6 : ffffffd903619c40 a7 : ffffffffffffffff
>    s2 : ffffffda23b0d000 s3 : 0000000000300000 s4 : 00000000747c7000
>    s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
>    s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
>    s11: 0000003f940001a0 t3 : ffffffff815351af t4 : ffffffff815351af
>    t5 : ffffffff815351b0 t6 : ffffffc80c173b50
>   status: 0000000200000100 badaddr: ffffffda23b0d000 cause: 000000000000000c
>
> Yes, Using set_memory_x API after boot has the limitation, and at least we
> should synchronize the current->active_mm to fix the problem.
>
> Fixes: d3ab332a5021 ("riscv: add ARCH_HAS_SET_MEMORY support")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>   arch/riscv/mm/pageattr.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index ea3d61de065b..23d169c4ee81 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -123,6 +123,13 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>   				     &masks);
>   	mmap_write_unlock(&init_mm);
>   
> +	if (current->active_mm != &init_mm) {
> +		mmap_write_lock(current->active_mm);
> +		ret =  walk_page_range_novma(current->active_mm, start, end,
> +					     &pageattr_ops, NULL, &masks);
> +		mmap_write_unlock(current->active_mm);
> +	}
> +
>   	flush_tlb_kernel_range(start, end);
>   
>   	return ret;


I don't understand: any page table inherits the entries of 
swapper_pg_dir (see pgd_alloc()), so any kernel page table entry is 
"automatically" synchronized, so why should we synchronize one 4K entry 
explicitly? A PGD entry would need to be synced, but not a PTE entry.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
