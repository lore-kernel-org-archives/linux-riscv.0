Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D92E9270E
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DumaT0bJ+q3fve20jwM+7KPCmJHBIZnOcq6MI0w8IiI=; b=mHV//gKkyF8WeC
	Do4MxKEu5C6o/WVF9a0uqnun2/I26IU3RQ6AWV/SqTx1rFC3dtAS+/RDWxACmmQoqMeni/k7+8SHx
	F3ULLVLK8iT1H2o/K0UKncLL8yYf7JvZp3d4SWCbMLns73U5ZzUIL7zynISoelHk3WuFdx2kurpD3
	DsCbglrR+RH6syZxIfCl1A9hmKArNzkh5tDi9y3RIul/QuRNG2PttnI+nLokK1yr/Mt01MwXqEyUe
	GLCD8F9V5lZ25mQHVO4dEg+NFqQ+S1/O7N1KzECc2bgeZcrdnzLYvyZA4SIlh98rrOP752kupbiG3
	8r78zuAGg8sgA/IYyEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZT6m-00000001ux1-2Mzc;
	Sat, 27 Dec 2025 12:09:20 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZT6k-00000001uwg-2A3i
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 12:09:19 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-56021f047d6so2207742e0c.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Dec 2025 04:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766837356; x=1767442156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4pmqXk0EtFz5WDIGcxPfWEZMNq3VYE7yOPBLEdClV0=;
        b=dsp/S0r03vCKqINsZlZavJ2o2Yz29MSzujtb90qkV4sRgmvmIgI7sjcgyvYzBeUoKv
         K2Pz3xrkCNDuagss1rafNjUUlspvGqhlFI0PlCGydQTmNCww1aPYcpyqxSHgNzL/1ZRv
         DxKtO48/oQitFxrrJrWsXb+36B7sasF6EzMbg4Hroe9lN1CBdOoueZTAdz3NeabnVY6E
         rgUpWMx2AwXX6wPPJGWk/QeOgHxQz/3sI16x/JCPjpZWbeSMWOguNz9aA60u/WG6gm6J
         96JY6cCJKIFL8KFlAIOt40MhvRHcyeAwIPinGHI+dwCN+pZ31akyFzTu9+ftV+PdpDKr
         0cEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837356; x=1767442156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C4pmqXk0EtFz5WDIGcxPfWEZMNq3VYE7yOPBLEdClV0=;
        b=nG+eb9O/2cKhUKLt2iig/tjYwTO5++BHsRp3XkeGwV8+Mn7a5BiG9ZSjUsv64XF85c
         4geTCe64fNBVmyYwJWoJOWXE8UwcsZknzYcuT0xXCLxlgrtP+L2kIMGb85HciPDTODh/
         45LFaAVdr8uOr2+mkB1m9lOzMhlWXbcK80sMkrM28oU1CIvy7oTHk/zCEeLQ3ozm+ZXF
         Q7/def5PvQmnAVRUpYrXtSbPCwu9kVHlLgUMBIlEULQ2PzPBFrMiuWjW2yxJYslMJCWZ
         9EUcC7aKbWSv+rjiI2YTksleO6U46t2W6fywO17BSsbYIEIekLQwHqVdS0Tt9xr7T1qI
         u2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU7NNd5SSkRfYKfmBOgakyfsTzYkAXW6J6CMlQzp9EJGS64sJxeKBlHh35L6w+f7ngVSfrB+Fpb3QLZrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzodJ/PoiimTLI61ltwWFZCkXJL138woD7Lh0OQTuF35iorut6
	TH32wowKUmGmzU51tcliJaXm/fY8rFByP0vXjdAblgwXn9v/K1fyDkgmvg3qqGZ+UWIfTNNuUhj
	0GmXdaPpDykT4cAueAwGWjFU1V2hxy+w=
X-Gm-Gg: AY/fxX7qRfeBmll58ekegDMJe9qzIe8jVu1GE0WBNt+yQ3f3eeD6feSYqrvEQfvyI1E
	ciI9/2+MGPp86l35J+ECpVqu+0MT5RrFhzUJR5rryBfBYbUHzVe4esEWJjsIHtr1g0WA8uhIjKp
	FK0O7+2x+O+7QDIYT8zubbdfCDrDZGwhji5bObPcX9s5Us114hHOGVdhCFeZ+FgsC1ndtADskQF
	SaZ4jNRSDJBEdiZf63NHCkfnZsKJQRpy2Yy0vUIq6MDolcwKuc6xKk4tp7NT0zG05QxFERFKb0n
	4SBhgsUnrhqG2kiI90qPw/jhJSmTow==
X-Google-Smtp-Source: AGHT+IHCI6g/ZcH8WxoAguomG9H+0RcxTowBWMH66U8Vn7rFb2ZaVRNRJil8fidWKQpB5C+AXc0O72bA9Zqnln8RFgU=
X-Received: by 2002:a05:6102:a52:b0:522:86ea:42c with SMTP id
 ada2fe7eead31-5eb1a67f46dmr7691666137.11.1766837356185; Sat, 27 Dec 2025
 04:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn> <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
 <20251227-gigantic-handsome-falcon-3c31bf@quoll>
In-Reply-To: <20251227-gigantic-handsome-falcon-3c31bf@quoll>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 27 Dec 2025 20:08:34 +0800
X-Gm-Features: AQt7F2qvV9yB9z9hjzYqLCqLd_KsLskJTAvwrLIAwyZAGVkNyOZ5cAZZ8zWHuds
Message-ID: <CAAT7Ki9m+MD2_EntEt=-2ZPFxbMNt6LV_kZu-aAvGZ70e_SUhw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_040918_587054_5B380B3F 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBEZWMgMjcsIDIwMjUgYXQgNzowOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyAyNSwgMjAyNSBhdCAwNTo0NTow
MFBNICswODAwLCBIYW4gR2FvIChSZXZ5KSB3cm90ZToKPiA+ID4gKyAgICAgICAgICAgIGRwdV9v
dXRfZHAxOiBlbmRwb2ludEAxIHsKPiA+ID4gKyAgICAgICAgICAgICAgcmVnID0gPDE+Owo+ID4g
PiArICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmhkbWlfaW4+Owo+ID4gPiArICAg
ICAgICAgICAgfTsKPiA+ID4gKyAgICAgICAgICB9Owo+ID4gPiArICAgICAgICB9Owo+ID4gPiAr
ICAgICAgfTsKPiA+ID4gKyAgICB9Owo+ID4gPiAtLQo+ID4gPiAyLjUyLjAKPiA+ID4KPiA+Cj4g
PiBUZXN0ZWQtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IE5BSywgbm90IHRy
dWUuIE90aGVyd2lzZSBleHBsYWluIG1lIGhvdyBjYW4geW91IHRlc3QgdGhlIGJpbmRpbmdzLgo+
Cj4KSSBjaGVycnktcGlja2VkIHRoZSBwYXRjaGVzIEkgZ2F2ZSB0byBUZXN0ZWQtYnkgb24gbXkg
dGVzdCBicmFuY2gsCmNvbXBpbGVkIGFuZCByYW4gdGhlbSBvbiBMaWNoZWUgUGkgNGEuCkFsbCB0
aGUgcmVsZXZhbnQgcGF0Y2hlcyB3ZXJlIGFsc28gZ2l2ZW4gdG8gVGVzdGVkLWJ5LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
