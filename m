Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F4BC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQDxfeuEFG7FG5ahlaeyDvE36+WIJnTz6l1i42xmfpo=; b=BFhcwuKil0p16V
	to8CvCC/+4q4Sswjp6ekVZwbJ7bmsKTCjrzYjXx3C8SlcoIas9u/dUsGkB1KMNq5Qhe9gVRxerZ2s
	h/F4jBy/xgbGlhwQvogzQ6R/QpPFBA7xruIBJiG8yCSCdAj3zi4SsNEjIQM+kadMwe1wBW0UVZKuQ
	d7D/9BJrg8TJmWRv3k2q64/319Z8RrrM4AHWZ4teIIMl3y+0w/2xftBI9v1s1QKD4vJzgsN/Mbgsd
	/PFAP6KqIx6XAeL0cgcDs3Y2aVuX1g8QJAOQnPUXua5sgGQ+K6Yi58e17fsxE5yv4taEhYWhyZN3H
	Af2WkLLsIjtSa6TSmvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGJw-0000000CfXM-2XDW;
	Tue, 23 Jul 2024 14:16:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWGJt-0000000CfWL-2LVu
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 14:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 560B4611E1;
	Tue, 23 Jul 2024 14:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E017C4AF0A;
	Tue, 23 Jul 2024 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721744206;
	bh=1NmQUjCjX2CORNW2EbzYdrnjMQxLTnASH0DH4yM2MXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8GmUkxEaPhzIWe/Uwp0/nke16W42Xqyz+YNk8rGF/xQoQfmOWCBfIh2ElBZEqbI8
	 j922EY72ISv+su6t7yVtZ7es+BGJa9T3V9DPRLlRqnNND2WZuYM4Ooc2zxgeyCK32r
	 4ysfZYG51JbdaE/Yza0k176zZ6pqnh5BJs+t2ce8kj+URW2P1DgronK5jJjLOVov2h
	 sEMLBQd0VJMPhzHB/BPQ/4dcE0IGP2Aq8uplTQaMo34n2tT2CFqeGJbj98AAGM1Y9S
	 m13OiVGg45x+8ha/GIdfXwMfBJU27H1CZjvfJMI7GnWqYZw2FSXASZHpjvEDsW+D77
	 /1nMF8ebhIU2g==
Date: Tue, 23 Jul 2024 15:16:40 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
Message-ID: <20240723141640.GA26137@willie-the-truck>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
 <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
 <20240705112502.GC9231@willie-the-truck>
 <CAHk-=wgRgDy8_=uZPZr4LRyF7BiN1nDNzUx7iRzrD0g8O+bh3A@mail.gmail.com>
 <20240708135243.GA11898@willie-the-truck>
 <ZowGLMX1xpuxlpqA@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZowGLMX1xpuxlpqA@J2N7QTR9R3>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_071649_688750_E54F5ACE 
X-CRM114-Status: GOOD (  27.55  )
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

On Mon, Jul 08, 2024 at 04:30:52PM +0100, Mark Rutland wrote:
> On Mon, Jul 08, 2024 at 02:52:43PM +0100, Will Deacon wrote:
> > On Fri, Jul 05, 2024 at 10:58:29AM -0700, Linus Torvalds wrote:
> > > On Fri, 5 Jul 2024 at 04:25, Will Deacon <will@kernel.org> wrote:
> > > So on x86-64, the simple solution is to just say "we know if the top
> > > bit is clear, it cannot ever touch kernel code, and if the top bit is
> > > set we have to make the address fault". So just duplicating the top
> > > bit (with an arithmetic shift) and or'ing it with the low bits, we get
> > > exactly what we want.
> > > 
> > > But my knowledge of arm64 is weak enough that while I am reading
> > > assembly language and I know that instead of the top bit, it's bit55,
> > > I don't know what the actual rules for the translation table registers
> > > are.
> > > 
> > > If the all-bits-set address is guaranteed to always trap, then arm64
> > > could just use the same thing x86 does (just duplicating bit 55
> > > instead of the sign bit)?
> > 
> > Perhaps we could just force accesses with bit 55 set to the address
> > '1UL << 55'? That should sit slap bang in the middle of the guard
> > region between the TTBRs
> 
> Yep, that'll work until we handle FEAT_D128 where (1UL << 55) will be
> the start of the TTBR1 range in some configurations.
> 
> > and I think it would resolve any issues we may have with wrapping. It
> > still means effectively reverting 2305b809be93 ("arm64: uaccess:
> > simplify uaccess_mask_ptr()"), though.
> 
> If we do bring that back, it'd be nice if we could do that without the
> CSEL+CSDB, as the CSDB is liable to be expensive on some parts (e.g.
> it's an alias of DSB on older designs).

DSB?! Are you sure? I thought it was basically a NOP for everybody apart
from a small subset of implementations.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
