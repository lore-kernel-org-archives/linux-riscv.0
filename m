Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A6C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 16:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a24cuihry3IC1tOfHhR0lvtu/i5fzBLb+sqF3jcj4nQ=; b=gCkZ/Rt99GaD2r
	NHEY3lpUwXgIakHSS6zFvq6xf/4n31Um1DSLhTcOCk9wQ5NYEmBCE9E/YH5mCTEuo8IPZlHFOU1SN
	MamkMMGuEjiK7Q8hatLmtkwoTwNrZxddFRLRTbCiUilVdybGVDW+EQt9S7tQkapkRiPnQVva3Wn9y
	TgluTzNqf+6reoYJu48qMc06xn1azxJk3IeRExWj3d7/Hvu3z+yQOP6l11CVueGS4mbZQ/TMUQ0Tx
	UwXL1kB4Fh/KGmDM+xVH/d+DBkeiexU6EiCb/cTZmvFWEcWlCmCVGzoyDyMR15Zt5wCuVNeAo6kb1
	DD9HDIpPn0WRFm/LTb6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfE4-00000004dz5-2SIw;
	Mon, 09 Jun 2025 16:19:56 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOees-00000004YY3-1F5E
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 15:43:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so802532a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749483808; x=1750088608; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=Mqb5fp6OH2eTURogfEvIoNrQfQQ19dMLrT9JQ1jRf7hLcI6g3+h5qlVuxf49229xxU
         O1HaynXxLIJmBlaFnjFENc1rBlkGL516e3HlxPqF/lvaAJFZwedGTjgZ7j9QUu+T5BlE
         N33Yekk8twlry2nAj2bBHzskQHCSgB6Te05Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483808; x=1750088608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=KZsX5OmvMgnJZl3fRmHL9n5ySeE51rDXkcxNwnbmWskc/UZueJmZiVQbp4lJgqjsrA
         A2Gdo6XSO+64QDNkHPbibu4EQ5acst0obP2JFmeFlJ5Fx1iuXWJzOZKr1nYnK9CCbfpm
         HC66VBKYJ18xXAZVaBS/9MIbXo4GtB7zHzfo4F042tBFhhNgUROX5PdWJK4vOWeN9Lh1
         lCvCJnteRjVhf9tMG66v4LJ1r2fb6a+2sM22TwDYSvA0bUiF3gRhLXeZuaYuuwlRE5wN
         TgxU6U15s0vJXoXJok9WIoqbegbT7zhmZr5NlUdEyv6DV0oYO6KsB11oqK2YgwOqkfCf
         pNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJkryeU6vjO0kdoZMYqh/DOVl8W/IVVHfh4VLez3kX4VXEB9M35BKVCsA7N8LUjAGDAAmeu7GAHYEDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwINIDCPhzpVLDPWbTN6jQ0/+SUDuU5IQxr/nGES8ZkvlPyKcM0
	G1hCkGQ7vbfx5XVKmD3M25tHCluECWohDrN7WPrKkBjDr6s94KaANpM/4nM5xlUHHvTFoCkul3s
	8pEo=
X-Gm-Gg: ASbGncuNp0ZMu78w4hMDS+7/ZV+RtFgnjZFUoLpPVVwJvP0cicByaqM8SFNn8dP4mg/
	ASrtfm2o41aCJMEGWrdrHCOZJ8j3TunxwsZ1P+xbMyupvmLJlc4PeUTa5u/LMP72LZbxl+Omkxl
	1R/LeDtRtgz/OizuNjhUWAl5cN7dANz7y1LDqVZEnWxa/QXDXtxTMlo0DsWRrp2ea7pMjiVKKKx
	yn65cnZAvr0QL2p/JbdQWFtvfUU4Jx0iq9LnvEDx+ncuFY91PKny+2pYgY2NXXf2g/55HPkWg+Q
	OB5n72ZAEESVUfUHJzQ39g0Od/gUK6hjKZmqOnCcsnHgoQIHjMYspjgEHEcHBkC2fdeR8ygmGY/
	z+OxLBb5CEAwiMG0=
