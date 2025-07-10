Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E1AC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8+0wJsR8sm76I7kQ/A4vHNUhG0HqB1/QOOvTX2C9NM=; b=kQC4BqxPBz/kH6
	At/8YXq0zWlrkH2ZDzH0UItgJQmlVkh67uR0pVKFuC36xoXZIg+8g0Z33pbgjY7zj3NIt0O5YZNL+
	ReSAidc4fPCRCpv7RNuSz2LIaPA/LqhUfA/O6Pv0p0qeQXux5H+8YE68PZh5CbeeKwp/IZD75hrOQ
	ONbhaCTeduNTSLR02DJlVK583nHEQQTuu+zG0YkQxyvEVftbFUFtZzepiDRnK5L7DiL8cddTthiDP
	kRl7v/JmgS23ZjNTM8gUn5Nk1Fr7mSDNvmK8rGWwYDNvi8TrjKn/mQpX6LX/XNfM3do44A1S2PBUZ
	mW586/LRdNTKeMAYT5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx0Y-0000000CoyW-3q2g;
	Thu, 10 Jul 2025 19:32:38 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZubh-0000000CWCV-1jYP
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 16:58:53 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250710165843euoutp02f168ece871abacec87d01f5b7688c706~Q8lobauuF1945619456euoutp024
	for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 16:58:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250710165843euoutp02f168ece871abacec87d01f5b7688c706~Q8lobauuF1945619456euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752166723;
	bh=ZgLkHoYpMZXGlyM12JkaB3eUvSr6n7CdDmsdbr4Effk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=N+iQ/IgKJDR12WkLkSHfzHnREv0EVSZqpC/v+RNieKTsC8JifH8dnuKu2sW+z6FjV
	 OwUEFYe1Ay6A/lvzDK1ycZJdVXnFfxGk9K2gSLNhFZYzkZXoBhI7thHgygQCg6n5Ki
	 GIc/Si12W4H0WBZcklPpbKg+MTIOitNRPdoVQKuc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710165843eucas1p228bef8c7cfef0151b9f27161df285873~Q8ln10Tqr0901609016eucas1p2H;
	Thu, 10 Jul 2025 16:58:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250710165842eusmtip2966419c222cc783df17946c63fd3c343~Q8lmxbv6y2112221122eusmtip29;
	Thu, 10 Jul 2025 16:58:42 +0000 (GMT)
Message-ID: <ad17dc8a-80b7-4344-a1be-6cf780567aaa@samsung.com>
Date: Thu, 10 Jul 2025 18:58:41 +0200
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
In-Reply-To: <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63>
X-CMS-MailID: 20250710165843eucas1p228bef8c7cfef0151b9f27161df285873
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_095850_039118_0EE409DC 
X-CRM114-Status: GOOD (  25.27  )
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

