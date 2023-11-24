Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDB8C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3QyPPKcp90srIFvpzJGr+LUXdv+mUlXLIEVykL5KDw=; b=0wZnOH/KrWSNuY
	tKs9FucA6RNKR3qegVVwSxwCxiTfLBNE4BShDxYpySTxRLNi8zyRpqKLR9h/pzzgZvX0mDV4MITb3
	hhAajFzQw3HWQHM1VYs0iFSs8+yih0oYVifP0m9+GWjPHCvkEtRbRhUzq74ldJ7okr0B8NXwX1s9a
	kNxsA6vcgcllHsLcTdsFGh1MZgH+70A7D4dV1pLYEcMxnPEzZ1gyfbMb80Mg7kEeJtsiaNgiPP7sT
	olvkT0T9pAxpHFR4ofGHpPiuE//gpyI7VlkUpGx34pJD/aBPcvIoUNsiPV3WOkOcs3e/twV/yIGWh
	QaqbNlYCUlC+xTk1AJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UgM-0071gv-12;
	Fri, 24 Nov 2023 11:49:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UgL-0071fS-0K
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Nov 2023 11:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g2br9i5oVEFFKP6oznFGcsnlECZEB7rizFD+TXrD/V0=; b=OfZSxK7tHGjPx2aM/O09q+wpD6
	tsNP23s7bcEHNuCY49Nz5kLSp7e6APQRQvtN/rs278deKVNMY5mAX1whe1GURSk9FUiQmKyloPBur
	mhLN8R31mYfHJcygz9bPzPMVMp3fjbaQp9vi5BO8Os0xQEG82n42Q6HSd13YXgq/+uYIphZgk2Unf
	SlMO4bTEF79QOtXKbUibinr1FvkRvJGhCtvUR1LZu7aNLVLjpq2XieCXjVQQzeqU1F0gODSk35sDl
	zTfmz0K4ggZEGx9ujdHUgJydr6F6AsO4AmtEDwO1rXbzGCa9/NEEX+qVqDKOEpzzZF7MFrmnvQPX6
	/lbblrow==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r6UgF-008X2F-Nj; Fri, 24 Nov 2023 11:49:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D9453002BE; Fri, 24 Nov 2023 12:49:06 +0100 (CET)
Date: Fri, 24 Nov 2023 12:49:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
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
Message-ID: <20231124114906.GR3818@noisy.programming.kicks-ass.net>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
 <20231124101519.GP3818@noisy.programming.kicks-ass.net>
 <CAEg0e7j1AvzTyaQ45wUP9QnsMpCG=ZMzcLNFYhGPPSgAwsty6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEg0e7j1AvzTyaQ45wUP9QnsMpCG=ZMzcLNFYhGPPSgAwsty6A@mail.gmail.com>
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

On Fri, Nov 24, 2023 at 11:53:06AM +0100, Christoph M=FCllner wrote:

> > I think ARM64 approached this problem by adding the
> > load-acquire/store-release instructions and for TSO based code,
> > translate into those (eg. x86 -> arm64 transpilers).
> >
> > IIRC Risc-V actually has such instructions as well, so *why* are you
> > doing this?!?!
> =

> Not needing a transpiler is already a benefit.

This don't make sense, native risc-v stuff knows about the weak stuff,
its your natve model. The only reason you would ever need this dynamic
TSO stuff, is if you're going to run code that's written for some other
platform (notably x86).

> And the DTSO approach also covers the cases where transpilers can't be us=
ed
> (e.g. binary-only executables or libraries).

Uhh.. have you looked at the x86-on-arm64 things? That's all binary to
binary magic.

> We are also working on extending ld.so such, that it switches to DTSO
> (if available) in case the user wants to start an executable that was
> compiled for Ztso or loads a library that was compiled for Ztso.
> This would utilize the API that is introduced in this patchset.

I mean, sure, but *why* would you do this to your users? Who would want
to build a native risc-v tso binary?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
