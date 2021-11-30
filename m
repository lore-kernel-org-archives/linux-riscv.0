Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1453C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un4Iv1dlMDcLie8DwP1DGT2BZGPXJjbfNotvanX0JOA=; b=AHIMM8vzOCxCcB
	kaQa4YWOZEJUWVDYN9SVcquknufm3/zv30ZYURaB0A8+hc3h3t5KKXlClkoqZ25GLa/zhLpV9RO5f
	Urvp+Pihtb9c3u2Ev7W5dY1keRGz/QZpXvDlX5wXlq2a6Jf7qmBKlJeK8PRZY+jfl90Vc59lAWw2J
	XcIw4IFCK3m/03MUyOvLj5Ca9Uy8kFy1QW2+F5yCdlbV+8pohnZaCsAkVG0w0HmXCw2e+nnF8BiU8
	+bOoTeC/3452VrcaMB6Jrm4mSVYg8s3XTOxWs2RarHIptQmZHGGCMRd4oqklxvW+pN3w4HLpfruu6
	gUKDN+C34aXZv8O04zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms3Aw-005KeB-Eb; Tue, 30 Nov 2021 13:28:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms3At-005Kco-I4
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 13:28:01 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ms3Ak-00058Q-BT; Tue, 30 Nov 2021 14:27:50 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Jessica Clarke <jrtc27@jrtc27.com>
Cc: Wei Fu <wefu@redhat.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, Dan Lustig <dlustig@nvidia.com>,
 Greg Favor <gfavor@ventanamicro.com>, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 jscheid@ventanamicro.com, rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 atishp04@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <guoren@kernel.org>,
 Christoph =?ISO-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, hch@lst.de,
 liush@allwinnertech.com, Wei Wu <lazyparser@gmail.com>, drew@beagleboard.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Tue, 30 Nov 2021 14:27:48 +0100
Message-ID: <2728314.U2HhIfhhqV@diego>
In-Reply-To: <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <1909580.k68io2XIxi@diego> <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_052759_631830_18FFE6F6 
X-CRM114-Status: GOOD (  21.37  )
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

