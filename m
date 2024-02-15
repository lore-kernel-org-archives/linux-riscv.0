Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788DC48BC4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1i5PO9oYjmtXOisAYdwg+Qw0G3s6Oo93dEHZqL7/FQ=; b=Nuqz6pb9rhs38J
	IznRq6G/mY04XGaPYPuIm4YPi48r3LPLabx7p4Ae6AsUx6L4BjP2lwCosjJq03wVL3Imuu1oOAqy2
	QFOtn4GLyfUZj8cyiaAxQ1VN++EX4BaVIlk0yXUcEZ5hiAPjCToHtQzEyvM+mpcACOTME8SROCKvN
	/+aj9ocO8nqN7au82sroLHrgXTXVOOpmNLIoG2V7CGnyudzSm+5IB/NZBiSZO8UDqA42a0C4BrUix
	VrwFn/vhDhJbPkk0PMhiYfI0BGcPXCk0KmIujHYWFUtpGLxslriZGGM9AYtxqTUQ/r3cg5F0Y6Ams
	sHMlzT8bR45RkHlkuI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac9L-0000000GSQp-0GyI;
	Thu, 15 Feb 2024 13:51:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac9H-0000000GSPs-3wlj;
	Thu, 15 Feb 2024 13:51:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-411a5b8765bso5293765e9.1;
        Thu, 15 Feb 2024 05:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708005094; x=1708609894; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5t9mkBRSLuX6Whm+p+USkACVg0A1ZTFUPoQmMKDP/ks=;
        b=lOS6X2lM7Z0Ji0t0jnlx04RdLs68zFspL9JVSzJuEuO4bD7MWxLYhgGpJdFS/tIu6b
         6ShFzqG9pWol2ck1YQRJIHcLWKdWlfbSp+Awm7BL+SYKUtcj02qrODaQdp6z3U1Zkzzu
         ch6lwCJZlliPvTdG27wUq23bKsqhrUSM0ybEkRHS/CKP5KH6a6LCzXeaSSVIpLGy2gWF
         c5EBnpY0GbcvyvSuMfLOUdd0F+B50RkBuUdL8JvjezoFjsdCGcrED2icOUptBXQBDlp0
         sF/L+y9O0g/3gMoXbi5Deet3wJDqXeMH2gYhyVz5Es+H6epJUJC2cKLc0nzvbR0M7ilY
         C3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708005094; x=1708609894;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5t9mkBRSLuX6Whm+p+USkACVg0A1ZTFUPoQmMKDP/ks=;
        b=b/YMijkqXobKrsekW3csN2+WbpFQTscWcUZMIPSpR3a5GieyjkJymsfbY29+pqM48k
         IFmd2M5S9VWnimV39zeXQpR8NWs3WSWsVD9aqM/5lP8lNK6HC7V2w0EjGY0ylREST2QZ
         gHQcgms72VNJ1W1rAxVbB967lVLPqNjsr6BhNUVyNYoDyxWxrTYxsHeHEaJYnkEWzzQb
         98LdkSgB34CDi6M+G7sJZtjs6lXOZvPtetSXanz208Miaj6MvQDfPKWnsrJp+pbKc2C+
         wZR0WahH1fLV/NGcR6RU8QVkwfmPx7wn0jO9Hg5wQzl0KhBwvnhV7n5pws81abJ0X8r0
         eWNA==
X-Forwarded-Encrypted: i=1; AJvYcCVrpNtI7fnVr1MbtOw7HnhLVGzqXFKomZXhfVkk9fTgd0uhXMxO0wraGHNLeWi92ZaWijQ3YJHmZ39ULpoj0sF/JG1V6l7gU14vH/BygrsS70O+u48WLCaAqVQPQCo35iYvG3W3Ih+hS7cz4jPfpdekwe474UuwGeCaImbznOjXkVFtFfEslm+GQCgxuTSTi971o4u6AW5z5PM+RcSPxYnxACLd7FCa4/sQsX36twlOta43MkIFwOusmLF+dgJrM4H9OmEOH8WdAkJs5zE5yPiiBq9XhKwzeke2D+byEn7wnRBxSPEEgPAOhCqUmra4ZVD7433LNHsU2/aeFWoDBMPsRt+t04bl
X-Gm-Message-State: AOJu0Yz0i3E1IASMiY9618s/5brZl7R3MPn/osjklotJHGEwNT7Qd/W8
	ZqNMHxNGaZYiFBwTJXjwQ8S61HF7scM3Bo+dCIfMZAnO8aMgEO7v
