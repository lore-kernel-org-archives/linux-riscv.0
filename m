Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4472BE87827
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=En1L8I4M96ZboA/PDJ00iFywTzd9363mCWpKfAAowjA=; b=tBp7ko6k4YAo06
	JaHFRwnGTMiYJXR8LLLSi/409yQHoxl3/L+oep8ehL2NE4DVZ5MyVzZP+l/ynyuotdSl90LS1/ShN
	4UbofouE338D0Aytam9HNOVZiZHxZxhhMJXeuDb4gRbW6laHv5m9l2fdLBStjix8Yf9yy0WgdO/Ku
	n5awOkQI8tl1n39Oe4IheXBOQK90C65GVl+/BrVvSDlmwfraBGaYpPHDStAhc/UystDWaq1yCApPr
	A3q3PAPt8pwgcQsIBJtGoftbm/mOWoBn68M8T0rEGi/ZuNoDWtbHf7/4ByIRGPako1NjkGH21Vm1R
	VER6cUxUvgC8uIk8xEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGZX-00000006fm4-1Thy;
	Tue, 03 Feb 2026 13:36:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGZU-00000006fkw-25hj
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770125742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRtDZYrDtG+Qo6TQ6bHGL1iKjJNQwFHS9aGPrnY2taQmU2ygNnd43sIP/YND9vKwNWfnA5+kzEt1epU4CbWKzRHWlplgfv4AvnOEbxMdVKv0Iad7w4eoOhNKqpWV6TBEoK0Awftzly6wqWHLuhXCixuXKha7blt9SgpXPtDKcvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770125742; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HP8JuP4ZZCylaDagLho2pSOiJ0oq/o6LUgghhG4awbc=; 
	b=UL60gkPGuWwziImQ3DXJd1OyZy4CIH77KYNToI8bnqCQODB7z5bZGNAB+HDk76HzwMHi2sY/ULGT+Sbdtonp+aQBBxkBR+oi1mCsMjKQaczQv9stKMmIsmN9z4EYiA1gbkRHUjNfKcYw+vqIoYkNTawKqsM1/yfeHaMEmmf/aMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770125742;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=HP8JuP4ZZCylaDagLho2pSOiJ0oq/o6LUgghhG4awbc=;
	b=D29dbrywcjyDlJoFsJig9167NPWoCvvR8G3w5TDJ1TyWO4fARp+KWxE2r+SPluVH
	5wsZLXfE+MX0EI1KRM6A/4ZsSj6hSP0hkYMPyTH6/3HW+Vc++fxUt922D075Lj4WL6x
	NtzpfqxhwHMSw86kdTTTffq5ikFKRb5ZUtV6AjDM=
Received: by mx.zohomail.com with SMTPS id 1770125741199133.148611143052;
	Tue, 3 Feb 2026 05:35:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203101726.2cec1050@fedora>
Date: Tue, 3 Feb 2026 10:35:22 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
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
Message-Id: <399B3E13-1ED1-49C2-B5E6-6B6FAA8019D5@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260203101726.2cec1050@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_053600_629847_4D9C0248 
X-CRM114-Status: GOOD (  18.53  )
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

