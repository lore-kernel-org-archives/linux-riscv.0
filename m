Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C5CF11DA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6SSEZCmnASUpUYImmgKr7jEdUBJ1RdEpoZ/6L9s++M=; b=jRWsisYJaUfCmB
	CGs+LqNVaZytdgXnL5qdx/XCW45/SwVbp6LtgV57uB+5q4WvMVyPe1LFmX/SakQNFeghZ+4h8q771
	8+5MK7eHkrvtOUUyIOzAoFTNX7HdNhAw4d2e+Vit0N9eE4tgN+P2oke9ypOOwyyzy/bspgdP9d97u
	CT8WISfdKx4Z4VqsEOueKx0LDPrAVE4ytbDeyaKl+WtHDj45SWlp3GeT1pZVZmFIRPnMvpMrsmd/J
	9QzvuPU0usP3LLtP+5U24gOUzxm5Efo7sUSqs2ugcpauvaJSao8/2rnDgj+aLU1uyb/1K3ScXvDZO
	HM78h6vSA+IWOEhjr6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sys65-0000000CgAK-2FhQ;
	Thu, 10 Oct 2024 12:16:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syrUP-0000000CZNv-237t;
	Thu, 10 Oct 2024 11:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AeP6MXC9HVagnimcA4KeNuLvS+oXfaoCNFU0RDE/p3A=; b=J8LlM4R1b1U+EciwkUe/tANvQI
	8DBT9O/R7KRbKA+73LbRwefXAwtDpcxXrwGZymbwG5BGOFtHRSEZXN3gy3CjHWeOGcPi/uvhfBhLQ
	VHjH1xLXnSAojwoJ8wHciJVFbF7pUGP4vobY/z4lZjc3AHRcdpHjkNsgzhKXcZZyhEUsc3wOcgV3h
	feAUNdCRcLy5m8SYvZjzu64rXgUw+/Ie498vc9Oc4NVLk5u9dZKJ7yrMzX1e7k/+nE/4Gvlm/PbZI
	9J2DUlrccIhdMO+qBZYJBuCBI/TgFSlEouJ+Sv/IPksZtn2f+At0sRUmXiLXlZyE2lgZX+S/Z9qi/
	Y3ozu9rw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1syrUK-00000005Mv7-418t;
	Thu, 10 Oct 2024 11:37:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D65130088D; Thu, 10 Oct 2024 13:37:48 +0200 (CEST)
Date: Thu, 10 Oct 2024 13:37:48 +0200
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
Message-ID: <20241010113748.GL33184@noisy.programming.kicks-ass.net>
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
 <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
 <20241010110344.GL14587@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010110344.GL14587@noisy.programming.kicks-ass.net>
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

On Thu, Oct 10, 2024 at 01:03:44PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 10, 2024 at 11:45:07AM +0100, Mark Rutland wrote:
> 
> > What happens on x86 for ftrace and rust?
> 
> I can't seem to enable CONFIG_RUST, so I can't tell you :/

So much for the debian 'rust-all' package actually including all. Thanks
Boqun for telling me about the rustavailable make target.

Anyway, confirmed (x86_64) rust code does not have __fentry__ hooks and
cannot be traced :-(

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
