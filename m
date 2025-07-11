Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941AAC83F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUtw76DAUVwtWb/HU5DaIsuZgnb96dnOBpreH21vyRk=; b=axwHDM8Ziz/QLn
	7zHh5GvqtaVeuwWj0RHPImXG2htIn33oos0OY4/VeWohGoHfGFANLA/Rx0NLBbadpXAXrMQzI13rb
	3KtDbDpRONRkY/S/wFEyOUaUEptN90Iu2kEmnvLzFaC1m0O1kp1rmXlK+ItmJOyRbSn4AxSm3zoGc
	VwgnJI/Os+XXCIHzYdr1DTROo1BN3L4shLcCHcEnqxXzGUwztYMPp2at/Sa1TAH7+sChmYyn839jg
	mx9OSbo3ZZ9TVT/28fWYKrkd1Tq8KTl2BXkiHFYHBqOPC6gjdMvhtVyoZ3WZKd0w5vedpoNvCLIVS
	BFKJO4/Ru6u1AMN4zW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG4J-0000000FCbT-3vZr;
	Fri, 11 Jul 2025 15:53:47 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFX5-0000000F8Wd-36tK
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 15:19:30 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250711151922euoutp01f1683d859feefa47d8c47ff16e7b32bc~RO4LAHzG22848828488euoutp01M
	for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 15:19:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250711151922euoutp01f1683d859feefa47d8c47ff16e7b32bc~RO4LAHzG22848828488euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752247162;
	bh=fcewOa5OLVmZ08COtX/6ELxglwPgWvCAwEjTgpYJRbc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=X7shbcxoHz4/uuqF31DM3XkNqucBXTZUladGlprSDimOpHNXkHJJ3JjmjhCu+/fFb
	 wmMNyvRmvQNaPuS9ZhG1VC2An5K1xFx+I+4LV6xE6UvvQ8pWIFb8F+z2W+2Sh4Icz9
	 lVSSRl43P5tpHNLREEzpRtG1cSMv7z/r1YS4Hah8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711151922eucas1p14c32b8004eb7275d4af8efe31dd9c678~RO4Kgc8GB1992419924eucas1p1J;
	Fri, 11 Jul 2025 15:19:22 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711151921eusmtip1884570ece80ba5dfe41229c79334008b~RO4JY_dRl2903329033eusmtip1f;
	Fri, 11 Jul 2025 15:19:21 +0000 (GMT)
Message-ID: <8acb5b54-c01b-4427-9ada-596897b96a10@samsung.com>
Date: Fri, 11 Jul 2025 17:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
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
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof
	Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <i5ee2u45kmcb2su743th744ofnmk4lkfq44iqvfwdjwscv3bz7@pjakppae22na>
X-CMS-MailID: 20250711151922eucas1p14c32b8004eb7275d4af8efe31dd9c678
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
	<ad17dc8a-80b7-4344-a1be-6cf780567aaa@samsung.com>
	<i5ee2u45kmcb2su743th744ofnmk4lkfq44iqvfwdjwscv3bz7@pjakppae22na>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_081929_143590_CB669F0E 
X-CRM114-Status: GOOD (  31.42  )
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

