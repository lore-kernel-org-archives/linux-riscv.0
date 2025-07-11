Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED8C83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7d/tAcVtjCHz1voJ8uZWPmKrQXEHqoMp0na05qj3jU=; b=BjdMQxERD5wxAE
	fo+8DE6AFEbQwswNaUmauBqf7W/S3FerXMrICR10DlLCkDt6aHgQhJjxXQ0wyB2L0j+GygPoSwUQq
	QcAxpCGlu8uCWPF7baPyDD6xlKdtwRzqgnB8aA0jhJsfnymgMQPMCG2I4r2S3SoFyXRua0YKpDTG4
	8tD4N5/siX0pRaZ2dq9DyrCSqXrPdE9sRFfr5eft+UpiqWJHto62OBG4LaJoxUv9HesZeJWd18OTA
	iIuyez6oAddfvZS2uI82GCD5BMOJ0mm7utDOZRQ+g5yExjM4E8k/0+7UlTDnqMYFMBvTHuI5QRpkQ
	JfTPVEFSzVpKuTiB2ojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD5S-0000000Elkq-1O2X;
	Fri, 11 Jul 2025 12:42:46 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCzf-0000000ElDC-1ewP
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 12:36:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250711123640euoutp015cacdcf907bebba37e68f9233d80cab3~RMqGwhvpW0438404384euoutp01P
	for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:36:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250711123640euoutp015cacdcf907bebba37e68f9233d80cab3~RMqGwhvpW0438404384euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752237400;
	bh=K0K/KtJbTXHNw0pmcTrwWsLkly4FuPuuoVVC7z5NRQU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=C1irTKJKR6dh7Zyb0hzv5ZIWVDUNbUFWxCqT3Z09Oirx/34YrJ7RKqeNSd3wCC3Ji
	 IJHkR0vLQvRNN+rNzQJgYvbmdLrcjiJiV5ZFOgtOudkwD5LrcsUnataJLfTIPiwJIC
	 vNXQ5zUwT/XPaG02QKWIcb1NAG85KB7+rU74SHTY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711123639eucas1p1941aef7a8b0e49493b430463f97136db~RMqF-42Wd2355023550eucas1p1H;
	Fri, 11 Jul 2025 12:36:39 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250711123637eusmtip2a6e5e3c4f720153c14660001342b34a8~RMqEx1kL50333203332eusmtip2h;
	Fri, 11 Jul 2025 12:36:37 +0000 (GMT)
Message-ID: <020b8036-8959-4733-a5ab-ce8c963ce869@samsung.com>
Date: Fri, 11 Jul 2025 14:36:37 +0200
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
In-Reply-To: <DB8OT5ZZ4SRO.WP5PBFLML683@kernel.org>
X-CMS-MailID: 20250711123639eucas1p1941aef7a8b0e49493b430463f97136db
X-Msg-Generator: CA
X-RootMTR: 20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6
X-EPHeader: CA
X-CMS-RootMailID: 20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com>
	<20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com>
	<e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
	<ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn>
	<e77eab1c-446f-4620-95be-d343684d1e95@samsung.com>
	<4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
	<DB8I5J8ZY7QF.2D8HEN6JX4HSZ@kernel.org>
	<cbxpqormchajfcnf7xxopd7j7igriqus4cuu5jfvxb3mbfb5tu@qz4rc67vjyif>
	<DB8OT5ZZ4SRO.WP5PBFLML683@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_053647_997271_D76C3723 
X-CRM114-Status: GOOD (  30.19  )
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

