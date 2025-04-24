Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A50C369D7
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvOe3Fm/Xd3WGU4heKNARv4EjlD/7SnAc7dv7VVfP/I=; b=mHvbB4YWsdNkWA
	49PKTvcrLkwj7Wj5+lxJZjzAf9WD621XkMZpLSb+tX4ZEwF6wwCuKhRv4OLi6W+3Jf2RE8hZWk7hZ
	yXmh3g0p8Jmqjbm7a615rlAZ6aAqOTuOHHaIruzLd/FqPGveT8dervyNNgFbkFqn7W3joq9Dq9i2E
	sNg07y7wNrgBc8gCzJrJVaLbigTHe3o7iWiHHPgXx6dkRBXDaQEb57Q6OepDErOqFtHAho+FXwgun
	o455cgU7qH1FShJ3cS8qPvlurg/6v21gO2oSX3FJZFJrVgULYzMLUFJRavJO4aaLjlwISWiZx5YhC
	Hfv2sWH3cpBHkPdJTBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t6J-0000000DXys-2gc2;
	Thu, 24 Apr 2025 09:42:35 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sGQ-0000000DP2t-1guz
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:48:59 +0000
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so6347281fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484535; x=1746089335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQRA7d452oryDtFvJjN4gzdIi0T+CiF3zcn8EUThZUo=;
        b=rTQj7bMrWTY8mQ3qLsLf2ThhQD6gBU50aZeKATwXMwDJGgRKT9MbYvE7IseYmolWJ7
         fkkreuuiqdyUiG5GWiyFScyDQHVOcbdzpiRjzYd2THYiOUV31CHm9kcoJMCOjBHr0ewg
         t9fLMaMu82YK6kEAdOcR3u1GkDpt8gKaeka72To8QqwseFscLDRMQaxjmEBFS4q/FVAb
         EYRc/7AYgzkx1FOyxA7gSFscKpaarB7+8QCCpYHZyXApehVvVmVMbT7KyLOsLRUY9dfD
         oZaLT9trz5HhCpprkVvEOUgZ9dKihddysv+opoqOOlSQXkSr4vRxdBq9UN//erqvXOLu
         C8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484535; x=1746089335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQRA7d452oryDtFvJjN4gzdIi0T+CiF3zcn8EUThZUo=;
        b=Nu4M5joqA8RfOC5TW7IoEfLrqw0Pc6dN6ZPX0QPnpFt/MExM9T2UE1BvC8VugSz2TX
         LobvRvUwwoQ0+Kf4vXsdjNNLwwbOwg8/udNawWhe0IXODKXTwAzOTEE/pcELtG5NC2sg
         i01dfNMgRSzKdlom1cPuz3uZrIb7VQEzT5Sl4Nnj2Leo0toblMzCg2YYnpFRZdWQEsZd
         FXkq3Ax7ymFB4hIdaxUPVgu4DGv0CeqZ59clHpCyuOIFEpPoR4ib3RMQdp0he2AKs6Cj
         WKK8/LVgrpFvy0KWDcQl7AEaDeFMq1RBb8VMX4NTfdhMiuYY7yqo7SqiAsC6Z0TDv0Po
         exTA==
X-Forwarded-Encrypted: i=1; AJvYcCVle2oPKDeaQafBEE6S5xTrShD9BtFif26zXn6qa2CCxqaNTx1yxtPYdPYZs8ljsPgwiHpaLbLYRyycBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGaEMwT+EX842u6XVbYj7Wz5QoTOQwzxqNEM9ziHSNRTGzgXON
	OZPltaCgVDnbDyoF1BwcfpAbMo0ZD5y67AT9GTmpJ999C29UTRa8fithrEUJi700fgKiUuzaT+Q
	8OtdpFPdE7j5vTQySTvjdN1VSKwwO83Xj+m0bLA==
X-Gm-Gg: ASbGncuodVeqFUebha2WG6L2qiwzDrQNbFcq8MeTtkm/LfirRI0Yvwe9JnmKSXIkgVS
	costVO5SJmDd4udEcXMl1dpw+QpPJEJnHIAVuQN+TOfCxfcXSIVBjQAoMq6ViHDCJ8IdUI6vi51
	qQkLTDXXgJJFqI5/Tw5UGXGg==
