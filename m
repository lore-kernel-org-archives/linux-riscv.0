Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB021EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElFfQ1Qhgy0/BwLIhPGM4kYj97ysLjPsuqH6c3kia30=; b=xfLLvGuabMLr+E
	kUR3lJXy1B9o/DHJuJp7pkdlok8RHWiukweYN9YR/MPvHmPL6t0Qb9WchBuA+kqZAiX0cbujifCLC
	kBcbhaGzIWrNVOmh8qb2zGs1TvnY5qP3m/105nOMB30rNyayyGbcZnGOxYRmIgRKPUkAOGMHA+EZE
	narXz5AFXJxFJ0mc/0LQX4WL0HmmQTmbODyz2cYjdaQmPkCnkGwUOPGQbpY4wqpmrS8yYkK8Cu6pb
	n6qdWbeRxMdumF1DS+UFeuVO20WaJxnln3aE0vd1rcWnC35kPiwln+iS14gEc7mshv+aMHzyMutAr
	9TTNlBKfcB4OHmQDz7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BGt-009B8w-1C;
	Tue, 13 Jun 2023 21:09:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BGn-009B76-2e;
	Tue, 13 Jun 2023 21:09:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 459FD63B01;
	Tue, 13 Jun 2023 21:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CA2C433C0;
	Tue, 13 Jun 2023 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686690580;
	bh=CnDPIeLogwBWCfXwDFCGYSnn6freMhcPiMKmnauZmK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwHrH/UtQy5gtJuV6CZdRxLuHzTaAkiUGIx/JgEU65AMLsBIKZ0sWdlw1vTEQYgdy
	 gSLYt19YIoeRBe5zYzLlgTuRTMMo3kgRmlRYZUwN9+y0DX2gj67q8Dp8pJtQUo0gHp
	 Oy60KuQPQMSSexOGqUQrMmT3Fgb1GBewXzaMMxDEmcoyUN9bNnKzEk/bEsVagentbs
	 IrjokONRoY0TE+yzqvQqq0avTQyKOfbb7gZycLtP7znx6sVR7tnvKBFHLqFKSVwEs2
	 kIA6GPsL9JTaWmKMWc1Wdyo1oerK/huG9zsVu6RfIYfLEAg8ULTJ9IL3DRtm5ddTXF
	 JrMlJp241w1cA==
Date: Wed, 14 Jun 2023 00:09:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Song Liu <song@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <20230613210900.GV52412@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com>
 <20230608184116.GJ52412@kernel.org>
 <ZIi7zmey0w61EG25@moria.home.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZIi7zmey0w61EG25@moria.home.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_140941_944508_B0DA2DC2 
X-CRM114-Status: GOOD (  29.15  )
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

