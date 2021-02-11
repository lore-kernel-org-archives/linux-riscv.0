Return-Path: <SRS0=PCma=HN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A25CC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 10:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6CC64EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Feb 2021 10:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6CC64EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OzIVGtyiMOicFcn2XsQwpluBhtiW367VE/zQG6ngmnk=; b=JctE0blSjpx0nLLfvhj823G1f
	k3Q0sMoR3RY7FsCYF8NqXdhUaEO0xBozAPeqXwXFHq3BIBlV9YKd99VkTzO6DZNKHgKCpp145yRkT
	/794Db7MOWC+iGkirhDUwTA2HdouE19eztMDDOjGxSUu1Tu/uLF/A5FeuiVIxkfYyp5jHJS4sA01I
	Qaj9aONqR/hdIHbIqm8i7aJgFExACYSf9VuaOGHIVuyCICe4RIJe9XCRMWNlFbUZA+Shvuob2TarQ
	6Hc8vbuNFy8sylMK4VSdu+gU4MpuM7wXh5Cdz7uxeswCi5qXY9c0qD29wrOb3JxuykR+sfsJUIjXX
	AI1dIxAow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA8nw-00014J-7g; Thu, 11 Feb 2021 10:02:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA8ns-00012k-KD
 for linux-riscv@lists.infradead.org; Thu, 11 Feb 2021 10:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613037748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvJ6ODrJsIAiBu7p562Cs80l2ihUXPDYjoFL2LYVwNg=;
 b=AhycaZLrTe9GIRHV4N6V6kbve5AE0XGA8wcUBlcFG4QPY51YC4uSpXjBI+2cKzc+VSZSD0
 zC5qmFxMo5oY3rRmvE+1C9lG2g6AytwoTKtu0sQY+eJ4ZLXLg9xO8kbNZQj+XhfbSsvKMn
 Ud8ZJpizK2dhOU65i8oWqKS0kEI1LlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-xjh0NtfMOp6y4PYLBjaekA-1; Thu, 11 Feb 2021 05:02:23 -0500
X-MC-Unique: xjh0NtfMOp6y4PYLBjaekA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79EADC73A0;
 Thu, 11 Feb 2021 10:02:18 +0000 (UTC)
Received: from [10.36.114.52] (ovpn-114-52.ams2.redhat.com [10.36.114.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2B4F5D9E8;
 Thu, 11 Feb 2021 10:02:08 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org> <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
 <20210208212605.GX242749@kernel.org> <YCJMDBss8Qhha7g9@dhcp22.suse.cz>
 <20210209090938.GP299309@linux.ibm.com> <YCKLVzBR62+NtvyF@dhcp22.suse.cz>
 <20210211071319.GF242749@kernel.org> <YCTtSrCEvuBug2ap@dhcp22.suse.cz>
 <0d66baec-1898-987b-7eaf-68a015c027ff@redhat.com>
 <YCT6+9YW474IaKrm@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <e7f1b5eb-a4c8-2772-6333-0a72c22b0c51@redhat.com>
Date: Thu, 11 Feb 2021 11:02:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCT6+9YW474IaKrm@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_050228_762513_8A749D32 
X-CRM114-Status: GOOD (  25.28  )
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
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11.02.21 10:38, Michal Hocko wrote:
> On Thu 11-02-21 10:01:32, David Hildenbrand wrote:
> [...]
>> AFAIKS, we would need MFD_SECRET and disallow
>> MFD_ALLOW_SEALING and MFD_HUGETLB.
> 
> Yes for an initial version. But I do expect a request to support both
> features is just a matter of time.
> 
>> In addition, we could add MFD_SECRET_NEVER_MAP, which could disallow any kind of
>> temporary mappings (eor migration). TBC.
> 
> I believe this is the mode Mike wants to have by default. A more relax
> one would be an opt-in. MFD_SECRET_RELAXED which would allow temporal
> mappings in the kernel for content copying (e.g. for migration).
> 
>> ---
>>
>> Some random thoughts regarding files.
>>
>> What is the page size of secretmem memory? Sometimes we use huge pages,
>> sometimes we fallback to 4k pages. So I assume huge pages in general?
> 
> Unless there is an explicit request for hugetlb I would say the page
> size is not really important like for any other fds. Huge pages can be
> used transparently.
>   
>> What are semantics of MADV()/FALLOCATE() etc on such files?
> 
> I would expect the same semantic as regular shmem (memfd_create) except
> the memory doesn't have _any_ backing storage which makes it
> unevictable. So the reclaim related madv won't work but there shouldn't
> be any real reason why e.g. MADV_DONTNEED, WILLNEED, DONT_FORK and
> others don't work.

Another thought regarding "doesn't have _any_ backing storage"

What are the right semantics when it comes to memory accounting/commit?

As secretmem does not have
a) any backing storage
b) cannot go to swap

The MAP_NORESERVE vs. !MAP_NORESERVE handling gets a little unclear. Why 
"reserve swap space" if the allocations cannot ever go to swap? Sure, we 
want to "reserve physical memory", but in contrast to other users that 
can go to swap.

Of course, this is only relevant for MAP_PRIVATE secretmem mappings. 
Other MAP_SHARED assumes there is no need for reserving swap space as it 
can just go to the backing storage. (yeah, tmpfs/shmem is weird in that 
regard as well, but again, it's a bit different)

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
