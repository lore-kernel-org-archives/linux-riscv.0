Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EADDC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/RoESgKnvuysL873/BBNJWsnJQOuh53qgN8q5QpaJw=; b=ssiH+W8guY4zlJ
	OKiEZovz7I4g6nSWkXFRUgiGPQ63zjQonl51g2UdP/V0vl0HmEGlSCL0MOCasDDo+RGkWgco1qwZ5
	Pc+vF8hBkho0EukTQhUpyT8XglxiwzEUL8Nk4DuQ2AI4FaHWtynsfVDkDqbh0KdtnsY10X1t58pfB
	qPSZAl1ReW+nl9sUioYBCYhzcnMej64uwZbln2EgDAKQyAVJlFJwsjFsUQnpDZsVbB7yKXs5zawFX
	DD8cHaalBV5/TYdW5Y211SkmhAORMMhiYSi2a/XYEolCmIPZrsmlWRf7YslU1lrHsl4otfIzpiDeF
	CE1GB3iPnH1yJy6fvszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixpK-0000000FMrw-1Y3X;
	Fri, 14 Feb 2025 15:42:02 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixg5-0000000FKsL-0K65
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 15:32:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54505191cdcso2116699e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 07:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739547146; x=1740151946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=GkQuNaSw+CWBgK6dH090ohQShbU1pYMLIGcsiXgRhdplb4aGy1X7VfQ2n4TgddnSgC
         c0YKFAFi6ohlIYLkhyvYHt8jU1pQX0aQlX8tsnUlcuVnEbqtHNyNaUl9WrqZpfwVaJfw
         +HXAsypolQ76Ulm5lziHEvR43TTrL6cLjYjOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547146; x=1740151946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=d3eM1D1F2YdAdoaEQ6oNHe2QQA9autAsnl4GC+sPvLcsryL/CNxC4GR6LEllb9vlQq
         tXmsSA7Xjkmx7MsmTqW2q/f3alve/A49lnQuo0NcpS/psWhmJRG+AkVYtxhVwUd/7WUl
         aRtu78LrHto9SPDzsnY2XHje8cJaiM8fizzjoEoQn+dSfmARgQWJzPuK6vfeMQhU+x9m
         LG5g3LbEsPLzixVALE4iYk0MFg2lU2+ijel0jJOjwX8kXlbVRTzL1PMyvFJte5YB2IOe
         Bbm/ANz9yS/k9bRfOjY1gM8pJaK6Ri+aVapnKjHg/DcGIJWUJTYBfZs9jNQ81fgQeH3Y
         N3+g==
X-Forwarded-Encrypted: i=1; AJvYcCWW1QU5MNb6KEIf2ps4+kH7GMfPXkwK1Tx97M4tLy/zYjQh4KzEmTONyxMYftw90bEhuOGBqRRKobVVew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyASjGIUTaN/riata2pzZ1TjtHwy4Z2su3SwcX+RYTwGu/e6snx
	8/t98hV4MdFblscr+g0V5tY+GDTl/GHWCGAe4xxKSh1wUVwBxPzjZ6yebAH8XbnEZ+P6VZETMUC
	P2g==
X-Gm-Gg: ASbGncukQpc2VAYzvk3Iv2SFFJ8jxhyLmGEMOLwtSYOxL4W52GcAMF70QAnck1ucIPz
	686VJUR/KWRTy7evkQhW/SbKlA+slQCBDpxq7oZJpFN+OrybxBPOgNAd2oYmQ+Ne0Ss06lCo/ES
	3lJaKfKZg1niQJQBgxeuYymCmqEd6r0/r5IU/oV9DE95IQ54PAkWuw5irPIERyVSQs5QcFLMvzM
	rvIvAS7JlNw5jiSPpXcHO9sRNtGdma3tO8jgGGSpXeSc5jLDh9xGuhXA/az989Dxb7WJA54NBLq
	WMOsGEIrJuHHE+TWCG0nZw7pNctIRcYTR4cDDHR58GphXDXHDhN126S1Sgk=
