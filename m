Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEC1CAC582
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJs8CPEI/bPagChe1/lKg4xad8mC2OlNAQ+74VbL7I8=; b=yXievu3oKj+rFt
	hVAWz9BteGUZTJ5miYvMv3XN35d4IWWNxtrLBp1pzhdaGLYjLLbi9/sRCTmvO4REsv4T/pe94VGB1
	Vads22Qv9tG7NBhCrioTnhi+6PauxkrLYu08HnVoXVg1d7XwCcyOSFsxMgd3rp21d9AfE0O1DRjc2
	EX6Wsswdqi9QuG/2PydrdKWE9uzHsYREJ1D6M01Wb+1O8cS+h4sliAOrzNzIf2o9pBScboFrjrxjh
	eVD0vA0xtmJYSkNg1bS2TRHjHCHm0BA2Iju5nKW3H77NR01VOjigFRSvAA5TS+kCSIzErl61bG19h
	F0/MWdkMw/CgQ2R7rjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3tV-00000009a8l-1670;
	Fri, 12 Sep 2025 13:32:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3tS-00000009a7S-0vrg
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 13:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757683968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d3WySasVKe/ME+w6oNrrZ2gd9OipXbQaPkCZGsmbrHU=;
	b=I5gR+3MHYpI2ZLnWkoa+8Yfwz4pqse3fgAH82lrz9ZENAI7ADcujH4bQWiW+H9EFjnQY8B
	55RQiKXzJkM6Ii6o6LKM02HAN0GE5q4t/ngs7bD/BJaw81pumUC7LzLkaU5K1iMEQm8+BJ
	/sK3vTmthYvPpokB7jMsm0Q0lFhxwxs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-KqvAzWHiNVqNY4ZPbTLwQg-1; Fri, 12 Sep 2025 09:32:46 -0400
X-MC-Unique: KqvAzWHiNVqNY4ZPbTLwQg-1
X-Mimecast-MFC-AGG-ID: KqvAzWHiNVqNY4ZPbTLwQg_1757683965
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3df2f4aedd1so1383939f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757683965; x=1758288765;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3WySasVKe/ME+w6oNrrZ2gd9OipXbQaPkCZGsmbrHU=;
        b=g/M4bOq5AIiN9ZPb545ZWygWwP/cr+ix+3nOGYX8EFdua50RHKbHvLC2XNQ9l6XWHz
         bSLd9emLizLzVoArbpK2AcIx0a2+MPNlbzPuUwEPjSSvnwXegVTJ2APMGWoL6ViU4MKY
         Obij+8yFhS/srRGoXS68wHlhUJw8xc1XNVZsR6ISe4p+Sx1BoDUhPWDZne8GxngEhJir
         WRMhX+k3YS++dHQLTP0LKjzIOFe12CFpDK1AZkgfLsAmXoCfYEbEzfIg7TULLjyDGasN
         lla8RY8Ij43FbVyVrVIPTR9QgN0QnL2mz+3aB/MVBlDLtalscCCdiPDP9RkUyL2IuUkl
         zGzA==
X-Forwarded-Encrypted: i=1; AJvYcCU4EnHrPY5P78f+kAJ5dx8pNjGrvXIoX3KyfmgbSZXA6OmY1j864mFhP6rzsTBTyBHBNa0JB4UcvhkS8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkovvBzoDlGRt8fFqKqoUQ5ydC2ZRmF0zrjkF7HvxReyibT2F9
	3f8YGR27oujXZYkkDWtsdBBWy26CwRSu7qt0uygCPQ27wx+3YhCGbX2rcv35KGvxRKBnMOA2s7r
	4wM4ykKfi+6/sErdZB+NGXK06xWGyn9I4IkIP9/mGCUj935AQNfBWDxYVdp2Ec4b5VHxRAw==
X-Gm-Gg: ASbGncvmK+eWFx0frbHX/A/VyKK7cBy5yVf1Dd3AXJ9SRgmXLf86P2DHz7kkx1pnCmn
	Tm0mJmPAg5IjqS2bN4a4KWb8wtmMvCC1MvvxmU2cGrGue3OvC64Bcuriakyn/uk/9oX74uSEjSF
	8yFemYCvQICHishZtHpdnrfzsbLLFt33U+proN+iRwOUVVkigAWsdnZwD56Wf+bexU2fHwg5sMq
	52T0GPPIPyFAMIht7I6l0IfzFq3nXhX83AQS+4ZUtIH7YbP0MLSxl64iGSJc86Opy/tqWWyq6Mc
	O1qsxhZkWdg/5ikIlgxPVGtcGryHkLbk8j2gV0Qi/v+bN4fLvdbsRB+PCwEykRJfukqlNS4FDbI
	xP21z+2MlncRxThZxAg82Ib9scrDYghZxmymVclB3UfrzrV6iC2yMd8SUXmoIeUfyHlE=
