Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DED3C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:24:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A7042310F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A7042310F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=090SKSyRX23YIBdJZ3OktQ1Liq5bU4f9jPOcTuiFagU=; b=qQ3iYb/Q/xM/2lGmjMZULSPWb
	3b+f+0lahGWtFk9EiUNhG7461fEs7yKuPeNf3KVRmMMBYU0g7HS6nSef38xlFFvsIyCHbihvegw3u
	Vyx5TxLncs3rtRa8TLAYMtm6J8k14Jpes+G7pGIsnrMo1SGz9z9XeBvBBhOMlPFvVZor5XDNtksQA
	jmW+/OeJp7vXQR0uFwbczTLT8wtT8STaZDPaDDf327VWlfyu47sN9diMhcEW3EJGjyGam9HhRXfxs
	KoUHshTAg5xi8AiDIYuhLxnuQLfPBQ3WBQcpnaB1gxASiGqtlEbcbuYW6SbM+Qd7JrZQmhfGx/JRw
	f+FCezSZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0A6U-0005yN-UV; Thu, 14 Jan 2021 21:24:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0A6P-0005wv-Q6
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 21:24:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id n25so4656443pgb.0
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NUjA2jNSnmu45PtSeP4o+QzyhX9y81W+nYK9XpvLtWM=;
 b=TMWFVNnjCehbf2dXwgupeiZlAZ4966betId5laDETRK4ezJ++qiLBPW1KPMmQwrKC+
 oO/hpMuTUh/aZHY1kmHrVz1ewIBpNw3FJF5uvlB63k1BWwQ+7DcEg2jAkfIBhWZPAu/j
 p2RN+IFCRXg/GoMKyKidFL0/TBYkR0vxOu5Dkjb1ghtfwyTr6JuTlbIhg4nPyTzMyMuu
 P6Xdd228ZQgcTX+5E0nw45xgd8fkpqJJ7p0ia4LPeeODPqyryDdvW2OiV2jEMo87w7R3
 xSFxKwlLAWWx3jUZy8bwFCv5bzhx3WSA33suqZtUokqpNRN3tZ/YoZfR9L0gjItDhJu5
 A8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NUjA2jNSnmu45PtSeP4o+QzyhX9y81W+nYK9XpvLtWM=;
 b=Dd0APjCc6TV+ZQiRfzUbj2xHVH0OXaPsytPHB1aR1mATkpDZ0bvahy+AT6qpuymYsp
 1KNKRlGrV6gXTFXiF4A0FNvGkQpxawyAgkrQuwvSFuFieEZhOgyrVcs/WJNhFrpDcIiJ
 tgrsZdtdpWIJjUbsvf0aC/zRIZ+nRJ9cj+WFZ2R3hPDpTRSGMvOQUvzWHQZzaKo5j41w
 Bl2wDxGQhABwBRqUBVHBqssvvwHU1cX0xAz2NpePP0pqMy5951wD2WNk0u9t6EU28P4v
 kgi9XRi+o4/VNkMVau4Vd/Y0pCPNREogHDiAX0XdeBPl65LElxaGsqH9ec0TOv08Sd77
 ZwHA==
X-Gm-Message-State: AOAM530CONznC5T7LFjBzU0+2dCjf+jL4LX9rADSbnAi81NZZztrqZws
 Q37fvFS0owk/05D6zfnXkZlxDw==
X-Google-Smtp-Source: ABdhPJwURX6SX7DoETcJY1cM8nW0POPdmmqVZ6PQJll6UjENI87Kd5yO6X3C/dk1wnyKTepPcjvusQ==
X-Received: by 2002:a63:c04b:: with SMTP id z11mr9441387pgi.74.1610659459310; 
 Thu, 14 Jan 2021 13:24:19 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i25sm6012481pfo.137.2021.01.14.13.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 13:24:18 -0800 (PST)
Date: Thu, 14 Jan 2021 13:24:18 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 13:24:16 PST (-0800)
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
In-Reply-To: <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-74a37cc8-bbda-4471-9510-dab1b35ded2e@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_162421_980497_53030AF1 
X-CRM114-Status: GOOD (  38.69  )
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
 Atish Patra <Atish.Patra@wdc.com>, geert@linux-m68k.org,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jan 2021 13:11:14 PST (-0800), atishp@atishpatra.org wrote:
> On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
>> > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >>
>> >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
>> >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
>> >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
>> >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
>> >> >
>> >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> >> > ---
>> >> >  arch/riscv/include/asm/cache.h | 4 ++++
>> >> >  1 file changed, 4 insertions(+)
>> >> >
>> >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
>> >> > index 9b58b104559e..c9c669ea2fe6 100644
>> >> > --- a/arch/riscv/include/asm/cache.h
>> >> > +++ b/arch/riscv/include/asm/cache.h
>> >> > @@ -7,7 +7,11 @@
>> >> >  #ifndef _ASM_RISCV_CACHE_H
>> >> >  #define _ASM_RISCV_CACHE_H
>> >> >
>> >> > +#ifdef CONFIG_64BIT
>> >> >  #define L1_CACHE_SHIFT               6
>> >> > +#else
>> >> > +#define L1_CACHE_SHIFT               5
>> >> > +#endif
>> >> >
>> >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
>> >>
>> >> Should we not instead just
>> >>
>> >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
>> >>
>> >> like a handful of architectures do?
>> >>
>> >
>> > The generic code already defines it that way in include/linux/cache.h
>> >
>> >> The cache size is sort of fake here, as we don't have any non-coherent
>> >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
>> >> cache lines in RISC-V implementations as software may assume that for
>> >> performance reasons.  Not really a strong reason, but I'd prefer to just make
>> >> these match.
>> >>
>> >
>> > If it is documented somewhere in the kernel, we should update that. I
>> > think SMP_CACHE_BYTES being 64
>> > actually degrades the performance as there will be a fragmented memory
>> > blocks with 32 bit bytes gap wherever
>> > SMP_CACHE_BYTES is used as an alignment requirement.
>>
>> I don't buy that: if you're trying to align to the cache size then the gaps are
>> the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
>> there's really no reason for these to be different between the base ISAs.
>>
>
> Got your point. I noticed this when fixing the resource tree issue
> where the SMP_CACHE_BYTES
> alignment was not intentional but causing the issue. The real issue
> was solved via another patch in this series though.
>
> Just to clarify, if the allocation function intends to allocate
> consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
> This will lead to a #ifdef macro in the code.

Well, if you want to be allocating XLEN-byte sized chunks then you should use 
an XLEN-based define and if you want to allocate cache-line-sized chunks then 
you should use some cache-line-based define.  I guess I'd have to see the code 
to know if an ifdef is the right way to go, but the right thing is probably to 
just change over to something that already exists.

>> > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
>> > without this patch.
>> > I didn't see anything in Qemu though.
>>
>> Something like that is probably only going to show up on real hardware, QEMU
>> doesn't really do anything with the cache line size.  That said, as there's
>> nothing in our kernel now related to non-coherent memory there really should
>> only be performance issue (at least until we have non-coherent systems).
>>
>> I'd bet that the change is just masking some other bug, either in the software
>> or the hardware.  I'd prefer to root cause this rather than just working around
>> it, as it'll probably come back later and in a more difficult way to find.
>>
>
> Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
> you were saying ?
> We may need to change an alignment requirement to 32 for RV32 manually
> at some place in code.
>
>> >> _______________________________________________
>> >> linux-riscv mailing list
>> >> linux-riscv@lists.infradead.org
>> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
