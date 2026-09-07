Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A7C79F99
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+lCY7oAEAkpkepr/SWKAUnkem87wiNwOdysUENz2qI=; b=3/Yp7N7ju89iv1
	kKVcOUbwakSJp3O1gyJ/qGTSK4F4Kn/iFt1TfmvCDMDoZpVzA3X6mYylQYcffoe6SplGq2ZvOtlvE
	Mx6IIAEaWLq28C81dkaS0wYeNyaGsbtHFE+VeoOubZFYNjrTDKjajE06Ay0TF7SI9B0XOAsTi1WRk
	QuLN0aLZywdNsiJX5WeF9fsBDON5pfm2nmjp2BfoeniOYk/5yPAKZzbrZGaGnfmKKycJ7dFeGN3Vc
	QHj82UoiSrQhGAi5NGCm32ZF3faPXI2bW7IdeL8Sbu4pDWZkzLl26MJVXxBWO85qx8kc/xkRwzZif
	N6AmH56FHyV0NPyffH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WvF-00000006WPM-3og4;
	Mon, 07 Sep 2026 10:49:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WvB-00000006WNe-3GiX
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 10:49:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 416A943B8F;
	Mon,  7 Sep 2026 10:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1D21F00A3D;
	Mon,  7 Sep 2026 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788778193;
	bh=tFv9LwzGgCuIa4jmgSZ/kRbfBzJ46wmgoW/kA+A0XZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTxiOfwFRkahX67pVmvJkfuEsI+iskwAUlZpAADF51Wxkgi7yxZFQAmVhmM71HAYF
	 v0PEwNs7K0sHjT3bp8QhCR3fb0Yya02Z7hEM79Qt//9CXg+umWgNgPJfvQ02xB7zwy
	 yk+C3l8TRg7btai9fvNK4Wt1Evk66OyuXXXvbGszlgeXHPist77Rsik1nEg6smzfOP
	 KN3h5m1JcMbHWShlfxaKz2zkrUnl7Ll802c9GzCpaZ54wX20LP0/vVrLYVhJySVK4l
	 AVTMTTzIKezO3yawQc1AKJD6y5JpaxK8UPETcfFdXRhb8n276Jg0DEVE3P2/3X/PWF
	 IzAKclPmWezHw==
Date: Mon, 7 Sep 2026 12:49:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nick Huang <sef1548@gmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yu Ning <ningyu@eswincomputing.com>, 
	Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: Re: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Message-ID: <lfessgz6mngbwsbw4ohzr4nbk3xmikjbikaskg5rnmelmepwaz@2ev2kc6ico7l>
References: <20260905134251.67210-1-hppiscas@163.com>
 <apwrUYd3VybxbAm7@nickhuang>
 <wg57x6u3fomukerbnfbmmxywoljyrlqlctytfnqdlhl74jvigg@t3aygzlhtpui>
 <CABZAGRFSqQh1AWF=bYO5xXQWDVHK+5NVgHt9=N8wcQY2ZuK4YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZAGRFSqQh1AWF=bYO5xXQWDVHK+5NVgHt9=N8wcQY2ZuK4YQ@mail.gmail.com>
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

