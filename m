Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BB5FF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdxwyTl5R+o0PXJ4GRZfkGKjfp1v1FZ0wKMAUzHH4ME=; b=ezfv0PU+VWm1TN
	y1BLnVMj9jc4OqiPigXT0cRGcKu/wzT2l4NLpCyB4+IHhMeXD0ZNzhXWrc1NJLLT/2FeyJMW01lCq
	YWqa1tFcpY82iWvKrSbrVtMOMPqQoJtgOScWS876Vzqyi86jUTbMx8QteEK0p4awLbh3QvAPz6TFx
	Y58eSJFzU72jtM9biA1iLgNJAHonxS7Q2wwZKv+VZMiUyeeVJLJedyl93RnUW4SpoPSZvXHXe0h4q
	pvh7I3PzzO6UWp4gSCx3B8sqvS0B1ArReLkpwfW+lXepd7oE2Tx/Hck0Pu0J5VSU6H0/R4u8ORo6/
	U++A6eH3BzvKPphi57ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgIi-00000001Ex0-1N5F;
	Tue, 28 Apr 2026 11:08:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHgIh-00000001Ewj-0jft
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 11:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F50360128
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 11:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06809C2BCB7
	for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777374502;
	bh=c2c7jO6hYI8b7jy0S2IChLenRdchEWJaq6E2waZawHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F+Ki5qsnRa3obRmGutl/v+YE/IaCsg06XMEhWRXxUXm5ZWBFR4FNxwTMddd5fcwzY
	 h4R9lOh47SXniKs2dnTbqT1v2c+ExzIL+sYrR6P+YkNHV8fx1rbgPxtCz0NdjBTRwE
	 /Tug9VHBN/nJqcNYsUlifxqNoNjFeRQ6IyLVicIdL/rcrAsMQdAGe0hZkvK4AcDLud
	 ZroRHccexPYzi/pO77aX/OdsGvt3zy9imwlRA7S49/mUT8js/uW6P4TZk7HE8OsID6
	 qn5MhQdT7zIYIOJbXygG1aIWYOTvNWuY4loaem4/pLJbWxRJS9PyEwwbRDGRWU2kaE
	 EfNp3J4WURi6g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so126470941fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 04:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jLGl8eFUoRkNneF1mzpfH4FctxDJUdWn7BjdRx0AOUMN6tGc1YCdvOS1VImWXoy2R5MZDuvTzbnoLGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhG6Fh7k6QDG6BO334VJRbtgwqFc08Ke1idep4l0Q2F4g3kizn
	DfbPTyQrIeQus8uvGaKJ5K/5qLNL7yrhmhiL06diV5LmOpr7PO0PEflqrD3Hj04ckdhgB5A8mX8
	7IntVPdvizcOYZzugUV/Thn3H6eclFgE=
X-Received: by 2002:a05:651c:324c:b0:38e:35fe:b79 with SMTP id
 38308e7fff4ca-39243022befmr7190031fa.2.1777374500737; Tue, 28 Apr 2026
 04:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com> <20260424111330.702272-12-changhuang.liang@starfivetech.com>
In-Reply-To: <20260424111330.702272-12-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 13:08:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
X-Gm-Features: AVHnY4IDxcIj36cpLzKrI1NZVFjYAH9TxKPvCzuHnuFYmrkebhBtVhuQTXFLwpQ
Message-ID: <CAD++jLk_AQjjCLkeuiyBtiQUsmzHEfqpigttJ7E9n1UE8h29Hg@mail.gmail.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
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