X-Google-Smtp-Source: AGHT+IH7k9jN1LEPjklm49kSSJGmdKPhxpWNQecPQqPdKhvRMqEI/U195h3M4bWUY8DUrcLpEFVYaQ==
X-Received: by 2002:a05:600c:3503:b0:412:7d0:d83 with SMTP id h3-20020a05600c350300b0041207d00d83mr1601111wmq.16.1708005093670;
        Thu, 15 Feb 2024 05:51:33 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b00410add3af79sm5061337wmd.23.2024.02.15.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 05:51:33 -0800 (PST)
Message-ID: <63b248efcbd62a121610cbf37ea0339bd87c99e7.camel@gmail.com>
Subject: Re: [PATCH v6 003/164] pwm: Provide pwmchip_alloc() function and a
 devm variant of it
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Walle
 <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Paul Cercueil <paul@crapouillou.net>, 
 linux-tegra@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Thierry Reding <thierry.reding@gmail.com>, James Clark
 <james.clark@arm.com>, Pavel Machek <pavel@ucw.cz>,  Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck
 <groeck@chromium.org>,  chrome-platform@lists.linux.dev, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Fabio Estevam <festevam@gmail.com>, 
 linux-riscv@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Samuel
 Holland <samuel@sholland.org>,  linux-samsung-soc@vger.kernel.org, Bjorn
 Andersson <quic_bjorande@quicinc.com>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, Sean
 Anderson <sean.anderson@seco.com>, Benson Leung <bleung@chromium.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org,  Chen-Yu Tsai <wens@csie.org>, Michal
 Simek <michal.simek@amd.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-leds@vger.kernel.org, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org,  linux-sunxi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,  linux-pwm@vger.kernel.org, Kees Cook
 <keescook@chromium.org>, Sven Peter <sven@svenpeter.dev>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Ray Jui
 <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan
 =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Vladimir Zapolskiy
 <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Mark Brown
 <broonie@kernel.org>,  linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,  Baolin Wang
 <baolin.wang@linux.alibaba.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>,  kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Alexander Shiyan <shc_work@mail.ru>, Scott
 Branden <sbranden@broadcom.com>,  linux-gpio@vger.kernel.org, Daire
 McNamara <daire.mcnamara@microchip.com>,  Chunyan Zhang
 <zhang.lyra@gmail.com>, Hector Martin <marcan@marcan.st>, 
 linux-stm32@st-md-mailman.stormreply.com, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,  Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev,  Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin
 Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,  Anjelique
 Melendez <quic_amelende@quicinc.com>
Date: Thu, 15 Feb 2024 14:51:31 +0100
In-Reply-To: <ws4ybgtvfxqz53vk3i67suipzyqpy5y5fqeee5uf3ua6ow222n@i4ktjuorq3nl>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
	 <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
	 <Zcy21tsntcK80hef@smile.fi.intel.com>
	 <ws4ybgtvfxqz53vk3i67suipzyqpy5y5fqeee5uf3ua6ow222n@i4ktjuorq3nl>
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_055136_004044_845A055B 
X-CRM114-Status: GOOD (  31.44  )
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

