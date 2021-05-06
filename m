Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E445C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:45:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDEF61154
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 16:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDEF61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=64Mll5Me07OreAjvPOzlUQ6AESDDL+GsGfMBMxsVBJQ=; b=JLE2eVylOcXkXUrpL67MBbhfh
	Ve/HrnhPPJwAiJWoOMeoT+zHbdLFjnwuCsX4juOacmQQlVdyHjNP6D02zh078qhWHN6Apoz+4etgi
	A1JdQxuObGL71yw5dGzixIrA/QPBQyIwMkPJSRfyw5USIXzIz6eJAUrvhbfST5FN0fVy93791luce
	JioFzxykNun1+cz5SCUvuCr2JHRDScK8wDsujJN20VcimWaygudSXOkgoE9gaYNEwq5dIwVv4xunF
	fXBVsWJKlMbAt1K8cqgB2JZpE8MsYODUDGx7/TZCfJq9HcKAvscniEm89YFYkZ1jgmD27OzOhl75i
	zfaSvWTXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leh7q-004qWn-GT; Thu, 06 May 2021 16:45:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leh7n-004qWR-IU
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 16:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=0s/7VDcOT9Z56vBvGNlao04OZufq+cCm9HLSATOe2hs=; b=rcI+jn5oUfgtkOsYmTagVukg34
 Xlb4hhHCzcz/IB4e4C9R7P8aE9YxGcxgKAMLutIKkig4usLUGgKzBIgI9wtH+KkjqxjLTSawjjhJl
 Lv+mjbfJBWL4yTER5585voZaly02NDJiDeORIDaRag9QviuLueqJ8rlB/RTmx5uTC+LqhLJ8hBXDK
 2x/+b62ncswUFIu7qTEkYmzkp6xSClQQKM6tDh2GWdAlBuGdrZfhsLUJzyUh9xwveF8499cdNZAI6
 /mREsGNNtDXhEwtChGNtdR9QWlon3nO0t5cNJwPUTcPXeF2V1TFDXYH+UkBPnJFiOCqV0AOMqhdlD
 iXvnUl7Q==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leh7k-006E6D-AD
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 16:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620319513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0s/7VDcOT9Z56vBvGNlao04OZufq+cCm9HLSATOe2hs=;
 b=G5LPTYpGrR3Su1IYZH1gXqMZwyHEAvgcI0l4Cj1aXNS6shNfJON3gJTdPjf3ompWBEJ2LN
 EQ4LMPXce2x77OY4EVTML8jSDO6jIkyQXqcVhLCqvdmiBIhWvEUTbl/ljZkurD2bJc2szN
 j7l5HSE1oWhHw/AzrwaZ+Rj07xVscEk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-DNXMhpXINp6HYbAp919_Ig-1; Thu, 06 May 2021 12:45:10 -0400
X-MC-Unique: DNXMhpXINp6HYbAp919_Ig-1
Received: by mail-ej1-f72.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso1938808ejn.10
 for <linux-riscv@lists.infradead.org>; Thu, 06 May 2021 09:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0s/7VDcOT9Z56vBvGNlao04OZufq+cCm9HLSATOe2hs=;
 b=aMhhpVdzlulf/0pu5zFdhkUlk54yRNMM+7VbvpO4v8u7RQkTuoXWarXqqv5Rn27dkx
 3hFm+ikMhTTPqtPc7c8QytgiZUJt92fPs6uQmu4tSxZQv8BlA1zgY5FOxo6Wumama/9/
 faV+/TSS2Nna4IYxOK4Gh229mf1euWkXeFSy6PPl5fKC2K5NLRDJuBhnPtWfG7C0cJUp
 nalkstIPLIzH0DYFqe2IW8FdrRPZt+Twx1dwS+3b9hCN1YGG30cYlliO2avaSNQ7Jqov
 OqHgY/ptU58Vgv4dYoGM5e5F3HemWDU+IwXqmxVDKPJC1NUAgKr6UmCmK/tfcG4vEsxV
 cLYQ==
X-Gm-Message-State: AOAM531O+JX0LYS1nI7C2GLSIcgBrNAVKmqjGkQLPJ+1zgUybvfCct8u
 FG3p7j+Qkodu3T+22iVKGvtGEBOTgQRpuUC9xcquv71Ua9M8/ocx5AhKIA6o50Ugc3LjbTylkvq
 Gzmf9UkR26MGG9H4fRfgLFNSnLvP4
