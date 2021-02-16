Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4803CC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:17:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F2364DFF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F2364DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e2Z6o9SY+Sz4sqqz+xZQa9/6lnQqIs9Yosnwb7oLTRs=; b=jGhKOBCOCOpsunqDsx+xh69Dh
	fshBSaKJ5K+HVWzjfusZ8c1q8g4PYNBkjuxkzK96gpdEnaQQsTHk7Mjyank+f86oUL4gfkqd4KpOQ
	IPrHX1XTAokhozoiMe+w3tqdh/oAlqXBwVJ98fJnArgjXlqASeTjl8GRwXajmUX8SlRYfd9KD+Vol
	h37LWz/CobqNn+oSZpuE+fuzC4nyG/xwIDnx80Tm1YbCpEu18lfBKY3pfEhQq8BRj7EQUWHnMg2AL
	SgO9Mn6ziYgH57pbVbZIx3VCwbwfmmbqZT9NdoNG3dZAexnvmXzvNRW0T2uGqDqFqA4vEtM14K9y/
	791EP/TLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3yD-0008Q5-42; Tue, 16 Feb 2021 17:17:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3y8-0008O3-Vy
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 17:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613495820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbwyoqWTddMQQM4e/pb2Tn5NqnOPDp0+cC8mDVS66VE=;
 b=GHo9tkX1SbVo+1OOHOI1jCap6OUfB4bCMxW4oxuD76Er6F/ojThTD9WEJhFPj/LLOeWxh5
 rSf81Za2VtpvsR2+eMKnxChzNeT/KJwyy7RWzdfAu44wYqjcSZo4J8dA2tESKfBcpfItMc
 bWFb/MJKriWt99QEJM9NEz4rxujy5z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-KxZdhhyXMpKDSHckankMMw-1; Tue, 16 Feb 2021 12:16:50 -0500
X-MC-Unique: KxZdhhyXMpKDSHckankMMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465FB80402E;
 Tue, 16 Feb 2021 17:16:45 +0000 (UTC)
Received: from [10.36.114.70] (ovpn-114-70.ams2.redhat.com [10.36.114.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615F35D9CC;
 Tue, 16 Feb 2021 17:16:37 +0000 (UTC)
To: jejb@linux.ibm.com, Michal Hocko <mhocko@suse.com>
References: <20210214091954.GM242749@kernel.org>
 <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
 <244f86cba227fa49ca30cd595c4e5538fe2f7c2b.camel@linux.ibm.com>
 <YCo7TqUnBdgJGkwN@dhcp22.suse.cz>
 <be1d821d3f0aec24ad13ca7126b4359822212eb0.camel@linux.ibm.com>
 <YCrJjYmr7A2nO6lA@dhcp22.suse.cz>
 <12c3890b233c8ec8e3967352001a7b72a8e0bfd0.camel@linux.ibm.com>
 <dfd7db5c-a8c7-0676-59f8-70aa6bcaabe7@redhat.com>
 <000cfaa0a9a09f07c5e50e573393cda301d650c9.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <5a8567a9-6940-c23f-0927-e4b5c5db0d5e@redhat.com>
Date: Tue, 16 Feb 2021 18:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <000cfaa0a9a09f07c5e50e573393cda301d650c9.camel@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_121701_195104_D101C974 
X-CRM114-Status: GOOD (  20.71  )
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
 Hagen Paul Pfeifer <hagen@jauu.net>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
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

>>   For the other parts, the question is what we actually want to let
>> user space configure.
>>
>> Being able to specify "Very secure" "maximum secure" "average
>> secure"  all doesn't really make sense to me.
> 
> Well, it doesn't to me either unless the user feels a cost/benefit, so
> if max cost $100 per invocation and average cost nothing, most people
> would chose average unless they had a very good reason not to.  In your
> migratable model, if we had separate limits for non-migratable and
> migratable, with non-migratable being set low to prevent exhaustion,
> max secure becomes a highly scarce resource, whereas average secure is
> abundant then having the choice might make sense.

I hope that we can find a way to handle the migration part internally. 
Especially, because Mike wants the default to be "as secure as 
possible", so if there is a flag, it would have to be an opt-out flag.

I guess as long as we don't temporarily map it into the "owned" location 
in the direct map shared by all VCPUs we are in a good positon. But this 
needs more thought, of course.

> 
>>   The discussion regarding migratability only really popped up because
>> this is a user-visible thing and not being able to migrate can be a
>> real problem (fragmentation, ZONE_MOVABLE, ...).
> 
> I think the biggest use will potentially come from hardware
> acceleration.  If it becomes simple to add say encryption to a secret
> page with no cost, then no flag needed.  However, if we only have a
> limited number of keys so once we run out no more encrypted memory then
> it becomes a costly resource and users might want a choice of being
> backed by encryption or not.

Right. But wouldn't HW support with configurable keys etc. need more 
syscall parameters (meaning, even memefd_secret() as it is would not be 
sufficient?). I suspect the simplistic flag approach might not be 
sufficient. I might be wrong because I have no clue about MKTME and friends.

Anyhow, I still think extending memfd_create() might just be good enough 
- at least for now. Things like HW support might have requirements we 
don't even know yet and that we cannot even model in memfd_secret() 
right now.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
