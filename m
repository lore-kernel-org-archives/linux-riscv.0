Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0456CC982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 08:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Message-Id:Mime-Version:From:Subject
	:To:Date:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtcGiaPkMLIiXcxJWDQPPwtLKiKoRoiIPgnxdQgEJI0=; b=VHpPBV8gz9j1m0
	B3/qu8nc9NIFLJjGbloK4x0jnlyUUHMSjNVzoeCOjdyfw9Bkk8d5d7cRrF8zRUmvOwJW/Yz2lOrET
	j8DXGDFdz66JarpifIHVVN0Q2OS2n9o0fpTOr2EODBMS2Z0yoUh1i85hYKyQLgPQLfKCrdYE0QXPw
	E00aMoTEkhTpMc15M+VXjaN8U1UhyYcrnzdvwx4Zyev8HKQYVIDjhgZnp2H/y9ZEe+qmjgruITDut
	Ij4sRLwNzipHqpRi1hUz3ekJxTM7IXllPi6gJDAVZke/xIfizoKJBxSoodWsFL2Cv3OogWWTTzeF8
	6NU6GjBZpk+jYCS6/X1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Huk-00000007SUt-15DY;
	Wed, 23 Sep 2026 08:01:14 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Huh-00000007SUS-1GzJ
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 08:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790150465;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=eTRjkNjbTBU25TMiMCm7OeagUXe/qlq8QV1fQTMIa2M=;
 b=fzg5iVMPH6muvRXTpJT9NftS1H2nut2WMd5lfpjpF1acT3Z7yHLgFuiJYzG8H9NL5iubWd
 gCDHS1goF8clRFzuMZTyozj8fPCzXR7KWA2B1aTO2Fk4kQHgnd9G6mRV1d1+S4dRstHyIy
 EBbV3amGcunbsUjSwSbx9dG29e+77Nz1EFlicj0hWVqg7MpmfZsBhzrd1vYF7gaUQZx+Ya
 Pc1VhQ7AmQdAJc3AAIbJNMzuiPxXiGOlcUo/yC5daDICkpZwdZ76Vxrdg3qLTj1bldzKEp
 zbcQUiSuJ2lpP3HDSJKkH5TSwCyeMgqke4SeNxp05Q22isnbq9M2OKI1B6lbeA==
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110450.3426070-1-sandie.cao@deepcomputing.io> <DLMC741RLFU5.3FF1DL7YEIFK9@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.2bcc8e57.b8bf.421b.9230.3eea00252952@feishu.cn>
	<DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
In-Reply-To: <DLMI4JHT5Q8L.2MHI30VCCP3W9@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab38740+c8d4e1+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Wed, 23 Sep 2026 16:01:01 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.64156e26.f1af.46d5.a18c.19bc541257f8@feishu.cn>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_010111_492165_44F4D976 
X-CRM114-Status: GOOD (  16.46  )
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
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxNTowMgo+IE9uIFdlZCwg
U2VwIDIzLCAyMDI2IGF0IDAyOjM1OjIwUE0gKzA4MDAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBG
TUwxM1YwNSBTRCBjYXJkIHNsb3QgaXMgaW5zaWRlIHRoZSBib2FyZCwgaXQgZG9lc24ndCBuZWVk
IGNkLWdwaW8sCj4gPiBGTUwxM1YwNSBLZWVwcyBHUElPODggdG8gbG93LCBUaGVuIFNEIGNhcmQg
aXMgYWx3YXlzIG9uIGZvciBTRCBDYXJkCj4gPiBkcml2ZXIuCj7CoAo+IEFuIGludGVybmFsIHNs
b3QgZG9lcyBub3QgbmVjZXNzYXJpbHkgbWVhbiB0aGUgY2FyZCBpcyBub24tcmVtb3ZhYmxlLgo+
IEkgZG9uJ3QgdGhpbmsgaXRzIGxvY2F0aW9uIGFsb25lIGp1c3RpZmllcyBrZWVwaW5nIGNhcmQg
ZGV0ZWN0IGFzc2VydGVkOgo+IEdQSU84OCB3b3VsZCByZXBvcnQgYSBjYXJkIHByZXNlbnQgZXZl
biB3aGVuIHRoZSBzbG90IGlzIGVtcHR5LgoKWWVzLiBUaGUgRk1MMTNWMDUgaGFyZHdhcmUgaXMg
ZGVzaWduZWQgZm9yIHRoaXMuIFdlIGNhbid0IGNoYW5nZSBpdC7CoAoKPsKgCj4gPiBXZSBjaGVj
ayB0aGUgdm1tYy1zdXBwbHkgaXMgcDN2My4gV2UgaGF2ZSB0aGUgc2FtZSBTREsgRFRTIGNvbmZp
ZyB3aXRoCj4gPiBrM19jb20yNjBbMV0gLCBzbywgdGhpcyBwYXRjaCBmb2xsb3dzIHRoZSBTRCBj
YXJkIHBhdGNoIG9mIGszX2NvbTI2MAo+ID4gZHRzWzJdLgo+ID4KPiA+IElmIHRoaXMgaXMgbm90
IGNvcnJlY3QsIHdlIHdpbGwgY2hhbmdlIGl0Lgo+wqAKPiBDb3VsZCB5b3UgY29uZmlybSBmcm9t
IHRoZSBzY2hlbWF0aWNzIHRoYXQgdGhlIFNEIHBvd2VyIHdpcmluZyBtYXRjaGVzCj4gQ29NMjYw
IGFuZCB0aGF0IHRoZSBjYXJkJ3MgVkREIGlzIGFjdHVhbGx5IGNvbm5lY3RlZCB0byBBTERPND8g
SWYgc28sCj4gdGhpcyBzdXBwbHkgcmVmZXJlbmNlIGlzIGZpbmUuIFRoZSBzYW1lIFNESyBjb25m
aWd1cmF0aW9uIGFsb25lIGRvZXMKPiBub3QgZXN0YWJsaXNoIHRoZSB3aXJpbmcuCj7CoAo+IElm
IHRoZSBjYXJkIGluc3RlYWQgdXNlcyBhIGZpeGVkLCBhbHdheXMtb24gc3VwcGx5IHdpdGggbm8g
c29mdHdhcmUgcG93ZXIKPiBjb250cm9sLCB2bW1jLXN1cHBseSBpcyBvcHRpb25hbCBmb3IgdGhl
IE1NQyBjb3JlOyBpdCBzaG91bGQgbm90IHBvaW50IHRvCj4gYW4gdW5yZWxhdGVkIEFMRE80IHJh
aWwuCgpXZSBjaGVjayB0aGUgc2NoZW1hdGljcyBib3RoIG9mIENPTTI2MCBhbmQgRk1MMTNWMDUs
IGJvdGggdXNlIHAzdjMgKGEgZml4ZWQsIGFsd2F5cy1vbiBzdXBwbHkgd2l0aCBubyBzb2Z0d2Fy
ZSBwb3dlciBjb250cm9sKSwgbm90IEFMRE80LiBBTEQwNCBpcyBvbmx5IGZvciBVU0IuCldlIHdp
bGwgY29ycmVjdCBpdCBpbiBuZXh0IHBhdGNoLgoKQmVzdCByZWdhcmRzClNhbmRpZQoKPsKgCj4g
LS3CoAo+IFRyb3kgTWl0Y2hlbGwKPsKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
