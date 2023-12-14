Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8263EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 08:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLqUuH6p+kJg74TYmG0lspnjMMiJqjO8Lxw2MqezNkk=; b=LixBrHh2ptOrWv
	94ZFmDsE1swIXOjgQowGPmralK8zYScCOubXgHtKLR9vBYPWUyO7QfYalo4ENMQFHjLN67zwBvZtf
	v/jRbmI2MLib/ivtJrT/7i8TeWkq0IDVVJ1tpiB+676M6a4T0XSBUaziNWke5oQXwl1kfZEKQeHw6
	maN0RUCGA3UqoyvVRRW7BBYOU2D4YaR8rpiGqMFZGCJY1wjHiX4HerXseL1DIRtyUYf7rkV/bZW2g
	7txqGKyQlv1fPPqs4fyxxB4qlEPIYT1oAdMSSUjoCEZMITqmfJsxMaKBxyBj0MDLlGGXV92YxAXdb
	nV3rJ32SiBXrPyedSmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDhHG-00HGnm-0J;
	Thu, 14 Dec 2023 08:41:06 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDhHD-00HGmd-2E
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 08:41:05 +0000
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35f833adaa6so346855ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 00:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702543261; x=1703148061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQbR2JO/KFK5RF93JUmmx4V523VsDvrN1w2XiDVyh7c=;
        b=pf+LnhoIAUS+v1joNch3HbdVRPcLNY9WRPYrze5I6952jQ3O0tLDin4HE1oT/bfj+Y
         U1Uplp/Mpl3tfG2dsVHy0rxvuwQIUvQa6KkVvYrS6FqgBSbeWUt0DLCCt6KeYXD2LPR+
         bu8PeHEtIlhWYQg9N22jTCrstcdMSGPcP8X7TFLbg6jHnXdEi/1JizG2pzwmno9My3JN
         Hr4faGzcGlBrUMq3paOZAcf5vpjQ1eKQu+exFbspKjnfXNLZUHLwjeWl4wZspLXd6Vv3
         TYO64MTVk33ZoWxwUmpHgJ/r7NYxycmIafCudnG8zQalNLYEkCdoVyHTEDDBzd249d6z
         Awwg==
X-Gm-Message-State: AOJu0YxbRyOr4/t54b7+YyeC63Duw60dE2iuPg3IcEY+wk++rTmdJqoA
	5YtOXnDTi+2LfDe5+wtlwSg0NzH3N1JoNMlb
X-Google-Smtp-Source: AGHT+IHTijws84bT+t+wUZlzE5DTLKpXqSjvyPgKeN8xOqYkuQ5p52nrDNR5ore1Nt4kSFPYClVCrA==
X-Received: by 2002:a05:6e02:1c4d:b0:35f:7629:87d3 with SMTP id d13-20020a056e021c4d00b0035f762987d3mr2870814ilg.43.1702543261164;
        Thu, 14 Dec 2023 00:41:01 -0800 (PST)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709026b0200b001cfad034756sm11747930plk.138.2023.12.14.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:41:00 -0800 (PST)
Date: Thu, 14 Dec 2023 00:40:58 -0800
From: Dennis Zhou <dennis@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 0/2] riscv: Enable percpu page first chunk allocator
Message-ID: <ZXq/msjihOEZAo3w@snowbird>
References: <20231212213457.132605-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212213457.132605-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_004103_730062_F6037F71 
X-CRM114-Status: GOOD (  20.12  )
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

On Tue, Dec 12, 2023 at 10:34:55PM +0100, Alexandre Ghiti wrote:
> While working with pcpu variables, I noticed that riscv did not support
> first chunk allocation in the vmalloc area which may be needed as a fallback
> in case of a sparse NUMA configuration.
> 
> patch 1 starts by introducing a new function flush_cache_vmap_early() which
> is needed since a new vmalloc mapping is established and directly accessed:
> on riscv, this would likely fail in case of a reordered access or if the
> uarch caches invalid entries in TLB.
> Note that most architectures do not include asm-generic/cacheflush.h so to
> avoid build failures, this patch implements the new function on each of
> those architectures. For all architectures except riscv, this new function
> is implemented as a no-op to keep the existing behaviour but it likely
> needs another implementation.
> 
> patch 2 simply enables the page percpu first chunk allocator in riscv.
> 
> Changes in v2:
> - Rebase on top of 6.7
> - Define flush_cache_vmap_early() for all architectures that do
>   not include <asm-generic/cacheflush.h> to avoid build failures
> 
> Alexandre Ghiti (2):
>   mm: Introduce flush_cache_vmap_early()
>   riscv: Enable pcpu page first chunk allocator
> 
>  arch/arc/include/asm/cacheflush.h      | 1 +
>  arch/arm/include/asm/cacheflush.h      | 2 ++
>  arch/csky/abiv1/inc/abi/cacheflush.h   | 1 +
>  arch/csky/abiv2/inc/abi/cacheflush.h   | 1 +
>  arch/m68k/include/asm/cacheflush_mm.h  | 1 +
>  arch/mips/include/asm/cacheflush.h     | 2 ++
>  arch/nios2/include/asm/cacheflush.h    | 1 +
>  arch/parisc/include/asm/cacheflush.h   | 1 +
>  arch/riscv/Kconfig                     | 2 ++
>  arch/riscv/include/asm/cacheflush.h    | 3 ++-
>  arch/riscv/include/asm/tlbflush.h      | 1 +
>  arch/riscv/mm/kasan_init.c             | 8 ++++++++
>  arch/riscv/mm/tlbflush.c               | 5 +++++
>  arch/sh/include/asm/cacheflush.h       | 1 +
>  arch/sparc/include/asm/cacheflush_32.h | 1 +
>  arch/sparc/include/asm/cacheflush_64.h | 1 +
>  arch/xtensa/include/asm/cacheflush.h   | 6 ++++--
>  include/asm-generic/cacheflush.h       | 6 ++++++
>  mm/percpu.c                            | 8 +-------
>  19 files changed, 42 insertions(+), 10 deletions(-)
> 
> -- 
> 2.39.2
> 

Thanks for the quick v2. Applied to percpu#for-6.8.

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
