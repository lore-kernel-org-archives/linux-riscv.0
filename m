Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179D0C47DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFdKvfACDXAUDPK3BOP5UOayGl1NEppizpzVOYkVZOY=; b=cCQfOibL6I3EOA
	MxFNztsMlI+8Hhrs/auYLPPxQWTzJI97p6WXkRX/pfzvtHMXtm69RR0IQZpMRbNx6tbT/As9Ipooj
	eRXnjuli3wF1mhggEAxexo8lKSjfzOknvSpmp55phVmdC7QMSf2xI534qgK7TIGcTCL+5ZdCywSGE
	gP82VVEsqzxXAK0TlxeOzsCh8sDNtCjiinba5uVcNDhY2BvA4tDUIXT7qKWO8Pz5RslgNiXXGCQgH
	Y7RuHmaIXgnU3009rfl81CadEDDjDXjxXrBFgTNYcKGZpD8PtkRxyszQSczjRk0QTpaRqFQUvT29y
	5slJwP+WhcTDZKDI8LEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyaw-00DOPB-32;
	Mon, 22 Jan 2024 18:00:26 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyas-00DON7-1w;
	Mon, 22 Jan 2024 18:00:25 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TJdGS60Srz67ZCr;
	Tue, 23 Jan 2024 01:57:20 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id DA1F61400F4;
	Tue, 23 Jan 2024 02:00:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 18:00:14 +0000
Date: Mon, 22 Jan 2024 18:00:13 +0000
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
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include
 'present'
Message-ID: <20240122180013.000016d5@Huawei.com>
In-Reply-To: <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
	<CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100022_923965_9B0FD039 
X-CRM114-Status: GOOD (  21.59  )
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

