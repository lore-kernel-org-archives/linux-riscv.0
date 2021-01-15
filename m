Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A550EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 22:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAD2239D4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 22:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CAD2239D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OEISsS8+l82NhXDCjOz5Tto5uX/jx7Wi0gd5DWLLxAM=; b=W0RxMfj0ZFG4Ami80yyJLVI6F
	lJ6sl3ESCAWWDPhJrSECRcwCB5yb40mlGr/ltoxMPM6Isx9+CnHnS84B9L2jkpp1fJO9ZkXW27qAi
	pOpmQVvFkGpjXAUvkTm5e4/oM6uQS79X+X1gcFt4fBoJcMBC0uCB23rLMJ1WNUWM/c014K22PpwAe
	OwaUQqYp1NIGsNr+TnXKEd2PuYJH/2VIYS88saCjsqzsulRZpc8MfujyfhWmQ1el9S+SMky8G4hwg
	onO77ef3cjcCYNyFXncdUKHylnEQxjPssi9we+ItRxtEWxmb7YG3jjaUCybMTbxCxVQt1YsY47djG
	dr336mZhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0XpF-0001XW-13; Fri, 15 Jan 2021 22:44:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0XpB-0001We-T9
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 22:44:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id t6so5458768plq.1
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 14:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MSIZ4FzBHVOiuO+ldyqPYGJMXRPb1Z0V0cuiPqnS7aQ=;
 b=xJ84ZosWOiGFWRaL/hsA4Jxeu6oaQ3s1M+yO8sUqabiyHT3UOyWkAQ+0EV5Th1P3T+
 qqNj3gied2l3Hmz3lZcMhr6rTwNh2ZyVcm30BJDj4vv9NJWqR6vbMD7UnrZahcBJXVjj
 ukVopL/3OaFwXGwbasmvAa9Nm6tDAe+uvxZLX+arJ6uXAJ/O4lppYpfMvKhKBnM1idum
 /OMMu3A28+eM0slKK3Wr9bXrUD05SukGbBQy8ZprxrmrsHcjNSzZ6GX1PYe1aJu2Swt6
 fb3H8S0rPOnw7ipX5XEXvxqbAPk5G++RtSkSQq1dia6KXeSBLM4MNNC5aGC88Ktn8Q2h
 mk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MSIZ4FzBHVOiuO+ldyqPYGJMXRPb1Z0V0cuiPqnS7aQ=;
 b=U3R6CzVlJN6FSlFGMaSCpDTsDgV9+hmmvv7xbkYZJpWACbt3A+pcmbIbSTbycAmZ86
 1w2tIwuBQJVJCwaRV7dyHFvlOuNgD93cs+4PdfGZR6JQNWh7LRt5Ta+pHt/nXt6kPIMO
 5sHJHQwJsXNQ/5566opqyRu816WpK0Gq0bw0YyPEArK9KUYJjy4hWicnOyTehLVgzcb0
 b0/b3QD6C8Nfx377Vm1HZif4wnPJdvdoVROijnVQjxHN/hKDWi0aR2QlKgYnQDyI5lQi
 WsALXmt1VND2W+vgJALEP0B38fnHe73G3SFnR8//oPav9qvl9wjPMzH6S5FpxY3JvD0d
 w7ZA==
X-Gm-Message-State: AOAM531WD6EBYoi/sgaJZHPxA8a0aA9e+cD2g4UkVCtWodNR32Gm22kq
 3w87O9gq7jTdMrQsjrDray9uFgiAfnP0Og==
X-Google-Smtp-Source: ABdhPJxtyr5W8V+mBiNCHHgjIY68knC6OZfI4H8uZLxx+d5//NYQKAYWL80PeI7j5hbA+I6UTKxKuQ==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr13197995pjb.22.1610750647271; 
 Fri, 15 Jan 2021 14:44:07 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bk18sm5320450pjb.41.2021.01.15.14.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:44:06 -0800 (PST)
