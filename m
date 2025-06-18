Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D6AC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp7f3mYkFL4x9JR6RgrfBY9ZBLptRB0vuWoUL7gnZE4=; b=dg1x/MfWdQXv2t
	N74rZFstZxjLtZnYnjR7yat7fI1uSPcsNTFZ2NE/HxUxm5uvFiO9glmt9yEFW/921p3W7hrUMAyZU
	5Ma9O4BCBySDhvSys4hlv7OWE/B5A54R6AnVXrRxmfHqb8EC5YGnjVDWbLOETGJ7AhvYjbAcajnTx
	9b+VOp7Y2AGFPsz24/vb2UMWWjnW8JdXoCoCa2Z330nWHU10ZKTlN3PIl+zNMJIeZjYZaBRNAXU2G
	yyvv6FR++ku/M5iqX/Ec3+IYtpJ8FxxLR+OBlRIirojq6AA+9X6cFPfKqH3KkLmc8k4KFSG+Ch7cB
	u339ZvPhYwIr+Zre59Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwYn-0000000Aqsh-0zDg;
	Wed, 18 Jun 2025 17:26:53 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvav-0000000Aiz8-45Qq
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 16:25:03 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b82f3767so4741412e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750263900; x=1750868700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=JXmzviVNST25/LQmRPdEFIGLbHrvaK/LwqiOsP5GEHH3xkocFmzOR53WaCMnQLl5b7
         RdbcDyfU2Ap1YWDzg34SMlaczXMihBUGXWpNaiXiPKwErsAaFbHe4xdlOgna9GhxwpGI
         9MerJoePyteFP1K1mwXVVkQ+zBaeu6Ca/D2VNJDT5ZPfwxH6yDkIDH7YNulhlZbIVAM6
         iSB+GDCT5Nz3DlmObfEzvQmvEZSZ/m+boBurDuuqlRdGSUpTTFvfSeZ9hupowOHkBUq0
         Fy1yGdnWixH+7nPLwJkcpkoMTecxgrNplM40w946a2Na8YaytGMWAxAHVgRpWayC551Q
         xWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263900; x=1750868700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=EIDho2WjxndjKGfsNIAXWwYorwW4VhV81/ER+ChasLIRC56GwfIv3Ro1lOKj4IVO1p
         3hcqjevw/ViemGfM9Y5EPbp2Vz6TJ02ekfkK7MI20l/HaqoppzG/MA+T37jvdtx7piDZ
         4+9SRk6RB7Jn3F4S44ZfVeRdvkSTke4H04i9uiPelpZaC3Ka5pHAKTVzpIzSxreLph0q
         svuKAcPmkCG+bEtAyRFPCHQ+qpoVmuLFxltK7UV3Hq6hgKbNRUEko7gqeZ8ytFt8xdyS
         ipnOCUHiEFyvOg3GadiS4DGplXx8/1pavrzJtQwsp+kpHUT18NiwuKC2rh4Gklh+q2gD
         MpZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpX1/rBWzQFqu8kTRDWpq0IDGdYNwjYCzg6Uq2Dl8nDF0SNB+jOB3iL3zpKodg8OfTLIuxtHYT8u21JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PtZCrlaBJPXiBYEXZLcJ/px/z+e9qf6jW84bYnldl9kkYo+c
	enbhcJ2dcRU1w4NJWRLsPNIeECBoMSz76Br75dcuBX6vhcbiwWOAO3caNFvBqY7SvRz1+Htk/pP
	9TMSqKdwYn8Ov2faFm/ZSwFEsBY+YwS03UPLYF2qvRw==
X-Gm-Gg: ASbGncsurFpDb/Qbai/EHQnY+tAiW+TZQO4i6WM6w6RM0NlJwW/m8izcXTgU9kguNcV
	IEmCKx97LfOmg5/AV6U8mokwPrBq53RBRVk8fcS0PoR65gv0BtHIR4WDwEBRG7fo+mn/Io9b5IR
	KHrjo1sAxPoKHDCg2BCtezcU4bR72Afm4/A7cOehF9cOIGjreLXw5HBIazH31y0pN0o3Xnv22q2
	w==
X-Google-Smtp-Source: AGHT+IFasWzMx4vvKMGThkbIPZ5HFR/Wr5hiH9hJMS02hBIeQh8p7hArmnTCvxt1VaP57eg2rHdU67rWBwbdr9GK3qY=
X-Received: by 2002:a05:6512:1193:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-553b6f50256mr5473373e87.57.1750263900278; Wed, 18 Jun 2025
 09:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
