Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185D6C04A94
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tepx4NqL7E4iBQLSsUI0SNoSOpj6lkUX15Yr8rygahg=; b=OgzQoU981w+4Ml
	/KdOnVhMHJptoX3yu7uTy/ee1Gwt6EXaWfy85Y2Lg1YopYNV0CmlGcZyfDFbcJe3x6R6wUC8KWkeQ
	GVSRJJuS/n5Z2g1cr/UneMUbBzpLFL6uDlMQ9PeNjeGl9AezoFzxBfjrdeUNNFahf3SeyTBUjZN3S
	VJrtvEo2LelERUONsHgi1LfwFCHcRKMfn4yaL07OJNF1yIjg3z5tFArcp3+Qn6chfZIv/TkvGDjS6
	RRRd5086k9BGS33AOjuArM+oyU+bG1ldxhy29Qgc9HTEMBZ56W0lmiPV8OVY7jZJnOtYsZU7+Fy81
	uEpbvw/fB7WM78DwubxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT7Wb-000jf7-23;
	Mon, 07 Aug 2023 21:12:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT7WX-000jcD-1x
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 21:12:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bc411e9d17so30836265ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 14:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691442737; x=1692047537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLabNF1oUru8G8E0mb8z07qDe8jY0hmn23BXjQmIFo0=;
        b=fOuezLgQNJfG941ygz4q5rwJTaSzKWKWRgTe8pPAw2H3M/CXJiyfFwfHQMQra0JJB7
         6AqwM8/wSw/bttG9JFm/DHUaNEKteNe7XDbEpfoDSPcviuXsvK+jyVLm5CF3keLnc3rh
         SrGRmeyuoLDkFRE7oDrpq6R/vjZd44xbXoGm63bXdGOtkgMkSz4EW9bOrVIKAUptiWEZ
         PHJEQEe9e39mD6PtBqiOkI8kx8MVj3ee9N3gvEyuTcrOpOrfRBuQJFSdFvAWPPxiLgaw
         P2o5cbtfNyYixv9K6m6YCWi4quYH5qQ34J4ofvKo6JEprZXei9vNbfiUPebeskAAQBCC
         sgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691442737; x=1692047537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLabNF1oUru8G8E0mb8z07qDe8jY0hmn23BXjQmIFo0=;
        b=TDOzVw9IEln/Okgq3da5X6/na+mQbffbLPjksqcm1GNCfQBScPpk3gcn+imrjHqGNR
         oHEBMC0+CwbniRwag73sDGPmJgaiDiJ6Fy8nvoPfwe69pum4+MaR+FZhwez2YOcqLjKy
         zLMwS3j/lOJRtNv1Nhw4nTDgeSnvrTa3LagtWgWsMbuUUAGlXPG3qkZnxNPQk+tUm0bi
         X52QXn2UJTFMZeqXtoD6P3GnApjYRGUvmqkHeEk8zbrRgn8vcdrzDWfDsJAYFkZ7um+J
         vdUeQhFfjkOARmaDycWO7yQ5iKK4rIreOrs4/joTk1w32W39J4mUZ8mQq+4RYuf2HFhJ
         Ot0w==
X-Gm-Message-State: AOJu0Yw//7uboGhuCr7W2ZZ+XDsxFH4n+aTGfK3FZGA+Q+p5l9mMtpwZ
	b9w0+p3j5+MQmTe0XgM+xuUBPA==
X-Google-Smtp-Source: AGHT+IEPKHYE/TxBZ7l9uiuErBP4gHqfE60SXyNlo1aBqM49wt1t/o4eZRyv8IC1K50OY1wr6aSjXA==
X-Received: by 2002:a17:903:22cb:b0:1bb:d045:ae8 with SMTP id y11-20020a17090322cb00b001bbd0450ae8mr11946777plg.7.1691442737567;
        Mon, 07 Aug 2023 14:12:17 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902ce8c00b001bb97e51ad5sm7350677plg.99.2023.08.07.14.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 14:12:16 -0700 (PDT)
Date: Mon, 7 Aug 2023 14:12:14 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v8 1/4] RISC-V: mm: Restrict address space for
 sv39,sv48,sv57
Message-ID: <ZNFeLg+HT6/Nx6hD@ghost>
References: <20230727212647.4182407-1-charlie@rivosinc.com>
 <20230727212647.4182407-2-charlie@rivosinc.com>
 <4c692993-86ab-fdce-8c78-f676cf90e861@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c692993-86ab-fdce-8c78-f676cf90e861@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_141221_647697_7D038713 
X-CRM114-Status: GOOD (  29.55  )
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

