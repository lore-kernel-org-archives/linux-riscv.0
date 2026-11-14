Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D25606A323
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xSkFywV3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mbe77+1G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IOFRWuZ6sThnDHQdWT7fPK7zBaf4l1at3GB81pVGDYc=; b=xSkFywV3pb8knPlcQgNA/P379S
	T2lN51NOKkKGdDWPLckXdeFcZ/+P6xCAKfPUuWlGeURFsy00LB9jNeEjHJtY2LXOerYPN/YraavgV
	eXKFUVw1JaY3GrvArWZGCVDFIgEgyKc1bLFxBAadFhDSlBJ6M7E5kwJOu2iDX5f60BD/lYnGuwivz
	pnDLX3nRvWEgNrPCZFHoCLnCVn17C9PaBgyX35gEFyVADLUHh7Uy7aXszNbuHZN95r2xvSIp9wL5A
	wXepqBHecfVxDdoiR+UOkYd4s3ZMt0ulLGwPe/MChL8qmB8m1+dFA7NzP0o2ikT+2r68zVOB9pQtT
	K566EPYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDq1-0000000G7W6-1AYl;
	Sat, 14 Nov 2026 13:30:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDpz-0000000G7Vn-2fK8
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:30:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 212C045C07
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072FE1F000D4
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663035;
	bh=4kdsxrLqnYOpX1QyU0iNFte1eOYe1nCLmGqKY73MdjQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mbe77+1GhvODI+6mWq5hPRR5d8VCtc9UMyfbjr+wccQGdxYPb9nXX6Y3s8yGz6kIb
	 fARVMe7B9b5Et13NlB8hB5LeWaFryaB7pJSkHiyWDoClDmPB2TlzhG/YI8qDTjQyE/
	 WDYvttsj6kL3Jr40rcFF7sVzzMxutqB1pjXLA3LPT/3vG60X33w+vhS0JbUTe+7ifG
	 pRaQ8FCones0hTHahfg6b0pKCSEghuci+Q5h5pGV3/RP7te5YPKnzUWRAgSWqWAJJm
	 1x/N9wO2eWU3JIquYC91FWUiwJsvg9fCcORSszU+M2uU6/IAYsisGgX7mvKHBJlkZ3
	 /lEINIMPlev0w==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491aaed7565so841784f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFjPDFZ6oqtpg91VBwAQH23QteBqQah01cw5DxxfsfixxCyafSeGYT6HPjDNXS5U86G7d0O08re+y0fpQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9NkEEZkfvIBdsKtrzWGVuNbVFkel319SvJUa859P7gray0MHD4
	y9U/uwkN10UxqoL1y5h5DYxVy4ZsFEIRv401mp06mTN0L/Y4N0Q3HzSjU8DnJdqFAaIM1E4SBG8
	rNfgiphwO9knGKwRbmu9erFmCQrezUog=
X-Received: by 2002:a05:6000:288c:b0:49d:1ce3:1849 with SMTP id
 ffacd0b85a97d-49d1ce31d46mr9587940f8f.21.1794663033180; Sat, 14 Nov 2026
 05:30:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:30:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
X-Gm-Features: AclHuK8K2OPl8wvZJVK74a7K9gwaF5hUGnQfkFwAnJJ_kB4aFWWolyDhl3_PTvA
Message-ID: <CAJF2gTRDcAVjTu5N+-8zhPJRvgCBiTtt3xZRbF_1s7D+yXXJ+A@mail.gmail.com>
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
Pgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPiAtLS0KPiAg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1s
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQu
eWFtbAo+IGluZGV4IGQ1M2Y1MmU4MGQ4OC4uMzEzZmIzOWJkNDUzIDEwMDY0NAo+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xp
bnQueWFtbAo+IEBAIC00OSw2ICs0OSw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gaXRlbXM6
Cj4gICAgICAgICAgICAtIGVudW06Cj4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjBp
LWQxLWNsaW50Cj4gKyAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjUyaS12ODYxLWNsaW50
Cj4gICAgICAgICAgICAgICAgLSBjYW5hYW4sazIzMC1jbGludAo+ICAgICAgICAgICAgICAgIC0g
c29waGdvLGN2MTgwMGItY2xpbnQKPiAgICAgICAgICAgICAgICAtIHNvcGhnbyxjdjE4MTJoLWNs
aW50Cj4KPiAtLQo+IDIuNTUuMAo+Cj4KT2gsIG15IG1pc3VuZGVyc3RhbmRpbmcsIHRoZWFkLGM5
MDAtY2xpbnQgaXMgdXNlZCBieSBvcGVuc2JpLiBQbGVhc2UKa2VlcCB0aGlzIGluIHRoZSBjb21t
aXQgbG9nLgoKUmV2aWV3ZWQtYnk6IEdVTyBSZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9y
Zz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
