Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43BEC2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:12:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A976206B5
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbsHZXOt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNa/9Cyg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A976206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8e4UbF8jaVSRQ4or8vNBEcIwzBJZBXpR3BuUxGzAVR8=; b=WbsHZXOtXrMM3uASb5Fc57Eil
	GZuWRaOOijDprtJ/TYmgNP1l1D53ZT6bHqeGWWkLpY/RRMtdx/Y6emlvqKa1Up6exkb30hyIU4ChY
	hJ3shN1QrlvmKsy/+PkHx4oEojEoMEq9szaA7UDAqiNwZcf/ypvKxKawtjixAAMxQSjay4mgcM0PV
	rZkQv1syCjSHLnyuEoNRClblXDITUGQawKf8HYcfh4xOS9suXIK+zGE4Vi1WxfsB+ch2v50+7Rrct
	+/h4vNM598n/dIovs5tNmSwp2RhKsIVkDsDB0TzziJbwSnjJfJRLdlP1lm1fUSfVzyTB8rmTWdZbH
	2+sMDMNVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtIe-0005CL-Sm; Tue, 03 Nov 2020 10:12:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtIR-00055G-9S
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 10:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604398329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyipNVQSi+6EWMMakyEP0aw5V3oxIqNV8RP/zduqoUw=;
 b=GNa/9Cygvl4mUZcGn7V7OtWZ6w8d4PuD4m+FHGDrOVFBMKqurcOe9YTmT0AQ+yZNSJjHk3
 Vra/tNN+2dbcnohmTsjObAJiPL40+W45ireLES3gNXRyBu5KSfPCWAdaigxIEP5m5hQSWO
 lmbviLNsQlNizkBtTFZ/0RqbcYir2mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-LbFmUSJyMSGOd-g7tICDgg-1; Tue, 03 Nov 2020 05:12:05 -0500
X-MC-Unique: LbFmUSJyMSGOd-g7tICDgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B23E186840C;
 Tue,  3 Nov 2020 10:12:00 +0000 (UTC)
Received: from [10.36.115.7] (ovpn-115-7.ams2.redhat.com [10.36.115.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 771815D9CC;
 Tue,  3 Nov 2020 10:11:52 +0000 (UTC)
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <9c38ac3b-c677-6a87-ce82-ec53b69eaf71@redhat.com>
 <20201102174308.GF4879@kernel.org>
 <d4cb2c87-4744-3929-cedd-2be78625a741@redhat.com>
 <20201103095247.GH4879@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5709dadf-81c6-5b40-93d4-fbef94d5aad8@redhat.com>
Date: Tue, 3 Nov 2020 11:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201103095247.GH4879@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_051211_598424_5B02AB28 
X-CRM114-Status: GOOD (  24.30  )
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
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Shuah Khan <shuah@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03.11.20 10:52, Mike Rapoport wrote:
> On Mon, Nov 02, 2020 at 06:51:09PM +0100, David Hildenbrand wrote:
>>>> Assume you have a system with quite some ZONE_MOVABLE memory (esp. in
>>>> virtualized environments), eating up a significant amount of !ZONE_MOVABLE
>>>> memory dynamically at runtime can lead to non-obvious issues. It looks like
>>>> you have plenty of free memory, but the kernel might still OOM when trying
>>>> to do kernel allocations e.g., for pagetables. With CMA we at least know
>>>> what we're dealing with - it behaves like ZONE_MOVABLE except for the owner
>>>> that can place unmovable pages there. We can use it to compute statically
>>>> the amount of ZONE_MOVABLE memory we can have in the system without doing
>>>> harm to the system.
>>>
>>> Why would you say that secretmem allocates from !ZONE_MOVABLE?
>>> If we put boot time reservations aside, the memory allocation for
>>> secretmem follows the same rules as the memory allocations for any file
>>> descriptor. That means we allocate memory with GFP_HIGHUSER_MOVABLE.
>>
>> Oh, okay - I missed that! I had the impression that pages are unmovable and
>> allocating from ZONE_MOVABLE would be a violation of that?
>>
>>> After the allocation the memory indeed becomes unmovable but it's not
>>> like we are eating memory from other zones here.
>>
>> ... and here you have your problem. That's a no-no. We only allow it in very
>> special cases where it can't be avoided - e.g., vfio having to pin guest
>> memory when passing through memory to VMs.
>>
>> Hotplug memory, online it to ZONE_MOVABLE. Allocate secretmem. Try to unplug
>> the memory again -> endless loop in offline_pages().
>>
>> Or have a CMA area that gets used with GFP_HIGHUSER_MOVABLE. Allocate
>> secretmem. The owner of the area tries to allocate memory - always fails.
>> Purpose of CMA destroyed.
>>
>>>
>>>> Ideally, we would want to support page migration/compaction and allow for
>>>> allocation from ZONE_MOVABLE as well. Would involve temporarily mapping,
>>>> copying, unmapping. Sounds feasible, but not sure which roadblocks we would
>>>> find on the way.
>>>
>>> We can support migration/compaction with temporary mapping. The first
>>> roadblock I've hit there was that migration allocates 4K destination
>>> page and if we use it in secret map we are back to scrambling the direct
>>> map into 4K pieces. It still sounds feasible but not as trivial :)
>>
>> That sounds like the proper way for me to do it then.
>   
> Although migration of secretmem pages sounds feasible now, there maybe
> other issues I didn't see because I'm not very familiar with
> migration/compaction code.

Migration of PMDs might also be feasible -  and it would be even 
cleaner. But I agree that that might require more work and starting with 
something simpler (!movable) is the right way to move forward.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
