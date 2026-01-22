Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1992D3EE89
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tNW/QJh2Q3qt8sZgDt6Qy+4SirHp7ngMnxyGtfzlgZA=; b=mLMW7jZiz6tGSUlMkCD99GPQAp
	dcgrGU7dxCZCg0Ho/Fg14j2jf8v5pHZ7rJ4kZ5+iaCaGwROzh4vA1cxQlZZvuTw1YVuuNyj6byJQZ
	rUqSJXMTY1hihHN/b+AKDLdlyKdYk4sAhAMwPa2M5KuZbsAD5BqRD4dankdzM/eFzhCEyv1BQL4qz
	f2TE7zbT5nvu5txXpqqBWZj5v9/YlSvpfbcXqAqg2f+0LrXF1vccndj2EwhEyF6TTsrGtGIKRUSSJ
	nje1d2MrXfyiElmBDNHTveNb5ryu2l3IXAJ3kTaykpE3f8LiMsfTFvB3/2aPJCmfiF9jKnW3xba75
	zQquP2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixdb-00000007SLV-2Np8;
	Thu, 22 Jan 2026 16:34:27 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixdY-00000007SKT-1GPN
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:34:25 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-5f53021703aso419051137.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769099662; cv=none;
        d=google.com; s=arc-20240605;
        b=PliWrCKNkj8+K9nClkAc439zI3RBaekgcEtvnsk7gnY2oYv3naOPc0BYIs4tD8fDIq
         5EwbPtuaLOA8llSLDEIhvkwvoXw8NKlh2/qlImgZvkdDcuArvibeK4/I5RR8UkxlF84R
         0NYVPRXJoa/KVK1tnlIeCT4cUZQMX57/Np5kDnYo7vxIfUxCQSh4OcX0dKh4c5v0tkm5
         ce953QMXrxXIqVt8I92WSrASYPaK6L9RJZ6IiB3smJ4T4HkudM/hgPddpNgEE9fyYUG6
         Sj/38FFMVHE7vbCJAfGVkE/k3LWUpTJa5Yul+pC8nsVI0COH38HUbWJX24JooKglCrBD
         EHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        fh=cQ8nULBxStKNxM3LdflwnapdtNqZ7F2QqQ5PeuvYG/Y=;
        b=PidZmaTyQN54W0m7MeF4lRCgyDf7fEVUBzLo13/5hEO3eeo82VEXC70amrhJ0ty9T/
         Rv+fh/DFFs+VJ3gKb+Yub19mNcwJ8NO7UMRIu4otFF1ucoqWmuvejGK3lqslZLMF7+tT
         nK8DmFSfM3b7PT71ErvBkv6hjGhQzWapNycdsru95zvSo3w3/+CYUGs2m/1jHimzoi2m
         Y+zpUQ9NqdePqEwTRbJYBaFWCY4kMJSAVzRPmhGr4E8i9DkDCKSYQl3+okqFw5Qq/WMy
         rEadpQrUMF5ZOZnNdvmcNCKaGcju9YkjPZhFmfEaaGttEwvP7Gaha/8d4TqARkyBjJsW
         NLtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769099662; x=1769704462; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        b=bZhXwJWQJQiMk9Nye7YcGl6e+nHJsoJLlZbSTtk9O/W5YICOjV8pRb6614zB6ML820
         Df0eblXft2Nlqkq4mVGrTJDhj4h8+YNVyhCT0Zvel/y2EhGdfy42sHjrwxgenawDve5j
         5vV9pPvzpsRRIGaDE89Ijm6/WdVLPzapzArvO5A62VG3Xk+B3V04Esg1VAYafNwUXoBZ
         pGePWREHMxB10k0k20/aiIPei1T3aWV7Ol/9hD1uEdonSSAZS/HPb1Y2QG6qwX0aLatF
         itvO9Sm+z6K0OOMR6fsKYrnNlrWpoEY8nFUs/ho1exRrfDEce/7LisAWoUFVcgUz6Qhb
         IO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099662; x=1769704462;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0r70yq+P7UB3qkVO5/x8sBghKy9pd209cUDvkPIBxI=;
        b=K8akQyq330r9q+BJQqsSRUuV/eKsCh3x6a1ivo5mjFyfpNfUeb+pVCzVEnZ+NhODLA
         MhMC1sYpRW2CIVbAuuEr+yVkf1UPsITp14UUneux9SA0vThTWwDJcoD7HerYFuVvc/Ai
         honmiQdyx3f1s098cDQ2AbOCKTLp6STPBGTOzId4tQIO7EhgpBm8Ha/mP1eaWI+qh/ZF
         NprkssoYyOiCb2OBJeI0VlCH8jXH1AjNC6WleVoatVE1IR38twCNFrGkL9fRWrPDiip8
         jRUwpk8dzJc3NTXa0/RrM5zJyul59ekwNA5ywrU4wUzB4Rv5hvk6lsXX3fEWelhwUpY3
         CQaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSuKOrRqlhg6iouv4wxqMXoK8RGO/p6J3MJYlbYADRio7DIzoTz4OjkPrBdgDbmEQfioWhMQObYmIWUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMv0kb6eI8EiZvW6LPQqmqrXWwyKLCXYRvPXWS7jB9Uitv/tuc
	Armu8tpNCZdFJKChdWf5zmKHDzRbQwCPDkuhj1jS5xYOmmyHXSNgt1OOFg86UFk1IYormkEQbnt
	MyLrSSmr9HpFyf/f4TFEarushuBMBDLbS2kIlVPoi
