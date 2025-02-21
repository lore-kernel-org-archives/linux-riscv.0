Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22744C021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fePzWeVVLphl/teb2sd01atnhDGBY+AWX9cCb1XsOTg=; b=fa+wAKbA66WkN1
	kC5REj0AWCI2PVK4kMb9GIzIhSQTAD0bc7tZjwZc8k/ahoSxQduc7g1OdnoLJvaGcoshSMsyaanvd
	OD0QEs051fgy50UeMqTRsYiHIHsBZTY48VOa/DhVpWJd4QBYy8jTjKderIRGj3kS4LtbTnlKjp7wF
	riJIq0Oych4N2jLbMvyn+m/bBp82KtJlD9qRmFCxacrzJfv7ALxcpJZ3bwo28OmmPRjwSCLxKE6DD
	72CJP7z11dPdh+IcPRxzuMAKQZugTF+/ylMB5q5WChbAg24jIN2v1eiS9LyCTqq+1PxmDP1Q+WBJv
	TfFwaSKEcgusAMKh8tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSF8-00000005UNn-0lho;
	Fri, 21 Feb 2025 12:34:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSDr-00000005UCH-3dl6
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 12:33:41 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5461b5281bcso1818840e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 04:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740141218; x=1740746018; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laCji0wgcejA8pX+AF6wxbOGQS4OFrsspaTrAMdESBk=;
        b=CoPhMgy7f7xMxu/Bkgn/z/KKbcjCFOK1T+vSzNmZfa12mdKuKd7TKTZ13D1B2vqyY6
         QGH158TQn92L4D/95WGuPA9Z3MGx+mlmPQPQe3JEs0NhHdEi75vXmZZme7gxJ9yDL+f5
         X8YpFQvsP0q4qTLCZx2Qlr8E2DCGqJ5Zchei1idRNoQD/IjM+syUu7k8Z8wiDjd4Wgpe
         BJr4rrX/C+G0/hpiTyhak6zZ748f/PLKz4VuWkrOQHk8gHPoaMLatHgsbg80XQXvfCJN
         RQ9vvdZNDsI6P1fMziolCsAJEYIUCgJcaWreC72/zLNucPwetnzF0lFOu92dnUkaNoRl
         WSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141218; x=1740746018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laCji0wgcejA8pX+AF6wxbOGQS4OFrsspaTrAMdESBk=;
        b=eC9qJ6foAEZn5H8e2UQN/96Miw5qsU2ox6Rzx6X8EvnRf4FnWIrLxCv7dBZBUIr01L
         /D5LxbuPLvFYolqQ0BDmukq+aht3AoHxmRu+VEAQIBP63pSsQ3Adodx2GXcnzm1EAIDH
         CmNTTF1qFExCXDBdLmfaja7F/tUpX2QKPQ4JiK9cP/kw0Htp6GIbroxHhYefPG+a/Kw+
         AjnPpVZP/amtITstGZ49wosMyuMcyh7oAgAJiddFQA71tnVWm0yfAy8PSAMIdrfCg8wg
         GCCLe4XtEzsMdF9jkKREw9GffJl1WbBoQYNqLw84DfOX9YA2b6puTmGFukYxwHOava5b
         sAaA==
X-Forwarded-Encrypted: i=1; AJvYcCVECGZcUgNRU2Bxqrdj0m7ALyIoNbrbH6my+vuWVFabCLkYti3W1UdXIjPyX1j8M2Ef1FTRNImdHPqZ3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Mkt5K1LaKo/F48jMr4KhshHhhmXmNSgNRksSKOsSAF5GeCLW
	gajrybKRxZxj2Lv5Z1lTZ6rNRFszMmVfgcA1cxIJRmFEAIqpT7UUrlCbqCdGin6XJs+uv5P4TUD
	q6LhNIeSYdkGPXHZXKKLJ8zLu+88aLoPVP1Mzhw==
X-Gm-Gg: ASbGncsIxL07+qyzpRQi20Ma/2WRlyFRQXiEYoAcTPFsUEyOrHtNVVVmfus09iLK+Yh
	uVRz6ALetlTMJHrKuNGrMqZ4Rh8SOtPI7ANSPmtN5rlTnz1zNE45joR6BuBW0z+Dmd9hvYCjN5C
	08sdaYLPoV+3QZu9LMbevaSIQcf2MS7WCk0mhed2A=
X-Google-Smtp-Source: AGHT+IF8P3wDFcp9YKaC027dHaySwmaNX5iaDpp3C16lxDq0a06pZGaS/beZ+S8CGUUtscqFetXUQ7xQyX+bCcMlTIE=
X-Received: by 2002:a05:6512:1319:b0:545:49d:547a with SMTP id
 2adb3069b0e04-54838ee933fmr1110810e87.18.1740141217814; Fri, 21 Feb 2025
 04:33:37 -0800 (PST)
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org> <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
 <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com> <20250221122125-GYA35549@gentoo>
