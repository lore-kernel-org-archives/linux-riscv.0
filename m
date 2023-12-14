Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8993CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm1I9EVK6XyWqANuPp+/iGDE7bVE2WDYjm3plkywTiw=; b=a70FaL2NlFlZrV
	IGhngr6zXwrTv10/UT2azadNZTJLfuprB9s2qHd5Bcbj/uzTXBmsNyj2QBE2m1k4bQ/Z/2M09wK8O
	u33YR4tSbaA6FdNU6x4jSLMxX97/Ns0T8vL8rrpp0xasixo54btTCBmSwypo1+VS7IydHOFxBnvqB
	o9ezfwJfptQE0ksMYWavcV2P8Cfv9uhO2N9KzXaOjdeZ/Kwv5SiuYQ1AtPfk789KyU7wHT/a00mOQ
	kiUmReBB1mzCy1ODjaTrRyiCHiCFnirGuXZlNgP1p18ZZeVFxlpHx3ECFAum9+p9Vk8ATu/njCzxg
	JCu1dqmk45zSROLjMp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqAH-0010IM-1t;
	Thu, 14 Dec 2023 18:10:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDqAD-0010Hd-0q;
	Thu, 14 Dec 2023 18:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F6v3AKzs82rkOxn7Bw7IYQ7aZOZcvY0R37BDizdoEeM=; b=tY1PZOXlkxfPhC2ytAtA0EChgV
	8xCikVzwQf/d2ei3BQiYpgHklnc1tZ55NIOKpAXSmHbLYqZAbjznFALBKmUxTrM4w2RITv7a7Q6XV
	8XubzTsdDZhxlotwEGrTMzdgUb1Yg7n7Iz5rqFqo47poHwJ4ccKf3791BCJtbXIwi8MIlAzn1uWTE
	OOYF2o+5Hj7dg2UbMDFo2mAQX/FDQEqk8jY8NDjlNrtMtGVSQ16JC/qnqo216nVBiSVzT5rfswiQP
	CqIDdHbL71hGf6tFcrchFr7OZ0y0UeWzp4gUjEYw/EhCnmIE43HhXw9gXHQ3o86quWAXEeKRp0wEP
	IVtRjJdA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55476)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rDqA1-0001pW-1e;
	Thu, 14 Dec 2023 18:10:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rDqA2-0002m4-0s; Thu, 14 Dec 2023 18:10:14 +0000
Date: Thu, 14 Dec 2023 18:10:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
 <20231214173241.0000260f@Huawei.com>
 <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_101025_297512_AD749030 
