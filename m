Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50285E87849
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q71uVUPpia7E5dex7gNoPCeUEa8x5zC02A7bvlybLCk=; b=YmfSdfQT4qwL1i
	igqQbWCnFvS1gfA7+qpf+fNv2mfKN2qQH1JNSQSMNx8AfnJP6BirTCmN9i934G8sJEk1HbO2I+K1E
	plIPUiMAAZoztsHsXaAuoYWRucUGo2bpqr9Ya3ilgKPI9I+qgeBWMx2PeDlc7yuZIQltN23z6a85H
	vvM+nIsvEcHnKJsbXJydXueuc7nSbRyVXq7j2qmTqiv+NGauomQvdJXRm3C8bj06ytbLYAlE5y3ak
	A7YUfspdNYxsJlIyUPVrPYGwCsGIoP51S5H7zg37oY0r6sI1K1uFlLlsZkYoatmr1Z9l4eHQcS3vu
	j90uYyGmcZ11mkGk2nKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJgq-00000006zfR-0K5H;
	Tue, 03 Feb 2026 16:55:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJgn-00000006zeJ-3JwF
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 16:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770137743;
	bh=kV4Ge2gh5t0HmAlwXC8n3adoRIP/5wSBNzlEZwjgwdE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SQB8eyyQ7m+9HKt1io93UcEwuHpqqVLhVaeRvzwZEyF6X8SsHu5YfL0Nwg3LvkoWp
	 rpRu700K7s/cTrZj0RFpQBmgbvLE/Gs31SFRRWVIX78vAR8eV8hQvmWVuR+g22BtTC
	 tQ6y3ygF9n2mXKYnkgbI7ezPoNaoJ6SBrmO0/tuilNzm8O8eUG/pbJzzAjLi2Tq9B/
	 /K7txIANL3FnTYNVLgFB8ygumSmzb6xji2/ZEBFTxSGzQ132DsEKdSlsd43Q7YyC9W
	 CRhDBrkNzYSHqUTXy3L8B1jXkBk41Hq9NzOzCD3H8ydlVSGR42QuORztpZ997mKUA2
	 fp05L7juKT2dA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CE7E17E1274;
	Tue,  3 Feb 2026 17:55:42 +0100 (CET)
Date: Tue, 3 Feb 2026 17:55:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203175536.1a77abbc@fedora>
In-Reply-To: <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
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
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_085545_988216_E4819191 
X-CRM114-Status: GOOD (  17.89  )
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

T24gVHVlLCAzIEZlYiAyMDI2IDEzOjI4OjE1IC0wMzAwCkRhbmllbCBBbG1laWRhIDxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gPj4gTm93LCB0aGlzIG1heSBub3QgYmUg
dGhlIGVuZCBvZiB0aGUgd29ybGQgaW4gdGhpcwo+ID4+IHBhcnRpY3VsYXIgY2FzZSwgYnV0IGZv
ciBBUEkgY29uc2lzdGVuY3ksIEknZCBzYXkgd2Ugc2hvdWxkIHByb2JhYmx5IGF2b2lkIHRoaXMK
PiA+PiBiZWhhdmlvci4KPiA+PiAKPiA+PiBJIHNlZSB0aGF0IEFsaWNlIHN1Z2dlc3RlZCBhIGNs
b3N1cmUgYXBwcm9hY2guIElNSE8sIHdlIHNob3VsZCB1c2UgdGhhdAo+ID4+IGluc3RlYWQuICAK
PiA+IAo+ID4gVGhlIGNsb3N1cmUsIHdoaWxlIGJlaW5nIHVzZWZ1bCBmb3IgdGhlIGFib3ZlIGxv
Y2FsIGNsay1lbmFibGVtZW50Cj4gPiBleGFtcGxlLCBkb2Vzbid0IGFsbG93IGZvciBwYXNzaW5n
IHNvbWUgQ2xrPEVuYWJsZWQ+IGd1YXJkIGFyb3VuZCwgbGlrZQo+ID4geW91IHdvdWxkIGRvIHdp
dGggYSBsb2NrIEd1YXJkLCBhbmQgSSBiZWxpZXZlIHRoYXQncyBhIHVzZWZ1bCB0aGluZyB0bwo+
ID4gaGF2ZS4gIAo+IAo+IAo+IFdkeW0/IFlvdeKAmWQgc3RpbGwgZ2V0IGEgJkNsazxFbmFibGVk
PiB0aGF0IHlvdSBjYW4gcGFzcyBhcm91bmQsIGkuZS46Cj4gCj4gICAgc2VsZi5wcmVwYXJlZF9j
bGsud2l0aF9lbmFibGVkKHxjbGs6ICZDbGs8RW5hYmxlZD4gfCB7Cj4gICAgICAgIC4uLiB1c2Ug
cmVnaXN0ZXJzLCBwYXNzICZDbGs8RW5hYmxlZD4gYXMgbmVlZGVkCj4gICAgfSk7Cj4gCj4gVGhp
cyBpcyBub3cgbm90IGFib3V0IGNsb25lKCkgdnMgbm90IGNsb25lKCksIGJ1dCBtb3JlIGFib3V0
IGxpbWl0aW5nIHRoZSBzY29wZSBvZiB0aGUKPiBFbmFibGVkIHN0YXRlLCB3aGljaCB3b3VsZCBj
YXRlciB0byB0aGUgdXNlLWNhc2UgeW91IG1lbnRpb25lZCBJSVVDLgoKRmFpciBlbm91Z2guIEkg
Z3Vlc3MgaXQncyBtb3JlIGEgbWF0dGVyIG9mIHRhc3RlIGZvciB0aGF0IHBhcnRpY3VsYXIKY2Fz
ZSwgYW5kIEknbSBub3QgZnVuZGFtZW50YWxseSBvcHBvc2VkIHRvIGFkZGluZyB0aGlzIGNsb3N1
cmUgYXBwcm9hY2guCgpXaGF0IHRoZSBjbG9uZSBhcHByb2FjaCBhbGxvd3MgdGhhdCdzIG5vdCBk
b2FibGUgd2l0aCB0aGUgY2xvc3VyZQpBRkFJQ1QsIGlzIHNvbWV0aGluZyBsaWtlOgoKCWxldCBw
cmVwX2NsayA9IENsazo6Z2V0KC4uLik/LnByZXBhcmUoKT87CgoJbGV0IGNvbXBfYSA9IE15Q29t
cG9uZW50QSB7CgkJcHJlcGFyZWRfY2xrOiBwcmVwX2Nsay5jbG9uZSgpLAoJfQoKCWxldCBjb21w
X2IgPSBNeUNvbXBvbmVudEIgewoJCWVuYWJsZWRfY2xrOiBwcmVwX2Nsay5lbmFibGUoKT8sCgl9
CgphbmQgaGF2ZSB0aGUgZ3VhcmFudGVlIHRoYXQsIGFzIGxvbmcgYXMgY29tcF9hIGlzIGFsaXZl
IHRoZSB1bmRlcmx5aW5nCmNsayBpcyBhdC1sZWFzdC1QcmVwYXJlZCwgYW5kIGFzIGxvbmcgYXMg
Y29tcF9iIGlzIGFsaXZlIHRoZSB1bmRlcmx5aW5nCmNsayBpcyBFbmFibGVkLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
