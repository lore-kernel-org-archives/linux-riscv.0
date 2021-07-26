Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_RED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3560C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 22:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997CD60F6B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 22:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 997CD60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t98Y5xiff+iO/A21FAkhPpy1L4zXkIWVTXIgIY6eDY=; b=B87qIgMp0dd/F2
	c0bCJIFqU/x+8IGquhRvekivxy4W98fvdc8HT0TQqy+Mcarb/GpJUPSy6eGsB5nF7fJyIPlFtX3R3
	wv/Bett+QL8NQCp7FLC10QsNykDOQYsTetM6RCdoZaDr33xB2Di+rIQJ2GCQbv45dpIk9aDd8JDbw
	VT+jf4u/i//CJKlPsQAp0OsUPcbOvJDci6A5ZId/3grstOq/qPO6ZLbEKrLMZeCZWR3KeIVs13zBl
	e94OW6+2QBDCBnQ8KNKn0ebjbPHmqkjLMYo59K8+04OApSn/Xpf+LK5DliwUX5VUmnFiYcZLDaBqI
	C0iV8qhPkiL3Uj5RZOxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m89OL-00CbbR-G0; Mon, 26 Jul 2021 22:48:09 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m89OI-00Cbap-ES
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 22:48:08 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id m193so17496508ybf.9
 for <linux-riscv@lists.infradead.org>; Mon, 26 Jul 2021 15:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BvsqUUy/O01l4CBRzfrPE1Jc7wO/JNGVxsEuCcHSCWw=;
 b=Oj1mDz93drUb82Y4dwGcG6EgM1Z32HcAKJ4YfgJCNUqNIvF/kV3bQ3NHUCklnTy4SW
 1GD2cx3JJGrezXOK+L9wjvpJ96IV67qydn4ANvKcp7SDWJs80YFbIdORNMRlexi21vaX
 bIzr8ywtm1/QqdYt2jpgnb8HNzTEWOFg+DmXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BvsqUUy/O01l4CBRzfrPE1Jc7wO/JNGVxsEuCcHSCWw=;
 b=Kav3TLpOiPQpDp8xqcd0+2louD3ZV71xPDQnf2QxqA/rro11y/Ayt1m+ktJcJDXc7f
 3IoEhqwWKwzP/OAtxo7b8mNLLmI7KOWXWGT7wJgrstrHTYkthdx8cyHfutmgp81TidX6
 ax/Yj1gxs9qoOMdrMQHNMqyPEKf71yiKdJkVupuXYDh9CsZLdMnyrvh2KXlX0UYzQzG7
 ply0/1qqtphAz20C1PLWcgkH026OCueW3N2nBumZgUKqLfjBcoouTKVptnJy/AYDPOae
 UC2ZUmBF/eBkv9ABmpFo1SlVqqo6Fpak19AFeDnXBtTqR9+5nNze0Bmjgzvk7GVcEvuL
 BfTw==
X-Gm-Message-State: AOAM533ZSEiMT98vmibTVkvOsYkEcT3IdYNKNLe1Z3tAAZ0DkauzkB7a
 Qq2DH6/DJmtIrt6cZtSTmBo/bUhB2TMBut/L9QDW
X-Google-Smtp-Source: ABdhPJz2EUkj2zAeJLmOGn6kDSu8McU02FKdlq3ZbpM5EcX89ffvE35I5g7gwLzw3lEJ0O8h/gzUiEZysEgj2Z7EPDA=
X-Received: by 2002:a25:3289:: with SMTP id y131mr5835871yby.317.1627339684970; 
 Mon, 26 Jul 2021 15:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
 <20210726070030.GB9035@lst.de>
In-Reply-To: <20210726070030.GB9035@lst.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 26 Jul 2021 15:47:54 -0700
Message-ID: <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
To: Christoph Hellwig <hch@lst.de>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Tobias Klauser <tklauser@distanz.ch>, 
 Robin Murphy <robin.murphy@arm.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 iommu@lists.linux-foundation.org, Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_154806_535626_E5EBDB1B 
X-CRM114-Status: GOOD (  30.29  )
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

On Mon, Jul 26, 2021 at 12:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Jul 23, 2021 at 02:40:29PM -0700, Atish Patra wrote:
> > Currently, linux,dma-default is used to reserve a global non-coherent pool
> > to allocate memory for dma operations. This can be useful for RISC-V as
> > well as the ISA specification doesn't specify a method to modify PMA
> > attributes or page table entries to define non-cacheable area yet.
> > A non-cacheable memory window is an alternate options for vendors to
> > support non-coherent devices.
>
> Please explain why you do not want to use the simply non-cachable
> window support using arch_dma_set_uncached as used by mips, niops2 and
> xtensa.
>

arch_dma_set_uncached works as well in this case. However, mips,
niops2 & xtensa uses a
fixed (via config) value for the offset. Similar approach can't be
used here because the platform specific
offset value has to be determined at runtime so that a single kernel
image can boot on all platforms.
That's why we need the following additional changes for RISC-V to make it work.

1. a new DT property so that arch specific code is aware of the
non-cacheable window offset.
    - either under /chosen node or a completely separate node with
multiple non-cacheable window support
   We also need to define how it is going to referenced from
individual device if a per-device non-cacheable
   window support is required in future. As of now, the beagleV memory
region lies in 0x10_0000_00000 - x17_FFFF_FFFF
   which is mapped to start of DRAM 0x80000000. All of the
non-coherent devices can do 32bit DMA only.

2. Use the dma-ranges and modify the arch_dma_set_uncached function to
pass the struct device as an argument.

Either way, we will need arch specific hook ups and additional changes
while the global non-coherent pool
provides a more elegant solution without any additional arch specific code.

If arch_dma_set_uncached is still preferred way to solve this problem,
I can revise the patch with either approach 1 or approach 2

> > +static int __dma_init_global_coherent(phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)
>
>
>
>
> >  {
> >       struct dma_coherent_mem *mem;
> >
> > -     mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> > +     if (phys_addr == device_addr)
> > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> > +     else
> > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
>
> Nak.  The phys_addr != device_addr support is goign away.  This needs

ok.

> to be filled in using dma-ranges property hanging of the struct device.

struct device is only accessible in rmem_dma_device_init. I couldn't
find a proper way to access it during
dma_reserved_default_memory setup under global pool.

Does that mean we should use a per-device memory pool instead of a
global non-coherent pool ?

> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