SGksCgpBbSBEaWVuc3RhZywgMzAuIE5vdmVtYmVyIDIwMjEsIDE0OjE3OjQxIENFVCBzY2hyaWVi
IEplc3NpY2EgQ2xhcmtlOgo+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMjowNywgSGVpa28gU3TDvGJu
ZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiAKPiA+IEFtIE1vbnRhZywgMjkuIE5vdmVt
YmVyIDIwMjEsIDEzOjA2OjIzIENFVCBzY2hyaWViIEhlaWtvIFN0w7xibmVyOgo+ID4+IEFtIE1v
bnRhZywgMjkuIE5vdmVtYmVyIDIwMjEsIDA5OjU0OjM5IENFVCBzY2hyaWViIEhlaW5yaWNoIFNj
aHVjaGFyZHQ6Cj4gPj4+IE9uIDExLzI5LzIxIDAyOjQwLCB3ZWZ1QHJlZGhhdC5jb20gd3JvdGU6
Cj4gPj4+PiBGcm9tOiBXZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4KPiA+Pj4+IAo+ID4+Pj4gUHJl
dmlvdXMgcGF0Y2ggaGFzIGFkZGVkIHN2cGJtdCBpbiBhcmNoL3Jpc2N2IGFuZCBhZGQgInJpc2N2
LHN2cG1idCIKPiA+Pj4+IGluIHRoZSBEVCBtbXUgbm9kZS4gVXBkYXRlIGR0LWJpbmRpbmdzIHJl
bGF0ZWQgcHJvcGVydHkgaGVyZS4KPiA+Pj4+IAo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIEZ1
IDx3ZWZ1QHJlZGhhdC5jb20+Cj4gPj4+PiBDby1kZXZlbG9wZWQtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4gPj4+PiBDYzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+Pj4+
IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+ID4+Pj4gQ2M6IFJvYiBI
ZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgMTAgKysrKysrKysrKwo+
ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gPj4+PiAKPiA+Pj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+
ID4+Pj4gaW5kZXggYWE1ZmI2NGQ1N2ViLi45ZmY5Y2JkZDhhODUgMTAwNjQ0Cj4gPj4+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPj4+
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1s
Cj4gPj4+PiBAQCAtNjMsNiArNjMsMTYgQEAgcHJvcGVydGllczoKPiA+Pj4+ICAgICAgICAtIHJp
c2N2LHN2NDgKPiA+Pj4+ICAgICAgICAtIHJpc2N2LG5vbmUKPiA+Pj4+IAo+ID4+Pj4gKyAgbW11
Ogo+ID4+PiAKPiA+Pj4gU2hvdWxkbid0IHdlIGtlZXAgdGhlIGl0ZW1zIGJlIGluIGFscGhhYmV0
aWMgb3JkZXIsIGkuZS4gbW11IGJlZm9yZSAKPiA+Pj4gbW11LXR5cGU/Cj4gPj4+IAo+ID4+Pj4g
KyAgICBkZXNjcmlwdGlvbjoKPiA+Pj4+ICsgICAgICBEZXNjcmliZXMgdGhlIENQVSdzIE1NVSBT
dGFuZGFyZCBFeHRlbnNpb25zIHN1cHBvcnQuCj4gPj4+PiArICAgICAgVGhlc2UgdmFsdWVzIG9y
aWdpbmF0ZSBmcm9tIHRoZSBSSVNDLVYgUHJpdmlsZWdlZAo+ID4+Pj4gKyAgICAgIFNwZWNpZmlj
YXRpb24gZG9jdW1lbnQsIGF2YWlsYWJsZSBmcm9tCj4gPj4+PiArICAgICAgaHR0cHM6Ly9yaXNj
di5vcmcvc3BlY2lmaWNhdGlvbnMvCj4gPj4+PiArICAgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcnCj4gPj4+PiArICAgIGVudW06Cj4gPj4+PiArICAgICAg
LSByaXNjdixzdnBtYnQKPiA+Pj4gCj4gPj4+IFRoZSBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24g
aGFzIG11bHRpcGxlIE1NVSByZWxhdGVkIGV4dGVuc2lvbnM6IAo+ID4+PiBTdm5hcG90LCBTdnBi
bXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxsIGJlIG1vZGVsZWQgaW4gdGhpcyBlbnVtPwo+ID4+
IAo+ID4+IEkgcmVtZW1iZXIgaW4gc29tZSBlYXJsaWVyIHZlcnNpb24gc29tZSB3YXkgYmFjayB0
aGVyZSB3YXMgdGhlCj4gPj4gc3VnZ2VzdGlvbiBvZiB1c2luZyBhIHN1Yi1ub2RlIGluc3RlYWQg
YW5kIHRoZW4gYWRkaW5nIGJvb2xlYW4KPiA+PiBwcm9wZXJ0aWVzIGZvciB0aGUgc3VwcG9ydGVk
IGV4dGVuc2lvbnMuCj4gPj4gCj4gPj4gQWthIHNvbWV0aGluZyBsaWtlCj4gPj4gCW1tdSB7Cj4g
Pj4gCQlyaXNjdixzdnBibXQ7CQo+ID4+IAl9Owo+ID4gCj4gPiBGb3IgdGhlIHJlY29yZCwgSSdt
IHRhbGtpbmcgYWJvdXQgdGhlIG1haWwgZnJvbSBzZXB0ZW1iZXIKPiA+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJC
b0xGVlpodE9hWjVwUHRFQUBtYWlsLmdtYWlsLmNvbS8KPiA+IAo+ID4gU28gaGF2aW5nIGEgc3Vi
LW5vZGUgd291bGQgbWFrZSBhZGRpbmcgZnV0dXJlIGV4dGVuc2lvbnMKPiA+IHdheSBuaWNlci4K
PiAKPiBTdnBibXQgaXMganVzdCBhbiBJU0EgZXh0ZW5zaW9uLCBhbmQgc2hvdWxkIGJlIHRyZWF0
ZWQgbGlrZSBhbnkgb3RoZXIuCj4gTGV04oCZcyBub3QgaW52ZW50IHR3byBkaWZmZXJlbnQgd2F5
cyBvZiByZXByZXNlbnRpbmcgdGhhdCBpbiB0aGUgZGV2aWNlCj4gdHJlZS4KCkhlaW5yaWNoIGFz
a2VkIGhvdyB0aGUgb3RoZXIgZXh0ZW5zaW9ucyBzaG91bGQgYmUgaGFuZGxlZAooU3ZuYXBvdCwg
U3ZwYm10LCBTdmludmFsKSwgc28gd2hhdCBkbyB5b3Ugc3VnZ2VzdCB0byBkbyB3aXRoIHRoZXNl
PwoKClRoYW5rcwpIZWlrbwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
