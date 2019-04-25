Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A029C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649BB208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 09:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q68YqA4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649BB208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pfyX3wZIqzNrFMCfLMZWmvliIZ18FtG0FWYsCQqylY=; b=q68YqA4MzKjMg7
	JuAxpwCKVsMKqrxnlTVM2hleMJkOgyQTYzasBmCfIzBI8atfKJe80oxvKWRJersEp/c0FW0GzDcNK
	3yFu/EcRTwOcaIfGKRC4pi2uRCfQq53GFLWNlOczlwTOyxVzbDV5jjkgu6PPWxNqvgP6k6FabiBBz
	NcDxXy1h7OLOnZqOGwm1ki8TfB6XR5fD11oOo31JIdHi2YiQsMOXsfHHQK6CsVGxoD6FmG6sBHyVZ
	8/C6qKrUxca+tK2unH4aFqZUa4+v3TUkND9gDk1C/HuG8YW/4rr65kuAMrw4CGd+bwaVwLi6V1tVR
	vfw0HIyZWNQR+xQ29ARA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJb1W-00075n-Ah; Thu, 25 Apr 2019 09:50:34 +0000
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJb1T-000751-0s
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 09:50:32 +0000
Received: by mail-qt1-f194.google.com with SMTP id p20so23657287qtc.9
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 02:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbxWpLWKIwRpFlHLQpE/7eUBEau8QkMM1CkcgIZY8n0=;
 b=Gzm0tE8rS57BN+ixqX2pFPuTrIyDEHcla9m36skLBnO8fCl+I3W2qCiD3Nn8odj96X
 JqkeNcXKkWiGckaBDLk3GyDvXn/m6/dcAqjOHHbjA7HcJ50o3Huth3flXC0cTX0cRWej
 DRdrH4AJlJFauM7MHZLRWjTd+v8wBtrHY0I5kDw1N92WMzQxlPSY8afkHIyJbrqckr7c
 LavoyGuRScUegDwFvYHmbVe9yIptxZsB9VkY5THkhR+HZNGqfzgKj1SSPdlWAHbpknAG
 nDfs0CXBPv65KomAmzB+sX5GraKtwGQqhHn6Yk/XQaeCYL3uL0Ru/4UCLhl4Z8avvBaH
 EXWQ==
X-Gm-Message-State: APjAAAUXeg1SvLUAotppV7HPB7CrAT48gpPWapygfwMwsD08+U4oNEJ9
 ev9mB/yCqRT5DlIgpQXyPpkFXeINXEAhpvWeW64=
X-Google-Smtp-Source: APXvYqyOey7210Fu7vyUZmQh8Qn/2HLJRU5+Jv+RdBNIAeT0mrnxCT0c3EgvIDlhs0eX1rrHfV66lHE5kMmrThNu2Vg=
X-Received: by 2002:a0c:ebc2:: with SMTP id k2mr10610167qvq.149.1556185829097; 
 Thu, 25 Apr 2019 02:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <1555947870-23014-1-git-send-email-guoren@kernel.org>
 <20190422161814.GA30694@lst.de> <20190423001348.GA31639@guoren-Inspiron-7460>
 <20190423055548.GA12365@lst.de> <20190423154642.GA16001@guoren-Inspiron-7460>
 <d1988350-7da9-37bb-3d8b-93bedea0b732@garyguo.net>
 <20190424020803.GA27332@guoren-Inspiron-7460>
 <LO2P265MB0847C9F08481E25DABC77335D63C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190424055703.GA3417@guoren-Inspiron-7460>
 <4e6b0816-3fe9-8c0b-a749-f7f6ef7e5742@garyguo.net>
 <20190424142306.GB20974@lst.de>
In-Reply-To: <20190424142306.GB20974@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Apr 2019 11:50:11 +0200
Message-ID: <CAK8P3a36V93mKLuR-6hZzNX+j0HVpR_9bM41653PQuD+1xMTVw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Support non-coherency memory model
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_025031_065332_E5D89265 
X-CRM114-Status: GOOD (  18.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Andrew Waterman <andrew@sifive.com>,
 "tech-privileged@lists.riscv.org" <tech-privileged@lists.riscv.org>,
 Anup Patel <anup.patel@wdc.com>, Xiang Xiaoyan <xiaoyan_xiang@c-sky.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincentc@andestech.com>,
 "ren_guo@c-sky.com" <ren_guo@c-sky.com>, Guo Ren <guoren@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Scott Wood <swood@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 24, 2019 at 4:23 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Apr 24, 2019 at 12:45:56PM +0000, Gary Guo wrote:
> > The RISC-V privileged spec is explicitly designed to allow the
> > techniques described above (this is the sole purpose of MSTATUS.TVM). It
> > might be as high performance as a hardware with H-extension, but is
> > definitely a legit use case. In fact, it is vital for use cases like
> > recursive virtualization.
> >
> > Also, I believe the PTE format of RISC-V is already frozen -- therefore
> > it is impossible now to merge GLOBAL and USER bit, nor to replace RSW
> > bit with another bit.
>
> Yes, I do not think we can just repurpose a bit.  Even using a currently
> unused one would require some gymnastics.
>
> That being said IFF we want to support non-coherent DMA (and I think we
> do as people glue together their SOCs using shoestring and paper clips,
> as already demonstrated by Andes and C-SKY in RISC-V space, and most
> arm, mips and ppc SOCs) we need something like this flag.  The current
> RISC-V method that only allows M-mode to set up such attributes on
> a small number or PMP regions just doesn't work well with the way how
> Linux and most non-trivial OSes implement DMA memory allocations.
>
> Note that I said well - in theory we can have a firmware provided
> uncached pool - that is what Linux does on most nommu (that is without
> pagetables) ports, but the fixed sized pool really does suck and will
> make users very unhappy.

You could probably get away with allowing uncached mappings only
for huge pages, and using one or two of the bits the PMD for it.
This should cover most use cases, since in practice coherent allocations
tend to be either small and rare (device descriptors) or very big
(frame buffer etc), and both cases can be handled with hugepages
and gen_pool_alloc, possibly CMA added in since there will likely
not be an IOMMU either on the systems that lack cache coherent DMA.

One downside is that you need a little more care for drivers that
use dma_mmap_coherent() to expose coherent buffers to user space.

Two other points about the proposal:
- Aside from completely uncached/unbuffered mappings, you typically
  want uncached/buffered mappings to cover dma_alloc_wc() that is
  typically used for frame buffers etc that need write-combining to get
  acceptable performance
- you need to decide what is supposed to happen when there are
  multiple conflicting mappings for the same physical address.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
