Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C7F30946
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JPPqswJf4PVEBI6U5IAnWGfu/3GwZl3kSmTfczxXT8=; b=MIPiicDbOZoz7/
	y9JKvUATe5JtyKUEa46btTomHSGoV2gHtdImsRV7c4Rxd98NIo+dDYYNigQFMDyNAv4j4SS/aXsU2
	8EbiPQBJXeBinKHn8VJmUyYiHrUeLZBiaj47Oqr3BszojCand66KEqkYPS2JWkH/ZFUjUHAiYLL+L
	ILyxcpWT/8w+W2oGCu3yuo++kgsKmwNhR4YM1mS74sN9kDDnFuQl420GdperyBe+67iEfmAFUllbY
	Jsepa1IvA4u1kq9J4PeveaiDEnSK+JmwhChnUwj78WNcX4q8JfRfVEG/lEykhETKxbtePYxa1cEGI
	92WembtWqkP1mnf2ViSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83X-00000001nWd-0Dre;
	Thu, 05 Mar 2026 12:43:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy83U-00000001nVD-3ca9
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 12:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0F0843714
	for <linux-riscv@lists.infradead.org>; Thu,  5 Mar 2026 12:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5160C2BCF4
	for <linux-riscv@lists.infradead.org>; Thu,  5 Mar 2026 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714631;
	bh=+1Soi4u0zOToM+4cvb9M54dFFqUFlTLNETgvWAKHxCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qb0jG97edmb3U2qfJOZ8W4namHJQLjHdyLa/yO8Shzxok1cow1oGiOPDZPwW1C2aX
	 qfpAXVF5aCFXZLxPSzvgKeKSxO9o5XsLWHV8Z2J8C79wGhUQOpuNdTpOU9Dzdkkz3p
	 TWGjcAKnefLsljHAnEj5fjLLXkP0UfERnPvGWuc0ZQekEOQjNXH5K1HWRbh9ma16qv
	 6TkLXMUEkXlMirlttkcaQYFOEfMZ+oBljrNq1F3YIMePzlnhhwMurIVZGke7gCj1z9
	 cdj00Q5OZUBdizfbKPYLlLKP8RyJI5QMF03gjMx1z3TalYyUwSwiQn9mCL6ZfAo7SC
	 0i9QiFLq3vXMw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79860421382so77340097b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 04:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX29w8nSWQiY1cRF6I1cqPV7psgphPynCj4D9Qm17ZygXv1tjYshroocWAG15cKxTxdBkIkXKmIuWhvNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys71LS1RGe4Plw0XNLaT0g4ilDzRP/jEE6gS+cYKo7uPbrpf1V
	Xo9kqXxKQ8C3Gbx4Gl6ptMNnKasKd/jjipaJgQ99Fq+8IA8z8WdHale8NY05GVWicv/E1QWKDuf
	0BycF3sN2OdJIxIFTvX7UKsXiCjgVCrE=
X-Received: by 2002:a05:690e:448d:b0:64c:ac70:9420 with SMTP id
 956f58d0204a3-64cf9bdb391mr3524893d50.76.1772714630723; Thu, 05 Mar 2026
 04:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-19-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-19-vladimir.oltean@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:43:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
X-Gm-Features: AaiRm53Fhg5bHrVPoZ7KkxLKre-rHWPjFXtzmvz74i7G3hPs_-fZQdYeAKMF5Bw
Message-ID: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
Subject: Re: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_044352_931337_B31CD953 
X-CRM114-Status: GOOD (  11.69  )
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCA3OjAw4oCvUE0gVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1p
ci5vbHRlYW5AbnhwLmNvbT4gd3JvdGU6Cgo+IFRoZSB0ZWdyYS14dXNiIHBpbmN0cmwgZHJpdmVy
IGlzIGFsc28gYSBQSFkgcHJvdmlkZXIgKGNhbGxzCj4gZGV2bV9waHlfY3JlYXRlKCkgZm9yIFBD
SWUgYW5kIFNBVEEpLiBIb3dldmVyLCBhY2NvcmRpbmcgdG8gVmlub2QgS291bCwKPiBoYXZpbmcg
UEhZIHByb3ZpZGVyIGRyaXZlcnMgb3V0c2lkZSBvZiBkcml2ZXJzL3BoeS8gaXMgZGlzY291cmFn
ZWQsCj4gYWx0aG91Z2ggaXQgd291bGQgYmUgZGlmZmljdWx0IGZvciBtZSB0byBhZGRyZXNzIGEg
cHJvcGVyIG1vdmVtZW50IGhlcmUuCj4KPiBJbmNsdWRlIHRoZSBwcml2YXRlIHByb3ZpZGVyIEFQ
SSBoZWFkZXIgZnJvbSBkcml2ZXJzL3BoeS8sIGJ1dCBsZWF2ZSBhCj4gRklYTUUgaW4gcGxhY2Uu
IEl0IHdpbGwgaGF2ZSB0byBiZSBtb3ZlZCwgZXZlbnR1YWxseS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+CgpGYWlyIGVub3VnaCwg
aXMgdGhpcyBhIHJlZ3Jlc3Npb24gc28gSSBzaG91bGQgbWVyZ2UgaXQgZm9yIGZpeGVzCm9yIGp1
c3QgYSBub251cmdlbnQgZml4IHRoYXQgSSBjYW4gYXBwbHkgZm9yIG5leHQ/CgpMb25nIHRlcm0g
YSBjdXN0b20gZGV2aWNlIGNhbiBiZSBjcmVhdGVkIGZyb20gdGhlIHBpbgpjb250cm9sIGRyaXZl
ciBzbyB0aGF0IHRoZSBMaW51eCBkZXZpY2UgbW9kZWwgY2FuIGJlCnVzZWQgdG8gbW92ZSB0aGUg
ZHJpdmVyIG92ZXIgdG8gcGh5LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
