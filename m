Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB245C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGQiNG4rlOSejT7QuPWmMQqTL/L2d9zSn2nhNr9Qivs=; b=qwQlpb4SUfZU0p
	mmfUg2LcamXn/vf8XrtH9DjcLWSCkIVupBaTtvvBOQC87dRARLwq7BTKPDk4/uX2vFbbTEVhPsEG2
	eDxrm2SMNS+FVcEbFQdlOZMvFxjHd7P6gycJAELIW+QLcy5BVvKQ92nl9DUsqn5k2fY1yP0hHg7DS
	aHVntOmBHPBhc5B07aYY4ZMpF9ChmiFznIwLOSUE4RqMtDTW+GYQen43qa/wC/QdpFkzHrMbmRDGm
	dD+FZreSnDWHm7Qj6eTa4OHMBEIfenSEb7wUyp8AyUeBhWSpGFTt0Ctm3AVCCDIQVRFPQ6TqLjhjY
	il+FIWt+HQKnc3JQzHtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyM3-00DKQZ-2s;
	Mon, 22 Jan 2024 17:45:03 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyM0-00DKOC-07;
	Mon, 22 Jan 2024 17:45:02 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TJcwh1ZKDz6JBTC;
	Tue, 23 Jan 2024 01:41:56 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 11383140A86;
	Tue, 23 Jan 2024 01:44:51 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 17:44:50 +0000
Date: Mon, 22 Jan 2024 17:44:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Russell King <rmk+kernel@armlinux.org.uk>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>,
	<acpica-devel@lists.linuxfoundation.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 04/21] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <20240122174449.00002f78@Huawei.com>
In-Reply-To: <CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
	<CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_094500_355727_AC7CE7E3 
X-CRM114-Status: GOOD (  38.11  )
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

