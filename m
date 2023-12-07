Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E9C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 05:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AagVCbl2KQ85SoOqtvxpU8Jo2K9a1vFd6vJaXxAaz7I=; b=NAFpC32XFZNr2a
	XKQIw0MQcwDVbZxqzd53x8yl1DZAZqtkHD5CW4Q6v9hyb3g8fL9W6AxeSuuqXRYXpJQa2siBZZ5g1
	zk5Plugaj4uFIRW0/vyTs4xOp9Sq44rZLJan3N0qLZVrFdykIOzb7/sIM2v1aq7Wn8ShA/4zYlE0k
	PYFwbkeiialfL3Nu6QqgLcJAnD+koRGmHrp3hwvkXjJR8F9lTjk8wrkg6VVuTqxbPP432S3nnRkFC
	ifFs2AdaPiONenu73Eody4+lPjNxlWO9wp9d5rbRt5pfhHrHKs/eUER9Vv/xsrX1TfcveYlyyd+oo
	efyBpU08Gm8MKduzTkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7Dt-00BvoC-2I;
	Thu, 07 Dec 2023 05:46:57 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB7Dq-00BvmG-0l
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 05:46:55 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ce28faa92dso3724195ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 21:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701928012; x=1702532812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egxxoHFyDqeCA/LxlDg8JyWMVYkStRh8cbZHikRDbS0=;
        b=XOIBZHxEd5bjLoif5ULC6uCrifdyoG7KfhCUTjhRXDXkCuF5fH1//LPMp/kN9cIspk
         bpBYR3gAdNVEmbeuW+AejRljV4jlnDuBdBm+ToR+HrQHOYSR31rGMJYxbH2vKQn0I3Gz
         Y8+RFOXT8qnsdnD+zDPwYhmmnI8XM3A2rrkB/+FS8MZCddklkE/At67lCXG5RZZcZ5W7
         J5ZoTLCJDKUMt9sT0M7enuQLVj1NCD0ZXlnMAOr0JLMNWH6zkCMO7mpxckmO9WvBnVIY
         5K9V8rW4ge2J7bzK/64+McsOF24XUpKUYZ6qPHl/MopP47ElA8GWULUSfJuZLJLTddp9
         MbZw==
X-Gm-Message-State: AOJu0YwdxCbk/QrQYjeB1P4xQq+u7gGdxqoyo6CxIOxfaln/NLfHocRP
	SixwCMlI7zKYVKoX81ei4SU=
X-Google-Smtp-Source: AGHT+IF6vXYcdw6GXClAOhugyGgBVtuMtwXIfwxdWqT56yjqXEpfSXOgZ2/KtLitjpsLVgMAz5ioAA==
X-Received: by 2002:a17:902:c101:b0:1d0:8afd:b28c with SMTP id 1-20020a170902c10100b001d08afdb28cmr1453916pli.92.1701928012478;
        Wed, 06 Dec 2023 21:46:52 -0800 (PST)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902ea8500b001d08e080042sm431944plb.43.2023.12.06.21.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:46:51 -0800 (PST)
Date: Wed, 6 Dec 2023 21:46:48 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Tejun Heo <tj@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/2] riscv: Enable percpu page first chunk allocator
Message-ID: <ZXFcSEzalzl790bO@snowbird>
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
 <f259088f-a590-454e-b322-397e63071155@ghiti.fr>
 <ZXDEyzVcBOPUCCpg@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZXDEyzVcBOPUCCpg@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_214654_273479_0D9AFE25 
X-CRM114-Status: GOOD (  22.59  )
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

Hello,

On Wed, Dec 06, 2023 at 09:00:27AM -1000, Tejun Heo wrote:
> On Wed, Dec 06, 2023 at 11:08:20AM +0100, Alexandre Ghiti wrote:
> > Hi Tejun,
> > 
> > On 10/11/2023 15:07, Alexandre Ghiti wrote:
> > > While working with pcpu variables, I noticed that riscv did not support
> > > first chunk allocation in the vmalloc area which may be needed as a fallback
> > > in case of a sparse NUMA configuration.
> > > 
> > > patch 1 starts by introducing a new function flush_cache_vmap_early() which
> > > is needed since a new vmalloc mapping is established and directly accessed:
> > > on riscv, this would likely fail in case of a reordered access or if the
> > > uarch caches invalid entries in TLB.
> > > 
> > > patch 2 simply enables the page percpu first chunk allocator in riscv.
> > > 
> > > Alexandre Ghiti (2):
> > >    mm: Introduce flush_cache_vmap_early() and its riscv implementation
> > >    riscv: Enable pcpu page first chunk allocator
> > > 
> > >   arch/riscv/Kconfig                  | 2 ++
> > >   arch/riscv/include/asm/cacheflush.h | 3 ++-
> > >   arch/riscv/include/asm/tlbflush.h   | 2 ++
> > >   arch/riscv/mm/kasan_init.c          | 8 ++++++++
> > >   arch/riscv/mm/tlbflush.c            | 5 +++++
> > >   include/asm-generic/cacheflush.h    | 6 ++++++
> > >   mm/percpu.c                         | 8 +-------
> > >   7 files changed, 26 insertions(+), 8 deletions(-)
> > > 
> > 
> > Any feedback regarding this?
> 
> On cursory look, it looked fine to me but Dennis is maintaining the percpu
> tree now. Dennis?
> 

Ah I wasn't sure at the time if we needed this to go through percpu vs
risc v. I need to poke tglx and potentially pull some more stuff so I
can take it.

I regrettably got both the covid and flu vaccines today and feel like a
truck hit me. I'll review this tomorrow and make sure it's taken care
of for the next merge window.

Thanks,
Dennis

> Thanks.
> 
> -- 
> tejun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
