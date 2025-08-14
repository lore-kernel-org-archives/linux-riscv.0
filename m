Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D846ECA0EE3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQx2HtwQu7pfqhaLYx5fBDvMuU0bklEBqx6qRK0jZWg=; b=bzBbDsoSSXWUB0
	gOKG/Okia8vwLc/rhlDx99ImxFWuUK8pfY+tdce1q9NHmzMME1VJAcKdDBGBP+IlWaeSo3opAu4WD
	4ihT8ujGlIVcF69tjoC7qBpNngWWsW+zNgZ6pelFRyj6LS3wultOerDxhzG4X7d1hNvxs1S0E73ES
	wQOjpQULoEzcDTR7ulvHotNc0hf7jIXjBBq8PXLNpqvnzU83xztk3ECPaGcMqc5CVA+5VL8+VIf8a
	Pjuf2qjUexytZ6A6pZ4ZIHmSU6F0KEtI2vWwRML1ctpmJ/beZaIaWcejTxauAA/h1KVfk6M1rDAQU
	pyJBQbOe5+SIPlSQRUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSR1-0000000G5dS-0RIn;
	Thu, 14 Aug 2025 07:31:39 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSG0-0000000G4Ih-1uQG
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:21:56 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso6220621fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755156014; x=1755760814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs1MFcYsgr4i84q3dtW1Ra43PylyG/Hny4f25xaRtQo=;
        b=W6lxsb2Dq+0PvDvG6qKVHPOu6R3kEEfxv2hPkWvOK/94CAr9fn44pK33K9tOvusmM+
         1syZFFnmN8+3EYXJMYBlIoOue2Qzd8nP0WvNDkzWlr6bLoOhHa1TfQkEdBwAAkiHmHYd
         ukWfBMcNDEN7VvtYuy8POvkGTneaMXIp0unlHhGJyNDZ+KaTlhuA7JVj/JmOSj02+/Dl
         1iUf3N9zj0EtL3t7NE51s+3iq7BJJiy5bzpl+jEoxm9WbFr+bBmu9tonkeRdP+QaMATu
         wpzXtz/Ewgdaxv62Uq8EwstVlmLzYAo0+sdx0ein+sL6oAtPALFeWNj2cs6qh/cpvK0i
         gzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755156014; x=1755760814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vs1MFcYsgr4i84q3dtW1Ra43PylyG/Hny4f25xaRtQo=;
        b=o7jsdBify7WgwDIMkjlXpiCiyKBNXJRCP9l4azwJv50i8SBvIz+vs3eViI7Mh5BaP5
         tOg8AvvKBfx1lWP5wT3SkmpA5I4dWTwalg2ukZxeEadTfa2T7coiJFYs3L/MDnx6kRvs
         eCyvMyMsEcpz7CsBTVLcU0nG0Yvh19FqNXkmCvlwwmPrXmAO4/mJVQpXsBzYTpqeKSdM
         35BaZSEX81mC+M3OM2bnd3XKKz7BGaMYUk0rTohDD228DUVOpkzzwZvKG5XuKmpLYqDw
         YQ39meROcw115xYWBB5mnzRCSDw3C5My/Nqa//r748cxwRGgHqavptEHmgWR9ioGD2jr
         sWOw==
X-Forwarded-Encrypted: i=1; AJvYcCVrZHitZoYLSePbN+2qVUx5fveY4PzXT5CsASga5oAEYVwRixYnBljV9RY5e+zaXkQEA9FDhr3BV8CZTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQza6GcFERRksgLcZ3zYkChxsc3O6vjlnyN8LvMQQQg9L1pED6
	vWo+nam2LIoPx98JXLg5QKWD5PgVqgeVwi6ihsGMJcjhm+ONgNJOrqC6K7VSV1oFLjPY1V7v3h9
	r7LMjtrAkEnCWG9NygrYrpYv5blc/uS1rRyHzrPR3Mg==
X-Gm-Gg: ASbGnctDAMCeITUX4pW31C/01kSJ3hXPd17wjSaiHf2BxmF2KZLtH1ZV8pRPvi01Fhm
	u10etEAVRNe9XBYqIdn9KVb2j96oYtxuw9DhcLlgqcXC8ijf3mSBZm+Fo5ZZOZWbhTPczmdOCcL
	qol8VlYrBTL/uLsdc8Jgd7NahijT1gZHBOnyWTdr9b8yOhwGUmi6G7ma6Wa7sn/9JMIzPDmBZmZ
	09Bu/X0m4t2p1EX7xPhUVqVMlOQoeQGeZTfBiC+cJA8Pw8LTA==
X-Google-Smtp-Source: AGHT+IFTBlbhCsC67N1cmh3Rx642cXrDuTiu4TqWoZO5/6AVKV2k5/0U1k8rriHZOcjPel5pdqkogtlQ5ztMZk+8OUs=
X-Received: by 2002:a2e:94cc:0:b0:333:f53f:1bbe with SMTP id
 38308e7fff4ca-333fac83beamr3948621fa.7.1755156014062; Thu, 14 Aug 2025
 00:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com> <20250813161517.4746-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813161517.4746-4-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 Aug 2025 09:20:03 +0200
X-Gm-Features: Ac12FXymdFzWV3g_JZazK_vzgETVMckCMj8Na0v79R7sG6_qTW0BLLb2z8dkgs0
Message-ID: <CAMRc=MepR_e8jkzOyRs6RwP6BTKDW8RAB7-Z2GF0KcAr4VmZ7A@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpio: remove unneeded 'fast_io' parameter in regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_002016_600244_3915585D 
X-CRM114-Status: GOOD (  10.90  )
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

T24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgNjoxNuKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gV2hlbiB1c2luZyBNTUlPIHdpdGgg
cmVnbWFwLCBmYXN0X2lvIGlzIGltcGxpZWQuIE5vIG5lZWQgdG8gc2V0IGl0Cj4gYWdhaW4uCj4K
PiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJp
bmcuY29tPgo+IC0tLQo+IE5vIGRlcGVuZGVuY2llcywgY2FuIGJlIGFwcGxpZWQgZGlyZWN0bHkg
dG8gdGhlIHN1YnN5c3RlbSB0cmVlLiBCdWlsZGJvdCBpcwo+IGhhcHB5LCB0b28uCgpBcHBsaWVk
LiBiNCBnZW5lcmF0ZXMgYSBzdXBlciBsb25nIGxpc3Qgb2YgcmVjaXBpZW50cyBldmVuIGlmIEkg
b25seQphcHBseSB0aGlzIG9uZSBwYXRjaCBhbmQgSSBjYW4ndCBzZW5kIHRoZSBhdXRvbWF0aWMg
cmVwbHkgZHVlIHRvCmdtYWlsJ3MgbGltaXRzLiA6KAoKQmFydAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
