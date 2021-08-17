Return-Path: <SRS0=wXHl=NI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F84C432BE
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 06:43:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77ABE60F5C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 06:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77ABE60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyaRFYRQB04v9ywIj99nr2yWs4+bXKJGLSJOTKcHAiU=; b=J3/Va+JUDGz+BY
	eRKr/Uxj58zeMN99UuHwvrPzy1lAkgMp+LWmGedMAZIbUT3Frim5rmHeCsIVJtxcXTaMzVx4eC2IY
	s/GiYq/NWFyJiQ+QpF5C3AFJZ6G20nY3dK2NZqwyDbLdwXiMh1jSN3oTpdYg8Au6MwpNPEwWzYR1w
	AzxwMNm27+eE3WeYp1mNcI92RfgLGtjH97trH6u4JmXdYXnJJBIVkOo2hq8UPhPXSDKUWKA8EFMko
	UW9i9dGn+ZhKSgwCSku9YcD3dF/zjBAl5x3e3PSEeMJK/E0jWfFrQctoYe9xhFf5mG4EW3l1GvUDc
	rFz80y7TYcsYNg0XfFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFsoS-001FqA-Da; Tue, 17 Aug 2021 06:43:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFsoM-001Fop-My
 for linux-riscv@lists.infradead.org; Tue, 17 Aug 2021 06:43:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A903060FA0
 for <linux-riscv@lists.infradead.org>; Tue, 17 Aug 2021 06:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629182577;
 bh=34kp4aM/l1m2Tcf3HPRzMsU+Qjm7SBbDZ+vfVjP0k68=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=em7OVWB0LXXoEkZj+7aVx8B1E1D67tQSL6OX4f+dHqChjCEjhrSAvSok8N3KDb1X+
 8Lz/brwOx2Rcf19O+KjApL8P+bh62fHA6DN24/h9K0J7B5VKQb49oG2Rirv2txSbCc
 QAMyasSG09HqF85es7WeGM682pqEIetcF0Y+cSKAf7nClOVihor6yDEz7Tj4Sr6duD
 3xoYKPE52tpTTFBzHKacv6iElMiH+mLSXaZ+f0TFDBej2Vb2ayxsgUAvjPTQ7G155w
 JskvhvTbO6PYs/cphBr2W0xSw+8RoiB3RjtCqoFHSTuhpl06l6LnvppvOlmmJ68lGD
 W3bnCwBqavuhQ==
Received: by mail-lj1-f169.google.com with SMTP id n7so31364297ljq.0
 for <linux-riscv@lists.infradead.org>; Mon, 16 Aug 2021 23:42:57 -0700 (PDT)
X-Gm-Message-State: AOAM5339+xzNLsp+P1+OIFEWTcHvZ6jPQ3AVsXknP9Zx2FXqNIaJkIOr
 SW9mnNhBwOMu/3DIU6kbRnScuszsAkyQ5iIpDOo=
X-Google-Smtp-Source: ABdhPJwvsYfSVRDvML5GBFkxuHQ4HPPPDvI93w9Qkrgmn64TslSnV1FfYdlixNxLaOPZYsYFJBQJNRHbaA29pbEiUZk=
X-Received: by 2002:a05:651c:150a:: with SMTP id
 e10mr1793800ljf.285.1629182575957; 
 Mon, 16 Aug 2021 23:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <mhng-11e1ab27-21eb-4b20-9185-c256fcaaab99@palmerdabbelt-glaptop>
 <CAOnJCU+ip1ccc9CrREi3c+15ue4Grcq+ENbQ+z_gh3CH249aAg@mail.gmail.com>
 <CAJF2gTSMtj05cduTZ6jEqDXtaG0QTY743MRQrv08B4cocZbXJQ@mail.gmail.com>
 <CAOnJCUKPitLD1g1LocTw8H+G7hg04-=Dd3biHGgDPMwer2cFpw@mail.gmail.com>
