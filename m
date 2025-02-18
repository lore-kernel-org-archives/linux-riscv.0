Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980D2C02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfFJOAKSjHCm+DO6pOl7AvPYqBCOYOdCChd1ynbCI18=; b=v8pVnoiFLnz3fH
	MZQm1cU0rBAdqnJZQV9cx07uQGa2gAJuNp6crsH3RDiT/kHHBxaxXpyeCUEt9fHjVWDAUglWmoBas
	vZ1xGvMgqT3nwNRdlau33BptIAAjrGb63xinppCoYnZ1o1l4nGchmF1vXpPBL+dTvycTp/iuvi229
	y88fqbv6C0misvZCJl81rVxhN6kv8LvzETuDnGqS0n1Z7A0VJLeuhSokrbQGkC97tIRznphepniu7
	c7p4w9XohMdmvuk01XPmCsbVV4CLq+NEyXWZbQ11mn4h/0SPqAI7knozYb4G+lVOTNjdaF0jPO1cb
	hm1UFYIqoeZDTGkKJCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLKn-00000007r94-367w;
	Tue, 18 Feb 2025 11:00:13 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLK2-00000007r2V-3MCG
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 10:59:27 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C9223342FA4;
	Tue, 18 Feb 2025 10:59:23 +0000 (UTC)
Date: Tue, 18 Feb 2025 10:59:19 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250218105919-GYB29065@gentoo>
References: <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo>
 <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
 <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
 <20250218095540-GYA29065@gentoo>
 <CACRpkdZiD7LRAk3hhvWdnf9DCuQCWGLoE1xd_z9ddRKZP=uvLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZiD7LRAk3hhvWdnf9DCuQCWGLoE1xd_z9ddRKZP=uvLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_025926_867619_1DD6ACE0 
X-CRM114-Status: GOOD (  18.35  )
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

SGkgTGludXM6CgpPbiAxMToxNyBUdWUgMTggRmViICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gT24gVHVlLCBGZWIgMTgsIDIwMjUgYXQgMTA6NTXigK9BTSBZaXh1biBMYW4gPGRsYW5AZ2Vu
dG9vLm9yZz4gd3JvdGU6Cj4gCj4gPiA+IEkgd2lsbCBwb3N0IGl0IHJlYWwgc29vbi4KPiA+ID4K
PiA+IGNhbiB5b3UgY2hlY2sgdGhlIHY1IG9mIHRoZSBwYXRjaCBoZXJlIFsxXT8gd2hpY2ggSSBq
dXN0IHNlbnQgb3V0IHllc3RlcmRheQo+ID4gaXQgZG9lcyAxKSBpbXBsZW1lbnQgeGxhdGUoKSAy
KSBpbnN0cm9kdWNlIGN1c3RvbSBhZGRfcGluX3BhZ2UoKQo+ID4gdGhlIGdwaW8gcGFydCB3b3Jr
cyBhcyBJIHRlc3RlZCwgdGhlIGdwaW8gaXJxIHByb2JhYmx5IG5lZWQgbW9yZSB0ZXN0aW5nCj4g
Cj4gQWggbmljZSEgSSBoYXZlIHRoZSBzYW1lIGlkZWEsIGJ1dCBJIGp1c3QgYnJpbmcgYWxsIHRo
ZSBzdHVmZiB5b3UKPiBuZWVkIHRvIHJlaW1wbGVtZW50IGluIHlvdXIgZHJpdmVyIGludG8gdGhl
IGNvcmUgaW5zdGVhZC4KPiAKPiBZb3VyIGRyaXZlciBhbmQgYmluZGluZ3Mgd2lsbCBsb29rIHRo
ZSBzYW1lLCB5b3Ugd2lsbCBqdXN0IGRvCj4gbm90IG5lZWQgdG8gcmVpbXBsZW1lbnQgdGhlIHRy
YW5zbGF0aW9uIGZ1bmN0aW9ucyAoaWYgbXkgY29kZQo+IHdvcmtzIGFzIEkgaW50ZW5kZWQuLi4p
Cj4gCmdyZWF0ISBJIHdpbGwgdGVzdCBhbmQgbGV0IHlvdSBrbm93IGlmIGl0IHdvcmtzLCBtYW55
IHRoYW5rcy4uCgo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCi0tIApZaXh1biBMYW4gKGRsYW4p
CkdlbnRvbyBMaW51eCBEZXZlbG9wZXIKR1BHIEtleSBJRCBBQUJFRkQ1NQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
