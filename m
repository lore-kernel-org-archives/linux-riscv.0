Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA811CD6E55
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdipNN1RHcCy5pmmPIt4aErkDSnWBGkid+jwruwbsb8=; b=fstKP0M4E8Ca4N
	3bYYvhjT1C0yBtNu7xcRebtrxqULi2xUOSWjPTCBhaUsc1MTKRIIs1WClB6SSf+SJEBPM5jo4RR1N
	2ZKm18gStK8B2iblhwihSGzgWvhminVgSsNCQW7WEzP0uJ8cmDEb7PiuuE2GIlA3a42+OKbvqfzCr
	QmP8Nj2P2bJbV4GUqF+unE023ASkyOi19sMieRs2cln+ucUP6c7VQUsXDvU87gEAEdsE56dZweZ1v
	XtJqHNXMMPv6w2m0W0vcsosyHzZ4QVUHWTPxL3OUgbkBf2jTMUmGCCLh+bfTXitZTDajOGywiIbiO
	uc5zycQtzGoQJ5X0ilNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXSh-0000000AYDf-0DEn;
	Thu, 13 Nov 2025 13:34:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXSe-0000000AYBs-2C95
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:34:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59581e32163so419218e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763040842; x=1763645642; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=FXwI/eQ2+cL5ul1C9AwJXY8LJsSLus8xbYb/UtvYQcUUL+5/HdShQnJeD1FJDTeSY4
         SOHaHNaKVQvEyK2y69g9VYKh9qASO+dV9MWG1pzcyrZROo0K+tmqGOourEhNo4zmqN3X
         ULp9QnsdAR0lJ0Jmrjgv1hk1yi8JioifbaSHunRof8V2kfs7PHOjWnxKXg5D0eRjdvfL
         k6vOFKcX/dW31IjC+NKqD5oQhou0c5qit++5HLmBG/aLrPBYG3UenSUELbdSC6dTAN5J
         mCAI1UmHkd42tdOOKhwOlIZlH3O0DjwDeiDp+X1VnMsB1JzgphA88AMLR5veCQvinQhn
         yRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040842; x=1763645642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsN4YM2OD91GPnt+6/gPAgCxZS5BYL1HgW1NfsOpFuY=;
        b=OlrPbpmcIOFn3FWITu4K3cpO30qCl0xraTvuNAnYcBnVCBEr5ckC5wvZY6vkcnKFCD
         omcKLlhT6f957RtYNobWxQhd79gL0swMT002Vi5LsAVD17XxW8XxqiZRVFoitGvcFC5d
         5DjlFz9/JJq+geDsrX/qi5lhB5kThB+X35xQDZDbpkFPeKDkc4zUBQUQ3XSs39+hGFFQ
         fMJfgv2gRT77NoMbyQZnyeQ/AhnEB0i3EoeWB8Dyb2JXa6dJ/Wiz95bRWD5HHox4/qH5
         mrHT6yjkgRnit/pj6X9Z2TkYDJkyraoAWL0gT8QKfjjjk6k3ErLtO0by7MOSg7SccQjG
         pafA==
X-Forwarded-Encrypted: i=1; AJvYcCU/MznOALlxHpeeDE+IcKlCeXSPSlwpEyRMwNT0Jwqi8yoDAS5YJxxfuM9dMJWmFycwhE/bsVsSIUxoSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuwYsPyz4G1qZt3JdqeDAd5ZUBCImYABZrChhSZs0Ws8mOrY1E
	uE9CAx2lFU62eLaitVcKZsw9HCZ5GS0QjhaXTvoKFdrHuGTZq8XoGIf+TTVOWA91+BtzxtUqhPK
	gEsRpf62o2+Y2M0OO1RLX1ww1/raGQ5NdCb0Z6ijJ5w==
X-Gm-Gg: ASbGncvWRzeDS/KcOR5Np3M9lWvZSVPTe5ylR+FBo0ia+sDjNj6it+pU1AlIWljWXTG
	f/GCZhROyKP4+avArWIt7c3lytfCG8o7U7yZtCO1wToTxy2FYlUOZrorh5SvjcsArO5EJRGiVxL
	PTbvgdrlWne3bZRzaTEE3dnrER6lpI88+FgnLnz6FGzO3hW1lJu7rTR9EXeVXAof+hf43B3zASF
	aMV7sGlSsc21CD55iwn8EFaCetFAxTQxiQfQiJn9255Fd9VcxAqiabXpFFrotk0J/nQkt4spi3Z
	gmHURX+mlJeR2/iY
