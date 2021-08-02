Return-Path: <SRS0=JNkM=MZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A8CC4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 18:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E9C60F36
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 18:23:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91E9C60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eX6F+h84kKpGWpcWIwpcJI+UW2UfzkmDcO+Atqfspg=; b=hBzA7au/dJVx8j
	AFpd6CLqk/CtawSBD+Mg/hrtoJZ468qwPauZdD90G6LlyIV1I4VL8Z83sS+YlPLOVrQO0Yr3XezjL
	fjYrOOjE17PoJir5ICVodKXwoPp3Re5/lPEytQbH9uxCtxa0W7U/bTKIHMnIuMu4sE1g02GVV60sb
	vfBhlWBhMDWUrEcbwUsAYsm9xGrIs7M0tU6DOn1b42P5zrKr+wO2jpLg2tXfuavloQTzZxs3C42/8
	tPLl+i+FONssVwaM5Glh9X8n3U+bZSGfbO4rT5EL1q+ZHSa8St6GGvif0GjCGrAeVckIXLhYj3yTY
	VCXmSwnj2GsE2BIHI7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAcaY-00HUqa-24; Mon, 02 Aug 2021 18:22:58 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAcaV-00HUq1-67
 for linux-riscv@lists.infradead.org; Mon, 02 Aug 2021 18:22:56 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id f26so9264309ybj.5
 for <linux-riscv@lists.infradead.org>; Mon, 02 Aug 2021 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WpAP0boYKgMSl+EEAfMqGAcS1DBVrnYXR6p3McRuuF8=;
 b=KlMxq4MfUxuE4wxvHzy/b64JIYB/khWpUguGIPzgKEmNeHHmr5FP9tLSQwLDHvPx0w
 +x0/5c2lijkljpgCsjjcQDt4QDKuZuv5UY3N4tLODMVHOqjtqHyJqJqMoKjhwD+8gYsw
 f5f6DaG0rlmzwPVYqNg3BSwoYkx90Nnb5bHKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WpAP0boYKgMSl+EEAfMqGAcS1DBVrnYXR6p3McRuuF8=;
 b=YWOyi96A9gfJ13NjpB0RnJH+KwJoN45p4q5en1hS/2G6uaAMUSAxivDJAmR5AEVWr1
 oH8vyFcmAA80uWTtBFBpPmFVCnbLenT/i7Vu6Hl+aWaWV5TO38PHyp0Y7GrKExK2V9p9
 FYj86TiNoOze34VEABfU4cXFamqi3Z4oYEf7jQcxkO+Sp/vU3obYovJyaSD1CR/XEVb4
 eaSajGO/3Z/3HgrZ7t9ZBfa6PGrqlnsk+bRxOPkqyAB2IweSKKESOs+YUgSR0vsBpbLM
 rv1ge6xPQTJ20o41G1cxKTkyBZ+/RlCEy+PjWN5aD5EIY2fUcXcCkZLTdSYPkhQ8Fjlp
 Zc9A==
X-Gm-Message-State: AOAM533gvbGtRkj3nOy6iVZZPldmGgc4rJxBKU40ptGv9nO/YO748vdS
 AuszNBAeRkoObRjMw+GNVOOefYhuKKrUWgVzgh+3
X-Google-Smtp-Source: ABdhPJynNZIyUvDVGGyRh+IbdUlssdg8o1eWgR0yeR8vNlVh2L5U96YBAQGX7dRj9k0KPeGehWEsCQ07LvSHzf9+hAY=
X-Received: by 2002:a25:84c7:: with SMTP id x7mr21646394ybm.447.1627928573559; 
 Mon, 02 Aug 2021 11:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
 <20210726070030.GB9035@lst.de>
 <CAOnJCU+qRznBTn9Mt6t_DE6UUz6_LuaBBuOmnURS2Yh3pmpjvg@mail.gmail.com>
 <20210727085244.GA20609@lst.de>
In-Reply-To: <20210727085244.GA20609@lst.de>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 2 Aug 2021 11:22:42 -0700
Message-ID: <CAOnJCUJgCHOR5nifNVjkQawKniGf81Zvsh226brdAPuLNkXAdQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210802_112255_313134_7D492208 
X-CRM114-Status: GOOD (  32.68  )
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

On Tue, Jul 27, 2021 at 1:52 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jul 26, 2021 at 03:47:54PM -0700, Atish Patra wrote:
> > arch_dma_set_uncached works as well in this case. However, mips,
> > niops2 & xtensa uses a
> > fixed (via config) value for the offset. Similar approach can't be
> > used here because the platform specific
> > offset value has to be determined at runtime so that a single kernel
> > image can boot on all platforms.
>
> Nothing in the interface requires a fixed offset.  And using the offset
> has one enormous advantage in that there is no need to declare a
> statically sized pool - allocations are fully dynamic.  And any kind of
> fixed pool tends to cause huge problems.
>
> > 1. a new DT property so that arch specific code is aware of the
> > non-cacheable window offset.
>
> Yes.
>
> > individual device if a per-device non-cacheable
> >    window support is required in future. As of now, the beagleV memory
>
> If you require a per-device noncachable area you can use the per-device
> coherent pools.  But why would you want that?
>
> > region lies in 0x10_0000_00000 - x17_FFFF_FFFF
> >    which is mapped to start of DRAM 0x80000000. All of the
> > non-coherent devices can do 32bit DMA only.
>
> Adjust ZONE_DMA32 so that it takes the uncached offset into account.
>
> > > > -     mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> > > > +     if (phys_addr == device_addr)
> > > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> > > > +     else
> > > > +             mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);
> > >
> > > Nak.  The phys_addr != device_addr support is goign away.  This needs
> >
> > ok.
> >
> > > to be filled in using dma-ranges property hanging of the struct device.
> >
> > struct device is only accessible in rmem_dma_device_init. I couldn't
> > find a proper way to access it during
> > dma_reserved_default_memory setup under global pool.
> >
> > Does that mean we should use a per-device memory pool instead of a
> > global non-coherent pool ?
>
> Indeed, that would be a problem in this case.  But if we can just
> use the uncached offset directly I think everything will be much
> simpler.

Yes. I was planning to change this to use an uncached offset.
However, the planned mass production for beaglev starlight sbc is
cancelled now [1].
As there is no other board that requires an uncached offset, I don't
think there is no usecase
for adding uncached offset support for RISC-V right now. I will
revisit(hopefully we don't have to)
this in case any platform implements uncached window support in future.

[1] https://www.cnx-software.com/2021/07/31/beaglev-starlight-sbc-wont-be-mass-manufactured-redesigned-beaglev-risc-v-sbc-expected-in-q1-2022/
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
