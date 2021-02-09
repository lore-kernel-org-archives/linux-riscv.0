Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6147C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 10:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7428B64E15
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 10:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7428B64E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dSQUokER+sPKlCec8uqKcoqEVsPGjsYjKO27KQouPfs=; b=M+IGm19B1x0UmFzuhWkPfBD2t
	v9FTVa867qoBXmsLsWEnqrRs2bqCWMplMmggVzTWGphjzvqAwwXnzOlGL0DpfwLrTUInnYYP0mzIl
	IgiCHC5Ge+zvBrAZNlc7HbBGqG+trgcEG8Rw9nTACl9OBGHX94kkoNa9XL93odxsdmsKeOLpXNC3G
	vhRIl1+55moML8gz24cXkNEieSbqVsaPpOdD71FItJd6K3uPEvaub77YCpJBi89TVIR1y6jkWLvh3
	s4nm5ulbo7xTfSvLwjxDGm1GEHu40clFaBWP12aGfq02NLntzshzwX+N7Rw63HBsh8PvrTnteSgX2
	DEw9erZxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9QBa-0006Yr-9i; Tue, 09 Feb 2021 10:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9QBV-0006XO-VA
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 10:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612866233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IoX1DQCPa+nZtjLne30VDad7vc/+9XUN1LzFVohs0o=;
 b=CHLKqheCD8/67o9xr8llyKnonFmde21iE75kEqc1RUCbaiLFow1RgZCL8zXjBOnLqNc4gP
 50t1gEPtrIKiTZj5CJDIBg1qizUzSi0SyOD9tuhRkJmz2TFCAz91n5TsJJJFFG73YIfHHJ
 dT/VfNWwbaxbIYgRVZjc3I6jl3tpass=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-shSTZr8_P1uvA3gtZUZXlw-1; Tue, 09 Feb 2021 05:23:49 -0500
X-MC-Unique: shSTZr8_P1uvA3gtZUZXlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5220F804023;
 Tue,  9 Feb 2021 10:23:44 +0000 (UTC)
Received: from [10.36.113.141] (ovpn-113-141.ams2.redhat.com [10.36.113.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 192F22CE01;
 Tue,  9 Feb 2021 10:23:35 +0000 (UTC)
To: Michal Hocko <mhocko@suse.com>
References: <20210208211326.GV242749@kernel.org>
 <1F6A73CF-158A-4261-AA6C-1F5C77F4F326@redhat.com>
 <YCJO8zLq8YkXGy8B@dhcp22.suse.cz>
 <662b5871-b461-0896-697f-5e903c23d7b9@redhat.com>
 <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 00/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <c1e5e7b6-3360-ddc4-2ff5-0e79515ee23a@redhat.com>
Date: Tue, 9 Feb 2021 11:23:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YCJbmR11ikrWKaU8@dhcp22.suse.cz>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_052354_036549_D763DE06 
X-CRM114-Status: GOOD (  37.07  )
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
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
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

>>> A lot of unevictable memory is a concern regardless of CMA/ZONE_MOVABLE.
>>> As I've said it is quite easy to land at the similar situation even with
>>> tmpfs/MAP_ANON|MAP_SHARED on swapless system. Neither of the two is
>>> really uncommon. It would be even worse that those would be allowed to
>>> consume both CMA/ZONE_MOVABLE.
>>
>> IIRC, tmpfs/MAP_ANON|MAP_SHARED memory
>> a) Is movable, can land in ZONE_MOVABLE/CMA
>> b) Can be limited by sizing tmpfs appropriately
>>
>> AFAIK, what you describe is a problem with memory overcommit, not with zone
>> imbalances (below). Or what am I missing?
> 
> It can be problem for both. If you have just too much of shm (do not
> forget about MAP_SHARED|MAP_ANON which is much harder to size from an
> admin POV) then migrateability doesn't really help because you need a
> free memory to migrate. Without reclaimability this can easily become a
> problem. That is why I am saying this is not really a new problem.
> Swapless systems are not all that uncommon.

I get your point, it's similar but still different. "no memory in the 
system" vs. "plenty of unusable free memory available in the system".

In many setups, memory for user space applications can go to 
ZONE_MOVABLE just fine. ZONE_NORMAL etc. can be used for supporting user 
space memory (e.g., page tables) and other kernel stuff.

Like, have 4GB of ZONE_MOVABLE with 2GB of ZONE_NORMAL. Have an 
application (database) that allocates 4GB of memory. Works just fine. 
The zone ratio ends up being a problem for example with many processes 
(-> many page tables).

