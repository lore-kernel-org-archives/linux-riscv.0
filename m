Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AAEE7B61B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZH1NcmwqSJc4v3RUmAkYOVpxsYSe5CQ60uZvNt4FqY=; b=VGGUUIaLk15EQXQHH5T2iFmrXL
	+QIm61bWIMJk6+oiSxvAyrpI5CdGSkhJfRjH0ZZ9qXL0/D8M3r1SCNhShJ/a+BGHshztRSdISVWE5
	tnVIA5ldStRRqA8y4QJ+QKfZkxGiAPF7HVfHcBpKWqg5oBUujchjt7UF5vPef96hSHamBxo5SBLZR
	MVe7Ir7O2v/a7OLhxo5jAvS1ifgab+xZPxubjcE+MDZNiAfsIrU/ZxUXq8j4cFCdwzBtTYWRe5iRJ
	6oYQp4HAJo0wlIab4L6xsvtBh8W5QoXZGwtryFJUlYzQ+SpImjoOdAzZ78LfGZy9MF7SedAK7n5+0
	Hj/t1AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2GS-0009tl-1z;
	Wed, 04 Oct 2023 13:50:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2GP-0009sx-23
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:50:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2008CDA7;
	Wed,  4 Oct 2023 06:50:45 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 591733F59C;
	Wed,  4 Oct 2023 06:50:03 -0700 (PDT)
Message-ID: <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
Date: Wed, 4 Oct 2023 14:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Content-Language: en-GB
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
 <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_065009_766358_8F13F2C4 