T24gTW9uLCAxOCBEZWMgMjAyMyAyMTozNToxNiArMDEwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
YWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDni
gK9QTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+
Cj4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+Cj4gPiBUaGUg
Y29kZSBiZWhpbmQgQUNQSV9IT1RQTFVHX0NQVSBhbGxvd3MgYSBub3QtcHJlc2VudCBDUFUgdG8g
YmVjb21lCj4gPiBwcmVzZW50LiAgCj4gCj4gUmlnaHQuCj4gCj4gPiBUaGlzIGlzbid0IHRoZSBv
bmx5IHVzZSBvZiBIT1RQTFVHX0NQVS4gT24gYXJtNjQgYW5kIHJpc2N2Cj4gPiBDUFVzIGNhbiBi
ZSB0YWtlbiBvZmZsaW5lIGFzIGEgcG93ZXIgc2F2aW5nIG1lYXN1cmUuICAKPiAKPiBCdXQgc3Rp
bGwgdGhlcmUgaXMgdGhlIGNhc2UgaW4gd2hpY2ggYSBub24tcHJlc2VudCBDUFUgY2FuIGJlY29t
ZQo+IHByZXNlbnQsIGlzbid0IGl0IHRoZXJlPwoKTm90IHlldCBkZWZpbmVkIGJ5IHRoZSBhcmNo
aXRlY3R1cmVzIChhbmQgSSdtIGFzc3VtaW5nIGl0IHByb2JhYmx5IG5ldmVyIHdpbGwgYmUpLgoK
VGhlIG9yaWdpbmFsIHByb3Bvc2FsIHdlIHRvb2sgdG8gQVJNIHdhcyB0byBkbyBleGFjdGx5IHRo
YXQgLSB0aGV5IHB1c2hlZApiYWNrIGhhcmQgb24gdGhlIGJhc2lzIHRoZXJlIHdhcyBubyBhcmNo
aXRlY3R1cmFsbHkgc2FmZSB3YXkgdG8gaW1wbGVtZW50IGl0LgpUb28gbXVjaCBvZiB0aGUgQVJN
IGFyY2ggaGFzIHRvIGV4aXN0IGZyb20gdGhlIHN0YXJ0IG9mIHRpbWUuCgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsL2NiYWE2ZDY4LTYxNDMtZTAxMC01ZjNjLWVjNjJm
ODc5YWQ5NUBhcm0uY29tLwppcyBvbmUgb2YgdGhlIHJlbGV2YW50IHRocmVhZHMgb2YgdGhlIGtl
cm5lbCBzaWRlIG9mIHRoYXQgZGlzY3Vzc2lvbi4KCk5vdCB0byBwdXQgc3BlY2lmaWMgd29yZHMg
aW50byB0aGUgQVJNIGFyY2hpdGVjdHMgbW91dGhzLCBidXQgdGhlCnNob3J0IGRlc2NyaXB0aW9u
IGlzIHRoYXQgdGhlcmUgaXMgY3VycmVudGx5IG5vIGRlbWFuZCBmb3Igd29ya2luZwpvdXQgaG93
IHRvIG1ha2UgcGh5c2ljYWwgQ1BVIGhvdHBsdWcgcG9zc2libGUsIGFzIHN1Y2ggdGhleSB3aWxs
IG5vdApwcm92aWRlIGFuIGFyY2hpdGVjdHVyYWxseSBjb21wbGlhbnQgd2F5IHRvIGRvIGl0IGZv
ciB2aXJ0dWFsIENQVSBob3RwbHVnIGFuZAphbm90aGVyIG1lYW5zIGlzIG5lZWRlZCAod2hpY2gg
aXMgd2h5IHRoaXMgc2VyaWVzIGRvZXNuJ3QgdXNlIHRoZSBwcmVzZW50IGJpdApmb3IgdGhhdCBw
dXJwb3NlIGFuZCB3ZSBoYXZlIHRoZSBPbmxpbmUgY2FwYWJsZSBiaXQgaW4gTUFEVC9HSUNDKQoK
SXQgd2FzIGEgJ2Z1bicgZGFuY2Ugb2Ygc2V2ZXJhbCB5ZWFycyB0byBnZXQgdG8gdGhhdCBjbGFy
aWZpY2F0aW9uLgpBcyBhbm90aGVyIGZ1biBmYWN0LCB0aGUgc2FtZSBpcyBkZWZpbmVkIGZvciB4
ODYsIGJ1dCBJIGRvbid0IHRoaW5rCmFueW9uZSBoYXMgdXNlZCBpdCB5ZXQgKEdJQ0MgZm9yIEFS
TSBoYXMgYW4gb25saW5lIGNhcGFibGUgYml0IGluIHRoZSBmbGFncyB0bwplbmFibGUgdGhpcywg
d2hpY2ggd2FzIHJlbWFya2FibHkgc2ltaWxhciB0byB0aGUgb25saW5lIGNhcGFibGUgYml0IGlu
IHRoZQpmbGFncyBvZiB0aGUgTG9jYWwgQVBJQyBlbnRyaWVzIGFzIGFkZGVkIGZhaXJseSByZWNl
bnRseSkuCgo+IAo+ID4gT24gYXJtNjQgYW4gb2ZmbGluZSBDUFUgbWF5IGJlIGRpc2FibGVkIGJ5
IGZpcm13YXJlLCBwcmV2ZW50aW5nIGl0IGZyb20KPiA+IGJlaW5nIGJyb3VnaHQgYmFjayBvbmxp
bmUsIGJ1dCBpdCByZW1haW5zIHByZXNlbnQgdGhyb3VnaG91dC4KPiA+Cj4gPiBBZGRpbmcgY29k
ZSB0byBwcmV2ZW50IHVzZXItc3BhY2UgdHJ5aW5nIHRvIG9ubGluZSB0aGVzZSBkaXNhYmxlZCBD
UFVzCj4gPiBuZWVkcyBzb21lIGFkZGl0aW9uYWwgdGVybWlub2xvZ3kuCj4gPgo+ID4gUmVuYW1l
IHRoZSBLY29uZmlnIHN5bWJvbCBDT05GSUdfQUNQSV9IT1RQTFVHX1BSRVNFTlRfQ1BVIHRvIHJl
ZmxlY3QKPiA+IHRoYXQgaXQgbWFrZXMgcG9zc2libGUgQ1BVcyBwcmVzZW50LiAgCj4gCj4gSG9u
ZXN0bHksIEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGNoYW5nZSBpcyBuZWNlc3Nhcnkgb3IgZXZl
biB1c2VmdWwuCgpXaGlsc3QgaXQncyBhbiBhdHRlbXB0IHRvIGF2b2lkIGZ1dHVyZSBjb25mdXNp
b24sIHRoZSByZW5hbWUgaXMKbm90IHNvbWV0aGluZyBJIHJlYWxseSBjYXJlIGFib3V0IHNvIG15
IGFkdmljZSB0byBSdXNzZWxsIGlzIGRyb3AKaXQgdW5sZXNzIHlvdSBhcmUgYXR0YWNoZWQgdG8g
aXQhCgpKb25hdGhhbgoKCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
