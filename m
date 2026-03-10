Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6A0EA854E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtc0ZlCnJD6FhOBGD82Y9M0rLG7SMJP8iI/W0tcGWVY=; b=kUGrZBp4QMQjXI
	j1X4IEJNu4oG94h1k94sG18X3o2CwcsA04xTmd7LKiSvqXd4D+uLWVRsJHKdcSFSfBbCyPXoPkuIO
	EmjvUiLYr5p02UDhOo5r61nhVb7OnzyMMJvJGoJVSBYNqWxthOquPaI2sIMkJer3nOjqFa0oVb84z
	wo1wjIGvq6b12C9ithrcg99VJMhvy9amq3lGA6vfNJp7sh/mKZwh08tNkRUmrFOBOBXGPslgozLiN
	ktWIJARxrxETifZtpemyl6whp1bVV4VzAF/FrNeRKrqhqTN970dFKsAzFKMKYZEVuNHM0pgBsg2j3
	d6kxRckVYtEW2s2Jj0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsv4-000000090u3-4Ag0;
	Tue, 10 Mar 2026 08:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsv3-000000090tZ-3TiA
	for linux-riscv@bombadil.infradead.org;
	Tue, 10 Mar 2026 08:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M6JPfbr9d5IciKIoqHHW920nfQtcVt9K8aP07ynrnlo=; b=Bbuv3EpSbZxtq/12XbIbsc2PNK
	Y5AQgReJtLSyRKs9bukySWXYHUvZk9sBoSa8LeSpsM5t5C4JGPkMjn8zuLduSzBtME/wd2cLLShd2
	7mPhAjbd5D1T74jqdHp1pRJ39wEqOU70n78wROCSrkQN6hjX1DgpLdiIThoSWnu/piLYc2fg9Na2c
	OPVozeP+85/Nw72OQtgalUfmhCpGMjc3lHK7/9gojV62k1zDklSFZaxr/2aRXFv5veklF4lH/3bgG
	kk3bSYN+qO2+Mblx89lULDTnSFGaT0Xx0Stm98zWtM/nO5+GpN5FdX2vaerJoE/jXwNMON3EIvp6n
	5tOKqznw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsv0-0000000E2gb-1CqF
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 08:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8D044708
	for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC2BC2BCB8
	for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133098;
	bh=M6JPfbr9d5IciKIoqHHW920nfQtcVt9K8aP07ynrnlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tZDQM11qneSYqNndJJ+rDgCWCXaubztC0EU2cNYNl/DrHnKZ5Laa4TpxPCIr1Tr6A
	 PCrDcHv6Dr+xwk0QDncYwcPtzLnCmHNdMwjuU0NrvakPKmAKW7k+3L6nvvlJD0ih2/
	 PgVHQ6tQTtVwn6bAzDrJCbfg2qQHfwElUiTysHN8dwnn/Q2Rskunb3ViyCzBvLDBOB
	 +gh0Ubvtbj7EF+ns8yNPoWO6SsLO0Wg79q7JFUVqTg9W/ek+Cjtdwq3h7GxILDIGiS
	 vgWjY4s7SNRl8FPprWwQ3ndAPjFXStqqRlON74Ufj5u74XwPToW4LvPUfh5TVENmZb
	 iWWiL4NaGQI4A==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso31920631fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 01:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNPr1Ry6wLoUV21qpF0ckgQ86PFs3qyszgV3/x0sGQM0A+0HN2gZNlJ7QFKZmGejrOi9r3V/UDxYQzfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9FIDOinlWxSu1Wgjbhl8eq+YCNUnoPjjI9m8GcyxTwXeBeOta
	hgG88oUiXiSEJJWOEoZZsARK8Tap5a962t1y6ZygQHJEUWrybAXMynjnxLpLL50L245ZvkSRKS4
	oFuL/jYHj5Y6YI3XKRPg7hsqG8mcfbCbJ92F0q73LsQ==
X-Received: by 2002:a2e:b012:0:b0:389:e2e8:4f4c with SMTP id
 38308e7fff4ca-38a5d05131dmr6527231fa.21.1773133095795; Tue, 10 Mar 2026
 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com> <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
In-Reply-To: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 09:58:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
X-Gm-Features: AaiRm50drSEJRzFk2cE1mtMmfBxUomqwHAi_2o4urYZsnhjuUaH2OaO1HdaVg_g
Message-ID: <CAMRc=Me8pw5ROaopJ8bcon_NGR5TEZdkJL-F4H1-8b-U2FU9GQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Radu Rendec <rrendec@redhat.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthew Gerlach <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Shuang Liang <liangshuang@eswincomputing.com>, 
	Zhi Li <lizhi2@eswincomputing.com>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	"G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>, 
	Samin Guo <samin.guo@starfivetech.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S <swathi.ks@samsung.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_085822_771374_5F16FB08 
X-CRM114-Status: GOOD (  21.11  )
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

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMjoxMOKAr0FNIFJhZHUgUmVuZGVjIDxycmVuZGVjQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDI2LTAzLTA2IGF0IDE2OjQ2ICswMTAwLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4gPgo+ID4gVGhlIERUUyBjaGFu
Z2VzIHdpbGwgZ28gaW4gc2VwYXJhdGVseS4KPgo+IEFzIEpha3ViIHBvaW50ZWQgb3V0LCBpdCBj
b25mbGljdHMgd2l0aCB0aGUgbGF0ZXN0IG5ldC1uZXh0LCBidXQgZG9lcwo+IGFwcGx5IGNsZWFu
bHkgb24gdGhlIGxhdGVzdCBtYWlubGluZSwgc28gSSB0ZXN0ZWQgdGhlcmUgKG9uIGEgU0E4Nzc1
UAo+IGJvYXJkIHJ1bm5pbmcgdGhlIFNDTUkgZmlybXdhcmUpLgo+Cj4gVGhlIHR3byBOSUNzIGNv
bWUgdXAgYXMgZXhwZWN0ZWQuIEJhc2ljIGlwZXJmMyB0aHJvdWdocHV0IGFuZCBqaXR0ZXIKPiB0
ZXN0cyBsb29rIGdvb2QuIEkgd291bGQgb2ZmZXIgYSBUZXN0ZWQtYnkgdGFnIGFuZCBhIHN1bW1h
cnkgb2YgdGhlCj4gdGVzdCByZXN1bHRzLCBidXQgSSB0aGluayBpdCdzIGEgbW9vdCBwb2ludCBi
ZWNhdXNlIHlvdSdsbCBoYXZlIHRvCj4gc3VibWl0IGEgbmV3IHZlcnNpb24gYW55d2F5Lgo+Cj4g
SSB3aWxsIHdhaXQgZm9yIHlvdSB0byByZWJhc2UsIHRoZW4gdGVzdCBhZ2FpbiBhbmQgY29tZSBi
YWNrIHdpdGggdGhlCj4gcmVzdWx0cy4KPgoKVGhhbmsgeW91IGZvciB0aGUgdGVzdHMuIFRoZSBy
ZXdvcmsgYWZ0ZXIgdGhlIGNoYW5nZXMgdHVybmVkIG91dCB0byBiZQpxdWl0ZSBleHRlbnNpdmUu
IEkgc2hvdWxkIGhhdmUgaXQgcmVhZHkgYnkgdGhlIGVuZCBvZiB0aGUgd2Vlay4gSSB3aWxsCmFw
cHJlY2lhdGUgaWYgeW91IGNvdWxkIHJldGVzdCBpdCBhZ2FpbiBieSB0aGVuIGFuZCBsZWF2ZSB5
b3VyIHRhZy4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
