Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07588D16268
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRtMofVLhPp/dl8p0JkkG+9FsYJU48sXuX26Y8bvg0U=; b=hGtSKWra7BU0DEvLbwJJvzN897
	zJsTb9Zaf8yMIIctILMU5zrDm0aNux3mqlsYj9K4g7fiqpU0kWUk9z00Lp9yJRg4ye1eIv9XFuhBl
	HQXsWfpjCENotlH3IMgS0HuC9lEIfHc1kTfyTnZzZmSe42cePBPh9T6CooDqOnK9zGxcHi6BWH322
	uIMFvvfLlP24rGqsMWzX6xfKwOSAW/8ZdCR6wkQGeHT0nxHiPFOfZCDzyv2JWMQreXmKXkc5Ejr2Z
	oeeWyu+HEb+Lg99ugC6IlZCJ8eEkewRFmUoqjRsXWl6Vqj996vmLt32soVFMVdpn07VYWKTyxmYCy
	f5luI5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0LYq-00000005NWM-0C6Y;
	Mon, 14 Oct 2024 13:56:36 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Khm-00000005B1m-2jzM
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 13:01:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53C7560005;
	Mon, 14 Oct 2024 13:01:39 +0000 (UTC)
Message-ID: <c05e09d0-d996-4712-a6e5-ef77f1f2ff0a@ghiti.fr>
Date: Mon, 14 Oct 2024 15:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] RISC-V: ACPI: fix early_ioremap to
 early_memremap
Content-Language: en-US
To: yunhui cui <cuiyunhui@bytedance.com>
References: <20241014094705.71775-1-cuiyunhui@bytedance.com>
 <d39e4832-50f3-4fc8-ba95-a2d6eefa5abe@ghiti.fr>
 <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAEEQ3wk6K52RdCat+L91KvfNVkxbj1-3zxjubkn9xy89wK_-bA@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_060146_851184_2ECFCAF7 
