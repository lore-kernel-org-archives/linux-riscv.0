Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC9AFF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYqy7ErcGv01vZkPUhlmbjx6d5C0hs+W5IYUqM4N2uY=; b=eYJcx3V9+Bbl1s
	Q5FAM7+mNXCubb4FiDWKweFqM2AUXaKOmHaFqhdsAg1ANN/sFJ2ylvLlr/+I3nZetP0v2jGSKhKIV
	X2bRRVkJ+9XeNXX1wrNhWfjU+JjjlyaVj2f3WoE4hBiSZ+X/fGtD3QMMBqkzY4sPURY2UtQoglWU/
	p8pfTN6K8HHd66bmkddLNRuWmo/iWTtc+ED11uoI6dJPmwWrhm9Mjrkr0u2yHr+NFEoLLO3dci2yZ
	JBF663bm81WTpqjfGSwU7pT0Gi1HzZHvSWUjI2a4F/qbjp2cwqYvwTOObLhMFpX2cV1z3K59b8uFd
	3KcLePv0A35CRTK6HZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJEi-0000000GhDu-3Idb;
	Mon, 27 Apr 2026 10:30:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJEh-0000000GhDn-04MZ
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 10:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA87060138;
	Mon, 27 Apr 2026 10:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3444AC19425;
	Mon, 27 Apr 2026 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1777285841;
	bh=j9lgxZ72pFNOq6i9OiE2AUQyWJMA3vzMop55XlLUiRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HzEXn/hi9Khwt86iTN4xHXpTp2FZ9xvCO198c8okdgVWYeML0UCSCY3/Cah7Lf4FN
	 PwzcS5nOFkQVal1m7Fh84OKypgHytKQOEsfJI8Xr0WYYcrKo00oVUY4WKvwebrdmpJ
	 0cvlk7PXsCql8E7iC6tuja7Eawx3N7q7fwlSbMDg=
Date: Mon, 27 Apr 2026 03:30:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] riscv32 library enhancements and build fixes
Message-Id: <20260427033040.b10055b592ebb4ce935d3b97@linux-foundation.org>
In-Reply-To: <ae8dGrM77NuCe4S0@ashevche-desk.local>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
	<20260425143631.e20246946f59925c5eb8dc22@linux-foundation.org>
	<df673a44d292bb3df498b78a8b637f880e28931f.camel@yandex.ru>
	<ae8dGrM77NuCe4S0@ashevche-desk.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 27 Apr 2026 11:23:54 +0300 Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Apr 27, 2026 at 11:13:20AM +0300, Dmitry Antipov wrote:
> > On Sat, 2026-04-25 at 14:36 -0700, Andrew Morton wrote:
> > 
> > > I didn't upstream "lib and lib/cmdline enhancements v9" this cycle.
> > 
> > You don't have to upstream v9. Because v9 is v8 + initial RISC-V build
> > fix, which is a part of another series (this one) now. The proper sequence
> > is v8 + this series.
> > 
> > > So can we please sort through these things (and the AI review) before
> > > adding more?
> > 
> > Not sure about AI but hopefully human should realize that I'm not an
> > expert in m68k/sparc32/xtensa/csky/[your favorite arch here]. Enabling
> > and running the test on _all_ architectures where it is expected to 
> > work requires obtaining (or even building by myself) a cross-compiler,
> > setting up the kernel and QEMU, etc. I've spent a reasonable time with
> > RISC-V and ARM and hopefully set up a good starting point for 
> > m68k/sparc32/xtensa/csky/[your favorite arch here] maintainers, who are
> > free to incorporate the test into their target architecture.
> > 
> > I'm going to fix everything I consider reasonable, submit v7 and give up -
> > because without even a single reply from core RISC-V maintainers, this
> > just turns into an endless brain masturbation.
> 
> I believe it's better to issue v10 of that series + v7 of this in one go.

Yes please.

It's been a while and there are so many patches and everyone's
forgotten everything.  A fresh resend of everything is a good way to
reset and restart.  It's also an opportunity to update changelogs so
they address everything which has been discussed thus far.  And an
opportunity to add cc's to everyone who has commented thus far.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