SGkgQm9yaXMsCgo+IE9uIDMgRmViIDIwMjYsIGF0IDA2OjE3LCBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPiBIZWxsbyBEYW5pZWwsCj4g
Cj4gT24gV2VkLCAwNyBKYW4gMjAyNiAxMjowOTo1MiAtMDMwMAo+IERhbmllbCBBbG1laWRhIDxk
YW5pZWwuYWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPj4gLSAgICAgICAgLy8vIERp
c2FibGUgYW5kIHVucHJlcGFyZSB0aGUgY2xvY2suCj4+ICsgICAgaW1wbCBDbGs8RW5hYmxlZD4g
ewo+PiArICAgICAgICAvLy8gR2V0cyBbYENsa2BdIGNvcnJlc3BvbmRpbmcgdG8gYSBib3VuZCBb
YERldmljZWBdIGFuZCBhIGNvbm5lY3Rpb24gaWQKPj4gKyAgICAgICAgLy8vIGFuZCB0aGVuIHBy
ZXBhcmVzIGFuZCBlbmFibGVzIGl0Lgo+PiAgICAgICAgIC8vLwo+PiAtICAgICAgICAvLy8gRXF1
aXZhbGVudCB0byBjYWxsaW5nIFtgQ2xrOjpkaXNhYmxlYF0gZm9sbG93ZWQgYnkgW2BDbGs6OnVu
cHJlcGFyZWBdLgo+PiArICAgICAgICAvLy8gRXF1aXZhbGVudCB0byBjYWxsaW5nIFtgQ2xrOjpn
ZXRgXSwgZm9sbG93ZWQgYnkgW2BDbGs6OnByZXBhcmVgXSwKPj4gKyAgICAgICAgLy8vIGZvbGxv
d2VkIGJ5IFtgQ2xrOjplbmFibGVgXS4KPj4gICAgICAgICAjW2lubGluZV0KPj4gLSAgICAgICAg
cHViIGZuIGRpc2FibGVfdW5wcmVwYXJlKCZzZWxmKSB7Cj4+IC0gICAgICAgICAgICAvLyBTQUZF
VFk6IEJ5IHRoZSB0eXBlIGludmFyaWFudHMsIHNlbGYuYXNfcmF3KCkgaXMgYSB2YWxpZCBhcmd1
bWVudCBmb3IKPj4gLSAgICAgICAgICAgIC8vIFtgY2xrX2Rpc2FibGVfdW5wcmVwYXJlYF0uCj4+
IC0gICAgICAgICAgICB1bnNhZmUgeyBiaW5kaW5nczo6Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNl
bGYuYXNfcmF3KCkpIH07Cj4+ICsgICAgICAgIHB1YiBmbiBnZXQoZGV2OiAmRGV2aWNlPEJvdW5k
PiwgbmFtZTogT3B0aW9uPCZDU3RyPikgLT4gUmVzdWx0PENsazxFbmFibGVkPj4gewo+PiArICAg
ICAgICAgICAgQ2xrOjo8UHJlcGFyZWQ+OjpnZXQoZGV2LCBuYW1lKT8KPj4gKyAgICAgICAgICAg
ICAgICAuZW5hYmxlKCkKPj4gKyAgICAgICAgICAgICAgICAubWFwX2Vycih8ZXJyb3J8IGVycm9y
LmVycm9yKQo+PiArICAgICAgICB9Cj4+ICsKPj4gKyAgICAgICAgLy8vIEJlaGF2ZXMgdGhlIHNh
bWUgYXMgW2BTZWxmOjpnZXRgXSwgZXhjZXB0IHdoZW4gdGhlcmUgaXMgbm8gY2xvY2sKPj4gKyAg
ICAgICAgLy8vIHByb2R1Y2VyLiBJbiB0aGlzIGNhc2UsIGluc3RlYWQgb2YgcmV0dXJuaW5nIFtg
RU5PRU5UYF0sIGl0IHJldHVybnMKPj4gKyAgICAgICAgLy8vIGEgZHVtbXkgW2BDbGtgXS4KPj4g
KyAgICAgICAgI1tpbmxpbmVdCj4+ICsgICAgICAgIHB1YiBmbiBnZXRfb3B0aW9uYWwoZGV2OiAm
RGV2aWNlPEJvdW5kPiwgbmFtZTogT3B0aW9uPCZDU3RyPikgLT4gUmVzdWx0PENsazxFbmFibGVk
Pj4gewo+PiArICAgICAgICAgICAgQ2xrOjo8UHJlcGFyZWQ+OjpnZXRfb3B0aW9uYWwoZGV2LCBu
YW1lKT8KPj4gKyAgICAgICAgICAgICAgICAuZW5hYmxlKCkKPj4gKyAgICAgICAgICAgICAgICAu
bWFwX2Vycih8ZXJyb3J8IGVycm9yLmVycm9yKQo+PiArICAgICAgICB9Cj4+ICsKPj4gKyAgICAg
ICAgLy8vIEF0dGVtcHRzIHRvIGRpc2FibGUgdGhlIFtgQ2xrYF0gYW5kIGNvbnZlcnQgaXQgdG8g
dGhlIFtgUHJlcGFyZWRgXQo+PiArICAgICAgICAvLy8gc3RhdGUuCj4+ICsgICAgICAgICNbaW5s
aW5lXQo+PiArICAgICAgICBwdWIgZm4gZGlzYWJsZShzZWxmKSAtPiBSZXN1bHQ8Q2xrPFByZXBh
cmVkPiwgRXJyb3I8RW5hYmxlZD4+IHsKPj4gKyAgICAgICAgICAgIC8vIFdlIHdpbGwgYmUgdHJh
bnNmZXJyaW5nIHRoZSBvd25lcnNoaXAgb2Ygb3VyIGBjbGtfZ2V0KClgIGFuZAo+PiArICAgICAg
ICAgICAgLy8gYGNsa19lbmFibGUoKWAgY291bnRzIHRvIGBDbGs8UHJlcGFyZWQ+YC4KPj4gKyAg
ICAgICAgICAgIGxldCBjbGsgPSBNYW51YWxseURyb3A6Om5ldyhzZWxmKTsKPj4gKwo+PiArICAg
ICAgICAgICAgLy8gU0FGRVRZOiBCeSB0aGUgdHlwZSBpbnZhcmlhbnRzLCBgc2VsZi4wYCBpcyBh
IHZhbGlkIGFyZ3VtZW50IGZvcgo+PiArICAgICAgICAgICAgLy8gW2BjbGtfZGlzYWJsZWBdLgo+
PiArICAgICAgICAgICAgdW5zYWZlIHsgYmluZGluZ3M6OmNsa19kaXNhYmxlKGNsay5hc19yYXco
KSkgfTsKPj4gKwo+PiArICAgICAgICAgICAgT2soQ2xrIHsKPj4gKyAgICAgICAgICAgICAgICBp
bm5lcjogY2xrLmlubmVyLAo+PiArICAgICAgICAgICAgICAgIF9waGFudG9tOiBQaGFudG9tRGF0
YSwKPj4gKyAgICAgICAgICAgIH0pCj4+ICAgICAgICAgfQo+PiAKPj4gICAgICAgICAvLy8gR2V0
IGNsb2NrJ3MgcmF0ZS4KPiAKPiBEdW5ubyBpZiB0aGlzIGhhcyBiZWVuIG1lbnRpb25lZCBhbHJl
YWR5LCBidXQgSSBiZWxpdmUgdGhlIHJhdGUKPiBnZXR0ZXIvc2V0dGVyIHNob3VsZCBiZSBpbiB0
aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4gSW5kZWVkLCBpdCdzCj4gcXVpdGUgY29tbW9uIGZv
ciBjbG9jayB1c2VycyB0byBjaGFuZ2UgdGhlIHJhdGUgd2hlbiB0aGUgY2xrIGlzCj4gZGlzYWJs
ZWQgdG8gYXZvaWQgdW5zdGFibGUgdHJhbnNpdGlvbmFsIHN0YXRlLiBUaGUgdXN1YWwgcGF0dGVy
biBmb3IKPiB0aGF0IGlzOgo+IAo+IC0gY2xrX3NldF9wYXJlbnQobXlfY2xrLCBzZWNvbmRhcnlf
cGFyZW50KQo+IC0gY2xrX2Rpc2FibGVbX3VucHJlcGFyZV0ocHJpbWFyeV9wYXJlbnQpIC8vICh1
c3VhbGx5IGEgUExMKQo+IC0gY2xrX3NldF9yYXRlKHByaW1hcnlfcGFyZW50KQo+IC0gY2xrW19w
cmVwYXJlXV9lbmFibGUocHJpbWFyeV9wYXJlbnQpCj4gLSBjbGtfc2V0X3BhcmVudChteV9jbGss
IHByaW1hcnlfcGFyZW50KQo+IAo+IFRoZSBjYXNlIHdoZXJlIHRoZSBjbGsgcmF0ZSBpcyBjaGFu
Z2VkIHdoaWxlIHRoZSBjbGsgaXMgYWN0aXZlIGlzIGFsc28KPiB2YWxpZCAodXN1YWxseSBmaW5l
IHdoZW4gaXQncyBqdXN0IGEgZGl2aWRlciB0aGF0J3MgY2hhbmdlZCwgYmVjYXVzZQo+IHRoZXJl
J3Mgbm8gc3RhYmlsaXphdGlvbiBwZXJpb2QpLgo+IAo+PiBAQCAtMjUyLDgzICs0MjksMzEgQEAg
cHViIGZuIHNldF9yYXRlKCZzZWxmLCByYXRlOiBIZXJ0eikgLT4gUmVzdWx0IHsKPj4gICAgICAg
ICB9Cj4+ICAgICB9Cj4gCgoKSeKAmW0gb2sgd2l0aCB0aGlzLiBJIGp1c3QgYXNzdW1lZCB0aGF0
IHRoZXNlIG9wZXJhdGlvbnMgd2VyZSBvbmx5IHZhbGlkIG9uIGVuYWJsZWQgY2xrcy4KCldpbGwg
Y2hhbmdlIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbi4KCuKAlCBEYW5pZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
