Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567C4C87FC9
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Aug 2025 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr7ma+O4hPLVz0bBni+zy7mOjCKkkSKFr0u6cEcpd7U=; b=PDNKpJ8JSZL+iI
	BdXcbupNJOK94P7mGmqu0TiENHJDwe7ZiTEiCnNrcw1TXMkZxWYCwkqOxNjEEIsOIO62Tl5jUFC0c
	Tkl7+MA069Al+8Eel411zzoyQkVVGdRldm7djfThB3g/rUMCju7yTsgRH2EiFXnfaZyIOKDDYsHjN
	pgkgbcsB4lKywXxm3lG/X1y3jP8ywuRzL+YoUW2aaRfXXahzVTQTGvbWo80YZkSsRzWMCRauxM57p
	qWSyru0TWbZvwr1A6TwBkNWUdRYRGW9Y6VYHkIfADiDWUxIiwGRBEmnZmCbeFMGH6oyHjdJtwAfsD
	jpYVgcZ5Kmox/csEBdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiJdw-00000007tlG-06XL;
	Sat, 02 Aug 2025 21:19:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiJdr-00000007tkr-3Pgm
	for linux-riscv@lists.infradead.org;
	Sat, 02 Aug 2025 21:19:51 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250802211942euoutp02e04591124d3cea8742fe218f645c5672~YD-ENMN712073020730euoutp02C
	for <linux-riscv@lists.infradead.org>; Sat,  2 Aug 2025 21:19:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250802211942euoutp02e04591124d3cea8742fe218f645c5672~YD-ENMN712073020730euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754169582;
	bh=I/2dlcrRSy99Csm9t0csY8wO5EgDCaan9WuLdFU4wKo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=EpFRIQZ8LLOuFWzKbRFsRkWiNGnIpvgnSv4CkeDD+Z0507Bl1e6tIAl/BavHUXJY5
	 AR03YHTD4/seVr+AgVgSqZJYRK0knahEZDpsHvspK+0d5tJNfK2/rf5Pt8aaZFpbB2
	 wDUBQdKT5Iti9RhtLhv4vsEczunEWp82ckPG67c0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250802211941eucas1p1872fbfcbece711926d059e0e5d14df1d~YD-DYQxnX2180321803eucas1p1j;
	Sat,  2 Aug 2025 21:19:41 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250802211940eusmtip18530543824eaf584b29d76a65b2312ae~YD-CRmpZK2541225412eusmtip1h;
	Sat,  2 Aug 2025 21:19:40 +0000 (GMT)
Message-ID: <8a99664b-8acb-4ace-9c2a-bdada5cac5cb@samsung.com>
Date: Sat, 2 Aug 2025 23:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] rust: pwm: Add Kconfig and basic data
 structures
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <437DA583-95FF-4ADF-9947-1F39D242E157@collabora.com>
X-CMS-MailID: 20250802211941eucas1p1872fbfcbece711926d059e0e5d14df1d
X-Msg-Generator: CA
X-RootMTR: 20250717090831eucas1p282ac3df2e2f1fc2a46e12c440abfbba1
X-EPHeader: CA
X-CMS-RootMailID: 20250717090831eucas1p282ac3df2e2f1fc2a46e12c440abfbba1
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
	<CGME20250717090831eucas1p282ac3df2e2f1fc2a46e12c440abfbba1@eucas1p2.samsung.com>
	<20250717-rust-next-pwm-working-fan-for-sending-v12-2-40f73defae0c@samsung.com>
	<437DA583-95FF-4ADF-9947-1F39D242E157@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_141949_219256_5BDB6ED2 
X-CRM114-Status: GOOD (  20.31  )
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

