Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7313D3E2DF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RcCqZ/5aqAQdSfC4msMO6ZIft37DHFRQ0AxR5fiLR4=; b=P+F6amnCL1mTAd
	3OFsyN+lfBJYzfcAWlUsIjDVna8m3YyA3DyE080jmEzux33QdK9JR7itiNsXRyFskOtDXLbGnu96T
	JJVKZrVNrqklb9aLFdxUuWnGfMj+XqtmnajuiUhYyDwQsFMf43eBSKqTt868ENsM6WYaGFUDi0OGb
	Q3Tl60ZjsdXn1ps9Zs8LM4ZzZJhO+tRz0wPhtfKde/bvOvIbmTAGCXSuUr/x7unNxXqe8IwsIu+X5
	croid4YafP+6SsOIRmDf+Itl1enUS8bGrstp/EGnvrJYyphbnkEjdV90E0MXCmOFVHYLUMVD1ub3O
	GZ+mzCPOXQRd69sdj3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h3z-0000000DamV-08zB;
	Tue, 29 Oct 2024 07:54:51 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h2E-0000000DaHC-48JF
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 07:53:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3F041C0006;
	Tue, 29 Oct 2024 07:52:57 +0000 (UTC)
Message-ID: <9aa8c627-ad69-43e9-9331-40a5df53de7f@ghiti.fr>
Date: Tue, 29 Oct 2024 08:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/riscv-intc: Fix no-SMP boot with ACPI
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20241014065739.656959-1-sunilvl@ventanamicro.com>
 <cbe0831e-706c-465f-b412-fccf26163e9b@ghiti.fr>
