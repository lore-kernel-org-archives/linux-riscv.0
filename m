Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1EAC83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ExBiGeCfUbCDZPoSSy12HYH7LyXRwPWl5XI0OuxDiFo=; b=gxoTHEN8BzClpq
	eeyfU1CNZxDhaCigbA6x+9AcvMk0z3MFIgenwHzrJnpKHFQ6JbvKJ4cj3ByuP2/4KFRbcdu407alo
	g56PGmG67Sr/kKIMptYSf2jgO+pg+jVf3/Q6tWJJrVYNS5rsLSODWfcB1vIsu/fiXzDszcQGKjT3u
	NQ8F8F1BUT3euLRRo3Cux+RaLSe4Vk/Gav53GEm1IWEw2RMIPGiliwYd3QnOBkaau65KoxxiHBqSu
	bQsGiMv3rn3PhIVNfjK5284eUXtmGYzCGJIZu7p+qkvmmxEthMl34a2gPiIJIfUtYiLOfCviuVRwO
	qGt7cct0qLny9FAxt2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpn2-0000000BfxD-0RVE;
	Thu, 10 Jul 2025 11:50:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoXW-0000000BUWk-1DSs
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 10:30:08 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250710103001euoutp0149131c0b75e07357914209f8080efab5~Q3SPz-s0J1182911829euoutp01W
	for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 10:30:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250710103001euoutp0149131c0b75e07357914209f8080efab5~Q3SPz-s0J1182911829euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752143401;
	bh=+/0MKjzL7c7U+Y/b7GZa1f4mm6vUapHe0WApFCOt6lU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=vCQX9qZVyxoO/oV3tVz+ORmsXmG+4maHuY5G+RzuCIFmdspP7OXIbNKUzwDZlykVQ
	 H1Ro6v6pDrK5EJxwLhMuRnkskZZZ136j2mHACe1Y0nFYjHPmVjgiEMPemLroNzG4hv
	 qD5tK2lSz47Cb7ABksQgPvArvncTtY4t8uO5F4XA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250710103000eucas1p1132d31a624653704073732606b27d1bf~Q3SPNGgEj2817228172eucas1p15;
	Thu, 10 Jul 2025 10:30:00 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710102959eusmtip12fb98f6fcecf28334cca8575b9476fca~Q3SOG0Nry0190601906eusmtip1u;
	Thu, 10 Jul 2025 10:29:59 +0000 (GMT)
Message-ID: <e494422b-b989-4dc3-9828-b080dbf4c34d@samsung.com>
Date: Thu, 10 Jul 2025 12:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <DB8AQ15RTAJ2.3QXX8Q2FTFGCP@kernel.org>
X-CMS-MailID: 20250710103000eucas1p1132d31a624653704073732606b27d1bf
X-Msg-Generator: CA
X-RootMTR: 20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6
X-EPHeader: CA
X-CMS-RootMailID: 20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
	<20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
	<e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
	<DB8AQ15RTAJ2.3QXX8Q2FTFGCP@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_033006_956654_D4255EA2 
X-CRM114-Status: GOOD (  26.49  )
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