In-Reply-To: <CAOnJCUKPitLD1g1LocTw8H+G7hg04-=Dd3biHGgDPMwer2cFpw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 17 Aug 2021 14:42:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQcGiudC6X=xN-0U=wuVLE2jthjuY8R7BDo1CZTTZbuVA@mail.gmail.com>
Message-ID: <CAJF2gTQcGiudC6X=xN-0U=wuVLE2jthjuY8R7BDo1CZTTZbuVA@mail.gmail.com>
Subject: Re: [RFC 0/5] Support non-coherent DMA on RISC-V using a global pool
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Tobias Klauser <tklauser@distanz.ch>, 
 Robin Murphy <robin.murphy@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Atish Patra <Atish.Patra@wdc.com>, iommu@lists.linux-foundation.org, 
 Guo Ren <guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, 
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_234258_829994_004D39A9 
X-CRM114-Status: GOOD (  67.14  )
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

On Tue, Aug 17, 2021 at 11:28 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Aug 16, 2021 at 6:37 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > 1
> >
> > On Thu, Jul 29, 2021 at 2:19 PM Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > On Wed, Jul 28, 2021 at 9:30 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > >
> > > > On Fri, 23 Jul 2021 14:40:26 PDT (-0700), Atish Patra wrote:
> > > > > RISC-V privilege specification doesn't define an IOMMU or any method modify
> > > > > PMA attributes or PTE entries to allow non-coherent mappings yet. In
> > > > > the beginning, this approach was adopted assuming that most of the RISC-V
> > > > > platforms would support full cache-coherent IO. Here is excerpt from the
> > > > > priv spec section 3.6.5
> > > > >
> > > > > "In RISC-V platforms, the use of hardware-incoherent regions is discouraged
> > > > > due to software complexity, performance, and energy impacts."
> > > > >
> > > > > While some of the RISC-V platforms adhere to the above suggestion, not all
> > > > > platforms can afford to build to fully cache-coherent I/O devices. To
> > > > > address DMA for non-coherent I/O devices, we need to mark a region of memory
> > > > > as non-cacheable. Some of the platforms rely on a fixed region of uncached
> > > > > memory that is remapped to the system memory while some other modify
> > > > > the PTE entries to achieve that.
> > > > >
> > > > > The patch3 solves the issue for the fist use case by using a global
> > > > > pool of memory that is reserved for DMA. The device access the reserved area
> > > > > of the region while corresponding CPU address will be from uncached region
> > > > > As the uncached region is remapped to the beginning of the system ram, both
> > > > > CPU and device get the same view.
> > > > >
> > > > > To facilitate streaming DMA APIs, patch 1 introduces a set of generic
> > > > > cache operations. Any platform can use the generic ops to provide platform
> > > > > specific cache management operations. Once the standard RISC-V CMO extension
> > > > > is available, it will also use these generic ops.
> > > > >
> > > > > To address the second use case, Page Based Memory Attribute (PBMT) extension
> > > > > is proposed. Once the extension is in good shape, we can leverage that
> > > > > using CONFIG_DIRECT_REMAP. Currently, it is selected via a compile time config
> > > > > option. We will probably need another arch specific hooks to know if the
> > > > > platform supports direct remap at runtime. For RISC-V, it will check the
> > > > > presence of PBMT extension while other arch function will simply return true
> > > >
> > > > IIUC this is another extension that's not yet frozen or implemented in
> > > > hardware?  Is this one compatible with what's in the c906, or is it
> > > > doing things its own way?
> > >
> > > Hi Palmer,
> > > This series doesn't implement the PBMT extension which is still in discussion.
> > > It simply reuse the existing non-coherent dma mapping support in
> > > upstream kernel and enable
> > > it for RISC-V. The current version uses a non-coherent global pool. I
> > > will update it to use arch_set_uncached
> > > as per Christoph's suggestion. It solves the non-coherent DMA problem
> > > for beagleV and not c906.
> > >
> > > I briefly mentioned the PBMT extension just to provide an idea how the
> > > RISC-V Linux kernel
> > > can support both unached window and PBMT extension. PBMT extension is
> > > planned to be frozen
> > > by the end of this year and none of the hardware has implemented it.
> > >
> > > The implementation in c906 is a non-standard one and will not be
> > > supported by the default PBMT
> > > extension implementation.
> > The default PBMT & c908 PBMT are similar, only BIT definitions are
> > different. I propose to support default PBMT first and give the back
> > door to modify the PBMT definition during boot.
> > The "protection_map[] = (__P000, __P001 ..__S000, __S001)" in
> > mm/mmap.c has been modified by arch/mips, arm, sparc, x86, so I think
> > it's proper solution direction.
> >
> > The reset problem is how to passing custom PBMT at the very early boot
> > stage. Now I'm trying to use the DTS parsing instead of boot param hdr
> > which Anup objected to.
> >
>
> IIRC, c906 has a compatible mode that has the compliant PTE bit modifications.
> Can you use that mode iOn the Allwinner D1 board to boot Linux ? I am
> not sure if you have any fallback method for non-coherent DMA
> if custom DMA_COHERENT bits are not enabled through enhanced mode ?
We need custom PBMT(enhanced mode) to enable the dma driver on D1
(GMAC, USB, EMMC) or these drivers couldn't work.
D1 hasn't any uncached region in SOC design.

