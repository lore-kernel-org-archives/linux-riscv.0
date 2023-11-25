Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618A3C61D97
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 02:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxxb40sR67ubokNN+7P1+0jOtNvff+SXe+cE9zivkKw=; b=ITWowNX0U81F+0
	Y0bIzaCVBLs5g6Isvvy/x4ZqvAILmEPhYsJQzRIya8h4/c23R69mkg17WhqGyarv/V3HfBh5sXNOS
	qi4FKbbIa7dU/VxjoCeHHvbgcJWZdSBIOmDGj051PzVEDh8QEw6XjnOqc/ZXJN01GUeNEgiUJL4H9
	nM9Sh6kkG25ttFoRH26C/c+HS45w9xyZZCLpNHpcxdcXb9VqgyICR1fkH4SdPyYcrIg26153Nn20W
	U2Yx3x57g9gja02BVCvPsSPbBskhELrNIIm7q1vct+0Z8HPQLgqIroEHDPPMPXbx+Yc53awlmsOrW
	ARLDTFdlh0vj9Som5l6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6imC-008S0i-21;
	Sat, 25 Nov 2023 02:52:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6im9-008Ry5-2D
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 02:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 98B32CE2C2D;
	Sat, 25 Nov 2023 02:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA405C433C8;
	Sat, 25 Nov 2023 02:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700880720;
	bh=G7lavvFw0e1K+LDAj1itFIJyfwyENT1UAuWAhJuGE90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myTtRdyUf1//5T3yASQ1Bcrqb9NxZjyGP/ssOpEGFf8wUIFfMgkoJfBmBudup6CWl
	 BPpBfiIDvCk7Ykf0YaxjEaQ2DOQxs8fi94CCnJPkfw+j6V+GcPiLO4zUgcIqdJTDKp
	 9ArWa+niZLE6lXFueH9UTF3KPJK5KLJZ61EZwvtLS1W4E54EeKnUvQusN0viEIeHpb
	 Y30NBQxBJbEFkS8zUI4gTHD5fefcMuHVqlzf37Vgi1sYU0iI5ce0W2ZF/NsE+2VlRD
	 GxM8x710grHq3OQJNjh3RdcNMIvNL5wJrk/8Ghcp/Y6cUmnyPqAZHgWX8EmcNRisAI
	 zvwA5ijkED9yw==
Date: Fri, 24 Nov 2023 21:51:53 -0500
From: Guo Ren <guoren@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
Message-ID: <ZWFhSYalMCgTo+SG@gmail.com>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124101519.GP3818@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_185210_089027_6398BE15 
X-CRM114-Status: GOOD (  22.92  )
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

On Fri, Nov 24, 2023 at 11:15:19AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> > From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> > =

> > The upcoming RISC-V Ssdtso specification introduces a bit in the senvcfg
> > CSR to switch the memory consistency model at run-time from RVWMO to TSO
> > (and back). The active consistency model can therefore be switched on a
> > per-hart base and managed by the kernel on a per-process/thread base.
> =

> You guys, computers are hartless, nobody told ya?
> =

> > This patch implements basic Ssdtso support and adds a prctl API on top
> > so that user-space processes can switch to a stronger memory consistency
> > model (than the kernel was written for) at run-time.
> > =

> > I am not sure if other architectures support switching the memory
> > consistency model at run-time, but designing the prctl API in an
> > arch-independent way allows reusing it in the future.
> =

> IIRC some Sparc chips could do this, but I don't think anybody ever
> exposed this to userspace (or used it much).
> =

> IA64 had planned to do this, except they messed it up and did it the
> wrong way around (strong first and then relax it later), which lead to
> the discovery that all existing software broke (d'uh).
> =

> I think ARM64 approached this problem by adding the
> load-acquire/store-release instructions and for TSO based code,
> translate into those (eg. x86 -> arm64 transpilers).
Keeping global TSO order is easier and faster than mixing
acquire/release and regular load/store. That means when ssdtso is
enabled, the transpiler's load-acquire/store-release becomes regular
load/store. Some micro-arch hardwares could speed up the performance.

Of course, you may say powerful machines could smooth out the difference
between ssdtso & load-acquire/store-release, but that's not real life.
Adding ssdtso is a flexible way to gain more choices on the cost of chip
design.

> =

> IIRC Risc-V actually has such instructions as well, so *why* are you
> doing this?!?!
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
