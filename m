Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33EE77198
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpX4A480ZwcYTT5RtY9B+FkFqOSqz4ybgeAF+ogO8fw=; b=Aw49Pkc5bppT52
	iqNBQOZG50NU5HfhaBrle8k7y1j46gozAQCQJ+kvt11Oy4xs9x51b1Mciq72c/eo2neKB1+slwZU8
	2Bi25z4xsJcBQ0X3XZX5C4Qjla9S+ZsF24t4S3hHA6UV0eg+v9qvK2oH/YxvZ1miretlKG6bt4r4D
	4QDeCXWPav8UTZ6sKSOQivKOMOd5AC4pfya6rltFiSLdaxHPrQbUIazoSPC4eDYa77POoK++mNr1B
	0/XQ9XNrblf1sShbbzznuXqh1CRJLelcDmXkEqYkH8sNsHpE8mpUq5UrN4M79u76FFz9SRfEZx3KJ
	j4yp40dwoQLkrBRbujwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnHM-00000001Pzv-06Fx;
	Mon, 06 Jan 2025 13:36:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnG9-00000001PiN-1DGO
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 13:35:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21636268e43so22626335ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736170508; x=1736775308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=DbiWHcLFu7mfIIUeiVlA4yR/TdcYuRsQuz9jrGap7NAlptEzyQ5uxUQVxstlGSJ6N2
         YXEeSFhOLjxTzCnIZpv5bxEooFaiPQhcGAiorCDNJmGrk9kIkzKKefdGj+NyJnZqj//p
         EidtfFGyXkhrtzG0c04I23fayfoTLqvHOwWlt4emkiyn/Fsi+aji1SUTxBiIy19eXDGP
         2Q555qAXuQJN6fZj77/hSxgpPOK4h5zMK168D1XnoZ5OFxjdLBcMnUpRvuh5BHSi8yYR
         taTDuOIPGU0rtbqzDKrREnXLEbNT6Sw/1/LbTdvY2kn255NioCT9Z/WEdfZS2SD23kZd
         G2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170508; x=1736775308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSl9CiTNSQwE0RKlCdBtogvBaV/TE9/iFGVUzDM7I3Y=;
        b=M0miLNskkJgssQdmc3A5WiO/deZ9nl+Xg65vO+lD4j6NDO7U+qsmfYYtcO7Gj9NJwK
         PKlH7eve9q6pjYDjt/yuK+D84qQraMwVQrsUejdqOYZvkKZkHSdkNdN0yt9IOd0a5G96
         IyjJVDXpeTQFMFz6WK/EeC3dLjFKMq6XnOrnn4ZVBYSHW/ZYTf6uBwZ6NSXjksF1pZjj
         WCkoEAo8R4BnltF5hyk5HVKQhMfCYKoLCiyq8hHHZiwsSIhxcXYEvU9TagvkrkrZT7Gu
         HrZyG6K+Fqlgm+dZgyxByA+GPphLL4O5t8wFoTomBCwb74K/7Hfo35N1eQ4wLxxCuQBp
         CDIg==
X-Forwarded-Encrypted: i=1; AJvYcCU0YpEDo8heyqXiBt3CIGibT0yLglb/v32L+VX3reI+JmvzC3zQjKzumU5WPskB/XJi7LVo0YSpruAkCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyReEMt31qS8H/hjNjSP0LUvRMLYDozxVPVmlLItkdKd6R3jE7t
	ptBu15WmQID5LIm7QpIUp7Y6ZCFaZy0lxjkW5KSSsVswqOIaHW2i/m6Ng8dVbho=
X-Gm-Gg: ASbGnctC4JzzvKHREuhSaORmrRf5jCDWhGNSXdbpmdQFfZDT7wEDEumEhyNxRuwJexY
	RsXgfA8z9cHXRPJ8xuS1XvPfBg2Edne65DlfQnSJgHvrfWTqmBnDtxIp6fJqr13vmYyvF4wEgt6
	pvuX2wEjoVOfxroKbaWH42xtNuAeYTP4zcy8LGsbEDbKUD22/f4WMTxcAgsnxK5xUpF1+IWB5gf
	gqTbTEQbrXBzqT66yGM5iaslWpvS6HP1A0La6pOfls/P/u9hX+MQgR7hB2Qo/0SmwKVkJhCqpPa
	qABtLNrmx3wZ7xQKlI6xIEiEt4i0WJDBiGqt8tQWZ06ZXiKNlvYH
X-Google-Smtp-Source: AGHT+IFuxfmftFbdw6fO4bIMnZYJ/q+si7Sq93AxF4PGQarIeYtLJTB7gRBGy3tWc8bUzZwj1LueBQ==
X-Received: by 2002:a17:902:e844:b0:216:3083:d03d with SMTP id d9443c01a7336-219e6f13c50mr852868805ad.44.1736170508636;
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdf02sm292469725ad.151.2025.01.06.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:35:08 -0800 (PST)
Message-ID: <57ea8193-2fd9-41a9-85b4-7af924f900f4@bytedance.com>
Date: Mon, 6 Jan 2025 21:34:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
 <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vQHplZqtHf6Td8@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_053509_349428_90C7F59C 
X-CRM114-Status: GOOD (  13.11  )
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



On 2025/1/6 20:44, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 07:02:17PM +0800, Qi Zheng wrote:
>>> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>>>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>>>> PMD|PUD|P4D to __tlb_remove_table().
>>>
>>> The above and Subject are still incorrect: pagetable_dtor() is
>>> called from pagetable_dtor_free(), not from __tlb_remove_table().
>>
>> Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
>> pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
> 
> Right. But you Subject and description claim "... also move the
> pagetable_dtor()" not to pagetable_dtor_free() - which is another
> function.

OK, will change the subject and description to:

s390: pgtable: also move pagetable_dtor() of PxD to pagetable_dtor_free()

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to pagetable_dtor_free().

But pagetable_dtor_free() is newly introduced in this patch, should it
be changed to 'move ... to pagetable_pte_dtor_free()'? But this seems
strange. :(

> 
>> And the main purpose of this patch is also to move pagetable_dtor()
>> to __tlb_remove_table(). So I think this description makes sense?
> 
> The patch makes sense, but the description it is incorrect ;)
> 
> Thanks!

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
