Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11130C433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 07:15:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C085206B8
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 07:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOSpBxuB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C085206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Csgo46RlORwbmDuakNqgHSvDoUgqfeo3QjTvBaDyCf0=; b=LOSpBxuBpBUgyVSXoVeSaoe15
	riEuQSxk30RO2XL2yf/aqIffLV3Mq2YFme6GoH3qH58Rk75DiClSqI14GaVRGxGN4j1E8BgUwvtDx
	wYTo6Mw0ot1NPU+U/9hfkAJqbPGy9Fnn2iYIWrQQzYldJgLXlelIdt3mKwlgaJf9GXXjFNRcGn78o
	Bl+taBuD+Lxph8EHfVYogEggKJqpRhp3tBoV2aBmdozU4dHa9TDdUBgQCT42zQDQhHj0VStIJsVAR
	2kr8YILqdb3FGROaeP7np6DOG2dlLUDQZS3Cv/ybeimjq31QPnlL9uqHqh3vGZ/kSDK25tIkL1PWg
	xGrkR8ybw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kESPX-0003Gt-7J; Sat, 05 Sep 2020 07:14:55 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kESPU-0003GX-N1
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 07:14:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id F1F6568BEB; Sat,  5 Sep 2020 09:14:47 +0200 (CEST)
Date: Sat, 5 Sep 2020 09:14:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from,to}_user
Message-ID: <20200905071447.GA13228@lst.de>
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
 <CAK8P3a1=udSEq8kpsmLk-b7ye0p=6eKTvBV74jBoGYmufL2oEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1=udSEq8kpsmLk-b7ye0p=6eKTvBV74jBoGYmufL2oEw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_031452_878045_153BBE29 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 08:04:34PM +0200, Arnd Bergmann wrote:
> >         if (__builtin_constant_p(n)) {
> >                 switch(n) {
> >                 case 1:
> > -                       *(u8 *)to = *(u8 __force *)from;
> > +                       *(u8 *)to = get_unaligned((u8 __force *)from);
> >                         return 0;
> >                 case 2:
> > -                       *(u16 *)to = *(u16 __force *)from;
> > +                       *(u16 *)to = get_unaligned((u16 __force *)from);
> >                         return 0;
> 
> The change look correct and necessary, but I wonder if this could be done
> in a way that is a little easier on the compiler than the nested switch/case.
> 
> If I see it right, __put_user() and __get_user() can probably
> be reduced to a plain put_unaligned() and get_unaligned() here,
> which would simplify these a lot.
> 
> In turn it seems that the generic raw_copy_to_user() can just be the
> a plain memcpy(), IIRC the optimization for small sizes should also
> be done by modern compilers whenever they can.

Sure, I can look into that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
