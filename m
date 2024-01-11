Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AD7C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pg7iUjzxkFXa8sC1xeWrYUOwmI/G1RRNr+7ieoE2g0=; b=cRNa558OSlz0Zg
	be9NwU0YZZoYzoc2uVu9CI5R3JgTixC2Xie8sDjjuC5S4WpycruQXHZDmpL7rc19z8fk1cCWSNa57
	3FMonX6CAl8P9KMU9p2w8rXy7sJH0X87wV9+c/3Y6cv5dphUldfW2RBHKMjZzUockAX5Wg/rLDvp+
	Wl5W8ARHZR7O/9HPxNyM8g/s8MUfQB4tStyBFZOuqyF8WMD8IaNdFPukCn4VJA+2qpK6oS1CSKYxM
	IXYipROmxXTysSIBYfCV76B6BJ/P9gK5CFq1D280fuUkl5JxcZlC9lSgEDu690Lm7rb1O6xvGHKiP
	8L8f0IZFZ5ay1RjFTIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxkB-000Z9k-16;
	Thu, 11 Jan 2024 16:17:23 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNxk6-000Z4W-2J;
	Thu, 11 Jan 2024 16:17:21 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T9qW95bKGz6D8jQ;
	Fri, 12 Jan 2024 00:14:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id BAB0D1400CB;
	Fri, 12 Jan 2024 00:17:08 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Jan
 2024 16:17:08 +0000
Date: Thu, 11 Jan 2024 16:17:07 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>,
	<acpica-devel@lists.linuxfoundation.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for
 processors described as container packages
Message-ID: <20240111161707.000059f6@Huawei.com>
In-Reply-To: <ZZ1woQkpMMCWVnXc@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
	<ZZ1q+7GXqnMMwKNR@shell.armlinux.org.uk>
	<CAJZ5v0jvuTAMak-x=ekphwgNsUWABGRcDPb8D4QB=KhfyC76Sg@mail.gmail.com>
	<ZZ1woQkpMMCWVnXc@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_081719_068783_24091A55 
X-CRM114-Status: GOOD (  41.64  )
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

