Return-Path: <SRS0=hCbr=KS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5198BC47080
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:38:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3436101B
	for <linux-riscv@archiver.kernel.org>; Sun, 23 May 2021 02:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB3436101B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=++HeHQW4aivFemA0joPuu+8b3w3lqnzKrwDSpF/EHFw=; b=Cfg4o6j/8gVF0PjAay6pPo1UoJ
	6SaHXabaF8yeDgP4/2CFCUgqQA5EvSKQ/h7pSyJnkcUlzJlUt+RBi5QosoHTQlFv2n5kPRtLj+v6D
	CtOi6JgrozmDScgpWzXEgg75+qUBV1gojnMSVWo8FO8D/z/zffvld4DcvFYRD6ziGhUD8f84n5pHd
	n1SJQF61AI+DozAUQqL7dvj1fvDPGyatgz5Z53A6pkQ1gLObCu99KeAn+yNsDyzLSP1vE/+R9vUfc
	Xu2QOXG/A8UkMb0PWqqtVFLq8tEEAd8sigdt/i1DGRYvkbKHXF7U7Rw5xNpqT48BL/wK0+vJYuW01
	sz5IQ+JQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lke0l-003b8Y-6f; Sun, 23 May 2021 02:38:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lke0h-003b84-VP
 for linux-riscv@desiato.infradead.org; Sun, 23 May 2021 02:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=9g5UAE2SjxfDrTvNcmsOvc5raZR96mJY6wr+vR+2NDs=; b=vRw/OZ3BbnI7HBR/StHhJUFlHL
 iCA7PnIvvZbwklwe3Db/tX0meSWMy6JRy6/DJWZMXU30TBP6rTpK8AHb36egx6GRGvz1KVgKWR/hN
 H8IZWI6EY8ZGNoCIpjHRaaykkqflBVQjLtHXcqeDOdGEz4GPZ6kcVdcaGyTKBZHxAOtj6nNtbl45p
 o3InWCcLc5sHiKYtF/c0TVJI/uRsYACgx3xNJNClkLjnGEoU0sHCTqtRe0esVRN/nsns/1rDmXYdH
 71iHsystua9mAcCxOBMKrhAfOxls7AX3uDvR0l95AYWpCa+oZpQXvefotNVf8aiFEE11DlAHyFInO
 XE4Ct+nQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lke0e-000Hgb-JC
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 02:38:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso8589328pjq.3
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 19:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9g5UAE2SjxfDrTvNcmsOvc5raZR96mJY6wr+vR+2NDs=;
 b=a5VDk9MlsWkIjemOgii89yKvOX+gqtEqIiUs90uYDUGpB3C/iSuWacKt6AXmeoNCme
 OtNHwwQsFlMtRWAGMxBxBT+s8pUQczemV/iKyAFitCcD67wHk0uafETLXGMpCgfPmhUu
 3YPuJ2FpGE6PbVQCDVZXEmtwB5b5qQzvFU6u82PTRKCL1YDIJFzK0pvsZiL/3fYItKHb
 pIKCvSK8c5zOFQe04C4ymWu51RduMdO0PK2sQeWmlAw6UniNhxAJ8tdDLXrwVOFQU7tF
 SEFl38AS7OjlXmDZaUIFIZpetZ3U3T3jRn+LM2Re8ss/kMU2VqE79DJAi2SypO6f9r0B
 8jIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9g5UAE2SjxfDrTvNcmsOvc5raZR96mJY6wr+vR+2NDs=;
 b=IW5MY8q4ltI5RzqWJF5XJsEEOY3dVAIsB/Rwg8+1Jp2qDSBS1dA5x4iNTY5xB9wzWa
 6r5N6J5gLdvWU2v9yIY/9aBagE7qHbn+f4VZzjZwhqt1k59wSRmUL3YN+9yYL7vsne1y
 anjTyj7oH6w9kzeDsjE05avCIqdgLKMua0M90ADDJb2RDUoqYcTaAtDbzHJRU5JfmpMG
 Jmz8CgJjAS6sQCaExvLGBDZy6qiKp2wxkYshzccxtjWp4zcjU/uZNh2FMgIgBU8OlN4F
 CBSky8wz/OeBKbXCh4yjYq5ZOfZ2p08MGgnlaVT4o4amsKu4A/EcWrxQTdIdSRThTWtp
 xvcA==
X-Gm-Message-State: AOAM533K6QznWnaVZuvOpiHBsMSoCPUe9D/MXCIfcf0qBe3danHRaIPn
 nx58/1YvGCCLE5BQSjJamSgp+tloDR51gx+8
X-Google-Smtp-Source: ABdhPJzI4sc4+2J9iD2fKq27UKyr7/80Y0uH8UaRjpA66thw0TRtgF1wmNPK7DHP/2AmDq5jN5w4oQ==
X-Received: by 2002:a17:902:dccc:b029:f1:c207:b10b with SMTP id
 t12-20020a170902dcccb02900f1c207b10bmr19317352pll.41.1621737511695; 
 Sat, 22 May 2021 19:38:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v22sm7402355pff.105.2021.05.22.19.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 19:38:31 -0700 (PDT)
