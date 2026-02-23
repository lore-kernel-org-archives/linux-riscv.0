Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84595EA4FBE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8wi2UPh7cPaz0o/VuH8gV8P6uQAO3d88hbROEr4eZU=; b=mHLBOTzRj1keim
	X9IosN+jlhnK3QKs51ueduy9ffkiYPH7gbPAFh9hRAVcBfB0bwMir3vAbdcYVmYGDHeYRWQWYzIxR
	8aW9y9BleC4hEQzTrmy6hilBV2rrw3FeP2pUTa8kuFm01X2j1R2k4pJX3R1xK45YDrpmuLweP+jWx
	aurSSMJ6G1W997TGjjpoOyWKhPaZWui3TpgoJZtK8/5w4Gn6qjM68tZNTnNOpqVngRgT7gGHVRzIv
	2L5eMr2zfh8TddT8ggdlOTu6ZUxUzX5fxnHdOT2R1KVgbzPk302yOafiht5OKBXoRFzD1RuTcsPcA
	whB+kPJq/jhZ40WXpIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWBe-00000000Oa1-1JuD;
	Mon, 23 Feb 2026 13:41:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWBd-00000000OZN-0uLY;
	Mon, 23 Feb 2026 13:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20C7860054;
	Mon, 23 Feb 2026 13:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA27C116C6;
	Mon, 23 Feb 2026 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771854079;
	bh=G4xM/SndGrcKzoMti1IbjGgUXMX7iGWpd7VzF1HsCkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quWJDzXDfK47UBN+js1H5DHlQFCyUPIGriWbWe90osVL2fapOYnlgi+UPZu7eq/bl
	 4i5ThdsOz1/+WuVGxLqMCKltbhgHt7bjxI7sUmKGsMAE3dzcEKdJqvO8Azz1CY32Mj
	 TWaHh4cZbW48qFYjP1vYjWws7K1UNdsdNPpBESXnFynEzf8V9zjoRqcM6iLSsnrLWd
	 8pLsXdKf2ubyGcvpCIe3JfqRteKH4DC3HW+obTzhsv13AN0N/EBxMm85fUuodbA2vK
	 9/qxJThq5lNjp9V1zLbkm49fcoyvl4WOkBCsux0bzb3c1IMO0n72oozYaJbKy5bPYu
	 6u6uYvFxT927A==
Date: Mon, 23 Feb 2026 21:22:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, ardb@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
Message-ID: <aZxUpATkNI5_PbNl@xhacker>
References: <20260220090922.1506-1-jszhang@kernel.org>
 <20260220090922.1506-3-jszhang@kernel.org>
 <877bs4wi0c.ffs@tglx>
 <aZxLE-wNGaEGDHGI@xhacker>
 <aZxSEoFkXMg18qLV@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZxSEoFkXMg18qLV@J2N7QTR9R3>
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

On Mon, Feb 23, 2026 at 01:11:46PM +0000, Mark Rutland wrote:
> On Mon, Feb 23, 2026 at 08:41:55PM +0800, Jisheng Zhang wrote:
> > On Sun, Feb 22, 2026 at 11:06:11PM +0100, Thomas Gleixner wrote:
> > > On Fri, Feb 20 2026 at 17:09, Jisheng Zhang wrote:
> > > > Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> > > > is a pointer which is set during booting, and every irq processing needs
> > > > to access it, so it sits in hot code path. We can use the
> > > > runtime constant mechanism which was introduced by Linus to speed up
> > > > its accessing.
> > > 
> > > The proper solution is to use a static call and update it in
> > > set_handle_irq().  That removes the complete indirect call issue from
> > > the hot path.
> > 
> > + Ard, Mark,
> > 
> > Good idea. The remaining problem is no static call support for current
> > GENERIC_IRQ_MULTI_HANDLER (or similar, arm64 e.g) platforms.
> 
> There are various reasons for not supporting static calls, and in
> general we end up having to have a fall-back path that's *more*
> expensive than just loading the pointer.

indeed, if arch doesn't support static call, the fall-back addes one
more loading overhead.

> 
> > For arm64, Ard tried to add the static call support[1] in 2021, but
> > Mark concerned "compiler could easily violate our expectations in
> > future"[2],
> 
> To be clear, that's ONE specific concern, not the ONLY reason.
> 
> > and asked for static calls "critical rather than a nice-to-have"
> > usage.
> > 
> > Hi Ard, Mark,
> > 
> > Could this irq performance improvement be used as a "critical" usage for
> > arm64 static call? Per my test, about 6.5% improvement was seen on quad CA55.
> 
> As per my other mail, does this meaningfully affect a real workload?

This improves generic irq processcing, I think all real workload is affected.

> 
> > Another alternative: disable static call if CFI is enabled, and give
> > the platform/SoC users chance to enable static call to benefit from
> > it.
> 
> Who is this actually going to matter to?
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
