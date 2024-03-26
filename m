Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCAAC54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 01:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yesrxLARmzKVEDoCv8d7IuP8eUZEeysVt7yAEag3ZRg=; b=yysmJLBzMOYcaF
	Qjc22HnouchCXF3EAxw7ipy1ZcrzK8I9gEyMrZD01zGG9Gjn4Od1GubGmyiYeDXTKwgpfPXmv41oU
	zEa2mfG6Fb6uneZEaCeDX6pFQh9avk9D+p9NgD7AZFS9rriSFXS4Z3VAKBee9Fpse6uNRQn3PYETH
	Clp6oSSnqNb8aGTfwF4wl9CJY/UGk9N2EyyZjStGi6x/rW+4VhTvKejKHVLapB4DYaRtH0mXKKEfz
	yotCbC+qyqmz/9f1m1Wcdqzs39px9a3SyYYLQUt+rTD6rzxyZ8t+PcYYkKw/ccR4oXWXuR8j5Wtdt
	JNZFtZ/dJeRpzxMVxw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovpT-00000002fsJ-3XtJ;
	Tue, 26 Mar 2024 01:42:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rovpQ-00000002fro-3Bvf
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 01:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98E7DCE1850;
	Tue, 26 Mar 2024 01:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FD2C433C7;
	Tue, 26 Mar 2024 01:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711417333;
	bh=OWRGZAoTwlD15MOqhJjmQoMizKHAtbh8DHOT9VrE1lQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ge0K347meeUSw5Cf4GUHdgcKEF+N9hl6GJfOzMa4jy+1DnbHNS+nFmpJlDxQV9Z4F
	 e9azU+DSqzdGM4VcSCl9hwAU2NbL7fVL82sAVhASLKTGFah5GSfx6BpLHCFvz7b53V
	 1VIjaQV/3QZfwWXInM8YE5q/UNf1azpCW/E1M7ljohoX/Rbk/ghiEdJ+bn7h7pU6Am
	 uGzBFD3TOCUPzjEI/6XA6h+JsV5PQNMOLOCLQH4Nn6RFYwEXVF2H2MhhYSCCAX14Xs
	 SXCHYkUyyBzWiBVPx1kuXgEl6YZG591UGkJ/u/ZYzY4fo9mt7inhSI/C56d4JrsyY/
	 mpgAV2lI4B0Jg==
Date: Tue, 26 Mar 2024 09:28:58 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Bo Gan <ganboing@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 1/5] riscv: nommu: remove PAGE_OFFSET hardcoding
Message-ID: <ZgIk2hmprnyGr_ce@xhacker>
References: <20240325164021.3229-1-jszhang@kernel.org>
 <20240325164021.3229-2-jszhang@kernel.org>
 <37d456c1-f0bd-1a78-2d0c-350ca25c6b8d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37d456c1-f0bd-1a78-2d0c-350ca25c6b8d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_184217_030499_77E151B6 
X-CRM114-Status: GOOD (  25.18  )
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

On Mon, Mar 25, 2024 at 03:46:01PM -0700, Bo Gan wrote:
> On 3/25/24 9:40 AM, Jisheng Zhang wrote:
> > Currently, PAGE_OFFSET is hardcoded as 0x8000_0000, it works fine since
> > there's only one nommu platform in the mainline. However, there are
> > many cases where the (S)DRAM base address isn't 0x8000_0000, so remove
> > the hardcoding value, and introduce DRAM_BASE which will be set by
> > users during configuring. DRAM_BASE is 0x8000_0000 by default.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/Kconfig | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7895c77545f1..afd51dbdc253 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -247,10 +247,16 @@ config MMU
> >   	  Select if you want MMU-based virtualised addressing space
> >   	  support by paged memory management. If unsure, say 'Y'.
> > +if !MMU
> > +config DRAM_BASE
> > +	hex '(S)DRAM Base Address'
> > +	default 0x80000000
> > +endif
> > +
> >   config PAGE_OFFSET
> >   	hex
> >   	default 0xC0000000 if 32BIT && MMU
> > -	default 0x80000000 if !MMU
> > +	default DRAM_BASE if !MMU
> >   	default 0xff60000000000000 if 64BIT
> >   config KASAN_SHADOW_OFFSET
> > 
> 
> Thanks for this patch. I did something similar in my local nommu
> linux-6.8 tree in order to run it on the S7 hart of JH7110. I have
> another suggestion for you. Perhaps we should also make TASK_SIZE
> configurable, and let it default to `0xffffffff if 32BIT && !MMU`
> and `DRAM_BASE + DRAM_SIZE if 64BIT && !MMU`. Currently TASK_SIZE
> is effectively `0xffffffff if !MMU`, which doesn't work if I run
> rv64 linux-nommu with DDR that spans across 4G boundary.

I must admit that there's such nommu linux with 4GB DDR case in
theory, but it doesn't exist in real world: who will make such
strange platform ;) But anyway this improvement can be made when
the patchset talking about TASK_SIZE_MAX is settled down.

> 
> I see there's another patchset that tries to define TASK_SIZE_MAX
> for __access_ok(). Looks like that only affects the MMU case, and
> NOMMU is not touched. My aforementioned change won't conflict with
> it should it get merged.
> 
> Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
