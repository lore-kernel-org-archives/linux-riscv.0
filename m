Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CEBC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBN4rzoWV5q+dnJQXpqk8xgTngr0rhwgvBGxWHwIgHM=; b=gzujNlfsKX4M/w
	6nZv1FSvMQvMKj2FMY/Ki4RoQpW9DYufLnKctDy7l0NVYj6uuA0pOf54e8/UXBWYIubME7x83/Cqt
	siIKYZvQaNzRGhA4J+FZkCfLmxsiKCBF//gg8d9RXAGsi/glA0SmhlqFQxFpyPY4m2OwdfHBi3xJy
	t8qhk7E8U6PaogN2VwYlXgtVLz6qcknn2z4WOx9+6BFV9N/ddHLNB+BOdwFREDw92lliLlUGMtwiH
	BPhSpi3qMXRhR73MIGKzgABAYgzneHXAeEjGU+pTmo98T5IdXSY/TNZfG8q07dhxu4pXzkzxuQTLK
	JPKT2/92ribhobzy8xhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64d-00000006DDh-399Y;
	Tue, 24 Jun 2025 16:00:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4TO-00000005sKi-33us
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Jun 2025 14:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3M75jWfb216WOXODZaCIr+/xgufHXrDaemvMWPhwVns=; b=rUks+Jnd4nDKeI7pcVJcAxPX/9
	EVO7M1Q4v3jE949Tyg0JRRMteD8qYmBkKc56jbyJouA7cRoo23e1P6LjS1b02LmcarmMrSfD0O5bp
	OnP65PXhe9637K/umZcSFe4XWnk+zYlQTyiswkPLTUCraqv9aXGiU4b244nq1diovouBtgV0sQ00T
	asrCe0KC06qYGERqFS7lPqvF3eL6swKXLgf1p6maB6T5KjYHYt0hGXASv4/J+ggOwOyHNDGdWoNvB
	yxroEGo6wEI/DNeBlEzq/qTr4eN2MclVN5MZgN9aUMrYpUYaF62p5onmCZGn2KzUuKYC6c1Hn55VZ
	bKSyL7ZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4TK-00000006n9g-1heH;
	Tue, 24 Jun 2025 14:18:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 82F9A307E51; Tue, 24 Jun 2025 16:18:01 +0200 (CEST)
Date: Tue, 24 Jun 2025 16:18:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
 <20250624141130.gZVv4WnP@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624141130.gZVv4WnP@linutronix.de>
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

On Tue, Jun 24, 2025 at 04:11:30PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-24 16:08:15 [+0200], Peter Zijlstra wrote:
> > > >>
> > > >> I also had a series which was doing so for misaligned accesses handling,
> > > >> but after discussion, it was not ok to do so.:
> > > >>
> > > >> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/
> > > > 
> > > > If I understand that right, exceptions from kernel should be treated as
> > > > NMI, so that lockdep can tell us if exception handlers touch locks.
> > > > 
> > > > But (conditionally) enabling interrupts does not lose us that benefit. It
> > > > is still considered NMI by lockdep.
> > > > 
> > > > Unless I miss something, the patch is fine as is.
> > 
> > I'm confused, you're wanting to conditionally enable interrupts from a
> > kernel exception while its NMI like? *WHY* ?!
> 
> What we want is to enable interrupt handling if it was enabled before
> the exception occured. So we can send a proper signal on PREEMPT_RT
> without chocking on spinlock_t/ sighand.

I'm confused, sending signals is for exception from userspace. That has
nothing to do with exceptions from kernelspace being NMI like.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
