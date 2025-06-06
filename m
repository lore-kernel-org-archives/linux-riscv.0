Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522A4C61CE7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YM6a++LFesan/+GLs37Q6kD9WGgDoFuPbztqfdNJOAI=; b=Ki+9v/WxYby9r/
	jnzgyeRrf0tzp93zxwlrBYaBlujmVpi+fW3u6cp+Z1FFKe0CV9CTPzK3oHQULiaWawXGvGaeiMApc
	vkp33GKGX5JShv4CYEuiCZv2jqGX1lI7YcxF/sTfXCavH+ofgtcsk+6V9BkpZ/LpaZ28aBjIg2C8+
	XsCaFcy5NUZ+jqUTGyCf7vmgNlO9FUP74agkhprHR7EXiRHtg2Oo54M0Zg0UyiPVOI4s+r/hEj26G
	RDoqgzeGmFn8evnEZmtijMMrApKuRLSVzFLDpYqfOCbl3biDYfDcvNuP0GzwOqCEeuGYPOUF+2wCS
	latCJVf7h/Ol4Rx4q7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdNy-00000000vOL-13hU;
	Fri, 06 Jun 2025 20:09:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNdNv-00000000vNr-1eFI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 20:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 008F0434C5;
	Fri,  6 Jun 2025 20:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC0CC4CEF4;
	Fri,  6 Jun 2025 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749240588;
	bh=47Vf4nOQZwM+Abm7uLMkrK0JA175p8GjRRjIrpt2/tY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NSSCp/2x9jKNKnDQuj3wSudUxox2HuBaWGf3Pdb94Oae9y8Gh5N16NNc472FNNdo8
	 NkZvocAojxPvQj4YU006T/RuCoMnYXwqMJphIHxpPwCq0iRXVIo+MLvnAJuWPygzlI
	 6jL/FkFtlvrLMXWKJet7kVfP5CP32YgCspcHKOa8eL9bauSJkNgr7kqg4PKhjhWUbS
	 p6AfHIJHY0OTaJREXSFjHySAZ7gBjUyXWgyZ/riUHJCKa+2DiBOiQUJBookm+JnWjt
	 qlNOiFqzDHybRpL80rXTJluxCQ+WUeYv0G/27oBFcaVdsgl3J2E3+8yhGGaUgHaWmb
	 fH2VWXebOIrgA==
Mime-Version: 1.0
Date: Fri, 06 Jun 2025 22:09:42 +0200
Message-Id: <DAFQ19RBBSQL.3OGUXOQ0PA9YH@kernel.org>
Cc: "Drew Fustini" <drew@pdp7.com>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
From: "Benno Lossin" <lossin@kernel.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com> <CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com> <20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com> <q6dkihyfosi3k4mtrvyff54nbsjpovmujdbmoqhapo7daznpja@of2p5gtmcq2m> <b1c4792e-f997-4eba-a8ed-d2e3f76e3fdd@samsung.com>
In-Reply-To: <b1c4792e-f997-4eba-a8ed-d2e3f76e3fdd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_130951_469256_14F28AD9 
X-CRM114-Status: GOOD (  14.70  )
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

