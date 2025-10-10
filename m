Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC863CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMtQjLRG2JzC1KPygebr1V3+gladv5+Wl3ub15enYjo=; b=VHbQAV8ZAEhA8R
	V3B0rJdPWi9DAjaF7RI/bs2D/jaUTLcvsRouStnYUiBYIAmrM8MFpa+MDHMAnbnblx37p05rBuMiC
	MYABnY/IOktiWoeCdxHdSkLbB+GBj0TeXSPSLwh4bXxUaXCfO/9khK5iLD9dbJ6741mnlue7GBaBi
	Hjc0Z1g0qLG/3unP6m5W7fJ+JFOSK904lqZkgbGHAkWKfM2/GPAkhGnK2EwHSODuWrI74rDVqvF3C
	24iin3S+WXK1BOLcH4vgL0n1DGLdts63fWuRl0y1YqHBtiBtnX0iCv8YL/erSeieJ1xMyCn4nuATV
	oAuImp218iYa43I5bICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GkR-000000092uX-3Ek2;
	Fri, 10 Oct 2025 17:17:44 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7GkP-000000092uA-3C0p
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 17:17:42 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-9298eba27c2so99564139f.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760116661; x=1760721461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6G/IEc8eQi80LISFTxnAaN67mBaGX3+NUViuwGCrxp8=;
        b=e7kh9UEMGC46dzpsZxP6kMXQfyZP/6Rup4HK2ILaAp8iEE/Wh37rI7w985IrUNG5oh
         sZN4PX7VrNbHJrMQJvUuejFi+cpiyn7BEnahcLg3Z/rAB0Vxc/zsho0/GWMUq4BXxc+U
         9/enoyul6yFZKhiNKh67OXAC+v2wI1WfOjtqZFMNngDnKPiD8XoIa6vtc8ce3DtXQWfD
         0X3n5uLjZV6FYOsODcI62strV3WPzbvTfcS2g9QYu7b8SyXfmKvn0RSMZcdz/vByPZXj
         bJV0psCXzJL8xLUBGun82YyvwPr4yE2qpbncIGN2pVqowSvvKnxkWb/L9kVHo0Kti2hS
         3u5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760116661; x=1760721461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6G/IEc8eQi80LISFTxnAaN67mBaGX3+NUViuwGCrxp8=;
        b=BlELRyMQyFMmz4rzmKyFKDslMWLB7Ps3K4T24dV21d+98HuyLwtfs5RKFWiwhK3Tgj
         N+Wqrt9gwtgrRcPUx+YKOX7HqUqrsLNHWIv8xaPg+aOkiAH6nLpTmk16AP9IK3HiOl2g
         Lda9lvdMBvHr5B1ZLu3m0xhFPH9r5R56n0try6xvgQY39p/ZQNHlLdAllKypc91qdtAP
         leXl4ux4Du70dFVy56O8FJcwky+9I/cth+dWN4qCPaLdldSuR6XnqtdRclSwa/+hYuym
         dQ3k5pdL9EGCZn91vK7fuToIkCI0bsjtwa9hQwBcbMoEGXdVv4FKi62VtB8P8OQLsgbZ
         WDAw==
X-Forwarded-Encrypted: i=1; AJvYcCXkcb1cG3n1DeXibXfTIxasneW8cMqxsH/t7amkJ04EXIlN97MLepSg9MY9mOLqbKWIsOZTPnXHXyecWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaMSP8gZ2so9T8clgR2jUWIgiMp4JgL0tgAjd2/7biv/jFMmB5
	FVCdqsyLKVZFonsV2p+tRn8fhvQW83aJ1Mn6LyJ8bd9uV5r+vpq7IyAodvICr5cC0ko=
