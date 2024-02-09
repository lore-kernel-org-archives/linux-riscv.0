Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68741C48297
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ljS+p6QS+WwT/FZ6RtDh1ZFNm5Vq3LkJhBCUXWKG5nM=; b=pfWrz6DwMazr4YAwsfqCUORipY
	MxlaH3KgzkgVI4enncW1wdCZDC/CQmHUGUDY8EAjB6mR+AKPb9Lb0Cda8dD3vOSiRVdbkLPvVnUe7
	ggBjH+RlP8ZB6L7zgszD3fO/Mp0kmZkyrRackwBczLFQXMUcahq/5TxsYX2OwVae6pR5dwOR7qvmN
	eWjIcfJUXcoAE2gOGplacVlNL9+rLMOJAp+lH7Lp81tE8jrCcEBxxLi466UAMlU2GrKQzwwudSeci
	wbygQzSc7hP1mqyV98tlRBq2aVZo6/OR432yz8mG3+enZYkzUy2a5x7l1KK3Hq2P4Jv5dPFUBN3QO
	fBP60JJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTwL-0000000HY97-2nsW;
	Fri, 09 Feb 2024 16:41:25 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTwH-0000000HY89-22hm
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 16:41:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e04fd5e05aso815421b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1707496880; x=1708101680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2zcUgQutS3DlGmwc5sEu07E2yjamp4+tUNWDaLkXDGg=;
        b=XKlNlLTy83yvVGCwLw6YU68wsQE/aqvMYuWvvL5KT2m1+XJ2LGjuMtpLjoJRsxbN2l
         R8TxNFFi4whnh4sqLnH5QGB4C8JABlkC9mELL+XXbq/0/JhwCXBgn9GNoRkn/5CLd/Up
         2WnMx0plY1tCZ96MB2rbCL82ZP2KWxXID0MT2w+I6dmNLe4GiLu4UHTFETZkQgXKdZtV
         rjVKBtP4ArPKC/++SbBprbCQ8TLEq0DOI0De3tcAQ1NVxGNnqDQJJ+GpKMm7NIbD6ldd
         hPRAOLRvoQ32dLzBf/g2RIxhrlZ3p9gNfjOuwEDZZhDBFSPnFm94Bi9WrCzgaDLfbV1P
         BolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707496880; x=1708101680;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zcUgQutS3DlGmwc5sEu07E2yjamp4+tUNWDaLkXDGg=;
        b=A6GTVEozphCW8mLAPZra4XFS7Jw6x0Flc42mInwHHz7KvCS61G5iNeSeVoyWUQzZqx
         b1+wfp+DYZCEjg5oQ4rZaa21/M4I0Wi/FIfsuWXVAjED2D9atK+rVM8Fpm/7SHszREmN
         obRLK5btNOAdf7+g2j1PFQW12uRSgc4wOjnjQjn0gamHaqanNrNMS8Kq+/unCkuWdOUK
         hzTzADOO4BQqjlV7sq6NNpOOtHFFXqmmhGoCxhsRzfW4QcRUjBLyf+6Tn14Kj+SJaHK/
         CmniMREmAuH+OiR5cq1XzUWQIpdsGPn8CkWioqFZk/ALhy2XxwlrZB3d59EwjxBVXioO
         dB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu4/FKbO5ng++Ny5RJgxZ3VhR+adOG8PKl9vYoubLRySPEWzGi0VBHGtnB2/h8j9v4yl4+vY8+M+0n1OPtSFfyjbBtw2XdjhXEyH8GOEXf
X-Gm-Message-State: AOJu0Yw9n+13v+5GzP0v5+5g1Eyd3dU3Ib/LVFVo7QGSoENKmcJ6T+05
	yZ/7twOYmW5Q7u8GF+5O407nJS4eghzDyqD7ryd/9uuP5BiZXZS/I4BTJtZoI0k=
