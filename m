Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FD6D6CFA1
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 18:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7NZs5o50CqzlrNhRjBMCaMtPmLZdLrP2NIW7hWnW6Fg=; b=dGh3DSsljI/RmvtnwlZpyzgsjE
	2ybDQhX6PChzMsj0QyjyZIzgf3lMICXOyxOn2j/hOHAhSo4+dbybraBoE83m6Pn0s0A5IWpVaIWUc
	GlK29m9K0IXzYRDwC5/Lf6WR9el6P465xtRPF7ASGvwEIGzNPyDINuLYxTIr7jyutup33mOzJ7V4g
	Wn4v5783EyVdlNnOLm4PEJyrN6oRiNXWz7DdKDBTphsEX0/v1Q9UvrnydFdzeAhC4wqzQqVKSOCnI
	xmaZwA6KmsrV2vy9nSgjDLdLEd68Sg+MTnXOwMqrFjXVq75btqSpVNN01e1VP84UfBdvKdD6BYPeK
	+qy6Bmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizYt-00000007e2i-2Cer;
	Thu, 22 Jan 2026 18:37:43 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizYr-00000007e1x-1F0h
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 18:37:42 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5663724e4daso506452e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 10:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769107060; cv=none;
        d=google.com; s=arc-20240605;
        b=C6HJbbxLdS8luz8mqFiJlMEBTgw2lOGzNaMLAVmE+pCPoMByS7X59VynJh3wBZqEFK
         OCYkXH6Ycq4ky9tu5efYK8RImuBUMr8T2+FdVaP5LvTPjH3ucXtrQLpVzgnI7EWJjmUF
         RHsloI8MllpSx2SXvXCFaKuCBIcLkHT70mdzfuJqjYxBEufBd5B15gW2mgpVHSuYZf5H
         7e9zXe1V0HXLQ4UQO9OfUQ/pSIQlYw6PrAhufvNxOyozK7MhfRdDDfspYg5l9vpi6ec+
         oMkuTWkWR/XD08LeQQ+axpyd5YUHosrtxNTIM+EaUoxUyfIDpLUU6BeSRZNLlPta1U6s
         hXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        fh=85/yxyUxA7HRzgRg/Mtb7s9CJHNn6tQ8XbOHkL3aE98=;
        b=NlDyN9OdUSF9O6Du/KUbk3zAGXlpnHGH6Ck5Ogo8rDIoIOeZwpzwE+9StqIseO/6xh
         o4aqxsReR21TAgeWbWIYBE/3cZR+KIhIaMjiWn+VAHu+rO3Y1XrhnegDCrJ4O3y6GdxD
         VAcqsuR/kCUoHA3mmQ4mCkZBYXfXrDHjRKIt727nfpSlUt5oazHUN3ZpSiablBDUUvxd
         C88g/DmkL+RtsiHsGvApB0tXYSMeJEm3RfJ8F2nTn2I2FSm6MOUk7kMjjRLO7fTA1VYk
         oO1OokGIxd1Z9lvTtV81d2o7jD7dZMWtxTqMiPT1I8lfcVcafyI07Vh+iQBWmeIjlyIc
         8ffg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769107060; x=1769711860; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=0VRYvl1N0DL+R0JFAP8HD1BgsCA4dAQEdACN/9TjYRoiZPHMndtDyBgBhjeJTuJeVv
         w10i08LdtKPZYe9FRmzCk+WnBexDugtJRuzGtQJBxu05D/3HmmdSomgYezzaFXNcTHSn
         R6/0scniLohDSxHBizy/YMt32Jcntio0B4VY9J/tM/98Q19Y3LW3NtJxppQRpIW1jwhO
         /EUuEegpafODOljBFs5dsSuBKDRmDCM8YCuH9xNaRPR6JOlOU/6rg3nO1f8TWRQIVXmx
         Pg6kwAWB2Yhpnk7eukbcq5EscqYUez9s6Y415LsZt/Sk0Fuo6lqAD9j8f7QA5ZmTxWOz
         BuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769107060; x=1769711860;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm0SGSE+J6wsaq7NHikcDRa1xq67WXlvnQ6Xcq7PISg=;
        b=v+hSA/1Ju8P3aAO8LCTNkar7rtL4uOGJ2CLoY1CEOBYRjUuPjelaEm2ZQzmSoM3IlA
         e2vm+kiIX4NESjLHSj1N1mtySclDSIi4PEcRR+Qx7B+7g9hY474qKDlbM4vsJYjSb3oh
         WL0YDbMF/V9P1moAfmqA6oWNVMRjr9RQWhbzHR0/vwhh39Ru4uqYvV+8UjnXqQ13cUqY
         I9IENbxuV2D/0LnPBxzqwfdA+aEYqVI8jMu9c6A/cl4jQE7HhsmJW2t2w6xZTwRJUsEH
         Lp6Fwnt71mUq9J7y98y7qqjpaB6+yMBYAt7I4g0t1m29QlJd4XWvDdp+NU51+e3i/vwm
         vnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd5P0FU0/I7jrR7mrxopqCM/ymOjiBNkVrvb0Lz8bmHvEj24vA7ip99bpoyq37ZXV7fznYfrm4jPEnbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5oZCgQqIDmbstiTA8TtzVEQqcqfJ0GKBvld9FmGlFBna88H/c
	E4bulnkKM51KK0S04tc+R2oNIiJbF6Q+wO/hNvdl4NvtPiuHmyZ+9bgilBIoXoahKQa+wL0WJyb
	p7iZHdZZpWqT/F+CHyCYxVgVBl4uHYpQdNrmY5+YC
