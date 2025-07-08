Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A9C83F0A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIkr6hwXkpPfVQiw64NhUZCVrMFsP/JZF8VRzzJfF0o=; b=PD62lqJjdNplbJ
	KCH9KRIYtJUhDhL7BBSFVBGNDhn5KINtIizJDe6cLoetiUqyyBNWQo6zkAowJhLzKk+B9z6BKDCaL
	lQovkyvMUNvUBd41k0IyKhGzG9aJWP0ZAlIp08OMzWZL79ZwFtFNW5G++v310TKFt0GdqcHLSMd2D
	28SekWXh4+EfqofoqU3PFh+ALb7CmDr9rn8nui9P/+Q1mNPeQvxVIFYrhJcs+lDlnNq7wM5/5OmZZ
	X5vBhEUW6qZ9/cAhxexezO0ZMKOMhWImmamYjs3VKRq6mm3qeG2rmy5Z8A0czOc2szTCDhCveW9YT
	qZjHiQSwFAEI++qk6q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBmo-000000063Y6-1tna;
	Tue, 08 Jul 2025 17:07:18 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBIv-00000005zLy-1N5G;
	Tue, 08 Jul 2025 16:36:26 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b165c80cso4551747e87.2;
        Tue, 08 Jul 2025 09:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992578; x=1752597378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4I7U9ozTZ1bfuxyVJsfZXgas4qwfJlXMhYg9fodydFs=;
        b=driEVBtuBiDKGHcREoC1VV52QBzN1nCTMp3OgoLMRWnarlF6JRDV0PwOftXXh0POy8
         VtRuYQQwR5Khh0+LcvMtNNlQKn0EW0H18au+fUdZXKaHCknhDr5eGJjQebS/Zdehcd4i
         qgDv/P8MNpAopF3ZD/uPXNh7i+rf5YoTyqMMVBXM/6NhbifpcUKsN1fYNrRrpshHL2+s
         9YAPHzRsEoKlx+U1MRFRaDfAetgks3ZzQGgBbarDWVZbbb98J12822LCDDfTSmouzYzR
         3P9fk6r9INQM2fsWx8O8XkAwpQ++G9ywqpheciRkRd7QL6P2jXwunVl/nkCeZJZEA+/H
         8zxA==
X-Forwarded-Encrypted: i=1; AJvYcCUJrErp+ztr3aG3Whq6k11UPke9RipOPQ1NEQhIL+U/V17ow8I9p0L3bhQR1RYoFvzxdnve7r9twanhTollD9km@lists.infradead.org, AJvYcCX1jWpS/zmcAXX59GsW1UMPiHVDYYd1O9wdgt+jm6teMo3so1Ao+oFkbb1Qj6RhkfqSvhu27uRo22AO4Lk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVniPBeNxNdyrNWFQPC2pnfmJySHLyLP/H7cqOOs9PrwMhYsJA
	H027Kz9AiMANXEKk/tuMiuLvk+waU+aYeuLao37F3/kmlzJBlMamF6PGHSnpUpUjx8g=
X-Gm-Gg: ASbGncs/fBGuh/p2pJpdlJjZQGG5vJjDJ7ea1PRwqfhdnntpEWUDQB0GNO7v+6eiW67
	EHCeb43XggfM4DNpzLqRGiBIyID6AbNGiR3jx/cilG+O3N1Y4reS/CwDek+Yisk5QqyXMOduQr1
	qQULYb2hE2jPTRIR4cv2V/S/yRP6O8vOda8wvRsMgcgnzHkkk0VO/Bxo8ATT5Urt293WhNLMjvX
	DwsH/zuPKnehD9l+EZxNfDe0Aus2UtU0xzqmPU0U4qsRU7le99RSffIdiJY/4X7wooSwHnX5A0J
	3nTH2hJanjKLzLrqnctI82Jzdc45NnhjxsDQqBgEjPftUz4/NPhMhO/MdUEix2qR5M92Jn2eCDS
	cPt4xp638Zvs6vXY9QTcCefjGl6g/OA==
X-Google-Smtp-Source: AGHT+IG8DBa+bshn/tlRsQGHd+u2GQO+sO13ysNN3Zrtha8uyWeNptzgxVvpX8sjuDhbnMrfDEu2qw==
X-Received: by 2002:a05:6512:3b91:b0:553:65bc:4250 with SMTP id 2adb3069b0e04-557f8353252mr1163869e87.27.1751992578184;
        Tue, 08 Jul 2025 09:36:18 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ba65csm1726057e87.204.2025.07.08.09.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 09:36:17 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32f1df5703aso24980261fa.3;
        Tue, 08 Jul 2025 09:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4LwzyWom2ESZGY+dmE9nt2UvKt9iNw0nYDi5LwCQgJe15DXLAYSczyi12DiztdE9HvIxCBTHSdUmHJgU=@lists.infradead.org, AJvYcCVLY9eAmp0Y8UeyZ82oLqt014hLKeHF1o14bXZIZZfk49/UFfb5qBIFCf4HqLDI/Y1IMz03hSi/CT7J0fsmEHxM@lists.infradead.org