T24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMDI6NTY6MTRQTSAtMDQwMCwgS2VudCBPdmVyc3RyZWV0
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDA5OjQxOjE2UE0gKzAzMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAwNiwgMjAyMyBhdCAxMToyMTo1OUFNIC0w
NzAwLCBTb25nIExpdSB3cm90ZToKPiA+ID4gT24gTW9uLCBKdW4gNSwgMjAyMyBhdCAzOjA54oCv
QU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+IAo+ID4g
PiBbLi4uXQo+ID4gPiAKPiA+ID4gPiA+ID4gPiBDYW4geW91IGdpdmUgbW9yZSBkZXRhaWwgb24g
d2hhdCBwYXJhbWV0ZXJzIHlvdSBuZWVkPyBJZiB0aGUgb25seSBleHRyYQo+ID4gPiA+ID4gPiA+
IHBhcmFtZXRlciBpcyBqdXN0ICJkb2VzIHRoaXMgYWxsb2NhdGlvbiBuZWVkIHRvIGxpdmUgY2xv
c2UgdG8ga2VybmVsCj4gPiA+ID4gPiA+ID4gdGV4dCIsIHRoYXQncyBub3QgdGhhdCBiaWcgb2Yg
YSBkZWFsLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBNeSB0aGlua2luZyB3YXMgdGhhdCB3ZSBh
dCBsZWFzdCBuZWVkIHRoZSBzdGFydCArIGVuZCBmb3IgZWFjaCBjYWxsZXIuIFRoYXQKPiA+ID4g
PiA+ID4gbWlnaHQgYmUgaXQsIHRiaC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBEbyB5b3UgbWVhbiB0
aGF0IG1vZHVsZXMgd2lsbCBoYXZlIHNvbWV0aGluZyBsaWtlCj4gPiA+ID4gPgo+ID4gPiA+ID4g
ICAgICAgaml0X3RleHRfYWxsb2Moc2l6ZSwgTU9EVUxFU19TVEFSVCwgTU9EVUxFU19FTkQpOwo+
ID4gPiA+ID4KPiA+ID4gPiA+IGFuZCBrcHJvYmVzIHdpbGwgaGF2ZQo+ID4gPiA+ID4KPiA+ID4g
PiA+ICAgICAgIGppdF90ZXh0X2FsbG9jKHNpemUsIEtQUk9CRVNfU1RBUlQsIEtQUk9CRVNfRU5E
KTsKPiA+ID4gPiA+ID8KPiA+ID4gPgo+ID4gPiA+IFllcy4KPiA+ID4gCj4gPiA+IEhvdyBhYm91
dCB3ZSBzdGFydCB3aXRoIHR3byBBUElzOgo+ID4gPiAgICAgIGppdF90ZXh0X2FsbG9jKHNpemUp
Owo+ID4gPiAgICAgIGppdF90ZXh0X2FsbG9jX3JhbmdlKHNpemUsIHN0YXJ0LCBlbmQpOwo+ID4g
PiAKPiA+ID4gQUZBSUNULCBhcm02NCBpcyB0aGUgb25seSBhcmNoIHRoYXQgcmVxdWlyZXMgdGhl
IGxhdHRlciBBUEkuIEFuZCBUQkgsIEkgYW0KPiA+ID4gbm90IHF1aXRlIGNvbnZpbmNlZCBpdCBp
cyBuZWVkZWQuCj4gPiAgCj4gPiBSaWdodCBub3cgYXJtNjQgYW5kIHJpc2N2IG92ZXJyaWRlIGJw
ZiBhbmQga3Byb2JlcyBhbGxvY2F0aW9ucyB0byB1c2UgdGhlCj4gPiBlbnRpcmUgdm1hbGxvYyBh
ZGRyZXNzIHNwYWNlLCBidXQgaGF2aW5nIHRoZSBhYmlsaXR5IHRvIGFsbG9jYXRlIGdlbmVyYXRl
ZAo+ID4gY29kZSBvdXRzaWRlIG9mIG1vZHVsZXMgYXJlYSBtYXkgYmUgdXNlZnVsIGZvciBvdGhl
ciBhcmNoaXRlY3R1cmVzLgo+ID4gCj4gPiBTdGlsbCB0aGUgc3RhcnQgKyBlbmQgZm9yIHRoZSBj
YWxsZXJzIGZlZWxzIGJhY2t3YXJkcyB0byBtZSBiZWNhdXNlIHRoZQo+ID4gY2FsbGVycyBkbyBu
b3QgZGVmaW5lIHRoZSByYW5nZXMsIGJ1dCByYXRoZXIgdGhlIGFyY2hpdGVjdHVyZXMsIHNvIHdl
IHN0aWxsCj4gPiBuZWVkIGEgd2F5IGZvciBhcmNoaXRlY3R1cmVzIHRvIGRlZmluZSBob3cgdGhl
eSB3YW50IGFsbG9jYXRlIG1lbW9yeSBmb3IKPiA+IHRoZSBnZW5lcmF0ZWQgY29kZS4KPiAKPiBT
bywgdGhlIHN0YXJ0ICsgZW5kIGp1c3QgY29tZXMgZnJvbSB0aGUgbmVlZCB0byBrZWVwIHJlbGF0
aXZlIHBvaW50ZXJzCj4gdW5kZXIgYSBjZXJ0YWluIHNpemUuIEkgdGhpbmsgdGhpcyBjb3VsZCBi
ZSBqdXN0IGEgZmxhZywgSSBzZWUgbm8gcmVhc29uCj4gdG8gZXhwb3NlIGFjdHVhbCBhZGRyZXNz
ZXMgaGVyZS4KCkl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQuIFRoZSBzdGFydCArIGVuZCBjb21l
cyBmcm9tIHRoZSBuZWVkIHRvIHJlc3RyaWN0CmFsbG9jYXRpb24gdG8gY2VydGFpbiByYW5nZSBi
ZWNhdXNlIG9mIHRoZSByZWxhdGl2ZSBhZGRyZXNzaW5nLiBJIGRvbid0IHNlZQpob3cgYSBmbGFn
IGNhbiBoZWxwIGhlcmUuCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
