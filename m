Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A64CD6E55
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dqRkBddc5FxBzrOOdKPsx4YDUApf1WWGsDMYivW+C5E=; b=22rrvha0tuvIOm
	LJgNZNbLdKOnGxJ+xPlIXsnnXh9phd+SlywhfnKSYLNrnkW+XcnKCi4o881qo6zHHta6ynJ0Ko7sc
	QIx1JCAPU7NkDDzF7+FnXnPIyaQxT1lXrNYDt17DkXXkaayPU0aQl69bjNkkVc/8RWmC3TghQmhgE
	bUiXUqEUMKGwcvnL96dZwCRcrQOWv2fmRVhybyAY1k9RlJTYLevsoP0Ci/+u18/GgEW5AdZdPgguY
	Vp0spF3exaF1vDuHY8Z7THv7OtfRK4TIYtf+ztnCLZUlbI+wovPbGn+CCZXNFUo61iZs1ss78+Xms
	oKrIgPfwxH5DltYYnlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXaM-0000000AZ3R-0V03;
	Thu, 13 Nov 2025 13:42:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXaI-0000000AZ1l-3OEB
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:42:00 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5957f0218a1so802999e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041316; x=1763646116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=RK49x1srN7ZgapmdHFw6PIwV6vXYqY+800PJUZBWe6K2hQf12Pg2CrMn1EcsDMN1MO
         2U2pQKVeO3sGJZIUqLhDz2ay1fRxFQ+5B28F77TZzU9Q4W3d740LR7aOIvb7EmWXYXV6
         fAfPVDDDNH9W+T08l9+jzgz3I9L3BaMmmtwPXpMAnacvn/4EjXBMsZ3Se2psTqSmxeHK
         3JqiEsp03HPGxFIPj9XBD+IIi8oiOen1opamOqA33eiiPmCRubgdBLjU3oXDt5UwKxNL
         CceQjpPOV1VET5KUQtALQx4Zh3/sefAT7lBlxpmd3MT4m4xE4xnC8cksNucPvv2CmXX3
         XXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041316; x=1763646116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6YFPbYQaXtcm5LdD7/GneIOXBdjWXCgrgn8VVQE3So=;
        b=gU9pu+a4NI2JDzMvRGfo+vGodLnzFkbgGOEaYQdfaqOsLBmloyC3w8487KQQCAJaup
         ZGK4QXsUXYP6/5v6j9ZskNCByq9lq5/oPXdI5kr47PRuNuOjC0K76Men7MwYFut4Q+1t
         M95uOXknmt3ID49ta9lWfLRyuDlWk/OS7fHqG2Pue5dq8laE7sEHemWndkvbYGb4MFrP
         oD7m/aeGZbpAxRd7Mi7O7Ff7H7CwTAtqYVJo/xNzXJeWDH1/x8YfSpWMBEUWW9PyljV4
         OmpLYqe3bJoKh4sw7w3NrpQBx+joDULVQkHpgLvxKIFng13msOe2y5JhKPyi69MS+/9O
         Ij9w==
X-Forwarded-Encrypted: i=1; AJvYcCXTU4vLf3++M6UiBpy8bhMYK2jV7/39t97pZ8L8He8NSz9Z2XmQk+95zaqxgGG2zNY2sZXooCCAaLq6Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6n5jHzwsfj/2pVGE4RzYXG2C4NeWhATAsb8qM/9VGNbbtNOIP
	Z5Fyzo/GBUfF6PY7Q55NBgv7DDJKONI2f/ZGoUUOq0lmvSnHHB3+KmVTrhBYlLktbh0FJo/nH4O
	FZ0fQnRaY9N4sA1kEDz3IeF3dpIUhI3/b5OfbeZXZvw==
X-Gm-Gg: ASbGncvhdVVMYv7UYbBKo/uswoJdZoqUg5k/NRsKXoMbHqYXDBSNfEcHDJEaLgf0A1A
	kPx59I59declE+48E+Q752EnmRQ3UtnHtpWC/rQdJu69Wa3tN0QaE7MdNxg4FKF4Twnjr4/rB4/
	8DCpqa5HEC4EWt4GJkjy1XkwiNRC3FGqx0AHl/FfguKkZ62soqN3JSNvYgp2xOfky8ShrnT4Fm3
	apGDeAzk9amhZQZrhlAe3lOqVT1rWasbyaL7zKDu+pK4kTvuNBWGxC5xj62qJN6bfGXdinqFfam
	T6kXP1DeSkeszPjk
