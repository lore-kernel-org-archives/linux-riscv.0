Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6615AC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dq08zJ0gtHbF1WgJPA+g6s+H/lEXjfjdSfRgakzNFlY=; b=mtF2JWVYi+6IjX
	YUd3+fQkhpvXXkyn7DwP0+dz9VYQYCRgkX/XucbRnDSrXnnWpGHBE4sUg//AzPMeGcfdfC3De7iXe
	xNDN2SL5VrHP3aJae/Ohqiqvv9+e2Z8UTlh1EMHdThTvFwA2naLoqNIPy8h/TALWBaQUcfix5F3f0
	c7YycC3SsFS4u1v4Q3yJY7lQzpV7xOoyIlNsHxJzdUx/4zMl5bjiKl6Va8aw9G78slxD5j0U16Vnm
	Ijvg9tLDUOMxrd4O45Mxb1Y2kSN64tKrPApY6VsCAz7vvAlkfvZsUyJLvnc5v32LetJeA/vf3c0ra
	w4CbV+TCr/96qBfNRUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtg3-0000000AjHW-0gCC;
	Tue, 27 May 2025 12:45:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtg0-0000000AjFe-0ngJ
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 12:45:06 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250527124459euoutp018b50689d53f2e966b436c66f87bb0415~DYvh4dGJo0908009080euoutp01G
	for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 12:44:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250527124459euoutp018b50689d53f2e966b436c66f87bb0415~DYvh4dGJo0908009080euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748349899;
	bh=6MggDmUhFkhh0YiQ7gVTaOXRvovvaDJZMhoGzqh3YHw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LoaE5J21GKq0EsZodbMoZpJbZvU0a5uNptGWSRSgSekRchtrp2tIQ2LPkMcb9v3oF
	 Pg+9Mszs4+XXEMBDXqEQwhypatxb3S7Kq8zQCZUIETx6Xg00huVKuyaBE73vDhBl7d
	 hyfcKZOFoVLct4kcKiLIaiuT5nGdYZXao/PWF6+U=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250527124458eucas1p25fc02c83cc0febc8bfccb24116a38937~DYvhIbmaK2867528675eucas1p26;
	Tue, 27 May 2025 12:44:58 +0000 (GMT)
Received: from [106.210.136.40] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250527124457eusmtip1e773e74c7b1946257de1f317c434a396~DYvgQd7GN1338813388eusmtip1I;
	Tue, 27 May 2025 12:44:57 +0000 (GMT)
Message-ID: <db8e34c9-daff-43d9-b79b-8ec1bc98a00f@samsung.com>
Date: Tue, 27 May 2025 14:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: pl
From: "Michal Wilczynski/Kernel (PLT) /SRPOL/Engineer/Samsung Electronics"
	<m.wilczynski@samsung.com>
In-Reply-To: <aDMHEcpJn8nyJHFV@pollux.localdomain>
X-CMS-MailID: 20250527124458eucas1p25fc02c83cc0febc8bfccb24116a38937
X-Msg-Generator: CA
X-RootMTR: 20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0
X-EPHeader: CA
X-CMS-RootMailID: 20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
	<aDMHEcpJn8nyJHFV@pollux.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_054504_829297_F10C87D5 
X-CRM114-Status: GOOD (  23.21  )
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