T24gRnJpIEp1biA2LCAyMDI1IGF0IDQ6MDggUE0gQ0VTVCwgTWljaGFsIFdpbGN6eW5za2kgd3Jv
dGU6Cj4gT24gNi81LzI1IDEyOjM5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gT24gU2F0
LCBNYXkgMjQsIDIwMjUgYXQgMTE6MTQ6NTZQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kgd3Jv
dGU6Cj4+PiAraW1wbCBEcm9wIGZvciBUaDE1MjBQd21DaGlwRGF0YSB7Cj4+PiArICAgIGZuIGRy
b3AoJm11dCBzZWxmKSB7Cj4+PiArICAgICAgICBzZWxmLmNsay5kaXNhYmxlX3VucHJlcGFyZSgp
Owo+Pj4gKyAgICB9Cj4+PiArfQo+Pj4gKwo+Pj4gK2ZuIG11bF9kaXZfdTY0KGE6IHU2NCwgYjog
dTY0LCBjOiB1NjQpIC0+IHU2NCB7Cj4+PiArICAgIGlmIGMgPT0gMCB7Cj4+PiArICAgICAgICBy
ZXR1cm4gMDsKPj4+ICsgICAgfQo+Pj4gKyAgICBhLndyYXBwaW5nX211bChiKSAvIGMKPj4+ICt9
Cj4+IAo+PiBJcyB0aGlzIHNhdmUgaWYgYSAqIGIgPiBVNjRfTUFYPyBJIHdvdWxkIGhhdmUgZXhw
ZWN0ZWQgc3VjaCBhIGZ1bmN0aW9uCj4+IHRvIGFscmVhZHkgZXhpc3QgaW4gZ2VuZXJpYyBjb2Rl
Lgo+Cj4gWW91J3JlIHJpZ2h0LCB0aGFuayB5b3UuIFRoZSB3cmFwcGluZ19tdWwgaXMgdW5zYWZl
IGR1ZSB0byB0aGUgb3ZlcmZsb3cKPiByaXNrIHlvdSBwb2ludGVkIG91dC4KCmB3cmFwcGluZ19t
dWxgIGlzIG5vdCBgdW5zYWZlYCwgYnV0IHRoZSBhYm92ZSBjb2RlIHdpbGwgcmVzdWx0IGluIGFu
CmluY29ycmVjdCByZXN1bHQgaWYgYGEgKiBiYCBvdmVyZmxvd3MgKGl0IHdvbid0IGJlIFVCLCBz
aW5jZQpgd3JhcHBpbmdfbXVsYCBqdXN0IHdyYXBzIGFyb3VuZCB0byAwKS4KCj4gVGhlIGlkZWFs
IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHVzZSB0aGUga2VybmVsJ3Mgb3duIG11bF91NjRfdTY0X2Rp
dl91NjQKPiBoZWxwZXIgZnVuY3Rpb24uCj4KPiBSdXN0IG1haW50YWluZXJzOiBUaGlzIGJpbmRp
bmcgZG9lc24ndCBzZWVtIHRvIGJlIGF2YWlsYWJsZSB5ZXQuIFdvdWxkIGEKPiBwcmVwYXJhdG9y
eSBwYXRjaCBpbnRyb2R1Y2luZyBhIG1pbmltYWwgcnVzdC9rZXJuZWwvbWF0aC5ycyB3aXRoICBv
bmx5Cj4gdGhpcyBiaW5kaW5nIGJlIHRoZSBiZXN0IHdheSB0byBwcm9jZWVkPyBJdCBzZWVtcyBs
aWtlIGEgdXNlZnVsIHV0aWxpdHkKPiBmb3IgbW9yZSB0aGFuIGp1c3QgdGhpcyBkcml2ZXIuCgpT
b3VuZHMgZ29vZCwgYnV0IEkgd291bGQgc2VwYXJhdGUgaXQgaW50byBpdHMgb3duIHBhdGNoIHNl
cmllcywgc2luY2UKdGhlbiB5b3UgY2FuIGl0ZXJhdGUgb24gYm90aCBhdCB0aGUgc2FtZSB0aW1l
LgoKQXJlIHRoZXJlIGFsc28gc2ltaWxhciBmdW5jdGlvbnMgZm9yIHNpZ25lZCBhbmQgb3RoZXIg
c2l6ZXM/IElmIHllcywKdGhlbiB3ZSBzaG91bGQgYWRkIHRoZW0gdmlhIGFuIGV4dGVuc2lvbiB0
cmFpdCBvbiB0aGUgcHJpbWl0aXZlIHR5cGVzLgoKLS0tCkNoZWVycywKQmVubm8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
