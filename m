Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E0CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzKAK92QiXgZBV7Jr6UM5dIPMSJu5fnzQLeXh/lRZCY=; b=XdHt1WQuKTmrO8
	OMYjY6eFRlD6BLIayKOO7jwYIfDlR2ZfkznoBRm6TGI4iEfFGZIKOLCqV32v1JSGyJc2sNwZG/fKL
	WLtsOE8s/pmkOR4aVMMXSIH95xXJI0L1rZ3hlWmpfBAJmFCbjXaGHZknQ5pebp2itZz94zOVmMeib
	WLFJ+k7cdAJ26e5SpCJTuSmNLr3LTRD36aJ9xLwxs8p5LpcWncqTOQ9aPu+Kvv545PtBEWwFCxq/m
	BQdDsP0T9YGW2edRZlW6VVrhHlSm03NtEnDCaw+bDlvrwANhzc+j/0O3W0Lr9ykTT+q4vbXRrmQ42
	ONSMTnaN6rMtxmVFMNqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSS8-00000005cxo-4ATa;
	Wed, 10 Apr 2024 07:33:05 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSS5-00000005cwD-1oSO;
	Wed, 10 Apr 2024 07:33:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45A9B40006;
	Wed, 10 Apr 2024 07:32:51 +0000 (UTC)
Message-ID: <8fe1a53f-f031-4423-97e1-28d93d0cd59e@ghiti.fr>
Date: Wed, 10 Apr 2024 09:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] riscv: mm: accelerate pagefault when badaccess
Content-Language: en-US
To: Kefeng Wang <wangkefeng.wang@huawei.com>, akpm@linux-foundation.org
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 surenb@google.com, linux-mm@kvack.org
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240403083805.1818160-6-wangkefeng.wang@huawei.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_003301_646806_B181C01D 
X-CRM114-Status: GOOD (  14.90  )
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

Hi Kefeng,

On 03/04/2024 10:38, Kefeng Wang wrote:
> The access_error() of vma already checked under per-VMA lock, if it
> is a bad access, directly handle error, no need to retry with mmap_lock
> again. Since the page faut is handled under per-VMA lock, count it as
> a vma lock event with VMA_LOCK_SUCCESS.
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/riscv/mm/fault.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 3ba1d4dde5dd..b3fcf7d67efb 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -292,7 +292,10 @@ void handle_page_fault(struct pt_regs *regs)
>   
>   	if (unlikely(access_error(cause, vma))) {
>   		vma_end_read(vma);
> -		goto lock_mmap;
> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> +		tsk->thread.bad_cause = SEGV_ACCERR;


I think we should use the cause variable here instead of SEGV_ACCERR, as 
bad_cause is a riscv internal status which describes the real fault that 
happened.

Thanks,

Alex


> +		bad_area_nosemaphore(regs, code, addr);
> +		return;
>   	}
>   
>   	fault = handle_mm_fault(vma, addr, flags | FAULT_FLAG_VMA_LOCK, regs);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
