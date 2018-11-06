Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06581C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 02:33:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B846C2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 02:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XeWPZw6B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NtXbXLxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B846C2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8A2qnForr4GV7d8zxOFoWE3VuiwIqhzl0DAKzu19x4Y=; b=XeWPZw6Bn7P3iFjp46moHVkhy
	vcJaJ6MmkqUHiYShW41KNyD0UBg4aeEe7ogRu+Va2QJyFVex9yk8iZrVqAZPWpT2+Ol2OhomB0OEa
	4mdM864osktzmjne5BmOiQz2HUi044aWGt20zNE99GLbQXh9YNnXls0OqlcHrUhpiz5imstnRT4Yz
	fpPDckCLZlGnNf/N2kYhhNf92fB9xL/oD5k/v0olE5l1xg8NIZ5dmTmbzMNyT7tbQKmFfHgSCln9M
	ZeOrA9LygZlSF0iCkPoKGLeeoj/XCeam2atTLZM2BcP7JbHz54wOQ/tqpgsmX8r/QoykAnaAwrLLx
	x4srnD/aA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJrBW-0002yv-3i; Tue, 06 Nov 2018 02:33:42 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJrBR-0002yG-VV
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 02:33:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id p4-v6so3019284plo.5
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 18:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kv3LqWO8/2jsWQPNhHZ0Auf8jdoHuwXH2ACSIM4Sf94=;
 b=NtXbXLxQnSD4n4fncrjzGzzhQEew6+lEBGJJ5uIbK55MxU3ZeuOgeFvu3tp7c0bt1f
 0T6//Hon2CCM7j1W7TOG4NkEhEfFjL6tT2tUCFn0yt2lteG5cdiMCwQhWv3SxCOiGJZg
 QvWEMY/2D+SbkljATYz9joxdNZ+EHorvvp4w+6SukpMl7p8+RDAeCw6QmkL+WuhzF/KU
 +UTO/2rfKvyzpKyZQMedEUgUXIPt5TgQc3Dc/c3fKIgL3O6dR1ZDiffui7TeB41+7eJe
 ylOeMX+IKp3AJd99xNgo2TKE7srq/Qe2Cdl+pMN/Gv5qeZ3/iIB4xvs+Kkk3ziNA48N4
 3KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kv3LqWO8/2jsWQPNhHZ0Auf8jdoHuwXH2ACSIM4Sf94=;
 b=rNs16q5K5Al9sgcKXYmN1u9ciHeJmJEQlV+QhtoVro7kDY7raH9k3r1L0pqdopQB1o
 ruPBeWdn0b8GBfp7/D5DaAmQq3YL0qUAVYkOPBRVFAhkWR83RXwakhaTkL/+lDgM0Tng
 mCrXrYc0IBwsKbbNhv7NaC2Dr2tAc2ZXra0tos4WixZvsBKOsNt1/emfoW19nOl4hTOW
 1GBRUaGVzOapaWuWYwV4jZ17RpSwMdDeuAPE1gCni9KEs3PIG6ptYy3X5UhxR99DaI1o
 eG8Kzr7zD5o7mkuiEpysM0S0bQ4MGQdAbQOccsA2o5wD7kOFWj3z6s0rI6aKJ7OQ/YJj
 vVaQ==
X-Gm-Message-State: AGRZ1gKQcSPxiwrVgLRwEyGnsLc7mBouAB4a/Da8z7EdrS1V+cI9rhPN
 ahUrwgt3Ik5y5Si+35IGyOX56XMOKdg=
X-Google-Smtp-Source: AJdET5eaRMpi6Uon14jT79bFHmmlBH4NjpNxe40cHsB4phIpHFd1QHbnwUkauDhkfv8vdwSsCkN4iQ==
X-Received: by 2002:a17:902:5617:: with SMTP id
 h23-v6mr24234423pli.220.1541471604142; 
 Mon, 05 Nov 2018 18:33:24 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w2-v6sm44880103pfw.26.2018.11.05.18.33.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 18:33:23 -0800 (PST)
