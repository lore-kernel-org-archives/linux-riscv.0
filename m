Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2EBC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAPmd7abH12otkGfztDLM588ulWUF+kiEHhJs8FlDiU=; b=Qq/BwECGhHMDqp
	v7Fq1RtvS76eLprxWdpCp5Z1aqww7XcgErkcRDN8qr1oim0dYBaAkGBKUXUu07D78ALx5fh9ihvg7
	bKMwv9o8MCek/mkLpiFH7zrfCQah/umKmIJByCIjzrgWdDLCrhQ78jIE1W8/lpmTtp0q6L328p4Yv
	lEBPu5bHQmajysRj8dO9BKNM+VuTQZmSySHpJMIsLlUJ51Bt6KACiWcd6CXXFjlVeZjJSmRb0vWpS
	ud7ix8zlkbuMLec/XwBZ46dugi+dTCeOxt1rpMeWe0g+gOX6dvlkh52Gzu67KgWgFwO73mD9vIAzO
	uq4UAP2xZN2jV5Fn3RoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfvm-008Fxt-06;
	Tue, 02 Jan 2024 14:39:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKfvg-008Fuy-34;
	Tue, 02 Jan 2024 14:39:43 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4T4Fn71b29z6JB5q;
	Tue,  2 Jan 2024 22:37:31 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id CBC821400DB;
	Tue,  2 Jan 2024 22:39:27 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Jan
 2024 14:39:27 +0000
Date: Tue, 2 Jan 2024 14:39:25 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>, "Rafael J. Wysocki"
	<rafael@kernel.org>, <linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <20240102143925.00004361@Huawei.com>
In-Reply-To: <5760569.DvuYhMxLoT@kreacher>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
	<20231215161539.00000940@Huawei.com>
	<5760569.DvuYhMxLoT@kreacher>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_063941_368440_C526960A 
X-CRM114-Status: GOOD (  30.05  )
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

