Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F20BC7115B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBLVkADZ4oVwQ1sel2wXRdHHt6JfCJ6Q9HnjiVTnVzU=; b=MBnTyp0ZVZdZ8l
	HNahTRh5hUfRQdjTxKt/ShMLJkg40COABy4BoRaIDqJZaHX8AFq34LJLN45vpcsJXO4Jbnqjl+v0v
	i2lA/H8COSQQGZhV2sg5ULV2hs+Krgm5OtfRT4L+CM/koakrQtkugK5Ywlu2FHI8tcPD/KeCpQ2q9
	nyaqBoQbalskcYdYZeBsr4k/Fms8q71BtLvrREJzwXAlYV0Vd/qe5s9YCXl50p54HmXL1M2wxGqEh
	V8NENSqE3idbud1UInVN++kQGmh0YKB3FQxCUatu5kN4mtCJorqj1+2V84rTCbcplXelUIgYFc4Me
	KmVVKWcVBlofgPwA4f/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK9O-00000005t9Z-32v6;
	Tue, 17 Jun 2025 00:26:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJxk-00000005rxG-3SHC
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 00:14:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747fc7506d4so4282482b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119243; x=1750724043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=EPIa2oTyGwKGjQdw/ugysVyPW5g5xRLBlNnrnSzdhQ2anV4B2SuPO11hSEv2AvwYjJ
         nxT8OrOhWrDIVNgrg84pJs8NS+NSjWYqOx7B5ciqUieJbM64xU71Mkd1MuG/gM9Cwkzi
         3M5oZF1YUpKcpaZ5i65OmE1EwHKY3Y47fC0Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119243; x=1750724043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=ZUmbAnlOQpRAwEgECPba1JRQXr01iEhT5x8xn9pdhI0qag9XDZ8+YCJSUjALkvhfAf
         qfl3SiyjrxR5pwr/JlUd/EQ68LMGU446ew9FCfIst67LhWxb9Okce9BmeiGo5SdQq1Y+
         UcwI3cXom8npNHu5AphPRdPeUinwwM6TlB4DSARNclQWjyPA7G5Lu5XVs6LDhbyWicHy
         GlvMMO9cZQbxIXpQUpnv/ER1ghD88agkt35ujdUWpMcox45rVCBKUUg9G3GbeC4UTJ0T
         9Iw9h1ZQXLGKI1kdHHXvQ9hyVnzmi9o53XRCoSWUUMRhNw5TtFGA6Nn+pOhSd0asq6hz
         F9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX9TcwDEuSSYc7iJNDbz4b8AnrEvQY+xeKD4jqpQeBxDARJSpJYeO+XSj9q76/RualVg0WthYKeA1lBVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQsG2ndkckFraorR7sAiqZOJnq0XNH7+FhP2iKaP91F4Mx6c84
	/L+pWIAOZVRcXa7wqC8/SyL35A853qXHsoVQTpcXJc6J02Fk/6+RMI4HX+yVvzOfHR/wphVByG9
	Y7ig=
X-Gm-Gg: ASbGncsvwtLJpTxUDWJfp1oeJXwHy5nO9LSFbwQ07fvYM291sdT6GkTQyrFr4NPikKs
	iIdcihq4+lF6C3bhhCM1jUN9i5I6XVKv1EmRsh+zn8xiukaenax7yYbYZBPd9WpPpJw+PyhkKL1
	3X8OKuanwElu0zW4rKVylxpd834XWu1X2BaQKalGCTvved/RNoDDKEy+VnQiOPsoSVcDxQevI3D
	sftojQv+cXdg+vJHUrygnxfRICmohF77ukX9jgCgYXatqMOWr4FkJS++344jrQNKs84xGuldecw
	wvJkQZvCXWWKd5eqIJv6X7gfYVVxiHN829M8ftUNdzcfrhUz3FslHOX1GwkO1X0OErn2ZQr6Bxb
	AXr/0kipf0Oobmj6oLWy9rMwWng==
