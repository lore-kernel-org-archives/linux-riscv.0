Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF104C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 15:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCgpa/2NEy4hcQYPnBCmp15a4j/p3DiOB24eOJ4gLGo=; b=AB0vUP4ar5Ycw4
	pJr8VS54Ee+Ebd6UwWZVOwkv9J7TFAcsKDHa8r1tRvGc5drCm3O76qmqXCMgpFv1GOUk3eaqXAmnj
	Ev5hdrcwKI4g6m52vkZxC78r17DQ4U6LAjJIFzbZkyCF1zmQqaLNSXxlt5egpW/zpSnLBr/G5ywYF
	VcDkyQFKe7EwdmJD1HGm91wfHI4RUNb7H3cuyaWR85gmoTbqFuQG7KsTHyCgcWzhS6LjTjq0CAKMv
	V2qmJi86dPBTYF+b16CS3n0rZe7HVVhBodg9K/NalJWuwCfJ/eaYS0wrhIetai2qhYyO7COazvMyS
	eH7UM7Y0JunGvuZ50Oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJ4x-0036to-0q;
	Fri, 12 Jan 2024 15:04:15 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOJ4s-0036rc-29;
	Fri, 12 Jan 2024 15:04:13 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TBPrs1VcSz6FGMn;
	Fri, 12 Jan 2024 23:02:05 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 445D41400CB;
	Fri, 12 Jan 2024 23:04:01 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Jan
 2024 15:04:00 +0000
Date: Fri, 12 Jan 2024 15:03:59 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	<linux-pm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<x86@kernel.org>, <acpica-devel@lists.linuxfoundation.org>,
	<linux-csky@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-ia64@vger.kernel.org>, <linux-parisc@vger.kernel.org>, Salil Mehta
	<salil.mehta@huawei.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>,
	<jianyong.wu@arm.com>, <justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for
 processors described as container packages
Message-ID: <20240112150359.0000733f@Huawei.com>
In-Reply-To: <CAJZ5v0g2CFPrSfNzHKBz_Spwt304QEQtR6w57VR11i5APPrD8Q@mail.gmail.com>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
	<20240111175908.00002f46@Huawei.com>
	<ZaA3l4yjgCXxSiVg@shell.armlinux.org.uk>
	<20240112092520.00001278@Huawei.com>
	<CAJZ5v0g2CFPrSfNzHKBz_Spwt304QEQtR6w57VR11i5APPrD8Q@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_070411_004229_4AA18ECB 
X-CRM114-Status: GOOD (  41.28  )
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