X-Google-Smtp-Source: AGHT+IGgWlCG9kIv5RM7lpIk9LC7ddziZ8QniI5XBDNtHyHFdpWvdUKYxGgON08x+t3awJ+Cz4M6eIo1aCJcpUc2eyg=
X-Received: by 2002:a05:6512:3c8c:b0:594:2fde:a159 with SMTP id
 2adb3069b0e04-59576e552camr2521011e87.43.1763041316428; Thu, 13 Nov 2025
 05:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org> <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com> <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
In-Reply-To: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:41:44 +0100
X-Gm-Features: AWmQ_bk13TVZ2MEYPAt7pfoLg7e0lkaPcfsA9km-tpYIh11AXtLgw1MABlXNgK4
Message-ID: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251113_054158_867559_FCE0F3DF 
X-CRM114-Status: GOOD (  17.26  )
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

T24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgMjozM+KAr1BNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS8xMy8yNSAyOjE4IFBNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo0
OeKAr0FNIEtvbnJhZCBEeWJjaW8KPiA+IDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+
IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTEvNy8yNSAxMToyOSBBTSwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPiA+Pj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pl
d3NraUBsaW5hcm8ub3JnPgo+ID4+Pgo+ID4+PiBJbiBvcmRlciB0byBkcm9wIHRoZSBkZXBlbmRl
bmN5IG9uIENPTkZJR19PRiwgY29udmVydCBhbGwgZGV2aWNlIHByb3BlcnR5Cj4gPj4+IGdldHRl
cnMgZnJvbSBPRi1zcGVjaWZpYyB0byBnZW5lcmljIGRldmljZSBwcm9wZXJ0aWVzIGFuZCBzdG9w
IHB1bGxpbmcKPiA+Pj4gaW4gYW55IGxpbnV4L29mLmggc3ltYm9scy4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5h
cm8ub3JnPgo+ID4+PiAtLS0KPiA+Pgo+ID4+IFsuLi5dCj4gPj4KPiA+Pj4gLSAgICAgaWYgKG9m
X3Byb3BlcnR5X3JlYWRfYm9vbChucCwgInNucHMsdHNvIikpCj4gPj4+ICsgICAgIGlmIChkZXZp
Y2VfcHJvcGVydHlfcHJlc2VudChkZXYsICJzbnBzLHRzbyIpKQo+ID4+Cj4gPj4gVGhpcyBpcyBh
IGNoYW5nZSBpbiBiZWhhdmlvciAtICJzbnBzLHRzbyA9IDwwPiIgd291bGQgaGF2ZSBwcmV2aW91
c2x5Cj4gPj4gcmV0dXJuZWQgZmFsc2UsIGl0IG5vdyByZXR1cm5zIHRydWUKPiA+Pgo+ID4KPiA+
IFRoaXMgcHJvcGVydHkgaXMgYSBib29sZWFuIGZsYWcsIGl0IGNhbm5vdCBoYXZlIGEgdmFsdWUu
Cj4KPiBFdmVyeSBEVCBwcm9wZXJ0eSBtYXkgaGF2ZSBhIHZhbHVlLCBzbyB0aGlzIGlzIG5vdCBh
cyBvYnZpb3VzIGFzIHdlJ2QKPiBsaWtlIGl0IHRvIGJlIChJSVVDIC0gdW5sZXNzIHRoYXQgY2hh
bmdlZCByZWNlbnRseSkKPgoKVGhhdCdzIG5ldyB0byBtZS4gSSB0aG91Z2h0IHRoYXQgaWYgYSBw
cm9wZXJ0eSBpcyBhCi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcgdGhlbiBv
bmx5IGl0cyBib29sZWFuIGZvcm0gaXMKYWxsb3dlZC4gVGhlIGZhY3QgdGhhdCB0aGUgZHRjIGNh
biBjb21waWxlIGl0IHdpdGggYSB2YWx1ZSBkb2Vzbid0Cm1hdHRlciBhcyB0aGUgYmluZGluZ3Mg
YXJlIHRoZSBoaWdoZXIgYXV0aG9yaXR5IGZvciBEVCBzb3VyY2VzPwoKSSBkb24ndCBtaW5kIGNo
YW5naW5nIGl0IHRvIGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBidXQgSSdtIG5vdApzdXJl
IGlmIHdlIHJlYWxseSBzaG91bGQuCgpCYXJ0b3N6CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
