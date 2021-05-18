Return-Path: <SRS0=MbfZ=KN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACDEC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:36:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1CB9611CA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 May 2021 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1CB9611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nfzMBskcnNCHuV6V8OHUosqzATYV7Z4mMK3PyNIj6JE=; b=lSiMHRvzqWUhtTKYG+vq5W9O6
	nn6FTiAhfd80RmzzEWkYdddVetmlh8R1eTa3XgQy9sG6C8tk2LHNTb2+oB5o9XtUlu41QbPxvAm9e
	GlOhBI7/OfK1Qfjz6aWEvXk3dJOskh922Rqq/s8OVqLaa0yRNQww5gIuQqz3QdnJP58KSCDp31epf
	uumW1ESB2KjG2I701H6N/PYxDFir1K+uZy+2H6dDykjF8Az1YNRhsELOWtpXShKV09CoPAriO55/C
	isjGVpVs/6vKrluv8d4gPiKBCeDjFXNLmGoxkdJ0Ej/sQSdGaD7uMBaT2VSTx4hYgoo1sPNRkYD6h
	OApP+F3GQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lix4l-000PKi-ML; Tue, 18 May 2021 10:35:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lix4j-000PKF-I5
 for linux-riscv@desiato.infradead.org; Tue, 18 May 2021 10:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=4vp8lNy9snZR0aaM1NkHvO7WK4qnZ3T1+NZIbLJBP3o=; b=mXexZjmr9KjJr9/kJIEiqwgYCy
 WG1Npr0aC3bTUCcxd1Am88eVpxF97EjJ15aMgFqwYe+qKmighvv2Nq81OB2e9oV/rEpB5JiFF1Itd
 R+T8MpHww5xdH5wpZLTyeZ7Qchz1JFadCZqWobINXxaUiF7V3IMFFr9xHZyTuiwlXoijY4cixRXJI
 JtGDmpd2yk7wg8bgrk9n7531rrF+NcwIxtJBQMr5qqI2+gmed3t847HxRUpL7YMzWW4CCKul7qRq2
 pFtDHSZ2nUDMIsKoSNonLw4b9QFCgWrL7+/PqDHBW3wgUmGFDLnE2lVA4khPwZ7SJlmkTx8A7Eat6
 S6pCvU8w==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lix4g-00EZQh-Nr
 for linux-riscv@lists.infradead.org; Tue, 18 May 2021 10:35:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621334141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vp8lNy9snZR0aaM1NkHvO7WK4qnZ3T1+NZIbLJBP3o=;
 b=IqXaHFo9zpj78XNPpcpDfJf4LPFKu0hP1fZbJXefD6Lnr/sM3c/nnVQOTnNm1kCoWUOQOB
 +5Ik0wgU6Og+rTEa0X9VRjxXLQn01jeSWAfSkO/bws4qSBV2t2cd9FimKdhL3dECNr7eZC
 SlU522kqhceEUPsWUrGp7VFVsxoVuOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-p8HBgk5tMgWCwLvnla4Txg-1; Tue, 18 May 2021 06:35:40 -0400
X-MC-Unique: p8HBgk5tMgWCwLvnla4Txg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a1cb7090000b029016d3f0b6ce4so852636wmf.9
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 03:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4vp8lNy9snZR0aaM1NkHvO7WK4qnZ3T1+NZIbLJBP3o=;
 b=Y5KShghHwANyRDAgcRpXax3iXwOhnEb0Y2A/2pokNuviNeezThS83y+kyUTxFOlgaW
 4Wp7mCilCYtEOhjtvYr8PA9gNuj/EDVS9ZBrqMdDKlwfyGBwQRu0HT36ZvO7w8Vc/fFt
 1mFf60F8c44t4BaqtWaM+hQ0jhNhxxrPAyOoslWaKuNIuHh89pQW8QOMLSRRK/zkGjYM
 WigyvmUv36PAYEXC8btBjbXbycttdI6ZvnK6MmeCPl80BA2Mflj1O5p47VHuEyfd8bg9
 IvSlNtTEy8n+oZa0/uF7OY53t2Q0s+ayaGM9tXFtNkxAFJlHmshajDP8i3QderU8qkck
 ecZA==
X-Gm-Message-State: AOAM532vRULWOVRZojqhh/5HLQqjZIr/YVzwc9dmq61yQGRF0qPdGFpV
 tzZyeKDVlUhXL31tYRYW5oTx3i7/REXdDMpEt9VNTpfhz+lpgUDvG1sNThc/4vB9vDTfxzz0Jz+
 bjrekzMPyZbyQE49/J5H9iiL6eBe0
