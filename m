Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC7C021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khpW6idXJmGaRN+OawhrB4yD4cs0rdSg4w5sw+IvXNw=; b=HZqLCAy09UPP3a
	BzErCbtrlQKaVppyFaLvxV1Ser7IQM2hz7BW/S+oCO/Nx6bgb/zfXahdGFK6TSM6IKaSW6hAWNxTE
	Yjlp0Xi0yfp1bbtoIPeks7Rl4H0UTik1kYcOwm8PG04PzCDilo1DzkXb+jz5SAWs+/aiCB96j3qvQ
	sGe9W6eskTwIHafIRYzXCl7yakHYID5iIHAK4fiJP2ypHlyZjvXtskPkwbrN6cqi7FdbN+Fiu7rLP
	8Oz2tFRG/W6RT/iHQbcdydM1D57Nirf7CLkG2PRj/lImy0pz0FygkakFged2cTboKnCjehDe9Rrf5
	UoB/WSkgh6d6qQwbQfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOXc-00000004jnC-46gX;
	Fri, 21 Feb 2025 08:37:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOXJ-00000004jiq-1X8E
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 08:37:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-546267ed92fso2145594e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 00:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740127047; x=1740731847; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=Uu+8IA1YvINu4jc9K0GvuQMHfUeQeCBtAK3GQ0xYdHlnUKYb4Qu+8anO6tSEbSvNNI
         nWNOOn/0/ZTg8ifKRNVjRx5SaicjPTMiyOlfdSRCGfdO2ynlpZDjwo6FfaY5mhu9gZaR
         gj4cAPz/fdCO2AdfYg9gTFtS933O8qGTEAGrZ+3q+9/knOcb6zDgW6xJlqV/+SbMsaQQ
         8Af6FAvcsohf0jJN63DmEFEUQZ14TM3/jP+ApWBYBlQJeuOxbDCgoZygfnfVEVXU0vnu
         sdHysyPffiEdJAA+GgRdfB05XVFCE76lUSzrSf5emmHnGTYv1z4BbfwYxAfoUmlhAtQY
         wjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127047; x=1740731847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=OSK+73/GqH+jvmSBe0vDk1O8/pgQRqh5w5Z31tNHIKofiKknj0yU2gDvDowGoFmo0P
         ujSzxKeY7rQT760A/zxYVrbRIAPa37cB2LWk1TezUsN+PXQvl+0aTJr9ExnY6oceKZjI
         Yvv0JVfrk4YbOtT/975mmZnF8hGlmlXZJXwrbPbUkwrvfGUHKHjX6rIH8hVygxaA7YRQ
         MNq/voqUOsqyNAtvnLY2VvUkuQb8buqgp2DQT0TeBCub5i6mN+97juxqeMi/3QgUozcD
         nirWSXAeRrNuGUdeSQxd2WxlEJ6GxDeoQsyzN4gurPaaAs1YePFS8fc5bmu+sTLXxO6Z
         aTpg==
X-Forwarded-Encrypted: i=1; AJvYcCXRWT/W6OvfAhSPWUSzuYxGJB6gWcZEL0O/l2DBtbwifLA1yi3TlA/aOuQk2qvyt2Q6SWnEeGTYUjAebQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/bMe6F4HYh7xbwnCdAxy6uZzwfOUqk8IX7vQRck8yyc/fJgnf
	m+eWTf4xBsewhGe2zJRiTF2Hd1zqR0FhzMJTdjy7Bix1WERsDW3q6rIy4EW4j0szZbZ4BzN2WW9
	dwCZkad0+imOfPax0AUhXE0ggZNAylXRwECQZHw==
X-Gm-Gg: ASbGnct/tcDzl641x32PHe9z+RAmqoZrtY9A3NxVzmHGbiHUy7dx6dhoAdoTnxB3Jhr
	gp8PJZQovos/eplqjXx7RQ2umf9rigAQpah8RGjrZXkKy74qRsyW098dCaNSFCqKKQa4CFk3UeZ
	/o7Mo+Kej3N48HYpBr5atYkIKzZHt6ATo4Djori0U=