X-Google-Smtp-Source: AGHT+IE8Mjea7j16xPdHtRO9HfrI9oLZR3Iw1BoVq9tHACuBKpegAXlg101f0V7wyge2dv+sHUorBg==
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id 98e67ed59e1d1-313472d3204mr17932834a91.1.1749483807963;
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ffc1ebsm5879095a91.49.2025.06.09.08.43.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso3450813a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXkuQ/8mpUV/nbZSKCFTUmSj2J1ZZ5A++p2THzNr6SqDpQ2L1ONtQQHnwloQCn1g+gjAN+UQ2TZWmCNqA==@lists.infradead.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
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
X-CRM114-CacheID: sfid-20250609_084334_363401_ADEC90F2 
X-CRM114-Status: GOOD (  23.69  )
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

SGksCgpPbiBNb24sIEp1biA5LCAyMDI1IGF0IDY6MDLigK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1
bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUgMjUgRmViIDIwMjUgYXQgMDg6MDQs
IERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiA+IEhpLAo+
ID4KPiA+IE9uIFR1ZSwgRmViIDE4LCAyMDI1IGF0IDExOjMw4oCvQU0gSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIGF1eGlsaWFyeSBkZXZp
Y2UgY3JlYXRpb24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCB0bwo+ID4+IHVzZSB0
aGUgYXZhaWxhYmxlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+ID4+Cj4gPj4g
VXNlIGl0IGFuZCByZW1vdmUgc29tZSBib2lsZXJwbGF0ZSBjb2RlLgo+ID4+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gPj4gLS0tCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0OSArKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA0MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRl
cnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4KPiA+IEknbGwgc25vb3plIHRoaXMgZm9y
IGEgYnVuY2ggb2Ygd2Vla3MgYW5kIGNoZWNrIGJhY2sgdG8gc2VlIGlmIHRoaXMKPiA+IGNhbiBi
ZSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCBldmVyeSBvbmNlIGluIGEgd2hpbGUuIElmIHlvdSBu
b3RpY2UKPiA+IHRoYXQgZHJtLW1pc2MtbmV4dCBoYXMgdGhlIG5lY2Vzc2FyeSBwYXRjaGVzIGJl
Zm9yZSBJIGRvIHRoZW4gZmVlbAo+ID4gZnJlZSB0byBwb2tlIG1lIGFuZCBJJ2xsIGNvbW1pdCBp
dC4KPgo+IEhpIERvdWcsCj4KPiBGWUksIHRoaXMgaXMgc2FmZSB0byB0YWtlIHdpdGggdjYuMTYt
cmMxLgo+IFBsZWFzZSBsZXQga25vdyBpbiBjYXNlIHlvdSBwcmVmZXIgYSByZXNlbmQuCgpUaGFu
a3MgZm9yIHRoZSByZW1pbmRlci4gVW5mb3J0dW5hdGVseSwgSSBzdGlsbCBuZWVkIHRvIHdhaXQu
IFRoaXMKcGF0Y2ggd2lsbCBuZWVkIHRvIGxhbmQgdGhyb3VnaCBkcm0tbWlzYy1uZXh0IGFuZCB0
aGF0IGRvZXNuJ3QgaGF2ZQp2Ni4xNi1yYzEgeWV0LgoKaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9w
Lm9yZy9kcm0vZHJtLW1pc2MvCgouLi5wcmVzdW1hYmx5IHY2LjE2LXJjMSB3aWxsIGdldCBtZXJn
ZWQgaW4gYmVmb3JlIHRvbyBtdWNoIGxvbmdlci4KSSdsbCB0cnkgdG8ga2VlcCBhbiBleWUgb24g
aXQuCgotRG91ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
