Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B612606B0C1
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PmLnhD9L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAquH30K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ulpurbjrgyjr81MC8zJKfKWttOsUuXL3+83ttHdTS+Q=; b=PmLnhD9Lsh24bDkHgWC+z0O1f2
	Qye7rdJEc7pR9QarXn/w/o57dQ8Afvnwj4xo6e9rFe93Kq/04OdOckkJOFT2iznIrkA87fwL6jZ6H
	1KEc8NAoG8TF/xzieuw9bN0hoUGRSiK9NOof+NMddS7JV1bscQDZ6YBqh4imkWR2g4muEb0e/zDhw
	2M5xtv3TIjJNpKBPDLyRBMj6I/Z0deY+EEcuCcKWpDhKNP5+fHlsjD2WHWEFutClc+GcvweRGMrYw
	HTMmsusldLwt6U00RTDMaGNSXeNKi/afIin31esdM2cpyyJgJc+59/peF3nY19iXt1q0gDBcx9VNr
	WrtRJ5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDTj-0000000G3xF-2Aqv;
	Sat, 14 Nov 2026 13:07:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDTi-0000000G3ww-2Vry
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:07:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E67646593
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360A81F00933
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661654;
	bh=O67Sld1N23xdXCx6gIqCXwUsjQS8tlDbGqdMHZU/fNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iAquH30Khmvacvb33iblyujUgHVesD/yt9CYr5SmFcp1ApKO7T+J37/AyKkyTaSv/
	 EsWGut9q7KWd2gVEyBu/nITBODZA6MEasZBNx0yJah9iOvv4l2nbwnsrsyIklDiQir
	 vnJynlk0O1pmrm7PPFcunHu4Gq+bdPIoQO27xkEZwUlpTj5PAYVzwUf7vDdSUjZ2tn
	 pi647oQyFJF/9n5Oi3H2MjRredHD7BHUm5xS5M2h6NjsyuRzK4q3SlYuiPx3dSdoYf
	 XzKGmiMpZXUPQQCApGxPkLf1MaAmTU9qLoLldT34MGOwd3AerJ6SvgJ51qV1vY5qb9
	 XKyABiarnAsdw==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so614366f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:07:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfIVCzOjUDkZt9BqS8NCeoK6IzpOF9g7tOs1kroB+IobmYRO/4V5uiMLgxKxW1F8m35kESNWkkGKEkdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+oxHWTAR8IPNyBgFT5zESaEEUNAZIPqVxlIlz1bsmtMzc3jDni
	bieKf1GOUN7p7aMPrKABcouHe88YsYug3NMmXqAVe6HdYEZs+P/lBBzV514nVRICD2lim/siSN3
	IjpjyGDUCMgJfXX8JCROXZi0dFL2SbEo=
X-Received: by 2002:a05:6000:4202:b0:493:72f7:1d5b with SMTP id
 ffacd0b85a97d-49b03217678mr21427286f8f.29.1794661652676; Sat, 14 Nov 2026
 05:07:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:07:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
X-Gm-Features: AclHuK9gMmE7_2DKOWkhqnjhaQpkVZ3vMJCR5skQAuEE5nkS6qc3opH65-HdPes
Message-ID: <CAJF2gTSCtecm6LsuEy_s2rS0hAFzjN61FPRkhdPXg9Vh+xqNpw@mail.gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
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
QzkwMCBQTElDIGltcGxlbWVudGF0aW9uLCBsaWtlIHRoZSBEMS4gQWRkIGFuCj4gU29DLXNwZWNp
ZmljIGNvbXBhdGlibGUgd2l0aCAidGhlYWQsYzkwMC1wbGljIiBhcyB0aGUgZmFsbGJhY2suCkl0
J3MgYWxsd2lubmVyLHN1bjI1Mmktdjg2MS1wbGljIGluIHRoZSBwYXRjaDsgcGxlYXNlIGNvcnJl
Y3QgdGhlIGNvbW1pdCBsb2cuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8Z2FvaGFuQGlz
Y2FzLmFjLmNuPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sICAgICAgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
c2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IGluZGV4IGNkZTRiYjY5MTg5Ny4uNjE3OGZlYTliYmRj
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwKPiBAQCAtNzIsNiArNzIsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAtIGl0ZW1z
Ogo+ICAgICAgICAgICAgLSBlbnVtOgo+ICAgICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjIw
aS1kMS1wbGljCj4gKyAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjUyaS12ODYxLXBsaWMK
PiAgICAgICAgICAgICAgICAtIGNhbmFhbixrMjMwLXBsaWMKPiAgICAgICAgICAgICAgICAtIHNv
cGhnbyxjdjE4MDBiLXBsaWMKPiAgICAgICAgICAgICAgICAtIHNvcGhnbyxjdjE4MTJoLXBsaWMK
Pgo+IC0tCj4gMi41NS4wCj4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
