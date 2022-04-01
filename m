Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B21C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=idaOIOjbVOWLZnxx2ed9FhJh5zTnTuK2Mn8mU1NwozE=; b=ojKvAeUw96F/tKav3H/0ICrOrk
	w+Wmt38DbVKbOKUP4EgIIO0dlg2gIy16qlkrYsRjhURW+R02Zt5Ct/Qie/+2JTI4dlB9VJ4ZmhzNu
	+Hc9uGQ2931L6RFH1oeXhkq7znvopV0m1s2RA7B68Mv+t7vu67RpX02IgdUr4c16KQyqhpW3jGsHR
	sLnXOZB3nCqB1S+q0SgN7PyKkZDFWB72H1k219fn0GxT7GEn4TNThs6ioXRqX+gcBDW4jpA8hk55w
	gVPVNQF3QWqUC2hW7M72XDztPl9C4ilcoCDVO8LnnpA+CaroO+zovbjQV9SnGGcFY057VULlxA43I
	kF8n3g/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na4oJ-0040EM-RL; Fri, 01 Apr 2022 00:06:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na4oG-0040Cz-Rn
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 00:06:38 +0000
Received: by mail-pg1-x52d.google.com with SMTP id c2so1032013pga.10
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 17:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=auJHQcYQYvvZ1V2byclLJMPfW9R2zEDYbO5HEVrr1Ck=;
 b=aYjLKBk2+HbN+GYvcpJ1DjRcTHjS6BC02FUzKjM/bvMcvOu4LCs/B5I0yoGgm9b63y
 ZldWOT3TTEgjkh3Wp3bAf2AMikSVDk7n3JfiY6Fh5AG5dzIJq9ac+ygYvSrARAfA/b5m
 58GnAo/FBc/tFU0Hn2wKHBl6jOuQqHTCOvvfhQ05OWuuFiL9MADtVxocdnFnYU5r0Dd5
 SjImyyURF6K896MVRmYUY/hkZGbX1e5PSqm22NnH+l9I9F4wWEqsezbQ0pr7ZRGvqT2H
 Nl4zJzRuSf/H5GHbOTNqTaHfZIkmZ1Gz5YP+Ez2aZ218bXMWARScMiK2LMlyhMuId3Z0
 d1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=auJHQcYQYvvZ1V2byclLJMPfW9R2zEDYbO5HEVrr1Ck=;
 b=iOZbYSFwHMzmK0Ue/h6jRdeb9h9tiNIDSHoeHWUZqv44aPJhUfCY65VkpmpUbPNYzM
 PyXIVe51UIfzIe2mU4HNgiRNv8p4GgLgBW8ac4CGpgRcPNXObT4WRJ9qrHwkhlBBWgIc
 qXMA6jF1wl0mtlSlX80VPuEzhaLsyYH2CHXuNinuV+69fWbFf5HDDK51LuTOLTSSX/OL
 ZX54xVAQ9xMXAAV3LvJhGuTIRACTheORRLC1WQlhMRGn5PWZjFCqCWO6yxh4QyB+amPB
 ds4drxNZXw066RsIMZC/evwKdn252WLyWKCZkp2yGpEZCpE+nKggDrqAKXNuAMPIUbwL
 ZWCw==
X-Gm-Message-State: AOAM533O3EnYyhuMbeXo1Xce56yVn3W2SbzBqAbqtP0ektB7hacGrGHz
 4w+nFdkAMnYzoh75ARZqwO/52w==
X-Google-Smtp-Source: ABdhPJzyWjP68V6eOzmDhX3uTnWr+FCTmjPJPFdQW7dsl7b6C2Qv9zpbwG55UTeEmuDMymGGomiq3Q==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr12914726pgq.215.1648771590074; 
 Thu, 31 Mar 2022 17:06:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 d21-20020a056a0024d500b004fb0e7c7c3bsm635789pfv.161.2022.03.31.17.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 17:06:29 -0700 (PDT)