T24gRnJpLCAxNSBEZWMgMjAyMyAyMDo0NzozMSArMDEwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
andAcmp3eXNvY2tpLm5ldD4gd3JvdGU6Cgo+IE9uIEZyaWRheSwgRGVjZW1iZXIgMTUsIDIwMjMg
NToxNTozOSBQTSBDRVQgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToKPiA+IE9uIEZyaSwgMTUgRGVj
IDIwMjMgMTU6MzE6NTUgKzAwMDAKPiA+ICJSdXNzZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBh
cm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gICAKPiA+ID4gT24gVGh1LCBEZWMgMTQsIDIwMjMg
YXQgMDc6Mzc6MTBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6ICAKPiA+ID4gPiBP
biBUaHUsIERlYyAxNCwgMjAyMyBhdCA3OjE24oCvUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZTogICAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBEZWMg
MTQsIDIwMjMgYXQgNzoxMOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo+ID4gPiA+ID4gPGxp
bnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6ICAgIAo+ID4gPiA+ID4gPiBJIGd1ZXNzIHdlIG5l
ZWQgc29tZXRoaW5nIGxpa2U6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICAgICAgaWYgKGRl
dmljZS0+c3RhdHVzLnByZXNlbnQpCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
ZGV2aWNlLT5kZXZpY2VfdHlwZSAhPSBBQ1BJX0JVU19UWVBFX1BST0NFU1NPUiB8fAo+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZS0+c3RhdHVzLmVuYWJsZWQ7Cj4gPiA+
ID4gPiA+ICAgICAgICAgZWxzZQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIGRl
dmljZS0+c3RhdHVzLmZ1bmN0aW9uYWw7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IHNvIHdlIG9u
bHkgY2hlY2sgZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCBmb3IgcHJvY2Vzc29yLXR5cGUgZGV2aWNl
cz8gICAgCj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVzLCBzb21ldGhpbmcgbGlrZSB0aGlzLiAgICAK
PiA+ID4gPiAKPiA+ID4gPiBIb3dldmVyLCB0aGF0IGlzIG5vdCBzdWZmaWNpZW50LCBiZWNhdXNl
IHRoZXJlIGFyZQo+ID4gPiA+IEFDUElfQlVTX1RZUEVfREVWSUNFIGRldmljZXMgcmVwcmVzZW50
aW5nIHByb2Nlc3NvcnMuCj4gPiA+ID4gCj4gPiA+ID4gSSdtIG5vdCBzdXJlIGFib3V0IGEgY2xl
YW4gd2F5IHRvIGRvIGl0IEFUTS4gICAgCj4gPiA+IAo+ID4gPiBPaywgaG93IGFib3V0Ogo+ID4g
PiAKPiA+ID4gc3RhdGljIGJvb2wgYWNwaV9kZXZfaXNfcHJvY2Vzc29yKGNvbnN0IHN0cnVjdCBh
Y3BpX2RldmljZSAqZGV2aWNlKQo+ID4gPiB7Cj4gPiA+IAlzdHJ1Y3QgYWNwaV9oYXJkd2FyZV9p
ZCAqaHdpZDsKPiA+ID4gCj4gPiA+IAlpZiAoZGV2aWNlLT5kZXZpY2VfdHlwZSA9PSBBQ1BJX0JV
U19UWVBFX1BST0NFU1NPUikKPiA+ID4gCQlyZXR1cm4gdHJ1ZTsKPiA+ID4gCj4gPiA+IAlpZiAo
ZGV2aWNlLT5kZXZpY2VfdHlwZSAhPSBBQ1BJX0JVU19UWVBFX0RFVklDRSkKPiA+ID4gCQlyZXR1
cm4gZmFsc2U7Cj4gPiA+IAo+ID4gPiAJbGlzdF9mb3JfZWFjaF9lbnRyeShod2lkLCAmZGV2aWNl
LT5wbnAuaWRzLCBsaXN0KQo+ID4gPiAJCWlmICghc3RyY21wKEFDUElfUFJPQ0VTU09SX09CSkVD
VF9ISUQsIGh3aWQtPmlkKSB8fAo+ID4gPiAJCSAgICAhc3RyY21wKEFDUElfUFJPQ0VTU09SX0RF
VklDRV9ISUQsIGh3aWQtPmlkKSkKPiA+ID4gCQkJcmV0dXJuIHRydWU7Cj4gPiA+IAo+ID4gPiAJ
cmV0dXJuIGZhbHNlOwo+ID4gPiB9Cj4gPiA+IAo+ID4gPiBhbmQgdGhlbjoKPiA+ID4gCj4gPiA+
IAlpZiAoZGV2aWNlLT5zdGF0dXMucHJlc2VudCkKPiA+ID4gCQlyZXR1cm4gIWFjcGlfZGV2X2lz
X3Byb2Nlc3NvcihkZXZpY2UpIHx8IGRldmljZS0+c3RhdHVzLmVuYWJsZWQ7Cj4gPiA+IAllbHNl
Cj4gPiA+IAkJcmV0dXJuIGRldmljZS0+c3RhdHVzLmZ1bmN0aW9uYWw7Cj4gPiA+IAo+ID4gPiA/
Cj4gPiA+ICAgCj4gPiBDaGFuZ2luZyBpdCB0byBDUFUgb25seSBmb3Igbm93IG1ha2VzIHNlbnNl
IHRvIG1lIGFuZCBJIHRoaW5rIHRoaXMgY29kZSBzbmlwcGV0IHNob3VsZCBkbyB0aGUKPiA+IGpv
Yi4gIE5pY2UgYW5kIHNpbXBsZS4gIAo+IAo+IFdlbGwsIGV4Y2VwdCB0aGF0IGl0IGRvZXMgY2hl
Y2tzIHRoYXQgYXJlIGRvbmUgZWxzZXdoZXJlIHNsaWdodGx5Cj4gZGlmZmVyZW50bHksIHdoaWNo
IGZyb20gdGhlIG1haW50ZW5hbmNlIFBPViBpcyBub3QgbmljZS4KPiAKPiBNYXliZSBzb21ldGhp
bmcgbGlrZSB0aGUgYXBwZW5kZWQgcGF0Y2ggKHVudGVzdGVkKS4KCkhpIFJhZmFlbCwKCkFzIGZh
ciBhcyBJIGNhbiBzZWUgdGhhdCdzIGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50LCBzbyBsb29rcyBn
b29kIHRvIG1lLgpJJ20gbm90IHNldCB1cCB0byB0ZXN0IHRoaXMgdG9kYXkgdGhvdWdoLCBzbyB3
aWxsIGRlZmVyIHRvIFJ1c3NlbGwgb24gd2hldGhlcgp0aGVyZSBpcyBhbnl0aGluZyBtaXNzaW5n
CgpUaGFua3MgZm9yIHB1dHRpbmcgdGhpcyB0b2dldGhlci4KCkpvbmF0aGFuCgo+IAo+IC0tLQo+
ICBkcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYyB8ICAgMTEgKysrKysrKysrKysKPiAgZHJp
dmVycy9hY3BpL2ludGVybmFsLmggICAgICAgfCAgICAzICsrKwo+ICBkcml2ZXJzL2FjcGkvc2Nh
bi5jICAgICAgICAgICB8ICAgMjQgKysrKysrKysrKysrKysrKysrKysrKystCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IEluZGV4OiBsaW51
eC1wbS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAtLS0gbGlu
dXgtcG0ub3JpZy9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ICsrKyBsaW51eC1wbS9k
cml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+IEBAIC02NDQsNiArNjQ0LDE3IEBAIHN0YXRp
YyBzdHJ1Y3QgYWNwaV9zY2FuX2hhbmRsZXIgcHJvY2Vzc28KPiAgCX0sCj4gIH07Cj4gIAo+ICti
b29sIGFjcGlfZGV2aWNlX2lzX3Byb2Nlc3Nvcihjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFk
ZXYpCj4gK3sKPiArCWlmIChhZGV2LT5kZXZpY2VfdHlwZSA9PSBBQ1BJX0JVU19UWVBFX1BST0NF
U1NPUikKPiArCQlyZXR1cm4gdHJ1ZTsKPiArCj4gKwlpZiAoYWRldi0+ZGV2aWNlX3R5cGUgIT0g
QUNQSV9CVVNfVFlQRV9ERVZJQ0UpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCXJldHVybiBh
Y3BpX3NjYW5fY2hlY2tfaGFuZGxlcihhZGV2LCAmcHJvY2Vzc29yX2hhbmRsZXIpOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW50IGFjcGlfcHJvY2Vzc29yX2NvbnRhaW5lcl9hdHRhY2goc3RydWN0IGFj
cGlfZGV2aWNlICpkZXYsCj4gIAkJCQkJICAgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkICpp
ZCkKPiAgewo+IEluZGV4OiBsaW51eC1wbS9kcml2ZXJzL2FjcGkvaW50ZXJuYWwuaAo+ID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KPiAtLS0gbGludXgtcG0ub3JpZy9kcml2ZXJzL2FjcGkvaW50ZXJuYWwuaAo+ICsrKyBs
aW51eC1wbS9kcml2ZXJzL2FjcGkvaW50ZXJuYWwuaAo+IEBAIC02Miw2ICs2Miw4IEBAIHZvaWQg
YWNwaV9zeXNmc19hZGRfaG90cGx1Z19wcm9maWxlKHN0cnUKPiAgaW50IGFjcGlfc2Nhbl9hZGRf
aGFuZGxlcl93aXRoX2hvdHBsdWcoc3RydWN0IGFjcGlfc2Nhbl9oYW5kbGVyICpoYW5kbGVyLAo+
ICAJCQkJICAgICAgIGNvbnN0IGNoYXIgKmhvdHBsdWdfcHJvZmlsZV9uYW1lKTsKPiAgdm9pZCBh
Y3BpX3NjYW5faG90cGx1Z19lbmFibGVkKHN0cnVjdCBhY3BpX2hvdHBsdWdfcHJvZmlsZSAqaG90
cGx1ZywgYm9vbCB2YWwpOwo+ICtib29sIGFjcGlfc2Nhbl9jaGVja19oYW5kbGVyKGNvbnN0IHN0
cnVjdCBhY3BpX2RldmljZSAqYWRldiwKPiArCQkJICAgICBzdHJ1Y3QgYWNwaV9zY2FuX2hhbmRs
ZXIgKmhhbmRsZXIpOwo+ICAKPiAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+ICBleHRlcm4gc3Ry
dWN0IGRlbnRyeSAqYWNwaV9kZWJ1Z2ZzX2RpcjsKPiBAQCAtMTMzLDYgKzEzNSw3IEBAIGludCBh
Y3BpX2J1c19yZWdpc3Rlcl9lYXJseV9kZXZpY2UoaW50IHQKPiAgY29uc3Qgc3RydWN0IGFjcGlf
ZGV2aWNlICphY3BpX2NvbXBhbmlvbl9tYXRjaChjb25zdCBzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+
ICBpbnQgX19hY3BpX2RldmljZV91ZXZlbnRfbW9kYWxpYXMoY29uc3Qgc3RydWN0IGFjcGlfZGV2
aWNlICphZGV2LAo+ICAJCQkJICBzdHJ1Y3Qga29ial91ZXZlbnRfZW52ICplbnYpOwo+ICtib29s
IGFjcGlfZGV2aWNlX2lzX3Byb2Nlc3Nvcihjb25zdCBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYp
Owo+ICAKPiAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFBvd2VyIFJlc291cmNlCj4gSW5kZXg6IGxpbnV4LXBtL2RyaXZlcnMvYWNwaS9z
Y2FuLmMKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4gLS0tIGxpbnV4LXBtLm9yaWcvZHJpdmVycy9hY3BpL3NjYW4u
Ywo+ICsrKyBsaW51eC1wbS9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gQEAgLTE5MzgsNiArMTkzOCwx
OSBAQCBzdGF0aWMgYm9vbCBhY3BpX3NjYW5faGFuZGxlcl9tYXRjaGluZyhzCj4gIAlyZXR1cm4g
ZmFsc2U7Cj4gIH0KPiAgCj4gK2Jvb2wgYWNwaV9zY2FuX2NoZWNrX2hhbmRsZXIoY29uc3Qgc3Ry
dWN0IGFjcGlfZGV2aWNlICphZGV2LAo+ICsJCQkgICAgIHN0cnVjdCBhY3BpX3NjYW5faGFuZGxl
ciAqaGFuZGxlcikKPiArewo+ICsJc3RydWN0IGFjcGlfaGFyZHdhcmVfaWQgKmh3aWQ7Cj4gKwo+
ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShod2lkLCAmYWRldi0+cG5wLmlkcywgbGlzdCkgewo+ICsJ
CWlmIChhY3BpX3NjYW5faGFuZGxlcl9tYXRjaGluZyhoYW5kbGVyLCBod2lkLT5pZCwgTlVMTCkp
Cj4gKwkJCXJldHVybiB0cnVlOwo+ICsJfQo+ICsKPiArCXJldHVybiBmYWxzZTsKPiArfQo+ICsK
PiAgc3RhdGljIHN0cnVjdCBhY3BpX3NjYW5faGFuZGxlciAqYWNwaV9zY2FuX21hdGNoX2hhbmRs
ZXIoY29uc3QgY2hhciAqaWRzdHIsCj4gIAkJCQkJY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lk
ICoqbWF0Y2hpZCkKPiAgewo+IEBAIC0yNDEwLDcgKzI0MjMsMTYgQEAgYm9vbCBhY3BpX2Rldl9y
ZWFkeV9mb3JfZW51bWVyYXRpb24oY29ucwo+ICAJaWYgKGRldmljZS0+ZmxhZ3MuaG9ub3JfZGVw
cyAmJiBkZXZpY2UtPmRlcF91bm1ldCkKPiAgCQlyZXR1cm4gZmFsc2U7Cj4gIAo+IC0JcmV0dXJu
IGFjcGlfZGV2aWNlX2lzX3ByZXNlbnQoZGV2aWNlKTsKPiArCWlmIChkZXZpY2UtPnN0YXR1cy5m
dW5jdGlvbmFsKQo+ICsJCXJldHVybiB0cnVlOwo+ICsKPiArCWlmICghZGV2aWNlLT5zdGF0dXMu
cHJlc2VudCkKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJaWYgKGRldmljZS0+c3RhdHVzLmVu
YWJsZWQpCj4gKwkJcmV0dXJuIHRydWU7IC8qIEZhc3QgcGF0aC4gKi8KPiArCj4gKwlyZXR1cm4g
IWFjcGlfZGV2aWNlX2lzX3Byb2Nlc3NvcihkZXZpY2UpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xf
R1BMKGFjcGlfZGV2X3JlYWR5X2Zvcl9lbnVtZXJhdGlvbik7Cj4gIAo+IAo+IAo+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
