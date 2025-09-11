Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BF1CAC587
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6J64Xkr2xJzSm6Q+SY4kaeBogjTALwXNzhW7AaGQPLk=; b=hY/SGrXM5aLkGV
	Y3QS+RKyDwXqgRXoNvS+3IhXW6Hgv/X8IHW+q23QEU/VBXEpd7EV0gUpp5ThHB0OOn2QZlO8LpOEd
	6+cI4XEvkpfOKPN1dEisj/3ZCPTlmfUMfiFB+Y9yA35ac0US4kIqKaLgY0r3zJxowL9IziDTGi1TO
	+5W/V1rET5rNhd7U/4AUFvU+eAQyqWQ4xoJQXFzX65c7XGxHRmVx3An66h9gwA7mTb77S49NWe56g
	RVfkXQC3eEI20nuZr7wHqghSeU1BG9QlHcxKk+kQT7Z8tGGnVvTFYpU7w7wCGFAQZdEZZ4kZza+Wa
	jbRSBBgir1Ioq6OSFH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAg-00000001e0v-2RK1;
	Thu, 11 Sep 2025 07:56:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcAc-00000001dvp-2mqA
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 07:56:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5608b619cd8so456967e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 00:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757577401; x=1758182201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=qBq8T5GDwgLhlPcZ1nVKXFo+M7OlVFB7rb27r2PqfKo8zNhne7sPA4CcrOb2l1uN9C
         UpekQBze864DJWQ6TXPJTMzzueNQrxTjDeX7uaPdqFgZpVa52kLlu+F4VSsPeDZ89Hgj
         tECMwaF7Kz3ZeutpKaOFk6fNYi/eAoJPvbcU15vVSs3dcZjGmSCbdO0IyOLgAjCbPtJi
         8LyBL0DwT4p/0/X6rzo07bqKQHJEH/LjuRiEeA4lVLfZY4C1uWK9tKgBeVczroh1fTmv
         DZO9gOGaK9EUDXQfW1nbwOtM2T3lnTZq/83vUf4rhC641C6AfmS9cTaodL9aszqnl9lw
         lOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757577401; x=1758182201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bep7Xid77Fho0BbSmSLtdgFH7ZgtGYRYV4JpO6GqPMo=;
        b=nWpKS6Ge8N9ObAXsXxWN5qj5lrkuPfeh0MMoOpJ1eCdDeNfbz/lYj7NNoGOKB/VAmi
         BkHFKvz9wG7uoadLrOxTO4ROPVmI4ZqYCW1cOPkc2gBrr5y1N0Z1qH9vl/anZVDZK0jZ
         LxGqWgj129j10tT7eKjKd+dYN+8ew50l/NtXP1Mpb2SJmGbbrDvk9X3sB4eYBLYJEHts
         cLmy+H175x5PijF8DllBWkFZltQmUfTwdwcZeKOOswpjBHalHl2CrycUrg/ZWhqwohN9
         IXhatgyJSl/e/RqwKyjculBSNZ6anm1XPRj5pb6vYv8Z+Os4hE0iH1/Jo1gaxau9igis
         wOAw==
X-Forwarded-Encrypted: i=1; AJvYcCVAtr3YhlIuUppTnNuRAC5TzMFV9jpNlRvPBE/QyC9rM+KiMEfGDTF9lizuy0NyQ8O2K1Uqi78TuhddMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxho1irx4iOxumrglLCZZpuSk++2UbDos4gQKRY4m9mEAM91pJq
	KjTbRR/nLvx+UJ9KNOPF1iNG8QGn8tWZbqH9iCFLdXdoptUVwDuVD0sYul8d52yQ/egVczOWkzQ
	OyycJB4DAa1JJG+8gZy1JbBQfvK+Ic41NlAKBXKSWtA==
