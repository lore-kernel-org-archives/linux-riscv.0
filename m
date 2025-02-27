Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E69AC197BF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 23:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/1ZmkJmZBGIJGlRif4jK27uz+Whx3I8aBGqXb5ulKA=; b=4rIwmwLloPCC01
	uzl4DID4d9XzAMHgZkZvSrmhMRJSrMGKzzgNrhFBz7B82zkCKbbX2qheBSIpkV84SZUK6Pt+iKwQE
	WcjfnHcRKnexMIQrX/pCMDO9O0LOweDoS1ja4RqE+V9eT0jWx6PKs2qwGshjbNQn2l1QtNKmhPlZX
	ssw8jzU89CfJx4pL60AdCoGxhJqNXyEc6j8rmJc8VGP8aqYS9MlTFmpQToTxOpcDJkTFqJ3cZRJ1K
	KwLtmyasTw+lvqm7nc1DKZvy9nfh9AGuCf74Jq3NJLdqAChIVfv18Dg9VoZEqHeY4aHJJhUsydUAU
	kJtnMNA9VWHsaWsD4M1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnms6-000000096Fm-37s1;
	Thu, 27 Feb 2025 23:00:50 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnms3-000000096FC-2ib6
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 23:00:49 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-30b8f0c514cso4316331fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740697246; x=1741302046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwFZZezvW0dBKzxzrpQ/61HBuqlXjI5bXEQd5dYgZNo=;
        b=G4ooF4ZCfWw/N66XlU9EsRCptsd2i9OeZVqTCHLTfOeBNhnG4mlpHw9+vsdndUlhYz
         Eqn7uRZKmUL483oUC1b50Dur1QS6QLKpXtTYhVtxg2VAOFa6vt1bfnqZHVxByp1dXyv5
         8IzM/zk5korfiEM/kDhVU/9AF0DIvEFMq1l5IsdRkZBtNaAICHcInHDJ9OLaZec4i8FL
         OJnD3/Q7DI+PVqfREzc2kYalzhDymv6MgX6eW1YC9ZpVR403V4Gzbt8YsbEsvZcetPyW
         2H3DhkyHyGwU8omzsfuPwcU+J2mBLliTxj4Uf17bn7oyjWzYIYthBKE1Mg5fGFzxiHJO
         AM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697246; x=1741302046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwFZZezvW0dBKzxzrpQ/61HBuqlXjI5bXEQd5dYgZNo=;
        b=O6w3CqhTbTQtH+r4osuf11IO6oNJzqTWDdvbTnlQzeDF5W9+9cLYwi/de5Zbi2FOGt
         UxB1QqRXKv3mUULBt/T8MHV5jnn8EEiGVtt+x1Q/0l0Yv+WcBisnOWyumJ7Jlh7lRCXQ
         +fAAfDEsS0Ys/oKkN/x/tZ0V/vyrzBsZboBBYQ8YIgKAwtnACyV7pE1ZrzGhi8aBkOsp
         M16kY4FV92lDZWSQAZWjxfMZ+RgzJstb/Hwx4zp25jvlL0fnBT/PxR3tVrlnlEc7iaF1
         Q2MCHxyDlhLg40PRtxecFhv09FoMAa/nh9NUQxIqyocX3xV73X26+m0RJDsNgQ2ESTDX
         wLng==
X-Forwarded-Encrypted: i=1; AJvYcCXzIs1UKyPuMfm7aSFYs8jg1H2zpQZnAKau8XyE5zV3WiPptYfYPxbzm1SksmN9NGB1QmT214flHIM0nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYk3rYKM/u9R7DNV33JUwvICBD+lHZa1MfAh1Q1DlmdS3Yrc+w
	5MehhjJ4atZHdy0iahJQhvmkuUf2slK8zKoMPh5hPYQWNsGkbDypbVZnC7T0Aim1mKqH8guW6Lc
	SMozS5OTyPJO8UxVODDwUwlpT9kzJaCJ/wYXLIQ==
X-Gm-Gg: ASbGncsZBOpP6lPnVfRZUl2FnPqwDTphzTELPO5w6kAlwCskDRlnWQ2iBI9qnCptazV
	kcAn2IokU8n3sd8iv0sCWVzwD5oJXYTf48DGwyB8jFJOTWh6/qDi60e5x8RRGxpZa1/P5iWvJqf
	f7GobiCOs=
