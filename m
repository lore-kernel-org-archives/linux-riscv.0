Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344D6C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 17:25:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BD2610E7
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 17:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BD2610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YC7ICxT2rPm+aSpjMr4c8I9166274XsCzfodjexfWZs=; b=nkCPGBVSbpdDfH/cAMzPvvbVi
	ZH68oAbQrNyjqwophfq9c8mkTIB05HOmwyI323ls/uZzjsJbQD6HAa6tW8EorQE5g+SUWMfk3/EWv
	Mde3zV0encWqLdTQS9EQtxE0QgAc7vVfh7/4EfO8Ml9Fy9leHXWnzV4eHFbBlK6RM1NwjS879G+HF
	grLhLCvkfXG52szCp3d/7DGdfabgZXPFMZS1eURmLbvb2uIMrhBBZrH04hIzD1Afy/7mlJsF46ha2
	S2GYBk6uPL34MLI7qEYM1VRwtWqaOlye2jRgpSytO0qoo5j4ZIBUvKJUYwDtOKlS/uVer4kSDZ56F
	368KbRirA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lehkJ-004vPS-By; Thu, 06 May 2021 17:25:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehk6-004vNr-9g
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 17:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=jExgBas4mYe2R7HQ1xBXEHvzUr1CEHDDU82ObrbRp1A=; b=BvyqpQmGrfS+APlPQP5MrrUjJl
 1qUUn5runFs6SghYo8Dc2g84N1Q1dzXB4TYG8LX6GHTlW4k7XyEgJIAVxsD28uBdDDtKYOeZeGa5F
 sS3ZMeuutDNIw+IBdcPW684yIqdUpyyUOpUp2mGd/GXc1hosns5tGT24y9B52JtG1U8Uf1f1Bb1lb
 pUaEU2QhGqwdN9523A6eh2KrG/JGDWP4APTjLTJo4lNaiQDPgoQHGTY0zfVpBepVGjU7GFICQx7MP
 eZMRrwQRPJfIG5/bDyAISPxrQf7Si569wFshyy3NsAND7Lro2LCCZ9YzA/GKAORaeikt5hiWencD7
 QCWRTixg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lehk3-006Fej-Mq
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 17:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620321890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jExgBas4mYe2R7HQ1xBXEHvzUr1CEHDDU82ObrbRp1A=;
 b=TkyNrra0/AZQco0RsDRxcHAsVrnOCjUz1wvIInx9GxfvqL/CbQ1GfZDQXo9xrvGWb226tr
 i00ePWa+Y6Du8yjl9+wynxd6PPQki8SVVi29oZcMhqFbYTAWgfMD65b0S1zLLGP+bByy2j
 mBgOEHaS6j9ld6HkF4idbvu0+bEjszY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-4d0Yda1CMJm6dyV_iw5EHw-1; Thu, 06 May 2021 13:24:47 -0400
X-MC-Unique: 4d0Yda1CMJm6dyV_iw5EHw-1
Received: by mail-ed1-f72.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso3014968edd.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 10:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jExgBas4mYe2R7HQ1xBXEHvzUr1CEHDDU82ObrbRp1A=;
 b=q2bXdz4FcMYvEcPKfI41UPXFhVJYdIOwfmOzr0HpUQShp41IjbJnOhiqgHG2eBFfdl
 3yqHfrg2i6eWkqBnyDuZEK0OhuhwdERL91mFWT7iTLumKMBY92YE0gQwHRthXnAoDRug
 ZZCFsiSYrcBZMtx0R+CzWw28nSDWnlgLMHKcBkE/sqgJZXLRJiQSYbnWVabsNuzx9oi0
 vWJQxDYtQt59RnXrtJIr0zLZgZZhUZorKesQB8pJHZlZR6My/SaHy32ShPejN7puCQzk
 rS1XIzFOw6o+Q7rAidDz9X6+4/QeaKsbJITin738VNmOGHyRITNaEbnc3AHB/Q5skrWB
 PeXg==
X-Gm-Message-State: AOAM532C6u5p1Rdf8iyZtWp5nhajl7/wd9EJ+sbNkuwdBXs1IG7XgXF8
 b2tM51z8P34gRR7hNFI2xFrKUAkxF2rVmxEzwDs/rg0rFdy5NvbMTEnEaeKhetCiBS6yRxnuynQ
 /bvtnjiZA6Hx9Y8V9Ye+O7EdvFsKD
X-Received: by 2002:aa7:d952:: with SMTP id l18mr6506577eds.83.1620321886024; 
 Thu, 06 May 2021 10:24:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0HYEbkAPLbEzE0RQH/Kg006zDXqRhpGiJee/o6TGxungGJENUOS9lWTxREQMEK2RJtQPDnQ==
X-Received: by 2002:aa7:d952:: with SMTP id l18mr6506560eds.83.1620321885798; 
 Thu, 06 May 2021 10:24:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id y19sm2147544edc.73.2021.05.06.10.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 10:24:45 -0700 (PDT)
To: jejb@linux.ibm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
 <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <a5b19a4f-5d7b-9840-fd70-67a39bc8969e@redhat.com>
Date: Thu, 6 May 2021 19:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_102451_828677_87C47E3F 
X-CRM114-Status: GOOD (  26.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>>>> Is this intended to protect keys/etc after the attacker has
>>>> gained the ability to run arbitrary kernel-mode code?  If so,
>>>> that seems optimistic, doesn't it?
>>>
>>> Not exactly: there are many types of kernel attack, but mostly the
>>> attacker either manages to effect a privilege escalation to root or
>>> gets the ability to run a ROP gadget.  The object of this code is
>>> to be completely secure against root trying to extract the secret
>>> (some what similar to the lockdown idea), thus defeating privilege
>>> escalation and to provide "sufficient" protection against ROP
>>> gadget.
>>
>> What stops "root" from mapping /dev/mem and reading that memory?
> 
> /dev/mem uses the direct map for the copy at least for read/write, so
> it gets a fault in the same way root trying to use ptrace does.  I
> think we've protected mmap, but Mike would know that better than I.
> 

I'm more concerned about the mmap case -> remap_pfn_range(). Anybody 
going via the VMA shouldn't see the struct page, at least when 
vma_normal_page() is properly used; so you cannot detect secretmem
memory mapped via /dev/mem reliably. At least that's my theory :)

[...]

>> Also, there is a way to still read that memory when root by
>>
>> 1. Having kdump active (which would often be the case, but maybe not
>> to dump user pages )
>> 2. Triggering a kernel crash (easy via proc as root)
>> 3. Waiting for the reboot after kump() created the dump and then
>> reading the content from disk.
> 
> Anything that can leave physical memory intact but boot to a kernel
> where the missing direct map entry is restored could theoretically
> extract the secret.  However, it's not exactly going to be a stealthy
> extraction ...
> 
>> Or, as an attacker, load a custom kexec() kernel and read memory
>> from the new environment. Of course, the latter two are advanced
>> mechanisms, but they are possible when root. We might be able to
>> mitigate, for example, by zeroing out secretmem pages before booting
>> into the kexec kernel, if we care :)
> 
> I think we could handle it by marking the region, yes, and a zero on
> shutdown might be useful ... it would prevent all warm reboot type
> attacks.

Right. But I guess when you're actually root, you can just write a 
kernel module to extract the information you need (unless we have signed 
modules, so it could be harder/impossible).

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
