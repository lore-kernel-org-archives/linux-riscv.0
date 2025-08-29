Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B79FCA0FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 01:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJWaQEuMCtYHeou2XeKDF8/J5+DulBcpkjY5/cTWMFE=; b=PhCdvW+Znw+Kt2
	0RUhycbo2dps6BRS9Zh96KgTz4r9I4G0QQn9HtU2X/qF5Ds1sPDVcCXfIBM9+y0pP7+7Fkje0ljEz
	ykro0jElHdweSWyLhsCxnTDI2BkqpWc5D3YKJpxwwPlf+4Cec3/NBVfYhHftknkpsuRCcU4J7/yka
	aYwTGCszh+kl/9arBNIwvqGnYV1kP4G6exyZXW20Qp/zTLkXRhG0XhlE+j905ybSquxX4kJ62Vvqv
	e3eImpA3dGHdm9bpplTzzceJjPkKnFFzvjR3T9aSX4kFFjudAG8R/Aw68rQ9922SdlAeLwNxtlih8
	Vr545AHuMIMaeugIkw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uroHo-000000043rQ-2ao7;
	Fri, 29 Aug 2025 01:52:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uroF5-000000043Vh-0qC9;
	Fri, 29 Aug 2025 01:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A149543F48;
	Fri, 29 Aug 2025 01:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780CAC4CEEB;
	Fri, 29 Aug 2025 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756432166;
	bh=LnE97d/OL0MjX+YtgvWFnzZ3rGxg8lbiIKWtR2dnmu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfKb6ou7eLhltTeAmy5adRU6ZYG5j08nh6go592Gbcbr1P0UlEzUCAzDjIgy2eAIk
	 Q787xvixvGptbR1lhkWGF5Lnbiic0wqz4WXljmJQFKdma+i3KkWA+AaRCZre4h24vO
	 W6At4FWUuQH7m7eqXtD/8J51iu7jjUnFtxsH0U9kjq3MXSpLnx4UOwTwHWwsMO4ofk
	 11Qa7EZE1yp0Li8IVYIX3x6QoIgabURoYVT2Vut/4rlJX2vJVo48h5ZyTDBvpiXSrV
	 oGk/n02YrmDWDiXUZcrGecTkYdWCLgBnuYOOityAIMmy8zRjyITGkJvRfleXYq2wbI
	 HSav784NLGyBA==
Date: Thu, 28 Aug 2025 18:49:26 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508281848.A6EE3E4BA@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
 <20250827195753.GB3572128@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827195753.GB3572128@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_184927_263628_12772D55 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, Aug 27, 2025 at 12:57:53PM -0700, Nathan Chancellor wrote:
> On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> > From: Kees Cook <kees@outflux.net>
> > 
> > Add "debug" option for "cfi=" bootparam to get details on early CFI
> > initialization steps. Standardize CFI pr_info() lines to use "CFI:"
> > prefix. Standardize "CFI: Using ..." to always report which CFI mode is
> > being used, regardless of CONFIG_FINEIBT. Document all the "cfi=" options.
> > 
> > Signed-off-by: Kees Cook <kees@outflux.net>
> 
> I am not sure if the x86 maintainers are "patch count adverse" but it
> feels like this would be a little easier to review as four separate
> patches. Every sentence in the commit message is basically its own
> change.
> 
> 1. The initial documentation for cfi= and its current values.
> 2. Standardization of pr_info() calls to use "CFI:"
> 3. Adding "CFI: Using" to __apply_fineibt()
> 4. Adding cfi=debug
> 
> Patch four would become much simpler to understand, especially with
> Peter's suggested change.

Yeah, that's entirely fair. :) I will split this up.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