Date: Sat, 22 May 2021 19:38:31 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 19:38:28 PDT (-0700)
Subject: Re: [PATCH RFC v2] riscv: Enable KFENCE for riscv64
In-Reply-To: <CANpmjNMN2xQ28nsqUzE+XJ_muHUT+EGdCTCDhvLH2hMMxuTidQ@mail.gmail.com>
CC: liushixin2@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, glider@google.com, dvyukov@google.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: elver@google.com
Message-ID: <mhng-f2825fd1-15e0-403d-b972-d327494525e6@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_193832_658045_BE17EA1D 
X-CRM114-Status: GOOD (  25.06  )
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

On Fri, 14 May 2021 08:20:10 PDT (-0700), elver@google.com wrote:
> On Fri, 14 May 2021 at 05:11, Liu Shixin <liushixin2@huawei.com> wrote:
>> Add architecture specific implementation details for KFENCE and enable
>> KFENCE for the riscv64 architecture. In particular, this implements the
>> required interface in <asm/kfence.h>.
>>
>> KFENCE requires that attributes for pages from its memory pool can
>> individually be set. Therefore, force the kfence pool to be mapped at
>> page granularity.
>>
>> I tested this patch using the testcases in kfence_test.c and all passed.
>>
>> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>
> Acked-by: Marco Elver <elver@google.com>
>
>
>> ---
>> v1->v2: Change kmalloc() to pte_alloc_one_kernel() for allocating pte.
>>
>>  arch/riscv/Kconfig              |  1 +
>>  arch/riscv/include/asm/kfence.h | 51 +++++++++++++++++++++++++++++++++
>>  arch/riscv/mm/fault.c           | 11 ++++++-
>>  3 files changed, 62 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/riscv/include/asm/kfence.h
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index c426e7d20907..000d8aba1030 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -64,6 +64,7 @@ config RISCV
>>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>>         select HAVE_ARCH_KASAN if MMU && 64BIT
>>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
>> +       select HAVE_ARCH_KFENCE if MMU && 64BIT
>>         select HAVE_ARCH_KGDB
>>         select HAVE_ARCH_KGDB_QXFER_PKT
>>         select HAVE_ARCH_MMAP_RND_BITS if MMU
>> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
>> new file mode 100644
>> index 000000000000..c25d67e0b8ba
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/kfence.h
>> @@ -0,0 +1,51 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _ASM_RISCV_KFENCE_H
>> +#define _ASM_RISCV_KFENCE_H
>> +
>> +#include <linux/kfence.h>
>> +#include <linux/pfn.h>
>> +#include <asm-generic/pgalloc.h>
>> +#include <asm/pgtable.h>
>> +
>> +static inline bool arch_kfence_init_pool(void)
>> +{
>> +       int i;
>> +       unsigned long addr;
>> +       pte_t *pte;
>> +       pmd_t *pmd;
>> +
>> +       for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
>> +            addr += PAGE_SIZE) {
>> +               pte = virt_to_kpte(addr);
>> +               pmd = pmd_off_k(addr);
>> +
>> +               if (!pmd_leaf(*pmd) && pte_present(*pte))
>> +                       continue;
>> +
>> +               pte = pte_alloc_one_kernel(&init_mm);
>> +               for (i = 0; i < PTRS_PER_PTE; i++)
>> +                       set_pte(pte + i, pfn_pte(PFN_DOWN(__pa((addr & PMD_MASK) + i * PAGE_SIZE)), PAGE_KERNEL));
>> +
>> +               set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(pte)), PAGE_TABLE));
>> +               flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>> +       }
>> +
>> +       return true;
>> +}

I'm not fundamentally opposed to this, but the arm64 approach where 
pages are split at runtime when they have mis-matched permissions seems 
cleaner to me.  I'm not sure why x86 is doing it during init, though, as 
IIUC set_memory_4k() will work for both.

Upgrading our __set_memory() with the ability to split pages (like arm64 
has) seems generally useful, and would let us trivially implement the 
dynamic version of this.  We'll probably end up with the ability to 
split pages anyway, so that would be the least code in the long run.

If there's some reason to prefer statically allocating the pages I'm 
fine with this, though.

>> +
>> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
>> +{
>> +       pte_t *pte = virt_to_kpte(addr);
>> +
>> +       if (protect)
>> +               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
>> +       else
>> +               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
>> +
>> +       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> +
>> +       return true;
>> +}
>> +
>> +#endif /* _ASM_RISCV_KFENCE_H */
>> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>> index 096463cc6fff..aa08dd2f8fae 100644
>> --- a/arch/riscv/mm/fault.c
>> +++ b/arch/riscv/mm/fault.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/signal.h>
>>  #include <linux/uaccess.h>
>>  #include <linux/kprobes.h>
>> +#include <linux/kfence.h>
>>
>>  #include <asm/ptrace.h>
>>  #include <asm/tlbflush.h>
>> @@ -45,7 +46,15 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
>>          * Oops. The kernel tried to access some bad page. We'll have to
>>          * terminate things with extreme prejudice.
>>          */
>> -       msg = (addr < PAGE_SIZE) ? "NULL pointer dereference" : "paging request";
>> +       if (addr < PAGE_SIZE)
>> +               msg = "NULL pointer dereference";
>> +       else {
>> +               if (kfence_handle_page_fault(addr, regs->cause == EXC_STORE_PAGE_FAULT, regs))
>> +                       return;
>> +
>> +               msg = "paging request";
>> +       }
>> +
>>         die_kernel_fault(msg, addr, regs);
>>  }
>>
>> --
>> 2.18.0.huawei.25
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
