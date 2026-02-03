Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561EEE8304F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 19:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S61VaVAvYtsQJeRb7RkthpZ7NrQtXJdBQ66yWGtqVdo=; b=1oJKueSwpfXEpf
	otb9pI16spizd+0Jo0twEgAj3jCz8Dk8oRb165BJPGktzEMT454M4VLrqGMumVYuW+lJMwKSivEbV
	35+k45osw87VCm5awsSa294fcnd4vvAExFrakx7OcFH5PGe6ORoYt30XXDUg1rX+G2mERmVHEFMwr
	ztF+3uzgulxMtbzHAJTM9v2MwDreOdN62XLqLWjidU/G7ddUTkziWaU77xLDzyojBXfC7pFAXdCB2
	PT8bQ9evpgRZDNe/5QTonslkrSCCsuinMDejqxxHxJQJoxh8p+cRnqWv0pm2FrZ8SQbsVGNfWZrYM
	28TdGpZxSENFspetwI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMJl-00000007FbJ-21w2;
	Tue, 03 Feb 2026 19:44:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMJj-00000007Faa-16Je
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 19:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770147844;
	bh=rilX/3q1uO+93ZDSC/0F/Ll3/KF8mSJ95JKd0lqaZJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qpGY1dFjptNczdKqGjEmqbIwaPOAoPjUfMrb8f+7ajMiObg12tZJmRGRHYPr9D65b
	 oVBWhbz1HzB7h0ekQtL4lg4tFgkZi/M0F8vZU6vKM7I9DjZdZA3cjIGrNFPmibzJv7
	 0RoQdzCsm51CDbnr0ugwKWJuQFGtsO/ZaPrDmXlrWVftWiW+hIMJgNivbP3LEap0sa
	 rt5NNjMcxProZY185d2uwk/kT5rtDHAWGg+igEG47dDCnfJ//yAUZ8hzBW+UMHGlfp
	 s08I9cudyTsrycapcwci+65Gc7tQQXA89hZPt0se+gT9sxYVT2uTUoYKwhxqstvDGL
	 iwV7mkkDhai1g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 805D217E01E7;
	Tue,  3 Feb 2026 20:44:03 +0100 (CET)
Date: Tue, 3 Feb 2026 20:43:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Maxime
 Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203204354.7032d958@fedora>
In-Reply-To: <B94452FD-5F6F-44D4-80D8-4D4B7004C4B5@collabora.com>
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
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_114407_483793_5B555BB2 
X-CRM114-Status: GOOD (  16.63  )
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

