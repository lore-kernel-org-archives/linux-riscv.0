Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09797D6406B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 02:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvAG21Deszpp5MxpD6ccvGDFykgKw1UFFx+/ddvF2HU=; b=rHow9EmGX+3PUo
	CPlZvHRtlmw2EU6UVAUet65Njk1ew3Akoc9lvVqbNgOXM/BjVYLoABVzzdkZoTROkpSOv6V1ttGIL
	WoWyx3bAF+S9I2nCfa0uLTRKai4bFP77XAul7BoDpUBSJ0XJyZ4JH5Gn5R+I5v0GwBFq4K4hAHRcn
	jCBF592nprlk4ybIsFk0A3vKVwyZcEZR3gJx7n6i+TJj1c6slo5sVmvSB+/Kxo7uGBc9c++WzX4rp
	j0Uo6+HTZGRm3oPk8+WgQReD0OyvLQkc9DyG1hUCFPzI6d/eJZjpUykIOlG6vmFmSn+jm50tPj1nq
	fj+Gq491XxiPThzYXBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgvp-000000062pl-0WUb;
	Wed, 17 Dec 2025 02:06:25 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVgvm-000000062pS-051v
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 02:06:23 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64471fcdef0so3934862d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 18:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765937181; x=1766541981; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OfiOZIpxg0tDEyK2KQTYkmCtCk2RA8OzRoQCSq29r0=;
        b=Nyk5WuaZEjZBR7xD6XRd6SLyBkAQcVL0Y0oq5c2BefPWAOMWeCgY+DcdR9vfCeqHP4
         Ub9CKn5vwjGSe4yHhg6jDZsJEKT/EpybehjZVFWyvYXz2ApYjwRj6QUzMhB61Jb4/i/6
         W/m7bNlyK4YUgYanJupRcu8EGshcDTEKzNizPDzep7gyfxZ3PGDGoQQefDMM273Hkh/5
         ImpJcXTTcsU5oDFY6K9uLL+iUBBjTuhA1QU2awEWlMb4Gs39Ne3rqPoXIzMYQQDavc4H
         amviQUbRHqOc7l9nZhOK76MvcZWA3+IA/wE/ud/RKygsWAgi6M91uSzWYJBp0uHqJmsR
         GftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765937181; x=1766541981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OfiOZIpxg0tDEyK2KQTYkmCtCk2RA8OzRoQCSq29r0=;
        b=n40u61p9hRTDIFFdNVeMipZWo5bnKYqhvlUKsgQSdPQgUyWZiDlV5QvCAod+qhYuJ2
         CPJ6tSsdNercjBbdrFaWP23EYg0/RUXGETqCBaIFbtL0MTF9ZdYmtxvI0LIAZVu5x+Iy
         VMVHOClJ+Mtl8R5QZNczIx+daRjAlc1fMkt8Z2fZkXi7S/N5yrYF32/mzT7PXiALlvNM
         nNwHLzlTZTxOVZgD9iTGrHdhALLuhBt0bAq2qQMCSNmyg+32sC1bDXtEvpQbkZM4UHJB
         V7LpSZH0OtOetAD4ChXyRTPCIqydMmvJ8Vcv1lfUtKosIeHcL+ibK+PPkpd1fRyNfGvJ
         lAJw==
X-Forwarded-Encrypted: i=1; AJvYcCV55ZHlXbT5wQGBb7gO1C4/7a2xLnx994DZOZ6C/ibL8v7mVvoVknmGBZO0hEWGvlDj1CGNx53HA39jwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKqt+KlQWPo3tyofKd/2COf5jrD5tL6J03IkNbsmvzclM9xpO
	u8WSnkJd13KlXEHDgZ0l1ngQlYs8TynWMCDrAfCS/73sumL4I2DJiIyNP2OgxOEOEfFzGl/hYBt
	OBIF/cVRy5vY9cwJRUdKNFM2p7yDyDp1Sv40f3EebHA==
X-Gm-Gg: AY/fxX7IemgyI8TVVVPvRJ8eCwM17kTlyn+OzFO8MILnc7HdjVy51x5HvQSpfy7gK5A
	MiIW3Uc6jeCkhbhZBwKTUnbrudac39Xzz5lbdxTnhcD604RfuxmjHNt7J/FwUu69QtPLxIvLMQ/
	4AC0O2u4C4Hhb1k2E4iFNIoFnEwwjEt+qJMggFWmEKw2twimakbSUIZwcZdrgT7HJmxpvtIzucl
	iw9YcsH09oHdUMsGUvxAb2EKLulBcQjh9IA8s/xMapcaySBEbMVZLNAtgdmEQSsGU1VtscO/tpT
	b4Nb+jM9J/70EXceCo8WlQSiTwrCuD1w7tdlnkBQQdjd
X-Google-Smtp-Source: AGHT+IFjkXFLSpb32ATeMly6o52Ldy94ZE2+rmmrjPmVwuAfzYm/nWP3oN74EKDLdVk0KisKe/00zmf/rjIbLwNuY1U=
X-Received: by 2002:a05:690c:7088:b0:78d:687c:8583 with SMTP id
 00721157ae682-78e66cded17mr282776567b3.20.1765937180750; Tue, 16 Dec 2025
 18:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <20251216150748-GYA1937017@gentoo.org>
In-Reply-To: <20251216150748-GYA1937017@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 10:06:09 +0800
X-Gm-Features: AQt7F2qw6wE-Ygw0dsVQyWLoaQf00ZTdNYPMUaVd6F0gE6fbGRiPsUhouMY1MOc
Message-ID: <CAH1PCMYQhDf9eNRQYTaL3KjBCUC+ygXFKTOVqULdp0UNAM=wXA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_180622_061010_93BA60DE 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MDfigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24gMjE6MzIgVHVlIDE2IERlYyAgICAg
LCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgU3Bh
Y2VtaVQgWDEwMCAoUlZBMjMgY29tcGxpYW50KSBjb3JlLgo+ID4KPiA+IExpbms6IGh0dHBzOi8v
d3d3LnNwYWNlbWl0LmNvbS9lbi9zcGFjZW1pdC14MTAwLWNvcmUvCj4gPgo+IG5vIGJsYW5rIGxp
bmUgaGVyZQoKSSB3aWxsIGZpeCB0aGF0LgoKPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUg
PGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+Cj4gd2l0aCB0aGF0IGZpeGVkCj4gUmV2aWV3ZWQtYnk6
IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgoKVGhhbmtzIFlpeHVuLgoKPgo+IC0tCj4gWWl4
dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
