Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51944C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB9HhvLtIpfL+dQfvU+ZkItspg667q4d7xScPJqWQOw=; b=bOFixjc+owda88
	ctK1+HN2ZM7Nf4FTOGTnY2+fyRKDbg86wRdP4Nbx14R+QRtgrA+QHuy0F0fstHwIRFA9RuY9VCGTT
	Gb5saiDWy1saFIC7A/rYNAxo+NlcdF1R/FM029bf2HHgcO5gxgHB01q2IKnH1U6MH/e+9OUmDyjn/
	j40HHUBV2Vfywa1heciJfdW+qvmJSxqyGKquhiINI21azqRGOVQasYExc9sxNxEt8mIL8GHSIklQi
	Smm0/a+cN2fb5YrCvwUjgSIK78CxdNKuO9cxjRqsCXjtQ7PbW9X2lLfhE/Hd8yoxj/ycBFtUQcB0V
	aU+I1QNkdYIuFqpyE1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVC9H-0000000465s-2Hj8;
	Wed, 31 Jan 2024 15:05:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVC9E-00000004641-1Q0k
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 15:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706713506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8UiDtjYzAEsQUUsTUgaKm51MIMhmWClBl6VOmtQ8YF0=;
	b=Q/DMbLcI/s/PMdP/12skK+RMpoa22zPdHEjv/3dTRMhl8bH4t2OXGeuJPL+tipBKnhy7+n
	4d3KVeo/1+u4FsDzC+7I/7vG9nI0Cp1JjLbLDffPxHteCGFRl5Q/TxyG4Kod+pJc71CRh5
	QWBA8fxo4lrsFJuiOpldU8VeZBWg12s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-GPsjzvdyNya1Mu9uHwFFkg-1; Wed, 31 Jan 2024 10:05:04 -0500
X-MC-Unique: GPsjzvdyNya1Mu9uHwFFkg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33ae5be0940so1769245f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 07:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706713503; x=1707318303;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UiDtjYzAEsQUUsTUgaKm51MIMhmWClBl6VOmtQ8YF0=;
        b=VAFDm0wgYF/Lw7Z3qxYn+jHKAY1fnb8vQepJj0PrWqvCrostyAsQgAv6bq31V+Uj/3
         QOC914NtqFxk0JXRkAEMhYWP3gcovIwE16xE6Jd0rH4fUi+GqzgGTZJres745QDFu92g
         PYZ1macOx2rCt1y5OQh29Tj/iR0lwdv7C/wvqBD0zqWYcsZfcvzjuxZd4zeaz6QRWL7n
         9PrNKaonByTI4P4FJmRkbGDWzM4+HcADFybPqa85e+WXUkL0tthDwsDFHDtQX+49o+yo
         zjwoLMFjzEyG5dsK5GWiS3BRAIk3K8EY/cHwHr2d4SJgIdq83C/qxB1k0ODpnR3UbykW
         TJ3A==
X-Gm-Message-State: AOJu0YwFfLmAABBlUL2bm6CRlYtsXmJR/JuMlfiKZgGa/BtdpsdHMxDK
	CaBtFWgJHzvEy/grkb1Fk6ELAvFOuALuh5LeufLjnz2CO7fUaNWeMrMGKOj9r3VBCm7zrGcrk1w
	zMqtp2E2gBdac2GPpIaEkBx3N9CJnGIMjls8Z4c9yDw736VhcZAoZz8X6yT9IQ7sfxw==
X-Received: by 2002:adf:f84f:0:b0:33b:3db:3294 with SMTP id d15-20020adff84f000000b0033b03db3294mr1476636wrq.50.1706713503591;
        Wed, 31 Jan 2024 07:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiEMQ2Zh8GFZ0BQbl0mBaaXavVXmKyCFeiV0pfbUDdisXRRMO8kGADX5c8KCHZQqWovdmg3A==
X-Received: by 2002:adf:f84f:0:b0:33b:3db:3294 with SMTP id d15-20020adff84f000000b0033b03db3294mr1476599wrq.50.1706713503142;
        Wed, 31 Jan 2024 07:05:03 -0800 (PST)
Received: from [10.32.64.237] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id en6-20020a056000420600b0033ae5b637d4sm11085195wrb.35.2024.01.31.07.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 07:05:02 -0800 (PST)
Message-ID: <cee2c0ed-661d-4948-8bc9-77c87c486c86@redhat.com>
Date: Wed, 31 Jan 2024 16:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
 <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
 <a0cdeb7c-dec8-4971-8b54-e6f65ea48ade@arm.com>
 <74333154-a99b-4bad-81f4-bee02ba05e91@redhat.com>
 <a34eee7e-3970-4cdd-8c09-bca51132db50@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <a34eee7e-3970-4cdd-8c09-bca51132db50@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_070508_495874_E52612D0 
X-CRM114-Status: GOOD (  18.49  )
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

On 31.01.24 16:02, Ryan Roberts wrote:
> On 31/01/2024 14:29, David Hildenbrand wrote:
>>>> Note that regarding NUMA effects, I mean when some memory access within the same
>>>> socket is faster/slower even with only a single node. On AMD EPYC that's
>>>> possible, depending on which core you are running and on which memory controller
>>>> the memory you want to access is located. If both are in different quadrants
>>>> IIUC, the access latency will be different.
>>>
>>> I've configured the NUMA to only bring the RAM and CPUs for a single socket
>>> online, so I shouldn't be seeing any of these effects. Anyway, I've been using
>>> the Altra as a secondary because its so much slower than the M2. Let me move
>>> over to it and see if everything looks more straightforward there.
>>
>> Better use a system where people will actually run Linux production workloads
>> on, even if it is slower :)
>>
>> [...]
>>
>>>>>
>>>>> I'll continue to mess around with it until the end of the day. But I'm not
>>>>> making any headway, then I'll change tack; I'll just measure the performance of
>>>>> my contpte changes using your fork/zap stuff as the baseline and post based on
>>>>> that.
>>>>
>>>> You should likely not focus on M2 results. Just pick a representative bare metal
>>>> machine where you get consistent, explainable results.
>>>>
>>>> Nothing in the code is fine-tuned for a particular architecture so far, only
>>>> order-0 handling is kept separate.
>>>>
>>>> BTW: I see the exact same speedups for dontneed that I see for munmap. For
>>>> example, for order-9, it goes from 0.023412s -> 0.009785, so -58%. So I'm
>>>> curious why you see a speedup for munmap but not for dontneed.
>>>
>>> Ugh... ok, coming up.
>>
>> Hopefully you were just staring at the wrong numbers (e.g., only with fork
>> patches). Because both (munmap/pte-dontneed) are using the exact same code path.
>>
> 
> Ahh... I'm doing pte-dontneed, which is the only option in your original
> benchmark - it does MADV_DONTNEED one page at a time. It looks like your new
> benchmark has an additional "dontneed" option that does it in one shot. Which
> option are you running? Assuming the latter, I think that explains it.

I temporarily removed that option and then re-added it. Guess you got a 
wrong snapshot of the benchmark :D

pte-dontneed not observing any change is great (no batching possible).

dontneed should hopefully/likely see a speedup.

Great!

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
