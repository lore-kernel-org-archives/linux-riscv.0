Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3133DC4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 07:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11D661055
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 07:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E11D661055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IyiKX3CQNUwdIL6g4bNe3wNX46TgIANZPYN7sgGr3w=; b=H2e45MADSlAxzO
	6cu4YCCW00DbGBzn9Bz7hYIrWnKztDUP37elo3NRP0Qrprssj8iseHt9lmyno5VVX56NmyhT2GYk+
	rpMrL3cn51bH5j/Sv1ocgnCECSdl71f05ukXqPKjYfKZV8dXfgHetcGXU9b4h9Vz0+o30Zds9W37k
	OfBeRPJOolBmAPBkaPJ8ImFF0XRAxskqrboDCwFAtBKMG9tWtMD0m7RbaiBNn0wEfeBIEMiocufpU
	UhtBpQKXxSbsC0GBDO+nG3Ms4gNL2zjEoHk0mEdzL32QvN1xkgALeCMjruq5a8xUe/OjvT0sHZRV8
	bMaKNWATyZGoSNPhHfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD02W-00HQ87-7K; Mon, 09 Aug 2021 07:49:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD02S-00HQ7M-WB
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 07:49:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0553461058
 for <linux-riscv@lists.infradead.org>; Mon,  9 Aug 2021 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628495376;
 bh=q/S/ccLXHytgWzYsEEYPeb1axvMFlx+hkfDx9JyqjhI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZXkLPeDSnu/5fSVRxKq0MAg7wIhU9SY3SUjybAvltMCLBCcoXhz08WyVaEetNEy8O
 eyMorI6OqeuXLwlS4DFnzwkr/53N5tAv/hau8SIZ2UcyM00eKIEXtPQapzBSomI/s6
 IB0VrFfCIJV4LcEnhMlmTJArCU0HpC3W/D3EaNtEqG7jXOMJ/7jTcM5ELT7KXHAQgO
 3kC8CaJKV3XrUVg+/Fzds11q7/0sDUpAS2UZoxvHra0RbbxZTmZoQgtVO+li9uoVdr
 ZbD7NiTkgToVF3oc4zdn63svc3dtk75DvHp5JKmqdPRhn68B2iAxM13/xy9KMk+AdI
 wFhqRAgwA/Pug==
Received: by mail-wr1-f52.google.com with SMTP id n12so10067944wrr.2
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 00:49:35 -0700 (PDT)
X-Gm-Message-State: AOAM5316urExf2nMqZOdRFcJktgxcb5fPrLTcXUN0R02zArZey+gyefB
 /B/Y4HOFA75sJKbLQ2bdARBEAQcbFADkjck7VYY=
X-Google-Smtp-Source: ABdhPJwK0fcoyVP2S8sGrZY8yRoZXSzaTqRROq5Jut72S+v1w47Bga5OiaWNKFfeoKGo83RQrK3xtnVhG0enY+78Ey0=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr24684354wrr.105.1628495374617; 
 Mon, 09 Aug 2021 00:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210807145537.124744-1-xianting.tian@linux.alibaba.com>
 <20210809003044.6692ddce@xhacker>
 <c09fc86d-1e6a-3315-7489-9e269935ba55@linux.alibaba.com>
In-Reply-To: <c09fc86d-1e6a-3315-7489-9e269935ba55@linux.alibaba.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 9 Aug 2021 09:49:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
Message-ID: <CAK8P3a1wyhLp1hUUotzwqc1pyCyfWhO7O_pvt5O_U=qZp-ZhnA@mail.gmail.com>
Subject: Re: [PATCH] riscv: add ARCH_DMA_MINALIGN support
To: Xianting TIan <xianting.tian@linux.alibaba.com>
Cc: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_004937_109021_563BFBB5 
X-CRM114-Status: GOOD (  22.60  )
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

On Mon, Aug 9, 2021 at 8:20 AM Xianting TIan
<xianting.tian@linux.alibaba.com> wrote:
>
> >> +#define ARCH_DMA_MINALIGN   L1_CACHE_BYTES
> > It's not a good idea to blindly set this for all riscv. For "coherent"
> > platforms, this is not necessary and will waste memory.
>
> I checked ARCH_DMA_MINALIGN definition,  "If an architecture isn't fully
> DMA-coherent, ARCH_DMA_MINALIGN must be set".
>
> so that the memory allocator makes sure that kmalloc'ed buffer doesn't
> share a cache line with the others.
>
> Documentation/core-api/dma-api-howto.rst
>
> 2) ARCH_DMA_MINALIGN
>
>     Architectures must ensure that kmalloc'ed buffer is
>     DMA-safe. Drivers and subsystems depend on it. If an architecture
>     isn't fully DMA-coherent (i.e. hardware doesn't ensure that data in
>     the CPU cache is identical to data in main memory),
>     ARCH_DMA_MINALIGN must be set so that the memory allocator
>     makes sure that kmalloc'ed buffer doesn't share a cache line with
>     the others. See arch/arm/include/asm/cache.h as an example.
>
>     Note that ARCH_DMA_MINALIGN is about DMA memory alignment
>     constraints. You don't need to worry about the architecture data
>     alignment constraints (e.g. the alignment constraints about 64-bit
>     objects).

The platform spec [1] says about this:

| Memory accesses by I/O masters can be coherent or non-coherent
| with respect to all hart-related caches.

So the kernel in its default configuration can not assume that DMA is
cache coherent on RISC-V. Making this configurable implies that
a kernel that is configured for cache-coherent machines can no longer
run on all hardware that follows the platform spec.

We have the same problem on arm64, where most of the server parts
are cache coherent, but the majority of the low-end embedded devices
are not, and we require that a single kernel ran run on all of the above.

One idea that we have discussed several times is to start the kernel
without the small kmalloc caches and defer their creation until a
later point in the boot process after determining whether any
non-coherent devices have been discovered. Any in-kernel structures
that have an explicit ARCH_DMA_MINALIGN alignment won't
benefit from this, but any subsequent kmalloc() calls can use the
smaller caches. The tricky bit is finding out whether /everything/ on
the system is cache-coherent or not, since we do not have a global
flag for that in the DT. See [2] for a recent discussion.

       Arnd

[1] https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-spec.adoc#architecture
[2] https://lore.kernel.org/linux-arm-kernel/20210527124356.22367-1-will@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
