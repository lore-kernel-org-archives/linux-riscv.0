Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8044C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+08nDWgP+0zr8JQyJhLF41rfCYqMjf322cHL10uF+zY=; b=bfy6j0t+P/T4Ro
	8TTqJ3MllVzfROl9Kv5GOoWBm6w6IvLchxwwr9NTyRp3Jfq5T5bSDNMyajBU6ApgVswwONd3DAb7V
	BB033vnaimnSZJhc++6/wF1PErnkHQ7mKCaQmRHMSpChNcwtXfULnU4BAWyeGpOa8sWuG6rIozpIw
	5GK422v7n6GtqHAnxxLM1dyH1BK5mzsORv8od43D1ts93qMfZE4OwFuiHba72JwlwyJqpFRga7TZy
	H2WtISLunKiMlZfz1uxD5+6KDc06tf0CqkJbmRAdxuJsLcL4P0YBmUHanJPGzysIIGos1qygRKqKp
	qzAUuxuNhRzOr/9nBGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPzg-00EZ5K-2Z;
	Thu, 04 Jan 2024 15:50:52 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPzd-00EZ3f-2D
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:50:51 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-35fd8662acaso1862975ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704383449; x=1704988249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KmpM6mBQQhHv/gSZR2zG7ER6CNMKk8ullD4Z85B1/5k=;
        b=BzZ9McETwfCEDP6usuMeVMApkQCEkAXi97pCVNi7RjmkftQmMUJM3RfRZUnxGFPuDZ
         0VkwsoRF2Xl/BN3K7oU6Rodh/ShiwlFf5BMi1bNZQaTDYgITqcX45Pc4cUeAK9RxUV1r
         HBtBfgbFX+T18VD3sDVkaefO8WKN2wzf4iWOda0SUMlLPZvREieV0jdYup46Ca+5KyH8
         WNZKaQlm65bJx54sLKKGz6AZ+EamzMbhUGADtcSaO3zsY0SMeKMzEq3d5xqNNOLZfeHC
         +x0fkzboJPsxg9GKJdxtl5G7138KdEGu/TSUyoY1Id+iJseQ6BzMuVoAqiOdhhiNyZlh
         WmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704383449; x=1704988249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KmpM6mBQQhHv/gSZR2zG7ER6CNMKk8ullD4Z85B1/5k=;
        b=ub0ZBhJllb+9U2V9ThOiuSUMa5sugwIt4aiiTs20RxTBxBwgpTWBzXefJOaaHk169x
         TaaHpODIX4v5puGBHJI4IH7QWHv1hVUNK1oG7gWYzK2ORsVju8WDYZadDw/qbdKpttKa
         bp+H3014tUcSqA1gKT6yNuO0uhD/fnB2boMOtNvUKlvlM7XGRWsHBJSQigmLk3nSf2mT
         xTr09/EFlUwhSFsaoOpwSWgETw7LmqyHBcscwf6ILRWAqy4PeSYL8FjL+wnU7UpnuufQ
         3pBp1mvtOAwIfGtqHc9vUPo/6LIM/Gx3s2+3ee4ZVf1L+mwgt31ioVkrmOXd0TVndo5b
         xjJw==
X-Gm-Message-State: AOJu0YxJxVw4VYKgT/cNJ8qWmitmN5qaoipkvR70qRv+0OtjB/DfN0TL
	EaWHzHN6E/aSjl9Y68emWDo7z35uY8udKw==
X-Google-Smtp-Source: AGHT+IGblrtLVD/taGoGDW+hOtY7FGSidp60/B4QZjgm2pnNBR6S054TRz0oEA5w0xMcz2qB5XLKCQ==
X-Received: by 2002:a05:6e02:1aa5:b0:35f:a27c:e76a with SMTP id l5-20020a056e021aa500b0035fa27ce76amr474841ilv.9.1704383448854;
        Thu, 04 Jan 2024 07:50:48 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id ep24-20020a0566384e1800b0046696ea033dsm7981361jab.146.2024.01.04.07.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:50:48 -0800 (PST)
Message-ID: <e0ceb2e3-ae27-47aa-94de-f0d0060b2a77@sifive.com>
Date: Thu, 4 Jan 2024 09:50:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] riscv: mm: Always use an ASID to flush mm
 contexts
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-13-samuel.holland@sifive.com>
 <ZZV3AAY3WIAq+sl9@xhacker>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZZV3AAY3WIAq+sl9@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_075049_724840_A3A970C6 
X-CRM114-Status: GOOD (  17.17  )
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

On 2024-01-03 9:02 AM, Jisheng Zhang wrote:
> On Tue, Jan 02, 2024 at 02:00:49PM -0800, Samuel Holland wrote:
>> Even if multiple ASIDs are not supported, using the single-ASID variant
>> of the sfence.vma instruction preserves TLB entries for global (kernel)
>> pages. So it is always more efficient to use the single-ASID code path.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v4:
>>  - There is now only one copy of __flush_tlb_range()
>>
>> Changes in v2:
>>  - Update both copies of __flush_tlb_range()
>>
>>  arch/riscv/include/asm/mmu_context.h | 2 --
>>  arch/riscv/mm/context.c              | 3 +--
>>  arch/riscv/mm/tlbflush.c             | 3 +--
>>  3 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
>> index 7030837adc1a..b0659413a080 100644
>> --- a/arch/riscv/include/asm/mmu_context.h
>> +++ b/arch/riscv/include/asm/mmu_context.h
>> @@ -33,8 +33,6 @@ static inline int init_new_context(struct task_struct *tsk,
>>  	return 0;
>>  }
>>  
>> -DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
>> -
>>  #include <asm-generic/mmu_context.h>
>>  
>>  #endif /* _ASM_RISCV_MMU_CONTEXT_H */
>> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
>> index 3ca9b653df7d..20057085ab8a 100644
>> --- a/arch/riscv/mm/context.c
>> +++ b/arch/riscv/mm/context.c
>> @@ -18,8 +18,7 @@
>>  
>>  #ifdef CONFIG_MMU
>>  
>> -DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
>> -
>> +static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
> 
> One of my optimization "riscv: tlb: avoid tlb flushing if fullmm == 1"
> will make use of use_asid_allocator, so could we remove this modification?

Yes, I can leave the global declaration alone for now.

>>  static unsigned long num_asids;
>>  
>>  static atomic_long_t current_version;
>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> index 5ec621545c69..39d80f56d292 100644
>> --- a/arch/riscv/mm/tlbflush.c
>> +++ b/arch/riscv/mm/tlbflush.c
>> @@ -84,8 +84,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>>  		if (cpumask_empty(cmask))
>>  			return;
>>  
>> -		if (static_branch_unlikely(&use_asid_allocator))
>> -			asid = cntx2asid(atomic_long_read(&mm->context.id));
>> +		asid = cntx2asid(atomic_long_read(&mm->context.id));
>>  	} else {
>>  		cmask = cpu_online_mask;
>>  	}
>> -- 
>> 2.42.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
