Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D8C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUhoEiWwfShRAMlvCCA8Pd+LQKju+91+fKU2Dx9+dxs=; b=s05KK/lcOupd5v
	XPXiVjau170UIxZqc/LZ/tdaolXPS1NJPejmC5j70yiXcbJD/mV5g0TI5sTlzxXba3TEv1RpfGOah
	iA4T73d89JDOEfT5p/5Y980cMh5r3sHFs308eTYGlyIvMNvg20mRMeavJXRrywwpYEE0iZKhG+3bo
	ZmgeEgJHgr6+dmph41XGuBePZe2Zsiy1ZUU4nKo3kz6Qt9h+FIMnyEZwoD4Vov7LxOu3Jvv3Nwq0w
	OpDArjhj2i61jl0Ee6wITzLWYFBoBJuWWED3Z/cTR7wLYFhT1dKirzZo5xw7Ihdp0qXMfCQZrD+XS
	SEMOthcGbxINImuKamwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJM9-0000000Ei9Q-3Y4y;
	Fri, 24 Jan 2025 13:04:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJM7-0000000Ei7z-25nE
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 13:04:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso3755022a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 05:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737723855; x=1738328655; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=D70ZZ7RnTzPzRDuA0rQ6QV+dumzbgk0yvVucaO2JY1G/YpWtsP8s8o7CmzFPWjh+VM
         acCrppt+59ikSNO3RBFwYt3ZUft2OItuDLMZv8hl3mcFi6I9sWhDf6KODp1w4zj3pxOY
         5I+uJxBUN/7t5HcbWHyKKpWbb+GJ5FnpkM7KyXtepV0+0T75NkqgCF/R4ogV6JRLAODo
         HZR4PL1vPFewqdge6uMauZR2PSK1OoeRR7Hl+ARPV8yyC/DkL82NfTkEyQDqHbddrwzG
         1/+fH1lIvx5fMo0rRl8uA2Sk2m49TTFEsclPymcS8yJ8UJwXvtM4OsqnGCNPqpoADT9Q
         iatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737723855; x=1738328655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dId7b4yz8t9ytNzoIMZDzDyU9S5trP6VQ+ykZ7MFw3k=;
        b=AFHZH7ON/0OrVfeowoFfzlQW2MF8LwWGhUw5+b3wD+mChctFtkr0U02oYN1KNMyBm8
         4jTC5A8uk6GomKZHQhmYKzyK6b8e42uwkmtI49bM3QJnE1qionUO3YzZbCoiZUmdsBOS
         bIzUvgS/+jV2oIeWsF3EOhUOlKzkJrS65HgkKRhpXaXxTf8yrxv+p0NpQCpTup22psh8
         iZOK9Q3Z/wB1RnreIupGuNs2KYBbr31MpRvo7adTlKAJrxBTpPCRZ5ggh06D38+P+oO1
         Ejft50lYOUNN4kafQU2z5IPPDjuOw4EJKqV9yfx7rEf8ko2KJCFo1pb3FTGgUQuV1mUt
         IU0g==
X-Forwarded-Encrypted: i=1; AJvYcCUuS4WWnZU81801FFIDBWaRdY2isl4phTDJG71rK60OI4mgvGr9vjE9iOGwlm6br9DxLFg0m/FPVe+vWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSiGWTq//cgPjQYpKDJtPZxqHWMeKAtr8wzgFVK83MsnFdVCHd
	sBwrDCZ7ja5gPtpwJ7cOLtPr1qG/chJecHiD6yn1U5RYIVI5EizfY3yztSqhW4M=
X-Gm-Gg: ASbGncvP4lV7N2S3R4e1YzmiVKK9w15HNyU5gKfGJeuGcSzvKTXSFgIi4/jaojoRpDB
	aoFfOsL9xEDeidAfXfNJeBL960RFwW9OrE5Pg7Xkjqao/jXLmLNbDc5xkU0jdBGfgwh4+TtCLvr
	BWqW9BQvi9YbSoB1DeIdsBakWBwdR5u1RC1/aSjqVKxQq4qGL4t1pVFnYXgBw3TemBgYpjt3A6I
	yuXNHB/ln2sfox3CqZ584/L0ZiAbUiSOtANOwKJapClcNmc5lu3+PxTCyre6ENT36VMHzokjnRv
	BdoHrV8HyRAhRu7Wd1646/QB0abAVT4Em8o154+FmvhkigRyDVtZ++m63abhNZpSk5DA/+kh7Mf
	6EvNT
X-Google-Smtp-Source: AGHT+IGZTgGY31e/1k/dTmcJmo/YDWxdXL7RglCap7bUypXHuwXLFHjK5+LGZw2OAN+HVTY4hEX3Xw==
X-Received: by 2002:a17:90b:2d88:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-2f782c628bbmr47170073a91.2.1737723854887;
        Fri, 24 Jan 2025 05:04:14 -0800 (PST)
Received: from ?IPV6:240e:370:8b13:5250:f0b9:2326:6cb0:b423? ([240e:370:8b13:5250:f0b9:2326:6cb0:b423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a975sm1776638a91.15.2025.01.24.05.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 05:04:13 -0800 (PST)
Message-ID: <65710478-4ee0-499e-9f66-dff81e226042@bytedance.com>
Date: Fri, 24 Jan 2025 21:04:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
 david@redhat.com, jannh@google.com, hughd@google.com, willy@infradead.org,
 yuzhao@google.com, muchun.song@linux.dev, akpm@linux-foundation.org,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124114759.GB15996@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250124114759.GB15996@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_050415_542301_B85BC451 
X-CRM114-Status: GOOD (  19.19  )
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



On 2025/1/24 19:47, Peter Zijlstra wrote:
> On Thu, Jan 23, 2025 at 09:26:13PM +0800, Qi Zheng wrote:
>> Hi all,
>>
>> As suggested by Peter Zijlstra below [1], this series aims to remove
>> tlb_remove_page_ptdesc().
>>
>> : Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
>> : there should not be a page-table anywhere near here *ever*.
>> :
>> : Yes, some architectures use tlb_remove_page() for page-tables too, but
>> : that is more or less an implementation detail that can be fixed.
>>
>> After this series, all architectures use tlb_remove_table() or tlb_remove_ptdesc()
>> to remove the page table pages. In the future, once all architectures using
>> tlb_remove_table() have also converted to using struct ptdesc (eg. powerpc), it
>> may be possible to use only tlb_remove_ptdesc().
> 
> Right, so I don't think Sparc and Power care to use ptdesc, they're
> using non page page-tables.
> 
> At the very least we should do something like this, the only point of
> having tlb_remove_ptdesc() is type safety, there really is no benefit
> from it in any other way.
> 
> ---
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index dec030cb1210..a6731328db6f 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -504,7 +504,7 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>   	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>   }
>   
> -static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
>   {
>   	tlb_remove_table(tlb, pt);
>   }

Ah, make sense. I think this can be added to the patch #1.

Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
