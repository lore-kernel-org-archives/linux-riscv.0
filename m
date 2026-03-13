Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA1105F780
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIF7G1YuFj7VbH7elTVTg/hW48X0U6WB1X67OlJAmgA=; b=3bB7RhNS8zibeX
	equksGDmMs+d1UDKAlvZTl7eIx+cSgYLgHyyb1b3dtrDF5xpykqT+Z1KEVYnODDPlxgVHMVO39Qi1
	3e8/zsNJgFJGrXCQD1Rgd3gAGGMEd6D5+UKNAIk+/Lh/M45BoxYjcy2AKoiEZm44/Yc+cwPo4q0KH
	RqRN6BeP0+pa2riY+MS1QmNZS0dkm458//jtlipBelMgD7jz+GLk9jf+RMZoIfSzXXH4dHPy0FzLG
	3y9xg4K2vWTR9vfjrVXIoEZIVbGnr1jZLUWsdu7hYVHqQ7h5mV9fGRbuNzBaoiraMlJqwEWnaSrlh
	u0PjXUvlw+vwDjNp43rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJO-0000000HJpu-1vTw;
	Fri, 13 Mar 2026 08:56:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yJL-0000000HJoi-0GfY
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 08:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FED74449C
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B235C2BCC4
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773392158;
	bh=dIPXg2emkEHtVSMn/uiweeN0mkAf0sj6N0jCu1Xxr2I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TuNN/sdsSHwP/VHRKKsG1F4YTUS5ZhzO3eF6ZjflRECLSxm52GZn0O+a6DYtw8s9w
	 AztRsZ6hwk6mFH9QjMLP6ul2unGjmpkpIqrGCVRM7XJ91lE5qjYrRo421vuqGU+Ips
	 dUTvUP2lPwGo6cUpGRPiarN2csB7JvMb0jI/Ci+wBxM0t4CvddwnzhqGPCkq7OZ2uz
	 q1FLHibPBhnYDoXHHAzK4gd8xjmC/HbpS/GJkB9AsODxRC/oP9dyHczV035sr3rZQ7
	 zhugJAyuq9iyE0d58vLAu0TaPaxVAVMP78UrAtKR75moc4u0qVEPZakARFdazt8gZI
	 bL3wWDwmcIB/Q==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a725a14e3so17417741fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWrBN97MtX8L7uomDe1QFyIA1AfsHmdm149shZ7DeLTQ03oQ+tl7bGWdRi9Dau+ij0IfMqjytsCPKI8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLAzAdwaLgN7UB+oHfQ3uIb9Rt8mB0PLUcp7odIM9k42CHX2f4
	mINFWGx384mjixnRrUPLpr+IyETu4ml7oosG3Ld5HYO2mw6nNOW5qGkkOV5klAj1B87f05RnI8e
	fRStz0uDWntWAVBsT7MwCxdAr6osR4LcnXduclRcKDw==
X-Received: by 2002:a2e:350d:0:b0:38a:878b:b567 with SMTP id
 38308e7fff4ca-38a897de73cmr6682211fa.36.1773392156502; Fri, 13 Mar 2026
 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com> <20260312181654.2d9ba69c@kernel.org>
In-Reply-To: <20260312181654.2d9ba69c@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 09:55:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
X-Gm-Features: AaiRm5311s8a1dkokfIWdxBu9dTaoHy4sXAtnoSYnP4jjneoiOLY-XItyfiRHlE
Message-ID: <CAMRc=Md8i6oCAqOBB_3q9PkkbaUxrCftum+WBjvac2O+Hk8kTg@mail.gmail.com>
Subject: Re: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_015600_258649_066396CE 
X-CRM114-Status: GOOD (  20.47  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMjoxNuKAr0FNIEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxMSBNYXIgMjAyNiAxODowMzozNSArMDEwMCBC
YXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBmaXJtd2Fy
ZS1tYW5hZ2VkIHZhcmlhbnQgb2YgdGhlIERlc2lnbldhcmUgTUFDIG9uCj4gPiB0aGUgc2E4MjU1
cCBwbGF0Zm9ybS4gVGhpcyBzZXJpZXMgY29udGFpbnMgbmV3IERUIGJpbmRpbmdzIGFuZCBkcml2
ZXIKPiA+IGNoYW5nZXMgcmVxdWlyZWQgdG8gc3VwcG9ydCB0aGUgTUFDIGluIHRoZSBTVE1NQUMg
ZHJpdmVyLgo+ID4KPiA+IEl0IGFsc28gcmVvcmdhbml6ZXMgdGhlIGV0aHFvcyBjb2RlIHF1aXRl
IGEgYml0IHRvIG1ha2UgdGhlIGludHJvZHVjdGlvbgo+ID4gb2YgcG93ZXIgZG9tYWlucyBpbnRv
IHRoZSBkcml2ZXIgYSBiaXQgZWFzaWVyIG9uIHRoZSBleWUuCj4KPiBOb3QgZW50aXJlbHkgc3Vy
ZSB3aGF0IHRoZSBjb25jbHVzaW9uIHdhcyBpbiB0aGUgc3ViLXRocmVhZCB3aXRoIFJ1c3NlbGwK
PiBidXQgRldJVyB0aGlzIGRvZXNuJ3QgYXBwbHkgdG8gbmV0LW5leHQgYXMgcG9zdGVkIHNvIHJl
c3BpbiB3aWxsIGJlCj4gbmVlZGVkIGVpdGhlciB3YXkuCgpuZXQtbmV4dCBpcyBxdWl0ZSB0aGUg
bW92aW5nIHRhcmdldCwgaXNuJ3QgaXQ/IEkgZGlkIGp1c3QgdGhhdCBiZXR3ZWVuCnY3IGFuZCB2
OC4gOikKCkFzIGZvciBSdXNzZWxsJ3MgcmVzcG9uc2U6IEkgdGhpbmsgdGhpcyBpcyB0aGUgdGhp
cmQgdGltZSB3ZSdyZSBkb2luZwp0aGlzIGZvciB0aGlzIGRyaXZlci4gOiggVGhpcyBzZXJpZXMg
aXMgbm90IHRvdWNoaW5nIHRoZSBleGlzdGluZwpmdW5jdGlvbmFsaXR5IGFuZCByZWJhc2luZyBv
ZiBSdXNzZWxsJ3MgY2hhbmdlcyBvbiB0b3Agb2YgdGhpcyBzaG91bGQKZm9yIG1vc3QgcGFydCBi
ZSB0cml2aWFsLiBUaGUgY29yZSBvZiB0aGUgY2hhbmdlc2V0IGlzIHRvIGFkZCBzdXBwb3J0CmZv
ciBwb3dlciBkb21haW5zIHRvIGVuYWJsZSBldGhlcm5ldCBvbiBTQ01JIGRyaXZlbiBTb0NzLiBJ
IHdvdWxkCnJlYWxseSBhcHByZWNpYXRlIGl0IGlmIHdlIGNvdWxkIGdldCBpdCB1cHN0cmVhbSBh
bmQgdGhlbiBhbnkKc3Vic2VxdWVudCByZXdvcmsgY2FuIHRha2UgaW50byBhY2NvdW50IHRoZSB0
d28gdHlwZXMgb2Ygc3lzdGVtcyB3ZQpzdXBwb3J0LgoKUnVzc2VsbDogSSBzZWUgeW91ciBwb2lu
dCBhbmQgZGlkbid0IG1pbmQgdGhlIGZpcnN0IHR3byB0aW1lcyBidXQgaXQncwpiZWVuIHdheSB0
b28gbG9uZyBzaW5jZSBJIHBvc3RlZCB2MS4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
