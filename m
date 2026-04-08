Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D33FD5F84
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 06:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Subject:Cc:
	Message-Id:Date:Mime-Version:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inZKCm4BS33GflPYoQbW/LsBj4vaGI+H+oC1S1u3aeg=; b=VPIKeF5eFcdzYY
	o7927c6P5HwJsxbLoSVeBckP+DwDAbKocvbHaXNY7ccDgM6Bq7VJzS+lqDs1VV0s2XDVR2hDbv/5v
	TscKGxRVZGKQ0aSqX9S3DLR9dck3YNG776XERC8+7LxOJ4uhRw9DBtyuhjBvYlidrPEpcf7lGcQ6L
	0WlUxUcb5IjR5ecGhtfCr5kzIjVzjYYCidpuuyzjZjRVp0MXtbQgPO/YLeE3Vd53PqodioALImXsq
	ajbATlx19azAXjoEC2oa+ClDQdbZRTTBcZf28e8nZNTzNgKieEQ5I2KYwO1HTZhAETSW5/Jbby3qM
	zHIjCL8WNJ3flp0GVG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMZQ-00000008M4R-0F5H;
	Wed, 08 Apr 2026 06:39:24 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMZI-00000008M3a-1if8
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 06:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775630346;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=+Wl8ztU+KWJc9pMYZYC0Q+NmCmeBduZJ6O6bkOxAMkE=;
 b=Czy2tEPU89TqFWAGmDJ6iUuMjL1Vk+EbsC+KDPzM5Y3McA3YGtA6xh8H0rfG2ODKpAvETF
 RwwUfghUtH+rm4ywRmvkExM2Gv+q6LC0wUongX2DPe11kCDZolEeuPVKazgynySUWbmcW9
 IWLYaZ/diKmFtR4XlqOl97iNoEoqx8MbcipzmMxN6HrSYb5joSp7eAPHLxRC89DrUhz84g
 nObrnlvnzM9R1rfADQeYAKVTZYrxKWST4YmabxOwW9rJhzJ61jSWL5pgpdBR7oh5Og87NS
 BhjjqEjqmn8LlIJXI1NhZrrttCfbvEBwJgnZXHoOLXv9n2LmkCHKZoN7ZR52PA==
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+169d5f807+14e589+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Wed, 08 Apr 2026 14:39:02 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.ed857e60.6785.4e2b.abec.e19fd3b96e68@feishu.cn>
Cc: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io> <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
	<DHNJQN4PPTH8.MEVXM2TL2MT7@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_233917_205521_0DFB8880 
X-CRM114-Status: GOOD (  16.65  )
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

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgQXByIDgsIDIwMjYsIDE0OjA3Cgo+IE9uIFR1ZSBB
cHIgNywgMjAyNiBhdCAxOjU3IFBNIENTVCwgU2FuZGllIENhbyB3cm90ZToKPiA+IFRoZSBGTUwx
M1YwNSBib2FyZCBmcm9tIERlZXBDb21wdXRpbmcgaW5jb3Jwb3JhdGVzIGEgU3BhY2VtaVQgSzMg
UklTQy1WCj4gPiBTb0MuSXQgaXMgYSBtYWluYm9hcmQgZGVzaWduZWQgZm9yIHRoZSBGcmFtZXdv
cmsgTGFwdG9wIDEzIENoYXNzaXMsCj4gPiB3aGljaCBoYXMgKEZyYW1ld29yaykgU0tVIEZSQU5I
UTAwMDEuCj4gPgo+ID4gVGhlIEZNTDEzVjA1IGJvYXJkIGZlYXR1cmVzOgo+ID4gLSBTcGFjZW1p
VCBLMyBSSVNDLVYgU29DCj4gPiAtIExQRERSNSAxNkdCIG9yIDMyR0IKPiA+IC0gZU1NQyAzMkdC
IH4xMjhHQiAoT3B0aW9uYWwpCj4gPiAtIFVGUyAzLjEgMjU2RyAoT3B0aW9uYWwpCj4gPiAtIFFT
UEkgRmxhc2gKPiA+IC0gTWljcm9TRCBTbG90Cj4gPiAtIFBDSWUtYmFzZWQgV2ktRmkKPiA+IC0g
NCBVU0ItQyBQb3J0cwo+ID4gwqAtIFBvcnQgMTogUEQgMy4wICg2NVcgTWF4KSwgVVNCIDMuMiBH
ZW4gMQo+ID4gwqAtIFBvcnQgMjogUEQgMy4wICg2NVcgTWF4KSwgVVNCIDMuMiBHZW4gMSwgRFAg
MS40ICg0S0A2MEh6KQo+ID4gwqAtIFBvcnQgMyAmIDQ6IFVTQiAzLjIgR2VuIDEKPiA+Cj4gPiBU
aGlzIG1pbmltYWwgZGV2aWNlIHRyZWUgZW5hYmxlcyBib290aW5nIGludG8gYSBzZXJpYWwgY29u
c29sZSB3aXRoIFVBUlQKPiA+IG91dHB1dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW5kaWUg
Q2FvIDxzYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8+Cj4gPiAtLS0KPiA+IMKgYXJjaC9yaXNj
di9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZSDCoCDCoCDCoCDCoCB8IMKgMSArCj4gPiDCoC4u
Li9zcGFjZW1pdC9rMy1kZWVwY29tcHV0aW5nLWZtbDEzdjA1LmR0cyDCoCDCoHwgMzEgKysrKysr
KysrKysrKysrKysrKwo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPiA+
IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtZGVl
cGNvbXB1dGluZy1mbWwxM3YwNS5kdHMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
TWFrZWZpbGUKPiA+IGluZGV4IDdlMmI4NzcwMjU3MS4uYWNiOTkzYzQ1MmJhIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZQo+ID4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZQo+ID4gQEAgLTQsNCArNCw1IEBAIGR0
Yi0kKENPTkZJR19BUkNIX1NQQUNFTUlUKSArPSBrMS1taWxrdi1qdXBpdGVyLmR0Ygo+ID4gwqBk
dGItJChDT05GSUdfQVJDSF9TUEFDRU1JVCkgKz0gazEtbXVzZXBpLXByby5kdGIKPiA+IMKgZHRi
LSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsxLW9yYW5nZXBpLXIycy5kdGIKPiA+IMKgZHRi
LSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsxLW9yYW5nZXBpLXJ2Mi5kdGIKPiA+ICtkdGIt
JChDT05GSUdfQVJDSF9TUEFDRU1JVCkgKz0gazMtZGVlcGNvbXB1dGluZy1mbWwxM3YwNS5kdGIK
PiA+IMKgZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGszLXBpY28taXR4LmR0Ygo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtZGVlcGNvbXB1dGlu
Zy1mbWwxM3YwNS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWRlZXBjb21w
dXRpbmctZm1sMTN2MDUuZHRzCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi43ODMwNjZmYzdhZDcKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtZGVlcGNvbXB1dGluZy1mbWwxM3YwNS5kdHMKPiA+
IEBAIC0wLDAgKzEsMzEgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAgT1IgTUlUKQo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDI0IERlZXBDb21wdXRp
bmcgKEhLKSBMaW1pdGVkCj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXl5eXgo+IEp1
c3QgbGlrZSBZaXh1biBzYWlkLCBpdCBuZWVkcyB0byBjb3ZlciB0aGlzIHllYXIuCj7CoAo+IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC0gVHJveQo+wqAKCkdvdCBpdC4g
V2lsbCBjaGFuZ2UgdG8gMjAyNi4KU2FuZGllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
