Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7831C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 18:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HQfbKp1zyXMtLtuvoK7vMJEnQ6aV3dH+Hf4zAxCM0o=; b=pRC3yDA6HAbuvT
	dCPI4UNcm7wjRgxLdIQihN6D81E/amqTLb/lm8OMJyIWYm1WIq8omhpVG3WhjzCxY8cv74tIdwR2j
	iVFBmCzBG8C6Fe/bhCZTNgR1trZpELKJU6biHnYp2t6OdcsdDc7OKQ2+RaVDFJ3tfG+AgyEw9rOL+
	Xnxar3kHO2QhuwCmiDxW+RgqabPpLj7ELJ7JyqeJCavn//AquRfrW673qwMTpg/+JQmhmb+nKCEPt
	wslkBOYrrN+MhyXntTa24PhfKVX8JDDhWSlR2TE+Yg44aXrBKdpWHDWEz4He4DD299M1Gr9oqOL9J
	g0mXyWxlnFN1Tu052Oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvr0-0000000CgQA-3xPW;
	Thu, 10 Jul 2025 18:18:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtn8-0000000CM2t-41Dx
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 16:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BA345C6E9A;
	Thu, 10 Jul 2025 16:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171ABC4CEE3;
	Thu, 10 Jul 2025 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752163593;
	bh=Fk52qRo41GJW4xL0+HTc/RNFLjudUlL2qsEG2/excFE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Wn+yU0e9Luzl4qwqU/u3K5hKm02tu5Ou1bSFcFxwq+rE28/Xfjm1wXJgV9FN+FOb0
	 HC4uxzA8QyZCfr5uiSqpnoIBrR8PXgtmNqfzaTHN1laNLrd6I00yRAizy+pDUXjr/K
	 +UzGmKFxbomOecwvxWoDUQawtejSWMMKKlxkd8UhswNKpmf1e5yNMqFlAG75B3Xm22
	 3Vyj+IDc8fhD+OuWBvL/3LDjfgtT7FnMgyz33vo3afhvFQDc9R31KrHgkbbShA352H
	 7oDEsTn90JoGAPNLkS4i6A6DvnFLq9b+4UCMLMD1gxGNDAHF4HNx9nWUGQ7c0DtXpN
	 1qzZqWBlfsHag==
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 18:06:26 +0200
Message-Id: <DB8I5J8ZY7QF.2D8HEN6JX4HSZ@kernel.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Cc: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Benno Lossin" <lossin@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Drew Fustini"
 <fustini@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com> <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com> <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com> <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn> <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com> <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
In-Reply-To: <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090635_075681_238C6B6B 
X-CRM114-Status: GOOD (  16.11  )
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

