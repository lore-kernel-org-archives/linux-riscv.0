Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD98606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 16:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PDLjmgdb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrgoeqzO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SKPNxB0VIZCbZ84bfBJ5ZmUYxvUuHQH/z/hGVNYNAuY=; b=PDLjmgdbYTjoe0lPes4NQNwcRg
	fsaqMQ2SSHHcVecLcsD9nlmvKZNx7//lzBfd1ioK7c/knmXliAgw3WoKaP0UD269ddZpWhhIF1ykv
	9iSrDch+mivpS7QI9jcwVkYwDwA/lLwi/Lm9692WNmvmBOcjTQYeC+sOxIBPFKhGhVjylmwye1lsz
	Efkbv3N8IL+yMKyek1elv8Z6x+m0Zqdlb39sWKKZDaLlgkRWmRklKf/+Xe+W3eiHoktjE19tyyomb
	obJ6oM33eNIwGDEgdEhu9JjDrApww5JIPsKneTkAoq76qEAY2At69jITB0ZDrmxhzyscG9CYcyZQ6
	gEARGoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS0g-00000001ALr-1aOR;
	Mon, 09 Nov 2026 16:14:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQS0f-00000001ALJ-3JRp
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 16:14:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6649E45A32
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FE81F00926
	for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2026 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240857;
	bh=FoBZPBz0A32H03ZJeXTMKctFSPuuFEY2YbURgnGwEZQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=QrgoeqzO13po6lKggu39WD60MDVQu+ADwHfSf5jTVoCR5UA/aIko4G6nqRYimQ8mw
	 LM5MzksIR5DhOiqrfFw4GROP9wBVkz9CdpM7WZ0TPwHXY3IhwqH8muit2yJmAhgNIy
	 CeC+BFF59IBSy93AIlYJ8TBk14vy0ja1/pPbWQP0Wdy+C4o8585XaIRVOwJTbvhbd0
	 M4MrRxBxIzjKEQm0dc6E3QT64ruDkJ+65xdH1FBsS+4BPcG7xwrETMFImkbODD/i20
	 CubIkNx3H00PsxlotV7dYSNoONHn5xAuyL+Hf9jMPmlH7dKZCfIvOXgHeryBnKPH30
	 pyi+MxWfIDoPw==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53a448f86e0so508037b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 08:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEH2wsKhvqMHc3iRg7KGoWM+/l2fuadmtn2PNa6nb1SE5Xq3uFI7Jg0CCgNm7jKx9ppxDF+4ssmSYgQAA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/whG2VHIpOB+bz7mCGK1WdItkXoyB3/XF+Joz82hx9QO+mWsGH
	alDpAvpu8DCrpVPeatIm88tm1DMAVKIv5sZ+2t8LTlPMSFuLRSya1obj1B5eFIupjY9jX+omorp
	2Khw25ySv4K3ZJW1W5NnZVcyfe90z0/4=
X-Received: by 2002:a05:6808:1381:b0:564:3fe1:2f95 with SMTP id
 5614622812f47-5683cdc8174mr51063b6e.56.1794240856276; Mon, 09 Nov 2026
 08:14:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-4-ae8178fce7e8@pigmoral.tech>
In-Reply-To: <20261009-a733-clk-v6-4-ae8178fce7e8@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:14:02 +0900
X-Gmail-Original-Message-ID: <CAGb2v65=FbB=WeG6UxvO2S7eapFAs6up05H8yKxE9ZV5XHHg7w@mail.gmail.com>
X-Gm-Features: AclHuK_oriluD6lv7Dh-nyywN-v7TzMrzN3qlz6xuuw7NLsiTt8EPPBIYrFTgRg
Message-ID: <CAGb2v65=FbB=WeG6UxvO2S7eapFAs6up05H8yKxE9ZV5XHHg7w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] clk: sunxi-ng: a733: Add PLL clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTTigK9BTSBKdW5odWkgTGl1IDxqdW5odWkubGl1
QHBpZ21vcmFsLnRlY2g+IHdyb3RlOgo+Cj4gQWRkIFBMTCBjbG9jayBzdXBwb3J0IGZvciB0aGUg
bWFpbiBDQ1Ugb2YgdGhlIEFsbHdpbm5lciBBNzMzIFNvQy4gVGhlCj4gc3RydWN0dXJlIGlzIG1v
c3RseSBzaW1pbGFyIHRvIHRoZSBzdW41NWksIHdpdGggdGhlIGFkZGl0aW9uIG9mIGEKPiBQTExf
UkVGIGNsb2NrIHRoYXQgbm9ybWFsaXplcyB0aGUgaGFyZHdhcmUtZGV0ZWN0ZWQgRENYTy9ob3Nj
IGZyZXF1ZW5jeQo+ICgxOS4yTUh6LCAyNE1Ieiwgb3IgMjZNSHopIGludG8gYSBjb25zaXN0ZW50
IDI0TUh6IHJlZmVyZW5jZSBmb3IgYWxsCj4gc3Vic2VxdWVudCBQTExzLgo+Cj4gTW9kZWwgdGhl
IGluZGVwZW5kZW50bHkgZ2F0ZWQgb3V0cHV0cyBvZiB0aGUgcGVyaXBoZXJhbCwgdmlkZW8sIGFu
ZCBERQo+IFBMTHMgYXMgcHJvZ3JhbW1hYmxlLWRpdmlkZXIgY2hpbGQgY2xvY2tzLCB3aXRoIGVh
Y2ggb3V0cHV0IGdhdGUgbW9kZWxlZAo+IHNlcGFyYXRlbHkuIEZvbGxvdyB0aGUgZG9jdW1lbnRl
ZCBoaWVyYXJjaHkgZm9yIHRoZSBkZXJpdmVkIHBlcmlwaGVyYWwKPiBQTEwgb3V0cHV0cy4KPgo+
IFBMTF9BVURJTzAgdXNlcyBTRE0gcGFyYW1ldGVycyBmcm9tIHRoZSB2ZW5kb3IgZHJpdmVyIHRv
IHByb3ZpZGUgYQo+IDIyLjU3OTJNSHogKiA0IG91dHB1dC4gUExMX0FVRElPMSBwcm92aWRlcyBm
aXhlZCAvMiBhbmQgLzUgb3V0cHV0cyBhbmQKPiBkb2VzIG5vdCBleHBvc2UgZnJhY3Rpb25hbCBy
YXRlcywgYnV0IGl0cyBTRE0gY29udHJvbHMgYXJlIG1vZGVsZWQgc28KPiB0aGF0IHN0YWxlIGZp
cm13YXJlIHNldHRpbmdzIGNhbiBiZSBkaXNhYmxlZCB3aGVuIGFuIGludGVnZXIgcmF0ZSBpcwo+
IHByb2dyYW1tZWQuCj4KPiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1bmh1aSBMaXUgPGp1bmh1aS5saXVAcGlnbW9yYWwu
dGVjaD4KClJldmlld2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
