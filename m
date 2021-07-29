Return-Path: <SRS0=H4U1=MV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE6DC432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ABE361040
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jul 2021 04:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ABE361040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b+OYPExuezQkpiM30YOU3nydgZ7lg32Oy02gYJ4UtT4=; b=oMLzxpDKQmIA2pZstvf6eQLh6w
	DQzw4v56SBk7YTg6g0wX0Zx+ZkiGYxyMsX9vrdrCuw2+LbrR64zkeWFe/pftEnkQSNkZOJ5Aig05x
	TgqPokDabDiWQTsThlxj0NAMeKTXyAcEd9FdvImTULVsEIxCerkdjwFz0XbV5VMK+gtDvTtyKy8Bc
	Wt4AXTe2gfHHID4hivp3YxXBz0wGWmP6HE63JLiIdEPMGKW1sEZxwp1tfytQWLtzpSUCBldKTywaF
	7agceoXGDJCS6WYogd9n20E71BFqrYAr8kTHe0gSpNgvishQbkY3DeZhJ7m3aujKj1lX/JAS9Nk9H
	IGtTPeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8xgi-0033xY-Ew; Thu, 29 Jul 2021 04:30:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8xgf-0033wH-DB
 for linux-riscv@lists.infradead.org; Thu, 29 Jul 2021 04:30:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id i10so5448820pla.3
 for <linux-riscv@lists.infradead.org>; Wed, 28 Jul 2021 21:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PPE0zooLgyR9UCdP8xX+4M+xn5NMefkRnT3Z8S+2rxo=;
 b=jVAy9Axj38CP6qzQCubayURG3GC5N6GQpLn7DerOn3bVNLAo5e2aBMRAWBAlFMjEyZ
 4472RxpG50pI67eMjOrpldqqqzhay6vk6Lb7CdtG0zE9KbIZhrZNpknQ7LG3XXrvYvvg
 9+ZSD0KURwgn7rDsa3vOQIlvOF/4bvQlt3z85tXylMVwPsRRQu9cgVkI0mhelF7lUeAk
 xQxAlcTZ1pz36ZJN1RENmEhvawUmrcKaMmggmRUkq9j6Rnz1lCCJOrjmn8RiIMw/CgQ1
 oalmOGZtWH9kw2Qo/EmvQ1AVOxl6Sgao67e78xpQhmKEDKMDx0mtHp7NEy74QZ3RM8bG
 +HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PPE0zooLgyR9UCdP8xX+4M+xn5NMefkRnT3Z8S+2rxo=;
 b=B4zFO981X9YHPQNCyv2IYBCJaVOlSRXFIA8l0pCrng3yF2KOsFwTr0gO7GuH5o9FBd
 UR6Xqez81wzvQjOh82nIFjvd3r0JjImv4VI0lb0QhoA8DdRVr9XESS2Gvat4tIIlUUyI
 MF197Gj8YMaQh/mLU+uRjrYvdw14/nmg0t22nxg9/hAERALVTxOLMeKaCpn7m6vdGJVg
 73OeT8P7VmrI3wQrg/2teI2LPRoCUBmI4LOa//ZuOpPGTDURlhvmfDej92o0cFyYvWrE
 omMoClMFU2bu1z630lUFFmeuckFM2OmxM0OofmgqyQIoxjpXEbjj4zzQOpv+2Q1ZIbkt
 0rlQ==
X-Gm-Message-State: AOAM5319cJHTT3pr8OQYeTgb0s/ROTR5JRwNKiOMQ6yLDOlRM01IwOXx
 8DPlEFYk5Yvf4Y2QIxVKDn+jYA==
X-Google-Smtp-Source: ABdhPJxnCACwbpVayPk6V7fFVJvDGneCsIVO8qAKvIDi/fVY508+0MplapegPRHObLAXo+BVyVhlUA==
X-Received: by 2002:a05:6a00:9a3:b029:355:d45b:ad9a with SMTP id
 u35-20020a056a0009a3b0290355d45bad9amr3098900pfg.73.1627533024171; 
 Wed, 28 Jul 2021 21:30:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z2sm1752300pgl.61.2021.07.28.21.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 21:30:23 -0700 (PDT)
