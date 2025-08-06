Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4B8C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVS4yf367J8sgP+vKwBxoDmiIR+Cmldqep1fcAloQ48=; b=2gW2MYRVyzsQhx
	nAZEva6SDPfM/Fzyo0kwUhgd5gn9VSTWVQ6PDs+nQbi+9i14itxZDzUHK4BxlIlyJZhlGfjDaqOFk
	3ZTk6rvLE3fHGHVnUWRc+4Dbm98zqZhy5SuFmF4YcGrGYq5Ta4Ew0JG2aHy2pgeC3jw3Zo6sXQMX1
	aWdo/4Z5xVrgrZDmtCoBg8gJ1gUauQ3sG7nnVL+tuKgQ9yKAF04bhr8VOOomYWAA1qlbfV9iuCIw5
	jtv6EHTRcG2LVDGqIxDklMSh0z6yTcRvpE/raGKvd8lykowLe8jpceZ33GC4GocVmFfXEvWfOIeFJ
	h7d6yz/IijutUB5TwQsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdal-0000000FDPA-2tG4;
	Wed, 06 Aug 2025 12:50:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujdai-0000000FDNl-1n2j
	for linux-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 12:50:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1754484581; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TdIYSsrpWIPTG1jidR1iuSPofUBS7dA1PyO7N+53KeFo91HY/CU5M81cEjLj16G20LoN18ziCK0qtw6J1NHw2pVD75q/+GLYYuZzypgX+9TdwWw8lXNHt4nJqF06vQHPz0WXyLukwUtQQDKfOlCtfCU7rJGGgmMXGdPOvcJNHlI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754484581; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bJtLcKeKURRlW9n36AmDiYBFj9adzcRfgds4/JvblNc=; 
	b=U9H9GMvUxhBuK2Fauj81NTtTMjiLs9x7S+F3+4VNd1oEVb6kQys0eDwnvDdydOfq5MjdMvyIzqRuPgpbRRx4ALN2XrZzR3N+P4j0f5BB/tbPQ5u11QhAvo9I83maLxs3NkfEZmgElVvDMdKzG5FpP89LttIhYub1J1lrjvhevFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754484581;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=bJtLcKeKURRlW9n36AmDiYBFj9adzcRfgds4/JvblNc=;
	b=NNL+i1UDcH2FhizRgwdMRIzcKnkcnBXUCwN39+K/lO4hsc994E/1kkmEwesytZN8
	DtWMIlr1wF20rszBl9U0PkJ/A1ZYewGvBJ0thoKP0WmDTKVI3QRzxC1JmQ5iedm3NSL
	GQj1AMDpR2e96zpfTyfo6e09f7gWBsinvEBk9Kv0=
Received: by mx.zohomail.com with SMTPS id 1754484579257241.02773267205032;
	Wed, 6 Aug 2025 05:49:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v12 3/3] rust: pwm: Add complete abstraction layer
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
Date: Wed, 6 Aug 2025 09:49:21 -0300
Cc: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benno Lossin <lossin@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Drew Fustini <fustini@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Message-Id: <8C20C615-DBF2-4DF9-9AB3-E78C4B1E7493@collabora.com>
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
 <CGME20250717090833eucas1p16c916450b59a77d81bd013527755cb21@eucas1p1.samsung.com>
 <20250717-rust-next-pwm-working-fan-for-sending-v12-3-40f73defae0c@samsung.com>
 <42C9DF97-2E0F-453B-800A-1DA49BF8F29F@collabora.com>
 <8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_055000_526255_DAE6C716 
X-CRM114-Status: GOOD (  22.74  )
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

