Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEFFC4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690AD21D24
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qm/jkORl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOyB0HW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690AD21D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3EVHzHIgTmpZtdDJqCpuWs1ZFls/yPys2fEJ1RrgQvs=; b=qm/jkORlAo2h4+/X6c7LwXq4q
	cIZznzJmE+HezYoSzpVRfjbQhpRwV43vxcaktGShGbCoj+wHdLEXrlgUo3WIabSE8bAM9CcoBQnFH
	RJdWx1jpZ5HiGg02U0nZTn80mMIiu3M6LMZr6xnNTrG6Nh6UxyyuXrEIRu/ci77v9+T29R+v1rSli
	wZcviAkZBPe0tcP5z1GxFIdpBQknqINuLVs3ZXHXP4d4S99q/5fQqO85d+dyWKPvjdV76ZExfUg1Z
	YWlTkbuqTV5e76VeKFvWtIdq5r4LlMR/IcfD510y/tMBsadXSzbIqw5GMAL9hWbgO9xemaN6WsFbL
	mHFSKKeYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLmf-0000Sw-Cb; Tue, 27 Oct 2020 10:00:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLmd-0000SC-3Q
 for linux-riscv@lists.infradead.org; Tue, 27 Oct 2020 10:00:52 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0AC121D24;
 Tue, 27 Oct 2020 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603792849;
 bh=2hAVw7qTLLEVUjRphlgAEOwljehMZXHfQC2jV2K8ui0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TOyB0HW/7z4g1FehneF2cfcYLtAIowP4KQMZ7ef+hnI65OHvV+UODT7Wc1S7b44i+
 MReM9XB2fwBhhFkUxqUuEkojM2zjDvmK8w7FuHpWpfSbX98lLw3oCHQuOc5UBhZdGd
 ya0LdjCCp3h0366X6EZ7+DL31CdpMvhor91EJh5A=
Date: Tue, 27 Oct 2020 12:00:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v2 3/6] RISC-V: Enforce protections for kernel sections
 early
Message-ID: <20201027100040.GK1154158@kernel.org>
References: <20201026230254.911912-1-atish.patra@wdc.com>
 <20201026230254.911912-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026230254.911912-4-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_060051_324645_E157969A 
X-CRM114-Status: GOOD (  22.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 04:02:51PM -0700, Atish Patra wrote:
> Currently, all memblocks are mapped with PAGE_KERNEL_EXEC and the strict
> permissions are only enforced after /init starts. This leaves the kernel
> vulnerable from possible buggy built-in modules.
> 
> Apply permissions to individual sections as early as possible.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/include/asm/set_memory.h |  2 ++
>  arch/riscv/kernel/setup.c           |  2 ++
>  arch/riscv/mm/init.c                | 11 +++++++++--
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 4c5bae7ca01c..4cc3a4e2afd3 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -15,11 +15,13 @@ int set_memory_ro(unsigned long addr, int numpages);
>  int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
> +void protect_kernel_text_data(void);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> +static inline void protect_kernel_text_data(void) {};
>  #endif
>  
>  int set_direct_map_invalid_noflush(struct page *page);
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 7d6a04ae3929..b722c5bf892c 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -22,6 +22,7 @@
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
>  #include <asm/setup.h>
> +#include <asm/set_memory.h>
>  #include <asm/sections.h>
>  #include <asm/sbi.h>
>  #include <asm/tlbflush.h>
> @@ -92,6 +93,7 @@ void __init setup_arch(char **cmdline_p)
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
>  	sbi_init();
>  #endif
> +	protect_kernel_text_data();
>  #ifdef CONFIG_SWIOTLB
>  	swiotlb_init(1);
>  #endif
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ea933b789a88..5f196f8158d4 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -608,7 +608,7 @@ static inline void setup_vm_final(void)
>  #endif /* CONFIG_MMU */
>  
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> -void mark_rodata_ro(void)
> +void protect_kernel_text_data(void)
>  {
>  	unsigned long text_start = (unsigned long)_text;
>  	unsigned long text_end = (unsigned long)_etext;
> @@ -617,9 +617,16 @@ void mark_rodata_ro(void)
>  	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
>  

A comment about that rodata permissions are set later would be nice
here.

>  	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
> -	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>  	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>  	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> +}
> +
> +void mark_rodata_ro(void)
> +{
> +	unsigned long rodata_start = (unsigned long)__start_rodata;
> +	unsigned long data_start = (unsigned long)_data;
> +
> +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
>  
>  	debug_checkwx();
>  }
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
