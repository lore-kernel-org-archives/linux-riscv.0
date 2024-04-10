Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2153CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/b9FYYPiV89A0p1qCbpn/kABxb0VzkJ1gAeNxu0Ets=; b=Moy7SKAiHlAdsz
	K43dZHB7ME5hbTgbkWbRrAWGWUs08KjrbNLlRM93zaVeHDHDv/f+U0M1c6qDiihsmf0AopDXXN92x
	+Ns3sTz+0EiAsAniqN3/vDlu79wjIgsOY3vIYIg2LzhBVWqtp47i74vuxs+0a+xuFbTRI/Z1slwi/
	pAfkkTiF+/EyTGLjXiQ2sel3EMHcgEgMTFWGxeugUA/9LrAYFXKQlLGg9zivVm4EdZgbIaUJRCoWA
	I21g2uMVWluENGpObC2neSKB1e7fJek7BnU5jMJ+7wIHKi8dJ2Rr2d1uvHp+NjwZMXOY5XPD8UdLZ
	Pwy3QV+5QwEQgxekpgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYLD-00000007HvT-1gsX;
	Wed, 10 Apr 2024 13:50:19 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruYL8-00000007Hsd-15G4;
	Wed, 10 Apr 2024 13:50:16 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VF3xC2BRXz6K6f2;
	Wed, 10 Apr 2024 21:45:19 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B565C1400CA;
	Wed, 10 Apr 2024 21:50:06 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 14:50:06 +0100
Date: Wed, 10 Apr 2024 14:50:05 +0100
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
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
Message-ID: <20240410145005.00003050@Huawei.com>
In-Reply-To: <CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
	<E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
	<CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
	<20240322185327.00002416@Huawei.com>
	<20240410134318.0000193c@huawei.com>
	<CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_065014_655431_1AFB5EC2 
X-CRM114-Status: GOOD (  34.37  )
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

