Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9607AC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pULecaxGsved8kVuG+4C3aVdIvBI9HoCjSYpekN5FVc=; b=iTzhqNv4VHSg0z
	JW0MVrQdh3LZoruq50+wSlNlN+wqTeqD0Sy2m1IFyfYsJ9lAhZIfaiy7lOHXkqtD2SAQKe8iUaAVP
	oUxlKV00SqrGkYQIfcaqpVECMmT6b6Z4N+9d+IrIbfReAKCZ3jODYLzufhk4GaRmoKgo6mNF/rHWK
	uHYaX/lmhFn21yuqhSdqsK7RzFhs/eB1UNUKp+2uMi2v7dBD8lD49F3fGPv1ihkKWEE2vV3YoNkHK
	1UGsV49FLNmSLlPKUO446+hW1mMlrc4OU89aurxYjUpq2hL8ScLg8Px/ITIVdsdJhRKbC1ZfdV4Vh
	bb7fwCF6HDIdVTGAUmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgsC-00AQdw-O2; Mon, 27 Feb 2023 17:01:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWgs7-00AQbu-3J
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 17:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677517265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+gj+IVlpRNML/WhRdwS5WpJ1kIzGGA+IXuZi3TvglQ=;
	b=hZbv/DyXN+dDQWBq8tkLFX2xUPVqinzFEYtmZbopWmpiFpKpMGGQpD5RtkVhMWBdYaO/sJ
	4RyEeL2oNkcTIj5EZsLcpRg//Wf7p9ZW6a17i6lSoYqta4DdZZMY+1EGZ3EVfAj19mjopB
	KEBG0zd9kNTOvzGczzohPY/iLYINCcI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-259-Jf_SfLsGPcuO3t37CgqGiQ-1; Mon, 27 Feb 2023 12:01:04 -0500
X-MC-Unique: Jf_SfLsGPcuO3t37CgqGiQ-1
Received: by mail-wm1-f70.google.com with SMTP id t1-20020a7bc3c1000000b003dfe223de49so5597779wmj.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 09:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+gj+IVlpRNML/WhRdwS5WpJ1kIzGGA+IXuZi3TvglQ=;
        b=zYivlR2/8srf8shVacrDUuYc5XsCVzE/rWmxUmZEuJMC/vbG5Y5jttURGprCJ0V7PX
         sAFPFww3b5C9APih7SFD2K/Epst+C2M7eCvYvuo/YxEmakDePcPl1WJKPNfL7fV3LERB
         cBGAaRBstNkJTvk4xdVWYQ0KkLhQYs7Gjf/P6HvDaMqkYiWmOC4ar1mbWibz8SEJKuzQ
         uxkBV1oEy1F8Zu6WG0oUXeOwvQBr2dPAJF8evAeT4vsaBtUyneIM/nEFGmK+BVffL+Qu
         tllhuyWrIHbJlgzXRRQlgfLb4+WLcP/+xLim5dMXqfAa94Znj9jpPdYtMWEDjkv3Mepl
         Azhw==
X-Gm-Message-State: AO0yUKXRvnVAlQ+rMrK4qymIudeKsWBGSxzXYmcSVk4WwGte0bs75V5x
	IKuddjkk9nIjoTJyBbIkINRjoFJJDnP/hFw67mhqbNWrgMBPZmzbcmZfK6TkIcaCB6rzVFmXMsf
	HbFL44V+uW/dL+yA3DrgEP6lmTfqp
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id a14-20020a5d570e000000b002bfd94029b6mr22317889wrv.54.1677517263063;
        Mon, 27 Feb 2023 09:01:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/UUjV2lk6TzBDGO2RyIGoSkW6MncSJyiWPHsxHHIhpKbsx37PxyO7HkStEnBG5FTknvHrGmg==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id a14-20020a5d570e000000b002bfd94029b6mr22317842wrv.54.1677517262720;
        Mon, 27 Feb 2023 09:01:02 -0800 (PST)
Received: from [192.168.3.108] (p5b0c68fb.dip0.t-ipconnect.de. [91.12.104.251])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db0ad636d1sm15217382wms.28.2023.02.27.09.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 09:01:02 -0800 (PST)
Message-ID: <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
Date: Mon, 27 Feb 2023 18:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_090109_626597_A4DC7F97 
X-CRM114-Status: GOOD (  20.49  )
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

>>>>    /*
>>>>     * Externally used page protection values.
>>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>>>> index 42f5988e998b..7e3de54bf426 100644
>>>> --- a/arch/microblaze/include/asm/pgtable.h
>>>> +++ b/arch/microblaze/include/asm/pgtable.h
>>>> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>     * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
>>>>     * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
>>>>     * zone.
>>>> - * - PRESENT *must* be in the bottom two bits because swap cache
>>>> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
>>>> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
>>>> - * is cleared in the TLB miss handler before the TLB entry is loaded.
>>>> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
>>>> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
>>>> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
>>>> + * before the TLB entry is loaded.
>>>
>>> So the PowerPC 4xx comment is still here?
>>
>> I only dropped the comment above __swp_type(). I guess you mean that we
>> could also drop the "Because 4xx doesn't support SMP anyway, M is
>> irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not
> 
> Yes, that's what I meant.
> 
>> sure about the "Bit 30 is cleared in the TLB miss handler" comment, if
>> that can similarly be dropped.
> 
> No idea, didn't check. But if it was copied from PPC, chances are
> high it's no longer true....

I'll have a look.

> 
>>>>     * - All other bits of the PTE are loaded into TLBLO without
>>>>     *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>>>     * software PTE bits.  We actually use bits 21, 24, 25, and
>>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>    #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>>>    #define _PMD_PRESENT   PAGE_MASK
>>>>
>>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
>>>
>>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
>>> wrong?
>>
>> In the example, I use MSB-0 bit numbering (which I determined to be
>> correct in microblaze context eventually, but I got confused a couple a
>> times because it's very inconsistent). That should be MSB-0 bit 24.
> 
> Thanks, TIL microblaze uses IBM bit numbering...

I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?


I recall that I used the comment above "/* Definitions for MicroBlaze. 
*/" as an orientation.

0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G


So ... either we adjust both or we leave it as is. (again, depends on 
what the right thing to to is -- which I don't know :) )

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