T24gVHVlLCA5IEphbiAyMDI0IDE2OjEzOjIxICswMDAwCiJSdXNzZWxsIEtpbmcgKE9yYWNsZSki
IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgoKPiBPbiBUdWUsIEphbiAwOSwgMjAyNCBh
dCAwNTowNToxNVBNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIFR1ZSwg
SmFuIDksIDIwMjQgYXQgNDo0OeKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPGxpbnV4
QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gT24gTW9uLCBEZWMgMTgsIDIw
MjMgYXQgMDk6MTc6MzRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6ICAKPiA+ID4g
PiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2Vy
bmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBK
YW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBQ1BJ
IGhhcyB0d28gd2F5cyBvZiBkZXNjcmliaW5nIHByb2Nlc3NvcnMgaW4gdGhlIERTRFQuIEZyb20g
QUNQSSB2Ni41LAo+ID4gPiA+ID4gNS4yLjEyOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICJTdGFydGlu
ZyB3aXRoIEFDUEkgU3BlY2lmaWNhdGlvbiA2LjMsIHRoZSB1c2Ugb2YgdGhlIFByb2Nlc3Nvcigp
IG9iamVjdAo+ID4gPiA+ID4gd2FzIGRlcHJlY2F0ZWQuIE9ubHkgbGVnYWN5IHN5c3RlbXMgc2hv
dWxkIGNvbnRpbnVlIHdpdGggdGhpcyB1c2FnZS4gT24KPiA+ID4gPiA+IHRoZSBJdGFuaXVtIGFy
Y2hpdGVjdHVyZSBvbmx5LCBhIF9VSUQgaXMgcHJvdmlkZWQgZm9yIHRoZSBQcm9jZXNzb3IoKQo+
ID4gPiA+ID4gdGhhdCBpcyBhIHN0cmluZyBvYmplY3QuIFRoaXMgdXNhZ2Ugb2YgX1VJRCBpcyBh
bHNvIGRlcHJlY2F0ZWQgc2luY2UgaXQKPiA+ID4gPiA+IGNhbiBwcmVjbHVkZSBhbiBPU1BNIGZy
b20gYmVpbmcgYWJsZSB0byBtYXRjaCBhIHByb2Nlc3NvciB0byBhCj4gPiA+ID4gPiBub24tZW51
bWVyYWJsZSBkZXZpY2UsIHN1Y2ggYXMgdGhvc2UgZGVmaW5lZCBpbiB0aGUgTUFEVC4gRnJvbSBB
Q1BJCj4gPiA+ID4gPiBTcGVjaWZpY2F0aW9uIDYuMyBvbndhcmQsIGFsbCBwcm9jZXNzb3Igb2Jq
ZWN0cyBmb3IgYWxsIGFyY2hpdGVjdHVyZXMKPiA+ID4gPiA+IGV4Y2VwdCBJdGFuaXVtIG11c3Qg
bm93IHVzZSBEZXZpY2UoKSBvYmplY3RzIHdpdGggYW4gX0hJRCBvZiBBQ1BJMDAwNywKPiA+ID4g
PiA+IGFuZCB1c2Ugb25seSBpbnRlZ2VyIF9VSUQgdmFsdWVzLiIKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBBbHNvIHNlZSBodHRwczovL3VlZmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1Byb2Nlc3Nvcl9D
b25maWd1cmF0aW9uX2FuZF9Db250cm9sLmh0bWwjZGVjbGFyaW5nLXByb2Nlc3NvcnMKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBEdXBsaWNhdGUgZGVzY3JpcHRpb25zIGFyZSBub3QgYWxsb3dlZCwgdGhl
IEFDUEkgcHJvY2Vzc29yIGRyaXZlciBhbHJlYWR5Cj4gPiA+ID4gPiBwYXJzZXMgdGhlIFVJRCBm
cm9tIGJvdGggZGV2aWNlcyBhbmQgY29udGFpbmVycy4gYWNwaV9wcm9jZXNzb3JfZ2V0X2luZm8o
KQo+ID4gPiA+ID4gcmV0dXJucyBhbiBlcnJvciBpZiB0aGUgVUlEIGV4aXN0cyB0d2ljZSBpbiB0
aGUgRFNEVC4gIAo+ID4gPiA+Cj4gPiA+ID4gSSdtIG5vdCByZWFsbHkgc3VyZSBob3cgdGhlIGFi
b3ZlIGlzIHJlbGF0ZWQgdG8gdGhlIGFjdHVhbCBwYXRjaC4KPiA+ID4gPiAgCj4gPiA+ID4gPiBU
aGUgbWlzc2luZyBwcm9iZSBmb3IgQ1BVcyBkZXNjcmliZWQgYXMgcGFja2FnZXMgIAo+ID4gPiA+
Cj4gPiA+ID4gSXQgaXMgdW5jbGVhciB3aGF0IGV4YWN0bHkgaXMgbWVhbnQgYnkgIkNQVXMgZGVz
Y3JpYmVkIGFzIHBhY2thZ2VzIi4KPiA+ID4gPgo+ID4gPiA+IEZyb20gdGhlIHBhdGNoLCBpdCBs
b29rcyBsaWtlIHRob3NlIHdvdWxkIGJlIFByb2Nlc3NvcigpIG9iamVjdHMKPiA+ID4gPiBkZWZp
bmVkIHVuZGVyIGEgcHJvY2Vzc29yIGNvbnRhaW5lciBkZXZpY2UuCj4gPiA+ID4gIAo+ID4gPiA+
ID4gY3JlYXRlcyBhIHByb2JsZW0gZm9yCj4gPiA+ID4gPiBtb3ZpbmcgdGhlIGNwdV9yZWdpc3Rl
cigpIGNhbGxzIGludG8gdGhlIGFjcGlfcHJvY2Vzc29yIGRyaXZlciwgYXMgQ1BVcwo+ID4gPiA+
ID4gZGVzY3JpYmVkIGxpa2UgdGhpcyBkb24ndCBnZXQgcmVnaXN0ZXJlZCwgbGVhZGluZyB0byBl
cnJvcnMgZnJvbSBvdGhlcgo+ID4gPiA+ID4gc3Vic3lzdGVtcyB3aGVuIHRoZXkgdHJ5IHRvIGFk
ZCBuZXcgc3lzZnMgZW50cmllcyB0byB0aGUgQ1BVIG5vZGUuCj4gPiA+ID4gPiAoZS5nLiB0b3Bv
bG9neV9zeXNmc19pbml0KCkncyB1c2Ugb2YgdG9wb2xvZ3lfYWRkX2RldigpIHZpYSBjcHVocCkK
PiA+ID4gPiA+Cj4gPiA+ID4gPiBUbyBmaXggdGhpcywgcGFyc2UgdGhlIHByb2Nlc3NvciBjb250
YWluZXIgYW5kIGNhbGwgYWNwaV9wcm9jZXNzb3JfYWRkKCkKPiA+ID4gPiA+IGZvciBlYWNoIHBy
b2Nlc3NvciB0aGF0IGlzIGRpc2NvdmVyZWQgbGlrZSB0aGlzLiAgCj4gPiA+ID4KPiA+ID4gPiBE
aXNjb3ZlcmVkIGxpa2Ugd2hhdD8KPiA+ID4gPiAgCj4gPiA+ID4gPiBUaGUgcHJvY2Vzc29yIGNv
bnRhaW5lcgo+ID4gPiA+ID4gaGFuZGxlciBpcyBhZGRlZCB3aXRoIGFjcGlfc2Nhbl9hZGRfaGFu
ZGxlcigpLCBzbyBubyBkZXRhY2ggY2FsbCB3aWxsCj4gPiA+ID4gPiBhcnJpdmUuICAKPiA+ID4g
Pgo+ID4gPiA+IFRoZSBhYm92ZSByZXF1aXJlcyBjbGFyaWZpY2F0aW9uIHRvby4gIAo+ID4gPgo+
ID4gPiBUaGUgYWJvdmUgY29tbWVudHMuLi4geWVhLiBBcyBJIGRpZG4ndCB3cml0ZSB0aGUgY29t
bWl0IGRlc2NyaXB0aW9uLCBidXQKPiA+ID4gSmFtZXMgZGlkLCBhbmQgSmFtZXMgaGFzIGJhc2lj
YWxseSB2YW5pc2hlZCwgSSBkb24ndCB0aGluayB0aGVzZSBjYW4gYmUKPiA+ID4gYW5zd2VyZWQs
IHNob3J0IG9mIHJld3JpdGluZyB0aGUgZW50aXJlIGNvbW1pdCBtZXNzYWdlLCB3aXRoIG1lIHNw
ZW5kaW5nCj4gPiA+IGEgbG90IG9mIHRpbWUgd2l0aCB0aGUgQUNQSSBzcGVjaWZpY2F0aW9uIHRy
eWluZyB0byBnZXQgdGhlIHRlcm1pbm9sb2d5Cj4gPiA+IHJpZ2h0IC0gYmVjYXVzZSBhdCBsb3Qg
b2YgdGhlIGFib3ZlIG9uIHRoZSBmYWNlIG9mIGl0IHNlZW1zIHRvIGJlIHRoaW5ncwo+ID4gPiB0
byBkbyB3aXRoIHdyb25nIHRlcm1pbm9sb2d5IGJlaW5nIHVzZWQuCj4gPiA+Cj4gPiA+IEkgd2Fz
bid0IGV4cGVjdGluZyB0aGlzIGxldmVsIG9mIGlzc3VlcyB3aXRoIHRoaXMgcGF0Y2ggc2V0LCBh
bmQgSSBub3cKPiA+ID4gZmVlbCBjb21wbGV0ZWx5IG91dCBvZiBteSBkZXB0aCB3aXRoIHRoaXMg
c2VyaWVzLiBJJ20gd29uZGVyaW5nIHdoZXRoZXIKPiA+ID4gSSBzaG91bGQgZXZlbiBjb250aW51
ZSB3aXRoIGl0LCBzaW5jZSBJIGRvbid0IGhhdmUgdGhlIEFDUEkga25vd2xlZGdlCj4gPiA+IHRv
IGFkZHJlc3MgYSBsb3Qgb2YgdGhlc2UgY29tbWVudHMuICAKPiA+IAo+ID4gV2VsbCwgc29ycnkg
YWJvdXQgdGhpcy4KPiA+IAo+ID4gSSBtZXQgSmFtZXMgYXQgdGhlIExQQyBsYXN0IHllYXIsIHNv
IGhlIHNlZW1zIHRvIGJlIHN0aWxsIGFyb3VuZCwgaW4KPiA+IHNvbWUgd2F5IGF0IGxlYXN0Li4g
IAo+IAo+IE9uIHRoZSBwcmV2aW91cyBwb3N0aW5nLCBJIHdhbnRlZCBKYW1lcyB0byBjb21tZW50
IG9uIHNvbWUgb2YgdGhlCj4gZmVlZGJhY2sgZnJvbSBKb25hdGhhbiwgYW5kIGRlc3BpdGUgZXhw
bGljaXRseSBhc2tpbmcsIHRoZXJlIGhhcyBiZWVuCj4gbm90aGluZyBidXQgcmFkaW8gc2lsZW5j
ZSBldmVyIHNpbmNlIEphbWVzJyBsYXN0IHBvc3Qgb2YgdGhpcyBzZXJpZXMuCj4gCj4gU28sIEkg
bm93IGRlZW0gdGhpcyB3b3JrIHRvIGJlIGNvbXBsZXRlbHkgZGVhZCBpbiB0aGUgd2F0ZXIsIGFu
ZCBub3QKPiBnb2luZyB0byBoYXBwZW4gLSBub3QgdW5sZXNzIG90aGVycyBjYW4gaW5wdXQgb24g
eW91ciBjb21tZW50cy4KPiAKSSdsbCB0YWtlIGFub3RoZXIgcGFzcyBhdCB0aGlzIGFuZCBzZWUg
d2hpY2ggY29tbWVudHMgSSBjYW4gcmVzb2x2ZS4KV2lsbCBuZWVkIGEgZmV3IGFkZGl0aW9uYWwg
dGVzdCBzZXR1cHMgc28gbWF5IHRha2UgYSBmZXcgZGF5cy4KClNvIGZhciBJJ3ZlIGVzdGFibGlz
aGVkIHRoYXQgUUVNVSB1c2VzIFByb2Nlc3NvciBmb3IgeDg2IGFuZApBQ1BJMDAwNyBmb3IgYXJt
NjQuICBHb29keSwgYXQgbGVhc3QgdGhhdCBzaW1wbGlmaWVzIHRlc3RpbmcKdGhlIHZhcmlvdXMg
b3B0aW9ucy4KCkpvbmF0aGFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
