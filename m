Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D6FD277C4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 22:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uV0kVqviebO5N6SRbAAxv75YWXQ9yebpqWrYxM0CqPE=; b=OxzRENRq79mAlV
	Y/XNQSdzpSTMAJhC/j5XJUYWJNEnvK0S2Qbcq2Q7KsCRruciEhk4EiOX3Tqh/zDR5zAnMUYhmAFF3
	DoqVaqsCUh7J2rADi9QDPjnIGq+J06PocONo71BIAszJSWrXUXWydsnMSgbizlk6HyvO8b30tjC+l
	kvlMPeIz3gFrpRWyEsfxZ48nLWfrNTKWaLhg+DxT362NMAfZzxfbgr9qBP1u89WGpXcnlFuOsWYMx
	yCwejQzZa2YhjtZTlAx8vlZmdYxWKdOjo/cX7rRuuMYEuV/GNZlIcFPM6LgnEPb+GOKf2oRHqR6hL
	3u4HlIanBsaO0n5ANBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLOz-000000035jv-1cfn;
	Fri, 09 Jan 2026 22:56:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veLOw-000000035ja-46t4
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 22:56:16 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C4A453415D1;
	Fri, 09 Jan 2026 22:56:12 +0000 (UTC)
Date: Sat, 10 Jan 2026 06:56:08 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20260109225608-GYA8877@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
 <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_145615_041421_85D36F1C 
X-CRM114-Status: GOOD (  15.78  )
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

SGkgR3VvZG9uZywgCgpPbiAyMDoyMCBGcmkgMDkgSmFuICAgICAsIEd1b2RvbmcgWHUgd3JvdGU6
Cj4gSGksIFlpeHVuCj4gCj4gT24gRnJpLCBKYW4gMiwgMjAyNiBhdCAzOjA04oCvUE0gWWl4dW4g
TGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+ID4KPiA+IEFkZCBuZXcgY29tcGF0aWJsZSBz
dHJpbmcgZm9yIFNwYWNlbWlUIEszIFNvQywgdGhlIHBpbmN0cmwgSVAgc2hhcmVzCj4gPiBhbG1v
c3Qgc2FtZSBsb2dpYyB3aXRoIHByZXZpb3VzIEsxIGdlbmVyYXRpb24sIGJ1dCBoYXMgZGlmZmVy
ZW50IHJlZ2lzdGVyCj4gPiBvZmZzZXQgYW5kIHBpbiBjb25maWd1cmF0aW9uLCBmb3IgZXhhbXBs
ZSB0aGUgZHJpdmUgc3RyZW5ndGggYW5kCj4gPiBzY2htaXR0ZXIgdHJpZ2dlciBzZXR0aW5ncyBo
YXMgYmVlbiBjaGFuZ2VkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBn
ZW50b28ub3JnPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9z
cGFjZW1pdCxrMS1waW5jdHJsLnlhbWwgICAgICAgfCAxMCArKysrKysrKystCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zcGFjZW1pdCxr
MS1waW5jdHJsLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9zcGFjZW1pdCxrMS1waW5jdHJsLnlhbWwKPiA+IGluZGV4IDYwOWQ3ZGI5NzgyMi4uOWE3NmNm
ZmNiYWVlIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvc3BhY2VtaXQsazEtcGluY3RybC55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zcGFjZW1pdCxrMS1waW5jdHJsLnlhbWwKPiA+
IEBAIC04MSw2ICs4MywxMiBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICAgICAgICAgICAgICAg
IC0gZW51bTogWyA3LCAxMCwgMTMsIDE2LCAxOSwgMjMsIDI2LCAyOSBdCj4gPiAgICAgICAgICAg
ICAgICAgIGRlc2NyaXB0aW9uOiBGb3IgSzEgU29DLCAzLjNWIHZvbHRhZ2Ugb3V0cHV0Cj4gPgo+
ID4gKyAgICAgICAgICAgICAgLSBlbnVtOiBbIDIsIDQsIDYsIDcsIDksIDExLCAxMywgMTQsIDIx
LCAyMywgMjUsIDI2LCAyOCwgMzAsIDMxLCAzMyBdCj4gPiArICAgICAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBGb3IgSzMgU29DLCAxLjhWIHZvbHRhZ2Ugb3V0cHV0Cj4gPiArCi4uCj4gPiArICAg
ICAgICAgICAgICAtIGVudW06IFsgMywgNSwgNywgOSwgMTEsIDEzLCAxNSwgMTcsIDI1LCAyNywg
MjksIDMxLCAzMywgMzUsIDM3LCAzOCBdCj4gPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9u
OiBGb3IgSzMgU29DLCAxLjhWIHZvbHRhZ2Ugb3V0cHV0Cj4gCj4gU2hvdWxkIG9uZSBvZiB0aGVz
ZSBiZSAzLjNWPyBCb3RoIGRlc2NyaXB0aW9ucyBjdXJyZW50bHkgc3BlY2lmeSAxLjhWLgo+IApy
aWdodCwgdGhlIGxhdHRlciBvbmUgc2hvdWxkIGJlIGNoYW5nZWQgdG8gMy4zViwgSSB3aWxsIHNl
bmQgYSBwYXRjaAp0byBmaXggdGhpcy4KCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
