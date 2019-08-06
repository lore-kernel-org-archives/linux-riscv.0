Return-Path: <SRS0=rJkP=WC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E923EC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 08:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD466206A2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 08:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nh5seEsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD466206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6bNOOVvO/TTakhKF4bd0lQb+hBYShC6UygAQDVfc5Q=; b=Nh5seEsfn8w9hC
	F2dr483X5BdC3/2D3Sz3xnUOn7v+oOrX7SdegVbx80+4gfBK33ZPI3jAzXCMerTZwjrcLMxEUS5tT
	jYaxCnETnsdKYiATnlvvxa56EOZ67gajjZbuDdj4wfsou525s0QOZNgotBq5l6vuxPSkzAk4UdBfI
	fO7miaT7ijfUWjpFS3flpN0o8pE9OjVy2EdCab4pYAAl3Xr/lclPdMqoFOmlULXT6VvZOvNAbctoh
	26jsar/P2n3qrEgtyEKIqx3I7VYYIbbSBAXi0nysQNK2mcZJOinjIs2tKOYDyraXVKHTc7R7qUHop
	/o4FECSw/zsoqL/oKK4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huusb-0004Ua-Qg; Tue, 06 Aug 2019 08:31:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1huusZ-0004UQ-TB; Tue, 06 Aug 2019 08:31:35 +0000
Date: Tue, 6 Aug 2019 01:31:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jim Wilson <jimw@sifive.com>
Subject: Re: About __udivdi3
Message-ID: <20190806083135.GA12410@infradead.org>
References: <20190805055844.GE4292@andestech.com>
 <20190806013723.GA5417@andestech.com>
 <alpine.DEB.2.21.9999.1908051911290.13971@viisi.sifive.com>
 <CAFyWVaYd1vGFLJj6hh+a5Ufubh3tvwER+-ShQXA3faEJbEFe3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFyWVaYd1vGFLJj6hh+a5Ufubh3tvwER+-ShQXA3faEJbEFe3A@mail.gmail.com>
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
Cc: Eric Lin <tesheng@andestech.com>, dslin1010@gmail.com,
 alankao@andestech.com, Palmer Dabbelt <palmer@sifive.com>, rick@andestech.com,
 kclin@andestech.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2019 at 08:01:27PM -0700, Jim Wilson wrote:
> On Mon, Aug 5, 2019 at 7:13 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> > > > It seems __udivdi3 only supports 64-bit platform.
> > > > Do you have any comments? Thanks.
> >
> > It sounds like you're describing a potential issue with gcc, rather than
> > the kernel.  If that's so, then the gcc mailing list(s) would be a better
> > place to discuss this:  https://gcc.gnu.org/lists.html
> 
> The kernel doesn't link with libgcc.a.  It has its own copy of udivdi3
> when needed.

Linus still maintains his stance to not support 64 by 64-bit divisions
on 32-bit platforms, and thus Linux does not support it.  You can do
64 by 32-bit divisions using the awkward do_div macros, but that's it.

This is supposed to apply to all 32-bit platforms, not just RISC-V.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