X-CRM114-Status: GOOD (  20.02  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, punit.agrawal@bytedance.com, haibo1.xu@intel.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMTAvMjAyNCAxNDozMCwgeXVuaHVpIGN1aSB3cm90ZToKPiBIaSBBbGV4LAo+Cj4gT24g
TW9uLCBPY3QgMTQsIDIwMjQgYXQgODoxMuKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4gd3JvdGU6Cj4+IEhpIFl1bmh1aSwKPj4KPj4gT24gMTQvMTAvMjAyNCAxMTo0NywgWXVu
aHVpIEN1aSB3cm90ZToKPj4+IFdoZW4gU1ZQQk1UIGlzIGVuYWJsZWQsIF9fYWNwaV9tYXBfdGFi
bGUoKSB3aWxsIGRpcmVjdGx5IGFjY2VzcyB0aGUKPj4+IGRhdGEgaW4gRERSIHRocm91Z2ggdGhl
IElPIGF0dHJpYnV0ZSwgcmF0aGVyIHRoYW4gdGhyb3VnaCBoYXJkd2FyZQo+Pj4gY2FjaGUgY29u
c2lzdGVuY3ksIHJlc3VsdGluZyBpbiBpbmNvcnJlY3QgZGF0YSBpbiB0aGUgb2J0YWluZWQgQUNQ
SQo+Pj4gdGFibGUuCj4+Pgo+Pj4gVGhlIGxvZzogQUNQSTogW0FDUEk6MHgxOF0gSW52YWxpZCB6
ZXJvIGxlbmd0aC4KPj4+Cj4+PiBXZSBkbyBub3QgYXNzdW1lIHdoZXRoZXIgdGhlIGJvb3Rsb2Fk
ZXIgZmx1c2hlcyBvciBub3QuIFdlIHNob3VsZAo+Pj4gYWNjZXNzIGluIGEgY2FjaGVhYmxlIHdh
eSBpbnN0ZWFkIG9mIG1haW50YWluaW5nIGNhY2hlIGNvbnNpc3RlbmN5Cj4+PiBieSBzb2Z0d2Fy
ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbT4KPj4+IC0tLQo+Pj4gICAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgMiArLQo+Pj4g
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L2FjcGkuYwo+Pj4gaW5kZXggNmUwZDMzM2Y1N2U1Li4zMTc3YzlhZjg3NjQgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9hY3BpLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2FjcGkuYwo+Pj4gQEAgLTIxMCw3ICsyMTAsNyBAQCB2b2lkIF9faW5pdCBfX2lvbWVtICpfX2Fj
cGlfbWFwX3RhYmxlKHVuc2lnbmVkIGxvbmcgcGh5cywgdW5zaWduZWQgbG9uZyBzaXplKQo+Pj4g
ICAgICAgIGlmICghc2l6ZSkKPj4+ICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Pj4KPj4+
IC0gICAgIHJldHVybiBlYXJseV9pb3JlbWFwKHBoeXMsIHNpemUpOwo+Pj4gKyAgICAgcmV0dXJu
IGVhcmx5X21lbXJlbWFwKHBoeXMsIHNpemUpOwo+Pj4gICAgfQo+Pj4KPj4+ICAgIHZvaWQgX19p
bml0IF9fYWNwaV91bm1hcF90YWJsZSh2b2lkIF9faW9tZW0gKm1hcCwgdW5zaWduZWQgbG9uZyBz
aXplKQo+Pgo+PiBJdCBtYWtlcyBzZW5zZSB0byBtZSBzaW5jZSB3aXRoIHRoaXMsIHdlIGRvbid0
IGhhdmUgdG8gY2FyZSBhYm91dCBob3cKPj4gdGhlIGZpcm13YXJlIG1hcHBlZCB0aGUgdGFibGUu
IEFuZCBpdCBtaW1pY3MgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMKPj4gKGFybTY0LCBsb29uZ2Fy
Y2ggYW5kIHg4NikuCj4+Cj4+IEhlcmUgaXMgdGhlIGNvcnJlc3BvbmRpbmcgZml4ZXMgdGFnOgo+
Pgo+PiBGaXhlczogM2I0MjZkNGI1YjE0ICgiUklTQy1WOiBBQ1BJIDogRml4IGZvciB1c2FnZSBv
ZiBwb2ludGVycyBpbgo+PiBkaWZmZXJlbnQgYWRkcmVzcyBzcGFjZSIpCj4+Cj4+IFdpdGggdGhl
IGNvcnJlc3BvbmRpbmcgZml4IGluIF9fYWNwaV91bm1hcF90YWJsZSgpIGFzIHBvaW50ZWQgYnkg
U3VuaWwsCj4+IHlvdSBjYW4gYWRkOgo+Pgo+PiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pgo+PiBBbmQgcmVnYXJkaW5nIHRoZSBzcGFyc2Ug
ZXJyb3IsIEkgZG9uJ3Qgc2VlIGFueSBvdGhlciBhcmNoaXRlY3R1cmUKPj4gY2FzdGluZyB0byBf
X2lvbWVtLCBzbyBtYXliZSB0aGF0J3Mgbm90IG5lY2Vzc2FyeSBhbnltb3JlPwo+IE9LLiBJIHdp
bGwgbWFrZSB0aGUgY2hhbmdlcyBpbiB2Mi4gUmVnYXJkaW5nIHRoZSBzcGFyc2UgZXJyb3IsIEkg
d2lsbAo+IHVzZSBhbm90aGVyIHBhdGNoIHNwZWNpZmljYWxseSB0byBzb2x2ZSBpdC4gSXMgdGhh
dCBva2F5PwoKCklmIHRoZSBzZWNvbmQgcGF0Y2ggb25seSBjb25zaXN0cyBpbiBjYXN0aW5nLCBJ
IHdvdWxkIG5vdCB1c2UgYW5vdGhlciAKcGF0Y2ggc2luY2UgdGhlIHBhdGNoIDIgd291bGQgZml4
IHNvbWV0aGluZyBpbnRyb2R1Y2VkIGluIHBhdGNoIDEuCgpCdXQgaWYgcGF0Y2ggMiBpcyBtb3Jl
IGNvbXBsaWNhdGVkLMKgIGl0IG1heSBtYWtlIHNlbnNlIHRvIGRvIGFzIHlvdSAKc3VnZ2VzdCwg
dGhlIGdvYWwgaXMgdG8gbWVyZ2UgcGF0Y2ggMSBhc2FwLgoKVGhhbmtzIQoKQWxleAoKCj4KPj4g
VGhhbmtzLAo+Pgo+PiBBbGV4Cj4+Cj4+Cj4gVGhhbmtzLAo+IFl1bmh1aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
