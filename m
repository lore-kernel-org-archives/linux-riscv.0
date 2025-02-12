Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D12C021A0
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6/5ORLAspVJWQxh8rSlqbg350Co8g03nYnskdpynB8=; b=Ypx7/qQEtgPbBZ
	/seVtZ9c3rozWa7Z1BwExTWnsL2Gimdvh9m1efQmwCrSBKm3AaTGjKe0nAh1w9tiseSUuP1VJj6Ly
	5RSPc/JZ4snugFOsKHxio+yfgHxiuolI8eAAc0YUCXnsfBWu6WSt1g0l67eGXFqxD//dXlhAOyvac
	admrVS2r3MySQrnr81vfm+IMgZF9CdLVm/tAb5R8Jv/oeeSYihAb+fAypE0+AUByrIxESxNSP+wFv
	omqe58TLlvAGNfIbuKo9fxfKGF+cx8XhCSmeUibb2haEhep5PIaSiK1a46lffbu5G0B046rgXCZ1t
	8W7dj2MaFFIHp0c3qxhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGR-00000008Esc-0i9N;
	Wed, 12 Feb 2025 17:11:07 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFl5-000000087jt-2WsD
	for linux-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 16:38:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-545097ff67cso4052110e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378320; x=1739983120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=BOmhAQyRQLzO8rT1SG6x67DQ8ViIXLTJCjMw1zENjIzcrn3eXZxlI8/gsyX8mORolE
         FLNcAOfsoNO3ANhxqmWY3a86i+R7lzZkYAM93jsebHN/MERlsWbOloUB8iexTnoViSV+
         RyoVcBiWeS67/tvR0pUlH2ZT5dvyHJh6VFZ1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378320; x=1739983120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=IiHM1Q9shS+eTKbQHzHs4s0hmoho/rvH5n4d3ngg2uc6EheKvWgPqzNMrITOJtLHL0
         CX5HYb3GrujHWC8d7cE6hnAjYkK1zjBX3VGUygWIy43k9RSf8ZHoFvGdxuCDGoAZ73i8
         aphn++ecXxWczqTKhC+PeCrP5dBqDC/Dw0OuK5bCmRNwozrMitT2qBV/sWahLJ2z0GOE
         wEoRhyihXgtXbfLiiDhSLBvdxt/BZBhx8rtZ0WKTlD7hXDVXvxDELr0gU5Yt3LIoLvSG
         tGhkR23Ywt1GtXsSelK+I7xWdaU8vi/9QDg3s8Lm8kguP31qW8vQYef+1UFVjcWPPWxT
         Zipg==
X-Forwarded-Encrypted: i=1; AJvYcCVdA8LuBzYHkw1GJj830uvT+gJvLQuSbJqjFFL5hnINP9MnIXm+P5CSMhJuFh4a/mZ3QeW2u0Y1DNh2eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBi8nbhE6HoKZKRmLtwRgjAaP4aKaGzKQysn9PAVraYpIHXOc8
	DaitK3W9ZaaMTDgPyD5ltlMd93QeeVNfgXIZmzjzGAraGHkAFYGYruf9au93Tvh3T/BzxbpeYzS
	/Isd1
X-Gm-Gg: ASbGncsySQSGDOu5v+ZlDO4sVQZaKfykEA8xliHgSXyFW7Ek01mQPGtrTovoVqoFNtl
	tapdr/xRC5pkrU4EPJFP7g2pLvU2uJV8KCh7jEYGpIXn+tINDR8HY2YUVUgK9I6zz8x+ZFhLHzd
	3lBdxLniyEETO9wk4kY6DKtfERfCITvzUuHoHQPnK2ZpNH4M7MljxJJ47rhcA8TQD+JuJKvxg42
	lz9EVrBbCbMrkqcng798P5T0JGZ4D1ToT5JeLhecxQaEDdbOVd5pmu/vUuAxDaksvEVKG+C2zXD
	pzcXLTq5RDPcN3HDh7YUuNo67Nicu7ip7jgGv/PDvPNCzLmW4Rm4tLY=
X-Google-Smtp-Source: AGHT+IEHq7PllU7m+5EoNqIDqTzTielS1Bvn6VHKulFKNJzqkGJWDeYW8JH0+EWxzmOEB6uFfPnPLw==
X-Received: by 2002:a05:6512:348f:b0:545:e70:b142 with SMTP id 2adb3069b0e04-545184a2ecdmr923493e87.38.1739378319796;
        Wed, 12 Feb 2025 08:38:39 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54508d084d7sm1210234e87.88.2025.02.12.08.38.37
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:38:37 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54504f29000so4468689e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Feb 2025 08:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpT+AJ1yN9YPD1oKr2jjLIQa9XqOMihEtzNe9yjWr5kNEaIUMEjXoAMiB7nr/y+MeFy2D9UOGk1g2/YA==@lists.infradead.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083843_667321_83A2CD19 
X-CRM114-Status: GOOD (  16.37  )
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