ClcgZG5pdSAyNS4wNS4yMDI1IG/CoDE0OjAzLCBEYW5pbG8gS3J1bW1yaWNoIHBpc3plOgo+IE9u
IFNhdCwgTWF5IDI0LCAyMDI1IGF0IDExOjE0OjU2UE0gKzAyMDAsIE1pY2hhbCBXaWxjenluc2tp
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycyBiL2RyaXZl
cnMvcHdtL3B3bV90aDE1MjAucnMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNDY2NWUyOTNlOGQwYmRjMWE2
MmE0ZTI5NWNkYWY0ZDQ3YjNkZDEzNAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2RyaXZlcnMv
cHdtL3B3bV90aDE1MjAucnMKPj4gQEAgLTAsMCArMSwyNzIgQEAKPj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsvLyBDb3B5cmlnaHQgKGMpIDIwMjUgU2Ftc3VuZyBF
bGVjdHJvbmljcyBDby4sIEx0ZC4KPj4gKy8vIEF1dGhvcjogTWljaGFsIFdpbGN6eW5za2kgPG0u
d2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPj4gKwo+PiArLy8hIFJ1c3QgVC1IRUFEIFRIMTUyMCBQ
V00gZHJpdmVyCj4+ICt1c2Uga2VybmVsOjp7Y19zdAo+PiArCj4+ICtzdHJ1Y3QgVGgxNTIwUHdt
Q2hpcERhdGEgewo+PiArICAgIGNsazogQ2xrLAo+PiArICAgIGlvbWVtOiBrZXJuZWw6OmRldnJl
czo6RGV2cmVzPElvTWVtPDA+PiwKPiBXaHkgSW9NZW08MD4/IElmIHlvdSBwdXQgdGhlIGV4cGVj
dGVkIG1lbW9yeSByZWdpb24gc2l6ZSBmb3IgdGhpcyBjaGlwIGluc3RlYWQKPiBhbGwgeW91ciBz
dWJzZXF1ZW50IGFjY2Vzc2VzIGNhbiBiZSBpb21lbS53cml0ZSgpIC8gaW9tZW0ucmVhZCgpIHJh
dGhlciB0aGFuIHRoZQo+IGZhbGxpYmxlIHRyeV97cmVhZCx3cml0ZX0oKSB2YXJpYW50cy4KVGhl
IHNpemUgb2YgdGhlIG1lbW9yeSByZWdpb24gaXMgbm90IGtub3duIGF0IHRoZSBjb21waWxlIHRp
bWUuIEluc3RlYWQgCml0J3MgY29uZmlndXJlZAp2aWEgRGV2aWNlIFRyZWUuIEknbSBub3Qgc3Vy
ZSB3aHkgaXQgc2hvdWxkIHdvcmsgZGlmZmVyZW50bHkgaW4gUnVzdCA/Cj4KPj4gK2ltcGwgVGgx
NTIwUHdtQ2hpcERhdGEgewo+PiArICAgIGZuIF9jb25maWcoCj4+ICsgICAgICAgICZzZWxmLAo+
PiArICAgICAgICBod3B3bTogdTMyLAo+PiArICAgICAgICBkdXR5X25zOiB1NjQsCj4+ICsgICAg
ICAgIHBlcmlvZF9uczogdTY0LAo+PiArICAgICAgICB0YXJnZXRfcG9sYXJpdHk6IHB3bTo6UG9s
YXJpdHksCj4+ICsgICAgKSAtPiBSZXN1bHQ8dTMyPiB7Cj4+ICsgICAgICAgIGxldCByZWdzID0g
c2VsZi5pb21lbS50cnlfYWNjZXNzKCkub2tfb3JfZWxzZSh8fCB7Cj4+ICsgICAgICAgICAgICBw
cl9lcnIhKCJQV00te306IEZhaWxlZCB0byBhY2Nlc3MgSS9PIG1lbW9yeSBpbiBfY29uZmlnXG4i
LCBod3B3bSk7Cj4gSGVyZSBhbmQgdGhyb3VnaG91dCB0aGUgd2hvbGUgZHJpdmVyLCBwbGVhc2Ug
dXNlIHRoZSBkZXZfKiEoKSBwcmludCBtYWNyb3MuCj4gRHJpdmVycyBoYXZlIG5vIHJlYXNvbiB0
byB1c2UgdGhlIHByXyohKCkgbWFjcm9zLgo+Cj4+ICtpbXBsIHB3bTo6UHdtT3BzIGZvciBUaDE1
MjBQd21DaGlwRGF0YSB7Cj4+ICsgICAgLy8gVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBnZXRfc3Rh
dGUKPj4gKyAgICBmbiBhcHBseSgKPj4gKyAgICAgICAgcHdtX2NoaXBfcmVmOiAmbXV0IHB3bTo6
Q2hpcCwKPj4gKyAgICAgICAgcHdtX2RldjogJm11dCBwd206OkRldmljZSwKPj4gKyAgICAgICAg
dGFyZ2V0X3N0YXRlOiAmcHdtOjpTdGF0ZSwKPj4gKyAgICApIC0+IFJlc3VsdCB7Cj4gSSBhc3N1
bWUgdGhvc2UgY2FsbGJhY2tzIGNhbid0IHJhY2Ugd2l0aCBwd21jaGlwX3JlbW92ZSgpIGNhbGxl
ZCBmcm9tIGRyaXZlcgo+IHJlbW92ZSgpPyBJLmUuIHRoZSBjYWxsYmFja3MgYXJlIGd1YXJhbnRl
ZWQgdG8gY29tcGxldGUgYmVmb3JlIHB3bWNoaXBfcmVtb3ZlKCkKPiBjb21wbGV0ZXM/CgpZZWFo
IHRoaXMgaXMgbXkgdW5kZXJzdGFuZGluZyBhcyB3ZWxsIC0gdGhpcyBpcyBzb21ldGhpbmcgdGhh
dCB0aGUgUFdNIApjb3JlIHNob3VsZApndWFyYW50ZWUuIEZhaXJseSByZWNlbnRseSB0aGVyZSB3
YXMgYSBjb21taXQgYWRkaW5nIGV2ZW4gbW9yZSBsb2NraW5nCjFjYzJlMWZhYWZiMyAoInB3bTog
QWRkIG1vcmUgbG9ja2luZyIpCgo+Cj4gSWYgc28sIHRoaXMgZnVuY3Rpb24gc2lnbmF0dXJlIGNh
biBwcm92aWRlIHRoZSBwYXJlbnQgZGV2aWNlIG9mIHRoZSBwd206OkNoaXAgYXMKPiBkZXZpY2U6
OkRldmljZTxkZXZpY2U6OkJvdW5kPiByZWZlcmVuY2UuCj4KPiBUaGlzIHdvdWxkIGFsbG93IHlv
dSB0byBhY2Nlc3MgaW9tZW0gbW9yZSBlZmZpY2llbnRseS4KPgo+IEluc3RlYWQgb2YKPgo+IAlk
YXRhLmlvbWVtLnRyeV9hY2Nlc3MoKQo+Cj4geW91IGNvdWxkIGRvCj4KPiAJZGF0YS5pb21lbS5h
Y2Nlc3MocGFyZW50KSAvLyBbMV0KPgo+IHdoaWNoIGRvZXMgZ2V0IHlvdSByaWQgb2YgdGhlIGF0
b21pYyBjaGVjayBhbmQgdGhlIFJDVSByZWFkIHNpZGUgY3JpdGljYWwKPiBzZWN0aW9uIGltcGxp
ZWQgYnkgdHJ5X2FjY2VzcygpLgo+Cj4gQWN0dWFsbHksIEkgc2hvdWxkIGhhdmUgYWRkZWQgdGhp
cyBjb21tZW50IGFuZCBleHBsYW5hdGlvbiB0byB0aGUgYWJzdHJhY3Rpb24KPiBwYXRjaCwgYnV0
IGZvcmdvdCBhYm91dCBpdC4gOikKClRoYW5rcyAhIEFwcHJlY2lhdGUgeW91ciByZXZpZXcgIQpN
aWNoYcWCCgo+Cj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0va2VybmVs
Ly0vYmxvYi9kcm0tbmV4dC9ydXN0L2tlcm5lbC9kZXZyZXMucnM/cmVmX3R5cGU9aGVhZHMjTDIx
Mwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