X-Google-Smtp-Source: AGHT+IEVJYqpV94JpnSSmFsbKfheCNp8/0iZB0ZSGoVT/MInSsid5S3N4SwldmQ4L5O1E7gpGonbz4t6nSMa3dwR6i0=
X-Received: by 2002:a05:6512:230a:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-54838f5c910mr744359e87.48.1740127047367; Fri, 21 Feb 2025
 00:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org> <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 09:37:16 +0100
X-Gm-Features: AWEUYZkPeZ_f9Qkm0Zlcw9GzT4Sb60CF7RDIsxK-TmMLrjs_ajHOShwiT4OIdzI
Message-ID: <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_003729_658346_52B85A75 
X-CRM114-Status: GOOD (  11.08  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMTI6MzbigK9BTSBDaGVuIFdhbmcgPHVuaWNvcm5fd2Fu
Z0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDIwMjUvMi8yMCAyMTozNCwgQmFydG9zeiBH
b2xhc3pld3NraSB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDE3LCAyMDI1IGF0IDE6NTjigK9QTSBZ
aXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4gd3JvdGU6Cj4gWy4uLi4uLl0KPiA+PiArI2RlZmlu
ZSB0b19zcGFjZW1pdF9ncGlvX2JhbmsoeCkgY29udGFpbmVyX29mKCh4KSwgc3RydWN0IHNwYWNl
bWl0X2dwaW9fYmFuaywgZ2MpCj4gPj4gKwo+ID4+ICtzdHJ1Y3Qgc3BhY2VtaXRfZ3BpbzsKPiA+
PiArCj4gPj4gK3N0cnVjdCBzcGFjZW1pdF9ncGlvX2Jhbmsgewo+ID4+ICsgICAgICAgc3RydWN0
IGdwaW9fY2hpcCAgICAgICAgICAgICAgICBnYzsKPiA+PiArICAgICAgIHN0cnVjdCBzcGFjZW1p
dF9ncGlvICAgICAgICAgICAgKnNnOwo+ID4+ICsgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAg
ICAgICAgICAgICAqYmFzZTsKPiA+PiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW5kZXg7Cj4gPj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlycV9tYXNrOwo+ID4+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
cnFfcmlzaW5nX2VkZ2U7Cj4gPj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlycV9mYWxsaW5nX2VkZ2U7Cj4gPj4gK307Cj4gPj4gKwo+ID4+ICtzdHJ1Y3Qgc3BhY2Vt
aXRfZ3BpbyB7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgIGRldmljZSAgICAgICAgICAgICAgICAgICpk
ZXY7Cj4gPj4gKyAgICAgICBzdHJ1Y3QgIHNwYWNlbWl0X2dwaW9fYmFuayAgICAgIHNnYltOUl9C
QU5LU107Cj4gPj4gK307Cj4gPiBQbGVhc2UgZG9uJ3QgdXNlIHRhYnMgaW4gc3RydWN0IGRlZmlu
aXRpb25zLgo+Cj4gV2h5IG5vdO+8n0kgc2VlCj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvcHJvY2Vzcy9tYWludGFpbmVyLXRpcC5odG1sI3N0cnVjdC1kZWNsYXJhdGlv
bnMtYW5kLWluaXRpYWxpemVycwo+CgpUaGlzIGlzIGZvciB0aGUgdGlwIHRyZWUsIG5vdCB0cmVl
d2lkZS4KCkl0J3MgbXkgcGVyc29uYWwgbWFpbnRhaW5lciBwcmVmZXJlbmNlLiBXZSBkbyB1c2Ug
Ym90aCB1bmRlcgpkcml2ZXJzL2dwaW8vIGJ1dCBJIHByZWZlciBuby10YWJzIGluIG5ldyBjb2Rl
LgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
