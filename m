Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7EBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxTw1Dp30h+zlhlC5SeTGLc5whnLPyktkABBNgOs6xc=; b=YM9llugW1wqT3n
	9kQKI1Qa+97ZaiHnMt//sbRg3pg4AaWCaCttKV+zFUHqhMZpJRO2bTRfsnQoHfuad2+wUQbry//hZ
	pReUd2xWWduiIZiZgKOHgM0JgifaFAqQQxvO0H2m6rmTpykioHVIGtu7pqjuQsIuBczw/LB8rGfX1
	FwgMZpZxHqtYNB9C9vE/FciuDGlGCTeBweN1a8JFITnrm2v7Fx7jchWPJNbl6uHqwNzm0ALV1kbfO
	tNxpdgm1uD5JtZyYvlkmHNGEOdqhw6Tjs2N99PlwvwSY1hegLQ4Y0xIGSea/LsNj9NhRTtu9RrMej
	ZEY2TwnQJHwKiVdnaYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrpYz-00301n-IG; Mon, 29 Nov 2021 22:55:57 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrpYJ-002zlJ-9I; Mon, 29 Nov 2021 22:55:16 +0000
Received: by mail-qt1-f169.google.com with SMTP id j17so18320521qtx.2;
 Mon, 29 Nov 2021 14:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pEDakQnvUPgfExSNtMrcASRup0dCzLPmxqHNnZuTaEw=;
 b=d7V542KsYFyhnXCiJQFQKbjRLSIkLrbYF67YYgQEwpEZnsMD0Hj0tGcRhbANeXSmZO
 8VbCBpryuqxOHvpgOitX/Mu9kfND7v/3bEIDCnsD7J6Xii8EVpE8Tv1F0kbrzTyN1m3a
 UeXkO0U9o2c85NY27X4DzxyGBCvXFX7JQ4j4tY7HkKfgv9CqmRJxBqcmNX0lcbtgz+VO
 j6xblU0QeNYtaAGe4/b1OkCdIi6uizinpXMozY8d+S2oSB8lUghnVJGcknZe6gwANG0X
 PpSD8QvjTVQqNGfCoPgJU60b2oMuZd0UHSH0Rkx5BHiR2hHq08rV0ERFHHX/916u96NK
 bX6w==
X-Gm-Message-State: AOAM533K7v4yCowg9RJS4DGXDK/MLaW8YTbK2bcrE4a0Ymw9G25/K0KV
 TpsuLzNPP4b6LUlWJMY/mH0=
X-Google-Smtp-Source: ABdhPJwhddCBXLud6erDgcxLoWG12ankufJKN/6VQiDHvJFght0g5pwFKu7S2tQHfyQ8XLjcAQQPNA==
X-Received: by 2002:ac8:4e56:: with SMTP id e22mr47933221qtw.72.1638226513800; 
 Mon, 29 Nov 2021 14:55:13 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id d9sm9373180qkn.131.2021.11.29.14.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:55:13 -0800 (PST)
Date: Mon, 29 Nov 2021 17:55:11 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tj@kernel.org, gregkh@linuxfoundation.org,
 cl@linux.com, catalin.marinas@arm.com, will@kernel.org,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Message-ID: <YaVaTwjiZmWz8PKY@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_145515_370148_15AEFDAF 
X-CRM114-Status: GOOD (  17.42  )
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

On Sun, Nov 21, 2021 at 05:35:53PM +0800, Kefeng Wang wrote:
> When support page mapping percpu first chunk allocator on arm64, we
> found there are lots of duplicated codes in percpu embed/page first
> chunk allocator. This patchset is aimed to cleanup them and should
> no funciton change, only test on arm64.
> 
> Kefeng Wang (4):
>   mm: percpu: Generalize percpu related config
>   mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>   mm: percpu: Add generic pcpu_fc_alloc/free funciton
>   mm: percpu: Add generic pcpu_populate_pte() function
> 
>  arch/arm64/Kconfig             |  20 +----
>  arch/ia64/Kconfig              |   9 +--
>  arch/mips/Kconfig              |  10 +--
>  arch/mips/mm/init.c            |  14 +---
>  arch/powerpc/Kconfig           |  17 +---
>  arch/powerpc/kernel/setup_64.c |  92 +--------------------
>  arch/riscv/Kconfig             |  10 +--
>  arch/sparc/Kconfig             |  12 +--
>  arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>  arch/x86/Kconfig               |  17 +---
>  arch/x86/kernel/setup_percpu.c |  66 ++-------------
>  drivers/base/arch_numa.c       |  68 +---------------
>  include/linux/percpu.h         |  13 +--
>  mm/Kconfig                     |  12 +++
>  mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>  15 files changed, 165 insertions(+), 443 deletions(-)
> 
> -- 
> 2.26.2
> 

I've made a few comments. I think this will be a little bit of a
challenge to get through due to it touching so many architectures. For
ease, it probably makes sense to run it through mny tree, but we'll need
explicit acks as I mentioned.

I like getting rid of the pcpu_alloc_bootmem()/pcpu_free_bootmem()
functions. However, let's keep the implementation identical to x86.


I don't think we should get rid of the populate_pte_fn(). I'm not
comfortable changing x86's implementation. Simply offer a NULL, and if
NULL use the default.

Do you have a tree that intel pulls? I suggest cleaning up the patches
and pushing to a remote branch that they pick up. That would have caught
the mips typo. Send a PR creating a file in [1] for your branch, github
is fine. Basic validation needs to be done before I can pick this up
too on more than arm64.

[1] https://github.com/intel/lkp-tests/tree/master/repo/linux

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
