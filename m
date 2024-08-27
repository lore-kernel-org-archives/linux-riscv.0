Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FFDC5321D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 02:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSm12sdMRd2QImb+EM9BNmunjTVNJtnsyw8w81nfkDk=; b=xSR/i5oouIRGDB
	Y8vhkKQakL5gq+07BRisw7VqnWDRZmPffWTePA0NSWUDqtdO+e0SlGzNO7wACgtLTUpDgrJDhjaKX
	g2eDMJLKdSsSiTLtLQNUsiFOlHbgt7+kTewGuw5zK2+au3v4UbtEGCUukPMeAZ+Al160DXTGYeQx/
	o8+kcny6NsZeyHYs0QHtdfHAtORklrjuyl+hXA7d0MBk/x4hJIcnLYHq1Qv6ffUO5NobgYpBPeUEh
	C0c2qRi10hhBATnpYzUzX1ePRMgwq7zdyfaSc/ijodYPAxzFJMB7tNC7zHZFNaHbu1IM6BaDK+fMx
	sodZGe41xqjJKMqwev3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1silrd-00000009RLE-22ZH;
	Tue, 27 Aug 2024 02:23:21 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1silra-00000009RKS-29w0
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 02:23:20 +0000
Date: Tue, 27 Aug 2024 02:23:05 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240827022305.GYA155642.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
 <20240826-turbofan-unwound-280af18d60cc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826-turbofan-unwound-280af18d60cc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_192318_604440_986D2310 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ29ub3I6CgpPbiAxNzoyMiBNb24gMjYgQXVnICAgICAsIENvbm9yIERvb2xleSB3cm90ZToK