X-CRM114-Status: GOOD (  24.74  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Drew Fustini <dfustini@baylibre.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Han Gao <gaohan@iscas.ac.cn>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, Robert Nelson <robertcnelson@gmail.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQvMTAvMjAyMyAyOjAyIHBtLCBMYWQsIFByYWJoYWthciB3cm90ZToKPiArIENDIGxpbnV4
LW1tIGFuZCBSb2JpbiBNdXJwaHkKPiAKPiBPbiBXZWQsIE9jdCA0LCAyMDIzIGF0IDEyOjQy4oCv
UE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gTW9u
LCBPY3QgMDIsIDIwMjMgYXQgMDk6Mzc6NDRQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdyb3RlOgo+
Pj4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMDU6NDg6MjFQTSAtMDUwMCwgUm9iZXJ0IE5lbHNv
biB3cm90ZToKPj4+PiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAyOjA44oCvUE0gUm9iZXJ0IE5l
bHNvbiA8cm9iZXJ0Y25lbHNvbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiBUaHUs
IFNlcCAyMSwgMjAyMyBhdCA4OjUx4oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUBiYXlsaWJy
ZS5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
dGhlIGVNTUMgb24gdGhlIEJlYWdsZVYgQWhlYWQgYW5kIHRoZQo+Pj4+Pj4gU2lwZWVkIExpY2hl
ZVBpIDRBLiBUaGlzIGFsbG93cyB0aGUga2VybmVsIHRvIGJvb3Qgd2l0aCB0aGUgcm9vdGZzIG9u
Cj4+Pj4+PiBlTU1DLgo+Pj4+Pj4KPj4+Pj4+IEkgdGVzdGVkIG9uIHRvcCBvZiB2Ni42LXJjMiB3
aXRoIHRoaXMgY29uZmlnIFsxXS4gSSB3YXMgYWJsZSB0byBib290Cj4+Pj4+PiBib3RoIHRoZSBB
aGVhZCBbMl0gYW5kIExQaTRhIFszXSBmcm9tIGVNTUMuIFRoZSBmb2xsb3dpbmcgcHJlcmVxdWlz
aXRlcwo+Pj4+Pj4gYXJlIHJlcXVpcmVkOgo+Pj4+Pj4KPj4+Pj4+ICAgIFtQQVRDSCB2Ml0gcmlz
Y3Y6IGR0czogdGhlYWQ6IHNldCBkbWEtbm9uY29oZXJlbnQgdG8gc29jIGJ1cyBbNF0KPj4+Pj4+
Cj4+Pj4+PiBJIHB1c2hlZCBhIGJyYW5jaCBbNV0gd2l0aCB0aGlzIHBhdGNoIHNlcmllcyBhbmQg
dGhlIGFib3ZlIHBhdGNoIGZvcgo+Pj4+Pj4gdGhvc2UgdGhhdCBmaW5kIGEgZ2l0IGJyYW5jaCBl
YXNpZXIgdG8gdGVzdC4KPj4+Pj4+Cj4+Pj4+PiBQbGVhc2Ugbm90ZSB0aGF0IG9ubHkgdGhlIE1N
QyBjb250cm9sbGVyIGNvbm5lY3RlZCB0byB0aGUgZU1NQyBkZXZpY2UKPj4+Pj4+IGlzIGVuYWJs
ZWQgaW4gdGhlIGRldmljZSB0cmVlcyBmb3IgdGhlc2UgdHdvIGJvYXJkcy4gSSBkaWQgbm90IHll
dAo+Pj4+Pj4gYXR0ZW1wdCB0byBjb25maWd1cmUgYW5kIHVzZSB0aGUgbWljcm9TRCBjYXJkIHNs
b3QuIE15IHByZWZlcmVuY2UgaXMgdG8KPj4+Pj4+IGFkZHJlc3MgdGhhdCBpbiBhIGZ1dHVyZSBw
YXRjaCBzZXJpZXMuCj4+Pj4+Pgo+Pj4+Pj4gUmVmZXJlbmNlczoKPj4+Pj4+IFsxXSBodHRwczov
L2dpc3QuZ2l0aHViLmNvbS9wZHA3LzVmYmRjZjJhNjVlYjFhYmRkM2EyOWQ1MTljMTljZGQyCj4+
Pj4+PiBbMl0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy85MWE4MDFhNWY4ZDEwNzBjNTM1
MDllZGE5ODAwYWQ3OAo+Pj4+Pj4gWzNdIGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvMTQ0
NWMzYzk5MWU4OGZkNjljNjAxNjVjZWY2NTcyNmEKPj4+Pj4+IFs0XSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDkxMjA3MjIzMi4yNDU1LTEtanN6aGFuZ0BrZXJuZWwu
b3JnLwo+Pj4+Pj4gWzVdIGh0dHBzOi8vZ2l0aHViLmNvbS9wZHA3L2xpbnV4L3RyZWUvYjQvdGgx
NTIwLW1tYwo+Pj4+Pgo+Pj4+PiBUaGlzIHBhdGNoc2V0IGNhbWUgb3V0IHZlcnkgbmljZSEKPj4+
Pj4KPj4+Pj4gdjYuNi1yYzIgd2l0aCBMYXN0IFJGQyB2MjoKPj4+Pj4KPj4+Pj4gWyAgICA0LjA2
NjYzMF0gbW1jMDogU0RIQ0kgY29udHJvbGxlciBvbiBmZmU3MDgwMDAwLm1tYwo+Pj4+PiBbZmZl
NzA4MDAwMC5tbWNdIHVzaW5nIFBJTwo+Pj4+Pgo+Pj4+PiBkZWJpYW5AQmVhZ2xlVjp+JCBzdWRv
IGhkcGFybSAtdFQgL2Rldi9tbWNibGswCj4+Pj4+Cj4+Pj4+IC9kZXYvbW1jYmxrMDoKPj4+Pj4g
ICBUaW1pbmcgY2FjaGVkIHJlYWRzOiAgIDE1MTYgTUIgaW4gIDIuMDAgc2Vjb25kcyA9IDc1OC4w
OSBNQi9zZWMKPj4+Pj4gICBUaW1pbmcgYnVmZmVyZWQgZGlzayByZWFkczogIDg0IE1CIGluICAz
LjAxIHNlY29uZHMgPSAgMjcuOTQgTUIvc2VjCj4+Pj4+Cj4+Pj4+IHZzIHY2LjYtcmMyIHdpdGgg
dGhpcyBwYXRjaHNldDoKPj4+Pj4KPj4+Pj4gICBbICAgIDQuMDk2ODM3XSBtbWMwOiBTREhDSSBj
b250cm9sbGVyIG9uIGZmZTcwODAwMDAubW1jCj4+Pj4+IFtmZmU3MDgwMDAwLm1tY10gdXNpbmcg
RE1BCj4+Pj4+Cj4+Pj4+IGRlYmlhbkBCZWFnbGVWOn4kIHN1ZG8gaGRwYXJtIC10VCAvZGV2L21t
Y2JsazAKPj4+Pj4KPj4+Pj4gL2Rldi9tbWNibGswOgo+Pj4+PiAgIFRpbWluZyBjYWNoZWQgcmVh
ZHM6ICAgMTU4MCBNQiBpbiAgMi4wMCBzZWNvbmRzID0gNzkwLjk3IE1CL3NlYwo+Pj4+PiAgIFRp
bWluZyBidWZmZXJlZCBkaXNrIHJlYWRzOiA0MTggTUIgaW4gIDMuMDAgc2Vjb25kcyA9IDEzOS4x
MSBNQi9zZWMKPj4+Pgo+Pj4+IERyZXcgcG9pbnRlZCBvdXQgb24gU2xhY2ssIHRoaXMgd2FzIG5v
dCBxdWl0ZSByaWdodC4uIEFmdGVyIG1vcmUKPj4+PiBkaWdnaW5nIGJ5IERyZXcsIENPTkZJR19E
TUFfR0xPQkFMX1BPT0wgaXMgY2F1c2luZyBhIERNQSBsaW1pdGF0aW9uCj4+Pj4gd2l0aCB0aGUg
bXVsdGlwbGF0Zm9ybSBkZWZjb25maWcuIHNvIHdpdGgsCj4+Pj4KPj4+PiAuL3NjcmlwdHMvY29u
ZmlnIC0tZGlzYWJsZSBDT05GSUdfQVJDSF9SOUEwN0cwNDMKPj4+Pgo+Pj4+ICh0byByZW1vdmUg
Q09ORklHX0RNQV9HTE9CQUxfUE9PTCkuLi4gYW5vdGhlciAyeCBpbiBidWZmZXJlZCByZWFkcy4u
Cj4+Pj4KPj4+PiBbICAgIDQuMDU5MjQyXSBtbWMwOiBTREhDSSBjb250cm9sbGVyIG9uIGZmZTcw
ODAwMDAubW1jCj4+Pj4gW2ZmZTcwODAwMDAubW1jXSB1c2luZyBBRE1BIDY0LWJpdAo+Pj4+Cj4+
Pj4gZGViaWFuQEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9kZXYvbW1jYmxrMAo+Pj4+Cj4+
Pj4gL2Rldi9tbWNibGswOgo+Pj4+ICAgVGltaW5nIGNhY2hlZCByZWFkczogICAxNjAwIE1CIGlu
ICAyLjAwIHNlY29uZHMgPSA4MDAuOTMgTUIvc2VjCj4+Pj4gICBUaW1pbmcgYnVmZmVyZWQgZGlz
ayByZWFkczogODkyIE1CIGluICAzLjAwIHNlY29uZHMgPSAyOTcuMDYgTUIvc2VjCj4+Pgo+Pj4g
SXQgc2VlbXMgQ09ORklHX0RNQV9HTE9CQUxfUE9PTD15IGNhdXNlcyBBRE1BIGJ1ZmZlciBhbGxv
YyB0byBmYWlsIFsxXToKPj4+Cj4+PiAgICBtbWMwOiBVbmFibGUgdG8gYWxsb2NhdGUgQURNQSBi
dWZmZXJzIC0gZmFsbGluZyBiYWNrIHRvIHN0YW5kYXJkIERNQQo+Pj4KPj4+IFByYWJoYWthcidz
IEFYNDVNUCBub24tY29oZXJlbnQgRE1BIHN1cHBvcnQgWzJdIHNlcmllcyBpbnRyb2R1Y2VkIHRo
ZQo+Pj4gc2VsZWN0aW9uIG9mIERNQV9HTE9CQUxfUE9PTCBmb3IgQVJDSF9SOUEwN0cwNDMgYW5k
IHRoZSByaXNjdiBkZWZjb25maWcKPj4+IHNlbGVjdHMgQVJDSF9SOUEwN0cwNDMuCj4+Pgo+Pj4g
UGF0Y2ggNSBpbiB0aGUgc2VyaWVzIFszXSBzdGF0ZXMgdGhhdDoKPj4+Cj4+PiAgICBXaXRoIERN
QV9HTE9CQUxfUE9PTCBlbmFibGVkIGFsbCBETUEgYWxsb2NhdGlvbnMgaGFwcGVuIGZyb20gdGhp
cwo+Pj4gICAgcmVnaW9uIGFuZCBzeW5jaHJvbml6YXRpb24gY2FsbGJhY2tzIGFyZSBpbXBsZW1l
bnRlZCB0byBzeW5jaHJvbml6ZQo+Pj4gICAgd2hlbiBkb2luZyBETUEgdHJhbnNhY3Rpb25zLgo+
Pj4KPj4+IFRoaXMgZXhhbXBsZSBvZiBhICJzaGFyZWQtZG1hLXBvb2wiIG5vZGUgd2FzIGdpdmVu
Ogo+Pj4KPj4+ICAgICAgICAgIHBtYV9yZXN2MEA1ODAwMDAwMCB7Cj4+PiAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+Pj4gICAgICAgICAgICAgIHJlZyA9IDww
eDAgMHg1ODAwMDAwMCAweDAgMHgwODAwMDAwMD47Cj4+PiAgICAgICAgICAgICAgbm8tbWFwOwo+
Pj4gICAgICAgICAgICAgIGxpbnV4LGRtYS1kZWZhdWx0Owo+Pj4gICAgICAgICAgfTsKPj4+Cj4+
PiBJJ3ZlIGNvcGllZCB0aGF0IHRvIHRoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cy4gVGhlIGFkZHJl
c3Mgb2YgMHg1ODAwMDAwMAo+Pj4gaGFzIG5vIHNpZ25pZmljYW5jZSBvbiB0aDE1MjAsIGJ1dCB0
aGUgZXhpc3RlbmNlIG9mIHNoYXJlZC1kbWEtcG9vbAo+Pj4gc2VlbXMgdG8gZml4IHRoZSBwcm9i
bGVtLiBBRE1BIG1vZGUgWzRdIGlzIG5vdyB3b3JraW5nIGV2ZW4gdGhvdWdoCj4+PiBDT05GSUdf
RE1BX0dMT0JBTF9QT09MPXkuCj4+Cj4+ICsgQ2hyaXN0b3BoLCBMYWQKPj4KPj4gSU1ITywgdGhp
cyBpcyBub3QgVEgxNTIwIHNwZWNpZmljIGJ1dCBhIGdlbmVyaWMgaXNzdWUuCj4+Cj4+IEkgYmVs
aWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBLY29uZmlnOiBTZWxlY3Qg
dGhlCj4+IHJlcXVpcmVkIGNvbmZpZ3MgZm9yIFJaL0ZpdmUgU29DIikgY2FuIGNhdXNlIHJlZ3Jl
c3Npb24gb24gYWxsCj4+IG5vbi1kbWEtY29oZXJlbnQgcmlzY3YgcGxhdGZvcm1zIHdpdGggZ2Vu
ZXJpYyBkZWZjb25maWcuIFRoaXMgaXMKPj4gYSBjb21tb24gaXNzdWUuIFRoZSBsb2dpYyBoZXJl
IGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZpZyBzZWxlY3RzCj4+IEFSQ0hfUjlBMDdHMDQzIHdo
aWNoIHNlbGVjdHMgRE1BX0dMT0JBTF9QT09MLCB3aGljaCBhc3N1bWVzIGFsbAo+PiBub24tZG1h
LWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyBoYXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0aGlzIGFz
c3VtcHRpb24KPj4gc2VlbXMgbm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1BX0dMT0JBTF9Q
T09MIHNob3VsZCBub3QgYmUKPj4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NGQU1JTElZLCBpbnN0ZWFk
LCBvbmx5IEFSQ0ggdW5kZXIgc29tZSBzcGVjaWZpYwo+PiBjb25kaXRpb25zIGNhbiBzZWxlY3Qg
aXQgZ2xvYmFseSwgZm9yIGV4YW1wbGUgTk9NTVUgQVJNIGFuZCBzbyBvbi4KPj4KPj4gU2luY2Ug
dGhpcyBpcyBhIHJlZ3Jlc3Npb24sIHdoYXQncyBwcm9wZXIgZml4PyBhbnkgc3VnZ2VzdGlvbiBp
cwo+PiBhcHByZWNpYXRlZC4KCkkgdGhpbmsgdGhlIGFuc3dlciBpcyB0byBub3Qgc2VsZWN0IERN
QV9HTE9CQUxfUE9PTCwgc2luY2UgdGhhdCBpcyBvbmx5IApkZXNpZ25lZCBmb3Igbm9tbXUgY2Fz
ZXMgd2hlcmUgbm9uLWNhY2hlYWJsZSBtZW1vcnkgbGl2ZXMgaW4gYSBmaXhlZCAKcGxhY2UgaW4g
dGhlIHBoeXNpY2FsIGFkZHJlc3MgbWFwLCBhbmQgcmVndWxhciBrZXJuZWwgcGFnZXMgY2FuJ3Qg
YmUgCnJlbWFwcGVkLiBBcyBmYXIgYXMgSSdtIGF3YXJlLCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQg
aXMgdGhlIHRoaW5nIHlvdSAKd2FudCwgc3VjaCB0aGF0IERNQV9ESVJFQ1RfUkVNQVAgY2FuIGR5
bmFtaWNhbGx5IHByb3ZpZGUgbm9uLWNhY2hlYWJsZSAKY29oZXJlbnQgYnVmZmVycyBmb3Igbm9u
LWhhcmR3YXJlLWNvaGVyZW50IGRldmljZXMuCgpUaGFua3MsClJvYmluLgoKPj4KPj4gVGhhbmtz
Cj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gRHJldwo+Pj4KPj4+IFsxXSBodHRwczovL2dpc3QuZ2l0
aHViLmNvbS9wZHA3LzczMDQxZWQ4MDhiYmM3ZGQ0NDU4MzZmYjkwNTc0OTc5Cj4+PiBbMl0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA4MTgxMzU3MjMuODA2MTItMS1w
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vCj4+PiBbM10gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA4MTgxMzU3MjMuODA2MTItNi1wcmFiaGFr
YXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vCj4+PiBbNF0gaHR0cHM6Ly9naXN0Lmdp
dGh1Yi5jb20vcGRwNy85MWU3MmE2NjNkM2JiNzNlYjI4MTgyMzM3YWQ4YmJjYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