T24gVHVlLCAzIEZlYiAyMDI2IDE2OjI2OjIyIC0wMzAwCkRhbmllbCBBbG1laWRhIDxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gPiAKPiA+IEkgdGhpbmsgaXQncyBmaW5l
IHRvIGhhdmUgYWxsIG9mIHRoZXNlOgo+ID4gKiBgQ2xvbmVgIGltcGwKPiA+ICogYGVuYWJsZWAg
d2hpY2ggY29uc3VtZXMgYENsazxQcmVwYXJlZD5gIGJ5IHZhbHVlIGFuZCBzcGl0IG91dCBgQ2xr
PEVuYWJsZWQ+YAo+ID4gKiBgd2l0aF9lbmFibGVkYCB0aGF0IGdpdmVzIGAmQ2xrPEVuYWJsZWQ+
YAo+ID4gCj4gPiBUaGlzIHdheSwgaWYgeW91IG9ubHkgd2FudCB0byBlbmFibGUgaW4gc2hvcnQg
dGltZSwgeW91IGNhbiBkbyBgd2l0aF9lbmFibGVkYC4KPiA+IElmIHRoZSBjbG9zdXJlIGNhbGxi
YWNrIHdhbnRzIHRvIGtlZXAgY2xvY2sgZW5hYmxlZCBmb3IgbG9uZ2VyLCBpdCBjYW4ganVzdCBk
bwo+ID4gYC5jbG9uZSgpYCBpbnNpZGUgdGhlIGNsb3N1cmUgYW5kIG9idGFpbiBhbiBvd25lZCBg
Q2xrPEVuYWJsZWQ+YC4KPiA+IAo+ID4gSWYgdGhlIHVzZXIganVzdCBoYXZlIGEgcmVmZXJlbmNl
IGFuZCB3YW50IHRvIGVuYWJsZSB0aGUgY2FsbGJhY2sgdGhleSBjYW4gZG8KPiA+IGBwcmVwYXJl
ZF9jbGsuY2xvbmUoKS5lbmFibGUoKWAgd2hpY2ggZ2l2ZXMgYW4gb3duZWQgYENsazxFbmFibGVk
PmAuIFRob3VnaHRzPwo+ID4gCj4gPiBCZXN0LAo+ID4gR2FyeSAgCj4gCj4gCj4gSeKAmW0gb2sg
d2l0aCB3aGF0IHlvdSBwcm9wb3NlZCBhYm92ZS4gVGhlIG9ubHkgcHJvYmxlbSBpcyB0aGF0IGlt
cGxlbWVudGluZwo+IGNsb25lKCkgaXMgZG9uZSB0aHJvdWdoIGFuIEFyYzwqbXV0IGJpbmRpbmdz
OjpjbGs+ICBpbiBCb3Jpc+KAmSBjdXJyZW50Cj4gZGVzaWduLAoKSXQncyBhY3R1YWxseSBBcmM8
UmF3Q2xrPiB3aXRoCgogICAgc3RydWN0IFJhd0NsaygqbXV0IGJpbmRpbmdzOjpjbGspOwoKICAg
IGltcGwgRHJvcCBmb3IgUmF3Q2xrIHsKICAgICAgICBmbiBkcm9wKCZtdXQgc2VsZikgewogICAg
ICAgICAgICAvLyBTQUZFVFk6IEJ5IHRoZSB0eXBlIGludmFyaWFudHMsIHNlbGYuYXNfcmF3KCkg
aXMgYSB2YWxpZCBhcmd1bWVudCBmb3IgLy8gW2BjbGtfcHV0YF0uCiAgICAgICAgICAgIHVuc2Fm
ZSB7IGJpbmRpbmdzOjpjbGtfcHV0KHNlbGYuMCkgfTsKICAgICAgICB9CiAgICB9CgpUaGlzIGlz
IGJlY2F1c2Ugc3RydWN0IGNsayBpcyBub3QgcmVmY291bnRlZCwgc28gY2xvbmluZwppbXBsaWVz
IHdyYXBwaW5nIHRoaXMgb2JqZWN0IGluIGFuIEFyYywgYW5kIG9ubHkgY2FsbGluZwpjbGtfcHV0
KCkgd2hlbiB0aGUgQXJjIHJlZmNudCByZWFjaGVzIHplcm8uCgo+IHNvIHRoaXMgcmVxdWlyZXMg
YW4gZXh0cmEgYWxsb2NhdGlvbi4KClRoYXQncyB0cnVlLiBCdXQgdGhlIG1lbW9yeSBvdmVyaGVh
ZCBzaG91bGQgYmUgcHJldHR5IG5lZ2xpZ2libGUsCmFuZCBJIGRvbid0IHRoaW5rIHRoZSBleHRy
YSBpbmRpcmVjdGlvbiBtYWtlcyBhbnkgbm90aWNlYWJsZQpkaWZmZXJlbmNlIGZvciBhbiBhY3R1
YWwgY2xrIGltcGxlbWVudGF0aW9uIChvbmUgdGhhdCdzIG5vdCBhIE5PUCksCnNpbmNlIHdlIGhh
dmUgaW5kaXJlY3Rpb25zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbHJlYWR5IChjbGsgLT4gY2xrX2h3
LApjbGtfb3BzLCAuLi4pLiBTbyBJIHRoaW5rIEknZCB2YWx1ZSBlYXNlIG9mIHVzZSBvdmVyIHRo
aXMgc21hbGwKcGVyZnMvbWVtLXVzYWdlIGhpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
