Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4A7C10F04
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0a6bXRF/uHM7fGDN/ZFIREVFUp3hNq5X+qTPv1R5xE=; b=m4205bzMelVDcC2JKC0MPI99VY
	HlJJKL8IO2xoYP7y83B27F+zj+GwCnBBiBbOJCHWmNls6rkeQEoK18d+4pGxg19mr3VssLZhCpF7K
	ziF8IIh8japmlarrACG4wjebvkev+U8VeEg9nsGTMWBt+FXYHJKRPJ7WoXcSk7MrGRwIIi06kMmrB
	1eZ0CJhJY5Jn1LPj7pNd4IYo65soPiYPiCSoQlBWtv274FdoJqkUhl1wZwY6M/uLJjf1cYOXSjl09
	d0Es0wydGSPZAze3GdVc1EAtKGlNes3n3HRucTQhc3uWDbZhtOZeGcmUCTyjDZIh09DuNClEwRIpV
	jHWgLAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAopX-009eLU-1f;
	Wed, 06 Dec 2023 10:08:35 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAopS-009eHl-2F
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 10:08:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AB216000A;
	Wed,  6 Dec 2023 10:08:21 +0000 (UTC)
Message-ID: <f259088f-a590-454e-b322-397e63071155@ghiti.fr>
Date: Wed, 6 Dec 2023 11:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: Enable percpu page first chunk allocator
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann
 <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
 Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
References: <20231110140721.114235-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231110140721.114235-1-alexghiti@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_020830_882221_8191FA3F 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Tejun,

On 10/11/2023 15:07, Alexandre Ghiti wrote:
> While working with pcpu variables, I noticed that riscv did not support
> first chunk allocation in the vmalloc area which may be needed as a fallback
> in case of a sparse NUMA configuration.
>
> patch 1 starts by introducing a new function flush_cache_vmap_early() which
> is needed since a new vmalloc mapping is established and directly accessed:
> on riscv, this would likely fail in case of a reordered access or if the
> uarch caches invalid entries in TLB.
>
> patch 2 simply enables the page percpu first chunk allocator in riscv.
>
> Alexandre Ghiti (2):
>    mm: Introduce flush_cache_vmap_early() and its riscv implementation
>    riscv: Enable pcpu page first chunk allocator
>
>   arch/riscv/Kconfig                  | 2 ++
>   arch/riscv/include/asm/cacheflush.h | 3 ++-
>   arch/riscv/include/asm/tlbflush.h   | 2 ++
>   arch/riscv/mm/kasan_init.c          | 8 ++++++++
>   arch/riscv/mm/tlbflush.c            | 5 +++++
>   include/asm-generic/cacheflush.h    | 6 ++++++
>   mm/percpu.c                         | 8 +-------
>   7 files changed, 26 insertions(+), 8 deletions(-)
>

Any feedback regarding this?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