CgpPbiA3LzEwLzI1IDIyOjM5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAwNjo1ODo0MVBNICswMjAwLCBNaWNoYWwgV2lsY3p5
bnNraSB3cm90ZToKPj4gT24gNy8xMC8yNSAxNzoyNSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6
Cj4+PiBPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAwMzo0ODowOFBNICswMjAwLCBNaWNoYWwgV2ls
Y3p5bnNraSB3cm90ZToKPj4+PiBPbiA3LzEwLzI1IDE1OjEwLCBVd2UgS2xlaW5lLUvDtm5pZyB3
cm90ZToKPj4+Pj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTA6NDI6MDdBTSArMDIwMCwgTWlj
aGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+Pj4+PiBPbiA3LzcvMjUgMTE6NDgsIE1pY2hhbCBXaWxj
enluc2tpIHdyb3RlOgo+Pj4+Pj4+IFRoZSBzZXJpZXMgaXMgc3RydWN0dXJlZCBhcyBmb2xsb3dz
Ogo+Pj4+Pj4+ICAtIEV4cG9zZSBzdGF0aWMgZnVuY3Rpb24gcHdtY2hpcF9yZWxlYXNlLgo+Pj4+
Pgo+Pj4+PiBJcyB0aGlzIHJlYWxseSBuZWNlc3Nhcnk/IEkgZGlkbid0IHRyeSB0byB1bmRlcnN0
YW5kIHRoZSByZXF1aXJlbWVudHMKPj4+Pj4geWV0LCBidXQgSSB3b25kZXIgYWJvdXQgdGhhdC4g
SWYgeW91IGdldCB0aGUgcHdtY2hpcCBmcm9tCj4+Pj4+IF9fcHdtY2hpcF9hZGQoKSB0aGUgcmln
aHQgdGhpbmcgdG8gZG8gdG8gcmVsZWFzZSBpdCBpcyB0byBjYWxsCj4+Pj4+IHB3bWNoaXBfcmVt
b3ZlKCkuIEZlZWxzIGxpa2UgYSBsYXllciB2aW9sYXRpb24uCj4+Pj4KPj4+PiBJdCdzIHJlcXVp
cmVkIHRvIHByZXZlbnQgYSBtZW1vcnkgbGVhayBpbiBhIHNwZWNpZmljLCBjcml0aWNhbCBmYWls
dXJlCj4+Pj4gc2NlbmFyaW8uIFRoZSBzZXF1ZW5jZSBvZiBldmVudHMgaXMgYXMgZm9sbG93czoK
Pj4+Pgo+Pj4+ICAgICBwd206OkNoaXA6Om5ldygpIHN1Y2NlZWRzLCBhbGxvY2F0aW5nIGJvdGgg
dGhlIEMgc3RydWN0IHB3bV9jaGlwIGFuZAo+Pj4+ICAgICB0aGUgUnVzdCBkcnZkYXRhLgo+Pj4+
Cj4+Pj4gICAgIHB3bTo6UmVnaXN0cmF0aW9uOjpyZWdpc3RlcigpICh3aGljaCBjYWxscyBwd21j
aGlwX2FkZCgpKSBmYWlscyBmb3IKPj4+PiAgICAgc29tZSByZWFzb24uCj4+Pgo+Pj4gSWYgeW91
IGNhbGxlZCBwd21jaGlwX2FsbG9jKCkgYnV0IG5vdCB5ZXQgcHdtY2hpcF9hZGQoKSwgdGhlIHJp
Z2h0Cj4+PiBmdW5jdGlvbiB0byBjYWxsIGZvciBjbGVhbnVwIGlzIHB3bWNoaXBfcHV0KCkuCj4+
Pgo+Pj4+ICAgICBUaGUgQVJlZjxDaGlwPiByZXR1cm5lZCBieSBuZXcoKSBpcyBkcm9wcGVkLCBp
dHMgcmVmZXJlbmNlIGNvdW50Cj4+Pj4gICAgIGdvZXMgdG8gemVybywgYW5kIG91ciBjdXN0b20g
cmVsZWFzZV9jYWxsYmFjayBpcyBjYWxsZWQuCj4+Pj4KPj4+PiBbLi4uXQo+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+IGJhc2UtY29tbWl0OiA0Nzc1M2I1YTE2OTYyODM5MzBhNzhhYWU3OWIyOTM3MWY5NmY1
YmNhCj4+Pj4+Cj4+Pj4+IEkgaGF2ZSBwcm9ibGVtcyBhcHBseWluZyB0aGlzIHNlcmllcyBhbmQg
ZG9uJ3QgaGF2ZSB0aGlzIGJhc2UgY29tbWl0IGluCj4+Pj4+IG15IHJlcG8uCj4+Pj4KPj4+PiBT
b3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gQmFzZSBjb21taXQgZG9lc24ndCBleGlzdCBpbiB0aGUg
bWFpbmxpbmUKPj4+PiBrZXJuZWwgb3IgbGludXgtbmV4dCwgY2F1c2UgSSd2ZSBhZGRlZCBzb21l
IGRlcGVuZGVjaWVzIGZvciBjb21waWxhdGlvbiwKPj4+PiBsaWtlIElvTWVtIGZvciB0aGUgZHJp
dmVyICh1cGxvYWRlZCBmdWxsIGJyYW5jaCBvbiBnaXRodWIgWzFdKS4gVGhlCj4+Pj4gYmluZGlu
Z3MgaG93ZXZlciBkb2Vzbid0IGRlcGVuZCBvbiBhbnl0aGluZyB0aGF0J3Mgbm90IGluIGxpbnV4
LW5leHQuCj4+Pgo+Pj4gVGhlIHNlcmllcyBkaWRuJ3QgYXBwbHkgdG8gbXkgcHdtL2Zvci1uZXh0
IGJyYW5jaC4KPj4+Cj4+PiBOb3RlIHRoYXQgdGhlIGJhc2UtY29tbWl0IHNob3VsZCBhbHdheXMg
YmUgYSBwdWJsaWNhbGx5IGtub3duIGNvbW1pdC4KPj4+IFNlZSB0aGUgY2hhcHRlciBhYm91dCAi
QmFzZSBUcmVlIEluZm9ybWF0aW9uIiBpbiBnaXQtZm9ybWF0LXBhdGNoKDEpLgo+Pgo+PiBIZWxs
byBVd2UsCj4+Cj4+IE9rYXksIHRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkgdW5k
ZXJzdGFuZCB0aGUgcmVxdWlyZW1lbnQgZm9yCj4+IGEgcHVibGljIGJhc2UgY29tbWl0Lgo+Pgo+
PiBNeSBpbnRlbnRpb24gd2FzIHRvIGluY2x1ZGUgdGhlIFRIMTUyMCBkcml2ZXIgcHJpbWFyaWx5
IGFzIGEgcHJhY3RpY2FsCj4+IGRlbW9uc3RyYXRpb24gb2YgdGhlIG5ldyBhYnN0cmFjdGlvbnMu
IEhvd2V2ZXIgdGhlIGRyaXZlciBjYW4ndCBiZQo+PiBtZXJnZWQgYXMgaXMsIHNpbmNlIGl0IGRl
cGVuZHMgb24gdGhlIHVubWVyZ2VkIElvTWVtIHNlcmllcyBhbmQgd29uJ3QKPj4gY29tcGlsZSBh
Z2FpbnN0IGEgcHVibGljIGNvbW1pdC4KPj4KPj4gSSB3aWxsIHJlYmFzZSB0aGUgc2VyaWVzIG9u
IHB3bS9mb3ItbmV4dCBhbmQgZHJvcCB0aGUgZHJpdmVyIGFuZCBpdHMKPj4gYXNzb2NpYXRlZCBk
ZXZpY2UgdHJlZSBwYXRjaGVzIGZvciBub3cuIEknbGwgc2VuZCBhIG5ldyB2ZXJzaW9uCj4+IGNv
bnRhaW5pbmcganVzdCB0aGUgY29yZSBQV00gYWJzdHJhY3Rpb24gcGF0Y2hlcywgd2hpY2ggYXBw
bHkgY2xlYW5seS4KPj4KPj4gSSB3aWxsIHJlc3VibWl0IHRoZSBkcml2ZXIgcGF0Y2hlcyBvbmNl
IHRoZWlyIGRlcGVuZGVuY2llcyBhcmUgYXZhaWxhYmxlCj4+IGluIGEgcHVibGljIHRyZWUuCj4g
Cj4gSWYgeW91IGJhc2UgeW91ciB0cmVlIG9uIChzYXkpIHY2LjE2LXJjMSwgdGhlbiBhZGQgc29t
ZSBSdXN0Cj4gZGVwZW5kZW5jaWVzIHVwIHRvIDQ3NzUzYjVhMTY5NjI4MzkzMGE3OGFhZTc5YjI5
MzcxZjk2ZjViY2EgYW5kIHRoZW4gYWRkCj4geW91ciBzZXJpZXMsIHlvdSBqdXN0IGRvOgo+IAo+
IAlnaXQgZm9ybWF0LXBhdGNoIC0tYmFzZSB2Ni4xNi1yYzEgNDc3NTNiNWExNjk2MjgzOTMwYTc4
YWFlNzliMjkzNzFmOTZmNWJjYS4uCj4gCj4gLiBUaGlzIHJlc3VsdHMgaW4gYSBiYXNlLWNvbW1p
dCBsaW5lIHRoYXQgSSAoYW5kIG1heWJlIGFsc28gYnVpbGQgYm90cykKPiBjYW4gdXNlIGFuZCBh
IGJ1bmNoIG9mIGZ1cnRoZXIgbGluZXMgbGlzdGluZyB0aGUgY29tbWl0cyBiZXR3ZWVuCj4gdjYu
MTYtcmMxIGFuZCA0Nzc1M2I1YTE2OTYyODM5MzBhNzhhYWU3OWIyOTM3MWY5NmY1YmNhIHRoYXQg
bWlnaHQgYmUKPiBmaW5kYWJsZSBvbiBsb3JlLmsuby4KCkhpIFV3ZSwKClRoYW5rIHlvdSB2ZXJ5
IG11Y2ggZm9yIHRoZSBkZXRhaWxlZCBhZHZpY2Ugb24gdXNpbmcgZ2l0IGZvcm1hdC1wYXRjaAot
LWJhc2UuIEkgYXBwcmVjaWF0ZSB5b3UgdGFraW5nIHRoZSB0aW1lIHRvIGV4cGxhaW4gdGhlIHdv
cmtmbG93LgoKSSBpbnZlc3RpZ2F0ZWQgdGhpcyBhcHByb2FjaCwgYW5kIHRoZSBkaWZmaWN1bHR5
IGlzIHRoYXQgdGhlIElvTWVtCnNlcmllcyBbMV0sIHdoaWNoIG15IGRyaXZlciBkZXBlbmRzIG9u
LCBpcyBpdHNlbGYgYmFzZWQgb24gYW4KaW50ZWdyYXRpb24gdHJlZSByYXRoZXIgdGhhbiBhIGNs
ZWFuIHB1YmxpYyB0YWcuCgpUaGlzIG1lYW5zIHRoYXQgdG8gY3JlYXRlIGEgc2VyaWVzIGJhc2Vk
IG9uIHY2LjE2LXJjMSwgSSB3b3VsZCBoYXZlIHRvCmluY2x1ZGUgYSB2ZXJ5IGxhcmdlIG51bWJl
ciBvZiBpbnRlcm1lZGlhdGUgY29tbWl0cyBmcm9tIGxpbnV4LW5leHQsCndoaWNoLCB3b3VsZCBu
b3QgYmUgaGVscGZ1bCBmb3IgcmV2aWV3LgoKVGhlcmVmb3JlLCBJIGJlbGlldmUgdGhhdCBkcm9w
cGluZyB0aGUgZHJpdmVyIGFuZCBpdHMgZGV2aWNlIHRyZWUKcGF0Y2hlcyBmb3Igbm93IGlzIHRo
ZSBiZXN0IHBhdGggZm9yd2FyZC4gVGhpcyB3aWxsIHJlc3VsdCBpbiBhIG11Y2gKc21hbGxlciwg
c2VsZiBjb250YWluZWQgc2VyaWVzIGZvciB0aGUgY29yZSBQV00gYWJzdHJhY3Rpb25zIHRoYXQK
YXBwbGllcyBjbGVhbmx5IHRvIHlvdXIgcHdtL2Zvci1uZXh0IGJyYW5jaC4KCgpbMV0gLSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8yMDI1MDcwNC10b3BpY3MtdHlyLXBs
YXRmb3JtX2lvbWVtLXYxMi0wLTFkM2Q0YmQ4MjA3ZEBjb2xsYWJvcmEuY29tLwo+IAo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQoKQmVzdCByZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2ls
Y3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
