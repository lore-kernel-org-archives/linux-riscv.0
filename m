Return-Path: <SRS0=Tq7r=WZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BFEC3A59F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 10:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D5E20828
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2019 10:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VbRlbmX4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D5E20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOo2dIIM8ew4MbzqzG+iVa/p0YRcbTrpgvX4BiGcIs0=; b=VbRlbmX4a8YISs
	hYNpg0mZfiRqIWnknF1qrfyXgk0JeU2G3XFckgnDTs9irWMndHvPLVo6briMSoWGnthyJ/rBvCzC0
	A4f3pqU0gNMrv9z32Zt4dD0/Lo2VfPQj3QT8ztTO0lekkyaQOXABbL8POuLFUMyiXIFtJVDh/ZGIF
	DJ7RSl3RNuFQ8Q/LS10W4eMISpVpyoRh5asxyVu9vO/8nHOuYcGxToCjuypI40mmy1hw5o4JoFV/5
	PMaFa7TBmOHuBy3jy/hNshP7B7am9WjQ/dhzvZU6VzSvX5ccv38W+AEPFrqJc0by/kWCPUbUfY7ln
	M/hksRP3XUS0L7tsprSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3I9B-0002pF-E7; Thu, 29 Aug 2019 10:59:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i3I99-0002ot-RM; Thu, 29 Aug 2019 10:59:19 +0000
Date: Thu, 29 Aug 2019 03:59:19 -0700
From: "hch@infradead.org" <hch@infradead.org>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: [RFC PATCH 0/2] Add support for SBI version to 0.2
Message-ID: <20190829105919.GB8968@infradead.org>
References: <20190826233256.32383-1-atish.patra@wdc.com>
 <20190827144624.GA18535@infradead.org>
 <a31c39e8653bd04efe0051a5fd6f0238d33a80e7.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a31c39e8653bd04efe0051a5fd6f0238d33a80e7.camel@wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "alankao@andestech.com" <alankao@andestech.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "alexios.zavras@intel.com" <alexios.zavras@intel.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 27, 2019 at 10:19:42PM +0000, Atish Patra wrote:
> I did not understand this part. All the legacy SBI calls are defined as
> a separate extension ID not single extension. How did it break the
> backward compatibility ?

Yes, sorry I mistead this.  The way is is defined is rather
non-intuitive, but actually backwards compatible.

> I think the confusion is because of legacy renaming. They are not
> single legacy extension. They are all separate extensions. The spec
> just called all those extensions as collectively as legacy. So I just
> tried to make the patch sync with the spec.
> 
> If that's the source of confusion, I can rename it to sbi_0.1_x in
> stead of legacy.

I think we actually need to fix the spec instead, even if it just the
naming and not the mechanism.

> >  (1) actually board specific and have not place in a cpu abstraction
> >      layer: getchar/putchar, these should just never be advertised in
> > a
> >       non-legacy setup, and the drivers using them should not probe
> >       on a sbi 0.2+ system
> 
> In that case, we have to update the drivers(earlycon-riscv-sbi &
> hvc_riscv_sbi) in kernel as well. Once these patches are merged, nobody
> will be able to use earlycon=sbi feature in mainline kernel.
> 
> Personally, I am fine with it. But there were some interest during
> RISC-V workshop in keeping these for now for easy debugging and early
> bringup.

The getchar/putchar calls unfortunately are fundamentally flawed, as
they mean the sbi can still access the console after the host has taken
it over using its own drivers.  Which will lead to bugs sooner or later.

And if you can bring up a console driver in opensbi it should be just
as trivial to bring up the kernel version.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