X-Google-Smtp-Source: AGHT+IGIhu9OyGVeeBmgX9z2TAbzWWNE/apvzysGpj//G6T6hR5yIdtTmYAtO5TOY1IxwWLVfzjqsQ==
X-Received: by 2002:a05:6512:2309:b0:542:98bb:5674 with SMTP id 2adb3069b0e04-5451ddcae24mr2652072e87.33.1739547146300;
        Fri, 14 Feb 2025 07:32:26 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e734ad1sm106252e87.45.2025.02.14.07.32.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:32:26 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30795988ebeso23381731fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 07:32:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV6zQL9Rx8IAmoLhW5zwY5U4/ZUeibFD2F0MpGMgiut6aVfp0FAOfuoZzMGtGqs7EFBJ/sDbhaK2N4K8A==@lists.infradead.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250214_073229_130560_6CA5C026 
X-CRM114-Status: GOOD (  16.82  )
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

SGksCgpPbiBGcmksIEZlYiAxNCwgMjAyNSBhdCAxMjo1OeKAr0FNIEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+ID4gT25lIHRoaW5rIHRoYXQncyBhbHdheXMg
ZmVsdCBhIGJpdCBtZWggdG8gbWUgaXMgdGhpcyBpZCBudW1iZXIgc3R1ZmYsCj4gPiBJIGp1c3Qg
dGhyZXcgaW4gNjY2IGZvciBtZW1lIHZhbHVlLgo+Cj4gOikKPgo+ID4gVGhlIHdob2xlIHRoaW5n
IHNlZW1zIHN1cGVyCj4gPiBhcmJpdHJhcnksIGRvIGFueSBvZiB0aGUgdXNlcnMgb2YgdGhpcyBo
ZWxwZXIgYWN0dWFsbHkgcHV0IG1lYW5pbmdmdWwKPiA+IHZhbHVlcyBpbnRvIHRoZSBpZCBwYXJh
bWV0ZXI/Cj4KPiBJbiBleGFtcGxlIGNoYW5nZXMgSSd2ZSBzZW50LCBuby4KPgo+IEluIG90aGVy
IHNpbXBsZSB1c2FnZXMgKHRob3NlIHVzaW5nIGNvbnRhaW5lcl9vZigpKSBvZiB0aGUgYXV4aWxp
YXJ5Cj4gYnVzLCBJIHRoaW5rIHRoZXJlIGFyZSBhIGZldyB0aGF0IHVzZXMgMCBhbmQgMSBmb3Ig
MiBpbnN0YW5jZXMuCj4KPiBJIGd1ZXNzIHlvdXIgcXVlc3Rpb24gaXMgImRvIHdlIHJlYWxseSBu
ZWVkIHRoaXMgcGFyYW1ldGVyIGhlcmUgPyIKPgo+IFdlIGNvdWxkIHJlbW92ZSBpdCBhbmQgc3Rp
bGwgYWRkcmVzcyA5MCUgb2YgdGhlIG9yaWdpbmFsIHRhcmdldC4KPgo+IEtlZXBpbmcgaXQgbGVh
dmVzIHRoZSBkb29yIG9wZW4gaW4gY2FzZSB0aGUgZmlndXJlIGFib3ZlIGRvZXMgbm90IGhvbGQK
PiBhbmQgaXQgaXMgcHJldHR5IGNoZWFwIHRvIGRvLiBJdCBjb3VsZCBhbHNvIGVuYWJsZSBkcml2
ZXJzIHJlcXVpcmluZyBhbgo+IElEQSB0byB1c2UgdGhlIGhlbHBlciwgcG9zc2libHkuCgpGV0lX
LCBvbmNlIHlvdSByZXNvbHZlIHRoZSBjb25mbGljdHMgaW4gZHJtLW1pc2Mgd2l0aCB0aS1zbjY1
ZHNpODYKeW91J2xsIG5lZWQgdGhlIElEIHZhbHVlLiA7LSkKClRoZXJlIHdhcyBhIGJpZy1vbCcg
ZGlzY3Vzc2lvbiBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci84YzJkZjZhOTAzZjg3
ZDQ5MzI1ODZiMjVmMWQzYmQ1NDhmZThlNmQxLjE3MjkxODA0NzAuZ2l0LmdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlCgpJIGV2ZW50dWFsbHkgcHVzaGVkIHYyIG9mIHRoZSBwYXRjaDoKCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvN2E2OGEwZTNmOTI3ZTI2ZWRjYTYwNDAwNjdmYjY1M2ViMDZlZmI3
OS4xNzMzODQwMDg5LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZQoKCi1Eb3VnCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
