Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F782C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KripSb21/jfL/PlE+hxG3PHzpiPTNnhxDiVe5EUc8dQ=; b=rVavUD2dCQqyGh
	6kEgUuPPz/xJaYYUrASS6mbp4OBRDs7QSBpL68/op33RN6LhvdsDlBvpaGo0J7h5KjjBlCaZaINLf
	VjPLtm9fzidmQwaivXEFwN2+lKD9DKgHNh+NAbpmKj23h58r8QVlfRxy1wWYKx889H9m7zAmZ3L8U
	uX3/HHrzodiqmAYgBk0eJiyUHPIXg31aRSq3qWvHFDz1I523XVrd4pA1wJ+Ibajhx2QvX55EiLUfC
	vLttV+jDOcJyjTot+TI27au9KgTeBjccy4HFsXy9Wd+cwkKn9jeWEucv99UY9gUGYQzkI1Uu4zT7B
	91rKYfZeq7ot84iSgNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t6K-0000000DXyy-0yOg;
	Thu, 24 Apr 2025 09:42:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sIn-0000000DPRU-3DCp
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=; b=ogmm4T/SwUsaSJlC7jRBLu7G5p
	vVfnI4yhv/XsUqMfZV+rSeZd6c+fybPS1QXiger/BNOloxrEp3bRp1BgMzcL85diDuELZdCOazrAN
	iff6liCliwlRH0QW96dGyVapQN3SHrp4yFhKH3XJ19aP2sQOsP6JKoVy1k0T9PbhbHh0fYSomgsM/
	vpC/+I/VdZWTA7X5Vj/uGPqLjXhh1hYWL7irkq0VYdG/I0ChUPZLcLqhxq82/Hr6/xmDQwQ9Vzs7m
	VNfAhM3Ef0WwzgzE952fsNfqBY8qga1PKbarCA4QmjvA0WpLraifGRfuwcTNjSDERGl4l8cQvEE9L
	dTBnp16w==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sIk-0000000BeGm-1MgR
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 08:51:24 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso7362681fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484679; x=1746089479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=C6/WS5H0EHOESCThNzpyCScHqof2pZOX8kNfOV/e/vXaCAP7LUksiV3sQTZ63zVZAs
         WwmY+cxx7rp6upHuJEQGKEimG0VazvvWEbbMJ0JqNdoFGpJGE+Y1HuZ4LGZjr8chqIdF
         jO2m8YEKs427++Digaeq8yyrOnCT0w3mxsop9wtPaXng5uf8CcrgnO9vVn+myQ2jg+il
         U0NlyzqSW5O/FYcM7qztyAt6uI7HW8n8tLdEv4rP+Tmaydj07sM9QqJo3htL+M7FDVwn
         yB5MA3iVHQnaQidDRluswIZT4uPinFhPfvYx8ZsKQaTCNXBNPQT31Bm48DDlu8sYqR4F
         bz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484679; x=1746089479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=fGTA/Qb5HwhabVBfq1Sw6Zz87CMRMlRRbbhRdQ9dkrxPDOYCgnu6txkleiMLQagNiY
         cWIlCkL2Qwt5SddqbbzOp0ETGPcmslZdVU34tijFBsLGpnGoDmUdS6Z73yRg4BPYInpv
         Wgutq/oWMjJ4P58KgsMGRSkaZZxcz6LiRMSN7J0bokjXpbKwVDvkTsjs4dZZnq8MAGYy
         e3FP+UikmJl5oa/xHpiFwHK95QMUYJXGhdbKQoo0IEqkhn67KoNPdnoXSGKj/JM3IH/u
         jQRRMzvftWJ6Zpv0HXGRgSVvjkcPThAU2cqVjBGJz2BSB7Ip30nkkO+hUEfmRQ5vCVu/
         WmMg==
X-Forwarded-Encrypted: i=1; AJvYcCUU6mXW0UwhNzSFRuc0Vx8MqaHGpUQPKh2YChtUzdA2jr1RhaxlO3r83rx0g0EknCCV7Tn9Hat9uIX4gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnrEc/EeOYN24B+PbjwR50diuHoCsog4FnD6DIw0mzxFjHEs74
	LFdncHfgzUItLt1b85syUM9Ehga4hpOCSNjLAAObyNUYKWOELj55M3oAPEbMNThld1pVcU1KqO+
	ep7FRL9Hjbz29VHA/SNvclk0XXmImKzAmZUtYmA==
X-Gm-Gg: ASbGnctt6YABaC1C0avugxVE4+DJJbHReQfo0C1+vsHZpneQs2WoIv/dKTVVoxlmA+g
	v+33kZ9Lc9fYKrCR/NWx2vm5gJUvMI6IKFNw+LoESwHQqHbRbt4/IiONGQ37SZK1UBUytdY6H6F
	bWEO24TyWCGYKmovVt5XwfYQ==
X-Google-Smtp-Source: AGHT+IHVUjEPXYrY3sHIef5LKhQER52yuzf898RP4j9oF4QvMsHg66AhVu0yfj0NhwOcjO4n0yujHvjloTqfizgTfb4=
X-Received: by 2002:a05:651c:b28:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3179bd52581mr6677701fa.0.1745484678572; Thu, 24 Apr 2025
 01:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:51:05 +0200
X-Gm-Features: ATxdqUHVq_nL22G9xrtOjqSrYO8fC8-z8I_XXvLVBIP2wzvRpiBlPgb7WiVSR5s
Message-ID: <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_095122_474023_87A1F674 
X-CRM114-Status: UNSURE (   9.24  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgODoyMOKAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKCj4gVGhlIEpINzExMCBTb0MgY291bGQgc3VwcG9ydCBpbnRlcm5hbCBH
UEkgc2lnbmFscyB0byBiZSByb3V0ZWQgdG8gbm90Cj4gZXh0ZXJuYWwgR1BJTyBidXQgaW50ZXJu
YWwgbG93L2hpZ2ggbGV2ZWxzLgo+Cj4gQWRkIHR3byBtYWNyb3MsIFBBRF9JTlRFUk5BTF9MT1cg
YW5kIFBBRF9JTlRFUk5BTF9ISUdILCBhcyB0d28gdmlydHVhbAo+ICJwYWRzIiB0byByZXByZXNl
bnQgaW50ZXJuYWwgR1BJIHNvdXJjZXMgd2l0aCBmaXhlZCBsb3cvaGlnaCBsZXZlbHMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KCkFzIHBlciBteSBv
dGhlciByZXBseSBpbiB0aGUgcHJldmlvdXMgcG9zdCwgSSB0aGluayB0aGlzIHNob3VsZCBiZQpo
YW5kbGVkIGludGVybmFsIGluIHRoZSBrZXJuZWwgaW5zdGVhZCB1c2luZyBhIHRpZ2h0ZXIgaW50
ZWdyYXRpb24gYmV0d2Vlbgp0aGUgR1BJTyBhbmQgcGluIGNvbnRyb2wgcGFydHMgb2YgdGhlIGRy
aXZlciBhbmQgdXRpbGl6aW5nIHRoZQpncGlvLXNwZWNpZmljIHN0cnVjdCBwaW5tdXhfb3BzIGNh
bGxiYWNrcy4KClRoaXMgc29sdXRpb24gbG9va3MgbGlrZSBzb2Z0d2FyZSBjb25maWd1cmF0aW9u
IGRpc2d1aXNlZCBhcyBoYXJkd2FyZQpjb25maWd1cmF0aW9uLgoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