X-Google-Smtp-Source: AGHT+IH138In2qxnUDyUf5L0gXNV1VbXHmjJHEtnKql2S7mQ4A7aMyRWwAcBnM47BI7S/82MALke/A==
X-Received: by 2002:a05:6a00:2d90:b0:6e0:4030:ef77 with SMTP id fb16-20020a056a002d9000b006e04030ef77mr2136298pfb.16.1707496879549;
        Fri, 09 Feb 2024 08:41:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW6wu/Bha+p2xiJadb32Pu5nECmFu1bSMq78Yus+Wy9UGejr+P/rAkvSaYFYJpd4eKOMUDwtlXR5p89UC6jkt7GzbRaB16LaAfJvdZA5qsJOFcMQrqMzs/8q3+2FOkBiC2owQCZL1+Z5jjNK6+JZfuehN3+7w9pRTq1NIPmfjiU0jmf6RUsN1XH/GUA125keZ5AVyaEH/JZTQJEzNlNvzc/DzGDYa/D3+APhpCn3IhlaWxIwdc=
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id y2-20020aa78542000000b006e096ff7c91sm728258pfn.100.2024.02.09.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:41:18 -0800 (PST)
Date: Fri, 09 Feb 2024 08:41:18 -0800 (PST)
X-Google-Original-Date: Fri, 09 Feb 2024 08:41:15 PST (-0800)
Subject: Re: [PATCH] riscv: Fix wrong size passed to local_flush_tlb_range_asid()
In-Reply-To: <ZbsT16CvwSDXtlAL@snowbird>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, geert@linux-m68k.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dennis@kernel.org
Message-ID: <mhng-df0a3f10-0713-440c-81c4-a47f22fb367a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_084121_764557_75F1748F 
X-CRM114-Status: GOOD (  30.35  )
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

On Wed, 31 Jan 2024 19:45:27 PST (-0800), dennis@kernel.org wrote:
> Hi Palmer,
>
> On Wed, Jan 31, 2024 at 12:34:40PM -0800, Palmer Dabbelt wrote:
>> On Mon, 29 Jan 2024 01:01:00 PST (-0800), dennis@kernel.org wrote:
>> > Hi Alexandre,
>> >
>> > On Tue, Jan 23, 2024 at 02:27:30PM +0100, Alexandre Ghiti wrote:
>> > > local_flush_tlb_range_asid() takes the size as argument, not the end of
>> > > the range to flush, so fix this by computing the size from the end and
>> > > the start of the range.
>> > >
>> > > Fixes: 7a92fc8b4d20 ("mm: Introduce flush_cache_vmap_early()")
>> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> > > ---
>> > >  arch/riscv/mm/tlbflush.c | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> > > index 8d12b26f5ac3..9619965f6501 100644
>> > > --- a/arch/riscv/mm/tlbflush.c
>> > > +++ b/arch/riscv/mm/tlbflush.c
>> > > @@ -68,7 +68,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
>> > >
>> > >  void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
>> > >  {
>> > > -	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>> > > +	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
>> > >  }
>> > >
>> > >  static void __ipi_flush_tlb_all(void *info)
>> > > --
>> > > 2.39.2
>> > >
>> >
>> > Sorry for the delay, I just pulled this into percpu#for-6.8-fixes. I'll
>> > send it to Linus this week.
>>
>> Do you mind if we do a shared tag or something?  It's going to conflict with
>> https://lore.kernel.org/all/20240117140333.2479667-1-vincent.chen@sifive.com/
>> .  No big deal as it's a pretty trivial conflict, but they'll both need
>> stable backports.
>
> This alone won't need a stable backport, I merged the bug as part of
> enabling the percpu page allocator in the recent 6.8 merge window.
>
> That being said, this is the only patch I'm carrying for v6.8. I'm happy
> to drop it and have you pick it up instead. Saves me a tag and a PR.
> Lmk if that works for you.

Sorry I missed this, but that seems like the easiest way to go here -- 
the other patch fixes the same bug (and another one), so I think we're 
safe with just that (which I'm sending to Linus as part of my rc4 fixes 
now-ish, as I'd need to anyway).  It's d9807d60c145 ("riscv: mm: execute 
local TLB flush after populating vmemmap"), in case anyone's looking 
later...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