SGkgTWljaGFsLAoKPiBPbiA0IEF1ZyAyMDI1LCBhdCAxOToyOSwgTWljaGFsIFdpbGN6eW5za2kg
PG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gCj4gCj4gT24gNy8yNS8yNSAxNzo1
NiwgRGFuaWVsIEFsbWVpZGEgd3JvdGU6Cj4+PiArCj4+PiArICAgIC8vLyBHZXRzIHRoZSBsYWJl
bCBmb3IgdGhpcyBQV00gZGV2aWNlLCBpZiBhbnkuCj4+PiArICAgIHB1YiBmbiBsYWJlbCgmc2Vs
ZikgLT4gT3B0aW9uPCZDU3RyPiB7Cj4+PiArICAgICAgICAvLyBTQUZFVFk6IHNlbGYuYXNfcmF3
KCkgcHJvdmlkZXMgYSB2YWxpZCBwb2ludGVyLgo+Pj4gKyAgICAgICAgbGV0IGxhYmVsX3B0ciA9
IHVuc2FmZSB7ICgqc2VsZi5hc19yYXcoKSkubGFiZWwgfTsKPj4+ICsgICAgICAgIGlmIGxhYmVs
X3B0ci5pc19udWxsKCkgewo+Pj4gKyAgICAgICAgICAgIE5vbmUKPj4+ICsgICAgICAgIH0gZWxz
ZSB7Cj4+PiArICAgICAgICAgICAgLy8gU0FGRVRZOiBsYWJlbF9wdHIgaXMgbm9uLW51bGwgYW5k
IHBvaW50cyB0byBhIEMgc3RyaW5nCj4+PiArICAgICAgICAgICAgLy8gbWFuYWdlZCBieSB0aGUg
a2VybmVsLCB2YWxpZCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZSBQV00gZGV2aWNlLgo+Pj4gKyAg
ICAgICAgICAgIFNvbWUodW5zYWZlIHsgQ1N0cjo6ZnJvbV9jaGFyX3B0cihsYWJlbF9wdHIpIH0p
Cj4+PiArICAgICAgICB9Cj4+PiArICAgIH0KPj4gCj4+IG5pdDogdGhpcyBjYW4gYmUgd3JpdHRl
biBtb3JlIGNvbmNpc2VseSwgYnV0IEkgcGVyc29uYWxseSBkb27igJl0IG1pbmQuCj4gCj4gRG8g
eW91IGhhdmUgc29tZXRoaW5nIHNwZWNpZmljIGluIG1pbmQgPyBJIHRoaW5rIHRoZSBhbHRlcm5h
dGl2ZSB3YXkgb2YKPiBleHByZXNzaW5nIHRoaXMgd291bGQgdXNlIE5vbk51bGwsIGJ1dCBzb21l
aG93IHRoaXMgZmVlbHMgbGVzcyByZWFkYWJsZQo+IGZvciBtZS4KClllcywgYW4gZWFybHkgcmV0
dXJuLCBpLmUuOgoKaWYgbGFiZWxfcHRyLmlzX251bGwoKSB7CiAgcmV0dXJuIE5vbmUKfQoKSXQg
c2F2ZXMgeW91IG9uZSBsZXZlbCBvZiBpbmRlbnRhdGlvbiBieSByZW1vdmluZyB0aGUgZWxzZSBi
cmFuY2guCgo+IAo+IAo+Pj4gKwo+Pj4gKy8vLyBUcmFpdCBkZWZpbmluZyB0aGUgb3BlcmF0aW9u
cyBmb3IgYSBQV00gZHJpdmVyLgo+Pj4gK3B1YiB0cmFpdCBQd21PcHM6ICdzdGF0aWMgKyBTaXpl
ZCB7Cj4+PiArICAgIC8vLyBUaGUgZHJpdmVyLXNwZWNpZmljIGhhcmR3YXJlIHJlcHJlc2VudGF0
aW9uIG9mIGEgd2F2ZWZvcm0uCj4+PiArICAgIC8vLwo+Pj4gKyAgICAvLy8gVGhpcyB0eXBlIG11
c3QgYmUgW2BDb3B5YF0sIFtgRGVmYXVsdGBdLCBhbmQgZml0IHdpdGhpbiBgUFdNX1dGSFdTSVpF
YC4KPj4+ICsgICAgdHlwZSBXZkh3OiBDb3B5ICsgRGVmYXVsdDsKPj4gCj4+IENhbuKAmXQgeW91
IHVzZSBhIGJ1aWxkX2Fzc2VydCEoKSBoZXJlPyBpLmUuOgo+PiAKPj4gICAgI1tkb2MoaGlkZGVu
KV0KPj4gICAgY29uc3QgX0NIRUNLX1NaOiAoKSA9IHsKPj4gICAgICAgIGJ1aWxkX2Fzc2VydCEo
Y29yZTo6bWVtOjpzaXplX29mOjo8U2VsZjo6V2ZIdz4oKSA8PSBiaW5kaW5nczo6UFdNX1dGSFdT
SVpFIGFzIHVzaXplKTsKPj4gICAgfTsKPiAKPiBUaGlzIGRvZXNuJ3Qgd29yayBpLmUgdGhlIGRy
aXZlciB1c2luZyBvdmVyc2l6ZWQgV2ZIdyBjb21waWxlcwo+IGNvcnJlY3RseSwgYnV0IHB1dHRp
bmcgdGhlIGFzc2VydCBpbnNpZGUgdGhlIHNlcmlhbGl6ZSBkaWQgd29yaywgcGxlYXNlCj4gc2Vl
IGJlbG93LgoKQ2FuIHlvdSBzaG93IGhvdyBpdCBsb29rcyBsaWtlIHdpdGggdGhlIGJ1aWxkX2Fz
c2VydCBpbmNsdWRlZD8gSnVzdCBhcyBhIHNhbml0eSBjaGVjay4KCj4gCj4gCj4+IAo+Pj4gKyAg
ICAgICAgRXJyKEVOT1RTVVBQKQo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIC8vLyBDb252ZXJ0
IGEgaGFyZHdhcmUtc3BlY2lmaWMgcmVwcmVzZW50YXRpb24gYmFjayB0byBhIGdlbmVyaWMgd2F2
ZWZvcm0uCj4+PiArICAgIC8vLyBUaGlzIGlzIHR5cGljYWxseSBhIHB1cmUgY2FsY3VsYXRpb24g
YW5kIGRvZXMgbm90IHBlcmZvcm0gSS9PLgo+Pj4gKyAgICBmbiByb3VuZF93YXZlZm9ybV9mcm9t
aHcoCj4+PiArICAgICAgICBfY2hpcDogJkNoaXA8U2VsZj4sCj4+PiArICAgICAgICBfcHdtOiAm
RGV2aWNlLAo+Pj4gKyAgICAgICAgX3dmaHc6ICZTZWxmOjpXZkh3LAo+Pj4gKyAgICAgICAgX3dm
OiAmbXV0IFdhdmVmb3JtLAo+Pj4gKyAgICApIC0+IFJlc3VsdDxjX2ludD4gewo+Pj4gKyAgICAg
ICAgRXJyKEVOT1RTVVBQKQo+Pj4gKyAgICB9Cj4+IAo+PiBQbGVhc2UgaW5jbHVkZSBhdCBsZWFz
dCBhIGRlc2NyaXB0aW9uIG9mIHdoYXQgdGhpcyByZXR1cm5zLgo+IAo+IEluc3RlYWQgSSB0aGlu
ayBpdCBzaG91bGQganVzdCByZXR1cm4gUmVzdWx0LCByZXZpZXdlZCB0aGUgY29kZSBhbmQgaXQn
cwo+IGZpbmUuCj4gCgpBY2suCgo+PiAKPj4+ICsvLy8gQnJpZGdlcyBSdXN0IGBQd21PcHNgIHRv
IHRoZSBDIGBwd21fb3BzYCB2dGFibGUuCj4+PiArc3RydWN0IEFkYXB0ZXI8VDogUHdtT3BzPiB7
Cj4+PiArICAgIF9wOiBQaGFudG9tRGF0YTxUPiwKPj4+ICt9Cj4+PiArCj4+PiAraW1wbDxUOiBQ
d21PcHM+IEFkYXB0ZXI8VD4gewo+Pj4gKyAgICBjb25zdCBWVEFCTEU6IFB3bU9wc1ZUYWJsZSA9
IGNyZWF0ZV9wd21fb3BzOjo8VD4oKTsKPj4+ICsKPj4+ICsgICAgLy8vICMgU2FmZXR5Cj4+PiAr
ICAgIC8vLwo+Pj4gKyAgICAvLy8gYHdmaHdfcHRyYCBtdXN0IGJlIHZhbGlkIGZvciB3cml0ZXMg
b2YgYHNpemVfb2Y6OjxUOjpXZkh3PigpYCBieXRlcy4KPj4+ICsgICAgdW5zYWZlIGZuIHNlcmlh
bGl6ZV93Zmh3KHdmaHc6ICZUOjpXZkh3LCB3Zmh3X3B0cjogKm11dCBjX3ZvaWQpIC0+IFJlc3Vs
dCB7Cj4+PiArICAgICAgICBsZXQgc2l6ZSA9IGNvcmU6Om1lbTo6c2l6ZV9vZjo6PFQ6OldmSHc+
KCk7Cj4+PiArICAgICAgICBpZiBzaXplID4gYmluZGluZ3M6OlBXTV9XRkhXU0laRSBhcyB1c2l6
ZSB7Cj4+PiArICAgICAgICAgICAgcmV0dXJuIEVycihFSU5WQUwpOwo+Pj4gKyAgICAgICAgfQo+
PiAKPj4gU2VlIG15IHByZXZpb3VzIGNvbW1lbnQgb24gdXNpbmcgYnVpbGRfYXNzZXJ0IGlmIHBv
c3NpYmxlLgo+IAo+IFNvIEkgZGlkIHRyeSB0aGlzIGFuZCBpdCBkb2VzIHdvcmssIGhvd2V2ZXIg
aXQgcmVzdWx0cyBpbiBhIGNyeXB0aWMKPiBsaW5rZXIgZXJyb3I6Cj4gbGQubGxkOiBlcnJvcjog
dW5kZWZpbmVkIHN5bWJvbDogcnVzdF9idWlsZF9lcnJvcgo+Pj4+IHJlZmVyZW5jZWQgYnkgcHdt
X3RoMTUyMC4yYzJjMzkzODMxMjExNGMtY2d1LjAKPj4+PiAgICAgICAgICAgICAgZHJpdmVycy9w
d20vcHdtX3RoMTUyMC5vOig8a2VybmVsOjpwd206OkFkYXB0ZXI8cHdtX3RoMTUyMDo6VGgxNTIw
UHdtRHJpdmVyRGF0YT4+OjpyZWFkX3dhdmVmb3JtX2NhbGxiYWNrKSBpbiBhcmNoaXZlIHZtbGlu
dXguYQo+Pj4+IHJlZmVyZW5jZWQgYnkgcHdtX3RoMTUyMC4yYzJjMzkzODMxMjExNGMtY2d1LjAK
Pj4+PiAgICAgICAgICAgICAgZHJpdmVycy9wd20vcHdtX3RoMTUyMC5vOig8a2VybmVsOjpwd206
OkFkYXB0ZXI8cHdtX3RoMTUyMDo6VGgxNTIwUHdtRHJpdmVyRGF0YT4+Ojpyb3VuZF93YXZlZm9y
bV90b2h3X2NhbGxiYWNrKSBpbiBhcmNoaXZlIHZtbGludXguYQo+IG1ha2VbMl06ICoqKiBbc2Ny
aXB0cy9NYWtlZmlsZS52bWxpbnV4OjkxOiB2bWxpbnV4XSBFcnJvciAxCj4gCj4gSSBhc3N1bWUg
dGhpcyBjb3VsZCBiZSBmaXhlZCBhdCBzb21lIHBvaW50IHRvIGJldHRlciBleHBsYWluIHdoYXQK
PiBmYWlsZWQ/IEkgdGhpbmsgcHV0dGluZyB0aGUgYXNzZXJ0IGluIHNlcmlhbGl6ZSBmdW5jdGlv
bnMgaXMgZmluZSBhbmQKPiB0aGUgcHJvcG9zZWQgX0NIRUNLX1NaIGlzbid0IHJlYWxseSByZXF1
aXJlZC4KPiAKPiBJIHdvdWxkIGxvdmUgdG8gZG8gc29tZSBkZWJ1Z2dpbmcgYW5kIGZpbmQgb3V0
IHdoeSB0aGF0IGlzIG15c2VsZiBpZgo+IHRpbWUgYWxsb3dzIDotKQoKVGhlcmUgaXMgbm90aGlu
ZyB3cm9uZyBoZXJlLiBBIGNhbm9uaWNhbCBSdXN0LWZvci1MaW51eCBleHBlcmllbmNlIGlzIHN0
dW1ibGluZwp1cG9uIHRoZSBlcnJvciBnZW5lcmF0ZWQgYnkgYnVpbGRfYXNzZXJ0IGFuZCBiZWlu
ZyByaWdodGx5IGNvbmZ1c2VkLiBQZW9wbGUgYXNrCmFib3V0IHRoaXMgZXZlcnkgZmV3IG1vbnRo
cyA6KQoKVGhpcyBqdXN0IG1lYW5zIHRoYXQgdGhlIGJ1aWxkX2Fzc2VydCB0cmlnZ2VyZWQgYW5k
IHRoZSBidWlsZCBmYWlsZWQgYXMgYQpyZXN1bHQuIElPVywgaXQgbWVhbnMgdGhhdCB5b3VyIGJ1
aWxkX2Fzc2VydCBpcyB3b3JraW5nIHByb3Blcmx5IHRvIGNhdGNoCmVycm9ycy4KCuKAlCBEYW5p
ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