T24gTW9uLCBTZXAgMDcsIDIwMjYgYXQgMDY6MjM6MTlQTSArMDgwMCwgTmljayBIdWFuZyB3cm90
ZToKPiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4g5pa8IDIwMjblubQ5
5pyINeaXpemAseWFrSDkuIvljYgxMTo1NeWvq+mBk++8mgo+ID4KPiA+IE9uIFNhdCwgU2VwIDA1
LCAyMDI2IGF0IDAyOjQ2OjQxUE0gKzAwMDAsIE5pY2sgSHVhbmcgd3JvdGU6Cj4gPiA+IE9uIFNh
dCwgU2VwIDA1LCAyMDI2IGF0IDA5OjQyOjUxUE0gKzA4MDAsIGhwcC5pc2NhcyB3cm90ZToKPiA+
ID4gPiBUaGUgRVNXSU4gUENJZSBob3N0IGNvbnRyb2xsZXIgaXMgYSBwbGF0Zm9ybSBkcml2ZXIg
bWF0Y2hlZCB0aHJvdWdoCj4gPiA+ID4gZXN3aW5fcGNpZV9vZl9tYXRjaC4gUENJRV9FU1dJTiBp
cyB0cmlzdGF0ZSwgYnV0IHRoZSB0YWJsZSBpcyBub3QKPiA+ID4gPiBwdWJsaXNoZWQgZm9yIE9G
IG1vZHVsZSBhdXRvbG9hZGluZy4KPiA+ID4gPgo+ID4gPiA+IFB1Ymxpc2ggdGhpcyBwbGF0Zm9y
bS1kZXZpY2UgdGFibGUuIERvIG5vdCBjaGFuZ2UgdGhlIFJJU0MtViBob3N0Cj4gPiA+ID4gaW5p
dGlhbGl6YXRpb24gc2VxdWVuY2Ugb3IgUENJIGRldmljZSBtYXRjaGluZy4KPiA+ID4gPgo+ID4g
PiA+IEZpeGVzOiBiNTkzYzI2ZDA4MWEgKCJQQ0k6IGVzd2luOiBBZGQgRVNXSU4gUENJZSBSb290
IENvbXBsZXggZHJpdmVyIikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBocHAuaXNjYXMgPGhwcGlz
Y2FzQDE2My5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtZXN3aW4uYyB8IDEgKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2llLWVzd2luLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWVzd2lu
LmMKPiA+ID4gPiBpbmRleCBjZThkNjRmLi4xYmI0NDY5IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYwo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZXN3aW4uYwo+ID4gPiA+IEBAIC0zODgsNiArMzg4
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZXN3aW5fcGNpZV9vZl9tYXRj
aFtdID0gewo+ID4gPiA+ICAgICB7IC5jb21wYXRpYmxlID0gImVzd2luLGVpYzc3MDAtcGNpZSIs
IC5kYXRhID0gJmVzd2luX2VpYzc3MDBfZGF0YSB9LAo+ID4gPiA+ICAgICB7fQo+ID4gPiA+ICB9
Owo+ID4gPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBlc3dpbl9wY2llX29mX21hdGNoKTsK
PiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBlc3dpbl9wY2ll
X2RyaXZlciA9IHsKPiA+ID4gPiAgICAgLnByb2JlID0gZXN3aW5fcGNpZV9wcm9iZSwKPiA+ID4g
Pgo+ID4gPiBIaSBocHAuaXNjYXMKPiA+ID4KPiA+ID4gU2luY2UgdGhpcyBkcml2ZXIgdXNlcyBg
YnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoZXN3aW5fcGNpZV9kcml2ZXIpYCwgaXQKPiA+ID4gYXBw
ZWFycyB0byBiZSBidWlsdC1pbiBvbmx5LiBJbiB0aGF0IGNhc2UsIGBNT0RVTEVfREVWSUNFX1RB
QkxFKClgIHNlZW1zCj4gPiA+IHVubmVjZXNzYXJ5Lgo+ID4gPgo+ID4KPiA+IE5vcGUuIGJ1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKCkgb25seSBwcmV2ZW50cyByZW1vdmluZyB0aGUgZHJpdmVyIG9u
Y2UgbG9hZGVkLgo+ID4gU2luY2UgdGhlIGRyaXZlciBpcyBkZWZpbmVkIGFzICd0cmlzdGF0ZScg
aW4gS2NvbmZpZywgaXQgY2FuIHN0aWxsIGJlIGxvYWRlZAo+ID4gZHluYW1pY2FsbHkuIFNvIE1P
RFVMRV9ERVZJQ0VfVEFCTEUoKSB3b3VsZCBzdGlsbCBiZSBuZWNlc3NhcnkgZm9yIHVkZXYgdG8K
PiA+IGF1dG9sb2FkIHRoZSBtb2R1bGUgYmFzZWQgb24gbW9kYWxpYXMuCj4gPgo+ID4gLSBNYW5p
Cj4gPgo+ID4gLS0KPiA+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprg
rr/grrXgrq7gr40KPiBIaSBNYW5pCj4gCj4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4g
SSBzZWUgdGhhdCBidWlsdGluX3BsYXRmb3JtX2RyaXZlcigpIGRvZXMgbm90Cj4gcHJldmVudCB0
aGUgZHJpdmVyIGZyb20gYmVpbmcgYnVpbHQgYW5kIGxvYWRlZCBhcyBhIG1vZHVsZSwgc28KPiBN
T0RVTEVfREVWSUNFX1RBQkxFKCkgaXMgc3RpbGwgbmVlZGVkIGZvciBtb2R1bGUgYXV0b2xvYWRp
bmcuCj4gCj4gSG93ZXZlciwgc2luY2UgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXIoKSBkb2VzIG5v
dCBwcm92aWRlIGFuIHVucmVnaXN0ZXIKPiBwYXRoLCB0aGUgbW9kdWxlIGNhbm5vdCBiZSB1bmxv
YWRlZCB3aXRoIHJtbW9kLiBJcyB0aGF0IGludGVudGlvbmFsIGZvcgo+IHRoaXMgZHJpdmVyPwo+
IAoKWWVzLCB0aGF0J3MgaW50ZW50aW9uYWwgYW5kIG9ubHkgYXBwbGljYWJsZSBmb3IgY29udHJv
bGxlciBkcml2ZXJzIGltcGxlbWVudGluZwppcnFjaGlwLiBSZWZlciB0aGlzIGd1aWRlIGZvciBt
b3JlIGRldGFpbHM6Cmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL1BDSS9jb250cm9sbGVyL3BjaS1j
b250cm9sbGVyLWRyaXZlcnMuaHRtbCNyZW1vdmUKCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