T24gTW9uLCAxOCBEZWMgMjAyMyAyMTozMDo1MCArMDEwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
YWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDni
gK9QTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+
Cj4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+Cj4gPiBUbyBh
bGxvdyBBQ1BJIHRvIHNraXAgdGhlIGNhbGwgdG8gYXJjaF9yZWdpc3Rlcl9jcHUoKSB3aGVuIHRo
ZSBfU1RBCj4gPiB2YWx1ZSBpbmRpY2F0ZXMgdGhlIENQVSBjYW4ndCBiZSBicm91Z2h0IG9ubGlu
ZSByaWdodCBub3csIG1vdmUgdGhlCj4gPiBhcmNoX3JlZ2lzdGVyX2NwdSgpIGNhbGwgaW50byBh
Y3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbygpLiAgCj4gCj4gVGhpcyBraW5kIG9mIGxvb2tzIGJhY2t3
YXJkcyB0byBtZSBhbmQgaGFzIGEgcG90ZW50aWFsIHRvIGJlY29tZQo+IHN1cGVyLWNvbmZ1c2lu
Zy4KPiAKPiBJIHdvdWxkIGluc3RlYWQgYWRkIGEgd2F5IGZvciB0aGUgZ2VuZXJpYyBjb2RlIHRv
IGFzayB0aGUgcGxhdGZvcm0KPiBmaXJtd2FyZSB3aGV0aGVyIG9yIG5vdCB0aGUgZ2l2ZW4gQ1BV
IGlzIGVuYWJsZWQgYW5kIHNvIGl0IGNhbiBiZQo+IHJlZ2lzdGVyZWQuCgpIaSBSYWZhZWwsCgpU
aGUgQUNQSSBpbnRlcnByZXRlciBpc24ndCB1cCBhdCB0aGlzIHN0YWdlIHNvIHdlJ2QgbmVlZCB0
byBwdWxsIHRoYXQKZm9yd2FyZHMuIEknbSBub3Qgc3VyZSBpZiB3ZSBjYW4gcHVsbCB0aGUgaW50
ZXJwcmV0ZXIgaW5pdCBlYXJseSBlbm91Z2guCgpQZXJoYXBzIHB1c2hpbmcgdGhlIHJlZ2lzdHJh
dGlvbiBiYWNrIGluIGFsbCBjYXNlcyBpcyB0aGUgd2F5IHRvIGdvPwpHaXZlbiB0aGUgYWNwaSBp
bnRlcnByZXR0ZXIgaXMgaW5pdGlhbGl6ZWQgdmlhIHN1YnN5c19pbml0Y2FsbCgpIGl0IHdvdWxk
Cm5lZWQgdG8gYmUgYWZ0ZXIgdGhhdCAtIEkgdHJpZWQgcHVzaGluZyBjcHVfZGV2X3JlZ2lzdGVy
X2dlbmVyaWMoKQppbW1lZGlhdGVseSBhZnRlciBhY3BpX2J1c19pbml0KCkgYW5kIHRoYXQgc2Vl
bXMgZmluZS4KV2UgY2FuJ3QgbGVhdmUgdGhlIHJlc3Qgb2YgY3B1X2Rldl9pbml0KCkgdGhhdCBs
YXRlIGJlY2F1c2UgYSBidW5jaApvZiBvdGhlciBzdHVmZiByZWxpZXMgb24gaXQgKENQVSBmcmVx
IGJsb3dzIHVwIGZpcnN0IGFzIGEgY29yZV9pbml0KCkKb24gbXkgc2V0dXApLgoKU28gdG8gbWFr
ZSB0aGlzIHdvcmsgd2UgbmVlZCBpdCB0byBhbHdheXMgbW92ZSB0aGUgcmVnaXN0cmF0aW9uIGxh
dGVyCnRoYW4gdGhlIG5lY2Vzc2FyeSBpbmZyYXN0cnVjdHVyZSwgcGVyaGFwcyB0byBzdWJzeXNf
aW5pdGNhbGxfc3luYygpCmFzIGlzIGRvbmUgZm9yIG1pc3NpbmcgQ1BVcyAod2UnZCBuZWVkIHRv
IGNvbWJpbmUgdGhlIHR3byBnaXZlbiB0aGF0Cm5lZWRzIHRvIHJ1biBhZnRlciB0aGlzLCBvciBw
b3RlbnRpYWxseSBqdXN0IHN0b3AgY2hlY2tpbmcgZm9yIGFjcGlfZGlzYWJsZWQKYW5kIGRvbid0
IHRhaW50IHRoZSBrZXJuZWwhKS4gIEkgdGhpbmsgdGhpcyBpcyBwcm9iYWJseSB0aGUgbW9zdCBj
b25zaXN0ZW50Cm9wdGlvbiBvbiBiYXNpcyBpdCBhdCBsZWFzdCBtb3ZlcyB0aGUgcmVnaXN0cmF0
aW9uIHRvIHRoZSBzYW1lIHBvaW50CndoYXRldmVyIGlzIGdvaW5nIG9uIGFuZCBjYW4gZWFzaWx5
IHVzZSB0aGUgYXJjaCBjYWxsYmFjayB5b3Ugc3VnZ2VzdAp0byBoaWRlIGF3YXkgdGhlIGxvZ2lj
IG9uIGRlY2lkaW5nIGlmIGEgQ1BVIGlzIHRoZXJlIG9yIG5vdC4KCldoYXQgZG8geW91IHRoaW5r
IGlzIHRoZSBiZXN0IHdheSB0byBkbyB0aGlzPwoKCj4gCj4gPiBTeXN0ZW1zIGNhbiBzdGlsbCBi
ZSBib290ZWQgd2l0aCAnYWNwaT1vZmYnLCBvciBub3QgaW5jbHVkZSBhbm8KPiA+IEFDUEkgZGVz
Y3JpcHRpb24gYXQgYWxsLiBGb3IgdGhlc2UsIHRoZSBDUFVzIGNvbnRpbnVlIHRvIGJlCj4gPiBy
ZWdpc3RlcmVkIGJ5IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYygpLgo+ID4KPiA+IFRoaXMgbW92
ZXMgdGhlIENQVSByZWdpc3RlciBsb2dpYyBiYWNrIHRvIGEgc3Vic3lzX2luaXRjYWxsKCksCj4g
PiB3aGlsZSB0aGUgbWVtb3J5IG5vZGVzIHdpbGwgaGF2ZSBiZWVuIHJlZ2lzdGVyZWQgZWFybGll
ci4gIAo+IAo+IElzbid0IHRoaXMgc29tZXdoYXQgcmlza3k/Cj4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBHYXZp
biBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+ID4gVGVzdGVkLWJ5OiBNaWd1ZWwgTHVpcyA8bWln
dWVsLmx1aXNAb3JhY2xlLmNvbT4KPiA+IFRlc3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hu
dUBvcy5hbXBlcmVjb21wdXRpbmcuY29tPgo+ID4gVGVzdGVkLWJ5OiBKaWFueW9uZyBXdSA8amlh
bnlvbmcud3VAYXJtLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xl
KSA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+Cj4gPiAtLS0KPiA+IENoYW5nZXMgc2luY2Ug
UkZDIHYyOgo+ID4gICogRml4dXAgY29tbWVudCBpbiBhY3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbygp
IChHYXZpbiBTaGFuKQo+ID4gICogQWRkIGNvbW1lbnQgaW4gY3B1X2Rldl9yZWdpc3Rlcl9nZW5l
cmljKCkgKEdhdmluIFNoYW4pCj4gPiAtLS0KPiA+ICBkcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNz
b3IuYyB8IDEyICsrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvYmFzZS9jcHUuYyAgICAgICAgICAg
IHwgIDYgKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nv
ci5jIGIvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiA+IGluZGV4IDA1MTFmMmJjMTBi
Yy4uZTdlZDQ3MzBjYmJlIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vz
c29yLmMKPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4gPiBAQCAtMzE0
LDYgKzMxNCwxOCBAQCBzdGF0aWMgaW50IGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKHN0cnVjdCBh
Y3BpX2RldmljZSAqZGV2aWNlKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1ZnJlcV9h
ZGRfZGV2aWNlKCJhY3BpLWNwdWZyZXEiKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAg
LyoKPiA+ICsgICAgICAgICogUmVnaXN0ZXIgQ1BVcyB0aGF0IGFyZSBwcmVzZW50LiBnZXRfY3B1
X2RldmljZSgpIGlzIHVzZWQgdG8gc2tpcAo+ID4gKyAgICAgICAgKiBkdXBsaWNhdGUgQ1BVIGRl
c2NyaXB0aW9ucyBmcm9tIGZpcm13YXJlLgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaWYg
KCFpbnZhbGlkX2xvZ2ljYWxfY3B1aWQocHItPmlkKSAmJiBjcHVfcHJlc2VudChwci0+aWQpICYm
Cj4gPiArICAgICAgICAgICAhZ2V0X2NwdV9kZXZpY2UocHItPmlkKSkgewo+ID4gKyAgICAgICAg
ICAgICAgIGludCByZXQgPSBhcmNoX3JlZ2lzdGVyX2NwdShwci0+aWQpOwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiAgICAgICAgIC8qCj4gPiAgICAgICAgICAqICBF
eHRyYSBQcm9jZXNzb3Igb2JqZWN0cyBtYXkgYmUgZW51bWVyYXRlZCBvbiBNUCBzeXN0ZW1zIHdp
dGgKPiA+ICAgICAgICAgICogIGxlc3MgdGhhbiB0aGUgbWF4ICMgb2YgQ1BVcy4gVGhleSBzaG91
bGQgYmUgaWdub3JlZCBfaWZmCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL2NwdS5jIGIv
ZHJpdmVycy9iYXNlL2NwdS5jCj4gPiBpbmRleCA0N2RlMGYxNDBiYTYuLjEzZDA1MmJmMTNmNCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvYmFzZS9jcHUuYwo+ID4gKysrIGIvZHJpdmVycy9iYXNl
L2NwdS5jCj4gPiBAQCAtNTUzLDcgKzU1MywxMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY3B1X2Rl
dl9yZWdpc3Rlcl9nZW5lcmljKHZvaWQpCj4gPiAgewo+ID4gICAgICAgICBpbnQgaSwgcmV0Owo+
ID4KPiA+IC0gICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX0NQVV9ERVZJQ0VT
KSkKPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogV2hlbiBBQ1BJIGlzIGVuYWJsZWQsIENQ
VXMgYXJlIHJlZ2lzdGVyZWQgdmlhCj4gPiArICAgICAgICAqIGFjcGlfcHJvY2Vzc29yX2dldF9p
bmZvKCkuCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklH
X0dFTkVSSUNfQ1BVX0RFVklDRVMpIHx8ICFhY3BpX2Rpc2FibGVkKQo+ID4gICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1KGkpIHsKPiA+
IC0tCj4gPiAyLjMwLjIKPiA+Cj4gPiAgCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
