Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA209C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 22:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lCcK5iad+R0bh2TevDOHd+r4XqhVZjLiMYTEbBTYB9E=; b=Vt7QlEHgyIA6cT
	jEGdCTYiTe3IwIDx52H4dsQ+BujbnOgxBOiGtJz2FCSfs8+PIugSTWi0ctMafOF72ve2S+vC3AT8p
	5ZDNrEc5Pa+bjE2/mu3YLYI8zv8jpeFLkauoa2Qy00wq8/pZE9t79YDnL0KApcZPtjg6ycEQebv0B
	j8J7kGFGfxxKhyfQ3dje0k3wTsveVctpiVgzVMQrzVeUFtgjO2ynWdjC7MzRbYnscTauUaq6ehxT5
	OpXpKWWR1yBqWtLyl6hwrZkH+EhOc4tAkgyfK+AWH5kiQkdW8uIbXXXcs2veKwGIw//pyh9PaClXm
	hk4Y+F+iQBBQQeSSfreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbH6-00000006z97-30UY;
	Fri, 21 Feb 2025 22:13:36 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbH4-00000006z8u-3MjZ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 22:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACF53682EC;
	Fri, 21 Feb 2025 22:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D089AC4CED6;
	Fri, 21 Feb 2025 22:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176012;
	bh=BbE8d/oK1jS2Di+ALxnwvuqfQy6s3esDrDmP52JzzjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oJrE1/q/B74dT9qapArjBmpVVo7vOYj7wTgz501vS7EN1Kcg6VFdcPIo+1yTL//OQ
	 qC6KG+DaZF1xOOaZlVSK4yEctM8JYVOaZ7IYUoeWn7RUKYYRfw9sTKS2DV9AV0NGG9
	 O+loZPDJ6g1CCwTPpfcXudJzXIeKs8P0T1KoGdOmmR+96EqrXGaAemAavd30GLshMx
	 3tnUq0hPAyq43ftvGkNm7AeMaFYhaRRgMpC4tyHIX4Un9vPXp3bclzAGIh59KCjnDA
	 EEaLmMVEVlCwu4vDPlAX6mtsFe/2SuiSXNBQFPENmNmaHk5YaQeC9s8QHeuZ9x93ul
	 gITNQJ35XTxKA==
Date: Fri, 21 Feb 2025 16:13:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh+dt@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbrobinson@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20250221221330.GA367172@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0PR01MB5662DF3C3D71A274A2E5B9C2FEC72@PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM>
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