Date: Fri, 15 Jan 2021 14:44:06 -0800 (PST)
X-Google-Original-Date: Fri, 15 Jan 2021 14:42:17 PST (-0800)
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
In-Reply-To: <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-c5ceb653-6391-407e-acd9-bd5c43ca434a@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_174410_054007_BD487A3F 
X-CRM114-Status: GOOD (  42.75  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, ardb@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 atishp@atishpatra.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jan 2021 23:59:04 PST (-0800), geert@linux-m68k.org wrote:
> Hi Atish,
>
> On Thu, Jan 14, 2021 at 10:11 PM Atish Patra <atishp@atishpatra.org> wrote:
>> On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
>> > > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > >>
>> > >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
>> > >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
>> > >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
>> > >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
>> > >> >
>> > >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > >> > ---
>> > >> >  arch/riscv/include/asm/cache.h | 4 ++++
>> > >> >  1 file changed, 4 insertions(+)
>> > >> >
>> > >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
>> > >> > index 9b58b104559e..c9c669ea2fe6 100644
>> > >> > --- a/arch/riscv/include/asm/cache.h
>> > >> > +++ b/arch/riscv/include/asm/cache.h
>> > >> > @@ -7,7 +7,11 @@
>> > >> >  #ifndef _ASM_RISCV_CACHE_H
>> > >> >  #define _ASM_RISCV_CACHE_H
>> > >> >
>> > >> > +#ifdef CONFIG_64BIT
>> > >> >  #define L1_CACHE_SHIFT               6
>> > >> > +#else
>> > >> > +#define L1_CACHE_SHIFT               5
>> > >> > +#endif
>> > >> >
>> > >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
>> > >>
>> > >> Should we not instead just
>> > >>
>> > >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
>> > >>
>> > >> like a handful of architectures do?
>> > >>
>> > >
>> > > The generic code already defines it that way in include/linux/cache.h
>> > >
>> > >> The cache size is sort of fake here, as we don't have any non-coherent
>> > >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
>> > >> cache lines in RISC-V implementations as software may assume that for
>> > >> performance reasons.  Not really a strong reason, but I'd prefer to just make
>> > >> these match.
>> > >>
>> > >
>> > > If it is documented somewhere in the kernel, we should update that. I
>> > > think SMP_CACHE_BYTES being 64
>> > > actually degrades the performance as there will be a fragmented memory
>> > > blocks with 32 bit bytes gap wherever
>> > > SMP_CACHE_BYTES is used as an alignment requirement.
>> >
>> > I don't buy that: if you're trying to align to the cache size then the gaps are
>> > the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
>> > there's really no reason for these to be different between the base ISAs.
>> >
>>
>> Got your point. I noticed this when fixing the resource tree issue
>> where the SMP_CACHE_BYTES
>> alignment was not intentional but causing the issue. The real issue
>> was solved via another patch in this series though.
>>
>> Just to clarify, if the allocation function intends to allocate
>> consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
>> This will lead to a #ifdef macro in the code.
>>
>> > > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
>> > > without this patch.
>> > > I didn't see anything in Qemu though.
>> >
>> > Something like that is probably only going to show up on real hardware, QEMU
>> > doesn't really do anything with the cache line size.  That said, as there's
>> > nothing in our kernel now related to non-coherent memory there really should
>> > only be performance issue (at least until we have non-coherent systems).
>> >
>> > I'd bet that the change is just masking some other bug, either in the software
>> > or the hardware.  I'd prefer to root cause this rather than just working around
>> > it, as it'll probably come back later and in a more difficult way to find.
>> >
>>
>> Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
>> you were saying ?
>> We may need to change an alignment requirement to 32 for RV32 manually
>> at some place in code.
>
> My findings were in
> https://lore.kernel.org/linux-riscv/CAMuHMdWf6K-5y02+WJ6Khu1cD6P0n5x1wYQikrECkuNtAA1pgg@mail.gmail.com/
>
> Note that when the memblock.reserved list kept increasing, it kept on
> adding the same entry to the list.  But that was fixed by "[PATCH 1/4]
> RISC-V: Do not allocate memblock while iterating reserved memblocks".
>
> After that, only the (reproducible) "Unable to handle kernel paging
> request at virtual address 61636473" was left, always at the same place.
> No idea where the actual corruption happened.

Thanks.  Presumably I need an FPGA to run this?  That will make it tricky to 
find anything here on my end.

>
> Gr{oetje,eeting}s,
>
>                         Geert

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
