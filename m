Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DEC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiiLgXRX3yNx2zDFX6lwaIfWYFgfGz9CfZko3gAcRnc=; b=qy6AVRKTtH7hmT
	wrny2fpjpSCG/Hcmy6P6UwFXGb7wyAm9nVt5R4qcegeHhNoBL3kTKdVaYLpkU13mXQK0z2YIaCsmp
	XfYzaRAXK1boHYjCJz8bsRTDZ+Zkx4W8nVXYZJ2S52ya6EKYwfzZgosUNPvdzSo95Fjs0LiiRik9V
	zyLIgju4YLp7+59KRKDAvSgyGRkdVhBIDJMeuRxg5HZTWv7N8O8nepXO2z016RsUs8sc+KO8+Apqf
	c489q8ZOYONeTyYwxDNhHH86HAF3XykaFzIqrwOsr2FBm4GpTN59Dg412VCc+0YiOy6FO15fPAFYY
	mEeS2n0EAWYvDWLyN8OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2KV-00Dh81-Hu; Tue, 28 Feb 2023 15:55:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2KS-00Dh5V-F6
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xBghEncF8boHA8ERPg4saQyYB+zKBnxfff7p7OTCduA=;
	b=BNjjPB2dZvKhbiImD/+DnoZeWXleedN/vFDEYvTrr+o4gMYCf+OkNlmx7IzBN9Yy+lqb0z
	in0Yq0NxPJHLBMpZliuVTtJJaC9M3611P5dKFopDjrlKNCI1myqf64SRQkOkSF9S7P4uXR
	ftjkol/HTHt/0ZaojciVyvb8CHiYXm8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-49-V5I1un22OIm1pVesUO8FKQ-1; Tue, 28 Feb 2023 10:55:44 -0500
X-MC-Unique: V5I1un22OIm1pVesUO8FKQ-1
Received: by mail-wm1-f70.google.com with SMTP id bi27-20020a05600c3d9b00b003e9d0925341so3764268wmb.8
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBghEncF8boHA8ERPg4saQyYB+zKBnxfff7p7OTCduA=;
        b=WNIaT3BS4GypEAzDleeHrmg7WDwoPcJplde+WA8sl0IkaVda7rvnU3OB3Lo9LnJURL
         tbNXtEbg15TigrqHSo8TacqRTZkN9PwUE4le7dnuyiCOMDPnRyvedpSVgP+2u7kc7E45
         zzVmPwjiRsKogPITT9yfnLn18tt5R4+JdSzBkndMrwE/GfJ96ruynNDT8fcuabbdCjpr
         uJ9a4puZ+a9Tk+r2KChINESFbeXv7MfZgHXlnMt0+WMb/PUwrO7fK0buNs54KZytZEWD
         G2zmJjeRS69cYgfV4Kwb6yTs1EfOwGDa5eXV9JjwPY+YzK/yaobjrMjvIFIkyjvHhXJy
         u4MQ==
X-Gm-Message-State: AO0yUKWQwW/BWmbaqjO0Q23uIsa1i8LLoA2KFKwhnge39lBVErrAR3Qi
	rbdrtx6n8A3HibzzNrDyo20giRxMdJTflwWMTJ5wWO+Lq85llcr2RVL4tbOxblKcD/Re94J9JPu
	8firzMoUi0lk1cG/bxdwIMjl5JseG
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id h15-20020a05600c350f00b003eb3945d400mr2593183wmq.6.1677599743561;
        Tue, 28 Feb 2023 07:55:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+wnf2WDMcprxngEfzcv3vYTz2vjDLBbvltb+8+t+ERFjJxQhjmdzxRvt+YBcvxcSrV4CC0jA==
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id h15-20020a05600c350f00b003eb3945d400mr2593150wmq.6.1677599743200;
        Tue, 28 Feb 2023 07:55:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id o25-20020a05600c511900b003dfe549da4fsm18407191wms.18.2023.02.28.07.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:55:42 -0800 (PST)
Message-ID: <5d99c731-c47a-c525-76e5-4578d9dfc9ee@redhat.com>
Date: Tue, 28 Feb 2023 16:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Yang Shi <shy828301@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Nadav Amit <namit@vmware.com>, Andrea Arcangeli <aarcange@redhat.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
 <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
 <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
 <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
 <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMuHMdX7MND++KXgTpx4jscfctQA_-zPt3EN9-+79EWE7e+OjA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_075548_655274_FAA6AAA7 
X-CRM114-Status: GOOD (  17.98  )
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

On 27.02.23 20:46, Geert Uytterhoeven wrote:
> Hi David,
> 
> On Mon, Feb 27, 2023 at 6:01 PM David Hildenbrand <david@redhat.com> wrote:
>>>>>>     /*
>>>>>>      * Externally used page protection values.
>>>>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>>>>>> index 42f5988e998b..7e3de54bf426 100644
>>>>>> --- a/arch/microblaze/include/asm/pgtable.h
>>>>>> +++ b/arch/microblaze/include/asm/pgtable.h
> 
>>>>>>      * - All other bits of the PTE are loaded into TLBLO without
>>>>>>      *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>>>>>      * software PTE bits.  We actually use bits 21, 24, 25, and
>>>>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>>>     #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>>>>>     #define _PMD_PRESENT   PAGE_MASK
>>>>>>
>>>>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>>>>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
>>>>>
>>>>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
>>>>> wrong?
>>>>
>>>> In the example, I use MSB-0 bit numbering (which I determined to be
>>>> correct in microblaze context eventually, but I got confused a couple a
>>>> times because it's very inconsistent). That should be MSB-0 bit 24.
>>>
>>> Thanks, TIL microblaze uses IBM bit numbering...
>>
>> I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?
> 
> Correct, as seen in s370 and PowerPC manuals...

Good, I have some solid s390x background, but thinking about the term 
"IBM PC" made me double-check that we're talking about the same thing ;)

> 
>> I recall that I used the comment above "/* Definitions for MicroBlaze.
>> */" as an orientation.
>>
>> 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
>> RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G
> 
> Indeed, that's where I noticed the "unconventional" numbering...
> 
>> So ... either we adjust both or we leave it as is. (again, depends on
>> what the right thing to to is -- which I don't know :) )
> 
> It depends whether you want to match the hardware documentation,
> or the Linux BIT() macro and friends...

The hardware documentation, so we should be good.

Thanks!

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
