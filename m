Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBFCCD194
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eylhBiubJsTOpN3giRA3qbUMSnUNkpOYFtFmedlcwHw=; b=qoMc+GNuAiGgEW
	oCsNLEESbr1h4Hn/PGoYKsoq/hggaR/WPItxLB1QaugitGGJ/fuF/DH6b0+60A6GQGmWcfMZzrxbu
	zojFb6phzaK3ZOdGDvBSY1Jy2PFfhYW/fCMJehjHVof0mYaKAJB19TWTM4XCW2fpYk5eGf/SInjdH
	q6h31xFeRQjfspjuBOx7OweFfRtuEf4D4YkyQ9J89qSlCbKE/lGb3b7pso1WOGGHIi4I35phyNT/M
	11CrvjSbeiA+vYu35W4wvsaMbGPyuFPYzUtMCQwfbs6cvIFqA9WNfHBhi3Ua/GF/vrQzgLlld3INq
	6Y2cX6ZCZquDCt71CA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95fo-00000002U1Y-3XTK;
	Wed, 15 Oct 2025 17:52:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v95fk-00000002Tz6-2feD
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 17:52:27 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251015175217euoutp0120e0d95abfaa82ac7c5063a1a43093ff~uu5FlIf9M1974019740euoutp01F
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 17:52:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251015175217euoutp0120e0d95abfaa82ac7c5063a1a43093ff~uu5FlIf9M1974019740euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760550737;
	bh=6jaEB+5YbVnEIOkSVtaCWc+rluHmQnP0qmqJ49YNg7M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mkEfclLh4qkq9JqiPJ+ikjlMZ3zMtbmENHzIUw4g5zjHDx25Mzf2u0T7bM+9KIfUE
	 3QTAs/+7MqqGAkTcXD6tmA45+GJCKDo5Q8S2OBSaxWDrF0F9RieTLZuXuzzMKraMOU
	 vWpRGgGjmp1SAgFDUOHaO/Vo2F7ezJC49w1UUSI4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251015175216eucas1p1f80c6213d42a5c41b346ae04d0ca3edc~uu5ErUozk2581125811eucas1p1q;
	Wed, 15 Oct 2025 17:52:16 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251015175214eusmtip15861a84e9ecea100785f9d589f38661e~uu5DP5xvd0425704257eusmtip1v;
	Wed, 15 Oct 2025 17:52:14 +0000 (GMT)
Message-ID: <99a41538-ce1a-4130-a093-d0c600e63d16@samsung.com>
Date: Wed, 15 Oct 2025 19:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Elle Rhumsaa
	<elle@weathered-steel.dev>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>
X-CMS-MailID: 20251015175216eucas1p1f80c6213d42a5c41b346ae04d0ca3edc
X-Msg-Generator: CA
X-RootMTR: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
X-EPHeader: CA
X-CMS-RootMailID: 20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d
References: <CGME20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d@eucas1p2.samsung.com>
	<20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
	<ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_105225_565194_F0D0BDF5 
X-CRM114-Status: GOOD (  22.90  )
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

