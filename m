Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706E2C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0QDDg802TzxYtTaAdhWXpv4VtmNElMkk1KYJ/1/wqM=; b=R6NfjsEyrfKED5
	y+fEa6jI212VwUeCMiN69YvyYeJSKiUNG6Z0oHhRcdW7VBFsEGeVo6Au347Fqh03cSSpu16Gamcm1
	wXB9wgx9IIPpHb6w3NLSVNkcSvHv0nd8ISLSO0WYuJ+im9+OUvnypJYw6N9Uiyhg/077xIzHuPU4U
	HVt6N8D7iDs0oAMpvHnGgg9zZBsl7nEIqg2vYGYxpzrrV7YLLEXxoGaBnOGw5Ww4lAnp0QRJsthjB
	ubONBLsOnWTgRBBnG+c7OvSL2vxHdf1B/8f9YuCsmmi329ge8OeofcUyA1uihoym06vXo3gYZCuzE
	ad9o8C6DaKCVQw6JrmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRu8U-001Vmi-AL; Tue, 14 Feb 2023 12:10:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRu8R-001VlT-7N
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 12:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676376610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fQGAtPWY8hnlsJbVBZNAgZfYHm1taAI2QR5/9MhuMCw=;
	b=jD3FYNPIHxTQyHz/6Lir9RnQ91fLI1TSQh+Ah7isz3SlnMo/ewDcEygiCzsn48M5Y2mHOb
	qeVZI8dkm40ZiYPiNCRdx2rsVN55tn4h/+ahzkh0F2l9TEcQl+Jw5DF5kdUDBJQxOLojYc
	jLj/yamqPfSnU6XvUHAHBSq7NatCXzA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-lIrNnPc0OV2W7ctBoE3MiA-1; Tue, 14 Feb 2023 07:10:09 -0500
X-MC-Unique: lIrNnPc0OV2W7ctBoE3MiA-1
Received: by mail-wm1-f71.google.com with SMTP id o8-20020a05600c510800b003dfdf09ffc2so7686686wms.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 04:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQGAtPWY8hnlsJbVBZNAgZfYHm1taAI2QR5/9MhuMCw=;
        b=fz2ajB80cp0RcDNIlN5QCgn3nChwHPj6GG4Q3LDP3pIaIOpg62DJ/eaYM69t9p3OU4
         souKwbCXXqji3Id0/474MP1FB6cLUixEg++mBDFEN4MoQ1nvGcU7RHH3KVpFJ5CYbm1O
         vN7hhwmmbL+dbyhrKF20eWX5MyHd7WM9w5/8ir29IZyseCBNgnKvhPzDHtC+UDZVgANa
         NFGLqkOAk5TKPZ8MtXlHHUgBuWgZfbt+ootobfwKzX4uMpb57c/NrX86LFudSWrOXDv0
         GvBMokLj5ESlUt7aOeQ1ZPYGmUp6ZJ1vGKuxDO8Kj+xV2vZK/BzFlRXJPQ1NROnt8OMK
         Iypw==
X-Gm-Message-State: AO0yUKVFsPdFqlejlwk9So5m+Zd5+6C06bja6VQlm7kLAqrU0G2/nL//
	1F03TzfUrARMguCKPN8QOMaMunNjd3imgZudbbbiiW6J1tp99aF+Vcn9lbOsbiGkySXXnD6au0v
	cllMluTuGFejwyVDenFMs05pVcPDW
X-Received: by 2002:adf:fa12:0:b0:2c5:54fd:265e with SMTP id m18-20020adffa12000000b002c554fd265emr1682826wrr.70.1676376607937;
        Tue, 14 Feb 2023 04:10:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/eKR65hGUw7zjA32D3rQxfs8/JgEu3cXxJDUUjr9KXAGFDOM4Uq2hNdzig/HmGGAGmmtSQFw==
X-Received: by 2002:adf:fa12:0:b0:2c5:54fd:265e with SMTP id m18-20020adffa12000000b002c554fd265emr1682806wrr.70.1676376607604;
        Tue, 14 Feb 2023 04:10:07 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:1700:969:8e2b:e8bb:46be? (p200300cbc709170009698e2be8bb46be.dip0.t-ipconnect.de. [2003:cb:c709:1700:969:8e2b:e8bb:46be])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d5409000000b002c558228b6dsm5509185wrv.12.2023.02.14.04.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:10:07 -0800 (PST)
Message-ID: <4c9e7ddb-b303-688a-5fc6-be83ca1a8a2a@redhat.com>
Date: Tue, 14 Feb 2023 13:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-12-debug@rivosinc.com>
 <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
 <20230213143754.GC3943238@debug.ba.rivosinc.com>
 <7693247c-a55d-a375-3621-1b07115a9d99@redhat.com>
 <20230213200109.GA4016181@debug.ba.rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230213200109.GA4016181@debug.ba.rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_041011_376147_9401A7AC 
