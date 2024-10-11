Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F495CFD364
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqNSBEI89CdMCH2f+cSmmHCIHHv1Lj5X5HYvxDHKscg=; b=EO52p3zmiYtd21
	Cd/O1YgL9Zr0CNvxaGt+KxSDF6OEn1Ahx/njzjgmboh3LhGIV2Lz17GE0JMLB/EsPNOQBpLONWe43
	YMvq09adBUedtij0RVMuvKikySBDlEu1UfMCKGHQM+DdLDbXklqrxWvvdRvvcDl4H2TxT9MQ4XlTJ
	zKnrZvxxz2xhnwUM39EXsx4VHkpxyrkZJP0jskvXNQZHZ5YrewL6OYVxbxstQdmTHa+lUGcC9ib+5
	qIHdg47GWtl4h4jTM0JlfEbplxdjq2ZyYK2qq+EpYOGKmROc7zsNjEeBBKLGluXAFpoYftguBCiiE
	ANGQpKovJVr668CPoK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szEKw-0000000GCko-4AJF;
	Fri, 11 Oct 2024 12:01:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szDFE-0000000G3aM-24DZ;
	Fri, 11 Oct 2024 10:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RFh+ifNvxIfeMOvqcH0bj2fqZ4Q/KL50BBcyRrIOPlM=; b=GDJmAqtaN6oH11wTx1qLaskHBj
	zKYQwLVIA745qR3XAZTUCnNXBWgIs98fHs0b+YRlR50Lm0umA08Iq8JsIdLAj2T+Tkqbu7LxdkgLk
	6O1X26CvtGsrd430wJE9VIEtPhffGg5N1z0vYjn+IrwRxG9XuQecXwHeokGtSSMaCM9JPQwEZJGh9
	TMDnpYZvd5YbAwdhTuTnxIbpolCuKa2bUaYZUYTy8AjkbS7UXnmFbdVw/5HPvDwC/17RFNoyknmL5
	pK3S4TsmZA7NSkcw4WgqUfjKPPYwa00xJ99bh9WK9dAUF9oGkN6i9RmoJjDsx/YznY0MH8BF7QDUC
	MHDIF74g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1szDFA-00000005reF-3H66;
	Fri, 11 Oct 2024 10:51:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5C0AE300642; Fri, 11 Oct 2024 12:51:36 +0200 (CEST)
Date: Fri, 11 Oct 2024 12:51:36 +0200
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
Message-ID: <20241011105136.GP17263@noisy.programming.kicks-ass.net>
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
 <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
 <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
 <ZwewMw8jBh6OU-L_@J2N7QTR9R3>
 <20241010110344.GL14587@noisy.programming.kicks-ass.net>
 <20241010113748.GL33184@noisy.programming.kicks-ass.net>
 <CANiq72=kT9RFcQ3h5U+wAY0pDQQqGU7BTtiPJ-oiHNUG00z3=w@mail.gmail.com>
 <20241010130421.GG17263@noisy.programming.kicks-ass.net>
 <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72kbApTtdLeow5L6G6t4Q_L-0zkDwfwyWcSb_e6P=kO06g@mail.gmail.com>
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

