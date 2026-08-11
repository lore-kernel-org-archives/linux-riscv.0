Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85D7C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXiIWprZAD5uhDGPW7fdIGOwfVB+sIaN1nR88J7HIP8=; b=1ZQ/54owsaiaRN
	SbKpnq83tzP4ep98xlcmAKg0Lhwmb9Hwx9i0gSl112qIWetDyTIW+FZwaRgrVc8gKaZXedtD4qbm7
	Z8S9cqm++QDt/fqmYqQlJ1Iy0taPFuN9VbWzQC919y1+PI5pkonk1/CN3QB6r+2vZjy1twZm8Hptk
	ipREw7B03/pSfveXTvoOjVtb4D9/ZyjJ+bKifqBf/tiaTY3Jhr3rtHv9bcp4wUam+GU9uZQi6Nh8K
	/wlC5JMjbU9A6bwXQ/wh/qaXdn16XU54o7AySWXpqRp1UAVCmdGQdoS/jSzLNKOy14P5DPDZaDrph
	7ONWYNFy3hqvT3Fnxuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfkv-0000000DOqa-3aD6;
	Tue, 11 Aug 2026 06:14:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfku-0000000DOqJ-3FiX
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:14:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E497B600AA
	for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 06:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC0A1F00A3D
	for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 06:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786428871;
	bh=+wNOqVDGEN5i8weJznBIp+8lqP1f4HnqpPBBjIKEJrc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Kh+d8lyjifRDpe1x2Pdx3lwtO+AF7HtDv7wBtHe3PAkWOhbWBiaAEkbjldzrRhA/f
	 YD/LV+8H5uY0RI13e4B4vWwLY0FSwgMNLQRaA77hlqculBL/pxU2arJlrHIPUfIRaE
	 /ngqogip4CpdTrVc4LDSqqE9Fbrxmw9T0TRsyWXvP4N/Zu7dFlrqhHFKjdVRn5ogYl
	 veQKsY4o1UIFgCvwmeRXMVOtmFt0Iv2npsQ2RfvRkiLcvhObIqs/J4CqgKwpS0WCzh
	 yim8IqHpXO7wu8b47sp3jochDrExMj63SIVobJ/dOln4y9+2YEZKdIbOm5BCG1DJ/w
	 5NyHEc9/SAPAQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b00d083818so563446e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 23:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RruiZpANOADRSmR19L8hepnmRBXTgjCy1+VHPNW6A1GFJgjFB31xxZsgn1e4AZFjgV0Wc3UdfreMiGH0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp77+7fLornhXE1Qwbwf2+thP5kufv+SyykZT6O9PiX2kcTxQa
	neWqlrllaBo2eftCxx3s6KDsggjutfdGELV/4jVCEYwBhlnA8ZP4Gv/+Fnf+sN36u1+Ubt82WOV
	iNGlA713azUMyNB8zhdALCBYg3o/BgFE=
X-Received: by 2002:a05:6512:1383:b0:5b0:1e26:7751 with SMTP id
 2adb3069b0e04-5b44881c2bcmr127826e87.8.1786428870446; Mon, 10 Aug 2026
 23:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:14:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHYsx3FNcdiPdL_9UcEUGDGs2u8RwfTjotm7f+xiwnvQ@mail.gmail.com>
X-Gm-Features: AUfX_mzgGug6-5qsnEpmIEwyeblG76ijsb9r5KbO018SdfVmGfJDslC9BjekBp0
Message-ID: <CAD++jLkHYsx3FNcdiPdL_9UcEUGDGs2u8RwfTjotm7f+xiwnvQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Add basic pinctrl drivers for JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

SGkgQ2hhbmdodWFuZywKCk9uIE1vbiwgQXVnIDEwLCAyMDI2IGF0IDg6MzfigK9BTSBDaGFuZ2h1
YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgoKPiBU
aGUgSkhCMTAwIFNvQyBoYXMgMTMgcGluY3RybCBkb21haW5zIC0gc3lzMCwgc3lzMGgsIHN5czEs
IHN5czIsIHBlcjAsIHBlcjEsCj4gcGVyMiwgcGVyMnBvaywgcGVyMywgYWRjMCwgYWRjMSwgZW1t
YywgYW5kIHZnYS4KPgo+IEluIHRoZSBjdXJyZW50IHNlcmllcywgd2Ugd2lsbCBvbmx5IGFkZCB0
aGUgZm9sbG93aW5nIHBpbmN0cmw6Cj4gIC0gc3lzMCwgc3lzMGgsIHN5czEsIHN5czIKPiAgLSBw
ZXIwLCBwZXIxLCBwZXIyLCBwZXIycG9rLCBwZXIzCj4KPiBUaGUgcmVtYWluaW5nIHBpbmN0cmwg
d2lsbCBiZSBpbXBsZW1lbnRlZCBpbiBmdXR1cmUgc2VyaWVzLgoKVGhlc2UgZHJpdmVycyBsb29r
IGdvb2QsIGFzIHNvb24gYXMgdGhlIERUIGJpbmRpbmdzIGFyZSByZXZpZXdlZCBJIGNhbgpwcm9i
YWJseSBtZXJnZSB0aGUgc2VyaWVzLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
