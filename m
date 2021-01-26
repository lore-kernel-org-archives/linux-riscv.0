Return-Path: <SRS0=Tegm=G5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C646C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 11:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62362311D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jan 2021 11:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C62362311D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gZx0Y3SzRdLEd3nMtk6tt9IRp9ByVUtltOBriPT3ivs=; b=I6i6VVcZcsYMUkLXcHyprJVKC
	rRB8rqST6KBAOWLwR9UuziNUWiMKTzA7U0UOeoup0p+Kk/+DkCn+JjrBIrA5vFwg4RZz9kP7rd7db
	XXCcB2SDlyaSqwd0CmN3J2lUMntkQtmh+BOza3TeDqZUVMRQgW/U1zt0IKFIWWiKnQoh3VeRaU3yW
	w4qcNTTBtpbpMI1TpX0C4Si0nWFKIvmGUBu2XeKCm3lWq+63NKmsh4hnaN4LR1IDL9BwYa5q6Ccm1
	1VToj1ZcWcnvzT2eljXKLkwPHzfxgRKh9UA68YC6mtgZKaOYoWsJG9XmGTence/7KOBXrU0M0lAHi
	INx4kBZhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4MyE-0001iP-PX; Tue, 26 Jan 2021 11:57:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4MyB-0001gt-Qa
 for linux-riscv@lists.infradead.org; Tue, 26 Jan 2021 11:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjJ7EBIraH0kcBiHWVTNphRxbXFU8GNfvJrsoVivTWk=;
 b=V8WD8NCMWlFDx9o6YzcO4I4dENQNX15Lz56GUb71wwvfnEUCghoGq2WMCpCus3UksH4ryw
 zGNU8VB40n7JCwxI/iYewHuZuQskrP2EPqwOLVMVQm7Din2QT7woVj7CSLOVIA2dubHziT
 gr4NL1JD2oKEm1+KynWmZgRhW0U44EU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Ryg-fxAdMkms-vm90M751Q-1; Tue, 26 Jan 2021 06:57:11 -0500
X-MC-Unique: Ryg-fxAdMkms-vm90M751Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F94E107ACF6;
 Tue, 26 Jan 2021 11:57:06 +0000 (UTC)
Received: from [10.36.114.192] (ovpn-114-192.ams2.redhat.com [10.36.114.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B16B65D751;
 Tue, 26 Jan 2021 11:56:49 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>
References: <20210121122723.3446-1-rppt@kernel.org>
 <20210121122723.3446-8-rppt@kernel.org> <20210126114657.GL827@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
Date: Tue, 26 Jan 2021 12:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210126114657.GL827@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_065716_098157_DF46C1D5 
X-CRM114-Status: GOOD (  24.94  )
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

On 26.01.21 12:46, Michal Hocko wrote:
> On Thu 21-01-21 14:27:19, Mike Rapoport wrote:
>> From: Mike Rapoport <rppt@linux.ibm.com>
>>
>> Removing a PAGE_SIZE page from the direct map every time such page is
>> allocated for a secret memory mapping will cause severe fragmentation of
>> the direct map. This fragmentation can be reduced by using PMD-size pages
>> as a pool for small pages for secret memory mappings.
>>
>> Add a gen_pool per secretmem inode and lazily populate this pool with
>> PMD-size pages.
>>
>> As pages allocated by secretmem become unmovable, use CMA to back large
>> page caches so that page allocator won't be surprised by failing attempt to
>> migrate these pages.
>>
>> The CMA area used by secretmem is controlled by the "secretmem=" kernel
>> parameter. This allows explicit control over the memory available for
>> secretmem and provides upper hard limit for secretmem consumption.
> 
> OK, so I have finally had a look at this closer and this is really not
> acceptable. I have already mentioned that in a response to other patch
> but any task is able to deprive access to secret memory to other tasks
> and cause OOM killer which wouldn't really recover ever and potentially
> panic the system. Now you could be less drastic and only make SIGBUS on
> fault but that would be still quite terrible. There is a very good
> reason why hugetlb implements is non-trivial reservation system to avoid
> exactly these problems.
> 
> So unless I am really misreading the code
> Nacked-by: Michal Hocko <mhocko@suse.com>
> 
> That doesn't mean I reject the whole idea. There are some details to
> sort out as mentioned elsewhere but you cannot really depend on
> pre-allocated pool which can fail at a fault time like that.

So, to do it similar to hugetlbfs (e.g., with CMA), there would have to 
be a mechanism to actually try pre-reserving (e.g., from the CMA area), 
at which point in time the pages would get moved to the secretmem pool, 
and a mechanism for mmap() etc. to "reserve" from these secretmem pool, 
such that there are guarantees at fault time?

What we have right now feels like some kind of overcommit (reading, as 
overcommiting huge pages, so we might get SIGBUS at fault time).

TBH, the SIGBUS thingy doesn't sound terrible to me - if this behavior 
is to be expected right now by applications using it and they can handle 
it - no guarantees. I fully agree that some kind of 
reservation/guarantee mechanism would be preferable.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
