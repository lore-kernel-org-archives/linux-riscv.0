Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E54C606C6B8
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cir7fd7e;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZIYAbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LAwNkUIbSgxsEjz39y9VLzlIsFb+Wzslx9OwYWA3LvU=; b=Cir7fd7ehXI9WUE69PoOgAGE26
	seZldJrDOy2XA17xOmU8aRXWEyopszMyuK8LQK53AbNYzZzAlP3ycJ7mhnOvm0db9CQIecmvD98Ny
	s9m6B9U2c1HOMKok86RBHUAnmZQfB6B9Z/MPDRu7fRP1Da1xQAAIgnNDhITobXN0qc1un0DaX2ufl
	ost6k9FmVGXiLy9d78qeC9XNxFIpBHBsFgcBThrn+OZ1wvpBtfoAcHp6PMcMLarMCrTFzl/UK1Fe2
	a9pvOylJKGILe66r3T9RI0FKNjBy/Golgu5n3I76BBDnLA6sllQcGxMiyXZGfE9B0wtzYip3DYCC8
	EqZpxlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDUs-0000000G4Na-4B3E;
	Sat, 14 Nov 2026 13:08:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDUr-0000000G4N0-2Nwc
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54BEA45A0A
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3613A1F000CB
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661725;
	bh=ENcuBo4USOfVQFhUObechYbDtZ2GfADFPof/Bg1RaM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfZIYAbbcFGk1GP4Q4eKfAcqvuppW3Wvi9Psg08B3GWREll4Tdsxk/TqwaG6emPge
	 K1zuRY+2fbOyuFHAl4Re7PYdfjDYozXFJQRCWe/VlTVxJlZEJa/fGud3tINeXQs76m
	 xoT8i8SSpfj3RtdNDmUG8aYEVDzUCtGrIHnw0qAmJdIMQNzwBQn/3dVSmOzcQAmUFJ
	 9gW5ZhzallYtftMidwJtEQDCX80k5Gi3bpwlGLBlFzbjvsOK1Om/iSDzsilcMNJtj2
	 X7J9Dcc4io/tCbHG1RjRHyxw8N03cYszawfFPmlXkDpQ6HM3+Ox/90uqEesFxF+36v
	 DXAVZgrsXU4EA==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10244255e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH1myYN/yasE/0Jg6DouA5y9taNDwzPGNBbnLCe9CBzuu9oOean00BVmzvzv25HEJlISRea5mqG28RJ2Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z89Evqq2mqqcBBeY7Xa4bFpjfEAd6hI5YE6VNSys7XrLjHdEgSM
	GXqbXpGAPXnEQOa9N8rF0ORmxszgnjaqmqyosL1F/P8xr9JCcy4YfXgSt7mULR0Yb10tGe9fwz7
	tHzZgGL0Gw0xpR0yGU0vlQkk5L5TbV60=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id
 5b1f17b1804b1-4bb55ab4493mr118562415e9.35.1794661723805; Sat, 14 Nov 2026
 05:08:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:08:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
X-Gm-Features: AclHuK_1B3cdhqJcEVfShwQslZ0jrvNhdkA66924rVca4uIM67v6w9N5xpnc6Kg
Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
Subject: Re: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYgYXQgNjozM+KAr0FNIEhhbiBHYW8gdmlhIEI0IFJlbGF5Cjxk
ZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEhh
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IFRoZSBWODYxIHVzZXMgdGhlIFh1YW5UaWUg
QzkwMCBDTElOVCBpbXBsZW1lbnRhdGlvbiwgbGlrZSB0aGUgRDEuIEFkZCBhbgo+IFNvQy1zcGVj
aWZpYyBjb21wYXRpYmxlIHdpdGggInRoZWFkLGM5MDAtY2xpbnQiIGFzIHRoZSBmYWxsYmFjay4K
SXQncyBhbGx3aW5uZXIsc3VuMjUyaS12ODYxLWNsaW50IGluIHRoZSBwYXRjaDsgcGxlYXNlIGNv
cnJlY3QgdGhlIGNvbW1pdCBsb2cuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFu
QGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGltZXIvc2lmaXZlLGNsaW50LnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL3NpZml2ZSxjbGludC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gaW5kZXggZDUzZjUyZTgwZDg4Li4zMTNmYjM5
YmQ0NTMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Rp
bWVyL3NpZml2ZSxjbGludC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gQEAgLTQ5LDYgKzQ5LDcgQEAgcHJvcGVy
dGllczoKPiAgICAgICAgLSBpdGVtczoKPiAgICAgICAgICAgIC0gZW51bToKPiAgICAgICAgICAg
ICAgICAtIGFsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQKPiArICAgICAgICAgICAgICAtIGFsbHdp
bm5lcixzdW4yNTJpLXY4NjEtY2xpbnQKPiAgICAgICAgICAgICAgICAtIGNhbmFhbixrMjMwLWNs
aW50Cj4gICAgICAgICAgICAgICAgLSBzb3BoZ28sY3YxODAwYi1jbGludAo+ICAgICAgICAgICAg
ICAgIC0gc29waGdvLGN2MTgxMmgtY2xpbnQKPgo+IC0tCj4gMi41NS4wCj4KPgoKCi0tCkJlc3Qg
UmVnYXJkcwoKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
