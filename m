Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0327DC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 11:27:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859EF64DD8
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 11:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859EF64DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vU8WuUhMI6GX1AY9JnFxFD5+rvFaBW+YQ5ikSsXfp+c=; b=lE6PaErTE4+Yx/wunGfpowwFL
	KdMTBU9cxPcNRMI++qERcpubpc5vShhZcSmFY9s7SU4jffCtRQBGlD0bEOeR6xY24YWYStrXDTpV0
	BGPNJLtZoZrX6w1aDKwud9KcQMyx9TBqcUg7Q/za2uOoKfWqLMCePp+M+YEpCiqy9+rfNN2t4VROD
	b3qJnBayhm0GjyLdBsIAKSzdbaQa5YaX1l5moHyFLwuscfKAZBGHbthJKWrB8dLjqnENrUhHQa8DW
	f7UqKKf552K4Sd6L3LVegQne+l2EBlTXw48uH19XKNdzGbGvKEOmgo8PM1fI7shf2vIatKVsZDYIi
	k/fPYiw8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l94gy-0007qv-IB; Mon, 08 Feb 2021 11:26:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l94gr-0007nN-NN
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 11:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3dJ61ykrqT6xZ75oELmWT0+ySTJ4cYepjC0Xzb/Htc=;
 b=ZVS8fy6dU7jsaR0+XLT749YjYsZn6nu13l6fuMvEDi4P/bryvKOhVom9lLGZ7g9l3/x5l4
 Wo+Cwa6/a3KbyralreX+SNhL9CMiOCZtaXBst00jZIiEMRDCoNDaAZrZmyiMre7Cwj+/IP
 z/Hgyf2E8dnLS8fyQAeF+/JeN+HuQ5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-k4r9VghcN_OoP9Gu4wJEeA-1; Mon, 08 Feb 2021 06:26:45 -0500
X-MC-Unique: k4r9VghcN_OoP9Gu4wJEeA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E1D107ACED;
 Mon,  8 Feb 2021 11:26:41 +0000 (UTC)
Received: from [10.36.113.240] (ovpn-113-240.ams2.redhat.com [10.36.113.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA4511002388;
 Mon,  8 Feb 2021 11:26:32 +0000 (UTC)
Subject: Re: [PATCH v17 08/10] PM: hibernate: disable when there are active
 secretmem users
From: David Hildenbrand <david@redhat.com>
To: Michal Hocko <mhocko@suse.com>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-9-rppt@kernel.org> <YCEP/bmqm0DsvCYN@dhcp22.suse.cz>
 <38c0cad4-ac55-28e4-81c6-4e0414f0620a@redhat.com>
 <YCEXwUYepeQvEWTf@dhcp22.suse.cz>
 <a488a0bb-def5-0249-99e2-4643787cef69@redhat.com>
 <YCEZAWOv63KYglJZ@dhcp22.suse.cz>
 <770690dc-634a-78dd-0772-3aba1a3beba8@redhat.com>
 <21f4e742-1aab-f8ba-f0e7-40faa6d6c0bb@redhat.com>
Organization: Red Hat GmbH
Message-ID: <5db6ac46-d4e1-3c68-22a0-94f2ecde8801@redhat.com>
Date: Mon, 8 Feb 2021 12:26:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <21f4e742-1aab-f8ba-f0e7-40faa6d6c0bb@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_062649_831508_2D292B17 
X-CRM114-Status: GOOD (  18.70  )
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

On 08.02.21 12:14, David Hildenbrand wrote:
> On 08.02.21 12:13, David Hildenbrand wrote:
>> On 08.02.21 11:57, Michal Hocko wrote:
>>> On Mon 08-02-21 11:53:58, David Hildenbrand wrote:
>>>> On 08.02.21 11:51, Michal Hocko wrote:
>>>>> On Mon 08-02-21 11:32:11, David Hildenbrand wrote:
>>>>>> On 08.02.21 11:18, Michal Hocko wrote:
>>>>>>> On Mon 08-02-21 10:49:18, Mike Rapoport wrote:
>>>>>>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>>>>>>
>>>>>>>> It is unsafe to allow saving of secretmem areas to the hibernation
>>>>>>>> snapshot as they would be visible after the resume and this essentially
>>>>>>>> will defeat the purpose of secret memory mappings.
>>>>>>>>
>>>>>>>> Prevent hibernation whenever there are active secret memory users.
>>>>>>>
>>>>>>> Does this feature need any special handling? As it is effectivelly
>>>>>>> unevictable memory then it should behave the same as other mlock, ramfs
>>>>>>> which should already disable hibernation as those cannot be swapped out,
>>>>>>> no?
>>>>>>>
>>>>>>
>>>>>> Why should unevictable memory not go to swap when hibernating? We're merely
>>>>>> dumping all of our system RAM (including any unmovable allocations) to swap
>>>>>> storage and the system is essentially completely halted.
>>>>>>
>>>>> My understanding is that mlock is never really made visible via swap
>>>>> storage.
>>>>
>>>> "Using swap storage for hibernation" and "swapping at runtime" are two
>>>> different things. I might be wrong, though.
>>>
>>> Well, mlock is certainly used to keep sensitive information, not only to
>>> protect from major/minor faults.
>>>
>>
>> I think you're right in theory, the man page mentions "Cryptographic
>> security software often handles critical bytes like passwords or secret
>> keys as data structures" ...
>>
>> however, I am not aware of any such swap handling and wasn't able to
>> spot it quickly. Let me take a closer look.
> 
> s/swap/hibernate/

My F33 system happily hibernates to disk, even with an application that 
succeeded in din doing an mlockall().

And it somewhat makes sense. Even my freshly-booted, idle F33 has

$ cat /proc/meminfo  | grep lock
Mlocked:            4860 kB

So, stopping to hibernate with mlocked memory would essentially prohibit 
any modern Linux distro to hibernate ever.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