X-Google-Smtp-Source: AGHT+IGbk7EKeTNsNxEBH5I9gU0KP7DFoTOQ0KZ1rqq8QfnOf06KK/0zwgmGPB54vhErcQD0MD3GXM8/DDcCgOFKTlQ=
X-Received: by 2002:a05:6512:12c4:b0:595:76d6:26ea with SMTP id
 2adb3069b0e04-59576df8d25mr2057027e87.23.1763040842304; Thu, 13 Nov 2025
 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org> <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
In-Reply-To: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:33:48 +0100
X-Gm-Features: AWmQ_bmy5PXcBPeRnFHjyddkz8qETTfAAx4qoRDDnDLUNs7204p7vqOqHs_5gtY
Message-ID: <CAMRc=MfMQ3P-BK239953S9sTAe1_qSc_miWEFDNu83frE3aSqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
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
X-CRM114-CacheID: sfid-20251113_053404_590521_9F84E8FC 
X-CRM114-Status: GOOD (  17.03  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMTo1NOKAr0FNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IEFzIHRoZSBmaXJzdCBzdGVw
IGluIGVuYWJsaW5nIHBvd2VyIGRvbWFpbiBzdXBwb3J0IGluIHRoZSBkcml2ZXIsIHdlJ2xsCj4g
PiBzcGxpdCB0aGUgZGV2aWNlIG1hdGNoIGRhdGEgYW5kIHJ1bnRpbWUgZGF0YSBzdHJ1Y3R1cmVz
IGludG8gdGhlaXIKPiA+IGdlbmVyYWwgYW5kIHBvd2VyLW1hbmFnZW1lbnQtc3BlY2lmaWMgcGFy
dHMuIFRvIGFsbG93IHRoYXQ6IGZpcnN0IHdyYXAKPiA+IHRoZSBlbWFjIGRyaXZlciBkYXRhIGlu
IGFub3RoZXIgbGF5ZXIgd2hpY2ggd2lsbCBsYXRlciBiZSBleHBhbmRlZC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFy
by5vcmc+Cj4gPiAtLS0KPgo+IFsuLi5dCj4KPiA+ICBzdGF0aWMgaW50IHFjb21fZXRocW9zX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgewo+ID4gLSAgICAgY29uc3Qg
c3RydWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkYXRhOwo+ID4gKyAgICAgY29uc3Qgc3Ry
dWN0IGV0aHFvc19lbWFjX2RyaXZlcl9kYXRhICpkcnZfZGF0YTsKPiA+ICsgICAgIGNvbnN0IHN0
cnVjdCBldGhxb3NfZW1hY19tYXRjaF9kYXRhICpkYXRhOz4gICAgIHN0cnVjdCBwbGF0X3N0bW1h
Y2VuZXRfZGF0YSAqcGxhdF9kYXQ7Cj4gPiAgICAgICBzdHJ1Y3Qgc3RtbWFjX3Jlc291cmNlcyBz
dG1tYWNfcmVzOwo+ID4gICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiA+
IEBAIC04MDEsMTMgKzgyMiwxNSBAQCBzdGF0aWMgaW50IHFjb21fZXRocW9zX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBldGhxb3MtPm1hY19iYXNlID0gc3Rt
bWFjX3Jlcy5hZGRyOwo+ID4KPiA+ICAgICAgIGRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEo
ZGV2KTsKPgo+IFRoaXMgY2hhbmdlIGNvdWxkIGJlIG1hZGUgbXVjaCBzbWFsbGVyIGlmIHlvdSBr
ZXB0IGEgZHJ2X2RhdGEKPiBwb2ludGVyIG5hbWVkICdkYXRhJyBhbmQgY2FsbGVkIHRoZSBuZXcg
b25lIG1hdGNoX2RhdGEKPgoKSSBwcmVmZXIgdG8gbWFrZSBhIGNsZWFyIGRpc3RpbmN0aW9uIGJl
dHdlZW4gdGhlIHR3by4KCkJhcnQKCj4gYnV0IEkgZG9uJ3QgcmVhbGx5IGNhcmUgZWl0aGVyIHdh
eQo+Cj4gUmV2aWV3ZWQtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5keWJjaW9Ab3NzLnF1YWxj
b21tLmNvbT4KPgo+IEtvbnJhZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
