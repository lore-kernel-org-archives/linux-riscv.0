Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723B4C43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUvBrkCIGI4TjAWTpFlQVc9Dod/3OTN5WW+WCZhPsVI=; b=XvLBBP1D7ijIgx
	iI5P+rsvjYcVmOLO2UIu0StJHxyXclTwkME4YWDQs5mKMyqTQwwBhBSvu6O8nYsTQMA0lafgHwV+E
	STArewjs524BG1GtRnRAATwFwVauba51Du3Pmi/o1q7p/Ix90Vob9FX6CoXBJmOiHbbSWiZIiTGOy
	o5vLov3NkXKH0fnHbXR252TJHiB/64niIJyrKS3XpPZR4RknaY9BFkhPagloCBjJnqb+4iPSGmvxL
	LlCqmt+wHkLHmmHCOyp6pRSBV7jS1Zc/1Dv3Fg28y+f3WqTC86VrrFIkuIlH9eFXQ53bgziHsIQCQ
	G/qW8qz6N4cb09reB6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFT-0000000FGA4-2Paw;
	Mon, 29 Jun 2026 16:54:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFFS-0000000FG9O-21eH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 16:54:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D3F743E15
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 16:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E631F01564
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 16:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782752058;
	bh=nrtvzAHL3u6/v5L5E9Co3P0QE5xowtwOQFIomSwMWjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UtH5gwa+U1zvJ6MiDKihq7fz1abrI92vBGcYoq95X9rWwvz5W22oGlu4vG8sTBX+v
	 lZvuZzP6DS79zjdwBazFvkl6XvoQbUodjizsh/Y5t56PyS2oiOkfYCx7wkLk7cdr+q
	 2NhTOPmDU9hdWHEJWT+FaK8smDYBGn2B+2GOFurQSd53ujUwxlBKe0UjPhBCgGA3QX
	 k22qz2Jmw2cBhPjOS+8yx0ottM8TY6XGd5Ka/4VbWDj5PV4d5a2kNIQXOJuCPPFOrx
	 MdEVXZTxj/5NUCsyS7s46Ae8fQuMQf8DXRbIUUrciT9U9mcW4df21f2qy+RvS22A4/
	 JmKSNxfAR6eag==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3997a448ecbso35628801fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 09:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqTn39Mz5flO397pxH5XLgBAvzl+uQMPZlJy6DJ9vNq/Sxm9gwGaftCKhii8a4xe2FqhTT5m8sVlw+aXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKStc+bQS+2und6Ds7JoR66QvGNtqSszd/KbrpQXj3Qo1xImtY
	PVsdfjEmT+dFMa8g3W0/ydHHVIcB/UmXuUUP/l3Y+8ZHw++4vRGXAYMZ5dVcEhJiBCaCOc+dD3h
	2v2h0oLN5D/z36MoxmZjI19zxaZp2ry28iXQowB3qCA==
X-Received: by 2002:a05:6512:3d19:b0:5ae:b97b:f75a with SMTP id
 2adb3069b0e04-5aebdbbc205mr24885e87.55.1782752056582; Mon, 29 Jun 2026
 09:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com> <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 29 Jun 2026 18:54:04 +0200
X-Gmail-Original-Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
X-Gm-Features: AVVi8CdXDDErrbJGCmrBnsO12t_UfV9Z0jI02dBWCQjihPCNNCZY7ROJGiFNTUI
Message-ID: <CAMRc=Meb58KCuLXkNSJwUq6KJUzZv0u49FBA2L4C8Vd3NVo8Cg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

