Return-Path: <SRS0=5jhf=NU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8670FC432BE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 09:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B11E601FF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 09:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B11E601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBOKBkbnYWF5Ld3qXCxD+a1tkyioYpaMRQKQ7lOyeH0=; b=I6kWUosQPtqP4llENs9tb2NuCp
	gmayquCwvTJT/pF3KgxlhUJN/5H3y+kzSsPZDP8mm0d+7EJJaFkEUdWBFjbnjQrcxeSllgK/ePjoE
	HiobBjt9sMMFem7qn/UBKzfQF7NcWJC/jzLYpwvY9FsESbCM9gyKuxGx0o5v+Qtzw7zbmJW/2Okzt
	n2vES09DRCeWJqHt1yvhrkxhfYAZtESSJJhvDwn/Khc9WmnOO++8prwj69IHXW3+gVm/2R3U5ldHO
	zCHyuF5U+S8dKeW0Wrtt0MVkZ0OdeE8DWmxBzf18WqaqPkj3e9zvdPRPGZST/V5nmGrUDVF70CZW5
	qY2NFaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKHb0-00FLY8-FU; Sun, 29 Aug 2021 09:59:22 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKHaw-00FLW8-44
 for linux-riscv@lists.infradead.org; Sun, 29 Aug 2021 09:59:20 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gy86C0D9fz1DDkT;
 Sun, 29 Aug 2021 17:58:27 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 29 Aug 2021 17:59:05 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 29 Aug 2021 17:59:04 +0800
Subject: Re: [PATCH] riscv: vdso: map data page before vDSO code
To: Sergey Larin <cerg2010cerg2010@mail.ru>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210829094708.169037-1-cerg2010cerg2010@mail.ru>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <02601412-6f01-f4e5-699a-e285fc3fdf3a@huawei.com>
Date: Sun, 29 Aug 2021 17:59:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210829094708.169037-1-cerg2010cerg2010@mail.ru>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_025918_591521_53D8D260 
X-CRM114-Status: GOOD (  27.74  )
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

Hi Sergey

There is already one fix,

https://patchwork.kernel.org/project/linux-riscv/list/?series=534877

On 2021/8/29 17:47, Sergey Larin wrote:
> Current vDSO implementation assumes that the code size always fits in
> single page, and the data page follows it:
>
> 	PROVIDE(_vdso_data = . + PAGE_SIZE);
>
> However, this was not the case with my kernel build - the
> shared object had the size of 4800 bytes. This, obviously, is more than
> 4096 and requires second page for the rest of the data.
>
> CLOCK_REALTIME_COARSE clock became broken. It was always returning 0
> because vDSO code was reading the second code page, not the
> data page. Glibc uses this clock for the time() function.
>
> So instead of computing the offset for the data page (it is necessary to
> do in runtime - you can't know the size of the binary while you're
> building it) simply move it behind the code like the ARM does:
>
> 	PROVIDE(_vdso_data = . - PAGE_SIZE);
>
> This commit also fixes arch_vma_name for the data page - it was
> reporting the same '[vdso]' name for it in my case.
>
> Since I don't have the real hardware, the change was debugged with KGDB
> in RVVM and also verified in QEMU.
>
> Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
> ---
>   arch/riscv/kernel/vdso.c          | 22 +++++++++++-----------
>   arch/riscv/kernel/vdso/vdso.lds.S |  2 +-
>   2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
> index 25a3b8849599..0c49390e9be3 100644
> --- a/arch/riscv/kernel/vdso.c
> +++ b/arch/riscv/kernel/vdso.c
> @@ -44,13 +44,13 @@ static int __init vdso_init(void)
>   		return -ENOMEM;
>   	}
>   
> +	vdso_pagelist[0] = virt_to_page(vdso_data);
>   	for (i = 0; i < vdso_pages; i++) {
>   		struct page *pg;
>   
>   		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
> -		vdso_pagelist[i] = pg;
> +		vdso_pagelist[i + 1] = pg;
>   	}
> -	vdso_pagelist[i] = virt_to_page(vdso_data);
>   
>   	return 0;
>   }
> @@ -77,21 +77,21 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
>   	 * install_special_mapping or the perf counter mmap tracking code
>   	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
>   	 */
> -	mm->context.vdso = (void *)vdso_base;
> +	mm->context.vdso = (void *)vdso_base + PAGE_SIZE;
>   
> -	ret =
> -	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
> -		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> -		vdso_pagelist);
> +	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
> +		(VM_READ | VM_MAYREAD), &vdso_pagelist[0]);
>   
>   	if (unlikely(ret)) {
>   		mm->context.vdso = NULL;
>   		goto end;
>   	}
>   
> -	vdso_base += (vdso_pages << PAGE_SHIFT);
> -	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
> -		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
> +	vdso_base += PAGE_SIZE;
> +	ret =
> +	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
> +		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
> +		&vdso_pagelist[1]);
>   
>   	if (unlikely(ret))
>   		mm->context.vdso = NULL;
> @@ -105,7 +105,7 @@ const char *arch_vma_name(struct vm_area_struct *vma)
>   	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
>   		return "[vdso]";
>   	if (vma->vm_mm && (vma->vm_start ==
> -			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
> +			   (long)vma->vm_mm->context.vdso - PAGE_SIZE))
>   		return "[vdso_data]";
>   	return NULL;
>   }
> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
> index e6f558bca71b..fd8a31075256 100644
> --- a/arch/riscv/kernel/vdso/vdso.lds.S
> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
> @@ -8,7 +8,7 @@ OUTPUT_ARCH(riscv)
>   
>   SECTIONS
>   {
> -	PROVIDE(_vdso_data = . + PAGE_SIZE);
> +	PROVIDE(_vdso_data = . - PAGE_SIZE);
>   	. = SIZEOF_HEADERS;
>   
>   	.hash		: { *(.hash) }			:text

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
