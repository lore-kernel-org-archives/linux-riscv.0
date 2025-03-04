Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AADC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CY6FXjKqi2L0KThrJusI/o7iSwcBhFemQaSJ/IXQ1U=; b=MwMTE0+JYNTStx
	4NXeaxErInQfzzH9pRmJv+NCsvFwgvlHphRI0qbTy5Mh2Puwyd25+SSaHPdIF8Smmv6JPtRKS2WNA
	O0tChtderoFc5FLCUUuVzkMlKIN9s3MUoq4gie18oKvPhjOmj3togjT63diaOJmzUqfcULW+PrFsD
	o3/ncmedEXT/uXhH6FE5jslYzVXG9ziNry8lQIjdNNRofn3jIVsPV4rjd19IbHgLWe1o3cKyFKLkt
	zyuK61+D/E/W6VN5vfLpTX5JB5R/ynckh4phippr7w31/Qo49MQBujsuPNy/+RpTVdOrnmiD5DJnx
	+EnvFPC0njlOMlzmSDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMkM-00000003Rpp-1iye;
	Tue, 04 Mar 2025 07:31:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMkK-00000003RpR-09tk
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:31:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5495078cd59so4072361e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 23:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741073478; x=1741678278; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=GyreQwhOfLcd2KVSyDkRsA+FSD4QbFY6Vn0xG1SrKNubNMP5CdusB9mgvEh1EOgzb6
         3G6Cw7+UVLQNHSNKgsV45cL8B3ZKG6ZcQO1U5NxMwNOw7A+fXQaGGO+m2uspz+aRGGR0
         i1Nqd/Kx/HQferzpEamhv9fyp2oqUP+hu5+Ba846DGZ8U3RlgTuzCe9Q6LDnERXRtMNf
         qhieEke71zUX+mxo4tTe13ZRp2Lc2daWCUMqMvK70N4K2xzbxMhiJwLDGcdzk9lwoqrc
         9+XIfJFfOUeoE6/3Y8Pe+16pKFB9bF3jMTkave1xwT3+D5kqBbtGzuyH7vlG3kPpbzoz
         JE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741073478; x=1741678278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsNGbnsLqSkU3I8v0oKk58JnonHmFCpGP5Ckb34MbPw=;
        b=XefoQLF7JyV1eA0gcsFSs+YIbBJXaGH0Nnl9O5rAM5Z7Qucwhbrtql869Ae08yHHAF
         CjHbGM3XLvtLseovchKBRii5V5SIJlUiFkz70AgkCohEg3qsr8Cg/pPd7RzuK09F3Qsp
         b+vEaSY6L2c9dihLyIRSgQXhxgcT8Pxq6yGLIYzn+wW8tSYDyx/wQ1LJArbbT6eDdi8i
         lILTTJrKA8lPzxxXDWPVD/fmM/3xIChcOSINgEABCSgE4qX0P9hEkwc87/ROo00pNaQ6
         Tx612vCMcSs2xpWetVGV20M18snqdS4BcGJAfkuUEqcd3EAZcLd5Ws274xrGKU38poWV
         nhdA==
X-Forwarded-Encrypted: i=1; AJvYcCWLOcnlj0p5KaepU4T6E7OQu/2AwHBglCNR8JfN0rBPIy5s+ux0dCWaZjs2Ebsm2yuqXFWwqYygP+Pdsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRQuwgXH089GFzQx8vmJIIUKGzNxIdDfj6gGFEWYYh1yjmiXx0
	4YAOzqKxyEyBIxmX7OhNUb9BYVNTjxRSPcJWBnEHnyEpoZRhQS8dfcIwU7zgXgNMivhRerZL4xn
	eY82xHU7ynCcjOUAn7L/GYmdGRDkFdC2ZAeLAEw==
X-Gm-Gg: ASbGncsQlg0e/U8sq7jtWlo5u0jDNzglYcZN/xOIcuB3wWNDSd24t1+oDauns/XmPN2
	HoGn9aeO3CBsdJPce4YqZT5eTwrbVdNaS61T9h6N9GBsBBRCLo5b7DNkws8A38/Sfk4VQ20epeT
	VVohDvabod0fgFJ3EJhedjAc1vSw==
X-Google-Smtp-Source: AGHT+IGXmA371lT7C1gO2PiMuw8QGq/Oxyz60NAUpFqe9NaMOJoZxgRPOUxapC7rGv2iphJZKsi+29SyMJYP0KghgcY=
X-Received: by 2002:a05:6512:398e:b0:545:b25:ace with SMTP id
 2adb3069b0e04-5494c3282cdmr5632664e87.18.1741073478093; Mon, 03 Mar 2025
 23:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx> <20250303124011-GYA59067@gentoo>
