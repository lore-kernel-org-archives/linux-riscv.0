Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CB4C3DA7E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpVimLDxPZI/fI+IV6XpFzDrBLjONuMjk6QUUi1ljfA=; b=YVggzZs+8USdng
	IeGGYCKklFyMF8DL5isK31V8JshgXmuRnBwxbpwMYtDN2GARRAfKq+rH9tAtZbdtimRK8n2yKmxf3
	iwaSVdJYvqy9ZpaHHXJIeWbcD7vcUxem3ZjCdRfhCTVTaOcDxbYG6qdd6t2BRoRselzaTsV2GeJ2W
	cNiSx7TQ1m0a3QCy3V4+yjHusTdZtnbX2p6GJE3/u6JSpZw/YsFAh40qc6+jHgoW7vEOpeS4Zswtt
	m+2ijvxWqXvLS9/AeXmQTS2lXAVv4r2rM/LslsbXm5zxejcJAVlL4Faa4sdi+xonIcznf+iMrlEEI
	wi2VX2Tc2ctAfiftR+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmC8-0000000F8KC-2tez;
	Tue, 30 Jul 2024 12:43:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmC5-0000000F8HT-1n7u
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 12:43:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD4E9FF80D;
	Tue, 30 Jul 2024 12:43:02 +0000 (UTC)
Message-ID: <2f83c6a3-8db0-46f7-928a-8bf585e4a3b9@ghiti.fr>
Date: Tue, 30 Jul 2024 14:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv/mm: Add handling for VM_FAULT_SIGSEGV in
 mm_fault_error()
Content-Language: en-US
To: Zhe Qiao <qiaozhe@iscas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, surenb@google.com,
 alexghiti@rivosinc.com, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, willy@infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240730073822.27732-1-qiaozhe@iscas.ac.cn>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240730073822.27732-1-qiaozhe@iscas.ac.cn>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_054309_634327_EF8766A2 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Zhe,

On 30/07/2024 09:38, Zhe Qiao wrote:
> Hello everyone, recently while learning about the Riscv architecture's
> handling of page fault exceptions in the Linux kernel, I found that
> there is no handling of VM_CAULT_SIGSEGV in mm_fault_erroneous (), but
> rather a BUG() is executed directly. Therefore, I simultaneously analyzed
> the processing procedures of arm64, powerpc, and sh architectures for
> this area and found that all three architectures have processing for
> VM_CAULT_SIGSEGV. Therefore, I added relevant processing methods for
> VM_CAULT_SIGSEGV on the riscv architecture.
>
> As a beginner, I am not sure if this processing method is correct and
> would like to hear the opinions of my seniors.


FWIW, we correctly handle "normal" segfaults (ie no VMA or permission 
access faults).

What we don't handle is handle_mm_fault() returning VM_FAULT_SIGSEGV, 
which can happen in different situations. For example, the BPF arena 
stuff implements a vma fault handler which can return VM_FAULT_SIGSEGV 
(see 
https://elixir.bootlin.com/linux/v6.10/source/kernel/bpf/arena.c#L273). 
In that case, we would BUG() instead of correctly killing the process.

So I agree that we need this patch. Can you just rephrase the commit 
log? I would say something similar (without the link) to what I have 
just said above. And can you also add the following Fixes tag?

Fixes: 07037db5d479 ("RISC-V: Paging and MMU")

Thanks,

Alex


>
> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
> ---
>   arch/riscv/mm/fault.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 5224f3733802..868163b904e2 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -61,26 +61,27 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
>   
>   static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_fault_t fault)
>   {
> +	if (!user_mode(regs)) {
> +		no_context(regs, addr);
> +		return;
> +	}
> +
>   	if (fault & VM_FAULT_OOM) {
>   		/*
>   		 * We ran out of memory, call the OOM killer, and return the userspace
>   		 * (which will retry the fault, or kill us if we got oom-killed).
>   		 */
> -		if (!user_mode(regs)) {
> -			no_context(regs, addr);
> -			return;
> -		}
>   		pagefault_out_of_memory();
>   		return;
>   	} else if (fault & (VM_FAULT_SIGBUS | VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE)) {
>   		/* Kernel mode? Handle exceptions or die */
> -		if (!user_mode(regs)) {
> -			no_context(regs, addr);
> -			return;
> -		}
>   		do_trap(regs, SIGBUS, BUS_ADRERR, addr);
>   		return;
> +	} else if (fault & VM_FAULT_SIGSEGV) {
> +		do_trap(regs, SIGSEGV, SEGV_MAPERR, addr);
> +		return;
>   	}
> +
>   	BUG();
>   }
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
