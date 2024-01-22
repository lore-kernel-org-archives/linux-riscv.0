Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B1C47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdx1hMeMp7vfu9ApON8oCn2pmNH2z7oeCZZLEjOz4S0=; b=h3/zxxRg+7mdOc
	3uy6LEzgS41cEs9Uy4vlgcwDPsqMc5jis8OFJEzxgWyQdAjJcuTN5u1QB8MezYPVMlVcppDxTT9mF
	Ah/YaRLArZocjR5hcxTedKKOVZaIiTn6o5reogaw6WFor9wPVCnQaUO+yAM6HTNX6XDKqbmVeObp2
	/Rtv3aw402TSN4RTmC1vsfiBfaLyr07CPUX2KyWC5JtT419hlTRZJSkAv3Ds5gMBC4+Kvvb9IOFjr
	3sMc8rygT/0jAtE5wV73uF+Zaq12AkoCB/KVWiAt19LX0YGvVkRI63m52e2B1ON7FVZq+94/uIDkM
	Yt4J9L8ExwlEd3/SLRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwl1-00CrEU-2c;
	Mon, 22 Jan 2024 16:02:43 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRwkx-00CrBQ-2W;
	Mon, 22 Jan 2024 16:02:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TJZg429vPz6K6FL;
	Tue, 23 Jan 2024 00:00:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 89AC3140B2F;
	Tue, 23 Jan 2024 00:02:28 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 22 Jan
 2024 16:02:27 +0000
Date: Mon, 22 Jan 2024 16:02:27 +0000
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
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <20240122160227.00002d83@Huawei.com>
In-Reply-To: <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
	<CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
	<ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_080240_123227_7850386B 
X-CRM114-Status: GOOD (  42.85  )
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