X-Gm-Gg: AZuq6aKpFAvJCPyN5wFvN99GRP5P9j4+DFPc9tT5a8jQK/JCNXvLzV/3txdYhwM204u
	9ypJfwZV9RRCoNLnfj5zGr+uMwbSRpZNRZbQ19E0EL+8xlhhpClBTNkYXQRxPSKYOIPHf4wEQwv
	jtd9O4wL6tu1bbDfH4avv/pEBxihWV4UDq2VbyqMg77Rbui/18B0OqFtyvwmbJc9pdTJngdh+ky
	jJM4oTZZF0ROwdIVe6aV2oNOIQqTZ0o7mPmwVVCISlOugUqknzmMA1YDIGY1ikZViYUwFLE5P1a
	MHGHdpRXR42p/jPcKj7X6Ws5
X-Received: by 2002:a05:6122:1799:b0:54a:992c:815e with SMTP id
 71dfb90a1353d-5663eaa47acmr191602e0c.8.1769107059228; Thu, 22 Jan 2026
 10:37:39 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:38 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jan 2026 10:37:37 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-8-kalyazin@amazon.com>
 <e619ded526a2f9a4cec4f74383cef31519624935.camel@intel.com> <294bca75-2f3e-46db-bb24-7c471a779cc1@amazon.com>
