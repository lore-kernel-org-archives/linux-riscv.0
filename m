Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DBCC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F247C20787
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 05:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pray9B8e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TdwzKJ6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F247C20787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dA/B2hn2dGqT+41mNIs7bXZW+DIlKg6eUeRxWHNzJgc=; b=pray9B8eXnlBZoFAFEDOKOjaZ
	X5ya5kHoW1owNhHmy9Wz2XBBXWJjkR6z/Cjq4LTnDkYxv7YNzgtq0hfBLLLAW/csmMFxQg6xfNgBi
	nGMNGa0nm7r1/zyIYfQY8HakJ2G+xWYz7kvAV/vO74MCl/GqXBbR7qx69t76iz5ic3oaCSl2Epm8k
	RRGq419XrHndizLZtaFkGF9jzHdZNZBIHYTHUJf7TzmUA4B8iD2GLX1w6/PI9S95F1SJALpmhQcBK
	hQ+4YEWst1V2l9Ke6W2PEEn0el5Ig3EhM37mz3qKtWU1pvnrrGQpCJkXYdKKD/GBYmcvQNdqxCzRo
	Pzc+1XmaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtlwY-0001Vy-Tv; Fri, 10 Jul 2020 05:51:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtlwX-0001Vd-C4; Fri, 10 Jul 2020 05:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RLTu3+HsCxbyd0XHLP7eqfjDQF9m/c45x4E/TaQCods=; b=TdwzKJ6KbOxKPNVPgtlBSB8eCE
 GiUZ/mHUxX+IkLfgDjuZWly7AhMRgob3HvY24kAOGFO07yG4CWvBAsYSneiAVMIlGfl4UYsHQ6/r7
 QEC9VXjWzgog2kozgtbitj5C0W6jnv/CtLWa/Z9J/dLfrjGQyH+YNPXWWyeVNVReuG5Ul1nz5OcHb
 Qx+GixWi/iLAkyBxaBnqMqXoOy1Z0o8ayJoShQ2zPXbf15O9YcvLUQg6FpDs5mv4VAiDi1ojjGcx5
 dqa+iwhvPqxEyuWAcxCaAbqlG41xKw8VCI/n3bgrKPBIrCAc1yBi6mD54voeiD6p/mdtiAdJadxjr
 0DzQw7HA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jtlwS-0007tK-I4; Fri, 10 Jul 2020 05:51:24 +0000
Date: Fri, 10 Jul 2020 06:51:24 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [PATCH 1/5] lib: Add a generic version of devmem_is_allowed()
Message-ID: <20200710055124.GA30265@infradead.org>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
 <20200709200552.1910298-2-palmer@dabbelt.com>
 <20200709204921.GJ781326@linux.ibm.com>
 <20200710053850.GA27019@infradead.org>
 <a037dac961c989d027eab293a0280643@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a037dac961c989d027eab293a0280643@mailhost.ics.forth.gr>
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, elver@google.com, glider@google.com,
 willy@infradead.org, zong.li@sifive.com, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 ardb@kernel.org, linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 alex@ghiti.fr, takahiro.akashi@linaro.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, bgolaszewski@baylibre.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kernel-team@android.com, pmladek@suse.com,
 zaslonko@linux.ibm.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 paulmck@kernel.org, rostedt@goodmis.org, uwe@kleine-koenig.org,
 broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, dan.j.williams@intel.com,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, james.morse@arm.com,
 mhiramat@kernel.org, akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 08:48:17AM +0300, Nick Kossifidis wrote:
> ???????? 2020-07-10 08:38, Christoph Hellwig ????????????:
> > On Thu, Jul 09, 2020 at 11:49:21PM +0300, Mike Rapoport wrote:
> > > > +#ifndef CONFIG_GENERIC_DEVMEM_IS_ALLOWED
> > > > +extern int devmem_is_allowed(unsigned long pfn);
> > > > +#endif
> > 
> > Nit: no need for the extern here.
> > 
> > > > +config GENERIC_LIB_DEVMEM_IS_ALLOWED
> > > > +	bool
> > > > +	select ARCH_HAS_DEVMEM_IS_ALLOWED
> > > 
> > > This seems to work the other way around from the usual Kconfig chains.
> > > In the most cases ARCH_HAS_SOMETHING selects GENERIC_SOMETHING.
> > > 
> > > I believe nicer way would be to make
> > > 
> > > config STRICT_DEVMEM
> > > 	bool "Filter access to /dev/mem"
> > > 	depends on MMU && DEVMEM
> > > 	depends on ARCH_HAS_DEVMEM_IS_ALLOWED ||
> > > GENERIC_LIB_DEVMEM_IS_ALLOWED
> > > 
> > > config GENERIC_LIB_DEVMEM_IS_ALLOWED
> > > 	bool
> > > 
> > > and then s/select ARCH_HAS_DEVMEM_IS_ALLOWED/select
> > > GENERIC_LIB_DEVMEM_IS_ALLOWED/
> > > in the arch Kconfigs and drop ARCH_HAS_DEVMEM_IS_ALLOWED in the end.
> > 
> > To take a step back:  Is there any reason to not just always
> > STRICT_DEVMEM? Maybe for a few architectures that don't currently
> > support a strict /dev/mem the generic version isn't quite correct, but
> > someone selecting the option and finding the issue is the best way to
> > figure that out..
> > 
> 
> During prototyping / testing having full access to all physical memory
> through /dev/mem is very useful. We should have it enabled by default but
> leave the config option there so that users / developers can disable it if
> needed IMHO.

I did not suggest to take the config option away.  Just to
unconditionally allow enabling the option on all architectures.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