In-Reply-To: <20250221122125-GYA35549@gentoo>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 13:33:26 +0100
X-Gm-Features: AWEUYZn-ieTWF1DGfmKnjgr1pt858szsAsKVHHDN3y-ddz38_1CC6vtmW7gZy14
Message-ID: <CAMRc=Meg6kdEQ6B+u+rfcBc1d6rMO-9Prz4oFoSF-WFZorZeNw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_043339_905507_5A0B62A8 
X-CRM114-Status: GOOD (  19.62  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMToyMeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEJhcnRvc3ogR29sYXN6ZXdza2k6Cj4KPiBPbiAwOTozNyBGcmkg
MjEgRmViICAgICAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAy
MSwgMjAyNSBhdCAxMjozNuKAr0FNIENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29t
PiB3cm90ZToKPiA+ID4KPiA+ID4KPiA+ID4gT24gMjAyNS8yLzIwIDIxOjM0LCBCYXJ0b3N6IEdv
bGFzemV3c2tpIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgRmViIDE3LCAyMDI1IGF0IDE6NTjigK9Q
TSBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4gd3JvdGU6Cj4gPiA+IFsuLi4uLi5dCj4gPiA+
ID4+ICsjZGVmaW5lIHRvX3NwYWNlbWl0X2dwaW9fYmFuayh4KSBjb250YWluZXJfb2YoKHgpLCBz
dHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rLCBnYykKPiA+ID4gPj4gKwo+ID4gPiA+PiArc3RydWN0
IHNwYWNlbWl0X2dwaW87Cj4gPiA+ID4+ICsKPiA+ID4gPj4gK3N0cnVjdCBzcGFjZW1pdF9ncGlv
X2Jhbmsgewo+ID4gPiA+PiArICAgICAgIHN0cnVjdCBncGlvX2NoaXAgICAgICAgICAgICAgICAg
Z2M7Cj4gPiA+ID4+ICsgICAgICAgc3RydWN0IHNwYWNlbWl0X2dwaW8gICAgICAgICAgICAqc2c7
Cj4gPiA+ID4+ICsgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgICAgICAgICAqYmFzZTsK
PiA+ID4gPj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4Owo+
ID4gPiA+PiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXJxX21hc2s7
Cj4gPiA+ID4+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpcnFfcmlz
aW5nX2VkZ2U7Cj4gPiA+ID4+ICsgICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpcnFfZmFsbGluZ19lZGdlOwo+ID4gPiA+PiArfTsKPiA+ID4gPj4gKwo+ID4gPiA+PiArc3Ry
dWN0IHNwYWNlbWl0X2dwaW8gewo+ID4gPiA+PiArICAgICAgIHN0cnVjdCAgZGV2aWNlICAgICAg
ICAgICAgICAgICAgKmRldjsKPiA+ID4gPj4gKyAgICAgICBzdHJ1Y3QgIHNwYWNlbWl0X2dwaW9f
YmFuayAgICAgIHNnYltOUl9CQU5LU107Cj4gPiA+ID4+ICt9Owo+ID4gPiA+IFBsZWFzZSBkb24n
dCB1c2UgdGFicyBpbiBzdHJ1Y3QgZGVmaW5pdGlvbnMuCj4gPiA+Cj4gPiA+IFdoeSBub3TvvJ9J
IHNlZQo+ID4gPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNz
L21haW50YWluZXItdGlwLmh0bWwjc3RydWN0LWRlY2xhcmF0aW9ucy1hbmQtaW5pdGlhbGl6ZXJz
Cj4gPiA+Cj4gPgo+ID4gVGhpcyBpcyBmb3IgdGhlIHRpcCB0cmVlLCBub3QgdHJlZXdpZGUuCj4g
Pgo+ID4gSXQncyBteSBwZXJzb25hbCBtYWludGFpbmVyIHByZWZlcmVuY2UuIFdlIGRvIHVzZSBi
b3RoIHVuZGVyCj4gPiBkcml2ZXJzL2dwaW8vIGJ1dCBJIHByZWZlciBuby10YWJzIGluIG5ldyBj
b2RlLgo+ID4KPgo+IHRoYW5rcyBmb3IgdGhpcyBleHBsYW5hdGlvbi4uCj4KPiBteSBpbnRlbnRp
b24gd2FzIHRyeWluZyB0byBrZWVwIHN0cnVjdCBtZW1iZXJzIGFsaWduZWQKPiBpZiB0YWJzIGlz
IGEgbm8tZ28sIHdvdWxkIHVzaW5nIG11bHRpIGJsYW5rIHNwYWNlcyB0byBhbGlnbiBiZSBhY2Nl
cHRhYmxlPwo+Cj4gc29tZXRoaW5nIGxpa2U6Cj4KPiBzdHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5r
IHsKPiAgICAgICAgIHN0cnVjdCBncGlvX2NoaXAgICAgICAgZ2M7Cj4gICAgICAgICBzdHJ1Y3Qg
c3BhY2VtaXRfZ3BpbyAgICpzZzsKPiAgICAgICAgIHZvaWQgICBfX2lvbWVtICAgICAgICAgKmJh
c2U7Cj4gICAgICAgIC4uLgo+IH0KPgoKTm8sIHRoYXQncyBldmVuIHdvcnNlLiA6LwoKV2h5IGFy
ZSB3ZSBldmVuIHdhc3RpbmcgdGltZSBhcmd1aW5nLCBjYW4geW91IGp1c3QgdXNlIGEgc2luZ2xl
IHNwYWNlPwpZb3UnbGwgZ2V0IGEgZHJpdmVyIG1lcmdlZCBhbmQgbWF5IGp1c3QgZGlzYXBwZWFy
IGZyb20ga2VybmVsCmRldmVsb3BtZW50LCBMaW51cyBhbmQgSSB3aWxsIGhhdmUgdG8gbWFpbnRh
aW4gdGhlIGNvZGUgc28gd2UgZG8gZ2V0CnNvbWUgZGVncmVlIG9mIGRpc2NyZXRpb24gd2hlbiBp
dCBjb21lcyB0byBjb2Rpbmcgc3R5bGUuCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
