Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46134C55ABA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00dnqXmQ5/bgoI5K45NkeWfmfNOFD0nsF+V+5rImBys=; b=2eo+GCJAqGn5N2
	sYmOcHLnWAP0iU2HJhvN2LSH5kBB9KdEjSal8+RV9y6B6C8H1qSRg7k2CYPWeoOZi53DPEQUsa+0w
	Yuv5+FQQ6hICq1Pqz374DOw7LOoa8c8oolJ2HG3PEp5qhpLBGfCSydZOwiE7Gpnt2VT4ViTe5esf/
	Nvt35/O53sTRDOZzKMMrlUMUvJwXFgtDqkEhxqBvqnQvsLdR+5b072xkgkf4UPtv0jU3i5CoEtZHa
	XqxT2ki28uigbnifBAqcVX6bV7O2ty2+NAKOg0MtE2HOeT1xQvEXZPRALaCekS/3kKvuB0w5MNjmG
	9iBVpcZhdWRlXvjeaSXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLnB-00000002lyl-32oF;
	Tue, 04 Aug 2026 20:31:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLn9-00000002lyM-3V9O
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 20:31:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58DAE600FF
	for <linux-riscv@lists.infradead.org>; Tue,  4 Aug 2026 20:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BEE1F00AC4
	for <linux-riscv@lists.infradead.org>; Tue,  4 Aug 2026 20:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785875473;
	bh=hQ/IF9zsRp6EfE4UNaPgSz8EQXYUIanVlGiQJgbb6as=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jdb5XWaTxkq+n6O53rvIAk3SysegMg1HmXJeeSTmoOmmG+x6wcMVbEpwCCvy0f3iG
	 cf5ZVHDJV+yM+UT5/XUOi5ROLw+pJlj6FS4pMpv/e0pMZOJdhh663bNVf6pSyeVQNJ
	 t4IHmveN0te3rwW8o1h97uK8SaWJOXyrvRWYWVPWipJBlu6S6q42vYrPrkZIgY8JH7
	 X2tYAd7TmK5eRbqeEhJBnsCH3Wh7sC89Fs0U7GG2vv/UfXSYFziwD5fIoDKZv8m35i
	 l23zB59keWG4A/xhAn5os0DKKvDukEtcneCEKJ5oasGR7yUc3s2qyan4NA8xrYp/ED
	 ZhNGOCmQ/hcog==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b2aab18795so349016e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 13:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RowlCmPkg5J+ZrIB6UbuayBLLnipUN3NO2/Zn/fOsz9bf/P24jUSIGiXyT7mldowJPbDv1+ZfqZHSwSjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrfbW3Dv++lrZCL6PuBGYkrVjfay63xfV8H8ve+lP+dIs9ZHvX
	INiYMSE4OZBivGPRNWxiTmFChfe0aoZzGrUjIQdbmXW7uVCVGG3EEgPHquU2yK4IVgEhaJKRgm0
	MAYLZy2bf0+jMrk6syYwX0EFA8pfxx1c=
X-Received: by 2002:a05:6512:2342:b0:5b0:1760:fabe with SMTP id
 2adb3069b0e04-5b2f4b8bfe8mr161410e87.15.1785875471838; Tue, 04 Aug 2026
 13:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com> <20260801072711.153217-5-changhuang.liang@starfivetech.com>
In-Reply-To: <20260801072711.153217-5-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 4 Aug 2026 22:30:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbuS-Tx82AZzwJZ=ANVwi3XVtYL3J4VYaE3yEZBumZ0Q@mail.gmail.com>
X-Gm-Features: AUfX_mxydusxf8VE7_hAS02smaZytShMdtSQeu6nrNbjybQ0dqWTUpDubwEFwtM
Message-ID: <CAD++jLmbuS-Tx82AZzwJZ=ANVwi3XVtYL3J4VYaE3yEZBumZ0Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
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

SGkgQ2hhbmdodWFuZywKCk9uIFNhdCwgQXVnIDEsIDIwMjYgYXQgOToyN+KAr0FNIENoYW5naHVh
bmcgTGlhbmcKPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cgo+IEFk
ZCBwaW5jdHJsIGRyaXZlciBmb3IgU3RhckZpdmUgSkhCMTAwIFNvQyBTeXN0ZW0tMChzeXMwKSBw
aW5jdHJsCj4gY29udHJvbGxlci4KPgo+IFNpbXVsdGFuZW91c2x5IGFkZCBhIGdlbmVyaWMgcGlu
Y3RybCBkcml2ZXIgZnJhbWV3b3JrIGZvciByZWdpc3RlcmluZwo+IHRoZSBwaW5jdHJsIG9mIG90
aGVyIGRvbWFpbnMgKHN5czEsIHN5czIsIGFuZCBzbyBvbikgaW4gdGhlIEpIQjEwMCBTb0MuCj4K
PiBDby1kZXZlbG9wZWQtYnk6IExpYW5mZW5nIE91eWFuZyA8bGlhbmZlbmcub3V5YW5nQHN0YXJm
aXZldGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGlhbmZlbmcgT3V5YW5nIDxsaWFuZmVuZy5v
dXlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNvbyA8eXVrbGlu
LnNvb0BzdGFyZml2ZXRlY2guY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcg
PGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KCldpdGggVXdlJ3MgYW5kIFBoaWxp
cHAncyBjb21tZW50cyBhZGRyZXNzZWQgdGhpcyBsb29rcyB2ZXJ5IG5pY2UuCkkgcmVhbGx5IGxp
a2UgaG93IHlvdSB1c2UgYWxsIGhlbHBlciBsaWJyYXJpZXMgaW4gdGhpcyBkcml2ZXIhCgpPbmNl
IERUIGJpbmRpbmdzIGFuZCBjb21tZW50cyBhcmUgYWNjZXB0ZWQsIHRoaXMgY2FuIGJlIG1lcmdl
ZC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
