Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DB6C021BC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4jJFydemIO8UGgwq9qGyfPsosQG2YcTkSh7/otkwwU=; b=Q/c3JUkTAly98H
	B5sKS08LMUzh3jHeXCoUgCJvWpfkj4WhbR0qMT7GkNVtJvalCnnNesRm7UaD4ilvL5DD9z3jZh5qp
	v9D4dndDceclfvBnQpJouM9KvLRYsV6kBM6Oo/n0IHlq4CQIZD7gFUO3xciLxh336VvshMUY55qr2
	Hx96GwTUa6LnezgchRrn7M3c+qyGvImqAjGXrtFzlGsW3nAinHKKbI0VEx07AbOvfBBUlBZUcoBgK
	c7i0n3ZF+A79PeSet465diURSclS2pNA2sEeSw0iTlll1nNt0PguFrYQmIP84JA84MEPNBUcn76n9
	8bKemv/FNMEL1eCGUNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEmE-00000003Jx7-24Gl;
	Wed, 26 Feb 2025 10:36:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEan-00000003HYI-0WKv
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 10:24:42 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so934228e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740565479; x=1741170279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVtrqvkPNmYmY0oGPxOkrh36jDkhWLE+ptRBX0xtIwg=;
        b=MgEdWxsSpuF01fVG/1x0YHmoLJ1spjCLQ5EUjGh4Oi54yXxAxbUKMS2yTOQCq9RQek
         pSgbByOy6sQoyHaZ0Uv1LD7e9tUgW7S6l2LsLgYsFNMsTnxvW3EQVo5ziwI5EycDbsSE
         2wq08f7CH4i1Hpw2CrCIg0HXw88uqKG4FnxEKqSRw8WUL4qdDtYqrhIW+5R3BixSc1bD
         +RVgG7v8F2ZQZHB4tfg/nTvffjRF5kSrD9NSeP5jSZHIixH9fT0OuSF8Bn+ETB/QIO9I
         gfWUAKU70tS7KuuY/hkF0V5CXVDChriC0HRPH+6F6TMhkn3lzwlcpxfoakTc7s7hNVO3
         mU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565479; x=1741170279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVtrqvkPNmYmY0oGPxOkrh36jDkhWLE+ptRBX0xtIwg=;
        b=KOg4sCor3v5p0XRB9d7eVRj9UW6clVH4jc+6K3GW37QD3aN9bWPE/a4gmO0N3RYovP
         7BtOaI4HO3OT0ofBeNI5sEbo73HhAl0/hqLmztj3lxySwEf3N+KB/55cVXnqCu1PeEOy
         X/2V8+9JzEZvp2MWk8p/QxmOJPVFHMYXmMknvYfNmqwZhntFY/A4CVSGnzWM3MJZSNAw
         fBqJ8J7PrMeiV/6jvtbUDMpgl4K/qmKuzsitGOqmhICk75wh8iA+NOzQVxGm/fmPwJfl
         hDeoGKcFFx6ilefvmKfo7MlGJzfebQX9GuK3sTrwpTg2sIa+W9jfysQLHjd76ID8zX4K
         1KrA==
X-Forwarded-Encrypted: i=1; AJvYcCXwPfHmd6Z7Wgax6qFW08mSUSwGiEBNXNj6erwXxNBKeGgFQReGqQmHJVxuUVwjVyX/K1xVxxa5QCQ/ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOSVRiD5iDK8gs5MXe+RdGxo05TBojALcG1esF+oinsqMlSfZK
	JwlKoGYQ4R4/vX5rNmYacgvKZxA/fwP8SnfVbT/CHaG6IuvUTolKmqXUtpCCVI3DMaKPu9WkO4M
	4NGp8tdPKwkIep8v4zkk8ms8ZejHOFG1VfeGoYQ==
X-Gm-Gg: ASbGncvtiE/njamPSlvVIOMaQ06xHoMsYMfz5N3JdT67BxQGM6vrdFKqTaJSoSZLqmf
	tDeH5I02e1/ba+oSHnT3Vd+G23zuBSmEjcRfGST/5Cb93khIcIgvIZOHAXDYDq980in6o0apmk6
	hPnvl2Hk4=
