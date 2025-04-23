Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7129C369D7
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOYOamrAoJL8GRHDAATOEKdfj1YYpHQlh+5FpJ1sOYY=; b=RS66zXXAT2Hod3
	DrqPC6JjLm+6sdegnGQ6z6iPH6kMt2O2VfuAyCeaPEGeEmGJWCLRMU3i8ZKjlb8xwyMHEJb3sL7RB
	mrFE4Wtg/W9XhrQg5y+iYHB/PdCUogfFRFCdZ9RLpc8U9ev7+oBCw6ahJvdtB/t5Do7SkN0DM5/FP
	XFvWp1g4LYVpSNYl+bnMvVteHaJZoDNpcmoEP93nEFkA4t7y0iWuNo0bMpYTzsph+er4Q6gkcnr0k
	Qhc5AWzggV4zXzXg1qgH23on9dU+xLi+18pbTUWyTMabYNHT4Hl9H6eszcIA3FhVIdW8MU6iQt22d
	jMcdMGbt5shnh3WQODKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Yir-0000000AP9I-377g;
	Wed, 23 Apr 2025 11:57:01 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XlM-0000000AEtH-2Gxv
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 10:55:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5994017e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405730; x=1746010530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=ecRBu5YlKusVsJp/JMnXF6Yldcax08DVpROscikv1VUnEFI2mxPAufEyFKbR3L79Fa
         U4i03IQglvV8BxUdumnTu6WySpXheedDs8kqM3KOY0CGEPBG6koN6IzXQMyhV0ZCfbs/
         cmq4aQSKlecFYmsKxnhb4otc+pOHteYpb+8cSofqVZUiuyJVXhsU0dyc8N/HXCdW0ccI
         VWqFmogtxwbl37VA79OleVfiMrfER4gCimj6zEOSnSMrIVdIiy/6ZsN7mfqhl2n6Ao0G
         UZLOEykqUpIql/rtmnHYnuBSKBz2vrCsem86ONnHQQamdcCXTmPKvnIrYcaJZtBocpL5
         liwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405730; x=1746010530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izklXv4BZeIiwFrKYnOhuYZikqixEWPdKCdY/Q0QGIw=;
        b=RImL7Jkx4jj5yVuZe6m0QX9fjOnZOpfw9Bxd3Iz+GR2VjxdRXrInZTPtKAyNHANOKn
         DO9EqaZKuJxbVgPBi8o9ER0DmpM4pYEe+o7IVloGVXLlXuQ3gMF9M8RQsFLpzQW+xCfB
         wesHi3/GGD7Yp5Vnhm/yrx4cnavovRI3xsLB0EqWDo4r0zqnul/rTqOO+poVEpI45LEx
         Y4SFBQPhOCzc42T8nG8+6uBxeCs6sCmL3nCsAaQhIkXi3NZPrDFiRFl5aWIWh1AYxEqB
         KpPkI3/WjTdx6U8gJMCIBbnEJqX+dMMbMaWBjthqajyfsZ1GEo+XVRxVz/YMGkrT/A+2
         VGEw==
X-Forwarded-Encrypted: i=1; AJvYcCWTk4VfWp8mqNssbIaTvA8jqIfZ0MlHmw3yE8G1wIukEX3mv6lymxDlLNuMrwzwICwtNS4Sr2bydaNnRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRvaRlKsIKZwwrwuRG1+mzRDJnUU5t+CA44Xung4JRHNlQZiJ4
	G0z/cofSReu1D/v4Nug5A0/Vl/nhfTTfDUogMZp53O2ymplSC7HarDYQ83TS13x5OayWVhPqdMc
	nMG97GMoDpZwef8gDPh94Gi9ska99hJ7hZroCtw==
X-Gm-Gg: ASbGncuKqMKXzL+8JLeKyGOUwVcTCGMZszDj1hYTSg6NNJyLPD028p/lY3Edwuts/dM
	AJmoJGDGYlQN40h7dIu1kJa/xu1eh2JVCIhW7W9JB9jV8t4J5f0N3QR/lNfrF74A/UyGINe9oMm
	r64QpHUyYvisjqlT0W3NW60g==
X-Google-Smtp-Source: AGHT+IH+wCC5kClOVa4KPQf9TkYFzC5VIZsHRFGsDXyoHjryg0sqITG6UMuWyQQrZUY+WCXhYGb106JflCU2vKSyjt8=
X-Received: by 2002:a05:6512:2315:b0:54a:cbfb:b62e with SMTP id
 2adb3069b0e04-54d6e657553mr6996509e87.35.1745405730442; Wed, 23 Apr 2025
 03:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com> <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
