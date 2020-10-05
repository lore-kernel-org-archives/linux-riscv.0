Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29ADC46466
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:57:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F9332078A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DQZhvxmt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ng9feSs+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F9332078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GkweAiLj1x4g9h2M5pJ3l/HVYXf1TOvATnRb7H75VlQ=; b=DQZhvxmtElj9GBlOo2iUGqd1C
	iVVX5EOiQAn6SI2XnByW0FvJhrU+MXgcKU1dMSdioqEi3TQFjDFh+YvU6wus2ohCn8gwvTIp0roSt
	bFiFsjQGNpNju3Xda20Syu8pxH7NSESYDOC3EgTn9Qg465LuqMUzRBHOEcdZcUaF6jgoq6iiVz/8A
	Gn9UrorbmaDfIl7yik3k9LtaW5t2pX7cc3cOPUS38Fopgvguf+KGwpFRCqS7wOfuSKCyTiHxE54g3
	ANTEod2rUGMneDnroGLAR9DZI4wpztws0elWtTDJxQTMG8Ljtq3o2gKJFLVwuNZkgTgH15ukIETNx
	3DKCuGqfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPKQS-0004xL-SW; Mon, 05 Oct 2020 06:56:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPKQQ-0004wy-Ke
 for linux-riscv@merlin.infradead.org; Mon, 05 Oct 2020 06:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JH0LA4ZuyggAVCTfAaYXHSoHoqqf3UMSAcaG4H8OYWQ=; b=ng9feSs+iOaagTDCS7GVS803UG
 FYtJiDiazlMQbCOD7eSn/To5ES0cXenIsuYBC9zsl2M8eCCcF8vztyfDRaKMn20fLaPOxf3wG05DZ
 QOHHQsDwG+RWnfXOYf15tRZDnQE4FvS1PpneP8X6muACi7I3brc0ZrLZu8w6PG0Z4Qr97L7G77e8L
 i+HE7S6F/pSR1VIGaWf8mQxE5Rw27NM7JPcLy9Tlrq87GW/tdYoz+yN05tJIJWxC3GdBPc9nSca4W
 hEWY8WkbcW/LHg4ZGsuGGwnKi7+Mh39JdBrJ4ZJ4co4pn2E2vgVZSfTclzV/HBw4pVLG5VvYwYhX0
 1dY1sLbA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kPKQO-0002jS-Bx; Mon, 05 Oct 2020 06:56:44 +0000
Date: Mon, 5 Oct 2020 07:56:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] crypto: jitterentropy - bind statically into kernel
Message-ID: <20201005065644.GB7462@infradead.org>
References: <20200930065617.934638-1-palmerdabbelt@google.com>
 <20201005061918.GB1856@infradead.org>
 <CAMj1kXFC=6G1pqFAcjASrKJfzguO3k9Rv-7NsmTaX8qNre5TGw@mail.gmail.com>
 <2588700.mWSkj6HvKX@tauon.chronox.de>
 <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXFL4gfrK1+zRG9sajTk62yRh3WzBG46KfKD=iM=VQMTAQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: kernel test robot <lkp@intel.com>, Stephan Mueller <smueller@chronox.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Android Kernel Team <kernel-team@android.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 05, 2020 at 08:44:39AM +0200, Ard Biesheuvel wrote:
> On Mon, 5 Oct 2020 at 08:40, Stephan Mueller <smueller@chronox.de> wrote:
> >
> > Am Montag, 5. Oktober 2020, 08:24:46 CEST schrieb Ard Biesheuvel:
> >
> > Hi Ard,
> >
> > > If jitterentropy is a special case, we could put a alternate
> > > non-'static inline' version of random_get_entropy() in the core
> > > kernel, and only export it if JITTER_ENTROPY is built as a module in
> > > the first place. But I'd prefer it if jitterentropy switches to an API
> > > that is suitable for driver consumption.
> >
> > Which API do you have in mind? In user space, I use
> > clock_gettime(CLOCK_REALTIME) which also considers the clock source.
> >
> 
> AFAICT, that call is backed by ktime_get_real_ts64(), which is already
> being exported to modules.

Indeed. No need for my earlier idea..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