CgpPbiA3LzEwLzI1IDE3OjI1LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWwsCj4gCj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMDM6NDg6MDhQTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IE9uIDcvMTAvMjUgMTU6MTAsIFV3ZSBLbGVpbmUtS8O2bmln
IHdyb3RlOgo+Pj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMTA6NDI6MDdBTSArMDIwMCwgTWlj
aGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+Pj4gT24gNy83LzI1IDExOjQ4LCBNaWNoYWwgV2lsY3p5
bnNraSB3cm90ZToKPj4+Pj4gVGhlIHNlcmllcyBpcyBzdHJ1Y3R1cmVkIGFzIGZvbGxvd3M6Cj4+
Pj4+ICAtIEV4cG9zZSBzdGF0aWMgZnVuY3Rpb24gcHdtY2hpcF9yZWxlYXNlLgo+Pj4KPj4+IElz
IHRoaXMgcmVhbGx5IG5lY2Vzc2FyeT8gSSBkaWRuJ3QgdHJ5IHRvIHVuZGVyc3RhbmQgdGhlIHJl
cXVpcmVtZW50cwo+Pj4geWV0LCBidXQgSSB3b25kZXIgYWJvdXQgdGhhdC4gSWYgeW91IGdldCB0
aGUgcHdtY2hpcCBmcm9tCj4+PiBfX3B3bWNoaXBfYWRkKCkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRv
IHRvIHJlbGVhc2UgaXQgaXMgdG8gY2FsbAo+Pj4gcHdtY2hpcF9yZW1vdmUoKS4gRmVlbHMgbGlr
ZSBhIGxheWVyIHZpb2xhdGlvbi4KPj4KPj4gSXQncyByZXF1aXJlZCB0byBwcmV2ZW50IGEgbWVt
b3J5IGxlYWsgaW4gYSBzcGVjaWZpYywgY3JpdGljYWwgZmFpbHVyZQo+PiBzY2VuYXJpby4gVGhl
IHNlcXVlbmNlIG9mIGV2ZW50cyBpcyBhcyBmb2xsb3dzOgo+Pgo+PiAgICAgcHdtOjpDaGlwOjpu
ZXcoKSBzdWNjZWVkcywgYWxsb2NhdGluZyBib3RoIHRoZSBDIHN0cnVjdCBwd21fY2hpcCBhbmQK
Pj4gICAgIHRoZSBSdXN0IGRydmRhdGEuCj4+Cj4+ICAgICBwd206OlJlZ2lzdHJhdGlvbjo6cmVn
aXN0ZXIoKSAod2hpY2ggY2FsbHMgcHdtY2hpcF9hZGQoKSkgZmFpbHMgZm9yCj4+ICAgICBzb21l
IHJlYXNvbi4KPiAKPiBJZiB5b3UgY2FsbGVkIHB3bWNoaXBfYWxsb2MoKSBidXQgbm90IHlldCBw
d21jaGlwX2FkZCgpLCB0aGUgcmlnaHQKPiBmdW5jdGlvbiB0byBjYWxsIGZvciBjbGVhbnVwIGlz
IHB3bWNoaXBfcHV0KCkuCj4gCj4+ICAgICBUaGUgQVJlZjxDaGlwPiByZXR1cm5lZCBieSBuZXco
KSBpcyBkcm9wcGVkLCBpdHMgcmVmZXJlbmNlIGNvdW50Cj4+ICAgICBnb2VzIHRvIHplcm8sIGFu
ZCBvdXIgY3VzdG9tIHJlbGVhc2VfY2FsbGJhY2sgaXMgY2FsbGVkLgo+Pgo+PiBbLi4uXQo+Pj4+
PiAtLS0KPj4+Pj4gYmFzZS1jb21taXQ6IDQ3NzUzYjVhMTY5NjI4MzkzMGE3OGFhZTc5YjI5Mzcx
Zjk2ZjViY2EKPj4+Cj4+PiBJIGhhdmUgcHJvYmxlbXMgYXBwbHlpbmcgdGhpcyBzZXJpZXMgYW5k
IGRvbid0IGhhdmUgdGhpcyBiYXNlIGNvbW1pdCBpbgo+Pj4gbXkgcmVwby4KPj4KPj4gU29ycnkg
Zm9yIHRoZSBjb25mdXNpb24uIEJhc2UgY29tbWl0IGRvZXNuJ3QgZXhpc3QgaW4gdGhlIG1haW5s
aW5lCj4+IGtlcm5lbCBvciBsaW51eC1uZXh0LCBjYXVzZSBJJ3ZlIGFkZGVkIHNvbWUgZGVwZW5k
ZWNpZXMgZm9yIGNvbXBpbGF0aW9uLAo+PiBsaWtlIElvTWVtIGZvciB0aGUgZHJpdmVyICh1cGxv
YWRlZCBmdWxsIGJyYW5jaCBvbiBnaXRodWIgWzFdKS4gVGhlCj4+IGJpbmRpbmdzIGhvd2V2ZXIg
ZG9lc24ndCBkZXBlbmQgb24gYW55dGhpbmcgdGhhdCdzIG5vdCBpbiBsaW51eC1uZXh0Lgo+IAo+
IFRoZSBzZXJpZXMgZGlkbid0IGFwcGx5IHRvIG15IHB3bS9mb3ItbmV4dCBicmFuY2guCj4gCj4g
Tm90ZSB0aGF0IHRoZSBiYXNlLWNvbW1pdCBzaG91bGQgYWx3YXlzIGJlIGEgcHVibGljYWxseSBr
bm93biBjb21taXQuCj4gU2VlIHRoZSBjaGFwdGVyIGFib3V0ICJCYXNlIFRyZWUgSW5mb3JtYXRp
b24iIGluIGdpdC1mb3JtYXQtcGF0Y2goMSkuCgpIZWxsbyBVd2UsCgpPa2F5LCB0aGFuayB5b3Ug
Zm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBJIHVuZGVyc3RhbmQgdGhlIHJlcXVpcmVtZW50IGZvcgph
IHB1YmxpYyBiYXNlIGNvbW1pdC4KCk15IGludGVudGlvbiB3YXMgdG8gaW5jbHVkZSB0aGUgVEgx
NTIwIGRyaXZlciBwcmltYXJpbHkgYXMgYSBwcmFjdGljYWwKZGVtb25zdHJhdGlvbiBvZiB0aGUg
bmV3IGFic3RyYWN0aW9ucy4gSG93ZXZlciB0aGUgZHJpdmVyIGNhbid0IGJlCm1lcmdlZCBhcyBp
cywgc2luY2UgaXQgZGVwZW5kcyBvbiB0aGUgdW5tZXJnZWQgSW9NZW0gc2VyaWVzIGFuZCB3b24n
dApjb21waWxlIGFnYWluc3QgYSBwdWJsaWMgY29tbWl0LgoKSSB3aWxsIHJlYmFzZSB0aGUgc2Vy
aWVzIG9uIHB3bS9mb3ItbmV4dCBhbmQgZHJvcCB0aGUgZHJpdmVyIGFuZCBpdHMKYXNzb2NpYXRl
ZCBkZXZpY2UgdHJlZSBwYXRjaGVzIGZvciBub3cuIEknbGwgc2VuZCBhIG5ldyB2ZXJzaW9uCmNv
bnRhaW5pbmcganVzdCB0aGUgY29yZSBQV00gYWJzdHJhY3Rpb24gcGF0Y2hlcywgd2hpY2ggYXBw
bHkgY2xlYW5seS4KCkkgd2lsbCByZXN1Ym1pdCB0aGUgZHJpdmVyIHBhdGNoZXMgb25jZSB0aGVp
ciBkZXBlbmRlbmNpZXMgYXJlIGF2YWlsYWJsZQppbiBhIHB1YmxpYyB0cmVlLgoKPiAKPiBCZXN0
IHJlZ2FyZHMKPiBVd2UKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndp
bGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