X-Received: by 2002:a17:907:1c98:: with SMTP id
 nb24mr5478150ejc.206.1620319508753; 
 Thu, 06 May 2021 09:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw+5/fwG+KvK+SBzoVexxr801GBTZ6Zrmz5O+rAzTFPxJI4yj9g+Ax3izTWEuuMsZJC630XQ==
X-Received: by 2002:a17:907:1c98:: with SMTP id
 nb24mr5478083ejc.206.1620319508409; 
 Thu, 06 May 2021 09:45:08 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64ae.dip0.t-ipconnect.de. [91.12.100.174])
 by smtp.gmail.com with ESMTPSA id f19sm2095318edu.12.2021.05.06.09.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 09:45:08 -0700 (PDT)
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
Date: Thu, 6 May 2021 18:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_094516_444779_E338B200 
X-CRM114-Status: GOOD (  34.19  )
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

On 06.05.21 17:26, James Bottomley wrote:
> On Wed, 2021-05-05 at 12:08 -0700, Andrew Morton wrote:
>> On Wed,  3 Mar 2021 18:22:00 +0200 Mike Rapoport <rppt@kernel.org>
>> wrote:
>>
>>> This is an implementation of "secret" mappings backed by a file
>>> descriptor.
>>>
>>> The file descriptor backing secret memory mappings is created using
>>> a dedicated memfd_secret system call The desired protection mode
>>> for the memory is configured using flags parameter of the system
>>> call. The mmap() of the file descriptor created with memfd_secret()
>>> will create a "secret" memory mapping. The pages in that mapping
>>> will be marked as not present in the direct map and will be present
>>> only in the page table of the owning mm.
>>>
>>> Although normally Linux userspace mappings are protected from other
>>> users, such secret mappings are useful for environments where a
>>> hostile tenant is trying to trick the kernel into giving them
>>> access to other tenants mappings.
>>
>> I continue to struggle with this and I don't recall seeing much
>> enthusiasm from others.  Perhaps we're all missing the value point
>> and some additional selling is needed.
>>
>> Am I correct in understanding that the overall direction here is to
>> protect keys (and perhaps other things) from kernel bugs?  That if
>> the kernel was bug-free then there would be no need for this
>> feature?  If so, that's a bit sad.  But realistic I guess.
> 
> Secret memory really serves several purposes. The "increase the level
> of difficulty of secret exfiltration" you describe.  And, as you say,
> if the kernel were bug free this wouldn't be necessary.
> 
> But also:
> 
>     1. Memory safety for use space code.  Once the secret memory is
>        allocated, the user can't accidentally pass it into the kernel to be
>        transmitted somewhere.

That's an interesting point I didn't realize so far.

>     2. It also serves as a basis for context protection of virtual
>        machines, but other groups are working on this aspect, and it is
>        broadly similar to the secret exfiltration from the kernel problem.
> 

I was wondering if this also helps against CPU microcode issues like 
spectre and friends.

>>
>> Is this intended to protect keys/etc after the attacker has gained
>> the ability to run arbitrary kernel-mode code?  If so, that seems
>> optimistic, doesn't it?
> 
> Not exactly: there are many types of kernel attack, but mostly the
> attacker either manages to effect a privilege escalation to root or
> gets the ability to run a ROP gadget.  The object of this code is to be
> completely secure against root trying to extract the secret (some what
> similar to the lockdown idea), thus defeating privilege escalation and
> to provide "sufficient" protection against ROP gadget.

What stops "root" from mapping /dev/mem and reading that memory?

IOW, would we want to enforce "CONFIG_STRICT_DEVMEM" with CONFIG_SECRETMEM?


Also, there is a way to still read that memory when root by

1. Having kdump active (which would often be the case, but maybe not to 
dump user pages )
2. Triggering a kernel crash (easy via proc as root)
3. Waiting for the reboot after kump() created the dump and then reading 
the content from disk.

Or, as an attacker, load a custom kexec() kernel and read memory from 
the new environment. Of course, the latter two are advanced mechanisms, 
but they are possible when root. We might be able to mitigate, for 
example, by zeroing out secretmem pages before booting into the kexec 
kernel, if we care :)

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
