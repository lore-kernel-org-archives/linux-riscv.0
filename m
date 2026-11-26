Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10041606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ucb0hZVX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1au1t+v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dMTyc0mh0iR+F0Xo46fvyqtTMv7ye0T06ZQ7uOXcnM4=; b=ucb0hZVXYsos+BZ/2f1GMmU7r8
	NS9j5JZRwGm5PD/kJsBN03aKl5nwLKf0fQT3/B8B80BJvyH3gISIgq9Wf7lpzkBqDJqwXcQHeP0hQ
	97rJACk/gN4HQYUZdhKMDbsLon7ZYZ04UGFd5aDnMRdzSfqBOL+hRrNNfI/a5rci5KEeVtk3piygz
	UG3xTCGrM+R+1p/q1L3bU2ijMHu65tvd65RPeiI7cRmDtqQiOs0y5pVoZae5djzJ41Pu+1af7Vyrd
	hkHHfCUnjtTIzwRmVUWLdfUWg48GO+63hIgBtvY+g/LCz8Wyb0iwSXpydOhvBg8Wr3P8la5QORDTQ
	wodZd00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQbP-0000000C2Sf-35sb;
	Thu, 26 Nov 2026 03:56:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQbM-0000000C2SF-2wKD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 03:56:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 182BD463C4
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 03:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EF41F000C0
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665412;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=B1au1t+vJ4xKP1IwcH9Pb1aLK67JRhRCpw4dT+4rgsvqf1HRgU5eAKXqzVspfTD2Z
	 NSjVF+tFOrErbw03TvuslkeSgS2gWKnk7ql3nBagEJQBPH0eoJdxFooAdmd5y7c3TW
	 vkZPyNDmlSRKjn9WYFu5zAIWrRw6bVw5iFMJndIbxy7zo4rPih28/3zfnxvFD7+4xu
	 ObNiO6UKOl60sPZ7st1QS+eiwEEJzkFoi7kqMW25c6Q1l0GAo/qFNj9UIgC45JmpD4
	 FTbcEe/DPJRStHfaUSjbMMK2Iknzjxu41QTzO3b7nuIzsWlzL1MnO95ZNKp9BoYRWR
	 or0aB7/sdfsew==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so51162261fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 19:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZbcnPtQNtxv0TdWtJxAii4xioZAMOiERX1mTi7WOBNGGE+mSpJVuOU+jJ+BgQ2Anmz0tFioNlfeq44w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+jHfXdigqHthO5dzVWYJI5vfGeceOM29dp+p1A2S4eTQzwEuH3
	iSo0/ZueFkHxUmP9Q1tUVtT2vLwubBpQMstHaxtEKyRQY7vN3zk84ySK/4AZYmEvjCMa5w7v6d6
	OcwH7jYZIoKkD36i9EN2KLEzTEmrlJ9A=
X-Received: by 2002:a05:651c:a1aa:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae7fa71a15mr56174711fa.28.1795665409967; Wed, 25 Nov 2026
 19:56:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org>
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 12:56:37 +0900
X-Gmail-Original-Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
X-Gm-Features: Aa3M54rpP-Zn9FFry4pu5XjBTgRTyOiIwDPt_8N8tX1t-bsfN3kUc7IF24g0SfQ
Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Norman Herms <dockseed@proton.me>, 
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMjUsIDIwMjYgYXQgOTowMuKAr1BNIEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0
YWlyQGQtc2lsdmEub3JnPiB3cm90ZToKPgo+IEhpIEp1bmh1aSwKPgo+IE9uIFRodSwgMTIgTm92
IDIwMjYsIEp1bmh1aSBMaXUgd3JvdGU6Cj4gPiBzdGF0aWMgU1VOWElfQ0NVX0dBVEVfSFdTKGFo
Yl9tc2lfbGl0ZTBfY2xrLCAiYWhiLW1zaS1saXRlMCIsIGFoYl9od3MsCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAweDVjMCwgQklUKDE2KSwgMCk7Cj4gPiAuLi4KPiA+IHN0YXRpYyBTVU5Y
SV9DQ1VfR0FURV9IV1MobWJ1c19tc2lfbGl0ZTBfY2xrLCAibWJ1cy1tc2ktbGl0ZTAiLCBtYnVz
X2h3cywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIDB4NWUwLCBCSVQoMjkpLCAwKTsKPgo+
IFdoaWxlIGJyaW5naW5nIHVwIEdNQUMwIG9uIHRoZSBPcmFuZ2VQaSA0IFBybyB3aXRoIHRoaXMg
djcgQ0NVIHNlcmllcywKPiBsaW5rLXVwIGFuZCBETUEgYnJva2UgYXMgc29vbiBhcyBjbGtfZGlz
YWJsZV91bnVzZWQoKSByYW4uCj4KPiBhaGItbXNpLWxpdGUwICgweDVjMCwgQklUKDE2KSkgYW5k
IG1idXMtbXNpLWxpdGUwICgweDVlMCwgQklUKDI5KSkgZ2F0ZQo+IHRoZSBzaGFyZWQgTVNJLUxp
dGUwIGJ1cyBmYWJyaWMgdXNlZCBieSBHTUFDMCBhbmQgb3RoZXIgbWFzdGVycywgd2hlcmVhcwo+
IGJ1cy1tc2ktbGl0ZTAgaXMgb25seSBpdHMgcmVnaXN0ZXIgY29uZmlndXJhdGlvbiBjbG9jay4g
UmVmZXJlbmNpbmcKPiBhaGItbXNpLWxpdGUwIGFuZCBtYnVzLW1zaS1saXRlMCBvbmx5IGluIGdt
YWMwIGRvZXMgbm90IG1vZGVsIHRoZQo+IHNoYXJlZCBmYWJyaWMsIGFuZCBnYXRpbmcgdGhlbSBv
ZmYgYnJlYWtzIEdNQUMwIERNQS4KPgo+IENvdWxkIHlvdSBwbGVhc2UgbWFyayBhaGJfbXNpX2xp
dGUwX2NsayBhbmQgbWJ1c19tc2lfbGl0ZTBfY2xrIHdpdGgKPiBDTEtfSVNfQ1JJVElDQUwsIG1h
dGNoaW5nIGFoYl9zdG9yZV9jbGsgYW5kIG1idXNfc3RvcmVfY2xrIGluIHRoaXMKPiBkcml2ZXI/
CgpUaGUgcGF0Y2hlcyBoYXZlIGJlZW4gbWVyZ2VkLiBQbGVhc2Ugc2VuZCBhIGZpeCBvbiB0b3Au
CgpJZiBpbiBkb3VidCwgeW91IGNhbiBhbHdheXMgY2hlY2sgbGludXgtbmV4dCBmb3IgcGF0Y2hl
cyB5b3UgYXJlIHRyYWNraW5nLgoKPiBUZXN0ZWQgb24gT3JhbmdlUGkgNCBQcm8gKEFsbHdpbm5l
ciBBNzMzKS4KPgo+IFRoYW5rcywKPiBBbGFzdGFpcgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