PiBPbiBNb24sIEF1ZyAyNiwgMjAyNCBhdCAwMzowOTozOUFNICswMDAwLCBZaXh1biBMYW4gd3Jv
dGU6Cj4gPiAKPiA+IE9uIDEzOjEwIFN1biAyNSBBdWcgICAgICwgWWl4dW4gTGFuIHdyb3RlOgo+
ID4gPiBBZGQgZHQtYmluZGluZyBmb3IgdGhlIHBpbmN0cmwgZHJpdmVyIG9mIFNwYWNlbWlUJ3Mg
SzEgU29DLgo+ID4gPiAKPiA+ID4gVHdvIHZlbmRvciBzcGVjaWZpYyBwcm9wZXJ0aWVzIGFyZSBp
bnRyb2R1Y2VkIGhlcmUsIEFzIHRoZSBwaW5jdHJsCj4gPiA+IGhhcyBkZWRpY2F0ZWQgc2xldyBy
YXRlIGVuYWJsZSBjb250cm9sIC0gYml0WzddLCBzbyB3ZSBoYXZlCj4gPiA+IHNwYWNlbWl0LHNs
ZXctcmF0ZS17ZW5hYmxlLGRpc2FibGV9IGZvciB0aGlzLiBGb3IgdGhlIHNhbWUgcmVhc29uLAo+
ID4gPiBjcmVhdGluZyBzcGFjZW1pdCxzdHJvbmctcHVsbC11cCBmb3IgdGhlIHN0cm9uZyBwdWxs
IHVwIGNvbnRyb2wuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5A
Z2VudG9vLm9yZz4KPiAKPiBJIGdvdCB0aGlzIG1haWwsIGFuZCBvbmUgb2YgeW91ciBvdGhlciBv
bmVzLCA1IHRpbWVzLiBXaGF0J3MgZ29pbmcgd3JvbmcKPiB3aXRoIHlvdXIgbWFpbCBzZXR1cD8g
Cj4gCk9vcHMsIHNvcnJ5IGZvciB0aGlzLCBpdCdzIHRoZSBzZWNvbmQgdGltZSB5b3UgY29tcGxh
aW4gdGhpcy4uClRCTywgSSBoYXZlIG5vIGlkZWEgd2hhdCdzIGhhcHBlbmVkLCBhc2tlZCBZYW5n
eXUsIGhlIGRpZG4ndCBoYXZlIHRoaXMgcHJvYmxlbQoKSSdtIHVzaW5nIG11dHQrbXNtdHAgdG8g
cmVwbHksIHdoaWxlIHVzaW5nIGI0IHRvIHNlbmQgdGhlIHBhdGNoIHNlcmllcywKZm9yIGFsbCB0
aGUgbWFpbHMgeW91IHJlY2VpdmVkLCBkbyB0aGV5IGFsbCBoYXZlIHNhbWUgbWVzc2FnZS1pZD8K
SSBoYXZlIGEgbG9jYWwgZmlsdGVyIGZvciBkdXBsaWNhdGVkIG1haWxzIG15c2VsZiwgY291bGQg
dGhpcyBoZWxwPwoKKEkgbGVhdmUgb25seSBvbmUgYWRkcmVzcyBvZiB5b3VyIG1haWwgaW4gdGhp
cyByZXBseSwgc2VlIGlmIHN0aWxsIGhhdmUgcHJvYmxlbT8pCgo+IHwgMjUwICAgVCBBdWcgMjUg
WWl4dW4gTGFuICAgICAgICg2LjBLKSDilIzilIA+W1BBVENIIHYyIDQvNF0gcmlzY3Y6IGR0czog
c3BhY2VtaXQ6IGFkZCBwaW5jdHJsIHByb3BlcnR5IHRvIHVhcnQwIGluIEJQSS1GMwo+IHwgMjUx
IE4gVCBBdWcgMjYgSW5vY2hpIEFtYW90byAgICggMTJLKSDilIIg4pSM4pSAPgo+IHwgMjUyICAg
VCBBdWcgMjUgWWl4dW4gTGFuICAgICAgICg2LjhLKSDilJzilIA+W1BBVENIIHYyIDMvNF0gcmlz
Y3Y6IGR0czogc3BhY2VtaXQ6IGFkZCBwaW5jdHJsIHN1cHBvcnQgZm9yIEsxIFNvQwo+IHwgMjUz
IE4gVCBBdWcgMjYgSW5vY2hpIEFtYW90byAgICggNDZLKSDilIIg4pSM4pSAPgo+IHwgMjU0ICAg
VCBBdWcgMjUgWWl4dW4gTGFuICAgICAgICggMzhLKSDilJzilIA+W1BBVENIIHYyIDIvNF0gcGlu
Y3RybDogc3BhY2VtaXQ6IGFkZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMSBTb0MKPiB8IDI1NSBO
IFQgQXVnIDI2IElub2NoaSBBbWFvdG8gICAoIDIySykg4pSCIOKUjOKUgD4KPiB8IDI1NiAgIFQg
QXVnIDI2IFlpeHVuIExhbiAgICAgICAoIDMzMykg4pSCIOKUnOKUgD4KPiB8IDI1NyAgIFQgQXVn
IDI2IFlpeHVuIExhbiAgICAgICAoIDMzOCkg4pSCIOKUnOKUgD4KPiB8IDI1OCAgIFQgQXVnIDI2
IFlpeHVuIExhbiAgICAgICAoIDMzNCkg4pSCIOKUnOKUgD4KPiB8IDI1OSAgIFQgQXVnIDI2IFlp
eHVuIExhbiAgICAgICAoIDMzNCkg4pSCIOKUnOKUgD4KPiB8IDI2MCAgIFQgQXVnIDI2IFlpeHVu
IExhbiAgICAgICAoIDMzMykg4pSCIOKUnOKUgD4KPiB8IDI2MSAgIEMgQXVnIDI1IFJvYiBIZXJy
aW5nIChBciAoOS4wSykg4pSCIOKUnOKUgD4KPiB8IDI2MiBOIEMgQXVnIDI2IEtyenlzenRvZiBL
b3psbyAoIDE0Sykg4pSCIOKUgiDilIzilIA+Cj4gfCAyNjMgTiBDIEF1ZyAyNiBJbm9jaGkgQW1h
b3RvICAgKCAxOUspIOKUgiDilIIg4pSc4pSAPgo+IHwgMjY0ICAgQyBBdWcgMjYgWWl4dW4gTGFu
ICAgICAgICggMjg1KSDilIIg4pSCIOKUnOKUgD4KPiB8IDI2NSAgIEMgQXVnIDI2IFlpeHVuIExh
biAgICAgICAoIDI4MSkg4pSCIOKUgiDilJzilIA+Cj4gfCAyNjYgTiBDIEF1ZyAyNiBZaXh1biBM
YW4gICAgICAgKCAxNEspIOKUgiDilIIg4pSc4pSAPgo+IHwgMjY3IE4gQyBBdWcgMjYgWWl4dW4g
TGFuICAgICAgICggMTJLKSDilIIg4pSCIOKUnOKUgD4KPiB8IDI2OCBOIEMgQXVnIDI2IFlpeHVu
IExhbiAgICAgICAoIDEySykg4pSCIOKUgiDilJzilIA+Cj4gfCAyNjkgICBUIEF1ZyAyNSBLcnp5
c3p0b2YgS296bG8gKCAxM0spIOKUgiDilJzilIA+Cj4gfCAyNzAgICBUIEF1ZyAyNSBZaXh1biBM
YW4gICAgICAgKCAxNEspIOKUnOKUgD5bUEFUQ0ggdjIgMS80XSBkdC1iaW5kaW5nOiBwaW5jdHJs
OiBzcGFjZW1pdDogYWRkIGRvY3VtZW50cyBmb3IgSzEgU29DCj4gfCAyNzEgICBUIEF1ZyAyNSBZ
aXh1biBMYW4gICAgICAgKDguNUspIFtQQVRDSCB2MiAwLzRdIHJpc2N2OiBzcGFjZW1pdDogYWRk
IHBpbmN0cmwgc3VwcG9ydCB0byBLMSBTb0MKPiAKCgotLSAKWWl4dW4gTGFuIChkbGFuKQpHZW50
b28gTGludXggRGV2ZWxvcGVyCkdQRyBLZXkgSUQgQUFCRUZENTUKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