CgpPbiA3LzI1LzI1IDE3OjA4LCBEYW5pZWwgQWxtZWlkYSB3cm90ZToKPiBIaSBNaWNoYWwsCj4g
Cj4gCj4gT3ZlcmFsbCBsb29rcyBnb29kLCBhIGZldyBtaW5vciBjb21tZW50czoKCkhpLApDb25n
cmF0dWxhdGlvbnMgZm9yIGdldHRpbmcgeW91ciBJb01lbSBzZXJpZXMgbWVyZ2VkLiBUaGFuayB5
b3UgZm9yIHlvdXIKd29yaywgYXMgaXQgd2lsbCBhbGxvdyBtZSB0byBwcm9jZWVkIGFuZCByZS1h
ZGQgdGhlIGRyaXZlciBwYXJ0IGZvciB0aGlzCnNlcmllcy4KCj4gCj4gW+KApl0KPiAKPj4gKwo+
PiArLy8vIFdyYXBwZXIgZm9yIGJvYXJkLWRlcGVuZGVudCBQV00gYXJndW1lbnRzIFtgc3RydWN0
IHB3bV9hcmdzYF0oc3JjdHJlZS9pbmNsdWRlL2xpbnV4L3B3bS5oKS4KPj4gKyNbcmVwcih0cmFu
c3BhcmVudCldCj4+ICtwdWIgc3RydWN0IEFyZ3MoT3BhcXVlPGJpbmRpbmdzOjpwd21fYXJncz4p
Owo+PiArCj4+ICtpbXBsIEFyZ3Mgewo+PiArICAgIC8vLyBDcmVhdGVzIGFuIGBBcmdzYCB3cmFw
cGVyIGZyb20gYSBDIHN0cnVjdCBwb2ludGVyLgo+PiArICAgIC8vLwo+PiArICAgIC8vLyAjIFNh
ZmV0eQo+PiArICAgIC8vLwo+PiArICAgIC8vLyBUaGUgY2FsbGVyIG11c3QgZW5zdXJlIHRoYXQg
YGNfYXJnc19wdHJgIGlzIGEgdmFsaWQsIG5vbi1udWxsIHBvaW50ZXIKPj4gKyAgICAvLy8gdG8g
YGJpbmRpbmdzOjpwd21fYXJnc2AgYW5kIHRoYXQgdGhlIHBvaW50ZWQtdG8gZGF0YSBpcyB2YWxp
ZAo+PiArICAgIC8vLyBmb3IgdGhlIGR1cmF0aW9uIG9mIHRoaXMgZnVuY3Rpb24gY2FsbCAoYXMg
ZGF0YSBpcyBjb3BpZWQpLgo+PiArICAgIHVuc2FmZSBmbiBmcm9tX2NfcHRyKGNfYXJnc19wdHI6
ICpjb25zdCBiaW5kaW5nczo6cHdtX2FyZ3MpIC0+IFNlbGYgewo+PiArICAgICAgICAvLyBTQUZF
VFk6IENhbGxlciBndWFyYW50ZWVzIGBjX2FyZ3NfcHRyYCBpcyB2YWxpZC4gV2UgZGVyZWZlcmVu
Y2UgaXQgdG8gY29weS4KPj4gKyAgICAgICAgQXJncyhPcGFxdWU6Om5ldyh1bnNhZmUgeyAqY19h
cmdzX3B0ciB9KSkKPj4gKyAgICB9Cj4gCj4gZnJvbV9yYXcoKQo+IAo+IAo+PiArCj4+ICsgICAg
Ly8vIFJldHVybnMgdGhlIHBlcmlvZCBvZiB0aGUgUFdNIHNpZ25hbCBpbiBuYW5vc2Vjb25kcy4K
Pj4gKyAgICBwdWIgZm4gcGVyaW9kKCZzZWxmKSAtPiB1NjQgewo+PiArICAgICAgICAvLyBTQUZF
VFk6IGBzZWxmLjAuZ2V0KClgIHJldHVybnMgYSBwb2ludGVyIHRvIHRoZSBgYmluZGluZ3M6OnB3
bV9hcmdzYAo+PiArICAgICAgICAvLyBtYW5hZ2VkIGJ5IHRoZSBgT3BhcXVlYCB3cmFwcGVyLiBU
aGlzIHBvaW50ZXIgaXMgZ3VhcmFudGVlZCB0byBiZQo+PiArICAgICAgICAvLyB2YWxpZCBhbmQg
YWxpZ25lZCBmb3IgdGhlIGxpZmV0aW1lIG9mIGBzZWxmYCBiZWNhdXNlIGBPcGFxdWVgIG93bnMg
YSBjb3B5Lgo+PiArICAgICAgICB1bnNhZmUgeyAoKnNlbGYuMC5nZXQoKSkucGVyaW9kIH0KPj4g
KyAgICB9Cj4+ICsKPj4gKyAgICAvLy8gUmV0dXJucyB0aGUgcG9sYXJpdHkgb2YgdGhlIFBXTSBz
aWduYWwuCj4+ICsgICAgcHViIGZuIHBvbGFyaXR5KCZzZWxmKSAtPiBSZXN1bHQ8UG9sYXJpdHks
IEVycm9yPiB7Cj4+ICsgICAgICAgIC8vIFNBRkVUWTogYHNlbGYuMC5nZXQoKWAgcmV0dXJucyBh
IHBvaW50ZXIgdG8gdGhlIGBiaW5kaW5nczo6cHdtX2FyZ3NgCj4+ICsgICAgICAgIC8vIG1hbmFn
ZWQgYnkgdGhlIGBPcGFxdWVgIHdyYXBwZXIuIFRoaXMgcG9pbnRlciBpcyBndWFyYW50ZWVkIHRv
IGJlCj4+ICsgICAgICAgIC8vIHZhbGlkIGFuZCBhbGlnbmVkIGZvciB0aGUgbGlmZXRpbWUgb2Yg
YHNlbGZgLgo+PiArICAgICAgICBsZXQgcmF3X3BvbGFyaXR5ID0gdW5zYWZlIHsgKCpzZWxmLjAu
Z2V0KCkpLnBvbGFyaXR5IH07Cj4+ICsgICAgICAgIFBvbGFyaXR5Ojp0cnlfZnJvbShyYXdfcG9s
YXJpdHkpCj4+ICsgICAgfQo+PiArfQo+PiArCj4+ICsvLy8gV3JhcHBlciBmb3IgUFdNIHN0YXRl
IFtgc3RydWN0IHB3bV9zdGF0ZWBdKHNyY3RyZWUvaW5jbHVkZS9saW51eC9wd20uaCkuCj4+ICsj
W3JlcHIodHJhbnNwYXJlbnQpXQo+PiArcHViIHN0cnVjdCBTdGF0ZShiaW5kaW5nczo6cHdtX3N0
YXRlKTsKPiAKPiBObyBPcGFxdWU8VD4/CgpTaW5jZSB0aGlzIGlzIGEgY29weSBvZiB0aGUgc3Rh
dGUgaXQncyBmaW5lLiBUaGUgQXJncyBhYm92ZSBzaG91bGQKZm9sbG93IHNpbWlsYXIgcGF0dGVy
biwgdGhlIGRpdmVyZ2VuY2Ugc3RlbW1lZCB3aGVuIGl0ZXJhdGluZyB3aXRoIHRoaXMKc2VyaWVz
LiBTbyBJIHdvdWxkIHJhdGhlciBmaXggdGhlIEFyZ3MgdG8gYWxzbyBub3QgYmUgT3BhcXVlIGFz
IGl0CmRvZXNuJ3QgbmVlZCB0byBiZSwgc2luY2UgaXQncyBhbHNvIGEgY29weSBvZiB0aGUgb3Jp
Z2luYWwgKHNpbmNlIGl0J3MKc28gc21hbGwgYW5kIHJlYWQgb25seSkuCgo+IAo+PiArCj4+ICtp
bXBsIFN0YXRlIHsKPj4gKyAgICAvLy8gQ3JlYXRlcyBhIGBTdGF0ZWAgd3JhcHBlciBieSB0YWtp
bmcgb3duZXJzaGlwIG9mIGEgQyBgcHdtX3N0YXRlYCB2YWx1ZS4KPj4gKyAgICBwdWIoY3JhdGUp
IGZuIGZyb21fYyhjX3N0YXRlOiBiaW5kaW5nczo6cHdtX3N0YXRlKSAtPiBTZWxmIHsKPj4gKyAg
ICAgICAgU3RhdGUoY19zdGF0ZSkKPj4gKyAgICB9Cj4+ICsKPj4gKyAgICAvLy8gUmV0dXJucyBg
dHJ1ZWAgaWYgdGhlIFBXTSBzaWduYWwgaXMgZW5hYmxlZC4KPj4gKyAgICBwdWIgZm4gZW5hYmxl
ZCgmc2VsZikgLT4gYm9vbCB7Cj4+ICsgICAgICAgIHNlbGYuMC5lbmFibGVkCj4+ICsgICAgfQo+
PiArfQo+Pgo+PiAtLSAKPj4gMi4zNC4xCj4+Cj4+Cj4gCj4gSWYgdGhlIGxhY2sgb2YgT3BhcXVl
PFQ+IGlzIG5vdCBhIHByb2JsZW0gZm9yIHdoYXRldmVyIHJlYXNvbjoKPiAKPiBSZXZpZXdlZC1i
eTogRGFuaWVsIEFsbWVpZGEgPGRhbmllbC5hbG1laWRhQGNvbGxhYm9yYS5jb20+Cj4gCj4g4oCU
IERhbmllbAo+IAo+IAoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
