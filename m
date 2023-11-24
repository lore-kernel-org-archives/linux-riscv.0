Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F9C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UrLZ0CNpaEDz/nqynsmF4u8/yy7W6KRnFmwljht9xtI=; b=0dlb8mtPBNJuHR
	BLo0u0xcWPN+AUcLrF2hcnhgs9oP4kD4D4AojrxVv3kB3QAXlvUWIu1zdLc1a9VebMcf9s2ZNziXP
	ujP6B4KMskpHQqpy2Bo0irTNj6pzcqR3awcJAThNDPiFxJl+IZ7m6KN2GQ4NxguoXhYWeb9/aCqIJ
	RW0bflLh0NaNQQl06nxXwz3Eec6Rf9ya1xfOo2n9hq86idjkiyZJWFmLRe1nmQ2S35QToQaZKthg7
	5NDIqo5Y0OHuKb71AwnPTpxuEEemiBTH0wFG6OgaWiQJfUJRGkQXRxgza0y1MYvYL5YpDr0WP0v8/
	iHgvF1TADTeTT5VsgaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TDd-006naJ-1b;
	Fri, 24 Nov 2023 10:15:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TDc-006nZG-1D
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Nov 2023 10:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X/ymfIJYGS3rgfsyyKZPvatWK1hMRdU56iYMTo6mr84=; b=rCFKbF3mDACBFhTXzRNdFrFO4O
	eoXOKmJ9nZiGJbfFMIBv6nwz3CsjBdIoMhWkUoG1xIESyQX9y7utknNb2crx4yYaVl0TokaNQnX59
	UQEefO9tha/lsxyx4F65ZPyZ5QCqVo0rlZL/kdkYuCLGIjIenfBE0G4ANfmh4TiCyiHjQw5pCSoOw
	9nE6YLG7xrJLF6VvKnJbRf5H0lcpRBYkeFjXyVCwHcJ8GALVBfL/W2eebEDWHFXmQx9wxeHAVLh5J
	AP7Md+iD5Lbnbp5HhKqJfhCerVvC52VYb0wyb/cpFm3UZZNXbX+76free6tqI6J6N/OKWjkdwAGLS
	Lh31sbQw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TDU-00DqKC-0M;
	Fri, 24 Nov 2023 10:15:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 83119300338; Fri, 24 Nov 2023 11:15:19 +0100 (CET)
Date: Fri, 24 Nov 2023 11:15:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <20231124101519.GP3818@noisy.programming.kicks-ass.net>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> =

> The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
> CSR to switch the memory consistency model at run-time from RVWMO to TSO
> (and back). The active consistency model can therefore be switched on a
> per-hart base and managed by the kernel on a per-process/thread base.

You guys, computers are hartless, nobody told ya?

> This patch implements basic Ssdtso support and adds a prctl API on top
> so that user-space processes can switch to a stronger memory consistency
> model (than the kernel was written for) at run-time.
> =

> I am not sure if other architectures support switching the memory
> consistency model at run-time, but designing the prctl API in an
> arch-independent way allows reusing it in the future.

IIRC some Sparc chips could do this, but I don't think anybody ever
exposed this to userspace (or used it much).

IA64 had planned to do this, except they messed it up and did it the
wrong way around (strong first and then relax it later), which lead to
the discovery that all existing software broke (d'uh).

I think ARM64 approached this problem by adding the
load-acquire/store-release instructions and for TSO based code,
translate into those (eg. x86 -> arm64 transpilers).

IIRC Risc-V actually has such instructions as well, so *why* are you
doing this?!?!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