Date: Mon, 05 Nov 2018 18:33:23 -0800 (PST)
X-Google-Original-Date: Mon, 05 Nov 2018 18:33:21 PST (-0800)
Subject: Re: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <20181105004929.GA4735@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alankao@andestech.com
Message-ID: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_183338_045342_55687623 
X-CRM114-Status: GOOD (  29.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, sw-dev@groups.riscv.org,
 greentime@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106023323.yi-0LTBr5E8Up3BIcARa3yVmugayQ4vg3ctPs2I_kTY@z>

Sorry, I missedy our original email.

On Sun, 04 Nov 2018 16:49:29 PST (-0800), alankao@andestech.com wrote:
> Hi Palmer,
>
> I believe the code in arch/riscv/mm/fault.c is mostly from you.
> Do you have any comments on this?
>
> On Thu, Nov 01, 2018 at 05:00:15PM +0800, Alan Kao wrote:
>> Hi all,
>>
>> As mentioned in the Privileged Spec about sfence.vma instruction:
>>
>> > The supervisor memory-management fence instruction SFENCE.VMA is used
>> > to synchronize updates to in-memory memory-management data structures
>> > with current execution.  Instruction execution causes implicit reads
>> > and writes to these data structures;  however, these implicit references
>> > are ordinarily not ordered with respect to loads and stores in the instruction
>> > stream.
>> >
>> > Executing an SFENCE.VMA instruction guarantees that any stores in the
>> > instruction stream prior to the SFENCE.VMA are ordered before all implicit
>> > references subsequent to the SFENCE.VMA.
>>
>> It naturally follows that we should use sfence.vma once the page table is
>> modified.  There are several examples in the kernel already, such as
>>
>> alloc_set_pte (in mm/memory.c):
>> ...
>>         set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
>>         /* no need to invalidate: a not-present page won't be cached */
>>         update_mmu_cache(vma, vmf->address, vmf->pte);
>> ...
>> where the update_mmu_cache function eventually issues a sfence.vma.
>>
>> I was interested if it is always the case and did some research.  RV64 uses
>> 3-level of page table entry, pud, pmd and pte, so I traced a little bit about
>> the code flow after set_pud, set_pmd and set_pte.
>>
>> It turns out that some of the calls to them are not followed by a
>> sfence.vma.  For an instance, in the vmalloc_fault region in do_page_fault,
>> there is no sfence.vma or calls to it after set_pgd, which directs to set_pud
>> later.

This specific one looks like a bug: we're trying to fill out the page table for 
the vmalloc region, but we'll just continue trapping without an "sfence.vma".  
The path between poking the page tables and the sret is pretty short and 
doesn't appear to ever have an "sfence.vma", so I'm not sure how this could 
work.

>>
>> Are they bugs or I just misunderstand the instruction?  As the kernel has
>> already been stable for quite a while now, it is not likely to be a critical
>> bug.
>>
>> Any clarification will highly appreciated.

Well, certainly from this it looks pretty broken -- and in a manner I'd expect 
to trigger frequently.  There are no fences in any of the other similar-looking 
implementations.

Maybe I'm missing something here?

FWIW, if I apply the following diff

    diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
    index 2a53d26ffdd6..fbd132d388fb 100644
    --- a/arch/riscv/kernel/reset.c
    +++ b/arch/riscv/kernel/reset.c
    @@ -15,6 +15,8 @@
     #include <linux/export.h>
     #include <asm/sbi.h>
    
    +extern long vmalloc_faults;
    +
     void (*pm_power_off)(void) = machine_power_off;
     EXPORT_SYMBOL(pm_power_off);
    
    @@ -31,6 +33,7 @@ void machine_halt(void)
    
     void machine_power_off(void)
     {
    +	printk("vmalloc faults: %ld\n", vmalloc_faults);
     	sbi_shutdown();
     	while (1);
     }
    diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
    index 88401d5125bc..61ef1128632c 100644
    --- a/arch/riscv/mm/fault.c
    +++ b/arch/riscv/mm/fault.c
    @@ -30,6 +30,8 @@
     #include <asm/pgalloc.h>
     #include <asm/ptrace.h>
    
    +long vmalloc_faults = 0;
    +
     /*
      * This routine handles page faults.  It determines the address and the
      * problem, and then passes it off to one of the appropriate routines.
    @@ -281,6 +283,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
     		pte_k = pte_offset_kernel(pmd_k, addr);
     		if (!pte_present(*pte_k))
     			goto no_context;
    +
    +		vmalloc_faults++;
     		return;
     	}
     }

I get only a single vmalloc fault when doing a boot+shutdown of Fedora in QEMU, 
so maybe this just slipped through the cracks?

>>
>> Many thanks,
>> Alan Kao
>>
>> --
>> You received this message because you are subscribed to the Google Groups "RISC-V SW Dev" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to sw-dev+unsubscribe@groups.riscv.org.
>> To post to this group, send email to sw-dev@groups.riscv.org.
>> Visit this group at https://groups.google.com/a/groups.riscv.org/group/sw-dev/.
>> To view this discussion on the web visit https://groups.google.com/a/groups.riscv.org/d/msgid/sw-dev/20181101090015.GA6997%40andestech.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
