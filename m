Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF928CF11F4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWsGN2pKsgRSIEKFN/imdxxMMy3wluiMEYdgciGCSkU=; b=QYMjvzCO9tM7ot
	YF58gZizYVqwkCbmNfLtHtqS0X7AnHKH7V2XEAylUn0HUCxQF0s6F4p+A9mJQDkvrphiBPf7PpjgT
	ijCqUVJG/wEeophjw+CgBMpSq7eIiZMXmihgi6Ibp6ZiZuJrWlt/na9w5/7vojhO6OLh5lWqngggX
	78fKm0Qiew/2HNfqq50w0wvZh9Ua571fOGJrVcOQB4q2gU14xqTmMqzdaXBihpDFQfqad86Lqih0z
	KWOaQGiNU0fWr7IEqp35jcHIQOWIlgpsihPHTsU6UMSdtAHI+Gi5C0rEjGDCiwkdg6oDU/GkYXy9Y
	kiR1+kjb3gA8IHDWXj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syt3W-0000000Ct2x-1R2K;
	Thu, 10 Oct 2024 13:18:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysqA-0000000CqNV-1149;
	Thu, 10 Oct 2024 13:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wMnFvbWqz9ropUMoiz6qWqM0+CHEQh7yRoQngEhXc1s=; b=cXB7wkFLBivDS3yBosTgcBVjU6
	lMPFx3K7BkWFhNLTa16uFn6XlZU0eHjss6Ee8gkUFIsapaHNiTK6YpSuHALbpfDhGYjj77gU4bMT9
	pU+GTrH25gyFcySYj67rPaKKI/ZJ7U5VzengieZwvzMk9jmn16Pv6McPaZKwbFfTaYyh9saZTLL3n
	WpiIp+LPfiahsmV19nxBYwB8bJSvJlVuOD+abV1ApyZu26RucMtFLZo+fLh0jIm4v6ga18+kb2Dk1
	FqZGGVAxFR/BjIR82IthqADcUKulfUiQJLcw7mEPBjAR3vOli2BxKdhib0ev/Ra/zJ+THUdNvIxs2
	8sVA23KA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sysq5-00000007dHZ-31rL;
	Thu, 10 Oct 2024 13:04:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 93A3030088D; Thu, 10 Oct 2024 15:04:21 +0200 (CEST)
Date: Thu, 10 Oct 2024 15:04:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alice Ryhl <aliceryhl@google.com>,
	Matthew Maurer <mmaurer@google.com>,
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
Message-ID: <20241010130421.GG17263@noisy.programming.kicks-ass.net>
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
 <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
 <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net>
 <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMDE6NDQ6MTRQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDI0IGF0IDE6MzfigK9QTSBQZXRlciBaaWpsc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IFNvIG11Y2ggZm9yIHRoZSBkZWJp
YW4gJ3J1c3QtYWxsJyBwYWNrYWdlIGFjdHVhbGx5IGluY2x1ZGluZyBhbGwuIFRoYW5rcwo+ID4g
Qm9xdW4gZm9yIHRlbGxpbmcgbWUgYWJvdXQgdGhlIHJ1c3RhdmFpbGFibGUgbWFrZSB0YXJnZXQu
Cj4gCj4gWWVhaCwgYHJ1c3QtYWxsYCBkb2VzIG5vdCBzZWVtIHRvIGluY2x1ZGUgYGJpbmRnZW5g
LCB3aGljaCBJIGd1ZXNzIHdhcwo+IHRoZSBpc3N1ZSAoPykuCgpBbHNvIG5vdCBydXN0LXNyYywg
YmVjYXVzZSBmb3Igc29tZSByZWFzb24geW91J3JlIG5vdCBhY3R1YWxseQpmcmVlc3RhbmRpbmcg
Oi8KCj4gSSBndWVzcyB5b3UgaGF2ZSBpdCB3b3JraW5nIG5vdywgYnV0IGZvciB0aGUgbmV4dCB0
aW1lIC8gb3RoZXJzLCB3ZQo+IGhhdmUgdGhlIGBhcHRgIGxpbmUgZm9yIERlYmlhbiBhdAo+IGh0
dHBzOi8vZG9jcy5rZXJuZWwub3JnL3J1c3QvcXVpY2stc3RhcnQuaHRtbCNkZWJpYW4uCgpZZWFo
LCBidXQgdGhlbiB5b3UgaGF2ZSB0byBmaXJzdCBrbm93IHRoYXQgd2UgaGF2ZSB0aGlzIGZpbGUg
dG8gYmVnaW4Kd2l0aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
