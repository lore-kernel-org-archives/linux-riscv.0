Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10510D10F51
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3djzH3RjcnNL5LjY5bKCVOnTtyUbwsLAIO9L36hs4S0=; b=R9lsENN34FnG8B
	bXAVttYBI3Bv6CEiiC9aLEwzLL63UAOtP6xE951fuAQGq32w9kvoDFAA0HVdIG1fBSjVVYSKaH0IY
	UIbCF2S6ZHapPxWWslqKymcvCteqo1bd/uJvwAaZymQD10n419P2dC5lt+idJy/kgZ+Ji8S8ysrcj
	custnYjl0QebJM/WgwL3XH2kvTBPJ7lwT2U3jbUtSVZpsAheYD8mOoI07gk10BhdaQLPtZJdQXJIs
	vDPh+73t6XsyQpZ758o1pO8IyFXJR6SPDfoFOBy2EhgMjk2AkGS+3QnxjPWQpCy4dql+Ja0Bf2Gwr
	vX5WwAUyDuL7kQ/pRBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFrp-0000000F3YV-329S;
	Wed, 26 Nov 2025 13:47:33 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOFrm-0000000F3Y7-0Bj0
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 13:47:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64149f78c0dso10310829a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764164847; x=1764769647; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOcN8utXBvCmBV1D6iZJFhosr0VxKSdczfYTYogMAeI=;
        b=nFWABg1cag1lrOXq79x0n5OBOB1ROpzhLTuuwdwDPYBsre1AOpALpKF+to+/yZP6GI
         9xjqLKdedc4TpEOz51IyI8k/5okfAK9vg7i7Ml6MWp4K/halGpNzg/wiwDVz8s3JxQnR
         w9EUaaENyhVAmPe/1uJs9k1j075VqKuGD4gqirrQXV7/KvlJuxubuVWM0V9gQKjhDZo8
         9hV+rwjQK/1y6/vX0Ir3qTBqFbcDfTcIOc+BYQHlkwMxykZbS1yZ71kFR7GD/dc4G2Bz
         uYAgmhnHHIfhHuWMzdUhcuwT/oAwztiPySNLNYt05ioQBkTJ/l0NGEdn3/g0muNIsjNQ
         +EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164847; x=1764769647;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOcN8utXBvCmBV1D6iZJFhosr0VxKSdczfYTYogMAeI=;
        b=GKrCHjx1AA1OCTFIGwVxPGU7GZ/Q07iA5+XPijBV8mKhtR6gI5LghBE3iJKs0M64RM
         LrQ+bA0RkQwbDNttccU+6dUFoQMcCRPufjCLYHJ6U8rWtGZ6MNfYEPLyvDHRtwcOroWV
         GRvrqi7o17tjes6mcE2FccmxSBsQOu47oD0xiGHy8nFmT0LbDU+Bho/gtIwBG3racT32
         nVt6kvRerQJBbKQXrBYzRMuTuKjUjfd6fEaXFLFgIBW/DmiH8mZA//knxh+Px8CMnMIf
         wzb8VUz7lmxi816Ys7oTinEKa9UEyKA58t84mNsF7UN3PHlTJeNZoCuimzpgbd1lK4cv
         +MlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFowj0sIb2NY5DHURxpgHGz9NlttCbNT1QG7D5mo0G4aNrXGUz0HuG4cmwgiLP49CORzeWFeaT3GEQvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtYN9ACZusc9Lp0MmSIqk/ciGUNyS+3S1GhqN5Uqzwj+hrgrvQ
	kdZb9FYh+dhPfuwwV3UEVkQWh4bFmpBWeLSU7Ryo31P/ZAR5P4YNxm5X
X-Gm-Gg: ASbGnctwmhlS0Q2yT/8CC/tU07/DU1xTT2TJidjuGkJYyJeF5HdVU31ovLr+z6PtGix
	OKBRbI5J4QgFJFdCSR6vRSrZ6to/8sJwHlLomMWmupAeHGgximCbJsq5T2j6XuZna3yRszWftbK
	hIKlce99uku8+ahxybCVmttu4/0+0b8pEg4HocDK8eI+FPz6kF+SQsSpHegMx71qltZrj8MxwDv
	1iBV10h0GRVW7mpFT4JrNsVkPLPjMdGaclVuk0ezkdRWAmaDDe0vwj4Z4t1tAUvwb0ou+fq4LD0
	rtt2TH78OZY+OIqEV15xPbFzDxLpbVv6nU2GNXLhxatXx0kNXOB42tdiEF+/EXmS4S31wO7orvb
	UGHyzN3BllCq6P3EuAIOQpyKMnXZw7qNNHFmuOvry2gO1BqQXq7HVEK6bL89eLLcQ38Dturrrq2
	hOHlOJo3klKA==
