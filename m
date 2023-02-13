Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDFC6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlMbzp+a1CSje8k50pmCejmHMCBaefkuecLWfEiFFUk=; b=T8I0G/5J60FSnT
	+QhzqjF5YKru62etOYkXyFPYLaZbZ2uvR7lJ/J3uJJKM5rhnqsDH9VDYmxZVkW1ECprn/GGRbHn72
	ejhFCDFNeO5s4Aee64vBh/SFGnD8swsJXH0W3Obb7YaEKTHemdZlYrjhcbrNl3OCfTaCxvSVnqEmW
	UvGhsx8M5hI0q7LuvwW122rvgV+zaA4FV6HT4nnQcwaZzBeNpCq8pA1YDK9L9YKHxu7TJeyEgJLeO
	aEUEwM4xZs1nR/vv3JDolC0z+5jQzWw8fWIzGU29nOAgAD/SbTKrNoNtnvwz682Lmv6Ew99/WnmIW
	A6olFkPT0NOhiVM3pCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaFu-00F4Da-Sv; Mon, 13 Feb 2023 14:56:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaFr-00F4By-9i
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 14:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676300186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcbvgdOnqyzXVAQogo/oCkD+sYlM47nFoe7fwRrExSo=;
	b=hS+TfkJcbEl3SBRsqWNqXMDEG2+xrfESdtZWPzM6u59AiiHWDbni2gc4aauP0ybGPjFIPg
	CtdGX2LiA23PDqQ3NtlBb7NXh4AnkJX+ctU4Znkwjf2Rv81NAyy5S4n3ol9hlTItQidGDL
	13WlYKrLN9BEygn9ka8YZy2aZf6fhus=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-mUpJW2gjMwW3VBQ0Y9jXSA-1; Mon, 13 Feb 2023 09:56:25 -0500
X-MC-Unique: mUpJW2gjMwW3VBQ0Y9jXSA-1
Received: by mail-wm1-f70.google.com with SMTP id k17-20020a05600c1c9100b003dd41ad974bso6970800wms.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 06:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcbvgdOnqyzXVAQogo/oCkD+sYlM47nFoe7fwRrExSo=;
        b=AmHvozmHsZeTnS53PCwcpAmll22/on74MwtwhAvHi+5Tk5ok/Uj0MS1OWxOFQHPhuu
         0wDq9svRJgZL3TT5fifJWtSMddwEMzlJYyAjXqs+tilWiL8suY3pOLs6eVAhXJL1AoQM
         qhx9BbHRubHOo/7K1inlo0JIKxXRkeudxle8NuKoW2X6TWEc0UlaIaj8iynLt3oj3JrM
         jfatC/oj25fhfwpQtJnO/UPJFULetgjY90SWPaW8h/eNg5+XSo2Wek8GeQeYjIAunIBY
         5VRDkq5Mq0P29aTFejl6TIEuZ5hc2M5OPfrroIupxfDgTeY4qEFR/aq2fJ7Y6XIb8nf1
         z6tQ==
X-Gm-Message-State: AO0yUKX3jL7Xn4vZ+Po2ZCBF6zjR2bJvThtFeJ0BgtXCWxe5lbNjSmds
	9XtR+wMXEOdgxr3r0XGRADEeicqXHp30X5BjsGcYdxeExteywWca4Ho5w2SqSOALzv8vHD1Zj60
	gHuUwNq3fQaW2foCGHhAznlED3dDku131DQ==
X-Received: by 2002:adf:e5ce:0:b0:2c5:4d97:4a23 with SMTP id a14-20020adfe5ce000000b002c54d974a23mr6683048wrn.70.1676300183676;
        Mon, 13 Feb 2023 06:56:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/wp7iAqKD66CPLnH5FMLYm4u2nsJT3GTHCfZvBlZXNJR8IoCTQJqlclnW3q98J4QCVN7UwtQ==
X-Received: by 2002:adf:e5ce:0:b0:2c5:4d97:4a23 with SMTP id a14-20020adfe5ce000000b002c54d974a23mr6683036wrn.70.1676300183412;
        Mon, 13 Feb 2023 06:56:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:6d00:5870:9639:1c17:8162? (p200300cbc7056d00587096391c178162.dip0.t-ipconnect.de. [2003:cb:c705:6d00:5870:9639:1c17:8162])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d5409000000b002c558228b6dsm3365811wrv.12.2023.02.13.06.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:56:22 -0800 (PST)
