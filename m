Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B65E87845
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIBPBZEBjaiX/fPspVwoALIQAXuG8QG6OVNqUWQHRL8=; b=OA0JrER951qs+G
	iIznmzVQE3K48ID06v43US2N0SQ9oBM3xu0EWA+DLUnJzMMUQnwnNE9nfewYNzhBgrTLdErDT1mNW
	NSM2HkUzDY8/o+9aPD+VEjwMNM1sJnx8dpTDR2kX+K+cItPyGcb7L/liia3/Awo+QSpRFbiQbSrWU
	z99a2HBzWsF/pqE/NOZ49inDlMD5zTnjmqZRUFMhfDl5n/RRXJpW+B8Nrcc4sZq/Fmp/Z6TALkfGL
	gfN6UofuJCeA0wLb9oYY2tx6ZYRRXEyYjzSL6bNOHugj4H4N9S9mdRF/OV8ct6vbgEtqXEXlHGfOm
	+Ghv9p1byn3p2HUbRU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGr-00000006wxV-1m1s;
	Tue, 03 Feb 2026 16:28:57 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGp-00000006wwc-4Bg9
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 16:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770136118; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lLkAncyetA37sc/HLFwEKT9Cqga2bbfnvmVihfzHkmqajAmyRsiq6JC9FcK2A8hqdurM/F4aMjZUh51/NVgMBiu2qu+oXKMaAm9l9wDmMjBeR5Ufq1bT2kC1QzGnWOZ0ncvbBXh94p3s7uOqk7p1dMZy9VLGCX8tiykydSyR8Q0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770136118; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mcpQ6BHdtlmcJP+6sUHzKp/HKqU2X/+4lbxQzskRA/8=; 
	b=mtdzdD9lE65ZdW3lERr1djKK6k9RzPFv0ppHVYzAr8YCubzOnLynnBSdLz6T0bMMprfgNlCAa5tEI093fendJnYCPtHidl7FupFhvGQxPUpqJdMp6hUD4PFT1bQP2dOZrqx64SNaE6nky/GaW567pJnBDrn0UaErjUkwBH1abGk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770136118;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=mcpQ6BHdtlmcJP+6sUHzKp/HKqU2X/+4lbxQzskRA/8=;
	b=Vaohwio60p4BO1VObvEdiCCH1LCnW2Snk0CPfKC9EeKEQ6/ThqJr7X0R6eP2mxpI
	MoXy/OuxN2rNIq4upnh03oXvE2nll/jit27nzX9Eqbr5egP1RCpMMFjwmY6fGLK83Cf
	/Hnfo4IKgwI7yeQLDAIUDWJGXnCpZIRHV9eZ5x08=
Received: by mx.zohomail.com with SMTPS id 1770136116210986.0414403743216;
	Tue, 3 Feb 2026 08:28:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203150855.77c93e22@fedora>
Date: Tue, 3 Feb 2026 13:28:15 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <4DD13AE1-C85F-450F-93F2-C7C75766E518@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <20260203150855.77c93e22@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082856_070789_68485821 
X-CRM114-Status: GOOD (  17.36  )
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