T24gV2VkLCAxMCBBcHIgMjAyNCAxNToyODoxOCArMDIwMAoiUmFmYWVsIEouIFd5c29ja2kiIDxy
YWZhZWxAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgQXByIDEwLCAyMDI0IGF0IDI6NDPi
gK9QTSBKb25hdGhhbiBDYW1lcm9uCj4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4gPiAgCj4gPiA+ID4gIAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9j
cHUuYyBiL2RyaXZlcnMvYmFzZS9jcHUuYwo+ID4gPiA+ID4gaW5kZXggNDdkZTBmMTQwYmE2Li4x
M2QwNTJiZjEzZjQgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Jhc2UvY3B1LmMKPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvYmFzZS9jcHUuYwo+ID4gPiA+ID4gQEAgLTU1Myw3ICs1NTMs
MTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYyh2b2lkKQo+
ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgICAgaW50IGksIHJldDsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiAtICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19DUFVfREVWSUNFUykp
Cj4gPiA+ID4gPiArICAgICAgIC8qCj4gPiA+ID4gPiArICAgICAgICAqIFdoZW4gQUNQSSBpcyBl
bmFibGVkLCBDUFVzIGFyZSByZWdpc3RlcmVkIHZpYQo+ID4gPiA+ID4gKyAgICAgICAgKiBhY3Bp
X3Byb2Nlc3Nvcl9nZXRfaW5mbygpLgo+ID4gPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gPiA+ICsg
ICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX0NQVV9ERVZJQ0VTKSB8fCAhYWNw
aV9kaXNhYmxlZCkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm47ICAKPiA+ID4gPgo+
ID4gPiA+IEhvbmVzdGx5LCB0aGlzIGxvb2tzIGxpa2UgYSBxdWljayBoYWNrIHRvIG1lIGFuZCBp
dCBhYnNvbHV0ZWx5Cj4gPiA+ID4gcmVxdWlyZXMgYW4gQUNLIGZyb20gdGhlIHg4NiBtYWludGFp
bmVycyB0byBnbyBhbnl3aGVyZS4gIAo+ID4gPiBXaWxsIGFkZHJlc3MgdGhpcyBzZXBhcmF0ZWx5
Lgo+ID4gPiAgCj4gPgo+ID4gU28gZG8gcGVvcGxlIHByZWZlciB0aGlzIGhhY2ssIG9yIHNvbWV0
aGluZyBhbG9uZyBsaW5lcyBvZiB0aGUgZm9sbG93aW5nPwo+ID4KPiA+IHN0YXRpYyBpbnQgX19p
bml0IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYyh2b2lkKQo+ID4gewo+ID4gICAgICAgICBpbnQg
aSwgcmV0ID0gMDsKPiA+Cj4gPiAgICAgICAgIGZvcl9lYWNoX29ubGluZV9jcHUoaSkgewo+ID4g
ICAgICAgICAgICAgICAgIGlmICghZ2V0X2NwdV9kZXZpY2UoaSkpIHsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJldCA9IGFyY2hfcmVnaXN0ZXJfY3B1KGkpOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJfd2FybigicmVnaXN0ZXJfY3B1ICVkIGZhaWxlZCAoJWQpXG4iLCBpLCByZXQpOwo+ID4gICAg
ICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgfQo+ID4gICAgICAgICAvL1Byb2JhYmx5IGp1c3Qg
ZWF0IHRoZSBlcnJvci4KPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiB9Cj4gPiBzdWJzeXNfaW5p
dGNhbGxfc3luYyhjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMpOyAgCj4gCj4gSSB3b3VsZCBwcmVm
ZXIgc29tZXRoaW5nIGxpa2UgdGhlIGFib3ZlLgo+IAo+IEkgYWN0dWFsbHkgdGhvdWdodCB0aGF0
IGFyY2hfcmVnaXN0ZXJfY3B1KCkgbWlnaHQgcmV0dXJuIHNvbWV0aGluZwo+IGxpa2UgLUVQUk9C
RV9ERUZFUiB3aGVuIGl0IGNhbm5vdCBkZXRlcm1pbmUgd2hldGhlciBvciBub3QgdGhlIENQVSBp
cwo+IHJlYWxseSBhdmFpbGFibGUuCgpPay4gVGhhdCB3b3VsZCBlbmQgdXAgbG9va2luZyBtdWNo
IG1vcmUgbGlrZSB0aGUgb3JpZ2luYWwgY29kZSBJIHRoaW5rLgpTbyB3ZSB3b3VsZG4ndCBoYXZl
IHRoaXMgbGF0ZSByZWdpc3RyYXRpb24gYXQgYWxsLCBvciBrZWVwIGl0IGZvciBEVApvbiBhcm02
ND8gIEknbSBub3Qgc3VyZSB0aGF0J3MgYSBjbGVhbiBzb2x1dGlvbiB0aG91Z2ggbGVhdmVzCnRo
ZSB4ODYgcGF0aCBhbG9uZS4KCklmIHdlIGdldCByaWQgb2YgdGhpcyBjYXRjaCBhbGwsIHNvbHV0
aW9uIHdvdWxkIGJlIHRvIG1vdmUgdGhlCiFhY3BpX2Rpc2FibGVkIGNoZWNrIGludG8gdGhlIGFy
bTY0IHZlcnNpb24gb2YgYXJjaF9jcHVfcmVnaXN0ZXIoKQpiZWNhdXNlIHdlIHdvdWxkIG9ubHkg
d2FudCB0aGUgZGVsYXllZCByZWdpc3RyYXRpb24gcGF0aCB0byBiZQp1c2VkIG9uIEFDUEkgY2Fz
ZXMgd2hlcmUgdGhlIHF1ZXN0aW9uIG9mIENQVSBhdmFpbGFiaWxpdHkgY2FuJ3QKeWV0IGJlIHJl
c29sdmVkLgoKPiAKPiBUaGVuLCB0aGUgQUNQSSBwcm9jZXNzb3IgZW51bWVyYXRpb24gcGF0aCBt
YXkgdGFrZSBjYXJlIG9mIHJlZ2lzdGVyaW5nCj4gQ1BVIHRoYXQgaGF2ZSBub3QgYmVlbiByZWdp
c3RlcmVkIHNvIGZhciBhbmQgaW4gdGhlIG1vcmUtb3ItbGVzcyB0aGUKPiBzYW1lIHdheSByZWdh
cmRsZXNzIG9mIHRoZSBhcmNoaXRlY3R1cmUgKG1vZHVsbyBzb21lIGFyY2gtc3BlY2lmaWMKPiBz
dHVmZikuCgpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBpbiBhY3BpX3Byb2Nlc3Nvcl9nZXRf
aW5mbygpIHdlJ2QgZW5kIHVwCndpdGggYSBzaW1pbGFyIGNoZWNrIG9uIHdoZXRoZXIgaXQgd2Fz
IGFscmVhZHkgcmVnaXN0ZXJlZCAodGhlIHg4NiBwYXRoKQpvciBoYWQgYmUgZGVmZXJyZWQgKGFy
bTY0IC8gYWNwaSkuCiAKPiAKPiBJbiB0aGUgZW5kLCBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8g
YXZvaWQgY2hhbmdpbmcgdGhlIGJlaGF2aW9yIG9mCj4geDg2IGFuZCBsb29uZ2FyY2ggaW4gdGhp
cyBzZXJpZXMuCgpQb3NzaWJsZSwgeWVzLCBidXQgcmVzdWx0IGlmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHkgaXMgd2UgZW5kIHVwIHdpdGgKdmVyeSBkaWZmZXJlbnQgZmxvd3MgYW5kIHJlcGxpY2F0
aW9uIG9mIGZ1bmN0aW9uYWxpdHkgYmV0d2VlbiB0aGUKZWFybHkgcmVnaXN0cmF0aW9uIGFuZCB0
aGUgbGF0ZSBvbmUuIEknbSBmaW5lIHdpdGggdGhhdCBpZiB5b3UgcHJlZmVyIGl0IQoKPiAKPiA+
IFdoaWNoIG1heSBsb29rIGZhbWlsaWFyIGF0IGl0J3MgZWZmZWN0aXZlbHkgcGF0Y2ggMyBmcm9t
IHYzIHdoaWNoIHdhcyBkZWFsaW5nCj4gPiB3aXRoIENQVXMgbWlzc2luZyBmcm9tIERTRFQgKHNv
bWV0aGluZyB3ZSB0aGluayBkb2Vzbid0IGhhcHBlbikuCj4gPgo+ID4gSXQgbWlnaHQgYmUgcG9z
c2libGUgdG8gZWxpZGUgdGhlIGFyY2hfcmVnaXN0ZXJfY3B1KCkgaW4KPiA+IG1ha2VfcHJlc2Vu
dCgpIGJ1dCB0aGF0IHdpbGwgbWVhbiB3ZSB1c2UgZGlmZmVyZW50IGZsb3dzIGluIHRoaXMgcGF0
Y2ggc2V0Cj4gPiBmb3IgdGhlIGhvdHBsdWcgYW5kIGluaXRpYWxseSBwcmVzZW50IGNhc2VzIHdo
aWNoIGlzIGEgYml0IG1lc3N5Lgo+ID4KPiA+IEkndmUgdGVzdGVkIHRoaXMgbGlnaHRseSBvbiBh
cm02NCBhbmQgeDg2IEFDUEkgKyBEVCBib290aW5nIGFuZCBpdCAic2VlbXMiIGZpbmUuICAKPiAK
PiBTb3VuZHMgcHJvbWlzaW5nLgoKUG9zc2libHkgbm90IHRoYXQgcmVsZXZhbnQgdGhvdWdoIGlm
IHByb3Bvc2FsIGlzIHRvIGRyb3AgdGhpcyBhcHByb2FjaC4gOigKQXQgbGVhc3QgSSBub3cgaGF2
ZSB0ZXN0IHNldHVwcyEKCkpvbmF0aGFuCj4gCj4gVGhhbmtzIQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