T24gVGh1IEp1bCAxMCwgMjAyNSBhdCA1OjI1IFBNIENFU1QsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IEhlbGxvIE1pY2hhbCwKPgo+IE9uIFRodSwgSnVsIDEwLCAyMDI1IGF0IDAzOjQ4OjA4
UE0gKzAyMDAsIE1pY2hhbCBXaWxjenluc2tpIHdyb3RlOgo+PiBPbiA3LzEwLzI1IDE1OjEwLCBV
d2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gPiBPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAxMDo0
MjowN0FNICswMjAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gPj4gT24gNy83LzI1IDEx
OjQ4LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4gPj4+IFRoZSBzZXJpZXMgaXMgc3RydWN0
dXJlZCBhcyBmb2xsb3dzOgo+PiA+Pj4gIC0gRXhwb3NlIHN0YXRpYyBmdW5jdGlvbiBwd21jaGlw
X3JlbGVhc2UuCj4+ID4gCj4+ID4gSXMgdGhpcyByZWFsbHkgbmVjZXNzYXJ5PyBJIGRpZG4ndCB0
cnkgdG8gdW5kZXJzdGFuZCB0aGUgcmVxdWlyZW1lbnRzCj4+ID4geWV0LCBidXQgSSB3b25kZXIg
YWJvdXQgdGhhdC4gSWYgeW91IGdldCB0aGUgcHdtY2hpcCBmcm9tCj4+ID4gX19wd21jaGlwX2Fk
ZCgpIHRoZSByaWdodCB0aGluZyB0byBkbyB0byByZWxlYXNlIGl0IGlzIHRvIGNhbGwKPj4gPiBw
d21jaGlwX3JlbW92ZSgpLiBGZWVscyBsaWtlIGEgbGF5ZXIgdmlvbGF0aW9uLgo+PiAKPj4gSXQn
cyByZXF1aXJlZCB0byBwcmV2ZW50IGEgbWVtb3J5IGxlYWsgaW4gYSBzcGVjaWZpYywgY3JpdGlj
YWwgZmFpbHVyZQo+PiBzY2VuYXJpby4gVGhlIHNlcXVlbmNlIG9mIGV2ZW50cyBpcyBhcyBmb2xs
b3dzOgo+PiAKPj4gICAgIHB3bTo6Q2hpcDo6bmV3KCkgc3VjY2VlZHMsIGFsbG9jYXRpbmcgYm90
aCB0aGUgQyBzdHJ1Y3QgcHdtX2NoaXAgYW5kCj4+ICAgICB0aGUgUnVzdCBkcnZkYXRhLgo+PiAK
Pj4gICAgIHB3bTo6UmVnaXN0cmF0aW9uOjpyZWdpc3RlcigpICh3aGljaCBjYWxscyBwd21jaGlw
X2FkZCgpKSBmYWlscyBmb3IKPj4gICAgIHNvbWUgcmVhc29uLgo+CgooSnVzdCB0cnlpbmcgdG8g
aGVscCBjbGVhciB1cCB0aGUgY29uZnVzaW9uLikKCj4gSWYgeW91IGNhbGxlZCBwd21jaGlwX2Fs
bG9jKCkgYnV0IG5vdCB5ZXQgcHdtY2hpcF9hZGQoKSwgdGhlIHJpZ2h0Cj4gZnVuY3Rpb24gdG8g
Y2FsbCBmb3IgY2xlYW51cCBpcyBwd21jaGlwX3B1dCgpLgoKVGhhdCBpcyBleGFjdGx5IHdoYXQg
aXMgaGFwcGVuaW5nIHdoZW4gQVJlZjxDaGlwPiBpcyBkcm9wcGVkLiBJZiB0aGUgcmVmZXJlbmNl
CmNvdW50IGRyb3BzIHRvIHplcm8sIHB3bWNoaXBfcmVsZWFzZSgpIGlzIGNhbGxlZCwgd2hpY2gg
ZnJlZXMgdGhlIGNoaXAuIEhvd2V2ZXIsCnRoaXMgd291bGQgbGVhdmUgdGhlIGRyaXZlcidzIHBy
aXZhdGUgZGF0YSBhbGxvY2F0aW9uIGJlaGluZCwgd2hpY2ggaXMgb3duZWQgYnkKdGhlIENoaXAg
aW5zdGFuY2UuCgpTbywgaW4gUnVzdCB3ZSBub3Qgb25seSBoYXZlIHRvIGZyZWUgdGhlIGNoaXAg
aXRzZWxmIG9uIHJlbGVhc2UsIGJ1dCBhbHNvIHRoZQpkcml2ZXIncyBwcml2YXRlIGRhdGEuIFRo
ZSBzb2x1dGlvbiBNaWNoYWwgd2VudCBmb3IgaXMgb3ZlcndyaXRpbmcgdGhlIFBXTQpjaGlwJ3Mg
ZGV2LT5yZWxlYXNlKCkgd2l0aCBhIGNhbGxiYWNrIHRoYXQgZHJvcHMgdGhlIGRyaXZlcidzIHBy
aXZhdGUgZGF0YSBhbmQKc3Vic2VxdWVudGx5IGNhbGxzIHRoZSAib3JpZ2luYWwiIHB3bWNoaXBf
cmVsZWFzZSgpLgoKVGhpcyBpcyBhIGNvbW1vbiBwYXR0ZXJuIGluIFJ1c3QgdGhhdCB3ZSB1c2Ug
aW4gRFJNIGFzIHdlbGwuIE9uZSB0aGluZyB0aGF0IGlzCmRpZmZlcmVudCBpbiBEUk0gaXMsIHRo
YXQgYSBzdHJ1Y3QgZHJtX2RldmljZSAoZXF1aXZhbGVudCBvZiBzdHJ1Y3QgcHdtX2NoaXAgaW4K
dGhpcyBjYXNlKSwgaGFzIGl0J3Mgb3duIHJlbGVhc2UgY2FsbGJhY2sgZm9yIGRyaXZlcnMgdGhh
dCB3ZSBjYW4gYXR0YWNoIHRvLgoKUFdNIGRvZXMgbm90IGhhdmUgc3VjaCBhIGNhbGxiYWNrIEFG
QUlDUywgaGVuY2UgdGhlIFJ1c3QgYWJzdHJhY3Rpb24gdXNlcyB0aGUKdW5kZXJseWluZyBkZXZp
Y2UncyByZWxlYXNlIGNhbGxiYWNrIGFuZCB0aGVuIGZvcndhcmRzIHRvIHB3bWNoaXBfcmVsZWFz
ZSgpLgoKSG9wZSB0aGlzIGhlbHBzLiA6KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