X-Received: by 2002:a2e:be11:0:b0:329:4bfa:9f5a with SMTP id
 38308e7fff4ca-32f39aa391dmr15595031fa.10.1751992576098; Tue, 08 Jul 2025
 09:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250707184420.275991-1-lukas.schmid@netcube.li> <20250707184420.275991-3-lukas.schmid@netcube.li>
In-Reply-To: <20250707184420.275991-3-lukas.schmid@netcube.li>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 9 Jul 2025 00:36:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
X-Gm-Features: Ac12FXwC7-T3WWNdeROV3cwvshauCK_N_9KnHuUIE5o3NNtisH1pHGwgJnYBNjo
Message-ID: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's
 required by NetCube Systems Nagami SoM
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_093625_364965_9ABA94CA 
X-CRM114-Status: GOOD (  13.02  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCA4OjM14oCvQU0gTHVrYXMgU2NobWlkIDxsdWthcy5zY2ht
aWRAbmV0Y3ViZS5saT4gd3JvdGU6Cj4KPiBBZGRlZCB0aGUgZm9sbG93aW5nIHBpbmN0cmwncyB1
c2VkIGJ5IHRoZSBOZXRDdWJlIFN5c3RlbXMgTmFnYW1pIFNvTQo+ICAgKiBpMmMyX3BpbnMKPiAg
ICogaTJjM19waW5zCj4gICAqIGkyczFfcGlucywgaTJzMV9kaW5fcGlucywgaTJzMV9kb3V0X3Bp
bnMKPiAgICogc3BpMV9waW5zCj4KPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBTY2htaWQgPGx1a2Fz
LnNjaG1pZEBuZXRjdWJlLmxpPgo+IC0tLQo+ICAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhp
LWQxcy10MTEzLmR0c2kgICAgfCAzNiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiBpbmRleCBlNDE3NWFkYjAuLjhkYzNkZWNjYiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDEx
My5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQx
MTMuZHRzaQo+IEBAIC03OCw2ICs3OCwzNiBAQCBkc2lfNGxhbmVfcGluczogZHNpLTRsYW5lLXBp
bnMgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVuY3Rpb24gPSAiZHNpIjsK
PiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
L29taXQtaWYtbm8tcmVmLwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGkyYzJfcGluczogaTJj
Mi1waW5zIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEQyMCIs
ICJQRDIxIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gImky
YzIiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIC9vbWl0LWlmLW5vLXJlZi8KPiArICAgICAgICAgICAgICAgICAgICAgICBpMmMzX3Bp
bnM6IGkyYzMtcGlucyB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0g
IlBHMTAiLCAiUEcxMSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlv
biA9ICJpMmMzIjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAvb21pdC1pZi1uby1yZWYvCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
aTJzMV9waW5zOiBpMnMxLXBpbnMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGlucyA9ICJQRzEyIiwgIlBHMTMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZnVuY3Rpb24gPSAiaTJzMSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgL29taXQtaWYtbm8tcmVmLwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGkyczFfZGluX3BpbnM6IGkyczEtZGluLXBpbnMgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGlucyA9ICJQRzE0IjsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZ1bmN0aW9uID0gImkyczFfZGluIjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9
Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAvb21pdC1pZi1uby1yZWYvCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaTJzMV9kb3V0X3BpbnM6IGkyczEtZG91dC1waW5zIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgPSAiUEcxNSI7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJpMnMxX2RvdXQiOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4gKwo+ICAgICAgICAgICAgICAgICAgICAgICAgIC9vbWl0LWlmLW5v
LXJlZi8KPiAgICAgICAgICAgICAgICAgICAgICAgICBsY2RfcmdiNjY2X3BpbnM6IGxjZC1yZ2I2
NjYtcGlucyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaW5zID0gIlBEMCIs
ICJQRDEiLCAiUEQyIiwgIlBEMyIsICJQRDQiLCAiUEQ1IiwKPiBAQCAtMTI2LDYgKzE1NiwxMiBA
QCBzcGkwX3BpbnM6IHNwaTAtcGlucyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmdW5jdGlvbiA9ICJzcGkwIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgL29taXQtaWYtbm8tcmVmLwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHNwaTFfcGluczogc3BpMS1waW5zIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBpbnMgPSAiUEQxMCIsICJQRDExIiwgIlBEMTIiLCAiUEQxMyIsICJQRDE0IiwgIlBE
MTUiOwoKQ291bGQgeW91IHNwbGl0IG91dCB0aGUgV1AgYW5kIEhPTEQgcGlucyBhcyBzZXBhcmF0
ZSBub2Rlcy4gVGhleSBhcmVuJ3QKc3RyaWN0bHkgbmVlZGVkIGZvciBTUEksIGFuZCBmb2xrcyBt
aWdodCBoYXZlIGRlc2lnbnMgdGhhdCB1c2UgdGhlIHR3bwpwaW5zIGZvciBvdGhlciBwdXJwb3Nl
cy4KCgpUaGFua3MKQ2hlbll1Cgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZnVu
Y3Rpb24gPSAic3BpMSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgL29taXQtaWYtbm8tcmVmLwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHVhcnQxX3BnNl9waW5zOiB1YXJ0MS1wZzYtcGlucyB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwaW5zID0gIlBHNiIsICJQRzciOwo+IC0tCj4gMi4zOS41Cj4KPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