T24gTW9uLCBKdW4gMjksIDIwMjYgYXQgNDo1OOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+Cj4gSGkgQmFydG9zeiwKPgo+IE9uIE1vbiwgMjkg
SnVuIDIwMjYgYXQgMTY6MDcsIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiBPbiBNb24sIDI5IEp1biAyMDI2IDE1OjUxOjMxICswMjAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4KPiA+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gc2FpZDoKPiA+ID4gT24gTW9uLCAy
OSBKdW4gMjAyNiBhdCAxMzoyOSwgQmFydG9zeiBHb2xhc3pld3NraQo+ID4gPiA8YmFydG9zei5n
b2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiA+ID4+IERlc2NyaWJlIHRoZSBT
R01JSS9TZXJEZXMgUEhZIHByZXNlbnQgb24gdGhlIFF1YWxjb21tIHNhODI1NXAgcGxhdGZvcm1z
Lgo+ID4gPj4gVGhpcyBpcyBlc3NlbnRpYWxseSB0aGUgc2FtZSBoYXJkd2FyZSBhcyBzYTg3NzVw
IHJldjMgYnV0IHRoZSBQSFkgaXMKPiA+ID4+IG1hbmFnZWQgYnkgZmlybXdhcmUgb3ZlciBTQ01J
Lgo+ID4gPgo+ID4gPiBTbyB3aHkgY2FuJ3QgaXQgYmUgcmV1c2UgdGhlIERUIGJpbmRpbmdzLCBh
bmQgYmUgY29tcGF0aWJsZSB3aXRoCj4gPiA+IHFjb20sc2E4Nzc1cC1kd21hYy1zZ21paS1waHk/
Cj4gPiA+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+Cj4gPiA+PiAtLS0gL2Rldi9udWxs
Cj4gPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3Fjb20s
c2E4MjU1cC1kd21hYy1zZ21paS1waHkueWFtbAo+ID4gPgo+ID4gPj4gKyAgcG93ZXItZG9tYWlu
czoKPiA+ID4+ICsgICAgbWF4SXRlbXM6IDEKPiA+ID4+ICsKPiA+ID4+ICsgIHBvd2VyLWRvbWFp
bi1uYW1lczoKPiA+ID4+ICsgICAgaXRlbXM6Cj4gPiA+PiArICAgICAgLSBjb25zdDogc2VyZGVz
Cj4gPiA+Cj4gPiA+PiArZXhhbXBsZXM6Cj4gPiA+PiArICAtIHwKPiA+ID4+ICsgICAgcGh5QDg5
MDEwMDAgewo+ID4gPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJxY29tLHNhODI1NXAtZHdtYWMt
c2dtaWktcGh5IjsKPiA+ID4+ICsgICAgICAgIHJlZyA9IDwweDA4OTAxMDAwIDB4ZTEwPjsKPiA+
ID4+ICsgICAgICAgICNwaHktY2VsbHMgPSA8MD47Cj4gPiA+PiArICAgICAgICBwb3dlci1kb21h
aW5zID0gPCZzY21pN19kdmZzIDA+Owo+ID4gPj4gKyAgICAgICAgcG93ZXItZG9tYWluLW5hbWVz
ID0gInNlcmRlcyI7Cj4gPiA+Cj4gPiA+IEFoLCB0aGlzIHVzZXMgcG93ZXItZG9tYWlucywgd2hp
bGUgdGhlIGV4aXN0aW5nIGJpbmRpbmdzIGZvcgo+ID4gPiBxY29tLHNhODc3NXAtZHdtYWMtc2dt
aWktcGh5IHVzZSBhIGNsb2NrLgo+ID4gPiBJIGd1ZXNzIHRoZSBjbG9jayBpcyB0aGUgY29ycmVj
dCBoYXJkd2FyZSBkZXNjcmlwdGlvbj8KPiA+ID4KPiA+ID4gQWRkaW5nIHRvIG15IGxpc3Qgb2Yg
ZXhhbXBsZXMgZm9yIGJhY2tpbmcgYSBoYXJkd2FyZS10by1TQ01JIHJlbWFwcGluZwo+ID4gPiBk
cml2ZXIuLi4KPiA+ID4KPiA+Cj4gPiBSdXNzZWxsIEtpbmcgYXNrZWQgbWUgdG8gcHV0IHRoZSBQ
SFkgbG9naWMgZm9yIFNDTUkgcG0gZG9tYWlucyBpbnRvIHRoZSBQSFkKPiA+IGRyaXZlciBpbnN0
ZWFkIG9mIHRoZSBNQUMgZHJpdmVyIHdoZXJlIGl0IHdhcyBwcmV2aW91c2x5LiBJbnN0ZWFkIG9m
IGNyYW1taW5nCj4gPiBib3RoIEhMT1MgYW5kIGZpcm13YXJlIGhhbmRsaW5nIGludG8gdGhlIHNh
bWUgZHJpdmVyLCBJIGZpZ3VyZWQgaXQgbWFrZXMgbW9yZQo+ID4gc2Vuc2UgdG8gaGF2ZSBhIGRl
ZGljYXRlZCwgY2xlYW5lciBkcml2ZXIgYXMgdGhlIHR3byBzaGFyZSB2ZXJ5IGxpdHRsZSBjb2Rl
IChpZgo+ID4gYW55KS4KPgo+IEkgdGhpbmsgeW91IGFyZSBtaXhpbmcgdXAgRFQgYmluZGluZ3Mg
YW5kIGRyaXZlciBpbXBsZW1lbnRhdGlvbj8KPgoKQWggaW5kZWVkLCBidXQgdGhlIGJpbmRpbmdz
IGRvbid0IHNoYXJlIGEgbG90IG9mIGNvbnRlbnQgZWl0aGVyLgoKQmFydG9zegoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
