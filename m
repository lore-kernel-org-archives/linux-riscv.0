Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD1DCD6E55
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdtdwhyREQYXjyQAnsBO9X+L3Dz9eJf4u8Lqtfh8F80=; b=dcglU8ouoK05GZ
	QEpSXuEDgu44HY6lQ+T2aY7wWHXgOMzD5iaPjlZSLVd33hPNu+gzrXBGsh8KAvwqYwxGe8KaltB6j
	3zAvxOsE0emhMvrwv6FpOvUu9S2E0kCN45WAgKaBKV9ZzCFuChIONFOlW7x8bWYepz3edcxeQRI2f
	yiimimkN4ykvluSDB7EE4H1oLyTA1po0tqccYG1+Rd+vtlppGaJq3kFRha2SLPblxQYB4cR5bfzlk
	ZKNLWExEhDZFtlRI0FZb1awLQRgA1b41OOdvFdXvMlxdEj1wWH9zdvT0EJbXa3rmPjQCW+YaaxV3f
	eCN0zlSK69o0yIiSgICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXcj-0000000AZHi-3c4Z;
	Thu, 13 Nov 2025 13:44:29 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXcf-0000000AZFt-3V3w
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:44:28 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-591c9934e0cso1181606e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 05:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763041464; x=1763646264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=r0OImEBok1UuFplHqhgeRM2+x7KnItaIFt3z18Rum9gEc/9zgV9a+xiEnbTDbHq04I
         rFdKkp9rpdOc9biWqIGz54KxyLHiCQlrdxdg57ZVSaAu8mLApWS0gASzSzqVsBRY8dp3
         XQws++EJYXEQwrCfubUZ0e8wqo3H8gtrsEuWi0i3R5MpxLSXA3Yx5OWA0mOAUwO/o6Pb
         IcB+qQwQVjAxg726VYwDoJJuusNZps9gkzZ5KMhaEEaXCIpjHutaZs8cHa8PK3tGvozX
         +HRAgccGtRpQpBwjm3sgIgKhjB69jscQqWcgRTRckQUzwg/ae3EjpMkv8/9ddqJeMeSw
         oylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041464; x=1763646264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gHk2bNA1OTHNC9vr3z2H2JeUdyy+rk3RBEHgiTzG238=;
        b=ajAKeuOstGxjv8stodLwQEqRLLxXZdgJ4R7cyfLsZV8c9OKmAmbxATs8YhqmN9QLms
         IG5a3HgKzIPFR6zUkAPwnKoVxYr/13Bibm73zPjoQWr+kcPl8I7sEAw3Wy2/UBLlZUsN
         4RIDvr6lbtxjPYy1Y6eoHLOJtX7Kkg0alt0EFSnAvcJhLBpbSavsR0arfOCh7rz5vREU
         a40HLojAcZYG1xBj6l3XigB4N7Afi0kDatjbB/950eSCNLzIiYvP2+h6je1yDCs4BHW9
         0xar6acF+J10303Y7uwM+ahGVCEfcSv6TctZjj/rJLI0kTSBO7dtmU+rCceDZYVGxpuJ
         lu+g==
X-Forwarded-Encrypted: i=1; AJvYcCXoMM6gPhqreEsyNSmxHcWID7+dgLC+mmi4ZBeybk7CchYf6NVTfFbULlwB/nSY+icvnXp1WRcA+GOeWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi66ti9tDdAWv4q0uT+g5Qb+V/GTF+yt3Tgh2miqoX9JbHDosT
	m0EP03P0un691U4sJ0N8DIhmWgq0rLScYicoJE/zSIxljLMddQPQUkNo/InRrfZTZuNROFNsTVa
	l9NJPNWl4lkIe8b3Vw1DXLVM2wbqvbL/z43rpd9gcug==
X-Gm-Gg: ASbGncsineLhNOxrZgWrvxxzkTg7poysXM4u9CtGR919rX4dqc2j5YXI+23GS9qiEvc
	OB/z4Hq+gQPo/wYw9lEgcOdWteaO/2SeDJS9cjUEjS39uVz9SzBrEk9OYPg59gnKRYmq1dzCunE
	BLqBNoMlCvdd4Lms8bnFBOc8v6fkJAow3uc4mdbbafVfGK7zvkWByiTLsCWCz3EgrInhlLDwLXq
	2f7b36l7j9GB9iVWxWm/5g70Gy1adTAy3YcOfT/ABKfHX77zSaz5n60UNFbHwbT1vO7tLRwG7Ql
	5jWPUrWb/rYcgkuC