X-CRM114-Status: GOOD (  23.09  )
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

On 13.02.23 21:01, Deepak Gupta wrote:
> On Mon, Feb 13, 2023 at 03:56:22PM +0100, David Hildenbrand wrote:
>> On 13.02.23 15:37, Deepak Gupta wrote:
>>> On Mon, Feb 13, 2023 at 01:05:16PM +0100, David Hildenbrand wrote:
>>>> On 13.02.23 05:53, Deepak Gupta wrote:
>>>>> maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
>>>>> VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
>>>>> able memory except it can only be written by certain specific
>>>>> instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
>>>>> if vma is shadow stack VMA. Each arch can define which combination of VMA
>>>>> flags means a shadow stack.
>>>>>
>>>>> Additionally pte_mkshdwstk must be provided by arch specific PTE
>>>>> construction headers to create shadow stack PTEs. (in arch specific
>>>>> pgtable.h).
>>>>>
>>>>> This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
>>>>> is not selected.
>>>>>
>>>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>>>> ---
>>>>>   include/linux/mm.h      | 23 +++++++++++++++++++++--
>>>>>   include/linux/pgtable.h |  4 ++++
>>>>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>> index 8f857163ac89..a7705bc49bfe 100644
>>>>> --- a/include/linux/mm.h
>>>>> +++ b/include/linux/mm.h
>>>>> @@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
>>>>>   void free_compound_page(struct page *page);
>>>>>   #ifdef CONFIG_MMU
>>>>> +
>>>>> +#ifdef CONFIG_USER_SHADOW_STACK
>>>>> +bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
>>>>> +#endif
>>>>> +
>>>>> +static inline bool
>>>>> +is_shadow_stack_vma(struct vm_area_struct *vma)
>>>>> +{
>>>>> +#ifdef CONFIG_USER_SHADOW_STACK
>>>>> +	return arch_is_shadow_stack_vma(vma);
>>>>> +#else
>>>>> +	return false;
>>>>> +#endif
>>>>> +}
>>>>> +
>>>>>   /*
>>>>>    * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
>>>>>    * servicing faults for write access.  In the normal case, do always want
>>>>> @@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
>>>>>    */
>>>>>   static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>>>>>   {
>>>>> -	if (likely(vma->vm_flags & VM_WRITE))
>>>>> -		pte = pte_mkwrite(pte);
>>>>> +	if (likely(vma->vm_flags & VM_WRITE)) {
>>>>> +		if (unlikely(is_shadow_stack_vma(vma)))
>>>>> +			pte = pte_mkshdwstk(pte);
>>>>> +		else
>>>>> +			pte = pte_mkwrite(pte);
>>>>> +	}
>>>>>   	return pte;
>>>>
>>>> Exactly what we are trying to avoid in the x86 approach right now.
>>>> Please see the x86 series on details, we shouldn't try reinventing the
>>>> wheel but finding a core-mm approach that fits multiple architectures.
>>>>
>>>> https://lkml.kernel.org/r/20230119212317.8324-1-rick.p.edgecombe@intel.com
>>>
>>> Thanks David for comment here. I looked at x86 approach. This patch
>>> actually written in a way which is not re-inventing wheel and is following
>>> a core-mm approach that fits multiple architectures.
>>>
>>> Change above checks `is_shadow_stack_vma` and if it returns true then only
>>> it manufactures shadow stack pte else it'll make a regular writeable mapping.
>>>
>>> Now if we look at `is_shadow_stack_vma` implementation, it returns false if
>>> `CONFIG_USER_SHADOW_STACK` is not defined. If `CONFIG_USER_SHADOW_STACK is
>>> defined then it calls `arch_is_shadow_stack_vma` which should be implemented
>>> by arch specific code. This allows each architecture to define their own vma
>>> flag encodings for shadow stack (riscv chooses presence of only `VM_WRITE`
>>> which is analogous to choosen PTE encodings on riscv W=1,R=0,X=0)
>>>
>>> Additionally pte_mkshdwstk will be nop if not implemented by architecture.
>>>
>>> Let me know if this make sense. If I am missing something here, let me know.
>>
>> See the discussion in that thread. The idea is to pass a VMA to
>> pte_mkwrite() and let it handle how to actually set it writable.
>>
> 
> Thanks. I see. Instances where `pte_mkwrite` is directly invoked by checking
> VM_WRITE and thus instead of fixing all those instance, make pte_mkwrite itself
> take vma flag or vma.
> 
> I'll revise.

Thanks, it would be great to discuss in the other threads what else you 
would need to make it work for you. I assume Rick will have something to 
play with soonish (Right, Rick? :) ).

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
