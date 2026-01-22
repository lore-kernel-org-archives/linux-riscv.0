Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC3D4697D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 00:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fKvs1pY4Jq3ubfCSU2TFGwSG9nbBSdzBDST4PRYZ79o=; b=jpsBSE5PXDDYqnDsT0mcciZd7J
	PF93aAxpH8MinOlJXsWsjWIeMjtEzjo2J4W0Xuv32QFoybzF5Sd6Jv/4Xq0gBeL/UxpKQT+6S7Wqt
	xgH4RmhkEES1jPyzehKDNSG668d9WCKJNg0Z1zvbiX1fvCY/K/lHWEyTGKKNU8ZXuxZUyruHkZSgB
	38TvRCVMsVndLyt6MVmgwevYcFsZAm6ZICrAc2jy4pR9wlbQL3Res08mIGzM6Fv/BhI06CM4zm/og
	z0jkfE03Oiye0oWwRqf55bShVExZvq1YAMoGh2+V/HwusosSmts5j9zwdjZmytfd21R1u6PZZZJTK
	RNVApyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiR2-00000006CkH-22VZ;
	Thu, 22 Jan 2026 00:20:28 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viiQy-00000006Cij-39hG
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 00:20:26 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-93f523bba52so206739241.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 16:20:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769041222; cv=none;
        d=google.com; s=arc-20240605;
        b=kFIMCXHE2AhIcRH4urgjqrTF0e1OHVoyRS5y4NvnZuh7qx2AGGI8T8sljuT4vTsx4G
         MwBhsiiVBUZEsiQleHKXxWGiBad9RlCkRb47jYX9ph7vBojD1uJI6p8CnPfiXB1TTyZt
         VsleNzrcwvLjz6Q8SEtEPdBOUadZDRHQjF217sXiRdifRBUPWgoJdH+ajP4IjHI6imiZ
         0WON3SMUg13ECW+yHnUK3hGIP9Unjz0aNJc1plzsHLpYdHLt6vP3Nud9JkjS6Sb6YBAq
         gtQhwkgqLw8GkYlHMEwhaxMJJG56f5EJtZYo3ID0Wpg3KvM+BLCiUwr/l7G2DLbnJwK4
         gnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        fh=S8N4c0ZsglAoN58GmTmUSNZDWvnQuQQBYfMQXlNd1fA=;
        b=klEC1qvcfbF3myKHF3byaJfdT6dFkfCsQeNbiO+VVGIvWDb93pDvDvmL2nokzaRtOg
         3tkSpUFtGrcoe5ylsoljtGZwKSg3UO98h2CWr2+R+gjEXrY0ADbEWvllveEbq0SYioog
         pgJZgTvTMwOLIhCUp9yw4FhBKMcS42prgrj38Yu1ESbgaPw1n4uD+JnlTWS58AqGQNmY
         ku6Xa0VaeKswMbK8LFTKsWW7pN0DFeuYA9ayTgGn7QBvsEmDtDvpjv/MKFB6w8h3tfd3
         wYYBLWGPtA0GI6994jtkdZPXeI2JgrMpod7clW/O9hkDpmPlf6MF3wWPm/Z6Ybr6Yfal
         /Y9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769041222; x=1769646022; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        b=0lUTW2RONVOH+jCjRSf11uwZAi0uamnn6sT6FmozDTG9r1wej5wTPUdsEYJckjBSVd
         TgZ2RW3ChCz6B9AzDpr0zG6n0OgZp95ks5+YSyqpayqFRTWvpCbiCqmi34MuC6nmqe3v
         WfdR5EIIF/fRlsM/pdJ12hFg3R3vCpf3ZIuZqJl9CNhdYrFPAWKUppL9v1cVcWkfPnbF
         BqXJYezExxE1CXCDN16oVuZlbP0HPKXVOXojJWOmMEK0fvvuLtI5SzgjBHGyI25hqDad
         o/TKB1aj4KNkokuoyKRcZJi0exsxY2Qa/mUFtbueSiJnOO6SMAItTevpsdxTfUzKocwY
         /WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769041222; x=1769646022;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgWkbldIsVdXmF1uopkpscBQ8hvxBRp9zzbekpxQ/oc=;
        b=YDu3gYzLbKrrNxxu5TI6kmH9JJEMQxFJgqk7ljHJKMNS1kR698wFOYrr47oEGFjsw5
         iPP14k7OVND33Qu9PE9xPZuL7gjeGE+7dqbxB/7BTZxD9hE1D1gl22N7THQ+vUvUSTCG
         /1XH6bY0/cEL3jCZZxRG02GyZl00LED805XgegEKPfoaqL2jUFMAn6iHJt9fdgj77Fw/
         ANog9M90Bt97StQqa0iIYmtvSwHqhfH4Cog72084cT2hZ/kr+3OMqtmG+Dtz7nWqeKy1
         UvqRAfSV5G/Gbvg3SwL8pf2ciQTrakzhjRreQKGi8zJnLuxqSbw//AY40c51Ms9FNhqt
         OOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj1AAdLi6gATu/XuUB3lbnmsEt5zmkwnHfbE6Kf6GO4j6mcJtEyk6YeM69s8kKrKiVbpL6rzFQp3miOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YySy4DtmbbnorBTDVeyBB6haEqcOAIlbo6OkKB2mRXLrgkw1sjk
	IKc25pesy/38+jVvdnHzG00g7X1pPxMp3noZjIuPAhlIZg66uKetA0o03jHv5rZdIw01Vw4myAm
	PtEKNzdqyAl2SSxGnZ3lkCHC6C4q/P3qSZU286OHO
