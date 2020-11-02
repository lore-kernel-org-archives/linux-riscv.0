Return-Path: <SRS0=qpiA=EI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F590C00A89
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 17:51:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EB221534
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2020 17:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zQLGxRuz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLgcuAMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2EB221534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GLhecRXe6Pb4IdjJ6m0k28sGBYBHF89xB0eUykT09xE=; b=zQLGxRuzlv2DPReeV0wWYtbNO
	aTzSWFrCY4blWfzR7PtiOYO9W4ozjmxVt/aeb29IHqXpWxGczRO0MIs+50LWP4G4rIKGfaiXUuYwJ
	iNQaBNzQJj1EGOin98XL9V4OYExiSWVXL5jlNyZ8sYtoeFSC8w0iKNA5mIAFWHASKRZ3CQssrTr2r
	xGuRhCKE4MElrMEgVyiDbZjFdt5pn4ybElNnLAHLWGIDMHjNRxIUPbXAXUWjVswsd8HQNBeyPU3Mm
	t6FjOQt9bt6F/w7Yqgc3+wSfD3vluxqo5aaUxFSCc4o7xzDG4mur5+omz/Zc6sWalLJXmfLtxIzKF
	KQtjMbpBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZdzM-00052A-RH; Mon, 02 Nov 2020 17:51:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZdzJ-00050g-HI
 for linux-riscv@lists.infradead.org; Mon, 02 Nov 2020 17:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604339484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp/prYQuMgVXccCGCiV61cLz4v5q5/mm6tHCPraHIqM=;
 b=RLgcuAMKW+Q9jDC0wmsn6+vky/ozoUz7DCrDrpshiM6Kvl9ruZgFt/7B+fppAUA4vFvx0Y
 vC/MHsjIRXysReoVskJc4UMIIyD78f8NiJpuVGXt5p/gQiFQwXT5S3tuFZx63nY7gKHhAz
 51T1Hl4tN53nxTAwhDoNVg+roeudrgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-JugxVAtvMxar3jfSZTXWbg-1; Mon, 02 Nov 2020 12:51:22 -0500
X-MC-Unique: JugxVAtvMxar3jfSZTXWbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1873F879512;
 Mon,  2 Nov 2020 17:51:18 +0000 (UTC)
Received: from [10.36.113.163] (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA9C15B4A9;
 Mon,  2 Nov 2020 17:51:10 +0000 (UTC)
Subject: Re: [PATCH v6 0/6] mm: introduce memfd_secret system call to create
 "secret" memory areas
To: Mike Rapoport <rppt@kernel.org>
References: <20200924132904.1391-1-rppt@kernel.org>
 <9c38ac3b-c677-6a87-ce82-ec53b69eaf71@redhat.com>
 <20201102174308.GF4879@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <d4cb2c87-4744-3929-cedd-2be78625a741@redhat.com>
Date: Mon, 2 Nov 2020 18:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201102174308.GF4879@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_125125_914652_C7821AF8 
X-CRM114-Status: GOOD (  26.36  )
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

>> Assume you have a system with quite some ZONE_MOVABLE memory (esp. in
>> virtualized environments), eating up a significant amount of !ZONE_MOVABLE
>> memory dynamically at runtime can lead to non-obvious issues. It looks like
>> you have plenty of free memory, but the kernel might still OOM when trying
>> to do kernel allocations e.g., for pagetables. With CMA we at least know
>> what we're dealing with - it behaves like ZONE_MOVABLE except for the owner
>> that can place unmovable pages there. We can use it to compute statically
>> the amount of ZONE_MOVABLE memory we can have in the system without doing
>> harm to the system.
> 
> Why would you say that secretmem allocates from !ZONE_MOVABLE?
> If we put boot time reservations aside, the memory allocation for
> secretmem follows the same rules as the memory allocations for any file
> descriptor. That means we allocate memory with GFP_HIGHUSER_MOVABLE.

Oh, okay - I missed that! I had the impression that pages are unmovable 
and allocating from ZONE_MOVABLE would be a violation of that?

> After the allocation the memory indeed becomes unmovable but it's not
> like we are eating memory from other zones here.

... and here you have your problem. That's a no-no. We only allow it in 
very special cases where it can't be avoided - e.g., vfio having to pin 
guest memory when passing through memory to VMs.

Hotplug memory, online it to ZONE_MOVABLE. Allocate secretmem. Try to 
unplug the memory again -> endless loop in offline_pages().

Or have a CMA area that gets used with GFP_HIGHUSER_MOVABLE. Allocate 
secretmem. The owner of the area tries to allocate memory - always 
fails. Purpose of CMA destroyed.

> 
>> Ideally, we would want to support page migration/compaction and allow for
>> allocation from ZONE_MOVABLE as well. Would involve temporarily mapping,
>> copying, unmapping. Sounds feasible, but not sure which roadblocks we would
>> find on the way.
> 
> We can support migration/compaction with temporary mapping. The first
> roadblock I've hit there was that migration allocates 4K destination
> page and if we use it in secret map we are back to scrambling the direct
> map into 4K pieces. It still sounds feasible but not as trivial :)

That sounds like the proper way for me to do it then.

> 
> But again, there is nothing in the current form of secretmem that
> prevents allocation from ZONE_MOVABLE.

Oh, there is something: That the pages are not movable.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