Date: Thu, 31 Mar 2022 17:06:29 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 17:05:16 PDT (-0700)
Subject: Re: [PATCH v3] riscv: Ensure only ASIDLEN is used for sfence.vma
In-Reply-To: <20220331055906.3552337-1-alistair.francis@opensource.wdc.com>
CC: aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>,
 anup@brainfault.org, guoren@kernel.org, 
 alistair23@gmail.com, linux-kernel@vger.kernel.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair.francis@opensource.wdc.com
Message-ID: <mhng-961707f4-8f42-4e53-bbfa-5d938743f76b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_170636_927579_C59B8BE7 
X-CRM114-Status: GOOD (  34.56  )
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

On Wed, 30 Mar 2022 22:59:06 PDT (-0700), alistair.francis@opensource.wdc.com wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> When we set the value of context.id using __new_context() we set both
> the asid and the current_version with this return statement in
> __new_context():
>
>     return asid | ver;
>
> This means that when local_flush_tlb_all_asid() is called with the asid
> specified from context.id we can write the incorrect value.
>
> We get away with this as hardware ignores the extra bits, as the RISC-V
> specification states:
>
> "bits SXLEN-1:ASIDMAX of the value held in rs2 are reserved for future
> standard use. Until their use is defined by a standard extension, they
> should be zeroed by software and ignored by current implementations."
>
> but it is still a bug and worth addressing as we are incorrectly setting
> extra bits.
>
> This patch uses asid_mask when calling sfence.vma to ensure the asid is
> always the correct len (ASIDLEN). This is similar to what we do in
> arch/riscv/mm/context.c.
>
> Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v3:
>  - Use helper function
> v2:
>  - Pass in pre-masked value
>
>  arch/riscv/include/asm/mmu_context.h | 2 ++
>  arch/riscv/mm/context.c              | 5 +++++
>  arch/riscv/mm/tlbflush.c             | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 7030837adc1a..94e82c9e17eb 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -16,6 +16,8 @@
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	struct task_struct *task);
>  
> +unsigned long get_mm_asid(struct mm_struct *mm);
> +
>  #define activate_mm activate_mm
>  static inline void activate_mm(struct mm_struct *prev,
>  			       struct mm_struct *next)
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..14aec5bacbc1 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -302,6 +302,11 @@ static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
>  #endif
>  }
>  
> +unsigned long get_mm_asid(struct mm_struct *mm)
> +{
> +	return atomic_long_read(&mm->context.id) & asid_mask;
> +}
> +
>  void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	struct task_struct *task)
>  {
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 37ed760d007c..9c89c4951bee 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -42,7 +42,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>  	/* check if the tlbflush needs to be sent to other CPUs */
>  	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
>  	if (static_branch_unlikely(&use_asid_allocator)) {
> -		unsigned long asid = atomic_long_read(&mm->context.id);
> +		unsigned long asid = get_mm_asid(mm);
>  
>  		if (broadcast) {
>  			sbi_remote_sfence_vma_asid(cmask, start, size, asid);
> -- 
> 2.35.1

The autobuilders are finding some failures.  I think this

    diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
    index 6df4f22f0a3c..8a9c7bc2297a 100644
    --- a/arch/riscv/mm/context.c
    +++ b/arch/riscv/mm/context.c
    @@ -12,6 +12,7 @@
     #include <linux/slab.h>
     #include <linux/spinlock.h>
     #include <linux/static_key.h>
    +#include <asm/atomic.h>
     #include <asm/tlbflush.h>
     #include <asm/cacheflush.h>
     #include <asm/mmu_context.h>

should do it, I've squashed that in and put it on palmer/riscv-asidlen 
so the autobuilders can find it.  It's going to be too late for rc1, but 
this seems fine for fixes so it's no big deal.

Feel free to send a v4 if there's anything else, but if that's enough to 
fix it then no need to.  If there's no v4 and nothing goes wrong, I'll 
cherry-pick it past rc1 when I re-fork my fixes tree.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