SGksCgpPbiBUdWUsIEZlYiAxMSwgMjAyNSBhdCA5OjI44oCvQU0gSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gVGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRp
b24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCB0bwo+IHVzZSB0aGUgYXZhaWxhYmxl
IGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+Cj4gVXNlIGl0IGFuZCByZW1vdmUg
c29tZSBib2lsZXJwbGF0ZSBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMgfCA4NCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgpUaGFua3Mg
Zm9yIGNyZWF0aW5nIHRoZSBoZWxwZXJzIGFuZCBnZXR0aW5nIHJpZCBvZiBzb21lIGJvaWxlcnBs
YXRlIQpUaGlzIGNvbmZsaWN0cyB3aXRoIGNvbW1pdCA1NzRmNWVlMmM4NWEgKCJkcm0vYnJpZGdl
OiB0aS1zbjY1ZHNpODY6CkZpeCBtdWx0aXBsZSBpbnN0YW5jZXMiKSB3aGljaCBpcyBpbiBkcm0t
bmV4dCwgdGhvdWdoLiBQbGVhc2UgcmVzb2x2ZS4KClNpbmNlIG5vdGhpbmcgaGVyZSBpcyB1cmdl
bnQsIEkgd291bGQgYXNzdW1lIHBhdGNoICMxIHdvdWxkIGxhbmQgYW5kCnRoZW4gd2UnZCBqdXN0
IHdhaXQgdW50aWwgaXQgbWFkZSBpdCB0byBtYWlubGluZSBiZWZvcmUgbGFuZGluZyB0aGUKb3Ro
ZXIgcGF0Y2hlcyBpbiB0aGVpciByZXNwZWN0aXZlIHRyZWVzPwoKCj4gLXN0YXRpYyBpbnQgdGlf
c242NWRzaTg2X2FkZF9hdXhfZGV2aWNlKHN0cnVjdCB0aV9zbjY1ZHNpODYgKnBkYXRhLAo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhdXhpbGlhcnlfZGV2
aWNlICoqYXV4X291dCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpuYW1lKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwZGF0
YS0+ZGV2Owo+IC0gICAgICAgc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmF1eDsKPiAtICAgICAg
IGludCByZXQ7Cj4gLQo+IC0gICAgICAgYXV4ID0ga3phbGxvYyhzaXplb2YoKmF1eCksIEdGUF9L
RVJORUwpOwo+IC0gICAgICAgaWYgKCFhdXgpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+IC0KPiAtICAgICAgIGF1eC0+bmFtZSA9IG5hbWU7Cj4gLSAgICAgICBhdXgtPmRldi5w
YXJlbnQgPSBkZXY7Cj4gLSAgICAgICBhdXgtPmRldi5yZWxlYXNlID0gdGlfc242NWRzaTg2X2F1
eF9kZXZpY2VfcmVsZWFzZTsKPiAtICAgICAgIGRldmljZV9zZXRfb2Zfbm9kZV9mcm9tX2Rldigm
YXV4LT5kZXYsIGRldik7Cj4gLSAgICAgICByZXQgPSBhdXhpbGlhcnlfZGV2aWNlX2luaXQoYXV4
KTsKPiAtICAgICAgIGlmIChyZXQpIHsKPiAtICAgICAgICAgICAgICAga2ZyZWUoYXV4KTsKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIH0KPiAtICAgICAgIHJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHRpX3NuNjVkc2k4Nl91bmluaXRfYXV4LCBhdXgp
Owo+IC0gICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtCj4g
LSAgICAgICByZXQgPSBhdXhpbGlhcnlfZGV2aWNlX2FkZChhdXgpOwo+IC0gICAgICAgaWYgKHJl
dCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiAtICAgICAgIHJldCA9IGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsIHRpX3NuNjVkc2k4Nl9kZWxldGVfYXV4LCBhdXgpOwo+IC0g
ICAgICAgaWYgKCFyZXQpCj4gLSAgICAgICAgICAgICAgICphdXhfb3V0ID0gYXV4OwoKSSBub3Rp
Y2UgdGhhdCB5b3VyIG5ldyBjb2RlIGhhcyBvbmUgZmV3ZXIgZGV2bV9hZGRfYWN0aW9uX29yX3Jl
c2V0KCkKdGhhbiB0aGUgY29kZSBoZXJlIHdoaWNoIHlvdSdyZSByZXBsYWNpbmcuIFRoYXQgbWVh
bnMgaXQgbmVlZHMgdG8gY2FsbAoidW5pbml0IiBleHBsaWNpdGx5IGluIG9uZSBleHRyYSBwbGFj
ZS4gSXQgc3RpbGwgc2VlbXMgY2xlYW4gZW5vdWdoLAp0aG91Z2gsIHNvIEkgZG9uJ3QgaGF2ZSBh
bnkgcmVhbCBvYmplY3Rpb25zIHRvIHRoZSB3YXkgeW91J3JlIGRvaW5nIGl0CnRoZXJlLiA7LSkK
Ci1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