T24gRnJpLCAxMiBKYW4gMjAyNCAxNjowMTo0MCArMDEwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
YWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0IDEwOjI1
4oCvQU0gSm9uYXRoYW4gQ2FtZXJvbgo+IDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+IHdy
b3RlOgo+ID4KPiA+IE9uIFRodSwgMTEgSmFuIDIwMjQgMTg6NDY6NDcgKzAwMDAKPiA+ICJSdXNz
ZWxsIEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gIAo+
ID4gPiBPbiBUaHUsIEphbiAxMSwgMjAyNCBhdCAwNTo1OTowOFBNICswMDAwLCBKb25hdGhhbiBD
YW1lcm9uIHdyb3RlOiAgCj4gPiA+ID4gT24gTW9uLCAxOCBEZWMgMjAyMyAyMToxNzozNCArMDEw
MAo+ID4gPiA+ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToK
PiA+ID4gPiAgCj4gPiA+ID4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVz
c2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6ICAKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+ICAK
PiA+ID4gPgo+ID4gPiA+IERvbmUgc29tZSBkaWdnaW5nICsgbWFjaGluZSBmYWtpbmcuICBUaGlz
IGlzIG1pZCBzdGFnZSByZXN1bHRzIGF0IGJlc3QuCj4gPiA+ID4KPiA+ID4gPiBTdW1tYXJ5OiBJ
IGRvbid0IHRoaW5rIHRoaXMgcGF0Y2ggaXMgbmVjZXNzYXJ5LiAgSWYgYW55b25lIGhhcHBlbnMg
dG8gYmUgaW4KPiA+ID4gPiB0aGUgbW9vZCBmb3IgdGVzdGluZyBvbiB2YXJpb3VzIHBsYXRmb3Jt
cywgY2FuIHlvdSBkcm9wIHRoaXMgcGF0Y2ggYW5kCj4gPiA+ID4gc2VlIGlmIGV2ZXJ5dGhpbmcg
c3RpbGwgd29ya3MuCj4gPiA+ID4KPiA+ID4gPiBXaXRoIHRoaXMgcGF0Y2ggaW4gcGxhY2UsIGFu
ZCBhIHByb2Nlc3NvciBjb250YWluZXIgY29udGFpbmluZwo+ID4gPiA+IFByb2Nlc3NvcigpIG9i
amVjdHMgYWNwaV9wcm9jZXNzX2FkZCBpcyBjYWxsZWQgdHdpY2UgLSBvbmNlIHZpYQo+ID4gPiA+
IHRoZSBwYXRoIGFkZGVkIGhlcmUgYW5kIG9uY2UgdmlhIGFjcGlfYnVzX2F0dGFjaCBldGMuCj4g
PiA+ID4KPiA+ID4gPiBNYXliZSBpdCdzIGEgbGVmdCBvdmVyIGZyb20gZWFybGllciBhcHByb2Fj
aGVzIHRvIHNvbWUgb2YgdGhpcz8gIAo+ID4gPgo+ID4gPiBGcm9tIHdoYXQgeW91J3JlIHNheWlu
ZywgaXQgc2VlbXMgdGhhdCB3YXkuIEl0IHdvdWxkIGJlIHJlYWxseSBnb29kIHRvCj4gPiA+IGdl
dCBhIHJlcGx5IGZyb20gSmFtZXMgdG8gc2VlIHdoZXRoZXIgaGUgYWdyZWVzIC0gb3IgYXQgbGVh
c3QgZ2V0IHRoZQo+ID4gPiByZWFzb24gd2h5IHRoaXMgcGF0Y2ggaXMgaW4gdGhlIHNlcmllcy4u
LiBidXQgSSBzdXNwZWN0IHRoYXQgd2lsbCBuZXZlcgo+ID4gPiBjb21lLgo+ID4gPiAgCj4gPiA+
ID4gQm90aCBjYXNlcyBhcmUgY292ZXJlZCBieSB0aGUgZXhpc3RpbmcgaGFuZGxpbmcgd2l0aG91
dCB0aGlzLgo+ID4gPiA+Cj4gPiA+ID4gSSdtIGZhciBmcm9tIGNsZWFyIG9uIHdoeSB3ZSBuZWVk
IHRoaXMgcGF0Y2guICBQcmVzdW1hYmx5Cj4gPiA+ID4gaXQncyB0aGUgcmVmZXJlbmNlIGluIHRo
ZSBkZXNjcmlwdGlvbiBvbiBpdCBicmVha2luZyBmb3IKPiA+ID4gPiBQcm9jZXNzb3IgUGFja2Fn
ZSBjb250YWluaW5nIFByb2Nlc3NvcigpIG9iamVjdHMgdGhhdCBtYXR0ZXJzCj4gPiA+ID4gYWZ0
ZXIgYSBtb3ZlLi4uIEknbSBzdHJ1Z2dsaW5nIHRvIGZpbmQgdGhhdCBtb3ZlIHRob3VnaCEgIAo+
ID4gPgo+ID4gPiBJIGRvIGtub3cgdGhhdCBKYW1lcyBkaWQgYSBsb3Qgb2YgdGVzdGluZywgc28g
bWF5YmUgaGUgZm91bmQgc29tZQo+ID4gPiBjb3JuZXIgY2FzZSBzb21ld2hlcmUgd2hpY2ggbWFk
ZSB0aGlzIG5lY2Vzc2FyeSAtIGJ1dCB3aXRob3V0IGlucHV0Cj4gPiA+IGZyb20gSmFtZXMsIHdl
IGNhbid0IGtub3cgdGhhdC4KPiA+ID4KPiA+ID4gU28sIG1heWJlIHRoZSByaWdodCB3YXkgZm9y
d2FyZCBvbiB0aGlzIGlzIHRvIHJlLXRlc3QgdGhlIHNlcmllcwo+ID4gPiB3aXRoIHRoaXMgcGF0
Y2ggZHJvcHBlZCwgYW5kIHNlZSB3aGV0aGVyIHRoZXJlJ3MgYW55IGlsbCBlZmZlY3RzLgo+ID4g
PiBJdCBzaG91bGQgYmUgcG9zc2libGUgdG8gcmVzdXJlY3QgdGhlIHBhdGNoIGlmIGl0IGRvZXMg
dHVybiBvdXQgdG8KPiA+ID4gYmUgbmVjZXNzYXJ5Lgo+ID4gPgo+ID4gPiBEb2VzIHRoYXQgc291
bmQgbGlrZSBhIGdvb2Qgd2F5IGZvcndhcmQ/Cj4gPiA+Cj4gPiA+IFRoYW5rcy4KPiA+ID4gIAo+
ID4KPiA+IFllcyB0aGF0IHNvdW5kcyBsaWtlIHRoZSBiZXN0IHBsYW4uIE5vdGUgdGhpcyBwYXRj
aCBjYW4gb25seSBtYWtlIGEKPiA+IGRpZmZlcmVuY2Ugb24gbm9uIGFybTY0IGFyY2hlcyBiZWNh
dXNlIGl0J3MgYSBmaXJtd2FyZSBidWcgdG8gY29tYmluZQo+ID4gUHJvY2Vzc29yKCkgd2l0aCBh
IEdJQ0MgZW50cnkgaW4gQVBJQy9NQURULiAgVG8gZXZlbiB0ZXN0IG9uIEFSTTY0Cj4gPiB5b3Ug
aGF2ZSB0byBza2lwIHRoZSBidWcgY2hlY2suCj4gPgo+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2FjcGkvcHJvY2Vzc29yX2NvcmUuYyNM
MTAxCj4gPgo+ID4gICAgICAgICAvKiBkZXZpY2VfZGVjbGFyYXRpb24gbWVhbnMgRGV2aWNlIG9i
amVjdCBpbiBEU0RULCBpbiB0aGUKPiA+ICAgICAgICAgICogR0lDIGludGVycnVwdCBtb2RlbCwg
bG9naWNhbCBwcm9jZXNzb3JzIGFyZSByZXF1aXJlZCB0bwo+ID4gICAgICAgICAgKiBoYXZlIGEg
UHJvY2Vzc29yIERldmljZSBvYmplY3QgaW4gdGhlIERTRFQsIHNvIHdlIHNob3VsZAo+ID4gICAg
ICAgICAgKiBjaGVjayBkZXZpY2VfZGVjbGFyYXRpb24gaGVyZQo+ID4gICAgICAgICAgKi8KPiA+
IC8vICAgICAgaWYgKGRldmljZV9kZWNsYXJhdGlvbiAmJiAoZ2ljYy0+dWlkID09IGFjcGlfaWQp
KSB7Cj4gPiAgICAgICAgIGlmIChnaWNjLT51aWQgPT0gYWNwaV9pZCkgewo+ID4gICAgICAgICAg
ICAgICAgICptcGlkciA9IGdpY2MtPmFybV9tcGlkcjsKPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gMDsKPiA+ICAgICAgICAgfQo+ID4KPiA+IE9ubHkgYWx0ZXJuYXRpdmUgaXMgcHJvYmFibHkg
dG8gZ28gaGlzdG9yeSBkaXZpbmcgYW5kIHRyeSBhbmQKPiA+IGZpbmQgYW5vdGhlciBjaGFuZ2Ug
dGhhdCB3b3VsZCBoYXZlIHJlcXVpcmVkIHRoaXMgYW5kIGlzIG5vdyBnb25lLgo+ID4KPiA+IFRo
ZSBBQ1BJIHNjYW5uaW5nIGNvZGUgaGFzIGhhZCBhIGxvdCBvZiBjaGFuZ2VzIHdoaWxzdCB0aGlz
IHdvcmsgaGFzCj4gPiBiZWVuIHVuZGVyd2F5LiAgTW9yZSB0aGFuIHBvc3NpYmxlIHRoYXQgdGhp
cyB3YXMgcGFwZXJpbmcgb3ZlciBzb21lCj4gPiBpc3N1ZSB0aGF0IGhhcyBsb25nIHNpbmNlIGJl
ZW4gZml4ZWQuIEkgY2FuJ3QgZmluZCBhbnkgZGVsaWJlcmF0ZQo+ID4gZnVuY3Rpb25hbCBjaGFu
Z2VzLCBidXQgdGhlcmUgaXMgc29tZSBjb2RlIGdlbmVyYWxpemF0aW9uIHRoYXQgJ21pZ2h0Jwo+
ID4gaGF2ZSBzaWRlIGVmZmVjdHMgaW4gdGhpcyBhcmVhLiBSYWZhZWwsIGFueSBleHBlY3RhdGlv
biB0aGF0IGFueXRoaW5nCj4gPiBjaGFuZ2VkIGluIGhvdyBzY2FubmluZyBwcm9jZXNzb3IgY29u
dGFpbmVycyB3b3Jrcz8gIAo+IAo+IFRoZXJlIGhhdmUgYmVlbiBjaGFuZ2VzLCBidXQgSSBjYW4n
dCByZWNhbGwgd2hlbiBleGFjdGx5IHdpdGhvdXQgc29tZQo+IGdpdCBoaXN0b3J5IHJlc2VhcmNo
Lgo+IAo+IEluIGFueSBjYXNlLCBpdCBpcyBhbHdheXMgYmV0dGVyIHRvIHdvcmsgb24gdG9wIG9m
IHRoZSBjdXJyZW50Cj4gbWFpbmxpbmUgY29kZSBJTU8uCgpBYnNvbHV0ZWx5IC0ganVzdCBpbiB0
aGlzIGNhc2UgdGhlIHNlcmllcyBoYXMgYmVlbiByZWJhc2VkIGZvciAKYSBmZXcgeWVhcnMgYmVj
YXVzZSB0aGUgc3RhbmRhcmRzIGRpc2N1c3Npb25zIHRvb2sgZmFyIGZhciB0b28gbG9uZyEKCkpv
bmF0aGFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
