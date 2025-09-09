Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57970CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZsKUKmTXPIwemqZgrf6Dy8EUBwC/IcLAT0YQQ9oxXU=; b=LfaPM6HgVBbLaE
	bcoqT8EN3XrfmMNs0sH0cMOoNg2NFHdfSC9AiQ565ybdZlarZwCo6wmDYSmOu0BZr+VUhP+YSaYxV
	dVOlVZwUb94WuzP6QWcRo0SJy6s1yIAs8YHgrMIQi6jQkDDYemL4ehn95YH6EYhf4Ob1XzUee+yHM
	cec6PmPiPYD0TQmC3QFYcRoK9fh+dVDC67N5kqf5pM16yAulTGwCyh5VdLL+IuRteKjkQciaBMHcl
	Z3gMvhZVPKxOjHMZbPMKzn/4LyTBYhK/MCZbA8X74efnszj7gR2zfkI54JbpSrKg/lvKO8n4Jqlx6
	43pgu84uwHJXlYj0zUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0XT-00000008FWE-2rPG;
	Tue, 09 Sep 2025 15:45:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwd3-00000006mNt-22xs
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 11:35:19 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f76277413so6292962e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757417716; x=1758022516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=irm4VK2loLiDOIXxKob0Yf5+2D9iGpC2tV2v8j5KJev1yQqnO9UfPuFUJvcULUNx9i
         sk/XmpX8ew8Uu0Vq8nD5Es5D6kZWwnhnwbBLJaaJQwVjZTbJezZ3SXKglVLSfaiaqnlm
         hQkB2dAd9EhYdwuekI01bNW21VSR7T83MVn8b9Bz77gpyQbKzTfRAx6yCe/6MN3GG0if
         55lL1mZlnKBufRLDK9gGleDU6Dm+bA38u9LGO3VPBmtWRkyXElLTuvfOvEQap67TKvWB
         PI4HOep1I1K1X61PbGD1AVewOiDKbwkzlNSgYM4QQsj3PQd11SdqHkINBRWbtJs6J4M6
         ii1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417716; x=1758022516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=EqEsRiuwYIW2aCoF/ulNjCrDonnmq/2PX1KSobZcT+ZH+yaSjFfppoXbTW72fWctuo
         uHqoWquHdxW1ttwq1ZwUviK4K4NIgekyaKXCAmtDgQHWgHaFLmLyIRvK50nXE8AF0sHS
         p6SUmMHoZvafLC2ji065t4J2zY3VCD+yDt3cXFw4zS1LAeBlV6YlUcAOKAaSSu/zhFqR
         y3gyM4UFBRBQ/howPNQcDg1TMaxLPSr3L1PYowTqsYObSYFPLHnJmvyNC6L+3GDSh5jC
         papnwo3wf359cuZ99Ds3SzO4dULr9+J1zk4uvybKpR1czJX9Hkmb/HfbKzxkezH7OVtY
         y3rg==
X-Forwarded-Encrypted: i=1; AJvYcCVpArwqvBzJ/3bYyi8OSfa4kRadWIRY5FcczPhAAxTXD/z/h0jUBK6kgInStTKj6jgGbEP/drVUcUls/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqcqEbUldVntYYr3kHvMq7RzrXOMCzglkrvLmNenmR2VIvWPAU
	/4sQAlvegWt/uJATj7tdy7dRR9C3Z6wmHlCC3d4kFKOP2e9e08AZ5jAEuGpcK7OhtSpcYVbnojq
	sLLTSps2KWgCRuIVZQOK9L5mWyOHkknfiRFr78RyObA==
X-Gm-Gg: ASbGncstuIEc3ZxdU/axm++Iv+/elQx7HcdLmjoj8QZe+g8s9kt7yjvqLSIJx9nXXE+
	yXiNkpF8keqImpFN9KqgRFgw3SfOAiAhwPJ/lY0daeb/bZHvN14Cv9YzZpQNpfIS1nLU2p5dPKw
	DWTmGFMvHj9ECu8e+birP5kj4kC3rs91i2ZYTUkZ0qj3Xmwsdtc8LMfKWSvJEWTpOV4tq3dKgLC
	xccm9p6GVW/CAV4RIyJ0JZ+RXDkrp1TOcmOHZGGBZVL3+5hWg==
X-Google-Smtp-Source: AGHT+IHWd+/2o3jpP5pFKotnmfcWTA0FpdlTJ7xwTNOp9WJ3bLpmlAirprq1zjBteK7SqJBfI4YYAjx9R2Xs8MJv8vM=
X-Received: by 2002:a05:6512:639a:10b0:568:4ae7:8371 with SMTP id
 2adb3069b0e04-5684ae7fda5mr659891e87.4.1757417715746; Tue, 09 Sep 2025
 04:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org> <aMAP9hAWars0T83r@smile.fi.intel.com>
In-Reply-To: <aMAP9hAWars0T83r@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 13:35:04 +0200
X-Gm-Features: Ac12FXwO2LcDkWGWZohqu8ChVnTISfR-cQj8e5EdoM33wEcP1qEQLJ7mzcbrqVk
Message-ID: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250909_043517_531125_AF23F7CE 
X-CRM114-Status: GOOD (  13.11  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCAxOjMx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQg
MTE6MTU6NDBBTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+Cj4gPiBDb252
ZXJ0IHRoZSBkcml2ZXIgdG8gdXNpbmcgdGhlIG5ldyBnZW5lcmljIEdQSU8gY2hpcCBpbnRlcmZh
Y2VzIGZyb20KPiA+IGxpbnV4L2dwaW8vZ2VuZXJpYy5oLgo+Cj4gLi4uCj4KPiA+ICsgICAgIGNv
bmZpZyA9ICh0eXBlb2YoY29uZmlnKSl7Cj4KPiBUaGlzIGxvb2tzIHVudXN1YWwuIFdoeSBjYW4n
dCBwcm9wZXJseSBmb3JtZWQgY29tcG91bmQgbGl0ZXJhbCBiZSB1c2VkIGFzIGluCj4gbWFueSBv
dGhlciBwbGFjZXMgaW4gdGhlIGtlcm5lbD8KPgoKSXQgaXMgY29ycmVjdCBDIGFuZCBjaGVja3Bh
dGNoIGRvZXNuJ3QgcmFpc2UgYW55IHdhcm5pbmdzLiBJdCdzIHRoZQpzYW1lIGtpbmQgb2YgYXJn
dW1lbnQgYXMgYmV0d2VlbiBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgZm9vKSkgdnMKa21hbGxvYyhz
aXplb2YoZikpLgoKSSBndWVzcyBpdCdzIHBlcnNvbmFsIHRhc3RlIGJ1dCBJIGxpa2UgdGhpcyB2
ZXJzaW9uIGJldHRlci4KCkJhcnRvc3oKCj4gPiArICAgICAgICAgICAgIC5kZXYgPSAmcGRldi0+
ZGV2LAo+ID4gKyAgICAgICAgICAgICAuc3ogPSA0LAo+ID4gKyAgICAgICAgICAgICAuZGF0ID0g
c2QtPmdwaW9fcHViX2Jhc2UgKyBHUElOUiwKPiA+ICsgICAgICAgICAgICAgLnNldCA9IHNkLT5n
cGlvX3B1Yl9iYXNlICsgR1BPVVRSLAo+ID4gKyAgICAgICAgICAgICAuZGlyb3V0ID0gc2QtPmdw
aW9fcHViX2Jhc2UgKyBHUE9FUiwKPiA+ICsgICAgIH07CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
