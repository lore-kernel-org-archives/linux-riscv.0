Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED862606A32D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IuIMssXb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zv0p5Oqa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uD5M1hsiEOJRlrbuutIDSu+umVplIN58g4FyAi7TLHY=; b=IuIMssXbrcmrx9OrHa70VYCSv+
	vwUMZldFnPiHhl2/PVkzzcVt8IIDMKw6P0Xc41yuHteC94vptDuDBDK0DLeB2rBG3Vhn0pMWisvod
	vW6Be0BXWUf5w33+G1gwFNXc9CJyAzg1r11yimU/T41FIAofTlDffBuW9UEtIgp5/Iuhtb+E5sGKp
	DMMvob3sEHiwra1tziZ8okU/dDDZm/KR/zlih1uGqIU+j7BnWepEoCOUaxwmFTAvmLDYDuE0H9ap2
	HWc9D20VjUdfffFsqhmhEY0Hb0+gwfmP0942cBYOwcJpfGUYwGNSx8zuVetlevvkkYOWdvZzMzl/S
	FuDF44wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDa2-0000000G5PN-1WCl;
	Sat, 14 Nov 2026 13:14:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDa0-0000000G5Ou-3nsb
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69E5B44636
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B421F000D3
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662044;
	bh=Xu1Ch5SXzmukBzjwhfrUVAX6Y1aXdcS/DpJ5yAXyxco=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zv0p5OqaUOwOAG7H6IinOG7MKZZLjNtn8OpRuk/AMQ7IhMTG2AbPgDz35aF4yoDo8
	 DMBl1Cjp+ggQQPruYxZxsi4T92QMfMU7YlzFFCLOeYooScYmtjd+qfYgMLJ+TgLlZv
	 Z5NtnB0j5jlAg9G7Dixlnfug9472vn/X8f9ftZe5sM+2bpZcK0t8gwsnTeKc3X1OM4
	 VP1RHgjt/00kaQLWuTi1rmeqCC+huv95dY1n93DRFw8FixtteLaYiG6SVGFZdNtvti
	 m/lJLJz1BEC4f2Lfd6Ewa3QZYnKvvjbtwSDGU/EnnIotuM/pp1L34UTab1BhcblTYD
	 SlTYSEgtX6IJg==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so1918674f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:14:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRQ9qISy6qc3Oc9YonXrDf277AD3gnNMX1FGT6rcS40ewU9BGvfB46GVdMM3ltdueCJPcv6dyEZONoRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+52h9/mfX2jdU3Mbyp/smaON0D319CT7uq03UT86E2i3QL1/mO
	0PKNn/I7HU06r01Hi97Y7kv2nD27EPN75/RNHZLQwhz9qwtgSz8eVK2zKUNmYOLJLvc2FYDeDMF
	aN9sr8XGTo6hFe2Cl5Bah8rsNPoQFIi0=
X-Received: by 2002:adf:e00b:0:20b0:491:45bc:d69a with SMTP id
 ffacd0b85a97d-49c72e852c4mr9010555f8f.44.1794662042739; Sat, 14 Nov 2026
 05:14:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:13:49 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTF0b-dkLdznGzwYZmC6rP6GozX1j0Rre5t-aw6i5uDvg@mail.gmail.com>
X-Gm-Features: AclHuK-h5N3J841s1gOOr7kF2F78LtoydmQ7sQ-jEgbZErj4cvRoD35qUys8ixA
Message-ID: <CAJF2gTTF0b-dkLdznGzwYZmC6rP6GozX1j0Rre5t-aw6i5uDvg@mail.gmail.com>
Subject: Re: [PATCH 01/19] riscv: sunxi: describe the wider Allwinner SoC family
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
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IEFSQ0hfU1VOWEkgaXMgYWJvdXQgdG8gY292
ZXIgdGhlIFY4NjEgYXMgd2VsbC4gVXBkYXRlIGl0cyBwcm9tcHQgYW5kCj4gaGVscCB0ZXh0IGlu
c3RlYWQgb2YgYWRkaW5nIGFub3RoZXIgb3B0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFuIEdh
byA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyB8
IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2
L0tjb25maWcuc29jcwo+IGluZGV4IGNlY2JjZTBjNDk4My4uNGNmM2IyNDQ2N2U4IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmln
LnNvY3MKPiBAQCAtNjEsMTMgKzYxLDEzIEBAIGNvbmZpZyBTT0NfU1RBUkZJVkUKPiAgICAgICAg
ICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIFN0YXJGaXZlIFNvQyBwbGF0Zm9ybSBoYXJkd2Fy
ZS4KPgo+ICBjb25maWcgQVJDSF9TVU5YSQo+IC0gICAgICAgYm9vbCAiQWxsd2lubmVyIHN1bjIw
aSBTb0NzIgo+ICsgICAgICAgYm9vbCAiQWxsd2lubmVyIFNvQ3MiCj4gICAgICAgICBkZXBlbmRz
IG9uIE1NVQo+ICAgICAgICAgc2VsZWN0IEVSUkFUQV9USEVBRAo+ICAgICAgICAgc2VsZWN0IFNV
TjRJX1RJTUVSCj4gICAgICAgICBoZWxwCj4gLSAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0
IGZvciBBbGx3aW5uZXIgc3VuMjBpIHBsYXRmb3JtIGhhcmR3YXJlLAo+IC0gICAgICAgICBpbmNs
dWRpbmcgYm9hcmRzIGJhc2VkIG9uIHRoZSBEMSBhbmQgRDFzIFNvQ3MuCj4gKyAgICAgICAgIFRo
aXMgZW5hYmxlcyBzdXBwb3J0IGZvciBBbGx3aW5uZXIgU29DIHBsYXRmb3JtIGhhcmR3YXJlLAo+
ICsgICAgICAgICBpbmNsdWRpbmcgYm9hcmRzIGJhc2VkIG9uIHRoZSBEMSwgRDFzIGFuZCBWODYx
IFNvQ3MuClBlcmhhcHMgd2UgY291bGQga2VlcCB0aGUgaGVscCB0ZXh0IGdlbmVyaWMgYW5kIG9t
aXQgdGhlIHNwZWNpZmljIFNvQwptb2RlbHMsIHNvIGl0IHdvbid0IG5lZWQgdXBkYXRpbmcgd2hl
bmV2ZXIgc3VwcG9ydCBmb3IgYW5vdGhlcgpBbGx3aW5uZXIgU29DIGlzIGFkZGVkOgpUaGlzIGVu
YWJsZXMgc3VwcG9ydCBmb3IgQWxsd2lubmVyIFNvQyBwbGF0Zm9ybSBoYXJkd2FyZS4KCj4KPiAg
Y29uZmlnIEFSQ0hfVEVOU1RPUlJFTlQKPiAgICAgICAgIGJvb2wgIlRlbnN0b3JyZW50IFNvQ3Mi
Cj4KPiAtLQo+IDIuNTUuMAo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
