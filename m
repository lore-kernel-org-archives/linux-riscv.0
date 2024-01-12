Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A34C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLzHKfMHcLHTA8B7O1lX/BzgqZUi5D10OR/Tip41Hec=; b=yTPoRNoNfrIc7h
	mRnf1AWmuhSFcokHK9eNP35XthNGoWM8lK7lusCB2ulvo1cHFxinjoV4ulski5WZNI5zVs9YYqGO0
	MHV0xVO867DpF0mP5qqdC5NdfaoS5fls48/MWrUIzoQzAogzI5f4tQ1c/RZsWov0KlK4HAMzE2Kpn
	oIeVhpIINrPlRP8RE/yTukEq0rDdCOmke5KECPu2or4RRY8YHY+iZbBvKhS8+R3p3RzFc9L4jVYjW
	wruDMDSlAyJZjd+ZSdKW1hq082RbKB4YvK0wYHxI2Q4Dp+fd3W09sHMbk75EOByA4/DICGfgTJrQF
	awA/p6F1a/SDhdtuuP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rODnJ-002JdQ-2l;
	Fri, 12 Jan 2024 09:25:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rODnD-002JXY-1P;
	Fri, 12 Jan 2024 09:25:37 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TBGL62L2Wz6J69M;
	Fri, 12 Jan 2024 17:23:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A8B6140A36;
	Fri, 12 Jan 2024 17:25:21 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Jan
 2024 09:25:20 +0000
Date: Fri, 12 Jan 2024 09:25:20 +0000
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
Message-ID: <20240112092520.00001278@Huawei.com>
In-Reply-To: <ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
	<20240111175908.00002f46@Huawei.com>
	<ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_012535_781670_57E4DBAF 
X-CRM114-Status: GOOD (  28.83  )
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