X-Google-Smtp-Source: AGHT+IG7rCTedQa3N//tlOn/Z+rwnS1xGhASGu57SObkcmSjqd8E+pQMLoYev9jUwKtQyOyzKJ6ryDKvddvmmgwJH44=
X-Received: by 2002:a05:6512:2211:b0:545:aa5:d451 with SMTP id
 2adb3069b0e04-5493c5837d3mr1960628e87.25.1740565478561; Wed, 26 Feb 2025
 02:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org> <20250226010108-GYA44567@gentoo>
In-Reply-To: <20250226010108-GYA44567@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Feb 2025 11:24:27 +0100
X-Gm-Features: AQ5f1JpPbkJVEZf5u-mwEpqGT95jx-dhaIMZLx12Jfkquh3vL3NT-QkCOF6Pjgo
Message-ID: <CACRpkdY7nzzu3-+FwpSYqmX+O559LoXHiqcvP2OxkhX+9f-3wg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] riscv: spacemit: add gpio support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_022441_195094_ADB2C968 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgMjowMeKAr0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKCj4gQ3VycmVudCB0aGlzIHY3IHZlcnNpb24gd29yayBncmVhdCB3aXRoIHJl
cXVlc3QgaXJxIGZyb20gZ3BpbywgbGlrZToKPiAgICAgICAgIHBpbiA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKGRldiwgIm15aXJxIiwgR1BJT0RfSU4pOwo+ICAgICAgICAgaXJxID0gZ3Bpb2Rf
dG9faXJxKHBpbik7Cj4gICAgICAgICBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGRldiwgaXJx
LCAuLikKPgo+IGJ1dCBoYXZlIHByb2JsZW0gaWYgcmVxdWVzdCBpcnEgdmlhIG9mX2lycV9nZXQo
KSwgc29tZXRoaW5nIGxpa2UgdGhpczoKPiBEVCBwYXJ0Cj4gICAgICAgICBteXRzdCB7Cj4gICAg
ICAgICAgICAgICAgIC4uCj4gICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8Jmdw
aW8+Owo+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDEgMjggSVJRX1RZUEVfRURHRV9S
SVNJTkc+Owo+ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAid2FrZXVwIjsKPiAg
ICAgICAgIH0KPgo+IEluIHNvdXJjZSBjb2RlCj4gICAgICAgICBpcnEgPSBvZl9pcnFfZ2V0X2J5
bmFtZShkZXYtPm9mX25vZGUsICJ3YWtldXAiKTsKPgo+IEkndmUgbWFkZSBhbiBhdHRlbXB0IHRv
IHBhdGNoIGdwaW9saWIgdG8gc3VwcG9ydCB0aHJlZSBjZWxscyAiaW50ZXJydXB0cyIKPiBzeW50
YXgsIGJ1dCBzdGlsbCBmYWlsLCBpdCBhbHdheXMgZ2V0IGxhc3QgZ3BpbyBpcnFjaGlwIG9mIGZv
dXIsIHRodXMgdXNpbmcKPiB0aGUgd3JvbmcgcGluIChlLmc6IHdpbGwgYWx3YXlzIGdldCAzIGZy
b20gZ3Bpb2NoaXBzIDAsIDEsIDIsIDMpCgpSaWdodCwgd2UgbmVlZCBhIHByb3BlciBwYXRjaCB0
byBmaXggdGhpcy4KCkNhbiB5b3UgcGFzdGUgeW91ciBwYXRjaCBzbyBJIGNhbiBzZWUgaWYgSSBj
YW4gc3BvdC9maXgKdGhlIHByb2JsZW0/CgpJIHRoaW5rIHRoZSBpcnEgY2VsbCBwYXJzZXIgbmVl
ZHMgdG8gY2FsbCBvdXQgdG8Kb2Zfbm9kZV9pbnN0YW5jZV9tYXRjaCgpIC0gb3Igc2ltaWxhciAt
IGFzIHdlbGwuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
