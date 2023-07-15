Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B77CC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkUhdgpKFB57YbZZHfm1i/Kxl9+xU7Tw4rSmlfClVtQ=; b=ZtQAz9j7VW+HC9
	gbqSCBMoxlmDhKhLbpA6pXKl3EIE7oiPz0JiFhS5lSGlQ2ksFtEdf/0nMbbotylTDMrHQy+FAL8RC
	BoxtUTr+MtVwNKVFCvsU9UOtSWvQtFR7HaQfJY2FWX5HcGYZJiLZKP+Rr+KFE6xLARZXjkWV+k9MT
	RrXS/1O47aa4z43X3EQrTIqcRp5RTlHAun2q1JTG+kgTBcds2fH+UWbX15e1mTndIvIIdWFCkVawv
	ectY/s5lMbIXDhybCdEIkELf/QJa7MvQquagxu0FIBbVr6o+BsX16MLTcFmPCB8DCwXbvPIkIgt7B
	wdlpJ/Td31hO21IRoAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKiWY-009Asn-1x;
	Sat, 15 Jul 2023 16:53:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKiWU-009Aro-1g;
	Sat, 15 Jul 2023 16:53:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0086160BC3;
	Sat, 15 Jul 2023 16:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45F0C433C8;
	Sat, 15 Jul 2023 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689440012;
	bh=2Q4FCDoenbmD/VhiBVMa5udzbl7nfKdi1+C2wdvn1O0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KGFJejuQEStcUADchTg9oWaT+ZuWLuTpi4HLb3Op7RAslZMX2tJ3LWVkhFtyi0v8C
	 UgVxYMhhAPoJCfCUaYcatC6Yfas9V4+xwGhklnavAdjnk/Rl4Ab+hgZM6TxRfeyUyV
	 ThGax002RCYNwEpzElSo1VimTuqHfL8TTYQk/jSQap0Yn6++SdQ5ny9z0LHwYo3FdC
	 vffxqAxdGlr1Xe5jo7AM2rv4qWFHvquiD3cAd5crQFy+EzbDyTLx+e6S4FFlAKE5pL
	 0+o28xIlcXV6azxJp+qbLkW/17I3yEFetA7VD4arf/orfXfQh+GG5pQ0VUUM5c8awC
	 IoWiUm7qcWqDg==
Date: Sat, 15 Jul 2023 17:53:19 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
 linux-iio@vger.kernel.org, Maksim Kiselev <bigunclemax@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Andre Przywara
 <andre.przywara@arm.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, AngeloGioacchino Del Regno       
  <angelogioacchino.delregno@collabora.com>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>, Leonard
 =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>, ChiYuan Huang
 <cy_huang@richtek.com>, Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>, ChiaEn Wu
 <chiaen_wu@richtek.com>, William Breathitt Gray <william.gray@linaro.org>,
 Haibo Chen <haibo.chen@nxp.com>, Mike Looijmans <mike.looijmans@topic.nl>,
 Quentin Schulz <quentin.schulz@free-electrons.com>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 1/4] iio: adc: Kconfig change description for
 Allwinner GPADC
Message-ID: <20230715175319.1ea7f2c1@jic23-huawei>
In-Reply-To: <b3723443-2a27-0a51-babd-b36eef095913@linaro.org>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
	<20230619154252.3951913-2-bigunclemax@gmail.com>
	<2148594.irdbgypaU6@jernej-laptop>
	<b3723443-2a27-0a51-babd-b36eef095913@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_095334_619517_9471C0B2 
X-CRM114-Status: GOOD (  14.71  )
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

T24gV2VkLCAxMiBKdWwgMjAyMyAwNzozNzozOCArMDIwMApLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiAxMS8wNy8yMDIzIDIw
OjE0LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiBEbmUgcG9uZWRlbGplaywgMTkuIGp1bmlq
IDIwMjMgb2IgMTc6NDI6MjQgQ0VTVCBqZSBNYWtzaW0gS2lzZWxldiBuYXBpc2FsKGEpOiAgCj4g
Pj4gVGhpcyBwYXRjaCBhZGRzIFNvQ3MgbmFtZXMgdG8gQWxsd2lubmVyIEdQQURDIGRlc2NyaXB0
aW9uIHRvCj4gPj4gbWFrZSBpdCBtb3JlIGluZm9ybWF0aXZlLiAgCj4gPiAKPiA+IFBsZWFzZSBy
ZXdvcmQgdG8gcmVtb3ZlICJUaGlzIHBhdGNoIi4KPiA+ICAgCj4gPj4KPiA+PiBGaXhlczogZDFj
YWE5OTA1NTM4ICgiaWlvOiBhZGM6IGFkZCBzdXBwb3J0IGZvciBBbGx3aW5uZXIgU29DcyBBREMi
KSAgCj4gPiAKPiA+IEknbSBmaW5lIHdpdGggdGhlIHBhdGNoIGluIGdlbmVyYWwsIGJ1dCBkb2Vz
IHRoaXMgcmVhbGx5IHdhcnJhbnQgZml4ZXMgdGFnPwo+ID4gICAKPiAKPiBObywgaXQncyBzb21l
IGZha2UgZml4LiBUaGVyZSBpcyBubyBidWcgaGVyZS4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6
eXN6dG9mCj4gCgpEcm9wcGVkIHRoZSB0YWcuCgpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0
LgoKSm9uYXRoYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