X-Gm-Gg: AZuq6aJ3C/5hDQso8PXB4SUKt2zEtJILKVyedy6xA2EoW8xjcmO8Q5W+vBfdIy26a+Q
	+X08ZHVRoBn8EX1RD/DHuZd8QsW92sovtkc9DMPB95ezyPeik02bR5L6X9Mn6G9LDq6SUp6+8XD
	KJglHDZQs2yxFVZd9+L7ZkLXN6JqlzNcFxEsy0MRl4A8ncgZaL17JSvDN3cnp06sk+MCByjDwLj
	R6sFXaPIzG545XIwV2TFLI8CMCNeCPKmaCZYDKKAOFVQyerrCvDleexhp+8EYCAIRd7RhSzHlZR
	2KVQ
X-Received: by 2002:a05:6102:c52:b0:5ee:9e4b:a81c with SMTP id
 ada2fe7eead31-5f54bc6d8edmr83779137.22.1769099661387; Thu, 22 Jan 2026
 08:34:21 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:34:20 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 08:34:20 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <CAEvNRgEzVhEzr-3GWTsE7GSBsPdvVLq7WFEeLHzcmMe=R9S51w@mail.gmail.com> <a2b79af7-e5d1-4668-bff3-606f57d32dfc@amazon.com>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 08:34:20 -0800
X-Gm-Features: AZwV_QgNvHql-EMuz2B4VijAKAK9511fycMrz6pi1d87rdZBUNlP58MQhoc9tIU
Message-ID: <CAEvNRgF46M1jp0+eBu2wQMO7P1afyo00SOkENFwvB2KYX3dnFA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
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
X-CRM114-CacheID: sfid-20260122_083424_382535_76C67CC8 
X-CRM114-Status: GOOD (  24.08  )
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

Was preparing the reply but couldn't get to it before the
meeting. Here's what was also discussed at the guest_memfd biweekly on
2026-01-22:

>
> [...snip...]
>
>>> @@ -423,6 +464,12 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
>>>                kvm_gmem_mark_prepared(folio);
>>>        }
>>>
>>> +     err = kvm_gmem_folio_zap_direct_map(folio);
>>
>> Perhaps the check for gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP should
>> be done here before making the call to kvm_gmem_folio_zap_direct_map()
>> to make it more obvious that zapping is conditional.
>
> Makes sense to me.
>
>>
>> Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
>> this call can be completely removed by the compiler if it wasn't
>> compiled in.
>
> But if it is compiled in, we will be paying the cost of the call on
> every page fault?  Eg on arm64, it will call the following:
>
> bool can_set_direct_map(void)
> {
>
> ...
>
> 	return rodata_full || debug_pagealloc_enabled() ||
> 		arm64_kfence_can_set_direct_map() || is_realm_world();
> }
>

You're right that this could end up paying the cost on every page
fault. Please ignore this request!

>>
>> The kvm_gmem_folio_no_direct_map() check should probably remain in
>> kvm_gmem_folio_zap_direct_map() since that's a "if already zapped, don't
>> zap again" check.
>>
>>> +     if (err) {
>>> +             ret = vmf_error(err);
>>> +             goto out_folio;
>>> +     }
>>> +
>>>        vmf->page = folio_file_page(folio, vmf->pgoff);
>>>
>>>   out_folio:
>>> @@ -533,6 +580,8 @@ static void kvm_gmem_free_folio(struct folio *folio)
>>>        kvm_pfn_t pfn = page_to_pfn(page);
>>>        int order = folio_order(folio);
>>>
>>> +     kvm_gmem_folio_restore_direct_map(folio);
>>> +
>>
>> I can't decide if the kvm_gmem_folio_no_direct_map(folio) should be in
>> the caller or within kvm_gmem_folio_restore_direct_map(), since this
>> time it's a folio-specific property being checked.
>
> I'm tempted to keep it similar to the kvm_gmem_folio_zap_direct_map()
> case.  How does the fact it's a folio-speicific property change your
> reasoning?
>

This is good too:

  if (kvm_gmem_folio_no_direct_map(folio))
          kvm_gmem_folio_restore_direct_map(folio)

>>
>> Perhaps also add a check for kvm_arch_gmem_supports_no_direct_map() so
>> this call can be completely removed by the compiler if it wasn't
>> compiled in. IIUC whether the check is added in the caller or within
>> kvm_gmem_folio_restore_direct_map() the call can still be elided.
>
> Same concern as the above about kvm_gmem_folio_zap_direct_map(), ie the
> performance of the case where kvm_arch_gmem_supports_no_direct_map() exists.
>

Please ignore this request!

>>
>>>        kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
>>>   }
>>>
>>> @@ -596,6 +645,9 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
>>>        /* Unmovable mappings are supposed to be marked unevictable as well. */
>>>        WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>>>
>>> +     if (flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)
>>> +             mapping_set_no_direct_map(inode->i_mapping);
>>> +
>>>        GMEM_I(inode)->flags = flags;
>>>
>>>        file = alloc_file_pseudo(inode, kvm_gmem_mnt, name, O_RDWR, &kvm_gmem_fops);
>>> @@ -807,6 +859,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>>        if (!is_prepared)
>>>                r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>>
>>> +     kvm_gmem_folio_zap_direct_map(folio);
>>> +
>>
>> Is there a reason why errors are not handled when faulting private memory?
>
> No, I can't see a reason.  Will add a check, thanks.
>
>>
>>>        folio_unlock(folio);
>>>
>>>        if (!r)
>>> --
>>> 2.50.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
