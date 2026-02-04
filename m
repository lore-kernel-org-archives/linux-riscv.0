Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5291BE83EED
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBcR36uuKGtwsWRFs9nsx+r1HWiCC9XJqn1DkYDZ3Ag=; b=PDkAsbKlZ34EEY
	SNpUcnb0+0v6uleXOeK0Xk6grxbJt8Mtci9tgtaSQsND7yIqgqho/zLE9b4KpxG8+e2d9jFZ+Pm1e
	+OVskqMTkCe8jAnkmjdHUpV+SDw+6CRZMSdNVTEoIqpXFR6tJnpH5bISFViOkKqnqis67SRCcpnsv
	0u8ULphcDDmhP6//Jk7DtueWKu/jkWxBnbXlONnh5+cEQJHGlZq16XHU+F3862tef2jgm0loUTnDI
	HEMX12xvaeCvqdtTKe3MCXIfdXaKVbr/c6ElGM6zMAxPth0WSgI8QXB0uGTaZAdpNIfk3NiqyGhsF
	C/cJEoP1DCABl+Ja3ZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXym-000000085Wj-3JF1;
	Wed, 04 Feb 2026 08:11:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXyk-000000085WD-2rXM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 08:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770192670;
	bh=8j8R8MPrfWY6vBRRIpvDiircDbGhdSwDxXfuiVs5GeI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DsEFJ3Nhca0gHPn0WW46xPuzuZwRmLNuOpKTYci/Grpz+8iFbAUufcYWOTdolbhe4
	 4Rju+q4X4pcKmAjKivkByu4y4dJjqVFYuCz5WFEYfcwMkREFh1aD8b/HUnDvbBGA4O
	 K1Tom/wQJod9y9Z6en141msQx34QphBNYgjipqSBG0XBBmR/FBZVfKVSfxPegpTbfj
	 w4RljDBo2vI4n3721FrPdjwSS+bIn9ahzDlJQUGlfuXZledsqf1PdT+3XYuZqoD+lC
	 i/NCr5O3feDTRIiu+CdMizfBKEWtDKIfpGXKb9i0DyOQihsMQ5R5bLUkGRJ15nhaFH
	 ZJJ99EmmtpDZA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE37317E114C;
	Wed,  4 Feb 2026 09:11:09 +0100 (CET)
Date: Wed, 4 Feb 2026 09:11:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maxime Ripard" <mripard@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?= <ukleinek@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260204091104.0a9c4a13@fedora>
In-Reply-To: <DG5M5MVHTNS4.1CUD61S0PD9NU@garyguo.net>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<20260108-delectable-fennec-of-sunshine-ffca19@houat>
	<98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
	<20260119-thundering-tested-robin-4be817@houat>
	<aW4lCfUyumOKRRJm@google.com>
	<20260203113902.501e5803@fedora>
	<E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
	<20260203150855.77c93e22@fedora>
	<4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
	<DG5HJPIYMS7B.152WPGG9MZZJ5@garyguo.net>
	<B94452FD-5F6F-44D4-80D8-4D4B7004C4B5@collabora.com>
	<DG5M5MVHTNS4.1CUD61S0PD9NU@garyguo.net>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_001114_885021_2C9E6A0F 
X-CRM114-Status: GOOD (  29.42  )
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