SGkgQ2hhbmdodWFuZywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgQXByIDI0LCAy
MDI2IGF0IDE6MTTigK9QTSBDaGFuZ2h1YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJm
aXZldGVjaC5jb20+IHdyb3RlOgoKPiBBZGQgcGluY3RybCBiaW5kaW5ncyBmb3IgU3RhckZpdmUg
SkhCMTAwIFNvQyBQZXJpcGhlcmFsLTEocGVyMSkgcGluY3RybAo+IGNvbnRyb2xsZXIuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+CiguLi4pCgo+ICsgIFRoaXMgZG9tYWluIGNvbnRhaW5zIDQgSU8gZ3JvdXBzIHdo
aWNoIHN1cHBvcnQgdm9sdGFnZSBsZXZlbHMgMS44ViBhbmQgMy4zVgo+ICsgIGdwaW9lLXNwaSAt
IGNvbXByaXNlcyBQQURfR1BJT19DMCB0aHJvdWdoIFBBRF9HUElPX0M0Lgo+ICsgIGdwaW9lLXFz
cGkwIC0gY29tcHJpc2VzIFBBRF9HUElPX0M1IHRocm91Z2ggUEFEX0dQSU9fQzExLgo+ICsgIGdw
aW9lLXFzcGkxIC0gY29tcHJpc2VzIFBBRF9HUElPX0MxMiB0aHJvdWdoIFBBRF9HUElPX0MxOS4K
PiArICBncGlvZS1xc3BpMiAtIGNvbXByaXNlcyBQQURfR1BJT19DMjAgdGhyb3VnaCBQQURfR1BJ
T19DMjcuCj4gKwo+ICsgIEVhY2ggb2YgdGhlIGFib3ZlIElPIGdyb3VwcyBtdXN0IGJlIGNvbmZp
Z3VyZWQgd2l0aCBhIHZvbHRhZ2Ugc2V0dGluZyB0aGF0IG1hdGNoZXMgdGhlIGV4dGVybmFsCj4g
KyAgdm9sdGFnZSBsZXZlbCBwcm92aWRlZCB0byB0aGUgSU8gZ3JvdXAuCgpTbyB5b3VyIGhhcmR3
YXJlIGhhcyBncm91cHMgYW5kIHN1cHBvcnQgc29tZSBwcm9wZXJ0aWVzIG9uIHRoZSBncm91cCBs
ZXZlbC4KClNvIGV4cG9zZSB0aGVzZSBncm91cHMgYW5kIG1ha2UgdGhlc2UgcHJvcGVydGllcyBj
b25maWd1cmFibGUgcGVyIGdyb3VwCmluc3RlYWQgb2YgaW52ZW50aW5nIHBlci1ncm91cCBwcm9w
ZXJ0aWVzLgoKPiArICBncGlvZS1zcGktdnJlZjoKPiArICBncGlvZS1xc3BpMC12cmVmOgo+ICsg
IGdwaW9lLXFzcGkxLXZyZWY6Cj4gKyAgZ3Bpb2UtcXNwaTItdnJlZjoKCkNyZWF0ZSBwcm9wZXIg
Z3JvdXBzIGluIHRoZSBwaW4gY29udHJvbGxlciB0aGVuIHVzZSB0aGUKc3RhbmRhcmQgcGluY2Zn
IHByb3BlcnR5IHBvd2VyLXNvdXJjZSA9IDwuLi4+OyBmb3IgdGhpcy4KCkV4YW1wbGUgZm9yIGEg
c2ltcGxlIGRlZmF1bHQgaG9nOgoKcGluY3RybCB7CiAgICAvKiBIb2cgdGhlIFFTUEkgcGlucyAq
LwogICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKICAgIHBpbmN0cmwtMCA9IDwmcXNwaV9k
ZWZhdWx0PjsKCiAgICBxc3BpX2RlZmF1bHQ6IHBpbmN0cmwtcXNwaSB7CiAgICAgICAgY29uZmln
IHsKICAgICAgICAgICAgZ3JvdXBzID0gImdwaW9lLXFzcGktcGlucyI7CiAgICAgICAgICAgIHBv
d2VyLXNvdXJjZSA9IDwyPjsKICAgICAgICB9OwogICAgfTsKfTsKClRoZSBncm91cHMgY2FuIGJl
IG9ydGhvZ29uYWwgdG8gb3RoZXIgcGluIGhhbmRsaW5nLCB0aGF0J3MKZmluZS4gSW1wbGVtZW50
IC5waW5fY29uZmlnX2dyb3VwX3NldCBpbiBzdHJ1Y3QgcGluY29uZl9vcHMuCgo+ICsgICAgICAg
ICAgc3RhcmZpdmUsZGVib3VuY2Utd2lkdGg6Cj4gKyAgICAgICAgICBzdGFyZml2ZSxkcml2ZS1p
MmMtZmFzdC1tb2RlOgo+ICsgICAgICAgICAgc3RhcmZpdmUsZHJpdmUtaTJjLWZhc3QtbW9kZS1w
bHVzOgo+ICsgICAgICAgICAgc3RhcmZpdmUsaTJjLW9wZW4tZHJhaW4tcHVsbC11cC1vaG06CgpJ
IGFscmVhZHkgYWRyZXNzZWQgdGhlc2UgaW4gb3RoZXIgcmV2aWV3IGNvbW1lbnRzLiBHZXQgcmlk
IG9mCnRoZW0gaW4gZmF2b3Igb2Ygc3RhbmRhcmQgcGluY29uZmlnIGJpbmRpbmdzLgoKWW91cnMs
CkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