Message-ID: <7693247c-a55d-a375-3621-1b07115a9d99@redhat.com>
Date: Mon, 13 Feb 2023 15:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-12-debug@rivosinc.com>
 <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
 <20230213143754.GC3943238@debug.ba.rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230213143754.GC3943238@debug.ba.rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_065631_445039_B8EEAEEB 
X-CRM114-Status: GOOD (  24.98  )
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

On 13.02.23 15:37, Deepak Gupta wrote:
> On Mon, Feb 13, 2023 at 01:05:16PM +0100, David Hildenbrand wrote:
>> On 13.02.23 05:53, Deepak Gupta wrote:
>>> maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
>>> VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
>>> able memory except it can only be written by certain specific
>>> instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
>>> if vma is shadow stack VMA. Each arch can define which combination of VMA
>>> flags means a shadow stack.
>>>
>>> Additionally pte_mkshdwstk must be provided by arch specific PTE
>>> construction headers to create shadow stack PTEs. (in arch specific
>>> pgtable.h).
>>>
>>> This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
>>> is not selected.
>>>
>>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>> ---
>>>   include/linux/mm.h      | 23 +++++++++++++++++++++--
>>>   include/linux/pgtable.h |  4 ++++
>>>   2 files changed, 25 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 8f857163ac89..a7705bc49bfe 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
>>>   void free_compound_page(struct page *page);
>>>   #ifdef CONFIG_MMU
>>> +
>>> +#ifdef CONFIG_USER_SHADOW_STACK
>>> +bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
>>> +#endif
>>> +
>>> +static inline bool
>>> +is_shadow_stack_vma(struct vm_area_struct *vma)
>>> +{
>>> +#ifdef CONFIG_USER_SHADOW_STACK
>>> +	return arch_is_shadow_stack_vma(vma);
>>> +#else
>>> +	return false;
>>> +#endif
>>> +}
>>> +
>>>   /*
>>>    * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
>>>    * servicing faults for write access.  In the normal case, do always want
>>> @@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
>>>    */
>>>   static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>>>   {
>>> -	if (likely(vma->vm_flags & VM_WRITE))
>>> -		pte = pte_mkwrite(pte);
>>> +	if (likely(vma->vm_flags & VM_WRITE)) {
>>> +		if (unlikely(is_shadow_stack_vma(vma)))
>>> +			pte = pte_mkshdwstk(pte);
>>> +		else
>>> +			pte = pte_mkwrite(pte);
>>> +	}
>>>   	return pte;
>>
>> Exactly what we are trying to avoid in the x86 approach right now.
>> Please see the x86 series on details, we shouldn't try reinventing the
>> wheel but finding a core-mm approach that fits multiple architectures.
>>
>> https://lkml.kernel.org/r/20230119212317.8324-1-rick.p.edgecombe@intel.com
> 
> Thanks David for comment here. I looked at x86 approach. This patch
> actually written in a way which is not re-inventing wheel and is following
> a core-mm approach that fits multiple architectures.
> 
> Change above checks `is_shadow_stack_vma` and if it returns true then only
> it manufactures shadow stack pte else it'll make a regular writeable mapping.
> 
> Now if we look at `is_shadow_stack_vma` implementation, it returns false if
> `CONFIG_USER_SHADOW_STACK` is not defined. If `CONFIG_USER_SHADOW_STACK is
> defined then it calls `arch_is_shadow_stack_vma` which should be implemented
> by arch specific code. This allows each architecture to define their own vma
> flag encodings for shadow stack (riscv chooses presence of only `VM_WRITE`
> which is analogous to choosen PTE encodings on riscv W=1,R=0,X=0)
> 
> Additionally pte_mkshdwstk will be nop if not implemented by architecture.
> 
> Let me know if this make sense. If I am missing something here, let me know.

See the discussion in that thread. The idea is to pass a VMA to 
pte_mkwrite() and let it handle how to actually set it writable.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
