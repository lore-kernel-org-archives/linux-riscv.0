Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8BC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 05:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQNCPSKKwZmvsfK00hqmXg2KrhQQz/6U75vj15fZvn0=; b=xvo1sJ+buwbehn
	2Kt6CAHh+LS/EKs9YA6q2xnd9fnrgR2huDEgeYsvVIOzWJaUSYGAch0ioUTJZo3k54uXssb2ooYT4
	YUMXycROIeeatSR71vOSu4hS3lG0mn7BuD7ElnsnkQCqqN1SXvBjw8i2Yku6NqGlvVNAdFIrM1idt
	rCCveDYMymeoLLzG9369OWIY6Oy4zyWyHD7z7CQax08y3Q5hiasL6k+mJ5YIkjQTAu7OdaUIEthe3
	MdHGcw527NZVjgx5WxfjZqDlwKcVEqXgXkQzVqrpJ48jSRIaPeXzwLs8UHbS72K7sZ6jXfba3/Xn/
	IJhAbEREjy6baHsBuFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv5P-00000009J3e-1rVH;
	Fri, 31 May 2024 05:45:55 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv5L-00000009J2M-3MMF
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 05:45:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2B94FF804;
	Fri, 31 May 2024 05:45:43 +0000 (UTC)
Message-ID: <e3cfd2f2-5d30-455f-8d10-66a2a71c13c7@ghiti.fr>
Date: Fri, 31 May 2024 07:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "riscv: mm: accelerate pagefault when badaccess"
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 surenb@google.com, akpm@linux-foundation.org, alexghiti@rivosinc.com,
 wangkefeng.wang@huawei.com, jszhang@kernel.org, ben@decadent.org.uk,
 Bjorn Topel <bjorn@rivosinc.com>, willy@infradead.org,
 linux-kernel@vger.kernel.org
References: <20240530164451.21336-1-palmer@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240530164451.21336-1-palmer@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_224552_079831_FE057C72 
X-CRM114-Status: GOOD (  12.63  )
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

On 30/05/2024 18:44, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> I accidentally picked up an earlier version of this patch, which had
> already landed via mm.  The patch  I picked up contains a bug, which I
> kept as I thought it was a fix.  So let's just revert it.
>
> This reverts commit 4c6c0020427a4547845a83f7e4d6085e16c3e24f.
>
> Fixes: 4c6c0020427a ("riscv: mm: accelerate pagefault when badaccess")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   arch/riscv/mm/fault.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index b3fcf7d67efb..5224f3733802 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -293,8 +293,8 @@ void handle_page_fault(struct pt_regs *regs)
>   	if (unlikely(access_error(cause, vma))) {
>   		vma_end_read(vma);
>   		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> -		tsk->thread.bad_cause = SEGV_ACCERR;
> -		bad_area_nosemaphore(regs, code, addr);
> +		tsk->thread.bad_cause = cause;
> +		bad_area_nosemaphore(regs, SEGV_ACCERR, addr);
>   		return;
>   	}
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