MIME-Version: 1.0
Date: Thu, 22 Jan 2026 10:37:37 -0800
X-Gm-Features: AZwV_QhFeXvGMv5345sr6hAOQL-xKTYrLyTeQaptQlhk8j2vfvA1j50rf6t-uyU
Message-ID: <CAEvNRgEvd9tSwrkaYrQyibO2DP99vgVj6_zr=jBH5+zMnJwYbA@mail.gmail.com>
Subject: Re: [PATCH v9 07/13] KVM: guest_memfd: Add flag to remove from direct map
To: kalyazin@amazon.com, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kalyazin@amazon.co.uk" <kalyazin@amazon.co.uk>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "david@kernel.org" <david@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"jgross@suse.com" <jgross@suse.com>, "surenb@google.com" <surenb@google.com>, 
	"riel@surriel.com" <riel@surriel.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"peterx@redhat.com" <peterx@redhat.com>, "x86@kernel.org" <x86@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, 
	"thuth@redhat.com" <thuth@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "Annapurve, Vishal" <vannapurve@google.com>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, 
	"pjw@kernel.org" <pjw@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"willy@infradead.org" <willy@infradead.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"wyihan@google.com" <wyihan@google.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "jmattson@google.com" <jmattson@google.com>, 
	"luto@kernel.org" <luto@kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, 
	"haoluo@google.com" <haoluo@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "coxu@redhat.com" <coxu@redhat.com>, 
	"mhocko@suse.com" <mhocko@suse.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"hpa@zytor.com" <hpa@zytor.com>, "song@kernel.org" <song@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "jthoughton@google.com" <jthoughton@google.com>, 
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"Yu, Yu-cheng" <yu-cheng.yu@intel.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"shuah@kernel.org" <shuah@kernel.org>, "prsampat@amd.com" <prsampat@amd.com>, 
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "itazur@amazon.co.uk" <itazur@amazon.co.uk>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"jackabt@amazon.co.uk" <jackabt@amazon.co.uk>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "andrii@kernel.org" <andrii@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "derekmn@amazon.com" <derekmn@amazon.com>, 
	"xmarcalx@amazon.co.uk" <xmarcalx@amazon.co.uk>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "jackmanb@google.com" <jackmanb@google.com>, "bp@alien8.de" <bp@alien8.de>, 
	"corbet@lwn.net" <corbet@lwn.net>, "jannh@google.com" <jannh@google.com>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kas@kernel.org" <kas@kernel.org>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_103741_382013_027E199D 
X-CRM114-Status: GOOD (  12.81  )
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

> On 16/01/2026 00:00, Edgecombe, Rick P wrote:
>> On Wed, 2026-01-14 at 13:46 +0000, Kalyazin, Nikita wrote:
>>> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
>>> +{
>>> +     /*
>>> +      * Direct map restoration cannot fail, as the only error condition
>>> +      * for direct map manipulation is failure to allocate page tables
>>> +      * when splitting huge pages, but this split would have already
>>> +      * happened in folio_zap_direct_map() in kvm_gmem_folio_zap_direct_map().

Do you know if folio_restore_direct_map() will also end up merging page
table entries to a higher level?

>>> +      * Thus folio_restore_direct_map() here only updates prot bits.
>>> +      */
>>> +     if (kvm_gmem_folio_no_direct_map(folio)) {
>>> +             WARN_ON_ONCE(folio_restore_direct_map(folio));
>>> +             folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
>>> +     }
>>> +}
>>> +
>>
>> Does this assume the folio would not have been split after it was zapped? As in,
>> if it was zapped at 2MB granularity (no 4KB direct map split required) but then
>> restored at 4KB (split required)? Or it gets merged somehow before this?

I agree with the rest of the discussion that this will probably land
before huge page support, so I will have to figure out the intersection
of the two later.

>
> AFAIK it can't be zapped at 2MB granularity as the zapping code will
> inevitably cause splitting because guest_memfd faults occur at the base
> page granularity as of now.

Here's what I'm thinking for now:

[HugeTLB, no conversions]
With initial HugeTLB support (no conversions), host userspace
guest_memfd faults will be:

+ For guest_memfd with PUD-sized pages
    + At PUD level or PTE level
+ For guest_memfd with PMD-sized pages
    + At PMD level or PTE level

Since this guest_memfd doesn't support conversions, the folio is never
split/merged, so the direct map is restored at whatever level it was
zapped. I think this works out well.

[HugeTLB + conversions]
For a guest_memfd with HugeTLB support and conversions, host userspace
guest_memfd faults will always be at PTE level, so the direct map will
be split and the faulted pages have the direct map zapped in 4K chunks
as they are faulted.

On conversion back to private, put those back into the direct map
(putting aside whether to merge the direct map PTEs for now).


Unfortunately there's no unmapping callback for guest_memfd to use, so
perhaps the principle should be to put the folios back into the direct
map ASAP - at unmapping if guest_memfd is doing the unmapping, otherwise
at freeing time?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
