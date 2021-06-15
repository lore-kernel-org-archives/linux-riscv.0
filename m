Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F75C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:39:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 439386128B
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 439386128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mfZg8Aku+Qe7xoPpGWvTd10ypxxDb6+MGh9WuOg57RQ=; b=Vf1al59wZUthxbBxWjeNmWldSQ
	5pE0hdlL4d6bTSZYf1QdyIc/n+r3KXepU4Z6xNoxeaWQpLe1W9jJRMFusQ7EzmCeB6oGVe4PkyWZ2
	Lw/NHtHDNR/YjgMQKS3HIRpiFYLAsT3gYfgJGQA4/Cv14HGmFyYj/Hu77YcpfmC9URQNywV+fslHc
	te1uEmr7C1t1Cwfmdsg0a3uZvbVCmZWrgQRBbRofwCgS1bAEBbEG6teXrIL1WefoATcnYay5Wx1cu
	9dfsa8AjO/SAFDOFPeTsmlQx7NuM+ZkMgCId2obJv4M49TRnvM336zhRzXdeSVeKNEl8oyZL3hkBj
	S+5c0trQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEuJ-002W9l-82; Tue, 15 Jun 2021 19:39:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltAi3-000re1-I1
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 15:10:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so2018770pjn.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9utZ1XbMD2x+5q8vbSQWa/inIRyQdsN/7SNhOhtNL8A=;
 b=Pu/QTZhHZlqkAMqJG633fW//r9NTBKgjPFYWjla97i9g0A08MJTnPxQWagG7G34V9S
 mGUqYRaljgGywi/D/iDcumQjS6C9PUsZ6SgsvKw+BWptyAxex0ctDthd5ZegTRQt2kef
 aJrNJ6RLMQSA9WyhX3lvuD3AVGU9exHucvVrs5bXes/G69QvE/MERjlUJSCdjVxKN7Pc
 M4H4BfOXFCpKwX/fJxh0nyR1goFyrWlRMKKPuuIo5tYfjL1Ddp2pS2oAEjhgtgdm4pNr
 OzS8pQitODHLQwT+RIzEQ5wrxJxg4A08Qst+JTAbIEUp8ULMuEY+wkOuthiNn16FVGfu
 CWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9utZ1XbMD2x+5q8vbSQWa/inIRyQdsN/7SNhOhtNL8A=;
 b=BGlV+TpQYDrPy6v3ZH57Zlxkwa7ks2ORkqwHlc82d7hyH+nQn76q8vCRpWkZ+0mefv
 GvBLVj7Xe4hKJUK0BghvVlvKy0jcv3Io6nD9/2totBWDZplJzsSmVD0bgcAzO+EVqnwI
 zeL76uckCWdfLRHHrfcH1ZdSe88WsdAVpvz7ItjYjWEtw3rL79YS3pbK/ulB3uTqnEFU
 1o6YyLUcR0Y1XKQMVvgJUgia5bcTp//BTenx7tNSx3FnDjqHPfYp1AAnwTLmh7gOppsi
 MLr9NYF2z+FNB1brvJB9wrrqVSk6VlYoBdr/M5k+ZpYEY1W3IuTy+HYQoWZaDgjYwQnI
 7Maw==
X-Gm-Message-State: AOAM533upCApLrracsvBO8SQJcqe9pms/Gc015vzf5FOFIwL/SKoDbTh
 OwukiT/brfF6+nnDrb0B7PElZg==
X-Google-Smtp-Source: ABdhPJyFBaMgCB6pJQq6QYIjg0mKSt6VdQSBWqHeGCzKx4R+EYCtE7P2OXvCF2obWpf0+JcQnQgx1g==
X-Received: by 2002:a17:90b:1188:: with SMTP id
 gk8mr25010288pjb.138.1623769828925; 
 Tue, 15 Jun 2021 08:10:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t12sm16410058pfc.133.2021.06.15.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:10:28 -0700 (PDT)
Date: Tue, 15 Jun 2021 08:10:28 -0700 (PDT)
X-Google-Original-Date: Tue, 15 Jun 2021 08:09:52 PDT (-0700)
Subject: Re: rebased ASID-based tlbflush
In-Reply-To: <a06ebb56-2fd7-d8f8-866e-ea235f52696b@huawei.com>
CC: guoren@kernel.org, Christoph Hellwig <hch@lst.de>,
 Anup Patel <Anup.Patel@wdc.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: liushixin2@huawei.com
Message-ID: <mhng-0e961c64-341d-4a36-863f-1eec0778a0eb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_081035_695829_BEA72B08 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, 15 Jun 2021 04:20:44 PDT (-0700), liushixin2@huawei.com wrote:
> On 2021/6/13 21:08, Guo Ren wrote:
>> I've just tested your for-next, but:
>>
>>  LD      .tmp_vmlinux.kallsyms1
>> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
>> mm/vmalloc.o: in function `.L0 ':
>> vmalloc.c:(.text+0x2bd2): undefined reference to `pud_clear_huge'
>> /home/guoren/source/buildroot/thead_9xx_compat_5.10_glibc_br_defconfig/host/bin/riscv64-linux-ld:
>> mm/vmalloc.o: in function `.L1225':
>> vmalloc.c:(.text+0x2cac): undefined reference to `pud_clear_huge'
>> Makefile:1191: recipe for target 'vmlinux' failed
>>
>> I quick fixup with the simple patch:
>> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
>> index 738dc6f3530f..b1fbd575cbac 100644
>> --- a/arch/riscv/mm/pgtable.c
>> +++ b/arch/riscv/mm/pgtable.c
>> @@ -25,6 +25,14 @@ int pmd_clear_huge(pmd_t *pmd)
>>  }
>>  #endif
>>
>> +int pud_clear_huge(pud_t *pudp)
>> +{
>> +       if (!pud_leaf(READ_ONCE(*pudp)))
>> +               return 0;
>> +       pud_clear(pudp);
>> +       return 1;
>> +}
>> +
>>  int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>  {
>>         pte_t *pte;
>>
>> I think it's from:
>> commit 14512690a16537527dacf0f5cd3d2263be317f35
>> Author: Liu Shixin <liushixin2@huawei.com>
>> Date:   Sat Jun 5 13:48:37 2021 +0800
>>
>>     riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
>>
>>     This sets the HAVE_ARCH_HUGE_VMAP option. Enable pmd vmap support and
>>     define the required page table functions(Currently, riscv has only
>>     three-level page tables support for 64BIT).
>>
>>     Signed-off-by: Liu Shixin <liushixin2@huawei.com>
>>     Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> This commit is based on linux-next. pud_clear_huge() have been defined in pre-commit
> ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge") which is not on for-next.
> The code is different and thus an error is reported here.
> Should I rebase the patch on for-next and resend it?

I can't find that commit anywhere, can you send a series with the 
dependencies?

I've removed the HUGE_VMAP patch from for-next.

>
> thanks,
>> On Sun, Jun 13, 2021 at 8:47 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>> On Sun, 06 Jun 2021 08:20:48 PDT (-0700), Christoph Hellwig wrote:
>>>> Hi all,
>>>>
>>>> this is what I think is a resonable set of patches for the ASID based
>>>> flushing, largely based on the work from Guo and thus attributed to him.
>>> Thanks, these are on for-next.
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