X-Gm-Gg: ASbGncub0H3kkS5gE9tSq+08IAnl9wpqR3bJYXrO08wpNjflEp3hhhSrT7TdnnCsa2g
	ykW4UAxfBqMhhGWdGIIywuuLzlQmW3Hsl9mOqciUTWkfHsUoJ2O368MpEXogwJJx2UKkTsRT9V2
	sS10OQm3+ZvHrVQJIY1ZLMo+1NDiYGzyPCb3RW0Ptc/TqzC1XqxERf4lR6GT+/knU5RZcoNvctG
	BhmwCxUyP/tqbjtF5ko7JLx4azp9AxclNzaMRo=
X-Google-Smtp-Source: AGHT+IFSDgCLPJndg4TOxS4/+K2sQKL3XaKKbJwpYxrHeNncRVK3PIq5fLt3S1TrCjsBx8V+oC1pdTue83tyCk/M6OM=
X-Received: by 2002:a05:6512:3e23:b0:568:25d0:f843 with SMTP id
 2adb3069b0e04-56825d1df24mr3328322e87.4.1757577400507; Thu, 11 Sep 2025
 00:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org> <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
In-Reply-To: <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 09:56:28 +0200
X-Gm-Features: Ac12FXzR1a5xkbJIh_yEzUr3Ha0h6_elTIUATVbDxWcMjvS8AEDuwvbJ1IToPQE
Message-ID: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Doug Berger <opendmb@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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
X-CRM114-CacheID: sfid-20250911_005642_719517_967F9226 
X-CRM114-Status: GOOD (  12.56  )
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

T24gVGh1LCBTZXAgMTEsIDIwMjUgYXQgMjoxMeKAr0FNIERvdWcgQmVyZ2VyIDxvcGVuZG1iQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA+Cj4gPiBAQCAtNzAwLDcgKzcwNyw4IEBAIHN0YXRpYyBpbnQg
YnJjbXN0Yl9ncGlvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAg
ICAgICAgICAgICAqIGJlIHJldGFpbmVkIGZyb20gUzUgY29sZCBib290Cj4gPiAgICAgICAgICAg
ICAgICAqLwo+ID4gICAgICAgICAgICAgICBuZWVkX3dha2V1cF9ldmVudCB8PSAhIV9fYnJjbXN0
Yl9ncGlvX2dldF9hY3RpdmVfaXJxcyhiYW5rKTsKPiA+IC0gICAgICAgICAgICAgZ2MtPndyaXRl
X3JlZyhyZWdfYmFzZSArIEdJT19NQVNLKGJhbmstPmlkKSwgMCk7Cj4gPiArICAgICAgICAgICAg
IGdwaW9fZ2VuZXJpY193cml0ZV9yZWcoJmJhbmstPmNoaXAsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnX2Jhc2UgKyBHSU9fTUFTSyhiYW5rLT5pZCksIDApOwo+
ID4KPiA+ICAgICAgICAgICAgICAgZXJyID0gZ3Bpb2NoaXBfYWRkX2RhdGEoZ2MsIGJhbmspOwo+
ID4gICAgICAgICAgICAgICBpZiAoZXJyKSB7Cj4gPgo+IEkgc3VwcG9zZSBJJ20gT0sgd2l0aCBh
bGwgb2YgdGhpcywgYnV0IEknbSBqdXN0IGN1cmlvdXMgYWJvdXQgdGhlIGxvbmdlcgo+IHRlcm0g
cGxhbnMgZm9yIHRoZSBtZW1iZXIgYWNjZXNzZXMuIElzIHRoZXJlIGFuIGludGVudCB0byBoYXZl
IGhlbHBlcnMKPiBmb3IgdGhpbmdzIGxpa2U/Ogo+IGNoaXAuZ2Mub2Zmc2V0Cj4gY2hpcC5nYy5u
Z3BpbwoKSSBkb24ndCB0aGluayBzby4gSXQgd291bGQgcmVxdWlyZSBhbiBlbm9ybW91cyBlZmZv
cnQgYW5kIHRoZXNlIGZpZWxkcwppbiBzdHJ1Y3QgZ3Bpb19jaGlwIGFyZSBwcmV0dHkgc3RhYmxl
IHNvIHRoZXJlJ3Mgbm8gcmVhbCByZWFzb24gZm9yCml0LgoKQmFydAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