X-CRM114-Status: GOOD (  26.45  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMDY6NDc6MDBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNjozMuKAr1BNIEpvbmF0aGFuIENh
bWVyb24KPiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBX
ZWQsIDEzIERlYyAyMDIzIDEyOjQ5OjE2ICswMDAwCj4gPiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiA+IEZyb206IEphbWVz
IE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gPgo+ID4gPiBUb2RheSB0aGUgQUNQSSBl
bnVtZXJhdGlvbiBjb2RlICd2aXNpdHMnIGFsbCBkZXZpY2VzIHRoYXQgYXJlIHByZXNlbnQuCj4g
PiA+Cj4gPiA+IFRoaXMgaXMgYSBwcm9ibGVtIGZvciBhcm02NCwgd2hlcmUgQ1BVcyBhcmUgYWx3
YXlzIHByZXNlbnQsIGJ1dCBub3QKPiA+ID4gYWx3YXlzIGVuYWJsZWQuIFdoZW4gYSBkZXZpY2Ut
Y2hlY2sgb2NjdXJzIGJlY2F1c2UgdGhlIGZpcm13YXJlLXBvbGljeQo+ID4gPiBoYXMgY2hhbmdl
ZCBhbmQgYSBDUFUgaXMgbm93IGVuYWJsZWQsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzOgo+
ID4gPiB8IGFjcGkgQUNQSTAwMDc6NDg6IEVudW1lcmF0aW9uIGZhaWx1cmUKPiA+ID4KPiA+ID4g
VGhpcyBpcyB1bHRpbWF0ZWx5IGJlY2F1c2UgYWNwaV9kZXZfcmVhZHlfZm9yX2VudW1lcmF0aW9u
KCkgcmV0dXJucwo+ID4gPiB0cnVlIGZvciBhIGRldmljZSB0aGF0IGlzIG5vdCBlbmFibGVkLiBU
aGUgQUNQSSBQcm9jZXNzb3IgZHJpdmVyCj4gPiA+IHdpbGwgbm90IHJlZ2lzdGVyIHN1Y2ggQ1BV
cyBhcyB0aGV5IGFyZSBub3QgJ2RlY29kaW5nIHRoZWlyIHJlc291cmNlcycuCj4gPiA+Cj4gPiA+
IENoYW5nZSBhY3BpX2Rldl9yZWFkeV9mb3JfZW51bWVyYXRpb24oKSB0byBhbHNvIGNoZWNrIHRo
ZSBlbmFibGVkIGJpdC4KPiA+ID4gQUNQSSBhbGxvd3MgYSBkZXZpY2UgdG8gYmUgZnVuY3Rpb25h
bCBpbnN0ZWFkIG9mIG1haW50YWluaW5nIHRoZQo+ID4gPiBwcmVzZW50IGFuZCBlbmFibGVkIGJp
dC4gTWFrZSB0aGlzIGJlaGF2aW91ciBhbiBleHBsaWNpdCBjaGVjayB3aXRoCj4gPiA+IGEgcmVm
ZXJlbmNlIHRvIHRoZSBzcGVjLCBhbmQgdGhlbiBjaGVjayB0aGUgcHJlc2VudCBhbmQgZW5hYmxl
ZCBiaXRzLgo+ID4gPiBUaGlzIGlzIG5lZWRlZCB0byBhdm9pZCBlbnVtZXJhdGluZyBwcmVzZW50
ICYmIGZ1bmN0aW9uYWwgZGV2aWNlcyB0aGF0Cj4gPiA+IGFyZSBub3QgZW5hYmxlZC4KPiA+ID4K
PiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4g
PiA+IFRlc3RlZC1ieTogTWlndWVsIEx1aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gPiA+
IFRlc3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29t
Pgo+ID4gPiBUZXN0ZWQtYnk6IEppYW55b25nIFd1IDxqaWFueW9uZy53dUBhcm0uY29tPgo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrPgo+ID4gPiAtLS0KPiA+ID4gSWYgdGhpcyBjaGFuZ2UgY2F1c2VzIHByb2JsZW1z
IG9uIGRlcGxveWVkIGhhcmR3YXJlLCBJIHN1Z2dlc3QgYW4KPiA+ID4gYXJjaCBvcHQtaW46IEFD
UElfSUdOT1JFX1NUQV9FTkFCTEVELCB0aGF0IGNhdXNlcwo+ID4gPiBhY3BpX2Rldl9yZWFkeV9m
b3JfZW51bWVyYXRpb24oKSB0byBvbmx5IGNoZWNrIHRoZSBwcmVzZW50IGJpdC4KPiA+Cj4gPiBN
eSBndXQgZmVlbGluZyAoaGF2aW5nIG1hZGUgQUNQSSAnZml4ZXMnIGluIHRoZSBwYXN0IHRoYXQg
cmFuIGludG8KPiA+IGhvcnJpYmx5IGJyb2tlbiBmaXJtd2FyZSBhbmQgaGFkIHRvIGJlIHJldmVy
dGVkKSBpcyByZWR1Y2UgdGhlIGJsYXN0Cj4gPiByYWRpdXMgcHJlZW1wdGl2ZWx5IGZyb20gdGhl
IHN0YXJ0LiBJJ2QgbG92ZSB0byBsaXZlIGluIGEgd29ybGQgd2VyZQo+ID4gdGhhdCB3YXNuJ3Qg
bmVjZXNzYXJ5IGJ1dCBJIGRvbid0IHRydXN0IGFsbCB0aGUgZ2VuZXJhdG9ycyBvZiBBQ1BJIHRh
Ymxlcy4KPiA+IEknbGwgbGVhdmUgaXQgdG8gUmFmYWVsIGFuZCBvdGhlciBBQ1BJIGV4cGVydHMg
c3VnZ2VzdCBob3cgbmFycm93IHdlIHNob3VsZAo+ID4gbWFrZSBpdCB0aG91Z2ggLSBhcmNoIG9w
dCBpbiBtaWdodCBiZSBuYXJyb3cgZW5vdWdoLgo+IAo+IEEgY2hpY2tlbiBiaXQgd291bGRuJ3Qg
aGVscCBtdWNoIElNTywgZXNwZWNpYWxseSBpbiB0aGUgY2FzZXMgd2hlbgo+IHdvcmtpbmcgc2V0
dXBzIGdldCBicm9rZW4uCj4gCj4gSSB3b3VsZCB2ZXJ5IG11Y2ggcHJlZmVyIHRvIGxpbWl0IHRo
ZSBzY29wZSBvZiBpdCwgc2F5IHRvIHByb2Nlc3NvcnMKPiBvbmx5LCBpbiB0aGUgZmlyc3QgcGxh
Y2UuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBhbmQgdGhlIGlkZWEuCgpJIGd1ZXNzIHdlIG5l
ZWQgc29tZXRoaW5nIGxpa2U6CgoJaWYgKGRldmljZS0+c3RhdHVzLnByZXNlbnQpCgkJcmV0dXJu
IGRldmljZS0+ZGV2aWNlX3R5cGUgIT0gQUNQSV9CVVNfVFlQRV9QUk9DRVNTT1IgfHwKCQkgICAg
ICAgZGV2aWNlLT5zdGF0dXMuZW5hYmxlZDsKCWVsc2UKCQlyZXR1cm4gZGV2aWNlLT5zdGF0dXMu
ZnVuY3Rpb25hbDsKCnNvIHdlIG9ubHkgY2hlY2sgZGV2aWNlLT5zdGF0dXMuZW5hYmxlZCBmb3Ig
cHJvY2Vzc29yLXR5cGUgZGV2aWNlcz8KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1i
cHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