>
> > ref: https://lore.kernel.org/linux-riscv/1623693067-53886-1-git-send-email-guoren@kernel.org/
> >
> > Any comments are welcome.
> >
> > >
> > >
> > > >
> > > > > if DIRECT_REMAP is enabled. This is required as arious different config
> > > > > (DIRECT_REMAP, GLOBAL_POOL) will be enabled in the defconfig so that a
> > > > > unified kernel image can boot on all RISC-V platforms.
> > > > >
> > > > > This patch series depends on Christoph's global pool support series[1].
> > > > > Tested on Qemu, HiFive unleashed and beagleV. This series is also available
> > > > > at [2].
> > > > > This series also solves the non-coherent DMA support on beagleV but requires
> > > > > additional beagleV specific patches[3] which will be upstreamed soon.
> > > > >
> > > > >
> > > > > [1] https://lists.linuxfoundation.org/pipermail/iommu/2021-July/057266.html
> > > > > [2] https://github.com/atishp04/linux/tree/riscv_nc_global_pool
> > > > > [3] https://github.com/atishp04/linux/tree/wip_beaglev_dma_nc_global
> > > > >
> > > > > Atish Patra (5):
> > > > > RISC-V: Implement arch_sync_dma* functions
> > > > > of: Move of_dma_get_range to of_address.h
> > > > > dma-mapping: Enable global non-coherent pool support for RISC-V
> > > > > dma-direct: Allocate dma pages directly if global pool allocation
> > > > > fails
> > > > > RISC-V: Support a new config option for non-coherent DMA
> > > > >
> > > > > arch/riscv/Kconfig                       |  8 +++
> > > > > arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
> > > > > arch/riscv/mm/Makefile                   |  1 +
> > > > > arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
> > > > > drivers/of/of_private.h                  | 10 ----
> > > > > include/linux/of_address.h               | 12 +++++
> > > > > kernel/dma/coherent.c                    | 49 +++++++++++++++---
> > > > > kernel/dma/direct.c                      |  7 ++-
> > > > > 8 files changed, 152 insertions(+), 20 deletions(-)
> > > > > create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
> > > > > create mode 100644 arch/riscv/mm/dma-noncoherent.c
> > > >
> > > > Can you guys please make up your minds about how this is going to be
> > > > supported at the ISA level?  I get a different answer every day here:
> > > > sometimes it's that these systems are not compliant, sometimes that
> > > > Linux is the compliance suite, sometimes that we're doing an ISA
> > > > extension, and sometimes that we're doing the SBI stuff.
> > > >
> > >
> > > I am not sure whom you have talked to. I would be happy to set up a
> > > meeting so that everybody is on
> > > the same page if you are getting different answers every time.
> > >
> > > > I don't really care all that much about what the decision is, but it's
> > > > impossible to move forward without some semblance of a plan.
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> > >
> > >
> > > --
> > > Regards,
> > > Atish
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
>
>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