X-Google-Smtp-Source: AGHT+IGDB6M3SfRRZWxdUGXX2+vM/pAqOBIuKSaF7zEvkP6CctCeQrrU0dd+T2vFb4hY7/S5th74SYa9xvKPHD/s7+E=
X-Received: by 2002:a05:651c:b07:b0:308:ed6f:6e71 with SMTP id
 38308e7fff4ca-30b9324f3c2mr2703231fa.21.1740697245622; Thu, 27 Feb 2025
 15:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20250211051801.470800-1-inochiama@gmail.com>
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:00:34 +0100
X-Gm-Features: AQ5f1JpBMomU6BGhqr4xdLlZeYdSp5D6LLHZS3EpCT3eseLqQ-fhMILIKxtTpQ4
Message-ID: <CACRpkdYfZ8izsBJaKUd__jXGHnDBU9Tha=2kozjzHssoppgY5w@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_150047_690591_48AD08E8 
X-CRM114-Status: GOOD (  10.92  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgNjoxOOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgoKPiBTRzIwNDIgaGFzIGEgc2ltcGxlIHBpbmN0cmwgZGV2aWNl
IGZvciBhbGwgY29uZmlndXJhYmxlIHBpbnMuCj4gSXQgc3VwcG9ydHMgc2V0dGluZyBwdWxsIHVw
L2Rvd24sIGRyaXZlIHN0cmVuZ3RoIGFuZCBpbnB1dCBzY2htaXR0Cj4gdHJpZ2dlci4KPgo+IEFk
ZCBzdXBwb3J0IGZvciBTRzIwNDIgYW5kIFNHMjA0NCBwaW5jdHJsIGRldmljZS4KKC4uLikKPiBJ
bm9jaGkgQW1hb3RvICg4KToKPiAgIHBpbmN0cmw6IHNvcGhnbzogYXZvaWQgdG8gbW9kaWZ5IHVu
dG91Y2hlZCBiaXQgd2hlbiBzZXR0aW5nIGN2MTgwMAo+ICAgICBwaW5jb25mCj4gICBwaW5jdHJs
OiBzb3BoZ286IGludHJvZHVjZSBnZW5lcmljIGRhdGEgc3RydWN0dXJlIGZvciBjdjE4eHggcGlu
Y3RybAo+ICAgICBkcml2ZXIKPiAgIHBpbmN0cmw6IHNvcGhnbzogZ2VuZXJhbGl6ZSBzaGFyZWFi
bGUgY29kZSBvZiBjdjE4eHggcGluY3RybCBkcml2ZXIKPiAgIHBpbmN0cmw6IHNvcGhnbzogaW50
cm9kdWNlIGdlbmVyaWMgcHJvYmUgZnVuY3Rpb24KPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBB
ZGQgcGluY3RybCBmb3IgU29waGdvIFNHMjA0MiBzZXJpZXMgU29DCj4gICBwaW5jdHJsOiBzb3Bo
Z286IGFkZCBzdXBwb3J0IGZvciBTRzIwNDIgU29DCj4gICBwaW5jdHJsOiBzb3BoZ286IGFkZCBz
dXBwb3J0IGZvciBTRzIwNDQgU29DCgpJIGFwcGxpZWQgdGhlc2UgcGF0Y2hlcyAxLTcgdG8gdGhl
IHBpbmN0cmwgdHJlZSBhbmQgY3JlYXRlZCBhbiBpbW11dGFibGUKYnJhbmNoOgpodHRwczovL3dl
Yi5naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LXBp
bmN0cmwuZ2l0L2xvZy8/aD1pYi1zb3BoZ28KCj4gICByaXNjdjogZHRzOiBzb3BoZ286IHNnMjA0
MjogYWRkIHBpbmN0cmwgc3VwcG9ydAoKQXBwbHkgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3YvU29D
IHRyZWUuCgpJZiBpdCBpcyByZXF1aXJlZCwgdGhhdCB0cmVlIGNhbiBwdWxsIGluIG15IGltbXV0
YWJsZSBicmFuY2gsIHdoaWNoCmlzIGJhc2VkIG9uIHY2LjE0LXJjMS4KCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
