Return-Path: <SRS0=nw+9=RD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C289C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 23:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BE820851
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Feb 2019 23:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQvhSuOx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iMKKcH1t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42BE820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBdi028Mm03bh/YLfKn3DWysD6KBZermsIYcCTBefXo=; b=NQvhSuOx8Z393E
	njh7/OVvRc5Qv8FJTTtHuQMjpuBM5lvH6/AWpe/7uoAzhw5O94thxr3gqKw7kiTYQIZs7NrT4jieQ
	7f1ZAXPisqHkW6fDZEi6c5nDjpWmNDrmtKLWi+p9qm0vKDWwMgZrolDUyCMWc6eph3OHFarJXldWp
	Fa2FUoG3TZpTRNgdpvsbDw/2/yqbqXSfq9PCKmPZJN90G4VauXcTXiOeDCHeXB+xXCct0ik+dj++p
	xfxfVy8gB3BJM9FY+AehF/xre7Eq+ziRa4RsUQFFwy+fROiiTPZX1pmbxKCM30vzeVhgF1Uh/HM0f
	/ZRKuFUtkPGKZWbMz7rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzUjK-0005sU-4f; Thu, 28 Feb 2019 23:04:42 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzUjG-0005s0-LP
 for linux-riscv@lists.infradead.org; Thu, 28 Feb 2019 23:04:40 +0000
Received: by mail-io1-xd43.google.com with SMTP id y13so18038616iop.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Feb 2019 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gmKEt95/bKerSzneuZjTxHAhkZtg6bph+MZYvRvMaE0=;
 b=iMKKcH1teYSrhuXMA5msAb49RrO2FvVesrVlcxUMxIv2b2n8o7XPeQyx00E8zOVgdg
 sA5EM0XZzi/k58Y9KNMKjYg7cW9EXdZ/SHJhRrKsDByA2IPmdR1FBScBBkgZaclWah/l
 KqqnEsPegpdFttU/Qx2HlRxY+5iviPo+BYSk+edBDcikG+eVkozGhYbL7jQWImezUvbH
 Oodk7MRNHZS69syX78o7uMTub/LuBc5CMIZvS1zvYSxOdkit6xd4zJMjlv0ZIBYiNd0u
 pcIcpaLuaOC0Nr9o/IgqIOeNkNZyZZysVBN8rOc8bAI9+Ew7uhA+GdWVmhHg8LENHRah
 aL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gmKEt95/bKerSzneuZjTxHAhkZtg6bph+MZYvRvMaE0=;
 b=gn8wjY4qGjNLaxfSg88gH8ZulJhmrKAuUPnDMxnZL+UHUSlqHaoBLeheU5ai4wxilN
 lQ0jp7MtgHTBsUt9NhytsH52jQ/0WOS2DZdihh0KVQ1yY3T1Bt53HUslGk6sv4MQcHD7
 FAOq1myoN8KRbnlijvbQL2POp8aWt2tEYncAt8QPBeGTOVYrn7myp3KlY/FzYaBL+xcu
 TujzZqI7Gamlfm4LLi6OeMuu27H4W1wbwEsDRP+gUru3YqvnI37ZFvIv8EGaVrxowFqA
 dq2x2JUMCiFMvRF6oHGggvK3COkTCIxKewYvi/xAw4ndY7Ju5NwhwLZvaozlzhay5QRH
 hotw==
X-Gm-Message-State: APjAAAVO8eSFP9oA7/Y8JYJg39gW8kHCwYf5VU0rsOSItA56C0GP9khp
 g3oGbi+sYS8hExGm3F3M27bKXw==
X-Google-Smtp-Source: APXvYqz4f5ZN5H+9U9fRvdvL5J1x6Nw+Px9y4Ao+FXNlLRGrppjsrlQWPzGR9bA1DRwxwjrI5MBh4g==
X-Received: by 2002:a6b:b644:: with SMTP id g65mr1103203iof.198.1551395077046; 
 Thu, 28 Feb 2019 15:04:37 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 f142sm3594011itc.15.2019.02.28.15.04.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 15:04:36 -0800 (PST)
Date: Thu, 28 Feb 2019 15:04:35 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH] Revert "of/device: Really only set bus DMA mask when
 appropriate"
In-Reply-To: <CAKmqyKND0ruL+cTLoMzV2oG5BOdHDzAzWkKrW5eqLAP2Q6smvQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1902281452270.17965@viisi.sifive.com>
References: <20190228223257.6189-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1902281437380.17965@viisi.sifive.com>
 <CAKmqyKND0ruL+cTLoMzV2oG5BOdHDzAzWkKrW5eqLAP2Q6smvQ@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_150438_740538_2DA3B359 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: "robh@kernel.org" <robh@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Feb 2019, Alistair Francis wrote:

> On Thu, Feb 28, 2019 at 2:39 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > On Thu, 28 Feb 2019, Alistair Francis wrote:
> > > This reverts commit 6778be4e520959659b27a441c06a84c9cb009085.
> > >
> > > Reverting the commit fixes these error messages and an non-functioning
> > > USB bus when attaching a USB to PCIe card to a RISC-V board:
> > >     xhci_hcd 0000:03:00.0: Host took too long to start, waited 16000 microseconds.
> > >     xhci_hcd 0000:03:00.0: startup error -19
> > >     xhci_hcd 0000:03:00.0: USB bus 2 deregistered
> > >     xhci_hcd 0000:03:00.0: WARNING: Host System Error
> > >     xhci_hcd 0000:03:00.0: remove, state 1
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > > I'm not sure if this is the correct fix, it's possible something else is
> > > wrong, but I wanted to get some feedback.
> > >
> > > drivers/of/device.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > > index 3717f2a20d0d..8299f8055da7 100644
> > > --- a/drivers/of/device.c
> > > +++ b/drivers/of/device.c
> > > @@ -149,11 +149,9 @@ int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
> > >        * set by the driver.
> > >        */
> > >       mask = DMA_BIT_MASK(ilog2(dma_addr + size - 1) + 1);
> > > +     dev->bus_dma_mask = mask;
> > >       dev->coherent_dma_mask &= mask;
> > >       *dev->dma_mask &= mask;
> > > -     /* ...but only set bus mask if we found valid dma-ranges earlier */
> >
> > Does the DT data for the PCIe controller that you're using contain a
> > dma-ranges node?
> 
> Ah, no it does not. It only has ranges and bus-range [1].
> 
> Any idea what the dma-ranges should be?
> 
> 1: https://github.com/riscv/opensbi/blob/master/platform/sifive/fu540/HiFiveUnleashed-MicroSemi-Expansion.dts#L407

Not off the top of my head, but this may help:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/booting-without-of.txt#n1389

You might also consider grepping through existing DT data for examples of 
dma-ranges usage.

N.B., I have no direct knowledge of this, but have been told that some of 
the MicroSemi PCIe controllers can only bus-master into a 32-bit region.  
If this is a MicroSemi controller, that would need to be reflected in 
dma-ranges.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
