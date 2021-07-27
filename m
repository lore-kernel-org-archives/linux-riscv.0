Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9A5C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 08:53:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EA56124E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 08:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80EA56124E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKT7+/1SnhvD43y02vZ+YuDyL5eWWevDgDZXlDz3KHc=; b=JF/oy5S/lKGt6r
	7bFs9pkREe3tVMAEqYoe+YMsX+NHuuT+NhAQ7ncfmIsKEHR3NUcXwF38MpTaZ9a1Ht/iqspRzj5xb
	cmwCMN+Zvldk05Q4T6oIsZqzDHPIDuayymDIuT/oe/yfjbwz8K/1W4p2jRb6mvAGZG7Rtu3G46+ne
	GQYWU12HNC8aDsPGfsR6cppTy753pih9wKPlCcfs1ZMtI/8C1/OFYvDBHvfl0hxPAj3GfSvZXULn5
	ASjqtCm5BNYDIRbl0x29D8PYISuk4JIEht2+d8Gckr3GKo50FfeaopG9oE+/VrGgE2KOOaOGsgneD
	b5czJZflsNkw3cGrXNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Ipb-00E81R-2E; Tue, 27 Jul 2021 08:52:55 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8IpY-00E7zy-8t
 for linux-riscv@lists.infradead.org; Tue, 27 Jul 2021 08:52:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9A8A16736F; Tue, 27 Jul 2021 10:52:44 +0200 (CEST)
Date: Tue, 27 Jul 2021 10:52:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: Christoph Hellwig <hch@lst.de>, Atish Patra <atish.patra@wdc.com>,
 devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Tobias Klauser <tklauser@distanz.ch>, Robin Murphy <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, iommu@lists.linux-foundation.org,
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
Message-ID: <20210727085244.GA20609@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com> <20210726070030.GB9035@lst.de>
 <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_015252_550558_9F545678 
X-CRM114-Status: GOOD (  25.54  )
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

On Mon, Jul 26, 2021 at 03:47:54PM -0700, Atish Patra wrote:
> arch_dma_set_uncached works as well in this case. However, mips,
> niops2 & xtensa uses a
> fixed (via config) value for the offset. Similar approach can't be
> used here because the platform specific
> offset value has to be determined at runtime so that a single kernel
> image can boot on all platforms.

Nothing in the interface requires a fixed offset.  And using the offset
has one enormous advantage in that there is no need to declare a
statically sized pool - allocations are fully dynamic.  And any kind of
fixed pool tends to cause huge problems.

> 1. a new DT property so that arch specific code is aware of the
> non-cacheable window offset.

Yes.

> individual device if a per-device non-cacheable
>    window support is required in future. As of now, the beagleV memory

If you require a per-device noncachable area you can use the per-device
coherent pools.  But why would you want that?

> region lies in 0x10_0000_00000 - x17_FFFF_FFFF
>    which is mapped to start of DRAM 0x80000000. All of the
> non-coherent devices can do 32bit DMA only.

Adjust ZONE_DMA32 so that it takes the uncached offset into account.

> > > -     mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> > > +     if (phys_addr == device_addr)
> > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> > > +     else
> > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
> >
> > Nak.  The phys_addr != device_addr support is goign away.  This needs
> 
> ok.
> 
> > to be filled in using dma-ranges property hanging of the struct device.
> 
> struct device is only accessible in rmem_dma_device_init. I couldn't
> find a proper way to access it during
> dma_reserved_default_memory setup under global pool.
> 
> Does that mean we should use a per-device memory pool instead of a
> global non-coherent pool ?

Indeed, that would be a problem in this case.  But if we can just
use the uncached offset directly I think everything will be much
simpler.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
