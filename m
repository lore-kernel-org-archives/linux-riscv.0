Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDE4C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9Kok9uf9hFWYstR5HFiknCwvkq5DAYJRfdD7FPR4FI=; b=eYHSDLuix5UE8h
	6AY7o5ZOug8JuHdxh/0Oxxf9yeVAtshMjGQbhLgmuQLF1k1rZ7dVDj08hMWUnB2ndatu2nwVrEQv4
	bwxqG7i44I2CLLMg1QxFzdmF7FbEZXU0g+eon+pUo89lyZYLUKmImINDcYQrfrQSIYOoG7F6HzBLS
	gOaIms/od+bGJgcD1P0s+cWTjPp41f15kX0MU9+i8lZ/WCw/+lkJTD1Qd5j2ttm8kFtgjCcVBBB4L
	ZDXa8dP5ZJEh55OHsJon5rBT+kPsw0mxofMKJ7xdtg0p9ykuaNaNDUtr/Ga22M50sRCqzdaB+wANa
	B6Y4s9Ie707gwQl2p4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2MV-00000006Uw9-2IDy;
	Thu, 06 Feb 2025 13:56:11 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1zB-00000006Riy-0Kos
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:32:06 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E15F4342FF5;
	Thu, 06 Feb 2025 13:32:01 +0000 (UTC)
Date: Thu, 6 Feb 2025 13:31:56 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250206133156-GYA5687@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org>
 <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_053205_147321_71FB9715 
