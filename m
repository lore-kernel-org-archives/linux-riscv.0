Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 848DBC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:35:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CADC6141B
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CADC6141B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5PaF8NVWCL5E5rz/8rLO/aMTU+6LwRN4M9iTahNi9o=; b=JQlRR/+jklKZ65
	ut7fAo8x3crbbBJHtZOhIWNQC9u2CBqSJr2sImNCJsQ4E8vKPGiQe6NEKUWmBVy0ajc3wZcyoM32n
	ShupVp9MQkvzy4W+soXPExw+8pPxUwRJfC5BGst83QahBMZ58CTVE6ECXKdvbI8K/0hQeXnX+lCCf
	PNO2Cj91bdMDzCgHWySdrysnbQg4hJLexwhUifTu6aKsmHe85u8k00ZXRSx9lxwC2xvf1ncgUvw2T
	fDxUvoPEZfKCFJjAmAoyk8rPDnIGaoCjspLM/TyTHsHb2M1A1RgQ+xDc2hqoxnUsXDjUB9vQyn/bC
	dk9Ia5pHIxxOzOwxakgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llTTB-004PK3-Cy; Tue, 25 May 2021 09:35:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llTT9-004PJF-NB
 for linux-riscv@bombadil.infradead.org; Tue, 25 May 2021 09:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=77alA0oNaOdxO9Nn5XAmzEZ6uOPGgpzTh0etFfYrlAM=; b=CJtzWCtnRisoGTNMJQCQYaQgVp
 ZVGRtAAqogEkkwH9F9sBAGoaUIJqf8hyB4tWDL7yuZj/sqQh0U+BWtvZWmQGjuMN34YGl+CVRhKqY
 SpUjecHol9ErWniyWlQeiZ55SyQ6f5qUrCbAB5OfKHdCF0QtETh17x5xH9Cm8rZZgktR5YKtOhTaY
 BAo+VxbRlblic7Pi6monzUyPO9BA4KI29sePHIRFeDpFieohokdd8OHlD/lC11YmnpM9AjF2UhJvK
 mi4DXoLwyN6+LX4/ewdxrfmy4NRfdBhlIaoT1r8+VKmnGA1IUj76nNdLFH4YSTQJZb4oPpyYKmINK
 b2mPNq0A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1llTSP-003LFb-Qx; Tue, 25 May 2021 09:34:52 +0000
Date: Tue, 25 May 2021 10:34:37 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/3] riscv: Fixup PAGE_UP in asm/page.h
Message-ID: <YKzErU3lpFO58hkY@infradead.org>
References: <1621839068-31738-1-git-send-email-guoren@kernel.org>
 <1621839068-31738-2-git-send-email-guoren@kernel.org>
 <YKyae+8O25A8vxMS@infradead.org>
 <CAJF2gTRA=tUid7akgVXfk6MHOd0KmJpDQEZ2m9wRfhigBDzQTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRA=tUid7akgVXfk6MHOd0KmJpDQEZ2m9wRfhigBDzQTw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Tue, May 25, 2021 at 05:28:21PM +0800, Guo Ren wrote:
> On Tue, May 25, 2021 at 2:34 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, May 24, 2021 at 06:51:07AM +0000, guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Current PAGE_UP implementation is wrong. PAGE_UP(0) should be
> > > 0x1000, but current implementation will give out 0.
> > >
> > > Although the current PAGE_UP isn't used, it will soon be used in
> > > tlb_flush optimization.
> >
> > Nak.  Please just remove the PAGE_UP/PAGE_DOWN macros just like they
> > have been removed from other architectures long ago and use the
> > generic DIV_ROUND_UP macro for your new code like everyone else.
> 
> This patch has been dropped because it's wrong, ref Anup's reply.
> 
> Remove PAGE_UP/DOWN is okay for me. How about:
>  static inline void local_flush_tlb_range_asid(unsigned long start,
> unsigned long size,
>                                               unsigned long asid)
>  {
> -       unsigned long page_add = PAGE_DOWN(start);
> -       unsigned long page_end = PAGE_UP(start + size);
> +       unsigned long page_add = _ALIGN_DOWN(start, PAGE_SIZE);
> +       unsigned long page_end = _ALIGN_UP(start + size, PAGE_SIZE);
> 
> _ALIGN_XXX are also defined in arch/riscv/include/asm/page.h.

And these also are leftovers from days gone by and should be removed.

I think this should simply be:

	
	unsigned long page_add = start & PAGE_MASK;
	unsigned long page_end = PAGE_ALIGN(start + size);

(and page_add is a pretty horrible name as well..)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