Date: Wed, 28 Jul 2021 21:30:23 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Jul 2021 20:39:59 PDT (-0700)
Subject: Re: [RFC 0/5] Support non-coherent DMA on RISC-V using a global pool
In-Reply-To: <20210723214031.3251801-1-atish.patra@wdc.com>
CC: linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 aou@eecs.berkeley.edu, Christoph Hellwig <hch@lst.de>,
 devicetree@vger.kernel.org, dvyukov@google.com, 
 frowand.list@gmail.com, guoren@linux.alibaba.com,
 iommu@lists.linux-foundation.org, 
 linux-riscv@lists.infradead.org, m.szyprowski@samsung.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 robh+dt@kernel.org, robin.murphy@arm.com, tklauser@distanz.ch
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-11e1ab27-21eb-4b20-9185-c256fcaaab99@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_213025_506830_DCDA3639 
X-CRM114-Status: GOOD (  36.79  )
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

On Fri, 23 Jul 2021 14:40:26 PDT (-0700), Atish Patra wrote:
> RISC-V privilege specification doesn't define an IOMMU or any method modify
> PMA attributes or PTE entries to allow non-coherent mappings yet. In
> the beginning, this approach was adopted assuming that most of the RISC-V
> platforms would support full cache-coherent IO. Here is excerpt from the
> priv spec section 3.6.5
>
> "In RISC-V platforms, the use of hardware-incoherent regions is discouraged
> due to software complexity, performance, and energy impacts."
>
> While some of the RISC-V platforms adhere to the above suggestion, not all
> platforms can afford to build to fully cache-coherent I/O devices. To
> address DMA for non-coherent I/O devices, we need to mark a region of memory
> as non-cacheable. Some of the platforms rely on a fixed region of uncached
> memory that is remapped to the system memory while some other modify
> the PTE entries to achieve that.
>
> The patch3 solves the issue for the fist use case by using a global
> pool of memory that is reserved for DMA. The device access the reserved area
> of the region while corresponding CPU address will be from uncached region
> As the uncached region is remapped to the beginning of the system ram, both
> CPU and device get the same view.
>
> To facilitate streaming DMA APIs, patch 1 introduces a set of generic
> cache operations. Any platform can use the generic ops to provide platform
> specific cache management operations. Once the standard RISC-V CMO extension
> is available, it will also use these generic ops.
>
> To address the second use case, Page Based Memory Attribute (PBMT) extension
> is proposed. Once the extension is in good shape, we can leverage that
> using CONFIG_DIRECT_REMAP. Currently, it is selected via a compile time config
> option. We will probably need another arch specific hooks to know if the
> platform supports direct remap at runtime. For RISC-V, it will check the
> presence of PBMT extension while other arch function will simply return true

IIUC this is another extension that's not yet frozen or implemented in 
hardware?  Is this one compatible with what's in the c906, or is it 
doing things its own way?

> if DIRECT_REMAP is enabled. This is required as arious different config
> (DIRECT_REMAP, GLOBAL_POOL) will be enabled in the defconfig so that a
> unified kernel image can boot on all RISC-V platforms.
>
> This patch series depends on Christoph's global pool support series[1].
> Tested on Qemu, HiFive unleashed and beagleV. This series is also available
> at [2].
> This series also solves the non-coherent DMA support on beagleV but requires
> additional beagleV specific patches[3] which will be upstreamed soon.
>
>
> [1] https://lists.linuxfoundation.org/pipermail/iommu/2021-July/057266.html
> [2] https://github.com/atishp04/linux/tree/riscv_nc_global_pool
> [3] https://github.com/atishp04/linux/tree/wip_beaglev_dma_nc_global
>
> Atish Patra (5):
> RISC-V: Implement arch_sync_dma* functions
> of: Move of_dma_get_range to of_address.h
> dma-mapping: Enable global non-coherent pool support for RISC-V
> dma-direct: Allocate dma pages directly if global pool allocation
> fails
> RISC-V: Support a new config option for non-coherent DMA
>
> arch/riscv/Kconfig                       |  8 +++
> arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
> arch/riscv/mm/Makefile                   |  1 +
> arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
> drivers/of/of_private.h                  | 10 ----
> include/linux/of_address.h               | 12 +++++
> kernel/dma/coherent.c                    | 49 +++++++++++++++---
> kernel/dma/direct.c                      |  7 ++-
> 8 files changed, 152 insertions(+), 20 deletions(-)
> create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
> create mode 100644 arch/riscv/mm/dma-noncoherent.c

Can you guys please make up your minds about how this is going to be 
supported at the ISA level?  I get a different answer every day here: 
sometimes it's that these systems are not compliant, sometimes that 
Linux is the compliance suite, sometimes that we're doing an ISA 
extension, and sometimes that we're doing the SBI stuff.

I don't really care all that much about what the decision is, but it's 
impossible to move forward without some semblance of a plan.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
