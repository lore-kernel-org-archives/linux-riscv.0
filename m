Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900BCC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHxuFs3FVJwqOiQLtYhkfASfuSjrzVyjLLQ617pxgDw=; b=HcIPwhbBQGcqO7
	jO7+TgMetxudTewSyAo801CadoKreLRfBXElQk7FBYgxbiX0EXENcRwOWxxEtsvXXX4WL3jtgSoVC
	QhsuZ6oz2pYVy9tfUTKLBJHi8MM8z3OkKcWDQaK2HNrpQo26ByqtCAUPJ0NDaPaQV5syby6F+7A5b
	WGvBiMxLeHhZstc8Fq6dQt2q1PRkcbs8PD2qOfei6D25W+GNQVOHur6M7BVSx4VQhggNOSyUoG4gI
	gbaxCIV7b9z54GOp+Lzo0JdtRgFm05+KQpSItplG5+rnAoPOvVi1u7Zrd3hG0RELL491KAV9t8AG7
	MvPt4Cx2fihNE3vO25OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSXd-00000006vcu-3nsy;
	Wed, 26 Jun 2024 13:18:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSXb-00000006vbr-0Cb8
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 37145CE1385;
	Wed, 26 Jun 2024 13:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6430C2BD10;
	Wed, 26 Jun 2024 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719407903;
	bh=Xk8ky9rWubFRDvOqNNCu5URqZvtq2rKG2Zujpppq++M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjAgiLLLqdOjLAXy1WPPe0Qq09T3mCgkYwQSQ1Buiz33FYBwU63D/hE8OSzvPenaT
	 6xrl1z0tZSkIISV/+nz0ip2gLgD+yR/Qa8pIJztGnksbnQ9DdtkPEJ8NrN1xCyQazq
	 mXbRt69GDe8JAfS69u5G56ObwSVho0t7aYL/Appwg4QB21kQFlVpeAb0Axf0wkOAG/
	 zBiZt9vJuO09RYXW5rlvjwIsln1AQzAMAcvRQtLGakdg85o2qgVyWFOL7mKVznS0BM
	 VYiln/kHHtVACFxPGtxVTCkWB4jum853XAfWe4pFAzIuaDxThTaW4QTfWuLpJQf3DX
	 eegTc/XOHanzQ==
Date: Wed, 26 Jun 2024 21:04:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
Message-ID: <ZnwR0_MkAJW6i5sk@xhacker>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
 <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjDrx1XW1oEuUap=MN+Ku_FqFXQAwDJhyC5Q1CJkgBbFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_061827_291716_CBB0C457 
X-CRM114-Status: GOOD (  23.95  )
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

On Tue, Jun 25, 2024 at 11:12:16AM -0700, Linus Torvalds wrote:
> On Tue, 25 Jun 2024 at 00:22, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I think the only bets we really need from an architecture
> > here are:
> >
> > - __enable_user_access()/__disable_user_access() in
> >    the label version
> 
> KCSAN wants user_access_save/restore() too, but yes.
> 
> > - __raw_get_mem_{1,2,4,8}() and __raw_put_mem_{1,2,4,8}()
> 
> You still need to split it into user/kernel.
> 
> Yes, *often* there is just one address space and they can be one "mem"
> accessor thing, but we do have architectures with actually separate
> user and kernel address spaces.
> 
> But yes, it would be lovely if we did things as "implement the
> low-level accessor functions and we'll wrap them for the generic case"
> rather than have every architecture have to do the wrapping..
> 
> The wrapping isn't just the label-based "unsafe" accesses and the
> traditional error number return case, it's also the size-based case
> statements ("poor man's generics").
> 
> The problem, of course, is that the majority of architectures are
> based on the legacy interfaces, so it's a lot of annoying low-level
> small details. I think there's a reason why nobody did the arm64
> "unsafe" ones - the patch didn't end up being that bad, but it's just
> fairly grotty code.
> 
> But apparently the arm64 patch was simple enough that at least RISC-V
> people went "that doesn't look so bad".
> 
> Maybe other architectures will also be fairly straightforward when
> there's a fairly clear example of how it should be done.

>> We have something like this already on powerpc and x86,
>> and Linus just did the version for arm64, which I assume
>> you are using as a template for this. Four architectures

Yep, this series is inspired by Linus's patch series, and to be honest,
some code is borrowed from his arm64 version ;) I saw he improved
arm64, then I thought a nice improvement we want for riscv too, can I do
similarly for riscv? 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
