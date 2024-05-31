Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8C0C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 04:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBrgyVN2mOb8qek3B/+Ou+nj2C0rbyyuaa+FOBkegzk=; b=B2z8HKQ+uY1AT1
	ziuJSCy8KSOWLz8wCb29Qfsm6EoK8MNG/XQ5h+h06OmrCeeNdnuHhicnnDqlEbZ5wJ8T0/mw79XC6
	x+KRPjNgpryIzR/L+8KneLA1ZSAKO3eHGiPWGgGqreHzNXIbf/cctILrvxl6+Qzgu9Y7CqwiCl+YA
	+7dUodK3kWDje8z23nCMoG7Qz3Fd3HBsQCLdmDBvQEknynaayFBG3OagLG7AcMzEsa0bek5uehrpk
	Ac/onrDi/1lZWsrI65tr1bMFSmasnM+Q//Ymm0M6XqncnTJTHf+mS8Cesx2bHGMwy+Z9T3VL5qMfb
	dWLw+JLKMAdR9r9/GDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtWs-000000099ac-2VSx;
	Fri, 31 May 2024 04:06:10 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCtWp-000000099X3-26y2
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 04:06:09 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Vr8ZV57fbz1S8K9;
	Fri, 31 May 2024 12:01:54 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 409AD140258;
	Fri, 31 May 2024 12:05:44 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 31 May 2024 12:05:43 +0800
Message-ID: <51c9752c-5390-43a2-a800-7dc1043ac93c@huawei.com>
Date: Fri, 31 May 2024 12:05:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "riscv: mm: accelerate pagefault when badaccess"
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <surenb@google.com>,
	<akpm@linux-foundation.org>, <alexghiti@rivosinc.com>, <jszhang@kernel.org>,
	<ben@decadent.org.uk>, Bjorn Topel <bjorn@rivosinc.com>,
	<willy@infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240530164451.21336-1-palmer@rivosinc.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20240530164451.21336-1-palmer@rivosinc.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_210607_775980_0B0162DA 
X-CRM114-Status: GOOD (  12.17  )
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



On 2024/5/31 0:44, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I accidentally picked up an earlier version of this patch, which had
> already landed via mm.  The patch  I picked up contains a bug, which I
> kept as I thought it was a fix.  So let's just revert it.
> 
> This reverts commit 4c6c0020427a4547845a83f7e4d6085e16c3e24f.


Yes, this one is the wrong v1.

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>


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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
