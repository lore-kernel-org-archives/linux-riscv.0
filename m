Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76372606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4pv5TBbA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J7ZNnKNl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A0MU0lp+9n7OpIaqo74ginM81RI0HrxVnYrkdO+hHkI=; b=4pv5TBbAWicXdonBtcU8bsSazI
	GE9s/5FcZZA20QMJl1RbTBG/yl/oGS+s55p+13FIXPb4Y3owJCjzHCuf4paOHszqT8Kt8PlX1ebKM
	+v1h6KHpzekZD269/h3ZFcP1qMAVtkRkQdIqjNgVpheZWsMo4NlYTBWq6N3WfFhoixwcQ6qfp7uNb
	efYP01oPbUK78r0JOnjuHh4qqodXqyLtjVu7aK6wlOq+cl7Jg8UWXopRmxxsyb0r+Ti87Boz/oZEK
	4HE4+V8jaAYIBTsZ+5ay1gwnf0j6QQqnFpkYaGdAP/kWYE7vFhpmH8pg7lbci7IrnRBYa6vj6IxXF
	J4n0FaHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUxF-0000000HC5k-0pHC;
	Sun, 15 Nov 2026 07:47:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUxE-0000000HC5a-1mOl
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 07:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2F6045AF9
	for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 07:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B6C1F000C6
	for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794728831;
	bh=QaisxT3Fa6hlWE5Ty6mdpOvqQQNuxHko9RuFnaPX8Uo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=J7ZNnKNlpxEb/19UJJEz3BhJiskhmm0QzcjEwP/S1Br8AByopZBL/VWWvVTdR9G7t
	 du9uHIPuRQScyu7Mm3Mop28JwtdSpv2xQYfYv3TPJkXHjD47HJLhni5mqjC8re1Po7
	 zRScrP6+rzujm0WtUcUbVG4R09ttQAeKq9aoITTTgRXfM2hqVoscY/fSw3G5w4o+8o
	 LpO9OhXTkcF2uLloZIvI1UT/Xx/vgwVihB7VH0Z6m2h9nQLLu8f+YCEJe/nYruGThn
	 LF4sGQPgyS8qvtgqi9DO2mBJjrO5xfetyfvADnid9WSOInTvhThBvNvLK6/IJTFd+w
	 dvuigEWzHq8ig==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so31713061fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 23:47:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFQPgdlq+VfeZjOitt4300xxbvUZLWItPlPMF3v8HFTnGLh8Jz+wUefB0ogkw2vlCb7rRoJs6GdLSHVbg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9WQaTSfpGi1ss/78qbrh0g4ptuxjuattyfFpF4r32ekER1L5gZ
	WI9EsDcwv76dhOky0QUNercjiOcgjXfN6FbXGj/mrQeMe5IKFv3ctoD74Nb9tiQ6O6Ec736CP4E
	fkBlSqS1kVxWUByJKUTIj1Kf2ZVOKqSU=
X-Received: by 2002:a05:651c:e18:b0:3ab:185f:575d with SMTP id
 38308e7fff4ca-3ae2b4bada8mr16065201fa.4.1794728829847; Sat, 14 Nov 2026
 23:47:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me> <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 15:46:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