X-Google-Smtp-Source: AGHT+IEHPtR4zyLqNCyvJKPqlt3PqTSeJMo8/BMvDE8703ct4FKH+8I7ByzjstUJPqKt7PJP3sWJCg==
X-Received: by 2002:a05:6402:50d2:b0:641:3189:a183 with SMTP id 4fb4d7f45d1cf-64555b99be9mr17506130a12.14.1764164847223;
        Wed, 26 Nov 2025 05:47:27 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363c56a4sm17704368a12.15.2025.11.26.05.47.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Nov 2025 05:47:26 -0800 (PST)
Date: Wed, 26 Nov 2025 13:47:26 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	devicetree@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 06/22] mm: Always use page table accessor functions
Message-ID: <20251126134726.yrya5xxayfcde3kl@master>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
 <20251113014656.2605447-7-samuel.holland@sifive.com>
 <02e3b3bd-ae6a-4db4-b4a1-8cbc1bc0a1c8@arm.com>
 <bc88d132-452a-42a1-9ee5-5407334d8aac@kernel.org>
 <df7d10ba-bb42-4ea1-8c5b-5db88a18eccb@kernel.org>
 <6bdf2b89-7768-4b90-b5e7-ff174196ea7b@lucifer.local>
 <71123d7a-641b-41df-b959-88e6c2a3a441@kernel.org>
 <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0818f5b-b8a1-4730-aa1d-df0f547a3d47@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_054730_152423_86A2AA9C 
X-CRM114-Status: GOOD (  21.17  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 26, 2025 at 01:03:42PM +0000, Ryan Roberts wrote:
>On 26/11/2025 12:35, David Hildenbrand (Red Hat) wrote:
[...]
>>>>>> Hi,
>>>>>>
>>>>>> I've just come across this patch and wanted to mention that we could also
>>>>>> benefit from this improved absraction for some features we are looking at for
>>>>>> arm64. As you mention, Anshuman had a go but hit some roadblocks.
>>>>>>
>>>>>> The main issue is that the compiler was unable to optimize away the
>>>>>> READ_ONCE()s
>>>>>> for the case where certain levels of the pgtable are folded. But it can
>>>>>> optimize
>>>>>> the plain C dereferences. There were complaints the the generated code for arm
>>>>>> (32) and powerpc was significantly impacted due to having many more
>>>>>> (redundant)
>>>>>> loads.
>>>>>>
>>>>>
>>>>> We do have mm_pmd_folded()/p4d_folded() etc, could that help to sort
>>>>> this out internally?
>>>>>
>>>>
>>>> Just stumbled over the reply from Christope:
>>>>
>>>> https://lkml.kernel.org/r/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org
>>>>
>>>> And wonder if we could handle that somehow directly in the pgdp_get() etc.
>
>I certainly don't like the suggestion of doing the is_folded() test outside the
>helper, but if we can push that logic down into pXdp_get() that would be pretty
>neat. Anshuman and I did briefly play with the idea of doing a C dereference if
>the level is folded and a READ_ONCE() otherwise, all inside each pXdp_get()
>helper. Although we never proved it to be correct. I struggle with the model for
>folding. Do you want to optimize out all-but-the-highest level's access or
>all-but-the-lowest level's access? Makes my head hurt...
>
>

You mean sth like:

static inline pmd_t pmdp_get(pmd_t *pmdp)
{
#ifdef __PAGETABLE_PMD_FOLDED
	return *pmdp;
#else
	return READ_ONCE(*pmdp);
#endif
}

>>>
>>> I find that kind of gross to be honest. Isn't the whole point of folding that we
>>> don't have to think about it...
>
>Agreed, but if we can put it inside the default helper implementation, that
>solves it, I think? An arch has to be careful if they are overriding the
>defaults, but it's still well contained.
>
>> 
>> If we could adjust generic pgdp_get() and friends to not do a READ_ONCE() once
>> folded we might not have to think about that in the callers.
>> 
>> Just an idea, though, not sure if that would fly the way I envision it.
>
>

-- 
Wei Yang
Help you, Help me

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