X-Received: by 2002:a05:6000:2584:b0:3d2:208c:45aa with SMTP id ffacd0b85a97d-3e7659eb4damr2923116f8f.29.1757683965354;
        Fri, 12 Sep 2025 06:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQvIA7aWaWPgRmM3ibF4CzK7cagNHsOvK16zCwCwknz8tuIMHPgwLUmt6YVpOJeww1hCUbMg==
X-Received: by 2002:a05:6000:2584:b0:3d2:208c:45aa with SMTP id ffacd0b85a97d-3e7659eb4damr2923086f8f.29.1757683964875;
        Fri, 12 Sep 2025 06:32:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786ceasm6793014f8f.16.2025.09.12.06.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 06:32:44 -0700 (PDT)
Message-ID: <b2334e92-9d04-4d27-aac1-fec91d5ee464@redhat.com>
Date: Fri, 12 Sep 2025 15:32:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] mm: softdirty: Add pgtable_soft_dirty_supported()
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>,
 Ved Shanbhogue <ved@rivosinc.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>
References: <20250911095602.1130290-1-zhangchunyan@iscas.ac.cn>
 <20250911095602.1130290-2-zhangchunyan@iscas.ac.cn>
 <9bcaf3ec-c0a1-4ca5-87aa-f84e297d1e42@redhat.com>
 <CAAfSe-sAru+FuhVWRa+i5_sj6m4318pLFrgP0Gsd0DVWzjE-hg@mail.gmail.com>
 <04d2d781-fd5e-4778-b042-d4dbeb8c5d49@redhat.com>
 <CAAfSe-tQgmBm=RS2gCi7VaRW1XZhS_sJ9rHbvqJ0w=KwTf+m3g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <CAAfSe-tQgmBm=RS2gCi7VaRW1XZhS_sJ9rHbvqJ0w=KwTf+m3g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -QgZUZjyMrXOtSEMJyulv8K4PYLp8b37xcwNbvlbSnc_1757683965
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_063250_339614_45472515 
X-CRM114-Status: GOOD (  17.83  )
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

On 12.09.25 11:21, Chunyan Zhang wrote:
> On Fri, 12 Sept 2025 at 16:41, David Hildenbrand <david@redhat.com> wrote:
>>
>> [...]
>>
>>>>> +/*
>>>>> + * We should remove the VM_SOFTDIRTY flag if the soft-dirty bit is
>>>>> + * unavailable on which the kernel is running, even if the architecture
>>>>> + * provides the resource and soft-dirty is compiled in.
>>>>> + */
>>>>> +#ifdef CONFIG_MEM_SOFT_DIRTY
>>>>> +     if (!pgtable_soft_dirty_supported())
>>>>> +             mnemonics[ilog2(VM_SOFTDIRTY)][0] = 0;
>>>>> +#endif
>>>>
>>>> You can now drop the ifdef.
>>>
>>> Ok, you mean define VM_SOFTDIRTY 0x08000000 no matter if
>>> MEM_SOFT_DIRTY is compiled in, right?
>>>
>>> Then I need memcpy() to set mnemonics[ilog2(VM_SOFTDIRTY)] here.
>>
>> The whole hunk will not be required when we make sure VM_SOFTDIRTY never
>> gets set, correct?
> 
> Oh no, this hunk code does not set vmflag.
> The mnemonics[ilog2(VM_SOFTDIRTY)] is for show_smap_vma_flags(),
> something like below:
> # cat /proc/1/smaps
> 5555605c7000-555560680000 r-xp 00000000 fe:00 19
>    /bin/busybox
> ...
> VmFlags: rd ex mr mw me sd
> 
> 'sd' is for soft-dirty
> 
> I think this is still needed, right?

If nobody sets VM_SOFTDIRTY in vma->vm_flags, then we will never print it.

So you can just leave the "#ifdef CONFIG_MEM_SOFT_DIRTY" as is to handle 
the VM_SOFTDIRTY=0 case.

So you should not have to change anything in show_smap_vma_flags().

[...]

>>>> That should be handled with the above never-set-VM_SOFTDIRTY.
>>>
>>> We don't need to check if (!pgtable_soft_dirty_supported()) if I
>>> understand correctly.
>> Hm, let me think about that. No, I think this has to stay as the comment
>> says, so this case here is special.
> 
> I will cook a new version and then we can discuss further based on the
> new patch.


Sounds good!


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