T24gTW9uLCAxNSBKYW4gMjAyNCAxMTowNjoyOSArMDAwMAoiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gT24gTW9uLCBEZWMgMTgsIDIwMjMg
YXQgMDk6MjI6MDNQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBXZWQs
IERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5nIDxybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51az4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVz
Lm1vcnNlQGFybS5jb20+Cj4gPiA+Cj4gPiA+IEFDUEkgaGFzIHR3byBkZXNjcmlwdGlvbnMgb2Yg
Q1BVcywgb25lIGluIHRoZSBNQURUL0FQSUMgdGFibGUsIHRoZSBvdGhlcgo+ID4gPiBpbiB0aGUg
RFNEVC4gQm90aCBhcmUgcmVxdWlyZWQuIChBQ1BJIDYuNSdzIDguNCAiRGVjbGFyaW5nIFByb2Nl
c3NvcnMiCj4gPiA+IHNheXMgIkVhY2ggcHJvY2Vzc29yIGluIHRoZSBzeXN0ZW0gbXVzdCBiZSBk
ZWNsYXJlZCBpbiB0aGUgQUNQSQo+ID4gPiBuYW1lc3BhY2UiKS4gSGF2aW5nIHR3byBkZXNjcmlw
dGlvbnMgYWxsb3dzIGZpcm13YXJlIGF1dGhvcnMgdG8gZ2V0Cj4gPiA+IHRoaXMgd3JvbmcuCj4g
PiA+Cj4gPiA+IElmIENQVXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFEVC9BUElDLCB0aGV5IHdp
bGwgYmUgYnJvdWdodCBvbmxpbmUKPiA+ID4gZWFybHkgZHVyaW5nIGJvb3QuIE9uY2UgdGhlIHJl
Z2lzdGVyX2NwdSgpIGNhbGxzIGFyZSBtb3ZlZCB0byBBQ1BJLAo+ID4gPiB0aGV5IHdpbGwgYmUg
YmFzZWQgb24gdGhlIERTRFQgZGVzY3JpcHRpb24gb2YgdGhlIENQVXMuIFdoZW4gQ1BVcyBhcmUK
PiA+ID4gbWlzc2luZyBmcm9tIHRoZSBEU0RUIGRlc2NyaXB0aW9uLCB0aGV5IHdpbGwgZW5kIHVw
IG9ubGluZSwgYnV0IG5vdAo+ID4gPiByZWdpc3RlcmVkLgo+ID4gPgo+ID4gPiBBZGQgYSBoZWxw
ZXIgdGhhdCBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIGhhcyBjb21wbGV0ZWQgdG8gcmVnaXN0ZXIK
PiA+ID4gQ1BVcyB0aGF0IGFyZSBvbmxpbmUsIGJ1dCB3ZXJlbid0IGZvdW5kIGluIHRoZSBEU0RU
LiBBbnkgQ1BVIHRoYXQKPiA+ID4gaXMgcmVnaXN0ZXJlZCBieSB0aGlzIGNvZGUgdHJpZ2dlcnMg
YSBmaXJtd2FyZS1idWcgd2FybmluZyBhbmQga2VybmVsCj4gPiA+IHRhaW50Lgo+ID4gPgo+ID4g
PiBRZW11IFRDRyBvbmx5IGRlc2NyaWJlcyB0aGUgZmlyc3QgQ1BVIGluIHRoZSBEU0RULCB1bmxl
c3MgY3B1LWhvdHBsdWcKPiA+ID4gaXMgY29uZmlndXJlZC4gIAo+ID4gCj4gPiBTbyB3aHkgaXMg
dGhpcyBhIGtlcm5lbCBwcm9ibGVtPyAgCj4gCj4gU28gd2hhdCBhcmUgeW91IHByb3Bvc2luZyBz
aG91bGQgYmUgdGhlIGJlaGF2aW91ciBoZXJlPyBXaGF0IHRoaXMKPiBzdGF0ZW1lbnQgc2VlbXMg
dG8gYmUgc2F5aW5nIGlzIHRoYXQgUUVNVSBhcyBpdCBleGlzdHMgdG9kYXkgb25seQo+IGRlc2Ny
aWJlcyB0aGUgZmlyc3QgQ1BVIGluIERTRFQuCgpUaGlzIGNvbmZ1c2VzIG1lIHNvbWV3aGF0LCBi
ZWNhdXNlIEknbSBmYXIgZnJvbSBzdXJlIHdoaWNoIG1hY2hpbmVzIHRoaXMKaXMgdHJ1ZSBmb3Ig
aW4gUUVNVS4gIEknbSBndWVzc2luZyBpdCdzIGEgbGVnYWN5IHRoaW5nIHdpdGgKc29tZSBvbGQg
ZGlzdHJvIHZlcnNpb24gb2YgUUVNVSAtIHNvIHdlJ2xsIGhhdmUgdG8gcGFwZXIgb3ZlciBpdCBh
bnl3YXkKYnV0IGZvciBjdXJyZW50IFFFTVUgSSdtIG5vdCBzdXJlIGl0J3MgdHJ1ZS4KCkhlbHBm
dWxseSB0aGVyZSBhcmUgYSBidW5jaCBvZiBBQ1BJIHRhYmxlIHRlc3RzIHNvIEkndmUgYmVlbiBj
aGVja2luZwp0aHJvdWdoIGFsbCB0aGUgbXVsdGkgQ1BVIGNhc2VzLgoKQ1BVIGhvdHBsdWcgbm90
IGVuYWJsZWQuCnBjL0RTRFQuZGltbXB4bSAgLSA0eCBQcm9jZXNzb3IgZW50cmllcy4gIC1zbXAg
NApwYy9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDIKcTM1L0RT
RFQuYWNwaWhtYXQgLSAyeCBQcm9jZXNzb3IgZW50cmllcy4gLXNtcCAyCnZpcnQvRFNEVC5hY3Bp
aG1hdHZpcnQgLSA0eCBBQ1BJMDAwNyBlbnRyaWVzIC1zbXAgNApxMzUvRFNEVC5hY3BpaG1hdC1u
b2luaXRpYXRvciAtIDQgeCBQcm9jZXNzb3IgKCkgZW50cmllcyAtc21wIDQgCnZpcnQvRFNEVC50
b3BvbG9neSAtIDh4IEFDUEkwMDA3IGVudHJpZXMKCkkndmUgYWxzbyBsb29rZWQgYXQgdGhlIGNv
ZGUgYW5kIHdlIGhhdmUgdmFyaW91cyB0eXBlcyBvZgpDUFUgaG90cGx1ZyBvbiB4ODYgYnV0IHRo
ZXkgYWxsIGJ1aWxkIGFwcHJvcHJpYXRlIG51bWJlcnMgb2YKUHJvY2Vzc29yKCkgZW50cmllcyBp
biBEU0RULgpBcm0gbGlrZXdpc2Ugc2VlbXMgdG8gYnVpbGQgdGhlIHJpZ2h0IG51bWJlciBvZiBB
Q1BJMDAwNyBlbnRyaWVzCihhbmQgZG9lc24ndCB5ZXQgaGF2ZSBDUFUgSFAgc3VwcG9ydCkuCgpJ
ZiBhbnlvbmUgY2FuIGFkZCBhIHJlZmVyZW5jZSBvbiB3aHkgdGhpcyBpcyBuZWVkZWQgdGhhdCB3
b3VsZCBiZSB2ZXJ5CmhlbHBmdWwuCgo+IAo+IEFzIHRoaXMgcGF0Y2ggc2VyaWVzIGNoYW5nZXMg
d2hlbiBhcmNoX3JlZ2lzdGVyX2NwdSgpIGdldHMgY2FsbGVkIChhcwo+IGRlc2NyaWJlZCBpbiB0
aGUgcGFyYWdyYXBoIGFib3ZlKSB3ZSBvYnZpb3VzbHkgbmVlZCB0byBwcmVzZXJ2ZSB0aGUKPiBf
ZXhpc3RpbmdfIGJlaGF2aW91ciB0byBhdm9pZCBjYXVzaW5nIHJlZ3Jlc3Npb25zLiBTbywgaWYg
Y2hhbmdpbmcgdGhlCj4ga2VybmVsIGNhdXNlcyB1c2VyIHZpc2libGUgcmVncmVzc2lvbnMgKGUu
Zy4gc3lzZnMgZW50cmllcyB0bwo+IGRpc2FwcGVhcikgdGhlbiBpdCBvYnZpb3VzbHkgX2lzXyBh
IGtlcm5lbCBwcm9ibGVtIHRoYXQgbmVlZHMgdG8gYmUKPiBzb2x2ZWQuCj4gCj4gV2UgY2FuJ3Qg
c2F5ICJ3ZWxsIGZpeCBRRU1VIHRoZW4iIHdpdGhvdXQgaW52b2tpbmcgdGhlIHdyYXRoIG9mIExp
bnVzLgoKT3ZlcmFsbCBJJ20gZmluZSB3aXRoIHRoZSBkZWZlbnNpdmUgbmF0dXJlIG9mIHRoaXMg
cGF0Y2ggYXMgdGhlcmUKJ21pZ2h0JyBiZSBmaXJtd2FyZSBvdXQgdGhlcmUgd2l0aCB0aGlzIHBy
b2JsZW0gLSBJIGp1c3QgY2FuJ3QgZXN0YWJsaXNoCnRoYXQgdGhlcmUgaXMhICBJZiBhbnlvbmUg
ZWxzZSByZWNhbGxzIHRoZSBoaXN0b3J5IG9mIHRoaXMgdGhlbiBnaXZlCmEgc2hvdXQuICBJIHZh
Z3VlbHkgd29uZGVyZWQgaWYgdGhpcyB3YXMgYW4gaWE2NCB0aGluZyBidXQgbm9wZSwgUUVNVQpu
ZXZlciBnZW5lcmF0ZWQgdGFibGVzIGZvciBpYTY0IGJlZm9yZSBkcm9wcGluZyBzdXBwb3J0IGJh
Y2sgaW4gUUVNVSAyLjExCgoKPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgTW9yc2UgPGph
bWVzLm1vcnNlQGFybS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxK
b25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFu
IDxnc2hhbkByZWRoYXQuY29tPgo+ID4gPiBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwu
bHVpc0BvcmFjbGUuY29tPgo+ID4gPiBUZXN0ZWQtYnk6IFZpc2hudSBQYWpqdXJpIDx2aXNobnVA
b3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KPiA+ID4gVGVzdGVkLWJ5OiBKaWFueW9uZyBXdSA8amlh
bnlvbmcud3VAYXJtLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFj
bGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L2FjcGkvYWNwaV9wcm9jZXNzb3IuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYyBiL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nv
ci5jCj4gPiA+IGluZGV4IDZhNTQyZTBjZTM5Ni4uMDUxMWYyYmMxMGJjIDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ID4gPiArKysgYi9kcml2ZXJzL2Fj
cGkvYWNwaV9wcm9jZXNzb3IuYwo+ID4gPiBAQCAtNzkxLDYgKzc5MSwyNSBAQCB2b2lkIF9faW5p
dCBhY3BpX3Byb2Nlc3Nvcl9pbml0KHZvaWQpCj4gPiA+ICAgICAgICAgYWNwaV9wY2NfY3B1ZnJl
cV9pbml0KCk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhY3BpX3By
b2Nlc3Nvcl9yZWdpc3Rlcl9taXNzaW5nX2NwdXModm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAg
ICBpbnQgY3B1Owo+ID4gPiArCj4gPiA+ICsgICAgICAgaWYgKGFjcGlfZGlzYWJsZWQpCj4gPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGZvcl9lYWNo
X29ubGluZV9jcHUoY3B1KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIWdldF9jcHVfZGV2
aWNlKGNwdSkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyX29uY2UoRldf
QlVHICJDUFUgJXUgaGFzIG5vIEFDUEkgbmFtZXNwYWNlIGRlc2NyaXB0aW9uIVxuIiwgY3B1KTsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkX3RhaW50KFRBSU5UX0ZJUk1XQVJFX1dP
UktBUk9VTkQsIExPQ0tERVBfU1RJTExfT0spOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBhcmNoX3JlZ2lzdGVyX2NwdShjcHUpOyAgCj4gPiAKPiA+IFdoaWNoIHBhcnQgb2YgdGhpcyBj
b2RlIGlzIHJlbGF0ZWQgdG8gQUNQST8gIAo+IAo+IFRoYXQncyBhIGdvb2QgcXVlc3Rpb24sIGFu
ZCBJIHN1c3BlY3QgaXQgd291bGQgYmUgbW9yZSBzdWl0ZWQgdG8gYmVpbmcKPiBwbGFjZWQgaW4g
ZHJpdmVycy9iYXNlL2NwdS5jIGV4Y2VwdCBmb3IgdGhlIHByb2JsZW0gdGhhdCB0aGUgZXJyb3IK
PiBtZXNzYWdlIHJlZmVycyB0byBBQ1BJLgo+IAo+IEFzIGxvbmcgYXMgd2Uga2VlcCB0aGUgYWNw
aV9kaXNhYmxlZCB0ZXN0LCBJIGd1ZXNzIHRoYXQncyBmaW5lLgo+IGNwdV9kZXZfcmVnaXN0ZXJf
Z2VuZXJpYygpIHRoZXJlIGFscmVhZHkgdGVzdHMgYWNwaV9kaXNhYmxlZC4KPiAKTW92aW5nIGl0
IHNlZW1zIGZpbmUgdG8gbWUuCgpKb25hdGhhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