X-Gm-Gg: AZuq6aLrel8387ecRL7KAWHPZBoqc6B8fjtsPlgRLv9qSJFOyZnXi4dCvFfmlrUUuhI
	60hvtBSCmjU8ptKvCAi2N7jmeVPpOdUi8Dg9TxfrHZpNfoZNbBMvMXm5T8ixiFZ7IbGnJgfJrg1
	fwKNFJ74/21//TuhEUD3ZxooRnozDJHAaK8n9kmJsIMmlK34t7pWbFPmpV9/sKMI6vbzkUfZgy/
	uJMcdLhJGTzesFIXGSu+Mr6+D8N2V+h8HAmTa5rGmrCKWtevyNR4bkDLYN8W8E0YS7KKijy7osl
	75uv4DGHMXUEZ7jC+b0LZHNHMQ==
X-Received: by 2002:a05:6102:370f:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f532daa025mr403198137.5.1769041220288; Wed, 21 Jan 2026
 16:20:20 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jan 2026 16:20:19 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jan 2026 16:20:19 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <6b50a83e-acd7-4db3-ae9b-015ffad4f615@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-3-kalyazin@amazon.com>
 <CAEvNRgGrpv5h04s+btubhUFHo=d6mBFbr2BVrMt=bWuWOztdJQ@mail.gmail.com> <6b50a83e-acd7-4db3-ae9b-015ffad4f615@amazon.com>
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 16:20:19 -0800
X-Gm-Features: AZwV_Qi8Ad3srMrd8WYJ_YHR6Nmvzc-hfHPfYm40mDZ1I3o7aAQCl-nKoDyQfts
Message-ID: <CAEvNRgHMdnALNfT0SuEb-gqM1Aq1c6U_nRB2GzC0jYqrDRJTOw@mail.gmail.com>
Subject: Re: [PATCH v9 02/13] mm/gup: drop secretmem optimization from gup_fast_folio_allowed
To: kalyazin@amazon.com, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_162024_809003_4486D3BE 
X-CRM114-Status: GOOD (  18.70  )
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

Nikita Kalyazin <kalyazin@amazon.com> writes:

> On 15/01/2026 21:40, Ackerley Tng wrote:
>> "Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:
>>
>>> From: Patrick Roy <patrick.roy@linux.dev>
>>>
>>> This drops an optimization in gup_fast_folio_allowed() where
>>> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
>>> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
>>> by default"), so the secretmem check did not actually end up elided in
>>> most cases anymore anyway.
>>>
>>> This is in preparation of the generalization of handling mappings where
>>> direct map entries of folios are set to not present.  Currently,
>>> mappings that match this description are secretmem mappings
>>> (memfd_secret()).  Later, some guest_memfd configurations will also fall
>>> into this category.
>>>
>>> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
>>> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>>> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
>>> ---
>>>   mm/gup.c | 11 +----------
>>>   1 file changed, 1 insertion(+), 10 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 95d948c8e86c..9cad53acbc99 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2739,7 +2739,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>>   {
>>>        bool reject_file_backed = false;
>>>        struct address_space *mapping;
>>> -     bool check_secretmem = false;
>>>        unsigned long mapping_flags;
>>>
>>>        /*
>>> @@ -2751,14 +2750,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>
>> Copying some lines the diff didn't contain:
>>
>>          /*
>>           * If we aren't pinning then no problematic write can occur. A long term
>>           * pin is the most egregious case so this is the one we disallow.
>>           */
>>          if ((flags & (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE)) ==
>>              (FOLL_PIN | FOLL_LONGTERM | FOLL_WRITE))
>>
>> If we're pinning, can we already return true here? IIUC this function
>> is passed a folio that is file-backed, and the check if (!mapping) is
>> just there to catch the case where the mapping got truncated.
>
> I have to admit that I am not comfortable with removing this check,
> unless someone says it's certainly alright.
>

Perhaps David can help here, David last changed this in
f002882ca369aba3eece5006f3346ccf75ede7c5 (mm: merge folio_is_secretmem()
and folio_fast_pin_allowed() into gup_fast_folio_allowed()) from return
true to check_secretmem = true :)

>>
>> Or should we wait for the check where the mapping got truncated? If so,
>> then maybe we can move this "are we pinning" check to after this check
>> and remove the reject_file_backed variable?
>
> I can indeed move the pinning check to the end to remove the variable.
> I'd do it in a separate patch.
>
>>
>>          /*
>>           * The mapping may have been truncated, in any case we cannot determine
>>           * if this mapping is safe - fall back to slow path to determine how to
>>           * proceed.
>>           */
>>          if (!mapping)
>>                  return false;
>>
>>
>>>                reject_file_backed = true;
>>>
>>>        /* We hold a folio reference, so we can safely access folio fields. */
>>> -
>>> -     /* secretmem folios are always order-0 folios. */
>>> -     if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
>>> -             check_secretmem = true;
>>> -
>>> -     if (!reject_file_backed && !check_secretmem)
>>> -             return true;
>>> -
>>>        if (WARN_ON_ONCE(folio_test_slab(folio)))
>>>                return false;
>>>
>>> @@ -2800,7 +2791,7 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>>>         * At this point, we know the mapping is non-null and points to an
>>>         * address_space object.
>>>         */
>>> -     if (check_secretmem && secretmem_mapping(mapping))
>>> +     if (secretmem_mapping(mapping))
>>>                return false;
>>>        /* The only remaining allowed file system is shmem. */
>>>        return !reject_file_backed || shmem_mapping(mapping);
>>> --
>>> 2.50.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