In-Reply-To: <20250303124011-GYA59067@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:31:07 +0100
X-Gm-Features: AQ5f1JqjLIt-xiSK5fnSqtY7c8S-APPE94mFjAG2-VPGFTkMlXbz-5UAA8K1r5k
Message-ID: <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_233120_087273_09A2D134 
X-CRM114-Status: GOOD (  14.61  )
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

T24gTW9uLCBNYXIgMywgMjAyNSBhdCAxOjQw4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5v
cmc+IHdyb3RlOgo+IE9uIDE5OjMwIFN1biAwMiBNYXIgICAgICwgVGhvbWFzIEdsZWl4bmVyIHdy
b3RlOgoKPiA+IFdoeSBpcyB0aGUgdGhyZWUgY2VsbCB0cmFuc2xhdGlvbiBub3QgZm9sbG93aW5n
IHRoZSBvbmUvdHdvIGNlbGwgc2NoZW1lCj4gPiBhbmQgaGFzIHRoZSBwYXJhbWV0ZXJzIGF0IHRo
ZSBzYW1lIHBsYWNlIChpbmRleCAwLDEpLCBpLmUuIGFkZGluZyB0aGUKPiA+IGV4dHJhIGluZm9y
bWF0aW9uIGF0IHRoZSBlbmQ/IFRoYXQgbWFrZXMgc2Vuc2UgdG8gbWUgYXMgdGhlIGV4dHJhIGNl
bGwKPiA+IGlzIG9idmlvdXNseSBub3QgZGlyZWN0bHkgcmVsYXRlZCB0byB0aGUgaW50ZXJydXB0
IG1hcHBpbmcuCj4KPiBJIHRoaW5rIHdlIGN1cnJlbnRseSBqdXN0IGZvbGxvd2luZyB0aGUgc2No
ZW1lIHdpdGggZ3BpbyBjZWxscyBvcmRlcgo+IHNjaGVtZSwgd2hpY2ggaXMgKGluZGV4KGluc3Rh
bmNlKSBvZmZzZXQgZmxhZy4uKSwgdGhlIGluZGV4IGFuZCBvZmZzZXQKPiBhcmUgcGFyYW1ldGVy
cyB0byBsb2NhdGUgdGhlIGlycSB3aGljaCBjYW4gZWFzaWx5IGRlcml2ZSBmcm9tIGdsb2JhbAo+
IGdwaW8gcGluIG51bWJlciwgc28gSSB0aG91Z2h0IGl0J3MgbW9yZSBpbnR1aXRpdmUgdG8gZ3Jv
dXAgdGhlbQo+IG9yZGVybHkgdG9nZXRoZXIuLgoKUmlnaHQsIHRoZSBEVCBiaW5kaW5ncyBhcmUg
bWFpbmx5IGZvciBodW1hbiBjb25zdW1wdGlvbiwgYW5kIHRoZQpjZWxscyBhcmUgcG9zaXRpb25l
ZCBpbiBsZWZ0LXRvLXJpZ2h0IGludHVpdGl2ZSBvcmRlci4KCklmIHRoZXkgd2VyZSBvbmx5IGZv
ciBtYWNoaW5lcyBpdCB3b3VsZCBiZSBhbm90aGVyIGlzc3VlLCBidXQgaXQncwpwZW9wbGUgd2hv
IGhhdmUgdG8gd3JpdGUgYW5kIG1haW50YWluIHRoZXNlIGZpbGVzLgoKRm9yIGV4YW1wbGUsIGlu
IGEgbGlicmFyeSBhIG1hY2hpbmUgY291bGQgYXJyYW5nZSBib29rcyBieQpmaXJzdCBsZXR0ZXIg
aW4gdGhlIHRpdGxlLCB0aGVuIGJ5IHNlY29uZCBsZXR0ZXIgaW4gdGhlIHRpdGxlIGV0YywgYnV0
CnRoYXQgd291bGQgYmUgdmVyeSBjb25mdXNpbmcgZm9yIGh1bWFucyB3aG8gZXhwZWN0IHRvIGZp
bmQKdGhlbSBpbiBhdXRob3Igb3JkZXIuCgpUaGVyZSBhcmUgbWFueSBleGFtcGxlcyBvZiB0aGlz
IGluIHRoZSBEVCBiaW5kaW5ncy4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