Not being able to put user space memory into the movable zone is a 
special case. And we are introducing yet another special case here 
(besides vfio, rdma, unmigratable huge pages like gigantic pages).

With plenty of secretmem, looking at /proc/meminfo Total vs. Free can be 
a big lie of how your system behaves.

>   
>>> One has to be very careful when relying on CMA or movable zones. This is
>>> definitely worth a comment in the kernel command line parameter
>>> documentation. But this is not a new problem.
>>
>> I see the following thing worth documenting:
>>
>> Assume you have a system with 2GB of ZONE_NORMAL/ZONE_DMA and 4GB of
>> ZONE_MOVABLE/CMA.
>>
>> Assume you make use of 1.5GB of secretmem. Your system might run into OOM
>> any time although you still have plenty of memory on ZONE_MOVAVLE (and even
>> swap!), simply because you are making excessive use of unmovable allocations
>> (for user space!) in an environment where you should not make excessive use
>> of unmovable allocations (e.g., where should page tables go?).
> 
> yes, you are right of course and I am not really disputing this. But I
> would argue that 2:1 Movable/Normal is something to expect problems
> already. "Lowmem" allocations can easily trigger OOM even without secret
> mem in the picture. It all just takes to allocate a lot of GFP_KERNEL or
> even GFP_{HIGH}USER. Really, it is CMA/MOVABLE that are elephant in the
> room and one has to be really careful when relying on them.

Right, it's all about what the setup actually needs. Sure, there are 
cases where you need significantly more GFP_KERNEL/GFP_{HIGH}USER such 
that a 2:1 ratio is not feasible. But I claim that these are corner cases.

Secretmem gives user space the option to allocate a lot of 
GFP_{HIGH}USER memory. If I am not wrong, "ulimit -a" tells me that each 
application on F33 can allocate 16 GiB (!) of secretmem.

Which other ways do you know where random user space can do something 
similar? I'd be curious what other scenarios there are where user space 
can easily allocate a lot of unmovable memory.

>   
>> The existing controls (mlock limit) don't really match the current semantics
>> of that memory. I repeat it once again: secretmem *currently* resembles
>> long-term pinned memory, not mlocked memory.
> 
> Well, if we had a proper user space pinning accounting then I would
> agree that there is a better model to use. But we don't. And previous
> attempts to achieve that have failed. So I am afraid that we do not have
> much choice left than using mlock as a model.

Yes, I agree.

> 
>> Things will change when
>> implementing migration support for secretmem pages. Until then, the
>> semantics are different and this should be spelled out.
>>
>> For long-term pinnings this is kind of obvious, still we're now documenting
>> it because it's dangerous to not be aware of. Secretmem behaves exactly the
>> same and I think this is worth spelling out: secretmem has the potential of
>> being used much more often than fairly special vfio/rdma/ ...
> 
> yeah I do agree that pinning is a problem for movable/CMA but most
> people simply do not care about those. Movable is the thing for hoptlug
> and a really weird fragmentation avoidance IIRC and CMA is mostly to

+ handling gigantic pages dynamically

> handle crap HW. If those are to be used along with secret mem or
> longterm GUP then they will constantly bump into corner cases. Do not
> take me wrong, we should be looking at those problems, we should even
> document them but I do not see this as anything new. We should probably
> have a central place in Documentation explaining all those problems. I

Exactly.

> would be even happy to see an explicit note in the tunables - e.g.
> configuring movable/normal in 2:1 will get you back to 32b times wrt.
> low mem problems.

In most setups, ratios of 1:1 up to 4:1 work reasonably well. Of course, 
it's not applicable to all setups (obviously).

For example, oVirt has been using ratios of 3:1 for a long time. (online 
all memory to ZONE_MOVABLE in the guest, never hotplug more than 3x boot 
memory size). Most distros end up onlining all hotplugged memory on bare 
metal to ZONE_MOVABLE, and I've seen basically no bug reports related to 
that.

Highmem was a little different, yet similar. RHEL provided the bigmem 
kernel with ratios of 60:4, which worked in many setups. The main 
difference to highmem was that e.g., pagetables could be placed onto it. 
So ratios like 18:1 are completely insane with ZONE_MOVABLE.

I am constantly trying to fight for making more stuff MOVABLE instead of 
going into the other direction (e.g., because it's easier to implement, 
which feels like the wrong direction).

Maybe I am the only person that really cares about ZONE_MOVABLE these 
days :) I can't stop such new stuff from popping up, so at least I want 
it to be documented.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