T24gVGh1LCAyMDI0LTAyLTE1IGF0IDEzOjAxICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToKPiBPbiBXZWQsIEZlYiAxNCwgMjAyNCBhdCAwMjo0OToyNlBNICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAxNCwgMjAyNCBhdCAxMDozMDo1MEFNICswMTAw
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+ID4gVGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMg
YSBzdHJ1Y3QgcHdtX2NoaXAgYW5kIGRyaXZlciBkYXRhLiBDb21wYXJlZCB0bwo+ID4gPiB0aGUg
c3RhdHVzIHF1byB0aGUgc3BsaXQgaW50byBwd21fY2hpcCBhbmQgZHJpdmVyIGRhdGEgaXMgbmV3
LCBvdGhlcndpc2UKPiA+ID4gaXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgcmVsZXZhbnQgKHll
dCkuCj4gPiA+IAo+ID4gPiBUaGUgaW50ZW50aW9uIGlzIHRoYXQgYWZ0ZXIgYWxsIGRyaXZlcnMg
YXJlIHN3aXRjaGVkIHRvIHVzZSB0aGlzCj4gPiA+IGFsbG9jYXRpb24gZnVuY3Rpb24sIGl0cyBw
b3NzaWJsZSB0byBhZGQgYSBzdHJ1Y3QgZGV2aWNlIHRvIHN0cnVjdAo+ID4gPiBwd21fY2hpcCB0
byBwcm9wZXJseSB0cmFjayB0aGUgbGF0dGVyJ3MgbGlmZXRpbWUgd2l0aG91dCB0b3VjaGluZyBh
bGwKPiA+ID4gZHJpdmVycyBhZ2Fpbi4gUHJvcGVyIGxpZmV0aW1lIHRyYWNraW5nIGlzIGEgbmVj
ZXNzYXJ5IHByZWNvbmRpdGlvbiB0bwo+ID4gPiBpbnRyb2R1Y2UgY2hhcmFjdGVyIGRldmljZSBz
dXBwb3J0IGZvciBQV01zICh0aGF0IGltcGxlbWVudHMgYXRvbWljCj4gPiA+IHNldHRpbmcgYW5k
IGRvZXNuJ3Qgc3VmZmVyIGZyb20gdGhlIHN5c2ZzIG92ZXJoZWFkIG9mIHRoZSAvc3lzL2NsYXNz
L3B3bQo+ID4gPiB1c2Vyc3BhY2Ugc3VwcG9ydCkuCj4gPiA+IAo+ID4gPiBUaGUgbmV3IGZ1bmN0
aW9uIHB3bWNoaXBfcHJpdigpIChvYnZpb3VzbHk/KSBvbmx5IHdvcmtzIGZvciBjaGlwcwo+ID4g
PiBhbGxvY2F0ZWQgd2l0aCBwd21jaGlwX2FsbG9jKCkuCj4gPiAKPiA+IC4uLgo+ID4gCj4gPiA+
ICsjZGVmaW5lIFBXTUNISVBfQUxJR04gQVJDSF9ETUFfTUlOQUxJR04KPiA+ID4gKwo+ID4gPiAr
c3RhdGljIHZvaWQgKnB3bWNoaXBfcHJpdihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCj4gPiA+ICt7
Cj4gPiA+ICsJcmV0dXJuICh2b2lkICopY2hpcCArIEFMSUdOKHNpemVvZigqY2hpcCksIFBXTUNI
SVBfQUxJR04pOwo+ID4gPiArfQo+ID4gCj4gPiBXaHkgbm90IHVzZSBkbWFfZ2V0X2NhY2hlX2Fs
aWdubWVudCgpID8KPiAKPiBIbW0sIHRoYXQgZnVuY3Rpb24gcmV0dXJucyAxIGlmIEFSQ0hfSEFT
X0RNQV9NSU5BTElHTiBpc24ndCBkZWZpbmVkLiBUaGUKPiBpZGVhIG9mIHVzaW5nIEFSQ0hfRE1B
X01JTkFMSUdOIHdhcyB0byBlbnN1cmUgdGhhdCB0aGUgcHJpdiBkYXRhIGhhcyB0aGUKPiBzYW1l
IG1pbmltYWwgYWxpZ25tZW50IGFzIGttYWxsb2MoKS4gVG9vayBteSBpbnNwcmlyYXRpb24gZnJv
bQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMDktY291bnRlci1hbGlnbi1maXgt
djItMS01Nzc3ZWEwYTI3MjJAYW5hbG9nLmNvbQo+IC4gVGhlIGltcGxlbWVudGF0aW9uIG9mIGRt
YV9nZXRfY2FjaGVfYWxpZ25tZW50IHN1Z2dlc3RzIHRoYXQgbm90IGFsbAo+IGFyY2hzIHByb3Zp
ZGUgQVJDSF9ETUFfTUlOQUxJR04/IEFsc28gdGhlcmUgaXMgQVJDSF9LTUFMTE9DX01JTkFMSUdO
Lgo+IEhtbSwgZG9uJ3Qga25vdyB5ZXQgd2hhdCB0byBkbyBoZXJlLgoKSGVyZSBpdCBnb2VzIG15
IDIgY2VudHMuLi4gQUZBSUssIEFSQ0hfRE1BX01JTkFMSUdOIGdpdmVzIHlvdSB0aGUgc2FtZSBh
bGlnbm1lbnQKZ3VhcmFudGVlcyB0aGFuIGRldm1fa21hbGxvYygpIGZvciBpbnN0YW5jZS4gSW4g
c29tZSBhcmNocyBpdCB3aWxsIGVmZmVjdGl2ZWx5IGJlIHRoZQpzYW1lIGFzIEFSQ0hfS01BTExP
Q19NSU5BTElHTi4gTm93LCBJIHRoaW5rIGl0IG9ubHkgbWF0dGVycyBpZiB0aGUgb3duZXJzIG9m
IHByaXZhdGUKZGF0YSBpbnRlbmQgdG8gaGF2ZSBhIERNQSBzYWZlIGJ1ZmZlciBpbiB0aGVpciBz
dHJ1Y3RzLiBJZiB0aGF0IGlzIHRoZSBjYXNlLCB3ZSBuZWVkCnRvIGVuc3VyZSBhIHByb3BlciBh
bGlnbm1lbnQgZm9yIHRoYXQgc3RydWN0dXJlLiBJbiBJSU8gZm9yIGV4YW1wbGUsIHRoZSBjb25z
dHJ1Y3QgaXMKbGlrZSB0aGlzOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2lpby9kYWMvbHRjMjY4OC5jI0w5NgoKVGhlIGJ1ZmZlcnMgc2hv
dWxkIGNvbWUgbGFzdCBpbiB0aGUgc3RydWN0IHNvIHRoZXkgYXJlIGFsb25lIGluIHRoZSBsaW5l
LiBJbiBJSU8sCkpvbmF0aGFuIGhhcyBhIHN0cmljdCBwb2xpY3kgZm9yIHRoaXMuIExpa2UsIGV2
ZW4gaWYgeW91IGp1c3Qgd2FudCB0byB0cmFuc2ZlciAyLzQKYnl0ZXMgdmlhIHNwaSwgd2UgbmVl
ZCB0byBtYWtlIHRoZSBidWZmZXIgc2FmZSAoYXBwYXJlbnRseSB0aGVyZSBhcmUgc29tZSBjb250
cm9sbGVycwpvbmx5IGRvaW5nIERNQSAtIGV2ZW4gZm9yIHNtYWxsIHRyYW5zZmVycykuCgpJIHdv
dWxkIHNheSB0aGF0IGlmIHVuc3VyZSwgZ28gd2l0aCBBUkNIX0RNQV9NSU5BTElHTi4gWW91IGp1
c3QgbWlnaHQgd2FzdGUgc29tZQpzcGFjZSBpbiBzb21lIGFyY2hzLiBPVE9ILCBpZiB5b3UgdGhp
bmsgRE1BIGlzIG5vdCByZWFsbHkgYSB0aGluZyBmb3IgcHdtIGNoaXBzLCB5b3UKbWlnaHQgZ28g
QVJDSF9LTUFMTE9DX01JTkFMSUdOLiBBbmQgc2luY2UgeW91IGFscmVhZHkgaGF2ZSB5b3VyIG93
biBQV01DSElQX0FMSUdOLCBpdApzaG91bGQgYmUgZWFzeSB0byBjaGFuZ2UgdGhlIHJlcXVpcmVt
ZW50cyBkb3duIHRoZSByb2FkIChpZiBuZWVkZWQpLgoKVGhhdCBzYWlkLCBJJ20gbm90IGZhbWls
aWFyIHdpdGggZG1hX2dldF9jYWNoZV9hbGlnbm1lbnQoKS4KCi0gTnVubyBTw6EKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
