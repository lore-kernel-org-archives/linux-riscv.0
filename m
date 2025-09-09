Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F052CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mG7YPNXdZ6BKj84CxBht6TSrsmU3Y1xTYv2LgQdwYNA=; b=LJbD+cc5gy4EQ0
	ery9yC1OjDunf+cs3SCOABPt6zf+GVP689bzB+fJds1fjiq6BlOUxi1wsq2kav3ErOK0MZ24mPmDl
	pvA2wfa2nwv1vlQFQy8FMv2AU4M13o8Z5JSRErLU/fVHi/A2kuj/qu1WHs0gRaBZuSzefkaI71dOk
	SVtvZO+3VjI1n7fWEJiG78QKS6a78SOWbcaExs9oNnnJ79tkDBTGC4njGcUGwnYs+/uCFbZZS4KHz
	8InbEvFztP0mYPfRywSLYO7F1u5rUjtcFFjPMU0TLLGIrx9bGQsLDOYVab7a8j0UDn3SYLy7cQXtP
	O+dV6chZ2ybRaUSUWZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20v-00000008vrv-0i4X;
	Tue, 09 Sep 2025 17:20:17 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyq7-00000007YfH-1sjJ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 13:56:57 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5608bfae95eso6355540e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426214; x=1758031014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=Sp8d2xwmKwr3jVr5l9GXWmWjIi2tquewIqa+ZdWdW4Fylf7gKvhpj+hFX43xSvACv1
         cxvMXotkw9Nm8EW2KGfoscZsjYtWyRPQmMzW0z5BM3EpoUWmIDCbVTcwtixKPryiAtOv
         W041K98FfQyU0wCbje7kF7xU37YcXbx+rBXNION5MndJARMAd2Z3BHcn4vzODJb1o30t
         W83oOjRrxccGo+b+z6agsUAAkOJmiZQhBmGyKYZYHFQasanA3wQJPG87YaNzlKda0axL
         gy8x3++EYVVBlyZKBn4SP+7w1CIMIDpFkOjdvkwO7xDRszuqDyddS2T1Wgj8+PQ/Qk2w
         mY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426214; x=1758031014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHJeyQoxrfPmUkZrw+WhWWyRIvgBswo4VP/FGQPO7jw=;
        b=eFrCGpbRGO/7XBnbrVuNAkW1SG2ee48qVdrmxTV15anOkvV6yFKddVmcqWdEIdrfhT
         dH67I2aPA6n6YbpK3rStDncJfaj9vWVvDnJ7ezy+CzzOxGKSk70H0cIZZjayXAfOqGP1
         JPLlG8zFX1m1K+nZ9Q1cK/X4Ab6N5RyuE7g33AQ/9W9drkjk4BT3Putv4++QEPDDPRA+
         WTUz8n9H7QrrxSScEmthCRYxtbXEA4UWh6JJi09e24Yiq1oDndAZ1kxlNIlrmjmTkFvO
         lBmkIXM/bDscmELHEOg9r3UAA4DODWK9owIf2aaitTRkGkIAYersKBq2gN5Ac2EeJqjN
         4VLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkRyxpyGrMqTWrjMyQGZbQWdKAU0BBAfyD0+VXi9AWVnA8W3cc7W2JnnbG2F9D26QZC/oeVF67h8spBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YygTClkfY/MsU2gZuW4ST5DdT0h1qUmiGypYMBD2v5cNpPPDbm3
	IdHfoD+SzOVl2jeN9w4YXUVP/zvw5l0BRbwmupg40nvfIAQs77wFTSASbEDMZvhp9A/IUfvoPWp
	gpJ1F5UdAgxCiaf5LRfyyMHHMqxxDCnSoUo7sWCkqOQ==
X-Gm-Gg: ASbGncvXZMDx+vjHobaAWYE/a40u3a7QGdz57Qx7vbDGX71SlcGQuB3AOsgKln2lG0d
	xIO/z1ulpGh3Nl0vR7fxptlIkKMsD+YdvJgPmDgmJK8C1WVdszHc8Pfyzzr5K3AhFPjliMXZZ6y
	RSN+Qx99sE5BV6ggYVmREewDYpFtw6rLz+EItp193QuNEtTKah0HgGqmqTBBt5t6rjbI4/9dz/W
	ZBf032HORtC/BuppswXiT1WuvQ8/CBR5Bi7faZssL7dQD6tRQ==
X-Google-Smtp-Source: AGHT+IHBxkyJPoP3osXnpgBU6pdsryw/ot72GCgtbXz1ukCkdeMh24NQ6AJOJ87AcYe5pD0xcM8OlZUSXTQKermPfKE=
X-Received: by 2002:a05:6512:b8a:b0:561:9635:5af5 with SMTP id
 2adb3069b0e04-562619d971fmr3883543e87.48.1757426213571; Tue, 09 Sep 2025
 06:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 15:56:41 +0200
X-Gm-Features: Ac12FXw-xJdDcWBTzEH08jjeniZk8zNeWwiQ6jDsDwHAH3I_S_ZPt9IHyI66KLg
Message-ID: <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065656_124257_616EB5B1 
X-CRM114-Status: UNSURE (   8.22  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAzOjQ34oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gVEJILCBJIHRoaW5rIHRob3NlIDYgYWxs
IG1hZGUgdGhlIHNhbWUgbWlzdGFrZSwgaS5lLiB0aGlua2luZyBvZiB0aGUgY29tcG91bmQKPiBs
aXRlcmFsIGFzIGEgY2FzdC4gV2hpY2ggaXMgbm90IQo+CgpXaGF0IGRvIHlvdSBzdWdnZXN0PwoK
QW5kIGFyZSB3ZSBub3QgYWxsb3dlZCB0byB1c2UgQzk5IGZlYXR1cmVzIG5vdyBhbnl3YXk/CgpC
YXJ0b3N6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