CgpPbiAxMC8xMy8yNSAxODo0OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gbXkgZGlmZiBvbiB0b3Agb2YgeW91ciBjaGFuZ2VzIGxvb2tzIGFzIGZvbGxvd3M6Cj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL0tjb25maWcgYi9kcml2ZXJzL3B3bS9LY29uZmlnCj4g
aW5kZXggZGQ2ZGIwMTgzMmVlLi5lN2Y3NzBlY2ZlODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9w
d20vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvcHdtL0tjb25maWcKPiBAQCAtODEyLDkgKzgxMiw4
IEBAIGNvbmZpZyBQV01fWElMSU5YCj4gIAkgIHdpbGwgYmUgY2FsbGVkIHB3bS14aWxpbnguCj4g
IAo+ICAgY29uZmlnIFJVU1RfUFdNX0FCU1RSQUNUSU9OUwo+IC0JYm9vbCAiUnVzdCBQV00gYWJz
dHJhY3Rpb25zIHN1cHBvcnQiCj4gKwlib29sCj4gIAlkZXBlbmRzIG9uIFJVU1QKPiAtCWRlcGVu
ZHMgb24gUFdNPXkKPiAgCWhlbHAKPiAgCSAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUgc2FmZSBS
dXN0IGFic3RyYWN0aW9uIGxheWVyIGZvciB0aGUgUFdNCj4gIAkgIHN1YnN5c3RlbS4gSXQgcHJv
dmlkZXMgaWRpb21hdGljIHdyYXBwZXJzIGFuZCB0cmFpdHMgbmVjZXNzYXJ5IGZvcgo+IAo+IGku
ZS4gbWFrZSBSVVNUX1BXTV9BQlNUUkFDVElPTlMgaW52aXNpYmxlLCBpdCBpcyBvbmx5IHN1cHBv
c2VkIHRvIGJlCj4gc2VsZWN0ZWQgYW5kIHRoZXJlIGlzIGxpdHRsZSAob3IgZXZlbiBubz8pIHVz
ZSB0byBlbmFibGUgaXQgd2l0aG91dCBhCj4gc2VsZWN0b3IuCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcHdtL3B3bV90aDE1MjAucnMgYi9kcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzCj4gaW5k
ZXggYzlmZDFkOGQxN2JjLi5hNTY2NjA1MmI3Y2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20v
cHdtX3RoMTUyMC5ycwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMKPiBAQCAtMTIx
LDYgKzEyMSw3IEBAIGZuIHJvdW5kX3dhdmVmb3JtX3RvaHcoCj4gICAgICAgICAgd2Y6ICZwd206
OldhdmVmb3JtLAo+ICAgICAgKSAtPiBSZXN1bHQ8cHdtOjpSb3VuZGVkV2F2ZWZvcm08U2VsZjo6
V2ZIdz4+IHsKPiAgICAgICAgICBsZXQgZGF0YSA9IGNoaXAuZHJ2ZGF0YSgpOwo+ICsgICAgICAg
IGxldCBzdGF0dXMgPSAwOwo+ICAKPiAgICAgICAgICBpZiB3Zi5wZXJpb2RfbGVuZ3RoX25zID09
IDAgewo+ICAgICAgICAgICAgICBkZXZfZGJnIShjaGlwLmRldmljZSgpLCAiUmVxdWVzdGVkIHBl
cmlvZCBpcyAwLCBkaXNhYmxpbmcgUFdNLlxuIik7Cj4gQEAgLTE0MSwxOCArMTQyLDEzIEBAIGZu
IHJvdW5kX3dhdmVmb3JtX3RvaHcoCj4gICAgICAgICAgaWYgcGVyaW9kX2N5Y2xlcyA9PSAwIHsK
PiAgICAgICAgICAgICAgZGV2X2RiZyEoCj4gICAgICAgICAgICAgICAgICBjaGlwLmRldmljZSgp
LAo+IC0gICAgICAgICAgICAgICAgIlJlcXVlc3RlZCBwZXJpb2Qge30gbnMgaXMgdG9vIHNtYWxs
IGZvciBjbG9jayByYXRlIHt9IEh6LCBkaXNhYmxpbmcgUFdNLlxuIiwKPiArICAgICAgICAgICAg
ICAgICJSZXF1ZXN0ZWQgcGVyaW9kIHt9IG5zIGlzIHRvbyBzbWFsbCBmb3IgY2xvY2sgcmF0ZSB7
fSBIeiwgcm91bmRpbmcgdXAuXG4iLAo+ICAgICAgICAgICAgICAgICAgd2YucGVyaW9kX2xlbmd0
aF9ucywKPiAgICAgICAgICAgICAgICAgIHJhdGVfaHoKPiAgICAgICAgICAgICAgKTsKPiAgCj4g
LSAgICAgICAgICAgIHJldHVybiBPayhwd206OlJvdW5kZWRXYXZlZm9ybSB7Cj4gLSAgICAgICAg
ICAgICAgICBzdGF0dXM6IDAsCj4gLSAgICAgICAgICAgICAgICBoYXJkd2FyZV93YXZlZm9ybTog
VGgxNTIwV2ZIdyB7Cj4gLSAgICAgICAgICAgICAgICAgICAgZW5hYmxlZDogZmFsc2UsCj4gLSAg
ICAgICAgICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkKPiAtICAgICAgICAgICAgICAg
IH0sCj4gLSAgICAgICAgICAgIH0pOwo+ICsgICAgICAgICAgICBwZXJpb2RfY3ljbGVzID0gMTsK
PiArICAgICAgICAgICAgc3RhdHVzID0gMTsKPiAgICAgICAgICB9Cj4gIAo+ICAgICAgICAgIGxl
dCBtdXQgZHV0eV9jeWNsZXMgPSBuc190b19jeWNsZXMod2YuZHV0eV9sZW5ndGhfbnMsIHJhdGVf
aHopLm1pbih1NjQ6OmZyb20odTMyOjpNQVgpKTsKPiAKPiBpLmUuIHJvdW5kIHVwIGZvciB0b28g
c21hbGwgcGVyaW9kIHJlcXVlc3RzIC4uLgo+IAo+IEBAIC0xODksNyArMTg1LDcgQEAgZm4gcm91
bmRfd2F2ZWZvcm1fdG9odygKPiAgICAgICAgICApOwo+ICAKPiAgICAgICAgICBPayhwd206OlJv
dW5kZWRXYXZlZm9ybSB7Cj4gLSAgICAgICAgICAgIHN0YXR1czogMCwKPiArICAgICAgICAgICAg
c3RhdHVzOiBzdGF0dXMsCj4gICAgICAgICAgICAgIGhhcmR3YXJlX3dhdmVmb3JtOiB3Zmh3LAo+
ICAgICAgICAgIH0pCj4gICAgICB9Cj4gCj4gLi4uIGFuZCByZXR1cm4gMSB0aGVuCj4gCj4gQEAg
LTM1NSw3ICszNTEsNyBAQCBmbiBwcm9iZSgKPiAgICAgICAgICAgICAgICAgICJDbG9jayByYXRl
IHt9IEh6IGlzIHRvbyBoaWdoLCBub3Qgc3VwcG9ydGVkLlxuIiwKPiAgICAgICAgICAgICAgICAg
IHJhdGVfaHoKPiAgICAgICAgICAgICAgKTsKPiAtICAgICAgICAgICAgcmV0dXJuIEVycihFUkFO
R0UpOwo+ICsgICAgICAgICAgICByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gICAgICAgICAgfQo+ICAK
PiAgICAgICAgICBsZXQgY2hpcCA9IHB3bTo6Q2hpcDo6bmV3KAo+IAo+IGF0IGxlYXN0IHB3bS1z
dG0zMiB1c2VzIEVJTlZBTC4gSGF2aW5nIHNhaWQgdGhhdCwgSSB3b25kZXIgaWYgdGhpcyBjaGVj
awo+IGlzIHNlbnNpYmxlIGhlcmUgYXQgYWxsLiBwd20tc3RtMzIgZG9lcyBpdCB0byBlbnN1cmUg
dGhhdAo+IG11bF91NjRfdTY0X2Rpdl91NjQoKSBkb2VzIHRoZSByaWdodCB0aGluZywgYnV0IHRo
aXMgZXhhY3QgaXNzdWUgZG9lc24ndAo+IGV4aXN0IGhlcmUuCgpJIHRoaW5rIHlvdXIgY2hhbmdl
cyBhcmUgY29ycmVjdC4gRm9yIHRoZSBleGlzdGVuY2Ugb2YgY2hlY2sgSSB0aGluayBpdAppcyBo
ZWxwZnVsIGFzIGl0IGZhaWxzIGVhcmx5IHdpdGggYSBoZWxwZnVsIG1lc3NhZ2UsIGJ1dCBpc24n
dCBzdHJpY3RseQpuZWNlc3NhcnkuCgpJIHdpbGwgaW5jb3Jwb3JhdGUgdGhlc2UgY2hhbmdlcyBh
bmQgc2VuZCBhbm90aGVyIHJldmlzaW9uLgoKPiAKPiBPdGhlcndpc2UgbG9va3MgZmluZSBJIHRo
aW5rLgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdp
bGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
