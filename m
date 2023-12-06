Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A0C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bWo5aZIuYsbFLTU0V7i4IJ0RZTHVYtccUTLTqBcp+s=; b=vqCaOkXzW5RjFm
	1xtA+xgUq/C2nAKRdee5elPC5PG8qJWLzgW01JDLDwyn1N7bbWxN5fBZ3fLdu059eqUcJRI9omDN3
	myHoIb+jcewwbwFJ2CCpwhd1KNPiE7jRzIpXUhBlagEavGQLDmD36EWRrg5b7//80XRe2w+4NZbrd
	KHtYc7ZbNQ3podAxWscjrzZUv8GFMC2GBFyioMh1+udA/IkcSF/9Xzih4FneH4Zri3EY4DoljjoFM
	1j4bRChPgztpV13/7cM45sDyJpxpz5IAijzutsE8FlkWlYfqBpU2koXP875NeOwH34KikS7Uab04/
	uA8pbGEXghCFr1VJrobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAx8K-00B5sv-2y;
	Wed, 06 Dec 2023 19:00:32 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAx8I-00B5sE-2k
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 19:00:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28652d59505so144861a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701889229; x=1702494029; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzbohbzVePtQAWojGFBvS0mVM42OxJTLPxt60AU1LYc=;
        b=aBVLjABoxvHZBxB4/LhaDKLaeh1v6Nvabbl+Wq5g05jCdWXaFIVEKXbL7wP139GKsL
         rYVpuNsgmzBxJGvgJP7wp7RSD0tMFeT8XHhXSUgUl3d1sz3rtDinV3uJwGXJU5dpABpG
         n2At0qd5Rw2yhYpFZqrlSv7ZMI9LfjVzkhdW7qOghSrezhBYdEiTp/EEIMjzmO3JqnvV
         MN5OmVY1PPcMKlNoz9WOZ87w3/HtC/grjHZ7tiwZkOGygvsj9oyRSyshSUWnxU8FJaUZ
         vWvlXjecZUCBWZEuZ4Sg0nSoRemBLf2W+UzkLfQ52S0ViXAzVESy6utbHLQMDETuLy0U
         Wi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701889229; x=1702494029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzbohbzVePtQAWojGFBvS0mVM42OxJTLPxt60AU1LYc=;
        b=As/qWZ5gVeiPJDXBkfjQwYkQMi1xhWwb9eGNc0yv+75XwMMBklj9euUJgtGwAYz6E5
         w9vGaqLooBJ5wkgTRSos3vqzggHvf6hoRX8Rn/+aSDEfKSLLRal8AuUO8zgfYhRiut6a
         /AY5EfqtGGE6ZSeNIzC80M5FQhrVWU9fdOg4Cuq1MwkgH8V+QIHIrVEBC3RlSIpMi7zS
         0vlSm+2Agpd9eZY/3dNvhJKCeJMLgEr3EgnAtmUMe6vhaQAJGvpzUJ1P/cq+w4RGVmAu
         NG5tILivkQcXf+KdF5/vapv/dtb+ocZfiWJ8yKj6owHDDUkGEORlAjlHkWJsLlPafFO/
         dKwA==
X-Gm-Message-State: AOJu0YyZYNPRD/SDvnevAUvYgEyIbw/w/WEi/On57hbzNb//GQ39awa1
	rTTwzjj39JdIxAqwYaNVdrY=
X-Google-Smtp-Source: AGHT+IGt2RkwoEJvnNo596uficEOJHOXr2g3TtQ4DOJL5NzM/DY50pjdwYSQUW8PI8sB4O4FfCwApg==
X-Received: by 2002:a17:90b:38c5:b0:286:aded:d5de with SMTP id nn5-20020a17090b38c500b00286adedd5demr1064920pjb.15.1701889229200;
        Wed, 06 Dec 2023 11:00:29 -0800 (PST)
Received: from localhost ([2620:10d:c090:400::4:27ef])
        by smtp.gmail.com with ESMTPSA id w4-20020a1709027b8400b001d049cc4c9asm169921pll.7.2023.12.06.11.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 11:00:28 -0800 (PST)
Date: Wed, 6 Dec 2023 09:00:27 -1000
From: Tejun Heo <tj@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/2] riscv: Enable percpu page first chunk allocator
Message-ID: <ZXDEyzVcBOPUCCpg@slm.duckdns.org>
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
 <f259088f-a590-454e-b322-397e63071155@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f259088f-a590-454e-b322-397e63071155@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_110030_891627_362DA99B 
X-CRM114-Status: GOOD (  18.76  )
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

On Wed, Dec 06, 2023 at 11:08:20AM +0100, Alexandre Ghiti wrote:
> Hi Tejun,
> 
> On 10/11/2023 15:07, Alexandre Ghiti wrote:
> > While working with pcpu variables, I noticed that riscv did not support
> > first chunk allocation in the vmalloc area which may be needed as a fallback
> > in case of a sparse NUMA configuration.
> > 
> > patch 1 starts by introducing a new function flush_cache_vmap_early() which
> > is needed since a new vmalloc mapping is established and directly accessed:
> > on riscv, this would likely fail in case of a reordered access or if the
> > uarch caches invalid entries in TLB.
> > 
> > patch 2 simply enables the page percpu first chunk allocator in riscv.
> > 
> > Alexandre Ghiti (2):
> >    mm: Introduce flush_cache_vmap_early() and its riscv implementation
> >    riscv: Enable pcpu page first chunk allocator
> > 
> >   arch/riscv/Kconfig                  | 2 ++
> >   arch/riscv/include/asm/cacheflush.h | 3 ++-
> >   arch/riscv/include/asm/tlbflush.h   | 2 ++
> >   arch/riscv/mm/kasan_init.c          | 8 ++++++++
> >   arch/riscv/mm/tlbflush.c            | 5 +++++
> >   include/asm-generic/cacheflush.h    | 6 ++++++
> >   mm/percpu.c                         | 8 +-------
> >   7 files changed, 26 insertions(+), 8 deletions(-)
> > 
> 
> Any feedback regarding this?

On cursory look, it looked fine to me but Dennis is maintaining the percpu
tree now. Dennis?

Thanks.

-- 
tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
