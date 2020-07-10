Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3BBC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:39:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7ED2072E
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EfbPGgbE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ODGTiXiS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C7ED2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JUpGnSvEyvkoD6wBr1HmQiKd5GGnDeBV+MaHhY8PuCk=; b=EfbPGgbE5V0IAGBfUbs1EoM5z
	ImWYKyYYggPUpLVou/MGUGxDgdAYcBDU061SDaJbaxFFpOboD29/pTw34PTjjRS9bgYSda5G4hxsR
	0Yw8nh2plFVhr7D69EbzwBcO9J7rgLqCi0Rb7WColktQPWRPTCn3jhLqROgj2hOlylpN7x3MUvynT
	FdAfwXnvzsDkGKxnXht06HMqr72uLNdCpUFckPf+VQn0rfFCfU5kN9LNYnGWopxTgnXVhf+6j9uh5
	1CZzPtA25y+IWO2iNR9g6YUdl55lD59ZEHyhUFVgarSUQU03E/p9x6gzlu43Zt6+cOA17aP6UAD9J
	4u7Cvx0dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtlkW-0008HE-TL; Fri, 10 Jul 2020 05:39:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtlkV-0008Gy-0d; Fri, 10 Jul 2020 05:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r8XAt9mvgsXI1HPZ95IOzogzdV+W6uZ7vWhIwgo9PM8=; b=ODGTiXiSnX6UuOzsheQ9KWKhON
 Lv6biMNVFXU5Cm2xqfDIjVinsSurMlb2w8kMD1JvdVTsea/lPxMxd6awgEAwpTUSvUoj+MX2rr7c0
 YdIYC4Te0yCxbXu4bw2AaN/kbthRMvP8Aq4+l14lBnUVnpcS87tOTm2wgSK+fuzW3uNPWwT9+VOiL
 oLENoEMF0XoyxfE1aSOOiqnsfkNd5ND5OmUzfl0dmdSXs6w5pr112LsQcqW/Ev1742bUn61zi+yHR
 YhME47LV9DIBs7cTlPapnfctfHlcg2Co3xgEoyXoRRzXDvYo91geeGB7iU+OMYOb7YZg3pdGXxHH0
 SsN0FNgg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jtlkI-0007Co-Tn; Fri, 10 Jul 2020 05:38:50 +0000
Date: Fri, 10 Jul 2020 06:38:50 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH 1/5] lib: Add a generic version of devmem_is_allowed()
Message-ID: <20200710053850.GA27019@infradead.org>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
 <20200709200552.1910298-2-palmer@dabbelt.com>
 <20200709204921.GJ781326@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709204921.GJ781326@linux.ibm.com>
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
Cc: mark.rutland@arm.com, steve@sk2.org, gregory.0xf0@gmail.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, zaslonko@linux.ibm.com,
 glider@google.com, krzk@kernel.org, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, ardb@kernel.org,
 linux-arch@vger.kernel.org, paulmck@kernel.org, alex@ghiti.fr,
 bgolaszewski@baylibre.com, masahiroy@kernel.org, linux@armlinux.org.uk,
 willy@infradead.org, takahiro.akashi@linaro.org, james.morse@arm.com,
 kernel-team@android.com, Arnd Bergmann <arnd@arndb.de>, pmladek@suse.com,
 elver@google.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 uwe@kleine-koenig.org, rostedt@goodmis.org, broonie@kernel.org,
 davidgow@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 dan.j.williams@intel.com, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, tglx@linutronix.de,
 rdunlap@infradead.org, matti.vaittinen@fi.rohmeurope.com,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 09, 2020 at 11:49:21PM +0300, Mike Rapoport wrote:
> > +#ifndef CONFIG_GENERIC_DEVMEM_IS_ALLOWED
> > +extern int devmem_is_allowed(unsigned long pfn);
> > +#endif

Nit: no need for the extern here.

> > +config GENERIC_LIB_DEVMEM_IS_ALLOWED
> > +	bool
> > +	select ARCH_HAS_DEVMEM_IS_ALLOWED
> 
> This seems to work the other way around from the usual Kconfig chains.
> In the most cases ARCH_HAS_SOMETHING selects GENERIC_SOMETHING.
> 
> I believe nicer way would be to make 
> 
> config STRICT_DEVMEM
> 	bool "Filter access to /dev/mem"
> 	depends on MMU && DEVMEM
> 	depends on ARCH_HAS_DEVMEM_IS_ALLOWED || GENERIC_LIB_DEVMEM_IS_ALLOWED
> 
> config GENERIC_LIB_DEVMEM_IS_ALLOWED
> 	bool
> 
> and then s/select ARCH_HAS_DEVMEM_IS_ALLOWED/select GENERIC_LIB_DEVMEM_IS_ALLOWED/
> in the arch Kconfigs and drop ARCH_HAS_DEVMEM_IS_ALLOWED in the end.

To take a step back:  Is there any reason to not just always
STRICT_DEVMEM? Maybe for a few architectures that don't currently
support a strict /dev/mem the generic version isn't quite correct, but
someone selecting the option and finding the issue is the best way to
figure that out..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
