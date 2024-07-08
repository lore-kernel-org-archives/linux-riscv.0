Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A3AC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 15:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP5oD9OwEBglZjD1Wj1+tZFzNj7FJnCL5k1nJIFZqGk=; b=oTJvfjLX0mWdIV
	WQPNPpEVthnoQ/82ByH06X/U+XjZNigqkH8Oux9aPXa02HAySR4K5mI26VkTJwKVY3V4Gt3I6RGJa
	qQBl0gZNIcOcMVmgHj8cb0m9bOr6ghUHEbGpH/V795MFXJY+UFLglpA/+FoAb+FN6HOmSXO+xSVwJ
	Y6imH69kltfBM9NkUIs6LSL60pnR32h5wbF5r/SLthTVMS2/N+r4tI56qm53vlObERmHkJgaYApb/
	zvtyzoTe4wv2fo6c5rB9NjGrUru6kK8hnUf9tDSJIztM22xBI9VwlQxljEwzeqUWHzLIed9SNLsxe
	bH6l5RnWNmH3pggg6Wrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqKU-00000004E3y-2miY;
	Mon, 08 Jul 2024 15:31:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQqKR-00000004E3F-0sc2
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 15:31:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 080AB1042;
	Mon,  8 Jul 2024 08:31:22 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6FE03F641;
	Mon,  8 Jul 2024 08:30:54 -0700 (PDT)
Date: Mon, 8 Jul 2024 16:30:52 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <ZowGLMX1xpuxlpqA@J2N7QTR9R3>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
 <CAHk-=wiv=9zGSwsu+=tKNgDg8oBUJn_25OEy_0wqO+rvz7p8wg@mail.gmail.com>
 <20240705112502.GC9231@willie-the-truck>
 <CAHk-=wgRgDy8_=uZPZr4LRyF7BiN1nDNzUx7iRzrD0g8O+bh3A@mail.gmail.com>
 <20240708135243.GA11898@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240708135243.GA11898@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_083059_314297_3D51E235 
X-CRM114-Status: GOOD (  24.83  )
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

On Mon, Jul 08, 2024 at 02:52:43PM +0100, Will Deacon wrote:
> On Fri, Jul 05, 2024 at 10:58:29AM -0700, Linus Torvalds wrote:
> > On Fri, 5 Jul 2024 at 04:25, Will Deacon <will@kernel.org> wrote:
> > So on x86-64, the simple solution is to just say "we know if the top
> > bit is clear, it cannot ever touch kernel code, and if the top bit is
> > set we have to make the address fault". So just duplicating the top
> > bit (with an arithmetic shift) and or'ing it with the low bits, we get
> > exactly what we want.
> > 
> > But my knowledge of arm64 is weak enough that while I am reading
> > assembly language and I know that instead of the top bit, it's bit55,
> > I don't know what the actual rules for the translation table registers
> > are.
> > 
> > If the all-bits-set address is guaranteed to always trap, then arm64
> > could just use the same thing x86 does (just duplicating bit 55
> > instead of the sign bit)?
> 
> Perhaps we could just force accesses with bit 55 set to the address
> '1UL << 55'? That should sit slap bang in the middle of the guard
> region between the TTBRs

Yep, that'll work until we handle FEAT_D128 where (1UL << 55) will be
the start of the TTBR1 range in some configurations.

> and I think it would resolve any issues we may have with wrapping. It
> still means effectively reverting 2305b809be93 ("arm64: uaccess:
> simplify uaccess_mask_ptr()"), though.

If we do bring that back, it'd be nice if we could do that without the
CSEL+CSDB, as the CSDB is liable to be expensive on some parts (e.g.
it's an alias of DSB on older designs).

> Dunno. Mark, Catalin, what do you guys reckon?

I think there's a slight variant of the x86 approach that might work,
I've posted in my reply at

  https://lore.kernel.org/lkml/ZowD3LQT_KTz2g4X@J2N7QTR9R3/

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
