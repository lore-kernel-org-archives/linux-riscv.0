Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A7C87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uzEgcRK/mTfeL5rReR+rzDnBvl3s6o/YfnLdnQ3uFk=; b=raCxgdiCTM34Tq
	HiUocNFVg52vvgrl50JSAHKI4KXi6k/SRuOmwveYerztHTx/IfWO8hwFSU4IeAdrxUb9Q5jL89vFt
	lzi3Ovt2I9OH0iIwuCDaO6k2rFXY9Pnud3YPqTtqPX+1h2p4kNAnZTMmAPtehZYHuAFmnNmjBCwBJ
	gO8CkD8gvc40q+fjSUES0gNnPACNksdbNsgza87fYBIDNUi2cvXHlnXy8FZCdmUNC8VG3SWUS2uiu
	Lq/VZ/oN1fK5PfbR5SEcIlWXbzvLbHGJmkPGNZ+PL3uZFIOZKHMB3WPiQMWPWUUMaFpbs9Oa3aI8N
	JkxRy2GxCiA3LO+Z/Nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufK2x-0000000A4sT-2IMY;
	Fri, 25 Jul 2025 15:09:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufK2v-0000000A4rh-1GZu
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 15:09:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753456138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aJXR6a8q6dZxYmYb1+KpOaP5xjOrgMxKHNYdECzRR5QJmek/cfTFOY75qbIYgguq6ARPq9qJmb4qaVK8pgt56olCg9P/pqUuniPaONawvKK66N7hsTTwOEIHsNHxjIBA8rQspIl0b8ONPMWbP6wXwTvkXFCMWQ8dBMsLg2++llg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753456138; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ke+lVtmoyenH47nCVRy+b5168mhUwVX/VKLxEBmQcBw=; 
	b=QxcP3Cyfe1YTERLmahTy1qE1Yv4Xjan2hUkUenNpoutdyqp4cAoW6L76BBES14kDNwdUjXGXwZr+fNjVGJl84aSIw9N0vv5aTeQy/GBdaLVKvHmwyPNSECka0mhKzRfaIMNedBqxlm4SM+gEfTyDWwufP6tZdiyTttdThprB1ds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753456138;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ke+lVtmoyenH47nCVRy+b5168mhUwVX/VKLxEBmQcBw=;
	b=QE+1rzc3QP2OK2xyvj5KS8T65DhKXFXbPAOd74SKmC+dyFRz0auClItJ9wuXkDUY
	nh15gCgocCehYaQqSfIphi/TeIlZG9E4O/sVW2pHDUIGpc4Yc3ZpTfkiJrkIDhcIf/1
	gqN9XK+Sqhqgzt2jjQj1SKo4jpWAqzT6a/mzbruw=
Received: by mx.zohomail.com with SMTPS id 1753456135651361.47805588339804;
	Fri, 25 Jul 2025 08:08:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v12 2/3] rust: pwm: Add Kconfig and basic data structures
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250717-rust-next-pwm-working-fan-for-sending-v12-2-40f73defae0c@samsung.com>
Date: Fri, 25 Jul 2025 12:08:37 -0300
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
Message-Id: <437DA583-95FF-4ADF-9947-1F39D242E157@collabora.com>
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
 <CGME20250717090831eucas1p282ac3df2e2f1fc2a46e12c440abfbba1@eucas1p2.samsung.com>
 <20250717-rust-next-pwm-working-fan-for-sending-v12-2-40f73defae0c@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_080917_382084_1147E59D 
X-CRM114-Status: GOOD (  12.93  )
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

