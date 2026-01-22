Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949DDD6CFAB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=32x7XLQp7mx2Qv9NO5EECrqi9ClL4+LHrtSQXkY07Pk=; b=rxCvDOa9Otww7M9ik3shpd+26h
	EyRU/f7pPPXV4eLIacFUEY/KMTqW2xkmPif4Nb+0r/tWP0GlECgkhWTmwCeaYGJm2njbeExqxqcEG
	O98XQXZUuS6PEa9Ssr1zHHjkCiN7/JlbAuOQy+XEe9HY0ZKCHt+sljUzYH0mx3tCXDqq4hzDLc1Hj
	cV7xnAJPjd1Y2I+fCTN2WXBd4kYtE5QXffVZAXAYMwSR2G0I9qaVgy9dVnDBt3nyhRSgzeCPCc5SN
	nQLNnKlxAZS2Oo9QUeQSf96FR8WJhIA/aW/sG2ijUtt2AIZ8/Am26cLx+ATzpP9JQJeIBwMJpAEj2
	eny6bk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Sh-00000007rTM-419P;
	Thu, 22 Jan 2026 22:47:35 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Se-00000007rSb-0qoZ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:47:34 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-93f500ee7b8so896720241.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 14:47:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769122050; cv=none;
        d=google.com; s=arc-20240605;
        b=I7el0wSk2SCyYxnIwgGGTAjEkETwhr3EPLIzmE+N8vxzqarZwxBpeESESCbSD8uTta
         ytKip/QHUcRULBzJiGjJ3XGG/FPjh9YQahBzXi4QN/dNmwKbDIhy1LhO40JiX+n+4My7
         UR8YBmdEv9MRYa75idOznajz/nwpOrPDpfsPZ4FXuNZ8YtdXIR3yy1ZRAmI0yDgN7KWM
         Ihvw8KwnHkp2WrWi8Vu+vjmZTTAzVUCzlLz90EB01/ugSbX/5Q3XuQ7U+iWp35175ZnG
         Sdcy3p5qEBS7YaFMWAZUY7zJAmq+sXul+w28cZdklMTrl041qJ8nkHExLMGorr/MQlxh
         UOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        fh=JoCOXYwWIIUOYxHQekFMqyuVaKoCFA1sKifFx8DV4Fk=;
        b=f3D/tFCWzRlcH/5V/XS57GZfsBTfIAsuLVqdgvSgFaO4wyd8I7ddMx+VORh7Mtmjwc
         RqtzCtpPxa/QvHm6jpj3jKOzPS6qHlUhYQqfxXHOI+P1Ho1Tt8CjiYiu84JIPjIAD1np
         SjPKYJlzncINyr+ntRLyr3k2hVrTniB2p0vRgQcAxoauz32B3vGJJXDXGZ2d9kBisUMn
         qV917WAzRzSQfMZjWCj8ytgPon0j3GnPfE50DtYYIc2jZ/g0M78fqObNL9uYl/9xjcdJ
         IhFHKtl1txOzHRB+K5AfiFAXlwlQYPZjyQXSI5US8w+7G8RA1ye85sSXK/NFAdUmH6B3
         3Oxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769122050; x=1769726850; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=3BMycUxmGo4OVYqWOtvzK+Mo+MrhrOAUdlfmUmPI7Pvk68ldbKS+GUeQREeqVSOWFw
         jLxsgX9dv1hUnUjGav9vimjxxApa1cVGDrs1wYYtfc166cd/JNZGqcGS/PlwIsUer1sM
         yAv53wIQgJRTEjLy8D4m0KFfjBKgQSP7GgJUoZMyizncz+40wqxq0c0Otho+8GWuriZB
         PePTU5MibVLwyT8MRI9pYq3fMYTBZzZyR0r3G8g5RNbI9vQ7avMAZRDGzeWJNrrkMzRU
         AE1DWfbaeUW9JjGOnsXpfAblArYwSn9eop/gBDvuPfMbKWscRZ6Mn5ZrKTjwXJe20/DO
         iffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769122050; x=1769726850;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xs+dLd9PKnX16GE3/TgauaKHwwAlEIk3gXFN84JGCiE=;
        b=MUnJA5JUzvWBmh1CmNFpzjJt0n9H1a8ITNCO2M0zZyWUv84B34m/X9yEgSwUnc+Es4
         S32+nqvmfNvniWwyDngaSq4tzADYh71/n3GMoGKTAwdMnQgiR5QUeMM6k65dmPQqBPpK
         3Juj8YSowp0vbGR9MF8afz5Oc+h/yrIZ/R5RrfJd/UG1SteS7OIiWk4bMsjgvnOx/OYI
         Q71Wm9gCLkWwSVcy6dUsq034yxix2ANrIZoUJ+qmhlcIVtNE0DdxRZNcu20QHCXT+ISh
         l/3jSzPhfa8ztjaFxgRN+nGUrob2LinTitdef6BSfHKR858Ui9/hgpVdKgIVYtydJ9t3
         /vIg==
