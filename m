Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B19ECF11CD
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRz+fI0lNVNViKmPhTizrD810ElWEazTSk95s3Ywl6c=; b=SHB5RMjuViUiHG
	3qepOqfE4dHU9OugCV/6RRoFXOaUK0bUt9SaljgIG4+kFUHiYVZyX3+gBu5OqPhtGcaE0XtcvlqcA
	5V8+G03LEyFC5XBtUo9qGVT/F85sOBmif8l25LNqL40lawFVJ+1X2WbYmj7961uuP1DA56zCXN5OM
	nBiS1GS09rGHabHH3H9LOSZMpunhxR0ySb0Ju6NHkJ/9LlTrBjbN3ldfMMIJFXHhOOdOGld3lKMlB
	svc11aUBzWMj2RtMhujESlZO5ttLQldpwp0l6VsMWd3uYzuMAKnTR2II92rpLEnNmKKJ10zgavXZj
	jHU+HJHT+WYdtBKqLwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syqxp-0000000CUaa-3BpY;
	Thu, 10 Oct 2024 11:04:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syqxR-0000000CUVa-04TW;
	Thu, 10 Oct 2024 11:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DYvkZ2vUGSAZbVyOfVMNm2kuUZQ1E+txfCU8aXfYNEM=; b=jhJjvP3DbEkCBmzUl3hpIVmzms
	mpT9IUEnM1KI0iW40ApHc531hjmlNo1agLYtYU4xcixTpF6gQDomNRgHE+yawTHq/xkfw5odBa1fN
	S2VFTgh1mobq7kXEeJmBtA//bFrJr8e4A34lOx3NsVJh0Z6Dfn35ypEXXUVlwJhdCS/rCJSxAiB5b
	d0fpFO94SMjQ2YSvxxsSX/6BssJA2eB4T0OFebLSENQoo7EOu/fE5A0cWXCBONata2FTBvM+4TT5T
	G5New8Zv7CWIOjCyrn8REp8vgM9wcPk/HRlzt3L2O8VWFON7CGqkHCbmpRAIBfOUGvCK9+Rtk+/pN
	2RBO6UnA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1syqxM-00000007S3m-2zmd;
	Thu, 10 Oct 2024 11:03:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4DF9930088D; Thu, 10 Oct 2024 13:03:44 +0200 (CEST)
Date: Thu, 10 Oct 2024 13:03:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all
 architectures
Message-ID: <20241010110344.GL14587@noisy.programming.kicks-ass.net>
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
 <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
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

On Thu, Oct 10, 2024 at 11:45:07AM +0100, Mark Rutland wrote:

> What happens on x86 for ftrace and rust?

I can't seem to enable CONFIG_RUST, so I can't tell you :/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