X-Gm-Features: AclHuK8xqthT2mk78Qu4LiOErq4MI1hrWtnj6E-DaIslpwgy2sOPNhpmEiJiSYo
Message-ID: <CAGb2v66t+PuaBsANs4wEuH8rGs9zyT7GpviSkoRE3jdPKE_GFw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, Palmer Dabbelt <palmer@sifive.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Andre Przywara <andre.przywara@arm.com>, Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBOb3YgMTUsIDIwMjYgYXQgMzozMuKAr1BNIEplcm5laiDFoGtyYWJlYyA8amVybmVq
LnNrcmFiZWNAZ21haWwuY29tPiB3cm90ZToKPgo+IERuZSBuZWRlbGphLCAxNS4gbm92ZW1iZXIg
MjAyNiBvYiAwNjoxMTozMSBTcmVkbmplZXZyb3Bza2kgc3RhbmRhcmRuaSDEjWFzIGplIEljZW5v
d3kgWmhlbmcgbmFwaXNhbChhKToKPiA+IOWcqCAyMDI2LTExLTE05YWt55qEIDA2OjMzICswODAw
77yMSGFuIEdhbyB2aWEgQjQgUmVsYXnlhpnpgZPvvJoKPiA+ID4gRnJvbTogSGFuIEdhbyA8Z2Fv
aGFuQGlzY2FzLmFjLmNuPgo+ID4gPgo+ID4gPiBBZGQgbXlzZWxmIGFzIG1haW50YWluZXIgZm9y
IHRoZSBWODYxIGJpbmRpbmdzLCBjbG9jayBhbmQgcGluIGNvbnRyb2wKPiA+ID4gZHJpdmVycyBh
bmQgZGV2aWNlIHRyZWVzLgo+ID4KPiA+IEkgdGhpbmsgdHJhZGl0aW9uYWxseSBzdW54aSBkbyBu
b3QgYWRkIG1haW50YWluZXJzIGZvciBzcGVjaWZpYyBTb0NzLgo+ID4KPiA+IE1heWJlIHlvdSBz
aG91bGQgcGF0Y2ggdGhlIHJlZ2V4cCBvZiAiQVJNL0FsbHdpbm5lciBzdW5YaSBTb0Mgc3VwcG9y
dCIKPiA+IGl0ZW0gaW5zdGVhZC4KPgo+IFVzdWFsbHkgbm8gZW50cmllcyBhcmUgYWRkZWQgYXQg
YWxsLgoKSWYgeW91IGRvIHdhbnQgdG8gaGVscCBvdXQgYW5kIHJldmlldywgcGxlYXNlIGFkZCB5
b3Vyc2VsZiBhcyB0aGUKcmV2aWV3ZXIgaW5zdGVhZCAoc2luY2UgeW91IGFyZW4ndCB0aGUgb25l
IHRha2luZyB0aGUgcGF0Y2hlcykuCgpDaGVuWXUKCj4gPgo+ID4gVGhhbmtzLAo+ID4gSWNlbm93
eQo+ID4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFj
LmNuPgo+ID4gPiAtLS0KPiA+ID4gIE1BSU5UQUlORVJTIHwgMTIgKysrKysrKysrKysrCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+ID4gPiBpbmRleCA5M2FiYmIzMTUwNjUuLmRm
YzMwMGRjMWViMiAxMDA2NDQKPiA+ID4gLS0tIGEvTUFJTlRBSU5FUlMKPiA+ID4gKysrIGIvTUFJ
TlRBSU5FUlMKPiA+ID4gQEAgLTI0MDMxLDYgKzI0MDMxLDE4IEBAIEY6IGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW50Yy5jCj4gPiA+ICBGOiBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3Yt
YXBsaWMuaAo+ID4gPiAgRjogaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+
ID4KPiA+ID4gK1JJU0MtViBBTExXSU5ORVIgVjg2MSBTb0MgU1VQUE9SVAo+ID4gPiArTTogSGFu
IEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4gPiArTDogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4gPiArTDogbGludXgtc3VueGlAbGlzdHMubGludXguZGV2Cj4gPiA+ICtT
OiBNYWludGFpbmVkCj4gPiA+ICtGOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svYWxsd2lubmVyLHN1bjI1MmktCj4gPiA+IHY4NjEtY2N1LnlhbWwKPiA+ID4gK0Y6IGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjI1Mmktdjg2MSoKPiA+ID4gK0Y6IGRyaXZl
cnMvY2xrL3N1bnhpLW5nL2NjdS1zdW4yNTJpLXY4NjEqLmMKPiA+ID4gK0Y6IGRyaXZlcnMvcGlu
Y3RybC9zdW54aS9waW5jdHJsLXN1bjI1Mmktdjg2MSouYwo+ID4gPiArRjogaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9zdW4yNTJpLXY4NjEqLmgKPiA+ID4gK0Y6IGluY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvc3VuMjUyaS12ODYxKi5oCj4gPiA+ICsKPiA+ID4gIFJJU0MtViBBTkRFUyBTb0Mg
U3VwcG9ydAo+ID4gPiAgTTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+
Cj4gPiA+ICBTOiBNYWludGFpbmVkCj4gPgo+ID4KPgo+Cj4KPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
