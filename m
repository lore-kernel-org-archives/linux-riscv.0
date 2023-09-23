Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA03ACE7A8C
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+0cDbPOr4pu5tfBvyXGJV8piaIQWHClBxsm5iGGM+0=; b=g7lQdMLDLguvzB
	zLOksDFrxse0wPSetNnCVrTkbC/YPm0wrNtX2P0NvyiWnbuRg4rVGYP6sqNTwsq9DT2pi27sxSNmh
	02IU8epRFzwFEFsYSRUxTgN/pzlbC3m3gdjXpQTqfPUPa+4WJZAtH1Fwz5aRSmLAoQ1HOtOfUuYzG
	PGVayXkR2O50QcqzHzq7Ip7Sdk3A2L41R/O4NszLkXcATZkWyEs4ig189chnmumudvYqfofQ5YnJR
	07jXo7nZ0F1XqzPKuUYL3h4gDgL/YFS8gMblc4vLN4Sp61g1MBXl1PaBu2ROqNX/d4E6h2ubzDaPl
	ryg/Kvmu0v5jUdeAyPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxPw-00AbVk-2G;
	Sat, 23 Sep 2023 07:51:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjxPt-00AbUU-1l
	for linux-riscv@lists.infradead.org;
	Sat, 23 Sep 2023 07:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E4A18B8247A
	for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 07:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10EDC433CC
	for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695455451;
	bh=ubMZKfnyWKEVj8IonDZ1KMHOScdcFtBBm3nDE8Z1AWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QiIERg4N7rrYpj3SdR416sb92nDUGV9zxcTCRd3QekW4b15Ph48zl1w0nIrDDR7NP
	 toaj5B4xUccHC8mDBCvMRdT+LcYwdqtL421Kh3j3YLMR2S2//D4Jm7x3mwKLE/jxqo
	 WfwGAG76J65srxjJ4nuVPpfeiAzftq9pUUamLUQ5uRhXyhTxz/s7qeQfgNpZJMyAsb
	 n7R3QhjAnr1FOlX1hiZ6k8eBQILTi1xNPpAFg5w0fF91/GHCNE/AD8SL6v+SCfRr7g
	 5J71CiSYG3bWNuSt2A+4nF2YIbHfeW8BBkteF8jJZFDrGHLxqsWP65I/j3tDp0Gm34
	 KrQV7vUY/hp5Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50437c618b4so3185972e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Sep 2023 00:50:51 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZT1UYQ367B4L3bt2MvNVYKxUDOYQ90obxxwMNSD5rR96o1pgB
	ldw3RGvXOxOklCTle5yym8C/9qgOW3V7VGhvzy8=
X-Google-Smtp-Source: AGHT+IFea1wRy5eJudPxUVu3RtK9dVhqNh4TIRC1jtYqezMS8B5X7TK38IQtLbtJiEI0LfX+mY8MEQQsI3NSizqlOp8=
X-Received: by 2002:ac2:4a69:0:b0:502:d302:e025 with SMTP id
 q9-20020ac24a69000000b00502d302e025mr1061315lfp.2.1695455449792; Sat, 23 Sep
 2023 00:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
In-Reply-To: <20230922081351.30239-8-conor@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Sep 2023 15:50:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Message-ID: <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_005105_890394_FBCBC54C 
X-CRM114-Status: GOOD (  14.06  )
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

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgNDoxNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gQ29udmVydCB0aGUgdGgxNTIwIGRldmljZXRyZWVzIHRvIHVzZSB0aGUg
bmV3IHByb3BlcnRpZXMKPiAicmlzY3YsaXNhLWJhc2UiICYgInJpc2N2LGlzYS1leHRlbnNpb25z
Ii4KPiBGb3IgY29tcGF0aWJpbGl0eSB3aXRoIG90aGVyIHByb2plY3RzLCAicmlzY3YsaXNhIiBy
ZW1haW5zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRz
aSB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gaW5kZXggY2U3MDgxODNiNmY2
Li43MjNmNjU0ODcyNDYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90
aDE1MjAuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kK
PiBAQCAtMjAsNiArMjAsOSBAQCBjOTEwXzA6IGNwdUAwIHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInRoZWFkLGM5MTAiLCAicmlzY3YiOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2
LGlzYS1iYXNlID0gInJ2NjRpIjsKV2h5IG5vdCByaXNjdixpc2EtYmFzZSA9ICJydjY0Ij8gSSBz
YXcgImkiIGluIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucy4KCk1heWJlIHRoaXMgcXVlc3Rpb24g
c2hvdWxkIGJlIGluIHRoaXMgbWFpbGluZyB0aHJlYWQgYW5kIGEgbGl0dGxlIGxhdGU6Cmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNzEzLXRhYmxldC1qaW1teS05ODdm
ZWEwZWIyZTFAd2VuZHkvCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRl
bnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwgInppY250ciIsICJ6aWNzciIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiemlmZW5j
ZWkiLCAiemlocG0iOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGktY2FjaGUtc2l6ZSA9IDw2NTUzNj47Cj4gQEAgLTQxLDYgKzQ0LDkg
QEAgYzkxMF8xOiBjcHVAMSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJ0aGVhZCxjOTEwIiwgInJpc2N2IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2Vf
dHlwZSA9ICJjcHUiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYSA9ICJydjY0
aW1hZmRjIjsKPiArICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9ICJydjY0
aSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIs
ICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRyIiwgInppY3NyIiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSI7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+Owo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgaS1jYWNoZS1zaXplID0gPDY1NTM2PjsKPiBAQCAtNjIsNiArNjgsOSBAQCBjOTEwXzI6IGNw
dUAyIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInRoZWFkLGM5MTAi
LCAicmlzY3YiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJm
IiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3IiLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInppZmVuY2VpIiwgInppaHBtIjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8Mj47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaS1jYWNo
ZS1ibG9jay1zaXplID0gPDY0PjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLXNp
emUgPSA8NjU1MzY+Owo+IEBAIC04Myw2ICs5Miw5IEBAIGM5MTBfMzogY3B1QDMgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsYzkxMCIsICJyaXNjdiI7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByaXNjdixpc2EgPSAicnY2NGltYWZkYyI7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJpc2N2LGlzYS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwg
InppY250ciIsICJ6aWNzciIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiemlmZW5jZWkiLCAiemlocG0iOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwzPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpLWNhY2hlLWJsb2NrLXNpemUg
PSA8NjQ+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGktY2FjaGUtc2l6ZSA9IDw2NTUzNj47
Cj4gLS0KPiAyLjQxLjAKPgoKCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