CgpPbiA3LzEwLzI1IDEyOjE3LCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOgo+IE9uIFRodSBKdWwg
MTAsIDIwMjUgYXQgMTA6NDIgQU0gQ0VTVCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+IEkg
d2FzIGhvcGluZyB5b3UgY291bGQgY2xhcmlmeSB0aGUgaW50ZW5kZWQgbWVyZ2UgcGF0aCBmb3Ig
dGhpcyBzZXJpZXMsCj4+IGFzIGl0IGludHJvZHVjZXMgY2hhbmdlcyB0byBib3RoIHRoZSBSdXN0
IGFuZCBQV00gc3Vic3lzdGVtcy4KPj4KPj4gSXMgdGhlIGV4cGVjdGF0aW9uIHRoYXQgdGhlIFJ1
c3QgbWFpbnRhaW5lcnMgd2lsbCB0YWtlIHRoZSBhYnN0cmFjdGlvbgo+PiBwYXRjaGVzIGludG8g
dGhlIFJ1c3QgdHJlZSBmaXJzdD8gT3Igd291bGQgVXdlLCBhcyB0aGUgUFdNIG1haW50YWluZXIs
Cj4+IHB1bGwgdGhlIGVudGlyZSBzZXJpZXM/IEFueSBndWlkYW5jZSBvbiB0aGUgY29vcmRpbmF0
aW9uIHdvdWxkIGJlIHZlcnkKPj4gaGVscGZ1bC4KPiAKPiBFeGNlcHQgZm9yIHRoZSBoZWxwZXJz
IEkgb25seSBzZWUgUFdNIGNvZGUsIHNvIHRoaXMgaXMgZnVsbHkgb24gVXdlJ3MgcHVydmlldyBJ
Cj4gdGhpbmsuCj4gCj4gSSBzZWUgdGhhdCB0aGVyZSBpcyBhIG5ldyBNQUlOVEFJTkVSUyBlbnRy
eToKPiAKPiAJUFdNIFNVQlNZU1RFTSBCSU5ESU5HUyBbUlVTVF0KPiAJTToJTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAJUzoJTWFpbnRhaW5lZAo+IAlGOgly
dXN0L2hlbHBlcnMvcHdtLmMKPiAJRjoJcnVzdC9rZXJuZWwvcHdtLnJzCj4gCj4gSSBhc3N1bWUg
dGhpcyBpcyBhZ3JlZWQgd2l0aCBVd2U/Cj4gCj4gSW4gY2FzZSB0aGVyZSdzIG5vIGFncmVlbWVu
dCB5ZXQsIHRoZSB0eXBpY2FsIG9wdGlvbnMgYXJlOgo+IAo+ICAgMSkgTWFpbnRhaW4gdGhlIFJ1
c3QgYWJzdHJhY3Rpb25zIGFzIHBhcnQgb2YgdGhlIGV4aXN0aW5nIE1BSU5UQUlORVJTIGVudHJ5
Lgo+ICAgICAgT3B0aW9uYWxseSwgdGhlIGF1dGhvciBjYW4gYmUgYWRkZWQgYXMgYW5vdGhlciBt
YWludGFpbmVyIG9yIHJldmlld2VyLgo+IAo+ICAgMikgQWRkIGEgc2VwYXJhdGUgTUFJTlRBSU5F
UlMgZW50cnk7IHBhdGNoZXMgLyBQUnMgc3RpbGwgZ28gdGhyb3VnaCB0aGUgc2FtZQo+ICAgICAg
c3Vic3lzdGVtIHRyZWUuCj4gCj4gICAzKSBBZGQgYSBzZXBhcmF0ZSBNQUlOVEFJTkVSUyBlbnRy
eTsgcGF0Y2hlcyBkb24ndCBnbyB0aHJvdWdoIHRoZSBzdWJzeXN0ZW0KPiAgICAgIHRyZWUgKGUu
Zy4gYmVjYXVzZSB0aGUgc3Vic3lzdGVtIG1haW50YWluZXJzIGRvbid0IHdhbnQgdG8gZGVhbCB3
aXRoIGl0KS4KPiAKPiBJIGRvbid0IHJlY29tbWVuZCAoMyksIHNpbmNlIGl0J3MgcmVhbGx5IGp1
c3QgYSBmYWxsYmFjay4KPiAKPiBUaGUgYWJvdmUgbG9va3MgbGlrZSAoMikuIEluIHRoaXMgY2Fz
ZSBJIHJlY29tbWVuZCB0byBhbHNvIGFkZCB0aGUgQyBtYWludGFpbmVycwo+IGFzIHJldmlld2Vy
cywgc3VjaCB0aGF0IHRoZXkgY2FuIGVhc2lseSBmb2xsb3cgYWxvbmcgYW5kIHNwZWNpZml5IHRo
ZSB0cmVlIChUOikuCj4gCj4gQnV0LCBvZiBjb3Vyc2UsIHRoYXQncyB1cCB0byB5b3UgYW5kIFV3
ZS4KClRoYW5rcywgaXQgaXMgbm90IGFncmVlZCB5ZXQsIEkndmUgaW5jbHVkZWQgYSBNQUlOVEFJ
TkVSUyBlbnRyeSwgc2luY2UgSQp3b3VsZCBsaWtlIHRvIGhlbHAgd2l0aCB0aGUgbWFpbnRlbmFu
Y2Ugb2YgdGhlIGNvZGUsIHNvIEkgd291bGQgYWxzbwp2b3RlIGZvciB0aGUgMikgb3B0aW9uLCBi
dXQgdWx0aW1hdGVseSBpdCdzwqBhbiBVd2UgZGVjaXNpb24gc28gSSB3b3VsZApiZSBoYXBweSB0
byBmb2xsb3cgb24gYW55dGhpbmcgaGUgZGVjaWRlcy4KCj4gCj4+IEkgdW5kZXJzdGFuZCB0aGF0
IGl0IG1heSBiZSB0b28gbGF0ZSBpbiB0aGUgZGV2ZWxvcG1lbnQgY3ljbGUgdG8gbWVyZ2UKPj4g
dGhlIGZ1bGwgc2VyaWVzLiBJZiB0aGF0J3MgdGhlIGNhc2UsIHBlcmhhcHMgcGF0Y2ggMiBjb3Vs
ZCBiZSBjb25zaWRlcmVkCj4+IG9uIGl0cyBvd24sIGFzIGl0IGhhc24ndCByZWNlaXZlZCBjb21t
ZW50cyBpbiB0aGUgbGFzdCBjb3VwbGUgb2YKPj4gcmV2aXNpb25zLiBBcyBhbm90aGVyIHBvc3Np
YmlsaXR5LCBwYXRjaCAxIGFuZCBwYXRjaCAzIGFyZSBkZXBlbmRlbnQgb24KPj4gZWFjaCBvdGhl
ciBhbmQgY291bGQgYmUgYXBwbGllZCBhcyBhIHBhaXIsIGRlcGVuZGluZyBvbiB5b3VyIGFzc2Vz
c21lbnQuCj4+Cj4+IFRoZSBSSVNDLVYgZHJpdmVyIGl0c2VsZiB3b3VsZCBuZWVkIHRvIHdhaXQg
Zm9yIHRoZSBJb01lbSBzZXJpZXMgbWVyZ2UgWzFdLgo+Pgo+PiBbMV0gLSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI1MDcwNC10b3BpY3MtdHlyLXBsYXRmb3JtX2lv
bWVtLXYxMi0wLTFkM2Q0YmQ4MjA3ZEBjb2xsYWJvcmEuY29tLwo+Pgo+PiBCZXN0IHJlZ2FyZHMs
Cj4gCj4gCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tp
QHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