In-Reply-To: <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:55:19 +0200
X-Gm-Features: ATxdqUFXqKFRF-URPzhUFDAqkzV6vbnyL8yKyfMNTaK_xdGbJBDYNfkObBbEMA0
Message-ID: <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035532_604433_D76A6B3F 
X-CRM114-Status: GOOD (  12.38  )
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

T24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMTE6NDHigK9BTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4gd3JvdGU6Cj4g5LqOIDIwMjXlubQ05pyIMjPml6UgR01UKzA4OjAwIDE3OjA5OjQy
77yMTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiDlhpnpgZPvvJoKPiA+
SGkgSWNlbm93eSwKPiA+Cj4gPnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+Cj4gPk9uIFR1ZSwg
QXByIDIyLCAyMDI1IGF0IDY6MjPigK9QTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4g
d3JvdGU6Cj4gPgo+ID4+ICsgIHN0YXJmaXZlLGZvcmNlLWxvdy1pbnB1dHM6Cj4gPj4gKyAgICBk
ZXNjcmlwdGlvbjoKPiA+PiArICAgICAgVGhlIGxpc3Qgb2YgaW5wdXQgc2lnbmFscyBmb3JjZWQg
dG8gYmUgbG93IGluc2lkZSB0aGUgU29DIGl0c2VsZi4KPiA+PiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQo+ID4KPiA+SSBkb24ndCBzZWUg
d2h5IHlvdSBuZWVkIHRoaXMgaGFjay4KPgo+IFVuZm9ydHVuYXRlbHkgdGhlc2UgcHJvcGVydGll
cyBhcmUgbm90IGZvciBwaW5zLCBidXQgaW50ZXJuYWwgc2lnbmFscyB0aGF0IGlzbid0Cj4gYm91
bmQgdG8gZXh0ZXJuYWwgcGlucy4KCldlIGRvbid0IHJlYWxseSBjYXJlIGlmIHBpbnMgYXJlIGV4
dGVybmFsIG9yIG5vdCwgd2UgYXJlIGFuIG9wZXJhdGluZyBzeXN0ZW0Kbm90IGEgcGhpbG9zb3Bo
eSBkZXBhcnRtZW50IDspCgpZb3UgY2FsY3VsYXRlIHRoZSBvZmZzZXQgYW5kIHNoaWZ0IGxpa2Ug
dGhpcyBhbmQgd3JpdGUgaW50byBhIGJhc2Urb2Zmc2V0OgoKKyAgICAgICAgICAgICAgICAgICAg
ICAgb2Zmc2V0ID0gNCAqIChwaW4gLyA0KTsKKyAgICAgICAgICAgICAgICAgICAgICAgc2hpZnQg
ID0gOCAqIChwaW4gJSA0KTsKKworICAgICAgICAgICAgICAgICAgICAgICB2YWwgPSByZWFkbF9y
ZWxheGVkKHNmcC0+YmFzZSArCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW5mby0+Z3BpX3JlZ19iYXNlICsgb2Zmc2V0KTsKCkNvbXBhcmUgdG8gamg3MTEwX3Bp
bl9kYmdfc2hvdygpOgoKICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldCA9IDQgKiAo
cGluIC8gNCk7CiAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2hpZnQgID0gOCAqIChwaW4g
JSA0KTsKICAgICAgICAgICAgICAgIHUzMiBkb3V0ID0gcmVhZGxfcmVsYXhlZChzZnAtPmJhc2Ug
KwppbmZvLT5kb3V0X3JlZ19iYXNlICsgb2Zmc2V0KTsKICAgICAgICAgICAgICAgIHUzMiBkb2Vu
ID0gcmVhZGxfcmVsYXhlZChzZnAtPmJhc2UgKwppbmZvLT5kb2VuX3JlZ19iYXNlICsgb2Zmc2V0
KTsKClNvIGNsZWFybHkgdGhlIGVudGl0aWVzIHRoYXQgeW91IGFmZmVjdCBhcmUgaW4gdGhlIHNh
bWUgbnVtYmVyc3BhY2UsCmFuZCB0aGF0IGlzIGFsbCB3ZSBjYXJlIGFib3V0LiBUaGV5IGFyZSBu
b3QgZW51bWVyYXRlZCBpbiBhbnkgd2F5Cm9ydGhvZ29uYWwgdG8gYW55IG90aGVyIHBpbnMgQUZB
SUNULgoKQm90aCBwaW4gY29udHJvbCBhbmQgR1BJTyBoYW5kbGUgY2hpcC1pbnRlcm5hbCBsaW5l
cyB0aGF0IGFyZSBub3QKcm91dGVkIG91dHNpZGUgc29tZXRpbWVzLCB0aGF0J3MgZmluZS4gSnVz
dCBkZWFsIHdpdGggdGhlbSBhcyBhbnkgb3RoZXIKInBpbnMiLgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