X-Gm-Gg: ASbGncvU8ogXHW2q4af8QUQJcJ3IH4VmTbktw3jb+dnCN6S7SwzWduhsVH7TAnYQyHa
	eLDhVT0WhsNwbVPIY/6llvzWqmIuLtUXW52mRmAg3hGKpw9K7iKgNLOl8e8mA/VGAhJW1J/2yVb
	o+0fc0XlTEXPqPH/CvYEDEdoqUSDefecCgoPQgOjQWKruswU9c9Z3c9u1AjLMkUDt5OywpSCGDM
	40rG54UziLl99ckKa+sQhZQUimHw0cF1TCHE9dPa1UeEBVMO1TC75Nx4SlOMtR3fg7XQZb7W3Oj
	jld7Z6REbT2UeUn5TBKelWtpeS9F8lBvLsYPnNTrzUpiKqdB2NBVqtbHJM20YdMAlL/+A2MxkNZ
	Vab5xgSmOj0lC4fF+m0Yiz1SkJgxWkI72fcimldjPuJRNoAWMpGrcpzzfYQ==
X-Google-Smtp-Source: AGHT+IFf3Dfk1VAV0Y7S/J8epFVv9DK6aEZ68GWSHSQhqH0ufWaX/0UhdYSoDg68NQQ/vOlVIsMBKA==
X-Received: by 2002:a05:6e02:1a8f:b0:427:b642:235 with SMTP id e9e14a558f8ab-42f87374f3bmr135463955ab.10.1760116660354;
        Fri, 10 Oct 2025 10:17:40 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f902962fbsm23231445ab.18.2025.10.10.10.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 10:17:39 -0700 (PDT)
Message-ID: <126d2381-c913-4815-bd9f-b6e9fe3cf5d8@sifive.com>
Date: Fri, 10 Oct 2025 12:17:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] riscv: Memory type control for platforms with
 physical memory aliases
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Hildenbrand <david@redhat.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009181559.7bfa3dce6cb7265822b2d5c5@linux-foundation.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251009181559.7bfa3dce6cb7265822b2d5c5@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_101741_835679_257F9DA6 
X-CRM114-Status: GOOD (  18.82  )
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

On 2025-10-09 8:15 PM, Andrew Morton wrote:
> On Wed,  8 Oct 2025 18:57:36 -0700 Samuel Holland <samuel.holland@sifive.com> wrote:
> 
>> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
>> DRAM is mapped to multiple physical address ranges, with each alias
>> having a different set of statically-determined Physical Memory
>> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
>> a page by selecting a PFN from the corresponding physical address range.
>> On these platforms, this is the only way to allocate noncached memory
>> for use with noncoherent DMA.
> 
> Well that's weird.
> 
>> --- a/mm/ptdump.c
>> +++ b/mm/ptdump.c
>> @@ -31,7 +31,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>>  			    unsigned long next, struct mm_walk *walk)
>>  {
>>  	struct ptdump_state *st = walk->private;
>> -	pgd_t val = READ_ONCE(*pgd);
>> +	pgd_t val = pgdp_get(pgd);
>>  
>>  #if CONFIG_PGTABLE_LEVELS > 4 && \
>>  		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
> 
> OK, but how are we to maintain this?  Will someone be running
> grep/coccinelle/whatever on each kernel release?
> 
> Please give some thought to finding a way to break the build if someone
> uses a plain dereference or a READ_ONCE().  Or add a checkpatch rule. 
> Or something.  Let's not rely upon the whole world knowing about this.

My initial plan was to add a script to scripts/coccinelle so `make coccicheck`
would catch any new instances. This would require some way to avoid false
positives in the few places where these pointers are safe to dereference (like
the ptentp and pmdvalp mentioned in commit message), such as a separate typedef
or a naming convention.

I had also explored using sparse to annotate pte_t and friends as noderef. This
would require changes to the sparse tool to allow noderef to work with a
non-pointer type (and get inherited by any pointers to that type), or else each
pointer parameter/variable would need to be annotated in the source code
(equivalent to __user). Neither seems ideal.

I hadn't considered a checkpatch rule. That's probably the most straightforward
solution, to warn on any instances of "\*(vmf(\.|->))?(pte|p[mu4g]d)p?", along
with a coccinelle script that could be run occasionally.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
