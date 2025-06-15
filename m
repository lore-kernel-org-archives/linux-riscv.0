Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB091C71135
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNe6udeVNGlJwcXiLID+J2eRljPmGGEwIlbmjUkSPH4=; b=eAJZIfQCtJ3W3/
	kCoiFOnjjMmHcDd/S5Zc2MBU3q89Sique6Y4v0bnArR7uBhzLY50eyopzWAGfDCpHavpJ7nOE3nV0
	sKHFw17oX+orq0O/oPKejXLyWbzdVsvAJkEgWEF7aVNjcW84ofyq234sVUiN6++PL4hgKL9xknjMS
	WgCocS1X+P0cNJ1BNUw/Svhs9cODAQ6ka3/WcdaXUdp6eTox4MpDfcaDb1N9hgStjlI9TJ6npMijc
	mt7T9lpTOcaWNnlZTiAxtdpfnA5jUYXYh91d/cUrm2OA5zEH0dm6ipseeLwAmTA1qDQJKoCrzanLU
	0utq03u9s82d3/vNPzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRd-00000002bsF-1uyO;
	Sun, 15 Jun 2025 15:38:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRb-00000002brI-1tBm
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 15:38:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-453066fad06so27126795e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001930; x=1750606730; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=XdYNLxL/Um+O9y0QrJpQLHXmQ6kYSInxa+Su6/tHkL5VE7vyVtTW4OXd9CVLP666ZF
         LNOGsqNqPDAyC27Wg35/Sxrv75nFgCPwdZ9jkvXCKZrRMgmtPXcKp1Slz/+xQGkiGaE5
         grLXcZ5qlI8Wz1oLbDkTwGweXoh79bW2/Na35tdCsucc+uVNvS7AxYJIVcdzcDSUs8GB
         yhtagegnGYqh2/7W6q/Hde3lOh0zFXgQxgcgIXSJUm3O7WGjlGLWIR0i50p+g5wwgC+/
         V1uKArKS9pr4sdlIFuI6mQr15ukqg4RKmOXH6mWFDlKcjEqnFjKXh9s07xNo0h4DYIzQ
         2dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001930; x=1750606730;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMkRqL2nxrCdwWJa8/yANGr1OdyPoFDin5WjJhsL30k=;
        b=VQHswc5Q5EnA3FLgVWBw6uKlqtpBfB0gkMRrWShtIA/BNLc1yznhW9OlTxyW0wiKTs
         w2jZWvPcn4kmJ4GAZ0ZLRPv6Aov/kxagT+Aaq2DuclXKHwWRP/JTttptoO1f/Yg4OWQg
         0f3F2Zr0oOTkHQibLDH48AoupPoJqsmAlL+MhXWspfJB+JZNdBuEc7RRmN3Dn5ZqQsBu
         OvHCAfG4LkhLwv5E8QqdQrJZb/a5AMS5TOduEiyVVo8lPmxNPmmjylKj3hgRbatBsVBf
         DzK+BdMWCsPeunZFfvj9QNy55csBFyRMoQK3PS4wZYhp2uQDqt/v2weK1HOztOpRxs+9
         JjZw==
X-Forwarded-Encrypted: i=1; AJvYcCWrcYOrQUy8uWf2gBF2HnPI3lX1WIKPvolu5YLKWCCNKqMoF90pVEduij9oA+Tbyo/A3261D6lCXEWWag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1YpZ9CyQd2/PVNR2ZFNS21UaJ6d3rPJks0QjVl3OnbK2dISDc
	YXQ/Wrh20sd6FlyJAFrBrMb/U5B5Kr8OhZRKsh4JDIuIB5KiTCmnlSNq
X-Gm-Gg: ASbGncsX+PxlGxXwiDrVxI3e9MgyKEvtmkKW+H4Q0zXHDuo5k3tzasJVkvJaqmBe/gx
	X/umNuDQCZQOVCerglMHYe7LeEsYBpm0LYQ1wL9YUq98rNeby9dqZHkrKp8DTXln2HTVFgG4ho/
	DUkZwigdhQtlfQ3rB+mngo68G3WbYc6WdF655+6S3TKOyGp+LUeEcAierZNRonQzmi1c02ONgi6
	6rW3MmTzjfJSAUiPMR2VcCV7ZfDk5AK6ucPJfK/28JvLUxhprZCypOBjjQjpVW8oUNNmmO3fcu/
	7okPipbw36COyREMzBQ8Dn01Lx9AoaGCIre7m+t4MlCMVKD93lI/4FBdiKnvwssf+vWcnBmwOrZ
	9Dh+p5Q==
