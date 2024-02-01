Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD565C47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Il2mZXGH6mGKzcKJy/IVOdpN3m23QDOkcgcVRmMt6w=; b=VR3csfZJpl8Sza
	c5MGbyFS6f0g0f+gE+IpPNSUKaCQUxFsrtTdZwW+xJpkudZwNjdEL68tBvDW+RAwmVxkCr9PIPmuD
	GJA8t0KIijEAeUi4L8KejDh2xppXbgDOiRB3eZOeT+8wEp68vTG+67JSBquk/NqiWf9u6fOha0v4d
	PUafMGrWraxbOFJ3SuYrzf7j2ZDbqIMpirpskQcq2afLDe8NyQpZUiKfJOQT1bY8Jf3FyijaRzqVC
	L94kxN6v9HdaDYJp4fioxhD49yZ3HFQ0rv/zyOtXzNfAUh+G5gmoXkt7UKD6iZz4j1EqgX6Zd3jmT
	I8yXrSG5TIq5WD+E+f0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVO19-00000006QTl-1Bw8;
	Thu, 01 Feb 2024 03:45:35 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVO16-00000006QTI-219S
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 03:45:33 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d934c8f8f7so4649645ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 19:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706759131; x=1707363931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQXOa7LLPA5mB3r9PE/ky7/S4vcRmc/Br7XQyR94fo0=;
        b=TVYGKIBUB18Frs2ktWZPhXsHSP8T7wbPHDkvg5GBDNoS9AtHxXsous095LJ0kQoiI7
         KoClWxLg60mb00+kx96dMzy+uNHviSIaYRyqrDRW7pSEKU+7Qg6ElZcL96+5Jef7VWLx
         ySl9lUrYAtxVJjeVqoPyANNlhHvn7RpS2uB6QquW4rp2GsZ6ePRz1qAlk97VotekUY55
         KR0ozu/yD9C4KmcCEBMiDMqNmbHJ0EAEtm01czR4QXZsaRRhjTdMyMaCfHIR0enqu/DZ
         XhA9lWiXVJ3RslM8WWaSv7RusZnnxhVaKQeaRF6gs9rfGjVMKjKP24wjDbKaoq7QkhT0
         NZ1Q==
X-Gm-Message-State: AOJu0YwbFBgKvkzLMN//PEoknffgt3HLFiVFiOyyiJquZP3/dzjjTiiR
	t/K8+ytbnGC1DaFbxj1IZH+fvxfS8Qzj1UyVXMFkMNDME+aisIFV
X-Google-Smtp-Source: AGHT+IFU+kNk+ULCHcmfo/aZK9crCvQ3jzOGrofjo4buD7yKUlwRS0hvchEIf3yt781RKndm3iMeCg==
X-Received: by 2002:a17:902:c20b:b0:1d7:2311:8070 with SMTP id 11-20020a170902c20b00b001d723118070mr1020131pll.37.1706759130859;
        Wed, 31 Jan 2024 19:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWbTE23w+aY6SO58GQM8848CPSCeHcgtEIaYruFrAbBi6wGjLUR7fJ/+T1OngtW0R001QZ8GH14t+w8vukY/AXyPnljE6Ynym95EVRs+E8O02Ha89r+DVa4Q85QNYJMPW3sZiFtTX+4PlXHrWbEALoFyqIoOC9I8860+Z/E36HrtX4QyzgKea8HHBainUiwfY2C4j7u0yT9mE26IcMTOloypyKCw1zY7DaVA3qHHQh0UdKdx60=
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id m3-20020a170902f20300b001d8f3c7fb96sm564524plc.166.2024.01.31.19.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 19:45:30 -0800 (PST)
Date: Wed, 31 Jan 2024 19:45:27 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alexghiti@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, geert@linux-m68k.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix wrong size passed to
 local_flush_tlb_range_asid()
Message-ID: <ZbsT16CvwSDXtlAL@snowbird>
References: <ZbdpTPMOw4lsPxBi@snowbird>
 <mhng-d603d0d3-2f72-4dfc-b635-c270ae79fd85@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-d603d0d3-2f72-4dfc-b635-c270ae79fd85@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_194532_545893_0B38CC11 
X-CRM114-Status: GOOD (  27.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Wed, Jan 31, 2024 at 12:34:40PM -0800, Palmer Dabbelt wrote:
> On Mon, 29 Jan 2024 01:01:00 PST (-0800), dennis@kernel.org wrote:
> > Hi Alexandre,
> > 
> > On Tue, Jan 23, 2024 at 02:27:30PM +0100, Alexandre Ghiti wrote:
> > > local_flush_tlb_range_asid() takes the size as argument, not the end of
> > > the range to flush, so fix this by computing the size from the end and
> > > the start of the range.
> > > 
> > > Fixes: 7a92fc8b4d20 ("mm: Introduce flush_cache_vmap_early()")
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  arch/riscv/mm/tlbflush.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> > > index 8d12b26f5ac3..9619965f6501 100644
> > > --- a/arch/riscv/mm/tlbflush.c
> > > +++ b/arch/riscv/mm/tlbflush.c
> > > @@ -68,7 +68,7 @@ static inline void local_flush_tlb_range_asid(unsigned long start,
> > > 
> > >  void local_flush_tlb_kernel_range(unsigned long start, unsigned long end)
> > >  {
> > > -	local_flush_tlb_range_asid(start, end, PAGE_SIZE, FLUSH_TLB_NO_ASID);
> > > +	local_flush_tlb_range_asid(start, end - start, PAGE_SIZE, FLUSH_TLB_NO_ASID);
> > >  }
> > > 
> > >  static void __ipi_flush_tlb_all(void *info)
> > > --
> > > 2.39.2
> > > 
> > 
> > Sorry for the delay, I just pulled this into percpu#for-6.8-fixes. I'll
> > send it to Linus this week.
> 
> Do you mind if we do a shared tag or something?  It's going to conflict with
> https://lore.kernel.org/all/20240117140333.2479667-1-vincent.chen@sifive.com/
> .  No big deal as it's a pretty trivial conflict, but they'll both need
> stable backports.

This alone won't need a stable backport, I merged the bug as part of
enabling the percpu page allocator in the recent 6.8 merge window.

That being said, this is the only patch I'm carrying for v6.8. I'm happy
to drop it and have you pick it up instead. Saves me a tag and a PR.
Lmk if that works for you.

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