CgpPbiA3LzEwLzI1IDIzOjE5LCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOgo+IE9uIFRodSBKdWwg
MTAsIDIwMjUgYXQgMTA6NTcgUE0gQ0VTVCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IE9u
IFRodSwgSnVsIDEwLCAyMDI1IGF0IDA2OjA2OjI2UE0gKzAyMDAsIERhbmlsbyBLcnVtbXJpY2gg
d3JvdGU6Cj4+PiBPbiBUaHUgSnVsIDEwLCAyMDI1IGF0IDU6MjUgUE0gQ0VTVCwgVXdlIEtsZWlu
ZS1Lw7ZuaWcgd3JvdGU6Cj4+Pj4gSGVsbG8gTWljaGFsLAo+Pj4+Cj4+Pj4gT24gVGh1LCBKdWwg
MTAsIDIwMjUgYXQgMDM6NDg6MDhQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+
Pj4+IE9uIDcvMTAvMjUgMTU6MTAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gT24g
VGh1LCBKdWwgMTAsIDIwMjUgYXQgMTA6NDI6MDdBTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kg
d3JvdGU6Cj4+Pj4+Pj4gT24gNy83LzI1IDExOjQ4LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToK
Pj4+Pj4+Pj4gVGhlIHNlcmllcyBpcyBzdHJ1Y3R1cmVkIGFzIGZvbGxvd3M6Cj4+Pj4+Pj4+ICAt
IEV4cG9zZSBzdGF0aWMgZnVuY3Rpb24gcHdtY2hpcF9yZWxlYXNlLgo+Pj4+Pj4KPj4+Pj4+IElz
IHRoaXMgcmVhbGx5IG5lY2Vzc2FyeT8gSSBkaWRuJ3QgdHJ5IHRvIHVuZGVyc3RhbmQgdGhlIHJl
cXVpcmVtZW50cwo+Pj4+Pj4geWV0LCBidXQgSSB3b25kZXIgYWJvdXQgdGhhdC4gSWYgeW91IGdl
dCB0aGUgcHdtY2hpcCBmcm9tCj4+Pj4+PiBfX3B3bWNoaXBfYWRkKCkgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvIHRvIHJlbGVhc2UgaXQgaXMgdG8gY2FsbAo+Pj4+Pj4gcHdtY2hpcF9yZW1vdmUoKS4g
RmVlbHMgbGlrZSBhIGxheWVyIHZpb2xhdGlvbi4KPj4+Pj4KPj4+Pj4gSXQncyByZXF1aXJlZCB0
byBwcmV2ZW50IGEgbWVtb3J5IGxlYWsgaW4gYSBzcGVjaWZpYywgY3JpdGljYWwgZmFpbHVyZQo+
Pj4+PiBzY2VuYXJpby4gVGhlIHNlcXVlbmNlIG9mIGV2ZW50cyBpcyBhcyBmb2xsb3dzOgo+Pj4+
Pgo+Pj4+PiAgICAgcHdtOjpDaGlwOjpuZXcoKSBzdWNjZWVkcywgYWxsb2NhdGluZyBib3RoIHRo
ZSBDIHN0cnVjdCBwd21fY2hpcCBhbmQKPj4+Pj4gICAgIHRoZSBSdXN0IGRydmRhdGEuCj4+Pj4+
Cj4+Pj4+ICAgICBwd206OlJlZ2lzdHJhdGlvbjo6cmVnaXN0ZXIoKSAod2hpY2ggY2FsbHMgcHdt
Y2hpcF9hZGQoKSkgZmFpbHMgZm9yCj4+Pj4+ICAgICBzb21lIHJlYXNvbi4KPj4+Pgo+Pj4KPj4+
IChKdXN0IHRyeWluZyB0byBoZWxwIGNsZWFyIHVwIHRoZSBjb25mdXNpb24uKQo+Pgo+PiBWZXJ5
IGFwcHJlY2lhdGVkIQo+Pgo+Pj4+IElmIHlvdSBjYWxsZWQgcHdtY2hpcF9hbGxvYygpIGJ1dCBu
b3QgeWV0IHB3bWNoaXBfYWRkKCksIHRoZSByaWdodAo+Pj4+IGZ1bmN0aW9uIHRvIGNhbGwgZm9y
IGNsZWFudXAgaXMgcHdtY2hpcF9wdXQoKS4KPj4+Cj4+PiBUaGF0IGlzIGV4YWN0bHkgd2hhdCBp
cyBoYXBwZW5pbmcgd2hlbiBBUmVmPENoaXA+IGlzIGRyb3BwZWQuIElmIHRoZSByZWZlcmVuY2UK
Pj4+IGNvdW50IGRyb3BzIHRvIHplcm8sIHB3bWNoaXBfcmVsZWFzZSgpIGlzIGNhbGxlZCwgd2hp
Y2ggZnJlZXMgdGhlIGNoaXAuIEhvd2V2ZXIsCj4+PiB0aGlzIHdvdWxkIGxlYXZlIHRoZSBkcml2
ZXIncyBwcml2YXRlIGRhdGEgYWxsb2NhdGlvbiBiZWhpbmQsIHdoaWNoIGlzIG93bmVkIGJ5Cj4+
PiB0aGUgQ2hpcCBpbnN0YW5jZS4KPj4KPj4gSSBkb24ndCB1bmRlcnN0YW5kIHRoYXQuIFRoZSBj
aGlwIGFuZCB0aGUgZHJpdmVyIHByaXZhdGUgZGF0YSBib3RoIGFyZQo+PiBsb2NhdGVkIGluIHRo
ZSBzYW1lIGFsbG9jYXRpb24uIEhvdyBpcyB0aGlzIGEgcHJvYmxlbSBvZiB0aGUgZHJpdmVyCj4+
IHByaXZhdGUgZGF0YSBvbmx5IHRoZW4/IFRoZSBrZnJlZSgpIGluIHB3bWNoaXBfcmVsZWFzZSgp
IGlzIGdvb2QgZW5vdWdoCj4+IGZvciBib3RoPyEKPiAKPiBOb3QgaW4gdGhlIGN1cnJlbnQgYWJz
dHJhY3Rpb25zLCB0aGVyZSBhcmUgdHdvIGFsbG9jYXRpb25zLCBvbmUgZm9yIHRoZSBDaGlwIGFu
ZAo+IG9uZSBmb3IgdGhlIGRyaXZlcidzIHByaXZhdGUgZGF0YSwgb3IgaW4gb3RoZXIgd29yZHMg
dGhlIGFic3RyYWN0aW9uIHVzZXMKPiBwd21jaGlwX3NldF9kcnZkYXRhKCkgYW5kIHB3bWNoaXBf
Z2V0X2RydmRhdGEoKS4KPiAKPiBIYXZpbmcgYSBicmllZiBsb29rIGF0IHB3bWNoaXBfYWxsb2Mo
KSwgaXQgc2VlbXMgdG8gbWUgdGhhdCBQV00gc3VwcG9ydHMgdGhlCj4gc3ViY2xhc3NpbmcgcGF0
dGVybiB3aXRoIHB3bWNoaXBfcHJpdigpLgo+IAo+IFdlIHNob3VsZCBwcm9iYWJseSB0YWtlIGFk
dmFudGFnZSBvZiB0aGF0LiBBc3N1bWluZyB3ZSBkbyB0aGF0LCB0aGUgUnVzdAo+IGFic3RyYWN0
aW9uIHN0aWxsIG5lZWRzIGEgcmVsZWFzZSgpIGNhbGxiYWNrIGJlY2F1c2Ugd2Ugc3RpbGwgbmVl
ZCB0byBjYWxsCj4gZHJvcF9pbl9wbGFjZSgpIGluIG9yZGVyIHRvIGdldCB0aGUgZGVzdHJ1Y3Rv
ciBvZiB0aGUgZHJpdmVyJ3MgcHJpdmF0ZSBkYXRhCj4gdHlwZSBjYWxsZWQuIFdlIGFjdHVhbGx5
IG1pc3NlZCB0aGlzIGluIERSTSBhbmQgSSBmaXhlZCBpdCB1cCByZWNlbnRseSBbMV0uCj4gCj4g
QE1pY2hhbDogV2l0aCB0aGUgc3ViY2xhc3NpbmcgcGF0dGVybiB0aGUgQ2hpcCBzdHJ1Y3R1cmUg
d291bGQgbG9vayBsaWtlIHRoaXM6Cj4gCj4gCSNbcmVwcihDKV0KPiAJI1twaW5fZGF0YV0KPiAJ
cHViIHN0cnVjdCBDaGlwPFQ+IHsKPiAJICAgaW5uZXI6IE9wYXF1ZTxiaW5kaW5nczo6cHdtX2No
aXA+LAo+IAkgICAjW3Bpbl0KPiAJICAgZGF0YTogVCwKPiAJfQp9CgpIZWxsbwoKVGhhbmsgeW91
IGJvdGggZm9yIHRoZSBkZXRhaWxlZCBmZWVkYmFjayBhbmQgc3VnZ2VzdGlvbnMuCgpEYW5pbG8s
IHlvdSBhcmUgcmlnaHQsIHdlIHNob3VsZCBhYnNvbHV0ZWx5IHVzZSB0aGUgc3ViY2xhc3Npbmcg
cGF0dGVybgp0byBoYXZlIGEgc2luZ2xlIGFsbG9jYXRpb24gZm9yIHRoZSBjaGlwIGFuZCBkcml2
ZXIgZGF0YS4gVGhpcyBpcyBhIG11Y2gKY2xlYW5lciBkZXNpZ24uCgpBcyBJIGxvb2tlZCBpbnRv
IHRoaXMsIHRoZSBtYWluIGRpZmZlcmVuY2UgaXMgdGhhdCB0aGUgQyBzdHJ1Y3QgcHdtX2NoaXAK
ZG9lc24ndCBoYXZlIGEgZml4ZWQgc2l6ZSBiZWNhdXNlIG9mIHRoZSBwd21zW10gYXJyYXkgYXQg
dGhlIGVuZC4gVGhpcwpwcmV2ZW50cyB1cyBmcm9tIHVzaW5nIHRoZSBleGFjdCBzdHJ1Y3QgbGF5
b3V0IHlvdSBzdWdnZXN0ZWQuCgpwdWIgcHdtczogX19JbmNvbXBsZXRlQXJyYXlGaWVsZDxwd21f
ZGV2aWNlPiwKClRoZXJlZm9yZSwgdG8gY29ycmVjdGx5IGltcGxlbWVudCB0aGUgc3ViY2xhc3Np
bmcgcGF0dGVybiwgaXQgd291bGQgYmUKc3VmZmljaWVudCB0byBsZWF2ZSB0aGUgY3VycmVudCBz
dHJ1Y3QgYXMgaXMgYW5kIHVzZSBwd21jaGlwX2dldF9kcnZkYXRhIHRvCmFjcXVpcmUgcG9pbnRl
cnMgdG8gdGhlIGFsbG9jYXRlZCBkcnZkYXRhLgoKcHViIHN0cnVjdCBDaGlwPFQ6IFB3bU9wcz4o
T3BhcXVlPGJpbmRpbmdzOjpwd21fY2hpcD4sIFBoYW50b21EYXRhPFQ+KTsKClRoaXMgd2lsbCBz
dGlsbCBhY2hpZXZlIHRoZSBnb2FsIG9mIGEgc2luZ2xlIGFsbG9jYXRpb24gdmlhCnB3bWNoaXBf
YWxsb2MncyBzaXplb2ZfcHJpdiBhcmd1bWVudCwgd2hpbGUgd29ya2luZyBhcm91bmQgdGhlIERT
VApsaW1pdGF0aW9uLgoKPiAKPiBBbmQgaW4gdGhlIHJlbGVhc2UoKSBjYWxsYmFjayB3b3VsZCBs
b29rIGxpa2UgdGhpczoKPiAKPiAgICAgZXh0ZXJuICJDIiBmbiByZWxlYXNlKHB0cjogKm11dCBi
aW5kaW5nczo6cHdtX2NoaXApIHsKPiAgICAgICAgIC8vIENBU1Q6IENhc3RpbmcgYHB0cmAgdG8g
YENoaXA8VD5gIGlzIHZhbGlkLCBzaW5jZSBbLi4uXS4KPiAgICAgICAgIGxldCB0aGlzID0gcHRy
LmNhc3Q8Q2hpcDxUPj4oKTsKCkkgdGhpbmsgdGhpcyB3b3VsZCB1c2UgcHdtY2hpcF9nZXRfZHJ2
ZGF0YSBpbnN0ZWFkLgoKPiAKPiAgICAgICAgIC8vIFNBRkVUWToKPiAgICAgICAgIC8vIC0gV2hl
biBgcmVsZWFzZWAgcnVucyBpdCBpcyBndWFyYW50ZWVkIHRoYXQgdGhlcmUgaXMgbm8gZnVydGhl
ciBhY2Nlc3MgdG8gYHRoaXNgLgo+ICAgICAgICAgLy8gLSBgdGhpc2AgaXMgdmFsaWQgZm9yIGRy
b3BwaW5nLgo+ICAgICAgICAgdW5zYWZlIHsgY29yZTo6cHRyOjpkcm9wX2luX3BsYWNlKHRoaXMp
IH07Cj4gICAgIH0KPiAKPiBUaGlzIGlzIGV4YWN0bHkgd2hhdCB3ZSdyZSBkb2luZyBpbiBEUk0g
YXMgd2VsbCwgSSB3b3VsZCBoYXZlIHJlY29tbWVuZGVkIHRoaXMKPiB0byBiZWdpbiB3aXRoLCBi
dXQgSSBkaWRuJ3QgcmVjb2duaXplIHRoYXQgUFdNIHN1cHBvcnRzIHN1YmNsYXNzaW5nLiA6KQo+
IAo+IEkgcmVjb21tZW5kIGhhdmluZyBhIGxvb2sgYXQgWzJdLgo+IAo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MjkxNTM3NDcuNzI1MzYtMS1kYWtyQGtlcm5lbC5vcmcv
Cj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwvLS9i
bG9iL2RybS1taXNjLWZpeGVzL3J1c3Qva2VybmVsL2RybS9kZXZpY2UucnMKPiAKCkJlc3QgcmVn
YXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
