Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE78CD6E5C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/V7RoVOkSMcgJLzl6Yi9yy3w72oczkmE1LjfbdCjUA=; b=hO/oPScrKrXoqr
	4T2QVkkSkzHeUPZ6Oin/7NGMQNWsEdbniBt/5xvWBdmLhaPDPhDqdD7XM0khOvrJIScQ8Q0I+AsOz
	DBIqvZrTKAdpCCtEtSfksBvjWbfMUzoaRfRwzuWGq/Kq3IqT8v2v6eRoLMuT8hj5i7ZN0ecNtfhZI
	WWMauoqz48HhpnEUeIaU6yN4WvhaabcPsieRibE/7duJmhpgc8ovnQBuPFlIFhrU4Np2UXU17N9Po
	HqBwane81R+PLBTZKps//J4g7z3awVLgQB2InMyXwySP1G9sBwVpZm1nQSOt0gYapTMG2zuenBfiH
	oLfx+Pky5/FN7B8jsRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXEA-0000000AWuH-3kfb;
	Thu, 13 Nov 2025 13:19:06 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXE6-0000000AWsT-2CO2
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:19:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5942a631c2dso800525e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763039940; x=1763644740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=K59WUnJpeZ/8W9ndOHLrcN7OAuxHTOsIsZQQBc4zS3rc42zO4P42RtAkg/Coor5MYc
         bCSImfuZJzc/AtDfh4GTx0qr+O3NbavZ3SEHu0ePxZTnsE9zhKHQrt7ojI7uOqI8mFgF
         1i4hqTBomZWFOgfJMgXWckG+ci5FnPSHwYzHcf++aS87o8gAdQXHyqOQeYjoaV/7DVcT
         9fLRVmR0EaQ8MC0weEdOb4M6iuA7tOhPzyF0zaH1mRQTtDYejxhi4ks3KHrva5XjBycq
         x2pdjy44QPUAYFFe99VdALwmn2axKXwPqLf9ZsSF8Lk1O0FdeoYKsz9FF3UnIPyu+UMj
         jhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763039940; x=1763644740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VZfCaucUzkZTNK+50YPVLfmUuvxNRaVom6NqjpdOeAc=;
        b=Y88HS4VUJYlOcxSnOAushs7CBhSic7NYLQpj3D/kcngguO08QFbre1j3x1sYF45xLh
         +z+9m3Occ7UczlQvdgR6tYYh2kLtNXrLcMS8tNNCcem6KmVNtHmwmn8uXW4Vsy+O93z2
         bXQLX7TD1XpX9nuHf9I41SYv6FC6BPy/Q+/xxjkbvSZkNHtaJY18vdezLMtURi/OttqH
         lwkGhuWwQ0T1UpbDDrxbMcJmgcCnRjdU/1ygksKl6wxuzg8n5YgbAbBWtXdtoMgTTQ/2
         wLDRh/9cQ2v8Lk7e/DAhmNLgYDP069/Z8cKcSPGX1iu2w9qdxgnDZcwgIiY1c1nyFIaI
         Ox/w==
X-Forwarded-Encrypted: i=1; AJvYcCUsLR2elXjCtjxZZ7fdM/AO0y8gyUUtQObQTs2POWYsDpq/q9su7qb7Hy6CGXl1LHHS6AOwSBNx9fNyPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn5aRUlV+2oA00t/mQZgFWwWXZ1IGhYbwvaVTPPqi9RIw1dE85
	wz5XeXGe352UAoVaFqX9kwUdI1mr+6EotrKbgmdCsNip2fBJCPDl/vxbVphXbW4QXhxw9Aia/71
	dhjifBM+WDZY83oSk4RtmGr+RNxVShQ6KjEocZuclZQ==
X-Gm-Gg: ASbGncvWC3trWlQYff6+UO70skx7DmamCDOyWfZj91PdzLp2j0zIP4kk5u7oD9ZBZxO
	sItgJv5os6AixDdF71FcHvoYf6c9EvKAvstvCzjYEdNHSWPrk7s247eHJEX07TY6qLcMJTwdIhv
	Kd/23HwP0LQrQPTembAj/7nkKXlmhppCVCf6VsMLU9N14fzlgf/cu1aYJTTivlIs2IE4+R7Dijk
	s1K9XNaG21vUH9mjxN9VK29QkAFdw4W3P7nAaVuOnZqE150RoAObgCth09KfHUEqKbG2B4nW5nN
	57pKvJS/Rsjg3Ssh
X-Google-Smtp-Source: AGHT+IHeVzTuj43c2XKQpZBw2ErEf3YOWTRFAtQ1vaZEEtKBTkEs3tR1Hd50SIgH+QjYllZZcXodcrSS9KZ8vRhrh3k=
X-Received: by 2002:a05:6512:3152:b0:595:7b24:d36e with SMTP id
 2adb3069b0e04-5957b24d58cmr1396653e87.7.1763039939830; Thu, 13 Nov 2025
 05:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
In-Reply-To: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:18:48 +0100
X-Gm-Features: AWmQ_bkdL6yYgjauNyydNchJ2jLFj9s46UQ7WB4-Hc5rFElcxZ0Jmq78mNjUwDc
Message-ID: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
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
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_051902_819439_93334514 
X-CRM114-Status: GOOD (  13.26  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0OeKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEluIG9yZGVyIHRvIGRyb3Ag
dGhlIGRlcGVuZGVuY3kgb24gQ09ORklHX09GLCBjb252ZXJ0IGFsbCBkZXZpY2UgcHJvcGVydHkK
PiA+IGdldHRlcnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVz
IGFuZCBzdG9wIHB1bGxpbmcKPiA+IGluIGFueSBsaW51eC9vZi5oIHN5bWJvbHMuCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgo+ID4gLS0tCj4KPiBbLi4uXQo+Cj4gPiAtICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAic25wcyx0c28iKSkKPiA+ICsgICAgIGlmIChkZXZpY2VfcHJvcGVydHlf
cHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+Cj4gVGhpcyBpcyBhIGNoYW5nZSBpbiBiZWhhdmlv
ciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91c2x5Cj4gcmV0dXJuZWQgZmFs
c2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPgoKVGhpcyBwcm9wZXJ0eSBpcyBhIGJvb2xlYW4gZmxh
ZywgaXQgY2Fubm90IGhhdmUgYSB2YWx1ZS4KCkJhcnRvc3oKCj4gYWx0aG91Z2ggaXQgc2VlbXMg
bGlrZSBpdCdzIHRoZSBwbGF0IGRyaXZlciBjbHVua2lseSB3b3JraW5nIGFyb3VuZAo+IG5vdCBp
bmNsdWRpbmcgdGhlIGNvbW1vbiBjb21wYXRpYmxlIGFuZCBpbmxpbmluZyBwYXJ0cyBvZiB0aGUg
Y29tbW9uCj4gcHJvYmUgZnVuY3Rpb25zLi4KPgo+IEtvbnJhZAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
