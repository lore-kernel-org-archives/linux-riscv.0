Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00B3C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAIST0qXnaCGkcQKzOfIJ+HvR99JX61e6NxtyGOZ5vw=; b=PbhXEuF0VifO5y
	fTVt3Ud3P4Y/pODzzDhapz3Bw+Jc6WiRUMFG5wpVO4u7Y/DubnjHw/qvQRVw1n/lCSidu6fS6p8TA
	S8aqwZFlx07nj7CG8nQNioiCXqBaQmhcs1vZVdUbmVLrEcBe4rjNx7w7AtocJJwk5s9WSRhwWJy3P
	hsOBGwA6bpVliI19TM2Wy7yjOWHoJtZew+FkDuCyL4dpI4E5liY3v9fd24DIA7TKOalHB3ekDi5Co
	fFO2tlWV9GS59Mgk5eOByqLpjMMbkwzPBXTZumyeap8i9Ec4up+rSTWmcQ8BlOJ5hGCyhpZMKGF4y
	tyewg+ZudDZUtiFTjhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavW3-00A9Y5-HS; Wed, 21 Sep 2022 08:55:35 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavVN-00A9DX-9r; Wed, 21 Sep 2022 08:54:55 +0000
Received: by mail-ej1-x632.google.com with SMTP id y17so12043062ejo.6;
        Wed, 21 Sep 2022 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sc4HrH+dawwbyFY4jxaPYFax97q7PbwtRdCVIa2eWag=;
        b=nvXLTwTum0Zu+Nzwkb/Va5KR7MpZoNKJUWh0AvWe8HdVcr1Grhklhdo1BZW8sba5fw
         BGnTPKQw9TWdIn1AwbWmhqYPWj/FVYt+uu55rzvSXj7gyQEl6nisi0K/8PiKq+G1vate
         OwUz5f2/PwR248iBS39pCnt+cZvqAUi3xnXwI/CPS+xFuJqBAs2z3QcTEXopA/PS8206
         LsKWiJynHncuR2MFh2DVSwmUKzCR6RXBe0hFSksOj2krERKhpYbj6OOLJgFNJt7NSBQ6
         hVqA13u7w8pzq63oY/Yhzl8fszOLZBKNoD8poD5JuUBZFek7tviVQ4tIq4kb5M10FNKT
         s1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sc4HrH+dawwbyFY4jxaPYFax97q7PbwtRdCVIa2eWag=;
        b=tUSs6QTqEiGlKidik69+42mbLNDVtXkAxdJim23cVYd5hgqs+dWuN1geDg9KU3xyPa
         oD0uvILChfJDVb9ynUMW+eQky7icAhUzqu+xpuNXj2lLxAqQcjr01vF5XlcukdNwaWzC
         86xnv9PO5O6MJCbKpalVoMvn/t8zn8S39aWKZaDU7bUUHdTAW6LiRimOWbmS9PgsFSWx
         nZwlj1Kx+VUEHxW4Vd2dKo0IXltSliUN1+wqfuQ2ZxgdkoRNpcsyY680X03MTCy1OtSZ
         a9H9x70YtfZtQyWEp4/7KDW7z1+ksGVCbeBPEMLGi0Gqrbe0hwExjtWAMtifca0K035T
         F0PA==
X-Gm-Message-State: ACrzQf0BZ/d88npvUeroNQa4j7vahJlrwXHNy52Z7yW2qmzDiZgNFu+n
	p4D0SJHlNKMPkdaaiTuuVt2+FIB0Og1m4macppo=
X-Google-Smtp-Source: AMsMyM5mpmqn+gfhEkasy6u301zqGqQeURhHcxEGpcBIv8VPgxV44BVkZMurDLR6PBxFMgmK/214xxyLA2GRvdonQRQ=
X-Received: by 2002:a17:907:c13:b0:781:d3c2:5015 with SMTP id
 ga19-20020a1709070c1300b00781d3c25015mr4799862ejc.457.1663750486484; Wed, 21
 Sep 2022 01:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-2-yangyicong@huawei.com>
In-Reply-To: <20220921084302.43631-2-yangyicong@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 20:54:35 +1200
Message-ID: <CAGsJ_4ydO=CegfrAF=jYmhOffXd7zKaFp_YxhdMgnoNGA8mBQQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
To: Yicong Yang <yangyicong@huawei.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net, 
	peterz@infradead.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	darren@os.amperecomputing.com, yangyicong@hisilicon.com, huzhanyuan@oppo.com, 
	lipeifeng@oppo.com, zhangshiming@oppo.com, guojian@oppo.com, 
	realmz6@gmail.com, linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com, 
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com, anshuman.khandual@arm.com, 
	Anshuman Khandual <khandual@linux.vnet.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_015453_376492_66FA4D2B 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, Sep 21, 2022 at 8:45 PM Yicong Yang <yangyicong@huawei.com> wrote:
>
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
>
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> [https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> [Rebase and fix incorrect return value type]
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

>  arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
>  mm/rmap.c                       |  9 +--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda3118f3b27..8a497d902c16 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>         flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>  }
>
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +       bool should_defer = false;
> +
> +       /* If remote CPUs need to be flushed then defer batch the flush */
> +       if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> +               should_defer = true;
> +       put_cpu();
> +
> +       return should_defer;
> +}
> +
>  static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  {
>         /*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 93d5a6f793d2..cd8cf5cb0b01 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -690,17 +690,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>   */
>  static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>  {
> -       bool should_defer = false;
> -
>         if (!(flags & TTU_BATCH_FLUSH))
>                 return false;
>
> -       /* If remote CPUs need to be flushed then defer batch the flush */
> -       if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -               should_defer = true;
> -       put_cpu();
> -
> -       return should_defer;
> +       return arch_tlbbatch_should_defer(mm);
>  }
>
>  /*
> --
> 2.24.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
