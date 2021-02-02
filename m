Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E1AC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 14:43:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4675964DF5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4675964DF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qgqdWX02ICRdeTy9t2HDQOi1+G+G6+QFi+8bhsKDVE=; b=WJMCgIRJvV5jceZQLPq/8Mqc3
	eTZ3a2uYMmvs4rlVwGxAIOoUlzIsXvdn/H3sNrxSd9Ig6AQe1LUqe3Nufp8wTuIYNy8LIOPEUXu/x
	/LEXgvxTme62E4YxOYGnoA2j1yB+lPC/odES3xwRjMwBIJRbKgeSlhImv0ZrxOObHK7JuhEofhlcC
	tjvk9V3bEEGTuiVD13ALKBjSGCrgBlDTZFYmz037fxzxTs6JWfFF67VDtIsCZbiqq15Gn/nibJKX9
	DhNHwpHXJD8RctoPQrMUP/Ca+x5YLq9x+0NNTQXU2Wz/3D7zIodKqc786gWj67GL8+nIbxKYM9NVA
	PeYSflWpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6wtH-0002eG-Qz; Tue, 02 Feb 2021 14:42:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6wtE-0002d6-Ed
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 14:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9WVcjtJGSRM6w7F2m39UE8iZCliMcHMPGNuV986qrI=;
 b=ef9GhwY3hFIcy7iOGjbtV8vjQUSaeYExmUGYz9HkArUUr/BpmRXhg8/eFsQB699Vqn571q
 rJ9KwgVwL6IjKXOrMQso4pJphTJqTnrnhhzrid0aRiuAu/xrEQb57x6WUSD4yI/f3Flx5u
 6fyc2MvnbewCMWlkOvwZK1V9ep1yvW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-8AQi4yF_NHCuVEWiuakmOQ-1; Tue, 02 Feb 2021 09:42:42 -0500
X-MC-Unique: 8AQi4yF_NHCuVEWiuakmOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46BB9184DBED;
 Tue,  2 Feb 2021 14:42:36 +0000 (UTC)
Received: from [10.36.114.148] (ovpn-114-148.ams2.redhat.com [10.36.114.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36D6560916;
 Tue,  2 Feb 2021 14:42:28 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org> <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz> <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz> <20210129072128.GD242749@kernel.org>
 <YBPMg/C5Sb78gFEB@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <f1f65516-e222-6543-aeae-9a1dc9920de8@redhat.com>
Date: Tue, 2 Feb 2021 15:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YBPMg/C5Sb78gFEB@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_094248_840721_8AAC43B3 
X-CRM114-Status: GOOD (  20.10  )
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

On 29.01.21 09:51, Michal Hocko wrote:
> On Fri 29-01-21 09:21:28, Mike Rapoport wrote:
>> On Thu, Jan 28, 2021 at 02:01:06PM +0100, Michal Hocko wrote:
>>> On Thu 28-01-21 11:22:59, Mike Rapoport wrote:
>>>
>>>> And hugetlb pools may be also depleted by anybody by calling
>>>> mmap(MAP_HUGETLB) and there is no any limiting knob for this, while
>>>> secretmem has RLIMIT_MEMLOCK.
>>>
>>> Yes it can fail. But it would fail at the mmap time when the reservation
>>> fails. Not during the #PF time which can be at any time.
>>
>> It may fail at $PF time as well:
>>
>> hugetlb_fault()
>>          hugeltb_no_page()
>>                  ...
>>                  alloc_huge_page()
>>                          alloc_gigantic_page()
>>                                  cma_alloc()
>>                                          -ENOMEM;
> 
> I would have to double check. From what I remember cma allocator is an
> optimization to increase chances to allocate hugetlb pages when
> overcommiting because pages should be normally pre-allocated in the pool
> and reserved during mmap time. But even if a hugetlb page is not pre
> allocated then this will get propagated as SIGBUS unless that has
> changed.

It's an optimization to allocate gigantic pages dynamically later (so 
not using memblock during boot). Not just for overcommit, but for any 
kind of allocation.

The actual allocation from cma should happen when setting nr_pages:

nr_hugepages_store_common()->set_max_huge_pages()->alloc_pool_huge_page()...->alloc_gigantic_page()

The path described above seems to be trying to overcommit gigantic 
pages, something that can be expected to SIGBUS. Reservations are 
handled via the pre-allocated pool.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