T24gVGh1LCAxMSBKYW4gMjAyNCAxODo0Njo0NyArMDAwMAoiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gT24gVGh1LCBKYW4gMTEsIDIwMjQg
YXQgMDU6NTk6MDhQTSArMDAwMCwgSm9uYXRoYW4gQ2FtZXJvbiB3cm90ZToKPiA+IE9uIE1vbiwg
MTggRGVjIDIwMjMgMjE6MTc6MzQgKzAxMDAKPiA+ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ICAgCj4gPiA+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0
IDE6NDnigK9QTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90
ZTogIAo+ID4gPiA+Cj4gPiA+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5j
b20+ICAKPiA+IAo+ID4gRG9uZSBzb21lIGRpZ2dpbmcgKyBtYWNoaW5lIGZha2luZy4gIFRoaXMg
aXMgbWlkIHN0YWdlIHJlc3VsdHMgYXQgYmVzdC4KPiA+IAo+ID4gU3VtbWFyeTogSSBkb24ndCB0
aGluayB0aGlzIHBhdGNoIGlzIG5lY2Vzc2FyeS4gIElmIGFueW9uZSBoYXBwZW5zIHRvIGJlIGlu
Cj4gPiB0aGUgbW9vZCBmb3IgdGVzdGluZyBvbiB2YXJpb3VzIHBsYXRmb3JtcywgY2FuIHlvdSBk
cm9wIHRoaXMgcGF0Y2ggYW5kCj4gPiBzZWUgaWYgZXZlcnl0aGluZyBzdGlsbCB3b3Jrcy4KPiA+
IAo+ID4gV2l0aCB0aGlzIHBhdGNoIGluIHBsYWNlLCBhbmQgYSBwcm9jZXNzb3IgY29udGFpbmVy
IGNvbnRhaW5pbmcKPiA+IFByb2Nlc3NvcigpIG9iamVjdHMgYWNwaV9wcm9jZXNzX2FkZCBpcyBj
YWxsZWQgdHdpY2UgLSBvbmNlIHZpYQo+ID4gdGhlIHBhdGggYWRkZWQgaGVyZSBhbmQgb25jZSB2
aWEgYWNwaV9idXNfYXR0YWNoIGV0Yy4KPiA+IAo+ID4gTWF5YmUgaXQncyBhIGxlZnQgb3ZlciBm
cm9tIGVhcmxpZXIgYXBwcm9hY2hlcyB0byBzb21lIG9mIHRoaXM/ICAKPiAKPiBGcm9tIHdoYXQg
eW91J3JlIHNheWluZywgaXQgc2VlbXMgdGhhdCB3YXkuIEl0IHdvdWxkIGJlIHJlYWxseSBnb29k
IHRvCj4gZ2V0IGEgcmVwbHkgZnJvbSBKYW1lcyB0byBzZWUgd2hldGhlciBoZSBhZ3JlZXMgLSBv
ciBhdCBsZWFzdCBnZXQgdGhlCj4gcmVhc29uIHdoeSB0aGlzIHBhdGNoIGlzIGluIHRoZSBzZXJp
ZXMuLi4gYnV0IEkgc3VzcGVjdCB0aGF0IHdpbGwgbmV2ZXIKPiBjb21lLgo+IAo+ID4gQm90aCBj
YXNlcyBhcmUgY292ZXJlZCBieSB0aGUgZXhpc3RpbmcgaGFuZGxpbmcgd2l0aG91dCB0aGlzLgo+
ID4gCj4gPiBJJ20gZmFyIGZyb20gY2xlYXIgb24gd2h5IHdlIG5lZWQgdGhpcyBwYXRjaC4gIFBy
ZXN1bWFibHkKPiA+IGl0J3MgdGhlIHJlZmVyZW5jZSBpbiB0aGUgZGVzY3JpcHRpb24gb24gaXQg
YnJlYWtpbmcgZm9yCj4gPiBQcm9jZXNzb3IgUGFja2FnZSBjb250YWluaW5nIFByb2Nlc3Nvcigp
IG9iamVjdHMgdGhhdCBtYXR0ZXJzCj4gPiBhZnRlciBhIG1vdmUuLi4gSSdtIHN0cnVnZ2xpbmcg
dG8gZmluZCB0aGF0IG1vdmUgdGhvdWdoISAgCj4gCj4gSSBkbyBrbm93IHRoYXQgSmFtZXMgZGlk
IGEgbG90IG9mIHRlc3RpbmcsIHNvIG1heWJlIGhlIGZvdW5kIHNvbWUKPiBjb3JuZXIgY2FzZSBz
b21ld2hlcmUgd2hpY2ggbWFkZSB0aGlzIG5lY2Vzc2FyeSAtIGJ1dCB3aXRob3V0IGlucHV0Cj4g
ZnJvbSBKYW1lcywgd2UgY2FuJ3Qga25vdyB0aGF0Lgo+IAo+IFNvLCBtYXliZSB0aGUgcmlnaHQg
d2F5IGZvcndhcmQgb24gdGhpcyBpcyB0byByZS10ZXN0IHRoZSBzZXJpZXMKPiB3aXRoIHRoaXMg
cGF0Y2ggZHJvcHBlZCwgYW5kIHNlZSB3aGV0aGVyIHRoZXJlJ3MgYW55IGlsbCBlZmZlY3RzLgo+
IEl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byByZXN1cmVjdCB0aGUgcGF0Y2ggaWYgaXQgZG9lcyB0
dXJuIG91dCB0bwo+IGJlIG5lY2Vzc2FyeS4KPiAKPiBEb2VzIHRoYXQgc291bmQgbGlrZSBhIGdv
b2Qgd2F5IGZvcndhcmQ/Cj4gCj4gVGhhbmtzLgo+IAoKWWVzIHRoYXQgc291bmRzIGxpa2UgdGhl
IGJlc3QgcGxhbi4gTm90ZSB0aGlzIHBhdGNoIGNhbiBvbmx5IG1ha2UgYQpkaWZmZXJlbmNlIG9u
IG5vbiBhcm02NCBhcmNoZXMgYmVjYXVzZSBpdCdzIGEgZmlybXdhcmUgYnVnIHRvIGNvbWJpbmUK
UHJvY2Vzc29yKCkgd2l0aCBhIEdJQ0MgZW50cnkgaW4gQVBJQy9NQURULiAgVG8gZXZlbiB0ZXN0
IG9uIEFSTTY0CnlvdSBoYXZlIHRvIHNraXAgdGhlIGJ1ZyBjaGVjay4KCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9j
b3JlLmMjTDEwMQoKCS8qIGRldmljZV9kZWNsYXJhdGlvbiBtZWFucyBEZXZpY2Ugb2JqZWN0IGlu
IERTRFQsIGluIHRoZQoJICogR0lDIGludGVycnVwdCBtb2RlbCwgbG9naWNhbCBwcm9jZXNzb3Jz
IGFyZSByZXF1aXJlZCB0bwoJICogaGF2ZSBhIFByb2Nlc3NvciBEZXZpY2Ugb2JqZWN0IGluIHRo
ZSBEU0RULCBzbyB3ZSBzaG91bGQKCSAqIGNoZWNrIGRldmljZV9kZWNsYXJhdGlvbiBoZXJlCgkg
Ki8KLy8JaWYgKGRldmljZV9kZWNsYXJhdGlvbiAmJiAoZ2ljYy0+dWlkID09IGFjcGlfaWQpKSB7
CglpZiAoZ2ljYy0+dWlkID09IGFjcGlfaWQpIHsKCQkqbXBpZHIgPSBnaWNjLT5hcm1fbXBpZHI7
CgkJcmV0dXJuIDA7Cgl9CgpPbmx5IGFsdGVybmF0aXZlIGlzIHByb2JhYmx5IHRvIGdvIGhpc3Rv
cnkgZGl2aW5nIGFuZCB0cnkgYW5kCmZpbmQgYW5vdGhlciBjaGFuZ2UgdGhhdCB3b3VsZCBoYXZl
IHJlcXVpcmVkIHRoaXMgYW5kIGlzIG5vdyBnb25lLgoKVGhlIEFDUEkgc2Nhbm5pbmcgY29kZSBo
YXMgaGFkIGEgbG90IG9mIGNoYW5nZXMgd2hpbHN0IHRoaXMgd29yayBoYXMKYmVlbiB1bmRlcndh
eS4gIE1vcmUgdGhhbiBwb3NzaWJsZSB0aGF0IHRoaXMgd2FzIHBhcGVyaW5nIG92ZXIgc29tZQpp
c3N1ZSB0aGF0IGhhcyBsb25nIHNpbmNlIGJlZW4gZml4ZWQuIEkgY2FuJ3QgZmluZCBhbnkgZGVs
aWJlcmF0ZQpmdW5jdGlvbmFsIGNoYW5nZXMsIGJ1dCB0aGVyZSBpcyBzb21lIGNvZGUgZ2VuZXJh
bGl6YXRpb24gdGhhdCAnbWlnaHQnCmhhdmUgc2lkZSBlZmZlY3RzIGluIHRoaXMgYXJlYS4gUmFm
YWVsLCBhbnkgZXhwZWN0YXRpb24gdGhhdCBhbnl0aGluZwpjaGFuZ2VkIGluIGhvdyBzY2Fubmlu
ZyBwcm9jZXNzb3IgY29udGFpbmVycyB3b3Jrcz8KCkpvbmF0aGFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
