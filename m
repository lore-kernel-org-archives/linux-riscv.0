Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACF8C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:18:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D586C246BA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 11:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+Qesanm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8V3fuCv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D586C246BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PJagO0YAWiKyL51MG70kcq+fg07nlvWeq1XeVhkBIE=; b=P+Qesanm+qe86OMwoU+PIM4Du
	ViRntdYYUpeOUdplIDwNk4yr77XTQa+wwEw0R0yjxvtToWhm/qgrheHkdBoNDc7C5gidKj8cg4EF8
	rrhHihr3gYBQpiYMxAUMoab1Y1tijzCOzoGQxH94L16zNGo7rom9mVkGuau9JPt3cBXXhzjGRhtCa
	jMXT5vZKwlGt10d8b9AIQp5jz5ba5YnrmeL2aM8MKmnMoZDnJh89jDc4YV+GUSBtbWbpiJmeIOusq
	PFouOLjq+pswjFhhFfr6MmjlWtLzBTtL1mZqFLAT8rHAD4UMw9C6M4Bi9QgV2FY/IKoOpQIsJyN58
	b4UMThgxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXjSu-0006GA-Ex; Wed, 28 Oct 2020 11:18:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXjSl-0006Bi-JL
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 11:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603883873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3/QY+frjp1dnSTegbpUI0625UXdGYc+dVdsYJMjhKKw=;
 b=e8V3fuCvUpaAekj+PDnRrlnPoICbs1UUA6QNPDEv2US1gwyl41Go/jQ5+Syrj8WqPhuEzH
 cSqNnb4QYNNRGu3VVx4YwiK8OHrDVLf06s+3WQrTPoBQz4byzUAr1fBwrboml43WIywAQL
 vD1JevjrkzoPqiyDAvV0mJgfTd/4pNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-5Kg-MYA4O2aB4WCrNYOgXA-1; Wed, 28 Oct 2020 07:17:50 -0400
X-MC-Unique: 5Kg-MYA4O2aB4WCrNYOgXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BEC809DE4;
 Wed, 28 Oct 2020 11:17:44 +0000 (UTC)
Received: from [10.36.114.138] (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 033EC6EF5E;
 Wed, 28 Oct 2020 11:17:35 +0000 (UTC)
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
To: Mike Rapoport <rppt@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <e5fc62b6-f644-4ed5-de5b-ffd8337861e4@redhat.com>
 <20201028110945.GE1428094@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5805fdd9-14e5-141c-773b-c46d2da57258@redhat.com>
Date: Wed, 28 Oct 2020 12:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201028110945.GE1428094@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_071755_704453_A8DA3621 
X-CRM114-Status: GOOD (  24.63  )
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
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 28.10.20 12:09, Mike Rapoport wrote:
> On Tue, Oct 27, 2020 at 09:46:35AM +0100, David Hildenbrand wrote:
>> On 27.10.20 09:38, Mike Rapoport wrote:
>>> On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P wrote:
>>>
>>>> Beyond whatever you are seeing, for the latter case of new things
>>>> getting introduced to an interface with hidden dependencies... Another
>>>> edge case could be a new caller to set_memory_np() could result in
>>>> large NP pages. None of the callers today should cause this AFAICT, but
>>>> it's not great to rely on the callers to know these details.
> 
>>> A caller of set_memory_*() or set_direct_map_*() should expect a failure
>>> and be ready for that. So adding a WARN to safe_copy_page() is the first
>>> step in that direction :)
>>>
>>
>> I am probably missing something important, but why are we saving/restoring
>> the content of pages that were explicitly removed from the identity mapping
>> such that nobody will access them?
> 
> Actually, we should not be saving/restoring free pages during
> hibernation as there are several calls to mark_free_pages() that should
> exclude the free pages from the snapshot. I've tried to find why the fix
> that maps/unmaps a page to save it was required at the first place, but
> I could not find bug reports.
> 
> The closest I've got is an email from Rafael that asked to update
> "hibernate: handle DEBUG_PAGEALLOC" patch:
> 
> https://lore.kernel.org/linux-pm/200802200133.44098.rjw@sisk.pl/
> 
> Could it be that safe_copy_page() tries to workaround a non-existent
> problem?
> 

Clould be! Also see

https://lkml.kernel.org/r/38de5bb0-5559-d069-0ce0-daec66ef2746@suse.cz

which restores free page content based on more kernel parameters, not 
based on the original content.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