In-Reply-To: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 18:24:48 +0200
X-Gm-Features: AX0GCFtQiRTdcvRzM4v3bXKNF4ikUT4N9NzJhHCtHKKqoMjJz7WLf-25661k3ho
Message-ID: <CAMRc=Mc9_V8bkD_FyNkxkNoD3Fe7q-CC7ifq3TrD=r8+D_UgKA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_092502_207652_39A799C2 
X-CRM114-Status: GOOD (  14.56  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgNjoyMeKAr1BNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAxMCwgMjAyNSBhdCAwMjozMzoxMVBNICsw
MjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IHN0cnVjdCBncGlv
X2NoaXAgbm93IGhhcyBjYWxsYmFja3MgZm9yIHNldHRpbmcgbGluZSB2YWx1ZXMgdGhhdCByZXR1
cm4KPiA+IGFuIGludGVnZXIsIGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0
IHRoZSBkcml2ZXIgdG8gdXNpbmcKPiA+IHRoZW0uCj4KPiBJJ20gc2VlaW5nIGJvb3QgZmFpbHVy
ZXMgb24gYSBVRE9PcSAoYW4gaS5NWDYgYmFzZWQgYm9hcmQpIGluIC1uZXh0Cj4gdG9kYXkgd2hp
Y2ggYmlzZWN0IHRvIHRoaXMgcGF0Y2ggKGluIC1uZXh0IGFzIGI5MDhkMzVkMDAwM2NjNykuICBX
ZSBnZXQKPiBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBkdXJpbmcgYm9vdCB3aGlsZSBwcm9i
aW5nIHRoZSBwb3dlcm9mZiBkcml2ZXIKPiBmb3IgdGhlIHN5c3RlbToKPgo+IFsgICAgMC40NDMz
MTldIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2
aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAgd2hlbiBleGVjdXRlCj4gWyAgICAwLjQ0MzMzMF0gWzAw
MDAwMDAwXSAqcGdkPTAwMDAwMDAwCj4gWyAgICAwLjQ0MzM0N10gSW50ZXJuYWwgZXJyb3I6IE9v
cHM6IDgwMDAwMDA1IFsjMl0gU01QIEFSTQo+Cj4gLi4uCj4KPiBbICAgIDIuNTIyNzYxXSAgYmdw
aW9fZGlyX291dF92YWxfZmlyc3QgZnJvbSBncGlvZF9kaXJlY3Rpb25fb3V0cHV0X3Jhd19jb21t
aXQrMHgxOTQvMHgzOTAKPiBbICAgIDIuNTMzMzMwXSAgZ3Bpb2RfZGlyZWN0aW9uX291dHB1dF9y
YXdfY29tbWl0IGZyb20gZ3Bpb2RfZmluZF9hbmRfcmVxdWVzdCsweDEzNC8weDQzNAo+IFsgICAg
Mi41NDEyNzZdICBncGlvZF9maW5kX2FuZF9yZXF1ZXN0IGZyb20gZ3Bpb2RfZ2V0X2luZGV4KzB4
NTgvMHg3MAo+IFsgICAgMi41NDc0ODJdICBncGlvZF9nZXRfaW5kZXggZnJvbSBkZXZtX2dwaW9k
X2dldF9pbmRleCsweDEwLzB4NzgKPiBbICAgIDIuNTUzNTE2XSAgZGV2bV9ncGlvZF9nZXRfaW5k
ZXggZnJvbSBncGlvX3Bvd2Vyb2ZmX3Byb2JlKzB4ZTgvMHgxNzQKPiBbICAgIDIuNTU5OTkwXSAg
Z3Bpb19wb3dlcm9mZl9wcm9iZSBmcm9tIHBsYXRmb3JtX3Byb2JlKzB4NWMvMHhiNAo+CgpUaGFu
a3MsIGEgcGF0Y2hbMV0gaXMgYWxyZWFkeSB1cCBmb3IgcmV2aWV3LiBQbGVhc2UgZ2l2ZSBpdCBh
IHRyeSBhbmQKbGVhdmUgeW91ciBUZXN0ZWQtYnk6IGlmIHlvdSBjYW4uCgpCYXJ0b3N6CgpbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNjE4LWdwaW8tbW1pby1maXgtc2V0dGVy
LXYxLTItMjU3OGZmYjc3MDE5QGxpbmFyby5vcmcvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