SGkgTWljaGFsLAoKCk92ZXJhbGwgbG9va3MgZ29vZCwgYSBmZXcgbWlub3IgY29tbWVudHM6Cgpb
4oCmXQoKPiArCj4gKy8vLyBXcmFwcGVyIGZvciBib2FyZC1kZXBlbmRlbnQgUFdNIGFyZ3VtZW50
cyBbYHN0cnVjdCBwd21fYXJnc2BdKHNyY3RyZWUvaW5jbHVkZS9saW51eC9wd20uaCkuCj4gKyNb
cmVwcih0cmFuc3BhcmVudCldCj4gK3B1YiBzdHJ1Y3QgQXJncyhPcGFxdWU8YmluZGluZ3M6OnB3
bV9hcmdzPik7Cj4gKwo+ICtpbXBsIEFyZ3Mgewo+ICsgICAgLy8vIENyZWF0ZXMgYW4gYEFyZ3Ng
IHdyYXBwZXIgZnJvbSBhIEMgc3RydWN0IHBvaW50ZXIuCj4gKyAgICAvLy8KPiArICAgIC8vLyAj
IFNhZmV0eQo+ICsgICAgLy8vCj4gKyAgICAvLy8gVGhlIGNhbGxlciBtdXN0IGVuc3VyZSB0aGF0
IGBjX2FyZ3NfcHRyYCBpcyBhIHZhbGlkLCBub24tbnVsbCBwb2ludGVyCj4gKyAgICAvLy8gdG8g
YGJpbmRpbmdzOjpwd21fYXJnc2AgYW5kIHRoYXQgdGhlIHBvaW50ZWQtdG8gZGF0YSBpcyB2YWxp
ZAo+ICsgICAgLy8vIGZvciB0aGUgZHVyYXRpb24gb2YgdGhpcyBmdW5jdGlvbiBjYWxsIChhcyBk
YXRhIGlzIGNvcGllZCkuCj4gKyAgICB1bnNhZmUgZm4gZnJvbV9jX3B0cihjX2FyZ3NfcHRyOiAq
Y29uc3QgYmluZGluZ3M6OnB3bV9hcmdzKSAtPiBTZWxmIHsKPiArICAgICAgICAvLyBTQUZFVFk6
IENhbGxlciBndWFyYW50ZWVzIGBjX2FyZ3NfcHRyYCBpcyB2YWxpZC4gV2UgZGVyZWZlcmVuY2Ug
aXQgdG8gY29weS4KPiArICAgICAgICBBcmdzKE9wYXF1ZTo6bmV3KHVuc2FmZSB7ICpjX2FyZ3Nf
cHRyIH0pKQo+ICsgICAgfQoKZnJvbV9yYXcoKQoKCj4gKwo+ICsgICAgLy8vIFJldHVybnMgdGhl
IHBlcmlvZCBvZiB0aGUgUFdNIHNpZ25hbCBpbiBuYW5vc2Vjb25kcy4KPiArICAgIHB1YiBmbiBw
ZXJpb2QoJnNlbGYpIC0+IHU2NCB7Cj4gKyAgICAgICAgLy8gU0FGRVRZOiBgc2VsZi4wLmdldCgp
YCByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgYGJpbmRpbmdzOjpwd21fYXJnc2AKPiArICAgICAg
ICAvLyBtYW5hZ2VkIGJ5IHRoZSBgT3BhcXVlYCB3cmFwcGVyLiBUaGlzIHBvaW50ZXIgaXMgZ3Vh
cmFudGVlZCB0byBiZQo+ICsgICAgICAgIC8vIHZhbGlkIGFuZCBhbGlnbmVkIGZvciB0aGUgbGlm
ZXRpbWUgb2YgYHNlbGZgIGJlY2F1c2UgYE9wYXF1ZWAgb3ducyBhIGNvcHkuCj4gKyAgICAgICAg
dW5zYWZlIHsgKCpzZWxmLjAuZ2V0KCkpLnBlcmlvZCB9Cj4gKyAgICB9Cj4gKwo+ICsgICAgLy8v
IFJldHVybnMgdGhlIHBvbGFyaXR5IG9mIHRoZSBQV00gc2lnbmFsLgo+ICsgICAgcHViIGZuIHBv
bGFyaXR5KCZzZWxmKSAtPiBSZXN1bHQ8UG9sYXJpdHksIEVycm9yPiB7Cj4gKyAgICAgICAgLy8g
U0FGRVRZOiBgc2VsZi4wLmdldCgpYCByZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgYGJpbmRpbmdz
Ojpwd21fYXJnc2AKPiArICAgICAgICAvLyBtYW5hZ2VkIGJ5IHRoZSBgT3BhcXVlYCB3cmFwcGVy
LiBUaGlzIHBvaW50ZXIgaXMgZ3VhcmFudGVlZCB0byBiZQo+ICsgICAgICAgIC8vIHZhbGlkIGFu
ZCBhbGlnbmVkIGZvciB0aGUgbGlmZXRpbWUgb2YgYHNlbGZgLgo+ICsgICAgICAgIGxldCByYXdf
cG9sYXJpdHkgPSB1bnNhZmUgeyAoKnNlbGYuMC5nZXQoKSkucG9sYXJpdHkgfTsKPiArICAgICAg
ICBQb2xhcml0eTo6dHJ5X2Zyb20ocmF3X3BvbGFyaXR5KQo+ICsgICAgfQo+ICt9Cj4gKwo+ICsv
Ly8gV3JhcHBlciBmb3IgUFdNIHN0YXRlIFtgc3RydWN0IHB3bV9zdGF0ZWBdKHNyY3RyZWUvaW5j
bHVkZS9saW51eC9wd20uaCkuCj4gKyNbcmVwcih0cmFuc3BhcmVudCldCj4gK3B1YiBzdHJ1Y3Qg
U3RhdGUoYmluZGluZ3M6OnB3bV9zdGF0ZSk7CgpObyBPcGFxdWU8VD4/Cgo+ICsKPiAraW1wbCBT
dGF0ZSB7Cj4gKyAgICAvLy8gQ3JlYXRlcyBhIGBTdGF0ZWAgd3JhcHBlciBieSB0YWtpbmcgb3du
ZXJzaGlwIG9mIGEgQyBgcHdtX3N0YXRlYCB2YWx1ZS4KPiArICAgIHB1YihjcmF0ZSkgZm4gZnJv
bV9jKGNfc3RhdGU6IGJpbmRpbmdzOjpwd21fc3RhdGUpIC0+IFNlbGYgewo+ICsgICAgICAgIFN0
YXRlKGNfc3RhdGUpCj4gKyAgICB9Cj4gKwo+ICsgICAgLy8vIFJldHVybnMgYHRydWVgIGlmIHRo
ZSBQV00gc2lnbmFsIGlzIGVuYWJsZWQuCj4gKyAgICBwdWIgZm4gZW5hYmxlZCgmc2VsZikgLT4g
Ym9vbCB7Cj4gKyAgICAgICAgc2VsZi4wLmVuYWJsZWQKPiArICAgIH0KPiArfQo+IAo+IC0tIAo+
IDIuMzQuMQo+IAo+IAoKSWYgdGhlIGxhY2sgb2YgT3BhcXVlPFQ+IGlzIG5vdCBhIHByb2JsZW0g
Zm9yIHdoYXRldmVyIHJlYXNvbjoKClJldmlld2VkLWJ5OiBEYW5pZWwgQWxtZWlkYSA8ZGFuaWVs
LmFsbWVpZGFAY29sbGFib3JhLmNvbT4KCuKAlCBEYW5pZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
