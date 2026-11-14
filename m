Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E96606A32D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Py2GY3UB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RdO3Kv90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6fV9D7p5J28B/HL/iyQRDGyQbeTzgaa3ogAlpqAxZL8=; b=Py2GY3UBNGWgMYGyR+9U0qNAeo
	8HwkW3NPpbenPQzGswGvbuhVRRjLhI+VZ61S6fctCiCovIL3WbZQcPHB7+/2zsgqyFK+SoOsCFG7o
	MNk8INxSBAYYe31+rOphVITOoh1LBzo/pzFDhhmSFn8SfARUowXm1spjXdGJIioHckNVs1171SRq/
	F9XyPVkXdgNlj4t5WUIkH4bUjrzBG2mTv6+KmFsKUVTWYKDHCH29bk5RWplUfZwJajgW2VquspQBo
	DNAGJLU9Z/Vo8RX6YZ/bqeU6S7WAogGtsEL8kJusG39ZCEbxOcKikGNxTxMcnTr7gkM7v1eENPwB1
	xPRJonoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJE-0000000G2Kb-2W4e;
	Sat, 14 Nov 2026 12:56:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDJD-0000000G2K4-1Xur
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 12:56:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B808463B2
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 12:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B031F000C9
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661003;
	bh=CzDnQhxA2IGwG1S+MSyz5T4mghlVNlgfIGD03W+DjPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RdO3Kv90z56OxC2Mum/pVVxoCJ0GuuJdKlGU7yYQJRke20FgwpEj+W748Vp6QPjUr
	 Wd4LCOVX1UiBXzmxMxABGqTYbVV4jdueM9hoyYrxVEM0h7I0M3MCoo6dflSNjgq9pZ
	 wavchHG1HPsP6J8cJen+2c0KDhZMQ87PD78h06x/SWleCZ0AVhktojtUKWuPlaDEte
	 5tlCnkfYA3PwzYC6fje6dD7A93GWV+srski1PUYta0UlPCG/zlnkivP0/do4FV4FeT
	 EEbKIrXKgSsahJV81DXIk3q/IzR9JxgXW5mZcMb6ZY9PlJgLjnuxDNUmDYPIfxkeHJ
	 O82buXWPzGNUA==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so25903435e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 04:56:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUD7rABQ+KwJaqLM+clgdibGdux2T6kHMmXmqN6dz9f7QaJ1omK5VvpXyzWQD6vVfOQIfVKdgsvxCd0g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+YUSzoLRNfPAmR+TVThh4lDxrW3TQsQlhXxROHEpMklR/1Lxir
	QGdK1BTCvFtjANzSosCl4YM0jqNj0xZIB2D1Z5sgu+yy7CSg+dKJNp/54kjL46p9Mcx2phocS2f
	yAWL0a7pBNXcUK9BLHCk9sboou8SGry0=
X-Received: by 2002:a05:600c:8b05:b0:4a4:4d57:8462 with SMTP id
 5b1f17b1804b1-4bb55a99ed0mr112169185e9.24.1794661001252; Sat, 14 Nov 2026
 04:56:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-2-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 20:56:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
X-Gm-Features: AclHuK87BF-AIKO2shVxwQUjV8SpcPDdYGTchA_sgB49NmXU0PUHvZ5gp9vekk0
Message-ID: <CAJF2gTSHBu3qVmqQDfmn4wfy2uGY-bGN3xKxqpO=ULVfoXD3-g@mail.gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: riscv: cpus: add the XuanTie C907
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
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IEFkZCB0aGUgWHVhblRpZSBDOTA3LCB1c2Vk
IGluIHRoZSBBbGx3aW5uZXIgVjg2MS4KPgo+IFh1YW5UaWUgaXMgYSBicmFuZCBvZiBDLVNLWSBN
aWNyb3N5c3RlbXMgWzFdLCB3aG9zZSBKRVAxMDYgSUQgMHg1YjcgWzJdCj4gaXMgd2hhdCB0aGUg
QzkwNyByZXBvcnRzIGluIG12ZW5kb3JpZCwgc28gdXNlIHRoZSBjc2t5IHByZWZpeCByYXRoZXIK
PiB0aGFuIHRoZWFkLgo+Cj4gWzFdIGh0dHBzOi8vd3d3Lnhydm0uY29tL2RlY2xhcmF0aW9uCj4g
WzJdIGh0dHBzOi8vd3d3LmplZGVjLm9yZy9zdGFuZGFyZHMtZG9jdW1lbnRzL2RvY3MvamVwLTEw
NmFiCj4KPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBpbmRleCAwZGEyMTlh
ZTY3NjkuLmJkYjExOWFiOGVlMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC00OCw2ICs0OCw3IEBAIHByb3BlcnRp
ZXM6Cj4gICAgICAgICAgICAgICAgLSBhbWQsbWJ2NjQKPiAgICAgICAgICAgICAgICAtIGFuZGVz
dGVjaCxheDQ1bXAKPiAgICAgICAgICAgICAgICAtIGNhbmFhbixrMjEwCj4gKyAgICAgICAgICAg
ICAgLSBjc2t5LGM5MDcKTEdUTSEKClJldmlld2VkLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3Vv
cmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