X-Google-Smtp-Source: AGHT+IF9+pE/QXln9/ghLnXjpwA3j+ZQdhSMaqAds1VqCnmNiZvVcKXj+XjAJW9rczSh1FwGivl5ToawEe+J2/Cq7qU=
X-Received: by 2002:a05:6512:6d4:b0:592:f7cf:9f6f with SMTP id
 2adb3069b0e04-59576df5dfemr2184445e87.14.1763041463584; Thu, 13 Nov 2025
 05:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org> <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
In-Reply-To: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 13 Nov 2025 14:44:12 +0100
X-Gm-Features: AWmQ_blnqOG7JKELYBN2x3sW4StFzPpU8xniVnWCV7D_4z_I3CQNMw3VuWKeQ6A
Message-ID: <CAMRc=Mf03rYoi-C+kMic9RYZdk2vtAW5LDMYNMqg-H5vJccUhA@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
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
X-CRM114-CacheID: sfid-20251113_054425_895098_A8586C53 
X-CRM114-Status: GOOD (  15.26  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCAxMjowMOKAr1BNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMS83LzI1IDExOjI5IEFNLCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8
YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IFdpdGggbWF0Y2ggZGF0YSBz
cGxpdCBpbnRvIGdlbmVyYWwgYW5kIHBvd2VyLW1hbmFnZW1lbnQgc2VjdGlvbnMsIGxldCdzCj4g
PiBub3cgZG8gdGhlIHNhbWUgd2l0aCBydW50aW1lIGRldmljZSBkYXRhLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJv
Lm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29t
LWV0aHFvcy5jICAgIHwgNDYgKysrKysrKysrKysrLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcWNvbS1ldGhxb3Mu
YyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXFjb20tZXRocW9z
LmMKPiA+IGluZGV4IDFmMDA1NTZiYmFkOTk3ZTJlYzc2YjUyMWNmZmUyZWIxNGZhYmI3OWUuLjA5
ZjEyMjA2MmRlYzg3YWExMTgwNGFmMjc2OWRkZmY0OTY0ZTY1OTYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0aHFvcy5jCj4g
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1xY29tLWV0
aHFvcy5jCj4gPiBAQCAtMTA1LDE3ICsxMDUsMjEgQEAgc3RydWN0IGV0aHFvc19lbWFjX21hdGNo
X2RhdGEgewo+ID4gICAgICAgY29uc3Qgc3RydWN0IGV0aHFvc19lbWFjX3BtX2RhdGEgKnBtX2Rh
dGE7Cj4gPiAgfTsKPiA+Cj4gPiArc3RydWN0IGV0aHFvc19lbWFjX3BtX2N0eCB7Cj4gPiArICAg
ICBzdHJ1Y3QgY2xrICpsaW5rX2NsazsKPiA+ICsgICAgIHVuc2lnbmVkIGludCBsaW5rX2Nsa19y
YXRlOwo+ID4gKyAgICAgc3RydWN0IHBoeSAqc2VyZGVzX3BoeTsKPgo+IFdoYXQgaXMgdGhlIGJl
bmVmaXQgb2YgZG9pbmcgdGhpcz8gUEhZIEFQSXMgaGFwcGlseSBjb25zdW1lIGEgbnVsbHB0cgo+
IGFuZCBOT1Agb3V0LCBhbmQgdGhlIFBIWSBpcyBhbHJlYWR5IHJldHJpZXZlZCB3aXRoIF9vcHRp
b25hbCgpLAo+IHNpbWlsYXJseSB3aXRoIGNsawo+Cj4gS29ucmFkCgpCZWNhdXNlIGl0IGNsZWFy
bHkgZGl2aWRlcyB0aGUgZHJpdmVyJ3MgbG9naWMgaW50byB0aGUgbWFudWFsIGFuZApmaXJtd2Fy
ZS1kcml2ZW4gdmFyaWFudHMuIEp1c3QgYmVjYXVzZSB3ZSBjb3VsZCwgZG9lc24ndCBuZWNlc3Nh
cmlseQptZWFuIHdlIHNob3VsZCBqdXN0IGNhbGwgUEhZIEFQSXMgd2l0aCBhIG51bGxwdHIgaWYg
cmVhZGFiaWxpdHkgaXMKYmV0dGVyIHdoZW4gd2UgZG9uJ3QuCgpCYXJ0b3N6CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