T24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMDQ6NDg6NDFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDEwLCAyMDI0IGF0IDM6MDTigK9QTSBQZXRlciBaaWpsc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4KPiA+IEFsc28gbm90IHJ1c3Qtc3JjLCBi
ZWNhdXNlIGZvciBzb21lIHJlYXNvbiB5b3UncmUgbm90IGFjdHVhbGx5Cj4gPiBmcmVlc3RhbmRp
bmcgOi8KPiAKPiBJdCBpcyB0aGVyZSwgYnV0IGl0IGlzIGEgc3VnZ2VzdGVkIHBhY2thZ2UsIHNv
IEkgdGhpbmsgeW91IHdvdWxkIG5lZWQKPiBlLmcuIGAtLWluc3RhbGwtc3VnZ2VzdHNgOgo+IAo+
ICAgICBodHRwczovL3BhY2thZ2VzLmRlYmlhbi5vcmcvdHJpeGllL3J1c3QtYWxsCj4gCj4gUmVn
YXJkaW5nIGZyZWVzdGFuZGluZywgd2UgdXNlIGBub19zdGRgLCB3aGljaCBvbmUgY291bGQgYXJn
dWUgaXMKPiBzaW1pbGFyIHRvIEMncyBmcmVlc3RhbmRpbmcuIFRoYXQgaXMsIHdlIHVzZSBgY29y
ZWAsIHdoaWNoIGlzIGEgc3Vic2V0Cj4gb2YgdGhlIGZ1bGwgKGhvc3RlZCkgc3RhbmRhcmQgbGli
cmFyeSwganVzdCBsaWtlIEMgcmVxdWlyZXMgc29tZQo+IGhlYWRlcnMgZXZlbiBpbiBmcmVlc3Rh
bmRpbmcuCj4gCj4gSG93ZXZlciwgSSB0aGluayB5b3UgbWVhbiBub3QgZXZlbiB1c2luZyB0aG9z
ZQo+IGhlYWRlcnMvc291cmNlcy9saWJyYXJpZXMsIHdoaWNoIGlzIGZhaXIuIFJ1c3QgY2FsbHMg
dGhhdCBgbm9fY29yZWAsCj4gYnV0IGl0IGlzIGN1cnJlbnRseSBpbXByYWN0aWNhbCB0byB1c2Uv
bWFpbnRhaW4gYW5kIHRoZXJlIGFyZSBhIGxvdCBvZgo+IHVzZWZ1bCB0aGluZ3MgaW4gYGNvcmVg
IHdlIHdhbnQgdG8gdXNlIGFueXdheSwgc3VjaCBhcyB0aGUgYFJlc3VsdGAKPiB0eXBlOgo+IAo+
ICAgICBodHRwczovL2RvYy5ydXN0LWxhbmcub3JnL2NvcmUvCj4gCj4gVGhlcmUgYXJlIHNvbWUg
dGhpbmdzIHRoYXQgd2UgY291bGQgcmVtb3ZlLCB0aG91Z2gsIHdoaWNoIGlzIHdoeSBJCj4gYXNr
ZWQgbG9uZyBhZ28gZm9yIHdheXMgdG8gcmVtb3ZlIHVubmVlZGVkIHRoaW5ncyBmb3IgdGhlIGtl
cm5lbAo+ICgibW9kdWxhcml6YXRpb24gb2YgYGNvcmVgIikuIFdlIGdvdCBgbm9fZnBfZm10X3Bh
cnNlYCwgaW1wbGVtZW50ZWQgYnkKPiBHYXJ5IGJhY2sgaW4gMjAyMSwgYW5kIHdlIGNvdWxkIHBl
cmhhcHMgZ2V0IG1vcmUgaW4gdGhlIGZ1dHVyZSBpZgo+IHJlYWxseSBuZWVkZWQuCgpTbyB5b3Ug
Y291bGQganVzdCBjb3B5IHRoZSBiaXRzIGZyb20gY29yZSB5b3UgbmVlZCBpbnRvIHRoZSBrZXJu
ZWwgdHJlZQphbmQgbGVhdmUgb3V0IHRob3NlIGJpdHMgeW91IGRvIG5vdCwgYW5kIG9jYXNzaW9u
YWxseSB1cGRhdGUgdGhlbSB3aGVuCm5lZWRlZCwgcmlnaHQ/Cgo+ID4gWWVhaCwgYnV0IHRoZW4g
eW91IGhhdmUgdG8gZmlyc3Qga25vdyB0aGF0IHdlIGhhdmUgdGhpcyBmaWxlIHRvIGJlZ2luCj4g
PiB3aXRoLgo+IAo+IFRoYXQgaXMgZmFpciwgYnV0IGhhcmQgdG8gZml4LiBXZSB0cnkgb3VyIGJl
c3QgdGhvdWdoOiB0aGUgIlJ1c3QiCj4gZW50cnkgaXMgaW4gdGhlIGZyb250IHBhZ2Ugb2YgdGhl
IGtlcm5lbCBkb2NzIGFscmVhZHksIGFuZCB0aGUgZmlyc3QKPiBwYXJhZ3JhcGggb2YgdGhhdCBw
YWdlIGxpbmtzIHRvIHRoZSAiUXVpY2sgU3RhcnQiIGd1aWRlLgoKSSdtIG5vdCByZWFsbHkgYSBi
cm93c2VyIGNlbnRyaWMga2luZGEgZ3V5LCB0aGUgZnJvbnQgcGFnZSBpcyBiYXNoIGluCnRoZSBz
b3VyY2UgdHJlZS4gVXNpbmcgdGhlIGJyb3dzZXIgaXMgYmVsb3cgYml0Y2hpbmcgYWJvdXQgc3R1
ZmYgb24gSVJDCjotKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