PHNuaXA+Cgo+PiAKPj4gVGhlIHByb2JsZW0gd2l0aCB3aGF0IHlvdSBoYXZlIHN1Z2dlc3RlZCBp
cyB0aGF0IHRoZSBwcmV2aW91cyBzdGF0ZSBpcyBub3QKPj4gY29uc3VtZWQgaWYgeW91IGNhbiBj
bG9uZSBpdCwgYW5kIGNvbnN1bWluZyB0aGUgcHJldmlvdXMgc3RhdGUgaXMgYSBwcmV0dHkga2V5
Cj4+IGVsZW1lbnQgaW4gZW5zdXJpbmcgeW91IGNhbm5vdCBtaXN1c2UgaXQuIEZvciBleGFtcGxl
LCBoZXJlOgo+PiAKPj4gbGV0IGVuYWJsZWRfY2xrID0gcHJlcGFyZWRfY2xrLmNsb25lKCkuZW5h
YmxlKCk/Owo+PiAvLyBkbyBzdHVmZgo+PiAvLyBlbmFibGVkX2NsayBnb2VzIG91dCBvZiBzY29w
ZSBhbmQgcmVsZWFzZXMgdGhlIGVuYWJsZQo+PiAvLyByZWYgaXQgaGFkCj4+IAo+PiBwcmVwYXJl
ZF9jbGsgaXMgc3RpbGwgYWxpdmUuCj4gCj4gVGhhdCB3YXMgaW50ZW50aW9uYWwgaW4gdGhpcyBl
eGFtcGxlLiBUaGluayBhYm91dCBhIHByZXBhcmVkX2NsayB0aGF0J3MKPiBzdG9yZWQgaW4gc29t
ZSBkcml2ZXItaW50ZXJuYWwgb2JqZWN0LCBiZWNhdXNlIHlvdSB3YW50IHRvIGtlZXAgdGhlIGNs
awo+IHByZXBhcmVkIGF0IGFsbCB0aW1lcyBiZXR3ZWVuIHRoZSBwcm9iZSgpIGFuZCB1bmJpbmQo
KS4gVGhlbiB5b3UgaGF2ZQo+IHNvbWUgc2VjdGlvbnMgd2hlcmUgeW91IHdhbnQgdG8gYnJpZWZs
eSBlbmFibGUgdGhlIGNsayB0byBhY2Nlc3MKPiByZWdpc3RlcnMsIGFuZCBpbW1lZGlhdGVseSBk
aXNhYmxlIGl0IHdoZW4geW91J3JlIGRvbmUuIFRoZSBjbG9uZSgpCj4gaGVyZSBndWFyYW50ZWVz
IHRoYXQgdGhlIGluaXRpYWwgcHJlcGFyZWRfY2xrIHN0YXlzIHZhbGlkLgo+IAo+IElmIHlvdSB3
ZXJlIHRvIGRpc2FibGUsIHVucHJlcGFyZSBhbmQgcHV0IHRoZSBjbGsgd2hlbiBlbmFibGVkX2Ns
ayBnb2VzCj4gb3V0IG9mIHNjb3BlLCB5b3UnZCBnbwoKPiAKPiBsZXQgZW5hYmxlZF9jbGsgPSBw
cmVwYXJlZF9jbGsuZW5hYmxlKCk/Owo+IAo+IGFuZCB0aGF0IHdvdWxkIHN0aWxsIHdvcmssIGl0
J3MganVzdCBub3QgdGhlIHNhbWUgdXNlLWNhc2UuCj4gCgpPaywgbGV04oCZcyBoYXZlIGNsb25l
KCkgdGhlbi4KCgo+PiBOb3csIHRoaXMgbWF5IG5vdCBiZSB0aGUgZW5kIG9mIHRoZSB3b3JsZCBp
biB0aGlzCj4+IHBhcnRpY3VsYXIgY2FzZSwgYnV0IGZvciBBUEkgY29uc2lzdGVuY3ksIEknZCBz
YXkgd2Ugc2hvdWxkIHByb2JhYmx5IGF2b2lkIHRoaXMKPj4gYmVoYXZpb3IuCj4+IAo+PiBJIHNl
ZSB0aGF0IEFsaWNlIHN1Z2dlc3RlZCBhIGNsb3N1cmUgYXBwcm9hY2guIElNSE8sIHdlIHNob3Vs
ZCB1c2UgdGhhdAo+PiBpbnN0ZWFkLgo+IAo+IFRoZSBjbG9zdXJlLCB3aGlsZSBiZWluZyB1c2Vm
dWwgZm9yIHRoZSBhYm92ZSBsb2NhbCBjbGstZW5hYmxlbWVudAo+IGV4YW1wbGUsIGRvZXNuJ3Qg
YWxsb3cgZm9yIHBhc3Npbmcgc29tZSBDbGs8RW5hYmxlZD4gZ3VhcmQgYXJvdW5kLCBsaWtlCj4g
eW91IHdvdWxkIGRvIHdpdGggYSBsb2NrIEd1YXJkLCBhbmQgSSBiZWxpZXZlIHRoYXQncyBhIHVz
ZWZ1bCB0aGluZyB0bwo+IGhhdmUuCgoKV2R5bT8gWW914oCZZCBzdGlsbCBnZXQgYSAmQ2xrPEVu
YWJsZWQ+IHRoYXQgeW91IGNhbiBwYXNzIGFyb3VuZCwgaS5lLjoKCiAgIHNlbGYucHJlcGFyZWRf
Y2xrLndpdGhfZW5hYmxlZCh8Y2xrOiAmQ2xrPEVuYWJsZWQ+IHwgewogICAgICAgLi4uIHVzZSBy
ZWdpc3RlcnMsIHBhc3MgJkNsazxFbmFibGVkPiBhcyBuZWVkZWQKICAgfSk7CgpUaGlzIGlzIG5v
dyBub3QgYWJvdXQgY2xvbmUoKSB2cyBub3QgY2xvbmUoKSwgYnV0IG1vcmUgYWJvdXQgbGltaXRp
bmcgdGhlIHNjb3BlIG9mIHRoZQpFbmFibGVkIHN0YXRlLCB3aGljaCB3b3VsZCBjYXRlciB0byB0
aGUgdXNlLWNhc2UgeW91IG1lbnRpb25lZCBJSVVDLgoK4oCUIERhbmllbAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
