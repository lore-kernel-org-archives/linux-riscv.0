Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2CFC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dMnEOpJTsI+fnF9MMfnk4pKBGqHQMiiStEDCMFmIMk8=; b=W4rp66R0TUv4Hh
	ixbfNBG/iTwlAJi0431MttGKRJEM9r6GG1Q2k9tWcWlgEgrzNetoEsQ1XcYphm5I0PNASVt7fqeZv
	0/rO8xEdK7xGaJgN99fK3Q3JMVavqiTjbzPbS5hH1VVOTvMF0AgfD8HxpyRR2c1VnKB8winUr8WiI
	rBBGS4alrmKNNnHYB7XcQwFj7t+95oTIFRZKJtwC+whVbYguFlZt5GTnxug9gz+h2z+6SdZ8aoXvB
	QqaNADcXYbgXUx76wYLnp3H1CiIHjT3BYpIeqB/1XRaYTX4S/TjcJHaxpijLbDHFWX0QGJLv6ONqv
	15sQ8erJaLmPDQaP0X+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeNj-0000000BmV1-15Sz;
	Mon, 06 Jul 2026 08:08:47 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeNg-0000000BmUe-3Nve
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:08:45 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-738bd0b7960so2278854137.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 01:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325323; x=1783930123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=Ec0Rza5AJNt1CpYR16a0kCo8nedO/dIAE8DqhQjajH8CWj8OMhZsYLsPbBJyJrB34s
         vMjL0Cobwo9AzkECewiyp7V0hO8zjNg+sFfWCecw1bGXLxGLegWdLw7Pha/RtFFTiSgv
         7yAclyqJXE/v0Jj/GBUI/RnhGQYikMpvDdTZtmGC4maACYLtxLedpeJdHspDtQ2SM2cK
         nD+wnE3NMIGVRRfo8+vEyjgbMdhoCSWDW77pgdD8wnR9d4HTZC1Vdc/OI7Id8abxPo/9
         3pOcIcTBmYMTcGMvaIuomybfSEcrazJcQKyR9RqzW342TlLtMN/1lK9mtEy/R/Jz+1ec
         noEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaOBPzhymVDPby/hc/yD8PeW4GiXY+uyNWicRvW9CVsG118BWHOqp9k0b7kElG2HKw18xkKDItdCkPRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn8tSOq261XuAObsurCuUKHroMew9CQSzr9u0itDJM8k6z0jEp
	FlCCE/oTUVu4hSmJf1Vzch0ahVj/F6CiKb8oKJHU7IRP6rBJNDTPsyHueVPco/fe
X-Gm-Gg: AfdE7cn/kVt84/RB2BhFdPSQma1aSEk0cMS8vVGhxQEBXpT19PIQdqNckeiyy/0YnmU
	MbbBLmPyVs05EXrb8F+DrOnIkNcmJ3tsHfgUydMUahihLjYzz9NFHwEtwTZEzTbMjlOZAzyf2Zm
	x3kRQ8iwQ8KT8wOHfEmv02AJPHTEV5awj1sMnOlnvr5icwgWfXTGjMCfPYY5oKZ3EnhoDf4LYad
	rUohuD78aY9NACDGMVDyHDaFd6aEfSXxkCHUB2SixABXQMBDdDrm3AMJsRqz3K4w0SISxo9CCLu
	Jfc6AzHeMvuuDwFOZhA/MQz3pbw1/PlR8n8Gxr24iY5dTZ6mkdEBkvOAqUAd4B5VhwfOEzRadvA
	kTTrjUqU1FDBpy6iwrYVepKM5ZXeSe5Kf7aQrKY3l3uG4VtvrhF6XvNmWsAYS0Zfz2vsW3ior31
	HaU26fNI8To15Yw075LmuIbg8Q0emP5PTIAoeFRU1YRdFh6Do+gmwGEA==
X-Received: by 2002:a05:6102:808f:b0:740:127:c81b with SMTP id ada2fe7eead31-7427d244e24mr3298887137.7.1783325323341;
        Mon, 06 Jul 2026 01:08:43 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96b3890d5bfsm3120059241.11.2026.07.06.01.08.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:08:43 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so2027669e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 01:08:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzVgsZrM4LornzNsmuFe+ynTfUw9ZWbmcEkqNLNb0oO9ycsp6bFZDCSfSwFDDKf9/oPtQekms6WK3PAQ==@lists.infradead.org
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_010844_872150_122F0B79 
X-CRM114-Status: GOOD (  16.49  )
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

T24gU3VuLCA1IEp1bCAyMDI2IGF0IDE3OjE0LCBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFi
bGUgSHViKQo8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gIC0gVXNlIGEg
c2luZ2xlIHNwYWNlIGluIGEgb2ZfZGV2aWNlX2lkIGFycmF5IHRlcm1pbmF0b3I7IEEgc2luZ2xl
IHNwYWNlCj4gICAgYWZ0ZXIgdGhlIG9wZW5pbmcgeyBhbmQgYmVmb3JlIHRoZSBjbG9zaW5nIH0g
aW4gbm9uLWVtcHR5Cj4gICAgaW5pdGlhbGl6ZXJzOwo+ICAtIE5vIGNvbW1hIGFmdGVyIGFuIGFy
cmF5IHRlcm1pbmF0b3I7Cj4gIC0gQWxzbyBubyB0cmFpbGluZyBjb21tYSBhZnRlciBhIG5hbWVk
IGluaXRpYWxpemVyIGlmZiB0aGUKPiAgICBjbG9zaW5nIH0gaXMgb24gdGhlIHNhbWUgbGluZTsK
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIDx1
LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKPiAgZHJpdmVycy9wd20vcHdtLXJjYXIuYyAg
ICAgICAgICAgIHwgIDQgKystLQo+ICBkcml2ZXJzL3B3bS9wd20tcmVuZXNhcy10cHUuYyAgICAg
fCAxMCArKysrKy0tLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1yemcybC1ncHQuYyAgICAgICB8ICAy
ICstCgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4gIyByZW5lc2FzCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