In-Reply-To: <cbe0831e-706c-465f-b412-fccf26163e9b@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_005303_532279_730F7CAD 
X-CRM114-Status: GOOD (  20.60  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjkvMTAvMjAyNCAwODo0NiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIFRob21hcywK
Pgo+IE9uIDE0LzEwLzIwMjQgMDg6NTcsIFN1bmlsIFYgTCB3cm90ZToKPj4gV2hlbiBDT05GSUdf
U01QIGlzIGRpc2FibGVkLCB0aGUgc3RhdGljIGFycmF5IHJpbnRjX2FjcGlfZGF0YSB3aXRoIHNp
emUKPj4gTlJfQ1BVUyB3aWxsIG5vdCBiZSBzdWZmaWNpZW50IHRvIGhvbGQgYWxsIFJJTlRDIHN0
cnVjdHVyZXMgcGFzc2VkIGZyb20KPj4gdGhlIGZpcm13YXJlLiBBbGwgUklOVEMgc3RydWN0dXJl
cyBhcmUgcmVxdWlyZWQgdG8gY29uZmlndXJlCj4+IElNU0lDL0FQTElDL1BMSUMgcHJvcGVybHkg
aXJyZXNwZWN0aXZlIG9mIFNNUCBpbiB0aGUgT1MuIFNvLCBhbGxvY2F0ZQo+PiBkeW5hbWljIG1l
bW9yeSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIFJJTlRDIHN0cnVjdHVyZXMgaW4gTUFEVCB0byBm
aXgKPj4gdGhpcyBpc3N1ZS4KPj4KPj4gRml4ZXM6IGY4NjE5YjY2YmRiMSAoImlycWNoaXAvcmlz
Y3YtaW50YzogQWRkIEFDUEkgc3VwcG9ydCBmb3IgQUlBIikKPj4gUmVwb3J0ZWQtYnk6IEJqw7Zy
biBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+IENsb3NlczogCj4+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9saW51eC1yaXNjdi9saW51eC1yaXNjdi9hY3Rpb25zL3J1bnMvMTEyODA5OTc1MTEvam9i
LzMxMzc1MjI5MDEyCj4+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5h
bWljcm8uY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMg
fCAxOSArKysrKysrKysrKysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYyAKPj4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+
PiBpbmRleCA4YzU0MTEzODYyMjAuLmY2NTNjMTNkZTYyYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbnRjLmMKPj4gQEAgLTI2NSw3ICsyNjUsNyBAQCBzdHJ1Y3QgcmludGNfZGF0YSB7Cj4+
IMKgIH07Cj4+IMKgIMKgIHN0YXRpYyB1MzIgbnJfcmludGM7Cj4+IC1zdGF0aWMgc3RydWN0IHJp
bnRjX2RhdGEgKnJpbnRjX2FjcGlfZGF0YVtOUl9DUFVTXTsKPj4gK3N0YXRpYyBzdHJ1Y3Qgcmlu
dGNfZGF0YSAqKnJpbnRjX2FjcGlfZGF0YTsKPj4gwqAgwqAgI2RlZmluZSBmb3JfZWFjaF9tYXRj
aGluZ19wbGljKF9wbGljX2lkKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IF9wbGljO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXAo+PiBAQCAtMzI5LDEzICszMjksMzAgQEAgaW50IGFjcGlfcmlu
dGNfZ2V0X2ltc2ljX21taW9faW5mbyh1MzIgaW5kZXgsIAo+PiBzdHJ1Y3QgcmVzb3VyY2UgKnJl
cykKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiDCoCArc3RhdGljIGludCBfX2lu
aXQgcmlzY3ZfaW50Y19hY3BpX21hdGNoKHVuaW9uIAo+PiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMg
KmhlYWRlciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0
IHVuc2lnbmVkIGxvbmcgZW5kKQo+PiArewo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiAr
Cj4+IMKgIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfYWNwaV9pbml0KHVuaW9uIGFjcGlf
c3VidGFibGVfaGVhZGVycyAKPj4gKmhlYWRlciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQo+PiDCoCB7
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqcmludGM7Cj4+IMKgwqDCoMKg
wqAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZuOwo+PiArwqDCoMKgIGludCBjb3VudDsKPj4gwqDC
oMKgwqDCoCBpbnQgcmM7Cj4+IMKgICvCoMKgwqAgaWYgKCFyaW50Y19hY3BpX2RhdGEpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIGNvdW50ID0gYWNwaV90YWJsZV9wYXJzZV9tYWR0KEFDUElfTUFEVF9U
WVBFX1JJTlRDLCAKPj4gcmlzY3ZfaW50Y19hY3BpX21hdGNoLCAwKTsKPj4gK8KgwqDCoMKgwqDC
oMKgIGlmIChjb3VudCA8PSAwKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcmludGNfYWNwaV9kYXRhID0ga2NhbGxvYyhj
b3VudCwgc2l6ZW9mKCpyaW50Y19hY3BpX2RhdGEpLCAKPj4gR0ZQX0tFUk5FTCk7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIXJpbnRjX2FjcGlfZGF0YSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9NRU07Cj4+ICvCoMKgwqAgfQo+PiArCj4+IMKgwqDCoMKgwqAgcmludGMg
PSAoc3RydWN0IGFjcGlfbWFkdF9yaW50YyAqKWhlYWRlcjsKPj4gwqDCoMKgwqDCoCByaW50Y19h
Y3BpX2RhdGFbbnJfcmludGNdID0gCj4+IGt6YWxsb2Moc2l6ZW9mKCpyaW50Y19hY3BpX2RhdGFb
MF0pLCBHRlBfS0VSTkVMKTsKPj4gwqDCoMKgwqDCoCBpZiAoIXJpbnRjX2FjcGlfZGF0YVtucl9y
aW50Y10pCj4KPgo+IERvIHlvdSB0aGluayB5b3UgY2FuIG1lcmdlIHRoaXMgcGF0Y2ggZm9yIHJj
Nj8gV2Ugc3RpbGwgbmVlZCBpdCB0byBmaXggCj4gb3VyIG5vc21wIGJ1aWxkcy4KCgpQbGVhc2Ug
aWdub3JlIHRoaXMgbWVzc2FnZSwgSSBmb3VuZCBpdCB3aXRoIGEgZGlmZmVyZW50IHRpdGxlLgoK
VGhhbmtzLAoKQWxleAoKCj4KPiBUaGFua3MsCj4KPiBBbGV4Cj4KPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
