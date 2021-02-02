Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56766C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 13:14:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF07664ECF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 13:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF07664ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WhwNq7lIhVLi0hq6EobUWfmcwEHqiDe8yolGkqJbkQU=; b=m6WF+Aw10eHdM6xuHrcew8iEr
	zy41uA5oYkJENGXpupmVPvUKbWgtumse3LhpXe0S7BDmRUWdyBHG2Xi9HgfYd+ZAIg5F7V85C7/dg
	2UwM/aAqbr8ELmsSM3DQ2ubWm04AIU1h/MockHXZJKJdwP/568ce/xyoSnjy/3TOIqgh7VFQnfYhH
	A/uSpRtdhIOagEiIY6vYItN+Mer/oAVl6Ur+3HJZfoIMcSFRw//XtiwzBV5VkUUNvjb1V5a/Y0qq3
	bymzM3rreab1yZ/fDByNL71r/Y3Y2wkOINBrKDJvf+FhjaLEZ/mN2psL8CyFqq07KOROt5B23Gp8z
	vNksmqUCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6vVp-0006w7-HC; Tue, 02 Feb 2021 13:14:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6vVm-0006um-0v
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 13:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612271669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzlZq29k5DxcO121v0em/werHdNKON5M2NKDPpBxCdU=;
 b=OPPtcnxIdyCjRncwVvFcJrUscPz1+YjBsw6PM/IUFVx/YBz5ThXDG5UOct6wdjrysLEsXQ
 Bfa7gDetJ4Vrn1wXtqoWchG1aztglNVsZIkxyX6xDkc0lbJAKONwGb4aXCGhScnrTCycgw
 /WWdPHb4CzGlPKN+Qhs29w736BeeTRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-YjtjDQfPMTG3ZZy6csP2bQ-1; Tue, 02 Feb 2021 08:14:25 -0500
X-MC-Unique: YjtjDQfPMTG3ZZy6csP2bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FC69CDA0;
 Tue,  2 Feb 2021 13:14:20 +0000 (UTC)
Received: from [10.36.114.148] (ovpn-114-148.ams2.redhat.com [10.36.114.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 463FE1F0;
 Tue,  2 Feb 2021 13:14:10 +0000 (UTC)
To: Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>
References: <20210121122723.3446-8-rppt@kernel.org>
 <20210126114657.GL827@dhcp22.suse.cz>
 <303f348d-e494-e386-d1f5-14505b5da254@redhat.com>
 <20210126120823.GM827@dhcp22.suse.cz> <20210128092259.GB242749@kernel.org>
 <YBK1kqL7JA7NePBQ@dhcp22.suse.cz>
 <73738cda43236b5ac2714e228af362b67a712f5d.camel@linux.ibm.com>
 <YBPF8ETGBHUzxaZR@dhcp22.suse.cz>
 <6de6b9f9c2d28eecc494e7db6ffbedc262317e11.camel@linux.ibm.com>
 <YBkcyQsky2scjEcP@dhcp22.suse.cz> <20210202124857.GN242749@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v16 07/11] secretmem: use PMD-size pages to amortize
 direct map fragmentation
Message-ID: <6653288a-dd02-f9de-ef6a-e8d567d71d53@redhat.com>
Date: Tue, 2 Feb 2021 14:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210202124857.GN242749@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_081430_167410_95E838A1 
X-CRM114-Status: GOOD (  28.98  )
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

On 02.02.21 13:48, Mike Rapoport wrote:
> On Tue, Feb 02, 2021 at 10:35:05AM +0100, Michal Hocko wrote:
>> On Mon 01-02-21 08:56:19, James Bottomley wrote:
>>
>> I have also proposed potential ways out of this. Either the pool is not
>> fixed sized and you make it a regular unevictable memory (if direct map
>> fragmentation is not considered a major problem)
> 
> I think that the direct map fragmentation is not a major problem, and the
> data we have confirms it, so I'd be more than happy to entirely drop the
> pool, allocate memory page by page and remove each page from the direct
> map.
> 
> Still, we cannot prove negative and it could happen that there is a
> workload that would suffer a lot from the direct map fragmentation, so
> having a pool of large pages upfront is better than trying to fix it
> afterwards. As we get more confidence that the direct map fragmentation is
> not an issue as it is common to believe we may remove the pool altogether.
> 
> I think that using PMD_ORDER allocations for the pool with a fallback to
> order 0 will do the job, but unfortunately I doubt we'll reach a consensus
> about this because dogmatic beliefs are hard to shake...
> 
> A more restrictive possibility is to still use plain PMD_ORDER allocations
> to fill the pool, without relying on CMA. In this case there will be no
> global secretmem specific pool to exhaust, but then it's possible to drain
> high order free blocks in a system, so CMA has an advantage of limiting
> secretmem pools to certain amount of memory with somewhat higher
> probability for high order allocation to succeed.

I am not really concerned about fragmenting/breaking up the direct map 
as long as the feature has to be explicitly enabled (similar to 
fragmenting the vmemmap).

As already expressed, I dislike allowing user space to consume an 
unlimited number unmovable/unmigratable allocations. We already have 
that in some cases with huge pages (when the arch does not support 
migration) - but there we can at least manage the consumption using the 
whole max/reserved/free/... infrastructure. In addition, adding arch 
support for migration shouldn't be too complicated.

The idea of using CMA is quite good IMHO, because there we can locally 
limit the direct map fragmentation and don't have to bother about 
migration at all. We own the area, so we can place as many unmovable 
allocations on it as we can fit.

But it sounds like, we would also need some kind of reservation 
mechanism in either scenario (CMA vs. no CMA).

If we don't want to go full-circle on max/reserved/free/..., allowing 
for migration of secretmem pages would make sense. Then, these pages 
become "less special". Map source, copy, unmap destination. The security 
implementations are the ugly part. I wonder if we could temporarily map 
somewhere else, so avoiding to touch the direct map during migration.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
