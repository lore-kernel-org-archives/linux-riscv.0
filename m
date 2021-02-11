Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EDD9C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:02:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082EB64DE7
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 09:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 082EB64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bQ8nUPEFRGRZlYNmi7FR60J2gRcKFGJqIpFZsXGa2uU=; b=xrU291NexueZV0B1Cm2PAoumd
	to9NStvTZJem9HcU4IthJrOpfoXw5pnnywAKVjLsmHaz9VGgS5VK1flVGgYXu/trHd+PiRX6eSUxD
	2MK1SPnt5lD8mMtYZI3zldwRXYyp15YGTaWePGrq48ICU85Ojie1/jP6yZdMv0RRrnibRaNSrcOCl
	DXmHfLlSXcjEU0uIwIiibPnoRDaEey09yQyizwFdA7G5rkMxzWsuwLngfgKlTuwL9Y5HwvlxUadvv
	h/ooW8HczYCdJStfFB5M1AoZajFxSJdHTY7RN/pcJH6izH2s41b0cp+vh/dwOYANIa3Z+dQXXwe/e
	hQM4ek5gA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA7rN-0003z7-Na; Thu, 11 Feb 2021 09:02:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA7rG-0003wO-RF
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 09:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613034114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87Impx6zBhFPew0MsLa4uFlCrkffLZXeuCsIAmOnb1o=;
 b=Lk/M0qqeo34ImcbbCgR6VNkm4dMEWz1EyhOHirHngtdRHyhlfncwIHEYQMYH0Y3e2Qs1Rd
 XHsxCqr7lkmdX9oKHSZaWj99yMAujEH2ETPqPH5qXYWC/k8AygFx5mmTKTQGv6bmmnPOMZ
 jfw3xwGhj04iirr0U6S+EbCh9j6ZPOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-CVxMxznvM0iwyXDkheMOxg-1; Thu, 11 Feb 2021 04:01:50 -0500
X-MC-Unique: CVxMxznvM0iwyXDkheMOxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F3E107B465;
 Thu, 11 Feb 2021 09:01:44 +0000 (UTC)
Received: from [10.36.114.52] (ovpn-114-52.ams2.redhat.com [10.36.114.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F05745DF58;
 Thu, 11 Feb 2021 09:01:33 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org> <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org> <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com> <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org> <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
Date: Thu, 11 Feb 2021 10:01:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_040154_990140_6AC09559 
X-CRM114-Status: GOOD (  36.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11.02.21 09:39, Michal Hocko wrote:
> On Thu 11-02-21 09:13:19, Mike Rapoport wrote:
>> On Tue, Feb 09, 2021 at 02:17:11PM +0100, Michal Hocko wrote:
>>> On Tue 09-02-21 11:09:38, Mike Rapoport wrote:
> [...]
>>>> Citing my older email:
>>>>
>>>>      I've hesitated whether to continue to use new flags to memfd_create() or to
>>>>      add a new system call and I've decided to use a new system call after I've
>>>>      started to look into man pages update. There would have been two completely
>>>>      independent descriptions and I think it would have been very confusing.
>>>
>>> Could you elaborate? Unmapping from the kernel address space can work
>>> both for sealed or hugetlb memfds, no? Those features are completely
>>> orthogonal AFAICS. With a dedicated syscall you will need to introduce
>>> this functionality on top if that is required. Have you considered that?
>>> I mean hugetlb pages are used to back guest memory very often. Is this
>>> something that will be a secret memory usecase?
>>>
>>> Please be really specific when giving arguments to back a new syscall
>>> decision.
>>
>> Isn't "syscalls have completely independent description" specific enough?
> 
> No, it's not as you can see from questions I've had above. More on that
> below.
> 
>> We are talking about API here, not the implementation details whether
>> secretmem supports large pages or not.
>>
>> The purpose of memfd_create() is to create a file-like access to memory.
>> The purpose of memfd_secret() is to create a way to access memory hidden
>> from the kernel.
>>
>> I don't think overloading memfd_create() with the secretmem flags because
>> they happen to return a file descriptor will be better for users, but
>> rather will be more confusing.
> 
> This is quite a subjective conclusion. I could very well argue that it
> would be much better to have a single syscall to get a fd backed memory
> with spedific requirements (sealing, unmapping from the kernel address
> space). Neither of us would be clearly right or wrong. A more important
> point is a future extensibility and usability, though. So let's just
> think of few usecases I have outlined above. Is it unrealistic to expect
> that secret memory should be sealable? What about hugetlb? Because if
> the answer is no then a new API is a clear win as the combination of
> flags would never work and then we would just suffer from the syscall
> multiplexing without much gain. On the other hand if combination of the
> functionality is to be expected then you will have to jam it into
> memfd_create and copy the interface likely causing more confusion. See
> what I mean?
> 
> I by no means do not insist one way or the other but from what I have
> seen so far I have a feeling that the interface hasn't been thought
> through enough. Sure you have landed with fd based approach and that
> seems fair. But how to get that fd seems to still have some gaps IMHO.
> 

I agree with Michal. This has been raised by different
people already, including on LWN (https://lwn.net/Articles/835342/).

I can follow Mike's reasoning (man page), and I am also fine if there is
a valid reason. However, IMHO the basic description seems to match quite good:

        memfd_create() creates an anonymous file and returns a file descriptor that refers to it.  The
        file behaves like a regular file, and so can be modified, truncated, memory-mapped, and so on.
        However,  unlike a regular file, it lives in RAM and has a volatile backing storage.  Once all
        references to the file are dropped, it is automatically released.  Anonymous  memory  is  used
        for  all  backing pages of the file.  Therefore, files created by memfd_create() have the same
        semantics as other anonymous memory allocations such as those allocated using mmap(2) with the
        MAP_ANONYMOUS flag.

AFAIKS, we would need MFD_SECRET and disallow
MFD_ALLOW_SEALING and MFD_HUGETLB.

In addition, we could add MFD_SECRET_NEVER_MAP, which could disallow any kind of
temporary mappings (eor migration). TBC.

---

Some random thoughts regarding files.

What is the page size of secretmem memory? Sometimes we use huge pages,
sometimes we fallback to 4k pages. So I assume huge pages in general?

What are semantics of MADV()/FALLOCATE() etc on such files?
I assume PUNCH_HOLE fails in a nice way? does it work?

Does mremap()/mremap(FIXED) work/is it blocked?

Does mprotect() fail in a nice way?

Is userfaultfd() properly fenced? Or does it even work (doubt)?

How does it behave if I mmap(FIXED) something in between?
In which granularity can I do that (->page-size?)?

What are other granularity restrictions (->page size)?

Don't want to open a big discussion here, just some random thoughts.
Maybe it has all been already figured out and most of the answers
above are "Fails with -EINVAL".

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