SGkgR2FyeSwgRGFuaWVsLAoKT24gVHVlLCAwMyBGZWIgMjAyNiAyMDozNjozMCArMDAwMAoiR2Fy
eSBHdW8iIDxnYXJ5QGdhcnlndW8ubmV0PiB3cm90ZToKCj4gT24gVHVlIEZlYiAzLCAyMDI2IGF0
IDc6MjYgUE0gR01ULCBEYW5pZWwgQWxtZWlkYSB3cm90ZToKPiA+ICAKPiA+PiAKPiA+PiBJIHRo
aW5rIGl0J3MgZmluZSB0byBoYXZlIGFsbCBvZiB0aGVzZToKPiA+PiAqIGBDbG9uZWAgaW1wbAo+
ID4+ICogYGVuYWJsZWAgd2hpY2ggY29uc3VtZXMgYENsazxQcmVwYXJlZD5gIGJ5IHZhbHVlIGFu
ZCBzcGl0IG91dCBgQ2xrPEVuYWJsZWQ+YAo+ID4+ICogYHdpdGhfZW5hYmxlZGAgdGhhdCBnaXZl
cyBgJkNsazxFbmFibGVkPmAKPiA+PiAKPiA+PiBUaGlzIHdheSwgaWYgeW91IG9ubHkgd2FudCB0
byBlbmFibGUgaW4gc2hvcnQgdGltZSwgeW91IGNhbiBkbyBgd2l0aF9lbmFibGVkYC4KPiA+PiBJ
ZiB0aGUgY2xvc3VyZSBjYWxsYmFjayB3YW50cyB0byBrZWVwIGNsb2NrIGVuYWJsZWQgZm9yIGxv
bmdlciwgaXQgY2FuIGp1c3QgZG8KPiA+PiBgLmNsb25lKClgIGluc2lkZSB0aGUgY2xvc3VyZSBh
bmQgb2J0YWluIGFuIG93bmVkIGBDbGs8RW5hYmxlZD5gLgo+ID4+IAo+ID4+IElmIHRoZSB1c2Vy
IGp1c3QgaGF2ZSBhIHJlZmVyZW5jZSBhbmQgd2FudCB0byBlbmFibGUgdGhlIGNhbGxiYWNrIHRo
ZXkgY2FuIGRvCj4gPj4gYHByZXBhcmVkX2Nsay5jbG9uZSgpLmVuYWJsZSgpYCB3aGljaCBnaXZl
cyBhbiBvd25lZCBgQ2xrPEVuYWJsZWQ+YC4gVGhvdWdodHM/Cj4gPj4gCj4gPj4gQmVzdCwKPiA+
PiBHYXJ5ICAKPiA+Cj4gPgo+ID4gSeKAmW0gb2sgd2l0aCB3aGF0IHlvdSBwcm9wb3NlZCBhYm92
ZS4gVGhlIG9ubHkgcHJvYmxlbSBpcyB0aGF0IGltcGxlbWVudGluZwo+ID4gY2xvbmUoKSBpcyBk
b25lIHRocm91Z2ggYW4gQXJjPCptdXQgYmluZGluZ3M6OmNsaz4gIGluIEJvcmlz4oCZIGN1cnJl
bnQKPiA+IGRlc2lnbiwgc28gdGhpcyByZXF1aXJlcyBhbiBleHRyYSBhbGxvY2F0aW9uLiAgCj4g
Cj4gSG1tLCB0aGF0J3MgYSB2ZXJ5IGdvb2QgcG9pbnQuIGBzdHJ1Y3QgY2xrYCBpcyBhbHJlYWR5
IGEgcmVmZXJlbmNlIGludG8KPiBjbGtfY29yZSwgc28gaGF2aW5nIHRvIHB1dCBhbm90aGVyIGxl
dmVsIG9mIGluZGlyZWN0aW9uIG92ZXIgaXMgbm90IGlkZWFsLgo+IEhvd2V2ZXIsIGlmIHdlJ3Jl
IGdvaW5nIHRvIGtlZXAgQyBjb2RlIHVuY2hhbmdlZCBhbmQgZG8gYSB6ZXJvLWNvc3QgYWJzdHJh
Y3Rpb24KPiBvbiB0aGUgUnVzdCBzaWRlLCB0aGVuIHdlIHdvbid0IGJlIGFibGUgdG8gaGF2ZSBo
YXZlIG11bHRpcGxlIHByZXBhcmUvZW5hYmxlIHRvCj4gdGhlIHNhbWUgYHN0cnVjdCBjbGtgIHdp
dGggdGhlIGN1cnJlbnQgZGVzaWduLgo+IAo+IEl0IGZlZWxzIGxpa2Ugd2UgY2FuIHRvIGRvIGEg
dHJhZGUtb2ZmIGFuZCBjaG9vc2UgZnJvbToKPiAxLiBOb3QgYmUgYWJsZSB0byBoYXZlIG11bHRp
cGxlIHByZXBhcmUvZW5hYmxlIGNhbGxzIG9uIHRoZSBzYW1lIGBjbGtgICh0aGlzIGNhbgo+ICAg
IGxpbWl0IHVzZXJzIHRoYXQgbmVlZCBkeW5hbWljYWxseSBlbmFibGUvZGlzYWJsZSBjbG9ja3Ms
IHdpdGggdGhlIHZlcnkgbGltaXRlZAo+ICAgIGV4Y2VwdGlvbiB0aGF0IGNsb3N1cmUtY2FsbGJh
Y2sgaXMgZmluZSkuCj4gMi4gRG8gYW4gZXh0cmEgYWxsb2NhdGlvbgo+IDMuIFB1dCBsaWZldGlt
ZSBvbiB0eXBlcyB0aGF0IHJlcHJlc2VudCBhIHByZXBhcmVkL2VuYWJsZWQgYENsa2AKPiA0LiBD
aGFuZ2UgQyB0byBtYWtlIGBzdHJ1Y3QgY2xrYCByZWZjb3VudGVkLgoKSXQgcHJvYmFibHkgY29t
ZXMgdG8gbm8gc3VycHJpc2UgdGhhdCBJJ2QgYmUgbW9yZSBpbiBmYXZvciBvZiBvcHRpb24gMgpv
ciA0LiBNYXliZSBvcHRpb24gMiBmaXJzdCwgc28gd2UgY2FuIGdldCB0aGUgdXNlci1mYWNpbmcg
QVBJIG1lcmdlZAp3aXRob3V0IHRvbyBtdWNoIGNodXJuLCBhbmQgdGhlbiB3ZSBjYW4gc2VlIGlm
IHRoZSBjbGsgbWFpbnRhaW5lcnMgYXJlCmhhcHB5IGFkZGluZyBhIHJlZmNudCB0byBzdHJ1Y3Qg
Y2xrIHRvIG9wdGltaXplIHRoaW5ncy4KCklmIHdlIHJlYWxseSBmZWVsIHRoYXQgdGhlIGluZGly
ZWN0aW9uL21lbW9yeSBvdmVyaGVhZCBpcyBnb2luZyB0bwpodXJ0IHVzLCB3ZSBjYW4gYWxzbyBz
dGFydCB3aXRoIG9wdGlvbiAxLCBhbmQgZXh0ZW5kIGl0IHRvIDIgYW5kL29yIDQKKG5lZWRlZCB0
byBhZGQgYSBDbG9uZSBzdXBwb3J0KSB3aGVuIGl0IGJlY29tZXMgZXZpZGVudCB3ZSBjYW4ndCBk
bwp3aXRob3V0IGl0LiBCdXQgYXMgSSB3YXMgc2F5aW5nIGluIG15IHByZXZpb3VzIHJlcGx5IHRv
IERhbmllbCwgSQpleHBlY3QgdGhlIGV4dHJhIGluZGlyZWN0aW9uL21lbW9yeSBvdmVyaGVhZCB0
byBiZSBuZWdsaWdpYmxlIHNpbmNlOgoKMS4gY2xrcyBhcmUgdXN1YWxseSBub3Qge3ByZXBhcmVk
LGVuYWJsZWR9L3tkaXNhYmxlZCx1bnByZXBhcmVkfSBpbiBhCiAgIGhvdCBwYXRoCjIuIGluIHRo
ZSByYXJlIG9jY2FzaW9ucyB3aGVyZSB0aGV5IG1pZ2h0IGJlICh7ZGV2LGNwdX1mcmVxID8pLCB0
aGlzCiAgIGNsayBzdGF0ZSBjaGFuZ2UgaXMgdXN1YWxseSBvbmUgb3BlcmF0aW9uIGluIGFuIG9j
ZWFuIG9mIG90aGVyCiAgIHNsb3dlciBvcGVyYXRpb25zIChyZWd1bGF0b3IgcmVjb25maWd1cmF0
aW9uLCBmb3IgaW5zdGFuY2UsIHdoaWNoCiAgIHVzdWFsbHkgZ29lcyBvdmVyIGEgc2xvdyBJMkMg
YnVzLCBvciBhCiAgIHJlbGF0aXZlbHktZmFzdGVyLWJ1dC1zdGlsbC1zbG93IFNQSSBvbmUsIGF0
IGxlYXN0IHdoZW4gd2UgY29tcGFyZQogICBpdCB0byBhbiBJb01lbSBhY2Nlc3MgZm9yIGluLVNv
Q3MgY2xrcykuIFNvIG92ZXJhbGwsIHRoZSBjbGsgc3RhdGUKICAgY2hhbmdlIG1pZ2h0IGFjY291
bnQgZm9yIGEgdmVyeSBzbWFsbCBwb3J0aW9uIG9mIHRoZSBDUFUgY3ljbGVzCiAgIHNwZW50IGlu
IHRoaXMgYmlnZ2VyIG9wZXJhdGlvbgozLiBpZiBJIGZvY3VzIHNvbGVseSBvbiB0aGUgY2xrIGFz
cGVjdCwgYW5kIGxvb2sgYXQgdGhlIGV4aXN0aW5nCiAgIGluZGlyZWN0aW9ucyBpbiB0aGUgY2xr
IGZyYW1ld29yayAoY2xrIC0+IGNsa19jb3JlIC0+IGNsa197aHcsb3BzfSAtPgogICBjbGtfbWV0
aG9kcyksIEknZCBleHBlY3QgdGhlIEFyYyBpbmRpcmVjdGlvbiB0byBiZSBqdXN0IG5vaXNlIGlu
CiAgIHRoaXMgcHJlLWV4aXN0aW5nIG92ZXJoZWFkCjQuIGluIHRlcm0gb2YgbWVtb3J5LCB3ZSdy
ZSB0YWxraW5nIGFib3V0IDE2IG1vcmUgYnl0ZXMgYWxsb2NhdGVkIHBlcgogICBDbGsgb24gYSA2
NC1iaXQgYXJjaGl0ZWN0dXJlIChyZWZjb3VudCBpcyBhbiBpbnQsIGJ1dCB0aGUgYWxpZ25tZW50
CiAgIGZvciB0aGUgY2xrIHBvaW50ZXIgZm9yY2VzIDQgYnl0ZXMgb2YgcGFkZGluZyBvbiBtb3N0
CiAgIGFyY2hpdGVjdHVyZXMpLiBPbiBhIDY0IGJpdCBhcmNoLCBzdHJ1Y3QgY2xrIGlzIDcyIGJ5
dGVzIGlmIG15IG1hdGgKICAgaXMgY29ycmVjdCwgc28gdGhhdCdzIGEgMjIlIG92ZXJoZWFkLCBj
b21wYXJlZCB0byAxMSUgb3ZlcmhlYWQgaWYKICAgdGhlIHJlZmNvdW50IHdhcyBpbiBzdHJ1Y3Qg
Y2xrIChvciBpbiBhIHN0cnVjdAogICByZWZjb3VudGVkX2NsayB2YXJpYW50IGlmIHdlIGRvbid0
IHdhbnQgQyB1c2VycyB0byBwYXkgdGhlIHByaWNlKS4KICAgTm90IGdyZWF0LCBidXQgbm90IHRl
cnJpYmxlIGVpdGhlcgoKU28geWVhaCBteSBndXQgZmVlbGluZyBpcyB0aGF0IHdlIG1pZ2h0IGJl
IG92ZXJ0aGlua2luZyB0aGlzIGV4dHJhCmFsbG9jYXRpb24vaW5kaXJlY3Rpb24gaXNzdWUuIFRo
aXMgYmVpbmcgc2FpZCwgb25lIHRoaW5nIEknZCByZWFsbHkgbGlrZQp0byBhdm9pZCBpcyB1cyBi
ZWluZyBkcmFnZ2VkIGludG8gaW5maW5pdGUgZGlzY3Vzc2lvbnMgYWJvdXQgYSBwZXJmZWN0Cmlt
cGxlbWVudGF0aW9uIGNhdXNpbmcgdGhlIG1lcmdpbmcgb2YgdGhlc2UgY2hhbmdlcyB0byBiZSBk
ZWxheWVkIGFuZApvdGhlciBjb250cmlidXRpb25zIGJlaW5nIGJsb2NrZWQgb24gdGhpcyAocGVy
ZmVjdCBpcyB0aGUgZW5lbXkgb2YKZ29vZCkuIEkgbWVhbiwgb3B0aW9uICMxIGlzIGFscmVhZHkg
YW4gaW1wcm92ZW1lbnQgY29tcGFyZWQgdG8gdGhlIHJhdwpmdW5jdGlvbnMgd2UgaGF2ZSBhdCB0
aGUgbW9tZW50LCBzbyBpZiB0aGF0J3MgdGhlIG1pZGRsZS1ncm91bmQgd2UKYWdyZWUgb24sIEkn
bSBoYXBweSB0byBnaXZlIGl0IG15IFItYi4KClJlZ2FyZHMsCgpCb3JpcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