X-Google-Smtp-Source: AGHT+IHq8I3l0fYXwdm0ToztfHAms4IMFhN9WcmIcQ8Gnw+CeqvwulyWE63yVmbbovDyVZ8tPZqcTA==
X-Received: by 2002:a05:600c:5248:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-4533ca4fa68mr56483445e9.9.1750001929862;
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b74313sm8116792f8f.96.2025.06.15.08.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:49 -0700 (PDT)
Message-ID: <16c8dc85cbbfb4d4e1528261f464eee64ed6362d.camel@gmail.com>
Subject: Re: [PATCH RFC 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang	 <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Yu Yuan
 <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>, Ze Huang
 <huangze@whut.edu.cn>,  Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:01 +0200
In-Reply-To: <20250611082452.1218817-3-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
	 <20250611082452.1218817-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_083851_488982_5FA27F11 
X-CRM114-Status: GOOD (  10.77  )
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

VGhhbmtzIGZvciB0aGUgcGF0Y2gsIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNjoy
NCArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBBZGQgdG9wIHN5c2NvbiBub2RlIGFuZCBh
bGwgc3ViZGV2aWNlIG5vZGVzIGZvciBjdjE4eHggc2VyaWVzIFNvQy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgoKU3VjY2Vzc2Z1bGx5IHRl
c3RlZCBpbiBob3N0IG1vZGUgb24gTWlsay1WIER1byBNb2R1bGUgMDEgRVZCOgoKVGVzdGVkLWJ5
OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cgo+IC0t
LQo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kgfCAyNiArKysrKysr
KysrKysrKysrKysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+IGluZGV4IDkyOTg2NGJh
MWIyNi4uNjVlY2VhYTVkMmY4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgweC5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4
LmR0c2kKPiBAQCAtMjUsNiArMjUsMzIgQEAgc29jIHsKPiDCoAkJI3NpemUtY2VsbHMgPSA8MT47
Cj4gwqAJCXJhbmdlczsKPiDCoAo+ICsJCXN5c2Nvbjogc3lzY29uQDMwMDAwMDAgewo+ICsJCQlj
b21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLXRvcC1zeXNjb24iLAo+ICsJCQkJwqDCoMKgwqAg
InN5c2NvbiIsICJzaW1wbGUtbWZkIjsKPiArCQkJcmVnID0gPDB4MDMwMDAwMDAgMHgxMDAwPjsK
PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKwkJCSNzaXplLWNlbGxzID0gPDE+Owo+ICsK
PiArCQkJdXNicGh5OiBwaHlANDggewo+ICsJCQkJY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAw
Yi11c2IyLXBoeSI7Cj4gKwkJCQlyZWcgPSA8MHg0OCAweDQ+Owo+ICsJCQkJI3BoeS1jZWxscyA9
IDwwPjsKPiArCQkJCWNsb2NrcyA9IDwmY2xrIENMS19VU0JfMTI1TT4sCj4gKwkJCQkJIDwmY2xr
IENMS19VU0JfMzNLPiwKPiArCQkJCQkgPCZjbGsgQ0xLX1VTQl8xMk0+Owo+ICsJCQkJY2xvY2st
bmFtZXMgPSAiYXBwIiwgInN0YiIsICJscG0iOwo+ICsJCQkJcmVzZXRzID0gPCZyc3QgUlNUX0NP
TUJPX1BIWTA+Owo+ICsJCQl9Owo+ICsKPiArCQkJZG1hbXV4OiBkbWEtcm91dGVyQDE1NCB7Cj4g
KwkJCQljb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLWRtYW11eCI7Cj4gKwkJCQlyZWcgPSA8
MHgxNTQgMHg4PiwgPDB4Mjk4IDB4ND47Cj4gKwkJCQkjZG1hLWNlbGxzID0gPDI+Owo+ICsJCQkJ
ZG1hLW1hc3RlcnMgPSA8JmRtYWM+Owo+ICsJCQl9Owo+ICsJCX07CgotLSAKQWxleGFuZGVyIFN2
ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