X-CRM114-Status: GOOD (  24.81  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGludXMgYW5kIERUIG1haW50YWluZXJzOgoKT24gMTA6MTggVGh1IDA2IEZlYiAgICAgLCBM
aW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIFlpeHVuLAo+IAo+IE9uIFR1ZSwgSmFuIDI4LCAyMDI1
IGF0IDU6MDPigK9QTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgNDoxN+KAr0FNIFlpeHVuIExhbiA8ZGxh
bkBnZW50b28ub3JnPiB3cm90ZToKPiA+Cj4gPiA+IFtSb2JdCj4gPiA+ID4gSWYgTGludXggY2Fu
J3QgaGFuZGxlIDEgbm9kZSBmb3IgTiBncGlvX2NoaXAncywgdGhlbiB0aGF0J3MgYSBMaW51eAo+
ID4gPiA+IHByb2JsZW0uIE1heWJlIGl0IGNhbiwgSURLLgo+ID4gPgo+ID4gPiBJIGhhdmVuJ3Qg
c2VlbiBzb210aGluZyBsaWtlIHRoaXMgdG8gcmVnaXN0ZXIgMSBub2RlIGZvciBtdWx0aSBncGlv
X2NoaXBzLi4KPiA+ID4gVG8gZ3Bpby9waW5jdHJsIG1haW50YWluZXIgKExpbnVzIFdhbGxlaWop
LCBkbyB5b3UgaGF2ZSBzdWdnZXN0aW9uIG9uIHRoaXM/Cj4gPgo+ID4gRm9yIExpbnV4IHdlIGNh
biBjYWxsIGJncGlvX2luaXQoKSB0aHJlZSB0aW1lcyBhbmQKPiA+IGRldm1fZ3Bpb2NoaXBfYWRk
X2RhdGEoKSB0aHJlZSB0aW1lcyBvbiB0aGUgcmVzdWx0IGFuZCBpZiB3ZSB1c2UgdGhlCj4gPiBh
cHByb2FjaCB3aXRoIHRocmVlIGNlbGxzICh3aGVyZSB0aGUgc2Vjb25kIGlzIGluc3RhbmNlIDAs
MSwyIGFuZCB0aGUKPiA+IGxhc3Qgb25lIHRoZSBvZmZzZXQgMC4uMzEpIHRoZW4gaXQgd2lsbCB3
b3JrIGFsbCBqdXN0IHRoZSBzYW1lIEkgZ3Vlc3M/Cj4gPgpib3RoIGJncGlvX2luaXQoKSBhbmQg
ZGV2bV9ncGlvY2hpcF9hZGRfZGF0YSgpIG9wZXJhdGUgb24gcGVyICJzdHJ1Y3QgZ3Bpb19jaGlw
IiBiaWFzLAp3aGljaCBtZWFuIHRoZXkgbmVlZCB0byByZXF1ZXN0IHRocmVlIGluZGVwZW5kZW50
IGdwaW8gY2hpcHMuLgoKPiA+IGZvby1ncGlvcyA8JmdwaW8gMiA3IEdQSU9fQUNUSVZFX0xPVz47
CmlmIHdlIG1vZGVsIHRoZSBkdHMgYXMgYWJvdmUsIHRoZW4gIiZncGlvIiB3aWxsIHJlZ2lzdGVy
IGl0c2VsZiBhcyBvbmUgc29sZSAic3RydWN0IGdwaW9fY2hpcCIsCiB3aGljaCBtZWFuIG9uZSBn
cGlvIGNoaXAgY29tYmluZSB0aHJlZSBiYW5rcy4uIEkndmUgbG9va2VkIGF0IHRoZSBzdW54aSBk
cml2ZXIgd2hpY2gKU2FtdWVsIHBvaW50ZWQsIGltcGx5IHNhbWUgZXhhbXBsZSBhcyB0aGlzLgoK
aWYgdGFraW5nICJvbmUgZ3BpbyBjaGlwIHN1cHBvcnQgbXVsdGkgYmFua3MiIGRpcmVjdGlvbiwg
dGhlbiBpdCB3aWxsIGJlIHJldmVydGVkIGJhY2sgYXMgcGF0Y2ggVjEsCnRoZW4sIGV2ZW4gdGhl
IHRocmVlIGdwaW8tY2VsbHMgbW9kZWwgaXMgdW5uZWNlc3NhcnkgbmVlZGVkLCBhcyB3ZSBjYW4g
bWFwIGdwaW8gbnVtYmVyCiB0byB0aGUgPGJhbmssIG9mZnNldD4gYXJyYXkgaW4gdGhlIHVuZGVy
bHlpbmcgZ3BpbyBkcml2ZXIKCnRoZSB2NCBwYXRjaCBpcyB2ZXJ5IHNpbWlsYXIgdG8gZHJpdmVy
cy9ncGlvL2dwaW8tZHdhcGIuYwoKSWYgaGFkIHRvIGNob29zZSB0aGUgZGlyZWN0aW9uIGJldHdl
ZW4gdjEgYW5kIHY0LCBJIHBlcnNvbmFsbHkgd291bGQgZmF2b3IgdGhlIGxhdHRlciwKIGFzIGZy
b20gaHcgcGVyc3BlY3RpdmUsIGVhY2ggZ3BpbyBiYW5rIGlzIHF1aXRlIGluZGVwZWRlbnQgLSBo
YXMgaXRzIG93biBpby9pcnEgcmVnaXN0ZXJzLAogbWVyZWx5IGhhcyBpbnRlcmxlYXZlZCBpbyBt
ZW1vcnkgc3BhY2UsIG9uZSBzaGFyZWQgSVJRIGxpbmUuLiBhbHNvIHRoZSBwYXRjaCB2NCBsZXZl
cmFnZQogbG90cyB1bmRlcmx5aW5nIGdlbmVyaWMgZ3BpbyBBUElzLCByZXN1bHQgaW4gbXVjaCBz
aW1wbGlmaWVkL2NsZWFuIGNvZGUgYmFzZS4uCgo+ID4KPiA+IGZvciBvZmZzZXQgNyBvbiBibG9j
ayAyIGZvciBleGFtcGxlLgo+ID4KPiA+IFdlIG5lZWQgYSBjdXN0b20geGxhdGUgZnVuY3Rpb24g
SSBzdXBwb3NlLgo+ID4KPiA+IEl0IGp1c3QgaGFzIG5vdCBiZWVuIGRvbmUgdGhhdCB3YXkgYmVm
b3JlLCBldmVyeWJvZHkganVzdCBkaWQKPiA+IDItY2VsbCBHUElPcy4KPiAKPiBkb2VzIHRoaXMg
YXBwcm9hY2ggd29yayBmb3IgeW91PyBJIHRoaW5rIGl0J3MgdGhlIG1vc3QgZGlwbG9tYXRpYy4K
PiAKPiBJJ20gc29ycnkgYWJvdXQgdGhlIGhvcGVsZXNzIGJhY2stYW5kLWZvcnRoIHdpdGggdGhl
IGJpbmRpbmdzLCBhbHNvCj4gZm9yIGNvbnRyaWJ1dGluZyB0byB0aGUgbWVzc3kgZGViYXRlLiBJ
IGRvIHdhbnQgZGV2ZWxvcGVycyB0byBmZWVsCj4gZW5jb3VyYWdlZCB0byBjb250cmlidXRlIGFu
ZCBub3QgZ2V0IHN0dWNrIGluIHRvbyBsb25nIGRlYmF0ZXMuCj4gCj4gWW91cnMsCj4gTGludXMg
V2FsbGVpagoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExpbnV4IERldmVsb3BlcgpHUEcg
S2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