X-Google-Smtp-Source: AGHT+IEsTPAQVluxOvLKYkJ/IVZ1eJaPaRpyAKPJkgN9ABsyAHBh6nqjJ6ZANHwGSX0HwbTvJRHhHQ==
X-Received: by 2002:a05:6a00:2381:b0:742:a0c8:b5cd with SMTP id d2e1a72fcca58-7489d039b81mr15507578b3a.19.1750119243131;
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000531esm7479340b3a.41.2025.06.16.17.14.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso4033588a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU/E0vmKGgRIj4eOMDczuv2mm8m9EElRjuONKgUWKu/M8w77xVw3CW9HTK6NiUueKPid31joVztc1wwQ==@lists.infradead.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250616_171404_894657_0984BC59 
X-CRM114-Status: GOOD (  27.16  )
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

SGksCgpPbiBNb24sIEp1biA5LCAyMDI1IGF0IDg6NDPigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBNb24sIEp1biA5LCAyMDI1
IGF0IDY6MDLigK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gVHVlIDI1IEZlYiAyMDI1IGF0IDA4OjA0LCBEb3VnIEFuZGVyc29uIDxkaWFu
ZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gSGksCj4gPiA+Cj4gPiA+IE9uIFR1
ZSwgRmViIDE4LCAyMDI1IGF0IDExOjMw4oCvQU0gSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXls
aWJyZS5jb20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IFRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0
aW9uIG9mIHRoaXMgZHJpdmVyIGlzIHNpbXBsZSBlbm91Z2ggdG8KPiA+ID4+IHVzZSB0aGUgYXZh
aWxhYmxlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyLgo+ID4gPj4KPiA+ID4+IFVz
ZSBpdCBhbmQgcmVtb3ZlIHNvbWUgYm9pbGVycGxhdGUgY29kZS4KPiA+ID4+Cj4gPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPiA+ID4+IC0t
LQo+ID4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCA0OSArKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBSZXZpZXdlZC1ieTog
RG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gPgo+ID4gPiBJJ2xs
IHNub296ZSB0aGlzIGZvciBhIGJ1bmNoIG9mIHdlZWtzIGFuZCBjaGVjayBiYWNrIHRvIHNlZSBp
ZiB0aGlzCj4gPiA+IGNhbiBiZSBsYW5kZWQgaW4gZHJtLW1pc2MtbmV4dCBldmVyeSBvbmNlIGlu
IGEgd2hpbGUuIElmIHlvdSBub3RpY2UKPiA+ID4gdGhhdCBkcm0tbWlzYy1uZXh0IGhhcyB0aGUg
bmVjZXNzYXJ5IHBhdGNoZXMgYmVmb3JlIEkgZG8gdGhlbiBmZWVsCj4gPiA+IGZyZWUgdG8gcG9r
ZSBtZSBhbmQgSSdsbCBjb21taXQgaXQuCj4gPgo+ID4gSGkgRG91ZywKPiA+Cj4gPiBGWUksIHRo
aXMgaXMgc2FmZSB0byB0YWtlIHdpdGggdjYuMTYtcmMxLgo+ID4gUGxlYXNlIGxldCBrbm93IGlu
IGNhc2UgeW91IHByZWZlciBhIHJlc2VuZC4KPgo+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLiBV
bmZvcnR1bmF0ZWx5LCBJIHN0aWxsIG5lZWQgdG8gd2FpdC4gVGhpcwo+IHBhdGNoIHdpbGwgbmVl
ZCB0byBsYW5kIHRocm91Z2ggZHJtLW1pc2MtbmV4dCBhbmQgdGhhdCBkb2Vzbid0IGhhdmUKPiB2
Ni4xNi1yYzEgeWV0Lgo+Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1p
c2MvCj4KPiAuLi5wcmVzdW1hYmx5IHY2LjE2LXJjMSB3aWxsIGdldCBtZXJnZWQgaW4gYmVmb3Jl
IHRvbyBtdWNoIGxvbmdlci4KPiBJJ2xsIHRyeSB0byBrZWVwIGFuIGV5ZSBvbiBpdC4KClB1c2hl
ZCB0byBkcm0tbWlzYy1uZXh0OgoKWzMvOF0gZHJtL2JyaWRnZTogdGktc242NWRzaTg2OiB1c2Ug
dGhlIGF1eGlsaWFyeSBkZXZpY2UKICAgICAgY29tbWl0OiA2NTI2YjAyZTEwMjA5NjA4NDY0ZjI2
NDVhZjU5YjJjYzk1NWI1YTE5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