X-Forwarded-Encrypted: i=1; AJvYcCU3fCR9EaY3X7MdYQedhRFN6IBD2xUNEjLJ+VrQrUQI0oq2GVnvk75YIxfw1uMf6cU4j20salqqMI4qHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt8BxAWmJXyXAxYFEahDIm87tNEVJQya9RYwIzuTh+4VH5LEMy
	otWW4RAn1Op1J3anwWIcFXYwASpukClK4f4GERYVTgntpIirOyXUIc4DPIg1AFORIzjACrus7lc
	U/3vbrnH8QHCq7hrchjn3BgVv02UWfybm22bQwVhT
X-Gm-Gg: AZuq6aLvlTt6THVtmJAo+AuoRhZAWcqwG2DqLLIQb8DZnDum8Vi/0NrzG6lI8pqpGxF
	R+27TJ2NsDQ5qR9GWVaV9bKeZsAhzddPa/5HZZxCpPnI37inEvUV+JO7SEenQYSiWPQIxFYksEd
	+Lu/xWDnJumtFlbxgEvMuGoK6RJamcQKtSDFGF8FM/8imjECDW0bLZ+bNEP8HOvfMYcaRmDCHA0
	fI+Gkh1flQsEf2fiD90RT8iRMjyZZyfnDbQTpEusOr5cVDsZbjga7KheJ+fuYMIE41n9WKfPhKQ
	/gtlNa9yHuLTiLiwUhJvfEYFkWigNoyuf4A=
X-Received: by 2002:a05:6102:3a12:b0:5ef:7220:bcb2 with SMTP id
 ada2fe7eead31-5f54bc8224dmr480092137.28.1769122050230; Thu, 22 Jan 2026
 14:47:30 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:29 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 14:47:28 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <ed01838830679880d3eadaf6f11c539b9c72c22d.camel@intel.com>
 <CAGtprH_qGGRvk3uT74-wWXDiQyY1N1ua+_P2i-0UMmGWovaZuw@mail.gmail.com>
 <8c1fb4092547e2453ddcdcfab97f06e273ad17d8.camel@intel.com>
 <CAEvNRgEbG-RhCTsX1D8a3MgEKN2dfMuKj0tY0MZZioEzjw=4Xw@mail.gmail.com> <ee9c649eed3893d852c3d20fb96bdc4904b7c295.camel@intel.com>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 14:47:28 -0800
X-Gm-Features: AZwV_QhacTtf2zgQk3uMxNHfKwdT09Bqx79KDOGE5Z3VW9UujMTrgN_9VI-QiKU
Message-ID: <CAEvNRgEz0+ic9uvcsWYqWgR5EV=TfY0SAGC39zAL+n19SoBXmw@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Annapurve, Vishal" <vannapurve@google.com>
Cc: "david@kernel.org" <david@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jgross@suse.com" <jgross@suse.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "maz@kernel.org" <maz@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "ast@kernel.org" <ast@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "willy@infradead.org" <willy@infradead.org>, "wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jmattson@google.com" <jmattson@google.com>, "luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, "mhocko@suse.com" <mhocko@suse.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "song@kernel.org" <song@kernel.org>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "oupton@kernel.org" <oupton@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "peterz@infradead.org" <peterz@infradead.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "jthoughton@google.com" <jthoughton@google.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "hpa@zytor.com" <hpa@zytor.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "shuah@kernel.org" <shuah@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, "xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "jannh@google.com" <jannh@google.com>, 
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_144732_313612_B1F6C037 
X-CRM114-Status: GOOD (  23.20  )
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

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-01-22 at 08:44 -0800, Ackerley Tng wrote:
>>
>> Can we disable direct map removal for errata systems using TDX only,
>> instead of all TDX?
>>
>> If it's complicated to figure that out, we can disable direct map
>> removal for TDX for now and figure that out later.
>
> In theory, but it still would require changes to TDX code since it does
> the clflush unconditionally today. To know whether clflush is needed
> (it's a different thing to the errata), you need to check a TDX module
> flag. (CLFLUSH_BEFORE_ALLOC)
>
> Gosh, you know what, I should double check that we don't need the
> clflush from the vm shutdown optimization. It should be a different
> thing, but for we gave scrutiny to the whole Linux flow when we did
> that. So I'd have to double check nothing relied on it. We can follow
> up here.
>
>>
>> > Then there is the clfush. It is not actually required for the most
>> > part. There is a TDX flag to check to see if you need to do it, so
>> > we could probably remove the direct map accesses for some systems
>> > and avoid temporary mappings.
>> >
>> > So long term, I don't see a problem. For the old systems it would
>> > have extra cost of temporary mappings at shutdown, but I would have
>> > imagined direct map removal would have been costly too.
>>
>> Is there a way to check if the code is running on the errata system
>> and set up the temporary mappings only for those?
>
> The TDX code today doesn't do any remapping because the direct map is
> reliably present. There isn't a flag or anything to just do the
> remapping automatically. We would have to do some vmalloc mapping or
> temporary_mm or something.
>
> Can you explain what the use case is for unmapping encrypted TDX
> private memory from the host direct map?

There's no use case I can think of for unmapping TDX private memory from
the host direct map, but Sean's suggestion
https://lore.kernel.org/all/aWpcDrGVLrZOqdcg@google.com/ won't even let
shared guest_memfd memory be unmapped from the direct map for TDX VMs.

Actually, does TDX's clflush that assumes presence in the direct map
apply only for private pages, or all pages?

If TDX's clflush only happens for private pages, then we could restore
private pages to the direct map, and then we'd be safe even for TDX?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
