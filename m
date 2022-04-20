Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34092C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 18:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RUsCw19euIuGiQ0MoS/1LsJ8Ha03eJYHWAlXY4LZwPw=; b=FB0TdAjnAKhT3cQuHo836nb2qV
	D6OJSEcI2k3rckiJE1L2OjB4y0zDbt3tjtU0v7HkDA7SKlJrmcRNie6IiM5gdZtHgO14SD8VsxFyx
	K5kynMW66f6B1C+Q3+dnuSZafizgjwhnUGT6zK1vtdBSod/O6FovhwkhIRfXkosnojLUYWQbEDhIf
	telHIVrqoofd78mwQhl1ukawM6ft4tJVSIWVZU0z28J55vfaeoQhvXiJ2n8LWaItBjMI9uE9XId35
	k6QXiHp5ycztuEMKY9w+PP5IqpToKwbo4RwlP0kNonilCgpIDWKiD+eNOEpxspmU7V+0wCTXP/TZU
	2RpE08MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhFO5-00A6iJ-Rm; Wed, 20 Apr 2022 18:49:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhFO2-00A6gQ-Kj
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 18:49:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so3986406pje.1
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 11:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Nk2NSwsu8i6rTINc46A+r9NE/5YNi7JyHO9FbngN7p8=;
 b=TYs6nRRwUQOFf0gtOjWDh1j18vGSYUtK/5FrQeZVyfc+LVCQdKOhbVjQZZHNUsscec
 GNgdiEnj4ZM4kRz7ic/Mul+yJsrVlfaOlC4WQKe6QJtGkXCpWSlpSlLeXhOo44sehCZj
 5zmAUgRw3YmXiB9ErQ5mzGNIBs/39+GtIY4gL3nMYDeExzMHPqq8rvAcU6RbK5le3vAg
 AlrUwjB5dfhamDuwH6PjpxKTkmH3/+SIo6HuuJrQ5k/pLSyczcEChBfZnzVNh8MlDH23
 3u/2w+5bV/Ff9W1CVHbLsENkaR69HAvIXR1yC4dKEli4yiyIkGeEkf3FouQDwP7zixfV
 bTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Nk2NSwsu8i6rTINc46A+r9NE/5YNi7JyHO9FbngN7p8=;
 b=wUjv7oI+uvKTG4tO129yUgfV/W5JbvcXYsLacwG+ptc8bDlxBtjE1kY58ZBYZnx8Rg
 RUiktkDKTwiBlSWQI4b40GbDRPGExXpnAxxeTgnmBnfUqb7xDFslLIYEuwRJsTSpDsNV
 f7dMDd8kKi8v1BCrvcLONpuz+vmTPxRDv1G2uOid9XDsAWmGmT8Pcg4vNZEfl6z6ItC6
 lGlYwKpPKQGoRV5AAki4S3qWZ7cJqJH/PePSsz/xJhYRQhjL8dccucjyAHJqPWZe3MbN
 9YO68MUIfeflsw0Wi2i615fxjOr1uYL6LyNIJn5LIgills7Ds4T/0f0ZxR3Xy7HN2Qbd
 XTtg==
X-Gm-Message-State: AOAM533pbi97IahJ0oIwXTOouoxq4kIzp6CbxAuHDBaZ+1S2zKChpAhm
 rzsNvYWL1PkUK8WuefkZlInl3Q==
X-Google-Smtp-Source: ABdhPJyBGG/7rUjTp4Rg2EZ9aERkWzpgr4mXMyWyplzUjaZ3YGB+GbK8sEX3Uh8uTKo/s29LimuFgA==
X-Received: by 2002:a17:902:a581:b0:154:8c7d:736a with SMTP id
 az1-20020a170902a58100b001548c7d736amr21954623plb.74.1650480549886; 
 Wed, 20 Apr 2022 11:49:09 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f771b48736sm22080232pfj.194.2022.04.20.11.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:49:09 -0700 (PDT)
Date: Wed, 20 Apr 2022 11:49:09 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Apr 2022 11:49:06 PDT (-0700)
Subject: Re: [PATCH v1] RISC-V: Add braces around an empty if statement bodies
In-Reply-To: <814ae1e7-297f-102f-972f-ae6130128e7a@infradead.org>
CC: panqinglin2020@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, alexandre.ghiti@canonical.com, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, 
 mick@ics.forth.gr, vitaly.wool@konsulko.com, rppt@kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: rdunlap@infradead.org
Message-ID: <mhng-9b719623-5ae6-4f10-bb76-58d42260bd03@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_114910_716335_C1F8098F 
X-CRM114-Status: GOOD (  21.42  )
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

On Tue, 19 Apr 2022 13:38:42 PDT (-0700), rdunlap@infradead.org wrote:
> Hi,
>
> On 4/19/22 12:48, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> This triggers -Wempty-body, which will cause the next statement (eventually
>> create_pmd_mapping) to be dropped.  Both of these were introduced by the same
>> commit.  This is safe for the reporting config (which is 32-bit), but IIUC
>> could result in breakages for 64-bit configs without 4/5 level paging like the
>> XIP configs.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Fixes: 677b9eb8810e ("riscv: mm: Prepare pt_ops helper functions for sv57")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> Might be better to define these to functions that are empty, but that's
>> slightly different than just fixing the commit/warning in question.
>
> Yes, we usually fix this type of problem by changing these to have empty bodies:
>
> #else
> ...
> #define create_pud_mapping(__pmdp, __va, __pa, __sz, __prot)
> #define create_pmd_mapping(__pmdp, __va, __pa, __sz, __prot)
> #endif /* __PAGETABLE_PMD_FOLDED */
>
> etc.

Ya, that's the right way to do it -- not sure why I was being lazy here.  
Turns out there was a bunch of other XIP breakage, I sent a v2 that's a 
whole series.

Thanks!

>
>> ---
>>  arch/riscv/mm/init.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 9535bea8688c..637916857c4d 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -798,13 +798,15 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
>>  			   PGDIR_SIZE,
>>  			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
>>
>> -	if (pgtable_l5_enabled)
>> +	if (pgtable_l5_enabled) {
>>  		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
>>  				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
>> +	}
>>
>> -	if (pgtable_l4_enabled)
>> +	if (pgtable_l4_enabled) {
>>  		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
>>  				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
>> +	}
>>
>>  	if (IS_ENABLED(CONFIG_64BIT)) {
>>  		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