W2NjLT50bzogUm9iXQoKT24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMTE6Mjk6MjBBTSArMDgwMCwg
Q2hlbiBXYW5nIHdyb3RlOgo+IE9uIDIwMjUvMi8yMCAyOjIyLCBCam9ybiBIZWxnYWFzIHdyb3Rl
Ogo+ID4gT24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgMDE6NTQ6MTFQTSArMDgwMCwgQ2hlbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDI1LzIvMTIgMTI6MjUsIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4g
PiA+IFsuLi4uLi5dCj4gPiA+ID4gPiBwY2llX3JjMSBhbmQgcGNpZV9yYzIgc2hhcmUgcmVnaXN0
ZXJzIGluIGNkbnNfcGNpZTFfY3RybC4gQnkgdXNpbmcKPiA+ID4gPiA+IGRpZmZlcmVudCAic29w
aGdvLGNvcmUtaWQiIHZhbHVlcywgdGhleSBjYW4gZGlzdGluZ3Vpc2ggYW5kIGFjY2Vzcwo+ID4g
PiA+ID4gdGhlIHJlZ2lzdGVycyB0aGV5IG5lZWQgaW4gY2Ruc19wY2llMV9jdHJsLgo+ID4gPiA+
IFdoZXJlIGRvZXMgY2Ruc19wY2llMV9jdHJsIGZpdCBpbiB0aGlzIGV4YW1wbGU/ICBEb2VzIHRo
YXQgZW5jbG9zZQo+ID4gPiA+IGJvdGggcGNpZV9yYzEgYW5kIHBjaWVfcmMyPwo+ID4gPiBjZG5z
X3BjaWUxX2N0cmwgaXMgZGVmaW5lZCBhcyBhIHN5c2NvbiBub2RlLMKgIHdoaWNoIGNvbnRhaW5z
IHJlZ2lzdGVycwo+ID4gPiBzaGFyZWQgYnkgcGNpZV9yYzEgYW5kIHBjaWVfcmMyLiBJbiB0aGUg
YmluZGluZyB5YW1sIGZpbGUsIEkgZHJldyBhIGRpYWdyYW0KPiA+ID4gdG8gZGVzY3JpYmUgdGhl
IHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZW0sIGNvcHkgaGVyZSBmb3IgeW91ciBxdWljawo+ID4g
PiByZWZlcmVuY2U6Cj4gPiA+IAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUg
KExpbmswKSA8LS0tPiBwY2llX3JjMSAgKy0tLS0tLS0tLS0tLS0tLS0tKwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgfAo+ID4gPiArICAgICAgQ2FkZW5jZSBJUCAyIC0tKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCBjZG5zX3BjaWUxX2N0cmwgfAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
fAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUgKExpbmsxKSA8LS0tPiBwY2ll
X3JjMiAgKy0tLS0tLS0tLS0tLS0tLS0tKwo+ID4gPiAKPiA+ID4gVGhlIGZvbGxvd2luZyBpcyBh
biBleGFtcGxlIHdpdGggY2Ruc19wY2llMV9jdHJsIGFkZGVkLiBGb3Igc2ltcGxpY2l0eSwgSQo+
ID4gPiBkZWxldGVkIHBjaWVfcmMwLgo+ID4KPiA+IExvb2tzIGdvb2QuICBJdCB3b3VsZCBiZSBu
aWNlIGlmIHRoZXJlIHdlcmUgc29tZSBuYW1pbmcgc2ltaWxhcml0eSBvcgo+ID4gY29tbWVudCBv
ciBvdGhlciBoaW50IHRvIGNvbm5lY3Qgc29waGdvLGNvcmUtaWQgd2l0aCB0aGUgc3lzY29uIG5v
ZGUuCj4gPiAKPiA+ID4gcGNpZV9yYzE6IHBjaWVANzA2MjAwMDAwMCB7Cj4gPiA+ICDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBjaWUtaG9zdCI7Cj4gPiA+ICDCoMKgwqAgLi4u
Li4uIC8vIGhvc3QgYnJpZGUgbGV2ZWwgcHJvcGVydGllcwo+ID4gPiAgwqDCoMKgIGxpbnV4LHBj
aS1kb21haW4gPSA8MT47Cj4gPiA+ICDCoMKgwqAgc29waGdvLGNvcmUtaWQgPSA8MD47Cj4gPiA+
ICDCoMKgwqAgc29waGdvLHN5c2Nvbi1wY2llLWN0cmwgPSA8JmNkbnNfcGNpZTFfY3RybD47Cj4g
PiA+ICDCoMKgwqAgcG9ydCB7Cj4gPiA+ICDCoMKgwqDCoMKgwqDCoCAvLyBwb3J0IGxldmVsIHBy
b3BlcnRpZXMKPiA+ID4gIMKgwqDCoMKgwqDCoMKgIHZlbmRvci1pZCA9IDwweDFmMWM+Owo+ID4g
PiAgwqDCoMKgwqDCoMKgwqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47Cj4gPiA+ICDCoMKgwqDCoMKg
wqDCoCBudW0tbGFuZXMgPSA8Mj47Cj4gPiA+ICDCoMKgwqAgfTsKPiA+ID4gfTsKPiA+ID4gCj4g
PiA+IHBjaWVfcmMyOiBwY2llQDcwNjI4MDAwMDAgewo+ID4gPiAgwqDCoMKgIGNvbXBhdGlibGUg
PSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+ID4gPiAgwqDCoMKgIC4uLi4uLiAvLyBob3N0
IGJyaWRlIGxldmVsIHByb3BlcnRpZXMKPiA+ID4gIMKgwqDCoCBsaW51eCxwY2ktZG9tYWluID0g
PDI+Owo+ID4gPiAgwqDCoMKgIHNvcGhnbyxjb3JlLWlkID0gPDE+Owo+ID4gPiAgwqDCoMKgIHNv
cGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZjZG5zX3BjaWUxX2N0cmw+Owo+ID4gPiAgwqDCoMKg
IHBvcnQgewo+ID4gPiAgwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0aWVzCj4g
PiA+ICDCoMKgwqDCoMKgwqDCoCB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPiA+ID4gIMKgwqDCoMKg
wqDCoMKgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+ID4gPiAgwqDCoMKgwqDCoMKgwqAgbnVtLWxh
bmVzID0gPDI+Owo+ID4gPiAgwqDCoMKgIH0KPiA+ID4gCj4gPiA+IH07Cj4gPiA+IAo+ID4gPiBj
ZG5zX3BjaWUxX2N0cmw6IHN5c2NvbkA3MDYzODAwMDAwIHsKPiA+ID4gIMKgwqDCoCBjb21wYXRp
YmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1jdHJsIiwgInN5c2NvbiI7Cj4gPiA+ICDCoMKgwqAg
cmVnID0gPDB4NzAgMHg2MzgwMDAwMCAweDAgMHg4MDAwMDA+Owo+ID4gPiB9Owo+IAo+IEkgZmlu
ZCBkdGIgY2hlY2sgd2lsbCByZXBvcnQgZXJyb3IgZHVlIHRvICJwb3J0IiBpcyBub3QgYSBldmF1
bGF0ZWQgcHJvcGVydHkKPiBmb3IgcGNpZSBob3N0LiBTaG91bGQgd2UgYWRkIGEgdmVuZHJvciBz
cGVjaWZpYyBwcm9wZXJ0eSBmb3IgdGhpcz8KPiAKPiBPciBkbyB5b3UgaGF2ZSBhbnkgZXhhbXBs
ZSBmb3IgcmVmZXJlbmNlPwoKU29ycnksIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgZHRiIHRv
IGFuc3dlciB0aGlzLiAgTWF5YmUgUm9iPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