X-Received: by 2002:a5d:4c91:: with SMTP id z17mr6097344wrs.349.1621334139162; 
 Tue, 18 May 2021 03:35:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwivDOaaOEtmmfekeSrzIxF+whFkS4KLINBSXbPJdxKCFo9r8ATuUwdqMoXxsMMTM3AMH6k8g==
X-Received: by 2002:a5d:4c91:: with SMTP id z17mr6097320wrs.349.1621334138962; 
 Tue, 18 May 2021 03:35:38 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64fd.dip0.t-ipconnect.de. [91.12.100.253])
 by smtp.gmail.com with ESMTPSA id s15sm1725827wrt.54.2021.05.18.03.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:35:38 -0700 (PDT)
Subject: Re: [PATCH v19 5/8] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Ingo Molnar <mingo@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, "Kirill A. Shutemov"
 <kirill@shutemov.name>, Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210513184734.29317-1-rppt@kernel.org>
 <20210513184734.29317-6-rppt@kernel.org>
 <b625c5d7-bfcc-9e95-1f79-fc8b61498049@redhat.com>
 <YKDJ1L7XpJRQgSch@kernel.org> <YKOP5x8PPbqzcsdK@dhcp22.suse.cz>
 <8e114f09-60e4-2343-1c42-1beaf540c150@redhat.com>
 <YKOXbNWvUsqM4uxb@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <00644dd8-edac-d3fd-a080-0a175fa9bf13@redhat.com>
Date: Tue, 18 May 2021 12:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKOXbNWvUsqM4uxb@dhcp22.suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_033542_890310_265CFC62 
X-CRM114-Status: GOOD (  32.09  )
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

On 18.05.21 12:31, Michal Hocko wrote:
> On Tue 18-05-21 12:06:42, David Hildenbrand wrote:
>> On 18.05.21 11:59, Michal Hocko wrote:
>>> On Sun 16-05-21 10:29:24, Mike Rapoport wrote:
>>>> On Fri, May 14, 2021 at 11:25:43AM +0200, David Hildenbrand wrote:
>>> [...]
>>>>>> +		if (!page)
>>>>>> +			return VM_FAULT_OOM;
>>>>>> +
>>>>>> +		err = set_direct_map_invalid_noflush(page, 1);
>>>>>> +		if (err) {
>>>>>> +			put_page(page);
>>>>>> +			return vmf_error(err);
>>>>>
>>>>> Would we want to translate that to a proper VM_FAULT_..., which would most
>>>>> probably be VM_FAULT_OOM when we fail to allocate a pagetable?
>>>>
>>>> That's what vmf_error does, it translates -ESOMETHING to VM_FAULT_XYZ.
>>>
>>> I haven't read through the rest but this has just caught my attention.
>>> Is it really reasonable to trigger the oom killer when you cannot
>>> invalidate the direct mapping. From a quick look at the code it is quite
>>> unlikely to se ENOMEM from that path (it allocates small pages) but this
>>> can become quite sublte over time. Shouldn't this simply SIGBUS if it
>>> cannot manipulate the direct mapping regardless of the underlying reason
>>> for that?
>>>
>>
>> OTOH, it means our kernel zones are depleted, so we'd better reclaim somehow
>> ...
> 
> Killing a userspace seems to be just a bad way around that.
> 
> Although I have to say openly that I am not a great fan of VM_FAULT_OOM
> in general. It is usually a a wrong way to tell the handle the failure
> because it happens outside of the allocation context so you lose all the
> details (e.g. allocation constrains, numa policy etc.). Also whenever
> there is ENOMEM then the allocation itself has already made sure that
> all the reclaim attempts have been already depleted. Just consider an
> allocation with GFP_NOWAIT/NO_RETRY or similar to fail and propagate
> ENOMEM up the call stack. Turning that into the OOM killer sounds like a
> bad idea to me.  But that is a more general topic. I have tried to bring
> this up in the past but there was not much of an interest to fix it as
> it was not a pressing problem...
> 

I'm certainly interested; it would mean that we actually want to try 
recovering from VM_FAULT_OOM in various cases, and as you state, we 
might have to supply more information to make that work reliably.

Having that said, I guess what we have here is just the same as when our 
process fails to allocate a generic page table in __handle_mm_fault(), 
when we fail p4d_alloc() and friends ...

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