X-Google-Smtp-Source: AGHT+IE7By8Nl0BxiZtKTH0/jnSaFSHNwDqu5lHCKflXtrMxeoGrVVWZsRliLty3NtgjSGU/XT7xVZJZbRmvKEOyiGY=
X-Received: by 2002:a2e:bc0a:0:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-3179ffb04f8mr8038931fa.33.1745484535556; Thu, 24 Apr 2025
 01:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
 <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me> <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
 <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
In-Reply-To: <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:48:44 +0200
X-Gm-Features: ATxdqUHt-uv_Jd5XJrneHwwa9WAzFXDYu1AWIehUvUHevx0I0mgG49yxhuUvhlA
Message-ID: <CACRpkdbmF5BucsRjGZYgT709QA_Qnd3VrDoXg9dJdtAb_QLPwA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_014858_445646_AF27581C 
X-CRM114-Status: GOOD (  17.95  )
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

T24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgNDoyMuKAr1BNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKCj4gPiBTbyBjbGVhcmx5IHRoZSBlbnRpdGllcyB0aGF0IHlvdSBhZmZl
Y3QgYXJlIGluIHRoZSBzYW1lIG51bWJlcnNwYWNlLAo+ID4gYW5kIHRoYXQgaXMgYWxsIHdlIGNh
cmUgYWJvdXQuIFRoZXkgYXJlIG5vdCBlbnVtZXJhdGVkIGluIGFueSB3YXkKPiA+IG9ydGhvZ29u
YWwgdG8gYW55IG90aGVyIHBpbnMgQUZBSUNULgo+Cj4gVGhleSBqdXN0IHNoYXJlIHRoZSBmaWVs
ZCB3aWR0aCwgdGhleSdyZSBub3QgaW4gdGhlIHNhbWUgbnVtYmVyc3BhY2UuCgpPSyBJIHRydXN0
IHlvdSBvbiB0aGlzLCBJIGp1c3QgaGFkIHRvIHB1dCBhIGJpdCBvZiBwcmVzc3VyZSBzbyB3ZSB0
cnkKdG8gc3RheSB3aXRoIHN0YW5kYXJkIGJpbmRpbmdzLgoKPiBUaGUgZGVzaWduIG9mIHRoZSBK
SDcxMTAgcGluIG11eCBjb250cm9sIGlzIHF1aXRlIHNpbXBsZSBhbmQgc3R1cGlkOgo+Cj4gLSBG
aXJzdCBwZXItR1BJTyBtYXAgY29uZmlndXJhdGlvbiB0byBtYXAgdGhlIEdQSU8ncyBET0VuIHBp
biB0bwo+IGludGVybmFsIHRyaS1zdGF0aW5nIHNpZ25hbHMuCj4gLSBUaGVuIHBlci1HUElPIG1h
cCBjb25maWd1cmF0aW9uIHRvIG1hcCB0aGUgR1BJTydzIERPVVQgcGluIHRvCj4gaW50ZXJuYWwg
b3V0cHV0IHNpZ25hbHMuCj4gLSBUaGVuIHBlci1pbnB1dC1zaWduYWwgY29uZmlndXJhdGlvbiAo
bm90ZSB0aGF0IGl0J3Mgbm8gbG9uZ2VyIHBlci0KPiBHUElPKSBtYXAgY29uZmlndXJhdGlvbiB0
byBtYXAgdGhlIHNpZ25hbCB0byBhIEdQSU8ncyBESU4gKG9yIGZpeGVkCj4gbG93L2hpZ2gpLgoK
SSBnZXQgaXQsIEkgdGhpbmsuCgpTbyBpZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoaXMgc2V0
LXVwIGlzIG5lY2Vzc2FyeSB0byB1c2UgYW55IG9uZQpwaW4gYXMgYSBHUElPIHBpbj8KCkluIHRo
YXQgY2FzZSwgY29uc2lkZXIgdGhhdCB0aGlzIG11c3QgcHJvYmFibHkgYmUgZGVlcGx5IGludGVn
cmF0ZWQKd2l0aCB0aGUgR1BJTyBzdWJzeXN0ZW0gcmF0aGVyIHRoYW4gdGhlIHBpbiBjb250cm9s
IHN1YnN5c3RlbS4KCkZvciBleGFtcGxlIEdQSU8gdXN1YWxseSBoYXMgdGhpczoKCmdwaW8tcmFu
Z2VzID0gPCZwaW5jdHJsMSAwIDIwIDEwPiwgPCZwaW5jdHJsMiAxMCA1MCAyMD47CgpJbmRpY2F0
aW5nIHdoaWNoIHBpbnMgYXJlIGFjdHVhbGx5IHJvdXRlZCBhcyBHUElPIGFuZCBpbXBsaWNpdGx5
CmNvbnRhaW5zIHRoZSBpbmZvcm1hdGlvbiB5b3UgbmVlZCBhcyB0byB3aGljaCBwaW5zIGFyZQph
ZmZlY3RlZC4KClRoZXJlIGlzIGFsc28KCmdwaW8tcmVzZXJ2ZWQtcmFuZ2VzID0gPDAgND4sIDwx
MiAyPjsKCnRoYXQgY2FuIGJlIHVzZWQgdG8gc2F5IGNlcnRhaW4gbnVtYmVyIHJhbmdlcyBpbiB0
aGUgR1BJTwpjb250cm9sbGVyIGNhbiAqbm90KiBiZSB1c2VkIGZvciBHUElPLgoKVGhpcyB0eXBl
IG9mIGluZmVycmVkIGluZm9ybWF0aW9uIHNob3VsZCBpZGVhbGx5IGJlIHVzZWQgdG8KaW5mZXIg
dGhlIGNvbmZpZ3VyYXRpb24gcmF0aGVyIHRoYW4gaGFyZGNvZGVkIHByb3BlcnRpZXMuCgpBbmQg
aWYgeW91IGhhdmUgcGluIGNvbnRyb2wgYXMgYSBiYWNrLWVuZCB0byBHUElPLCB0aGUKY2FsbGJh
Y2tzIGluIHN0cnVjdCBwaW5tdXhfb3BzOgoKICAgICAgICBpbnQgKCpncGlvX3JlcXVlc3RfZW5h
YmxlKSAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcGluY3RybF9ncGlvX3JhbmdlICpyYW5nZSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCk7CiAgICAgICAg
dm9pZCAoKmdwaW9fZGlzYWJsZV9mcmVlKSAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwaW5jdHJsX2dwaW9fcmFu
Z2UgKnJhbmdlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBvZmZzZXQpOwogICAgICAgIGludCAoKmdwaW9fc2V0X2RpcmVjdGlvbikgKHN0cnVjdCBwaW5j
dHJsX2RldiAqcGN0bGRldiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgcGluY3RybF9ncGlvX3JhbmdlICpyYW5nZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgaW5wdXQpOwoKd2hpY2ggeW91IGNvdWxkIGltcGxlbWVudCBpbiBqaDcxMTBf
cGlubXV4X29wcyB0byBnZXQKYSB0aWdodGVyIGNvbm5lY3Rpb24gYmV0d2VlbiB5b3UgcGlubXV4
IGFuZCBHUElPIGNvbnRyb2xsZXIKcG9ydGlvbnMuCgpJIGhhdmUgYSBzdHJvbmcgZmVlbGluZyB0
aGF0IHRoZSBtaXNzaW5nIHBpZWNlIGlzIHVzaW5nIHRoZXNlCmNhbGxiYWNrcyBhbG9uZyB3aXRo
IHRoZSBncGlvLXJhbmdlcyB0byBjb25uZWN0IHRoZSBHUElPIGFuZApwaW4gbXV4IHN5c3RlbXMg
dG9nZXRoZXIgc28gdGhhdCB5b3UgY2FuIHNldCB0aGlzIHN0dWZmIHVwCmluIHRoZSBhYm92ZSBj
YWxsYmFja3MgaW5zdGVhZC4KClRoYXQgd291bGQgc2F2ZSB5b3UgdGhlIHdlaXJkIERUIHByb3Bl
cnRpZXMgdGhhdCB3aWxsIGJlIGEgcmVhbApwYWluIHRvIGtlZXAgaW4gc3luYyB3aXRoIHRoZSBh
Y3R1YWwgdXNlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
