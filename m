Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56342C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVmVb8QMipmNwqiHaK/XM9MBgOdVFPmg85wmbBjS5W4=; b=av+kuaURyiEazy
	MkjNZnvdcT/6yw7QBzaplt7AjubAOotxABQ0Rp1KALgeMdgG7YQ2JCaDj2Fos7dqlpS6luWVctZGa
	CBOm3uctdguGa/KQ+zpOslp2qX4Dosc5b1y+EQZpNLkZgt6Z2Ixm66TTBaUFyE/ZFeVlKfvcv9EjT
	5Xu2eeQseIoQprwXK9FAAeA3sUsDc9SeL7o9j79sAnfT8XrAk2/mqImQDOI/vJ7mXndCO7KWiINM6
	dkXItf/Y5ephikyy+eM9sGooR3X9F4YptH2ugwNy+w9CgE1Eev6q7KD88ccpu/30nMy1Qd7VM1bm6
	Wzu2wuVJZDlh07zXEK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9jk-00CDTU-2s;
	Thu, 07 Dec 2023 08:28:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB9ji-00CDQm-0S
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 08:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 66F38B82595
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6201C43397
	for <linux-riscv@lists.infradead.org>; Thu,  7 Dec 2023 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701937672;
	bh=HdOGiDC74cN+R/1jMps1M6Cpu/JgOIIA9PS+KkU5Jho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EgoWbrNoeKido2fp/wA97ahq5XsTXL4sEr/J2gWH910uAuctgxAFaAILpYZDqyyuy
	 a9AfrDDgo+547ZeCPEmkjBIADRRzWvX2IVano5agHWaqcLO4jdUpnzxT2HMeIg56VK
	 +fAIABDaN+RtzZZUovQJb73/hWDBPOvwfO6Y2zmeG2rpZAPOCg9NxQ+U1xNZCn9pwA
	 ZBHG+h4KbU8ElJ/hUEb32SDhmwDGZy91f92qsb0TdeaxyCjKyt0LRIV0vNgtMArvNJ
	 oGOP1IR+GloFvwX+L5GW1wnXVVvH3dtuMzZvQYac+sh+OSlRcaB4PTn5Z1OiUNvGnZ
	 /tozLi9yduL/g==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a1ec87a7631so30874866b.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 00:27:52 -0800 (PST)
X-Gm-Message-State: AOJu0YwkK62W9zjZpVPuzuAxIRVWqNi2KnbZf3UtqzTWxPEd5kZChfYJ
	e0B6OFT0ZsXPemYmveiTFPYV8Cjs62afteSQLxE=
X-Google-Smtp-Source: AGHT+IEEeQLs48FjD1tu1jCgFUiaF0NFFL7hxNR/0WeiCAyg/3xhAHxC8hLAJhTy47fdCXPPs95Vlrxh7blFLytYhjg=
X-Received: by 2002:a17:906:a2d0:b0:a17:ab92:3d55 with SMTP id
 by16-20020a170906a2d000b00a17ab923d55mr1658721ejb.19.1701937671332; Thu, 07
 Dec 2023 00:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com> <20231206-th1520_mmc_dts-v8-3-69220e373e8f@baylibre.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-3-69220e373e8f@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 7 Dec 2023 16:27:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSXwFpnQKxKx2SkV91rjE1zo5L8Y=jVoc+A0CO1i3mz1Q@mail.gmail.com>
Message-ID: <CAJF2gTSXwFpnQKxKx2SkV91rjE1zo5L8Y=jVoc+A0CO1i3mz1Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] riscv: dts: thead: Enable BeagleV Ahead eMMC and microSD
To: Drew Fustini <dfustini@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_002758_466453_88C09719 
X-CRM114-Status: GOOD (  13.32  )
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

T24gV2VkLCBEZWMgNiwgMjAyMyBhdCA0OjA54oCvUE0gRHJldyBGdXN0aW5pIDxkZnVzdGluaUBi
YXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gQWRkIGVtbWMgbm9kZSBwcm9wZXJ0aWVzIGZvciB0aGUg
ZU1NQyBkZXZpY2UgYW5kIGFkZCBzZGlvMCBub2RlCj4gcHJvcGVydGllcyBmb3IgdGhlIG1pY3Jv
U0Qgc2xvdC4gU2V0IHRoZSBmcmVxdWVuY3kgZm9yIHRoZSBzZGhjaQo+IHJlZmVyZW5jZSBjbG9j
ay4KPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFnbGV2LWFoZWFk
LmR0cyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1
MjAtYmVhZ2xldi1haGVhZC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1i
ZWFnbGV2LWFoZWFkLmR0cwo+IGluZGV4IDcwZTgwNDJjODMwNC4uZDliNGRlOWU0NzU3IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWJlYWdsZXYtYWhlYWQu
ZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVhZ2xldi1haGVh
ZC5kdHMKPiBAQCAtNDgsNiArNDgsMTAgQEAgJmFwYl9jbGsgewo+ICAgICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDYyNTAwMDAwPjsKPiAgfTsKPgo+ICsmc2RoY2lfY2xrIHsKPiArICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDwxOTgwMDAwMDA+Owo+ICt9Owo+ICsKPiAgJnVhcnRfc2NsayB7Cj4g
ICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwMDAwPjsKPiAgfTsKPiBAQCAtNTYsNiAr
NjAsMjIgQEAgJmRtYWMwIHsKPiAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPgo+ICsm
ZW1tYyB7Cj4gKyAgICAgICBidXMtd2lkdGggPSA8OD47Cj4gKyAgICAgICBtYXgtZnJlcXVlbmN5
ID0gPDE5ODAwMDAwMD47Cj4gKyAgICAgICBtbWMtaHM0MDAtMV84djsKPiArICAgICAgIG5vbi1y
ZW1vdmFibGU7Cj4gKyAgICAgICBuby1zZGlvOwo+ICsgICAgICAgbm8tc2Q7Cj4gKyAgICAgICBz
dGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmc2RpbzAgewo+ICsgICAgICAgYnVzLXdpZHRo
ID0gPDQ+Owo+ICsgICAgICAgbWF4LWZyZXF1ZW5jeSA9IDwxOTgwMDAwMDA+Owo+ICsgICAgICAg
c3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+ICsKPiAgJnVhcnQwIHsKPiAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsKPiAgfTsKPgo+IC0tCj4gMi4zNC4xCj4KTWF5YmUsIHdlIGNvdWxkIHNoYXJlIHNv
bWUgcGFydHMgd2l0aCB0aDE1MjAtbGljaGVlLW1vZHVsZS00YS5kdHNpLgpPdGhlcnMsIExHVE0u
fAoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