On Sun, Aug 06, 2023 at 11:53:51AM +0200, Alexandre Ghiti wrote:
> 
> On 27/07/2023 23:26, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. A hint address passed to mmap will
> > cause the largest address space that fits entirely into the hint to be
> > used. If the hint is less than or equal to 1<<38, an sv39 address will
> > be used. An exception is that if the hint address is 0, then a sv48
> > address will be used. After an address space is completely full, the next
> > smallest address space will be used.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/riscv/include/asm/elf.h       |  2 +-
> >   arch/riscv/include/asm/pgtable.h   | 20 +++++++++++-
> >   arch/riscv/include/asm/processor.h | 52 ++++++++++++++++++++++++++----
> >   3 files changed, 66 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> > index c24280774caf..5d3368d5585c 100644
> > --- a/arch/riscv/include/asm/elf.h
> > +++ b/arch/riscv/include/asm/elf.h
> > @@ -49,7 +49,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
> >    * the loader.  We need to make sure that it is out of the way of the program
> >    * that it will "exec", and that there is sufficient room for the brk.
> >    */
> > -#define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
> > +#define ELF_ET_DYN_BASE		((DEFAULT_MAP_WINDOW / 3) * 2)
> >   #ifdef CONFIG_64BIT
> >   #ifdef CONFIG_COMPAT
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 75970ee2bda2..c76a1ef094a4 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -63,8 +63,26 @@
> >    * position vmemmap directly below the VMALLOC region.
> >    */
> >   #ifdef CONFIG_64BIT
> > +#define VA_BITS_SV39 39
> > +#define VA_BITS_SV48 48
> > +#define VA_BITS_SV57 57
> > +
> > +#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
> > +#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
> > +#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
> > +
> >   #define VA_BITS		(pgtable_l5_enabled ? \
> > -				57 : (pgtable_l4_enabled ? 48 : 39))
> > +				VA_BITS_SV57 : (pgtable_l4_enabled ? VA_BITS_SV48 : VA_BITS_SV39))
> > +
> > +#ifdef CONFIG_COMPAT
> > +#define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
> > +#define MMAP_MIN_VA_BITS_64 ((VA_BITS >= VA_BITS_SV39) ? VA_BITS_SV39 : VA_BITS)
> 
> 
> Here the condition is always true right?
> 
Yes, that condition is always true, I can eliminate the conditional.
> 
> > +#define MMAP_VA_BITS (test_thread_flag(TIF_32BIT) ? 32 : MMAP_VA_BITS_64)
> > +#define MMAP_MIN_VA_BITS (test_thread_flag(TIF_32BIT) ? 32 : MMAP_MIN_VA_BITS_64)
> 
> 
> I think you should use is_compat_task() here instead of
> test_thread_flag(TIF_32BIT). And what about introducing VA_BITS_SV32 instead
> of hardcoding 32?
> 
Sounds good.
> 
> > +#else
> > +#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
> > +#define MMAP_MIN_VA_BITS ((VA_BITS >= VA_BITS_SV39) ? VA_BITS_SV39 : VA_BITS)
> 
> 
> Ditto here.
> 
> 
> > +#endif
> >   #else
> >   #define VA_BITS		32
> >   #endif
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index c950a8d9edef..e810244ea951 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -13,19 +13,59 @@
> >   #include <asm/ptrace.h>
> > +#ifdef CONFIG_64BIT
> > +#define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > +#define STACK_TOP_MAX		TASK_SIZE_64
> > +
> > +#define arch_get_mmap_end(addr, len, flags)	\
> > +({	\
> > +	unsigned long mmap_end;	\
> > +	typeof(addr) _addr = (addr); \
> > +	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && test_thread_flag(TIF_32BIT))) \
> > +		mmap_end = DEFAULT_MAP_WINDOW;	\
> 
> 
> Wouldn't that prevent a sv57 system to allocate sv57 addresses when sv48 is
> full unless explicitly asked?
> 
Yes that is a good point, that should be STACK_TOP_MAX as well.
> 
> > +	else if ((_addr) >= VA_USER_SV57)	\
> > +		mmap_end = STACK_TOP_MAX;	\
> > +	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48))	\
> > +		mmap_end = VA_USER_SV48;	\
> > +	else	\
> > +		mmap_end = VA_USER_SV39;	\
> > +	mmap_end;	\
> > +})
> > +
> > +#define arch_get_mmap_base(addr, base) \
> > +({ \
> > +	unsigned long mmap_base; \
> > +	typeof(addr) _addr = (addr); \
> > +	typeof(base) _base = (base); \
> > +	unsigned long rnd_gap = (_base) - DEFAULT_MAP_WINDOW; \
> > +	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && test_thread_flag(TIF_32BIT))) \
> > +		mmap_base = (_base); \
> > +	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
> > +		mmap_base = VA_USER_SV57 + rnd_gap; \
> 
> 
> Shouldn't it be mmap_base = VA_USER_SV57 - rnd_gap?
> 
No, rnd_gap is a negative number here. 'base' is equal to
DEFAULT_MAP_WINDOW - gap - rnd. It does seem more clear if it is a
positive number so I will set rnd_gap to DEFAULT_MAP_WINDOW - (_base).
> 
> > +	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> > +		mmap_base = VA_USER_SV48 + rnd_gap; \
> > +	else \
> > +		mmap_base = VA_USER_SV39 + rnd_gap; \
> > +	mmap_base; \
> > +})
> > +
> > +#else
> > +#define DEFAULT_MAP_WINDOW	TASK_SIZE
> > +#define STACK_TOP_MAX		TASK_SIZE
> > +#endif
> > +#define STACK_ALIGN		16
> > +
> > +#define STACK_TOP		DEFAULT_MAP_WINDOW
> > +
> >   /*
> >    * This decides where the kernel will search for a free chunk of vm
> >    * space during mmap's.
> >    */
> > -#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
> > -
> > -#define STACK_TOP		TASK_SIZE
> >   #ifdef CONFIG_64BIT
> > -#define STACK_TOP_MAX		TASK_SIZE_64
> > +#define TASK_UNMAPPED_BASE	PAGE_ALIGN((UL(1) << MMAP_MIN_VA_BITS) / 3)
> >   #else
> > -#define STACK_TOP_MAX		TASK_SIZE
> > +#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
> >   #endif
> > -#define STACK_ALIGN		16
> >   #ifndef __ASSEMBLY__

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
