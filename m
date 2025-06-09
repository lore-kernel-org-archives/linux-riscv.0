Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D31C61DB2
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 06:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgAMuAbQ4SB20Vd00fBNmeXjk/EwOdQgbQwksIsFlFI=; b=WrWwVK9EXKiEc1
	PmXKDnmWoKF46w3qLk9HgBs8wW8lT29oiuh8J1kfJwieFKPGG3h1f0xz57L5BY+xlLgOLDAVcVMlV
	c2pKJGe1HfDXjy0wg8cqPrJobKIpooM9lBvS9vD5gIWZIc+aFeazz00WnAKVhxphA2wHlrljp1HRz
	SMkCfW+7EJ9yGjFe28Hzk2F252dXCM4zj1UkjUGByVOr18J56oPxX0GCJCxqi5Q5Bw0NQLMWs9aXv
	MEgjp2yddBWg4sH6aDEAt33Nv0P1WLfz6E4VT1UJRTA/HoGt/q4Q/hr2+JAERNn5qAuKP7ojVgddT
	4zgPKEPNHBJ4hDCmS22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOVkO-00000003V2o-0wa4;
	Mon, 09 Jun 2025 06:12:40 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOVkL-00000003V24-1Rut
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 06:12:38 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5535652f42cso4004106e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749449555; x=1750054355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrTT2Ug0zbdaKyRxl6jBbSEjhgl8N2Elyqr8mo3YZs8=;
        b=QpGqhBZTT2VF+TwqiBv3XdJ2HdQy4TovChlOZSMqOfSz1f1tg8Q+SHqOsVsrCbNtzr
         fA6pvrzkFfqQdJM0UJEDz4MBsMJ5CpG0JFB9UmywJPqKpRBiCBx1J2JkDgSmv9ob0+bM
         pvDd974uH6OjBzrSvAsEkaddeUwlKesWwBNXOilT5veYPqv3gTfwc8559IofdssLta0K
         5irHQV9T/Nj0KV9cHeH0Mp2iE1EWyR7qOaA2BgnlZl/rLG53iZJ9qwRAdjQj+L0ZOYe9
         SNo/WuWaC+Gf7yIzkAU2WytqJ1y/M7CDWvChjJZtitT5lI7XiFadX2rIvmTbGhxH/FpY
         JEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749449555; x=1750054355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrTT2Ug0zbdaKyRxl6jBbSEjhgl8N2Elyqr8mo3YZs8=;
        b=Y+/tSFa/KEsf2fAanvrFvRU2E2JfeHjogrmiw4GvrK4wMQkQ+G2vAgJPSmRLh02N8A
         flnEbLBZd+vbEQxQeXNTPimlPCURJN237QoIbLd/LaoQBM94/B6FgxLntj2XR2ZczoMF
         VKUfgCJso6ED/WjG+gjTNxFPqNN8vvbHQdcapDRpRhwqnm53mDiW5I33LU/l9ZcwITg2
         YTYr3OT2f35mvx5F8DL9iiF5xUvxDv+a7me1Epr4zjUHdyt5y1VaEqQ1dgMaxlh3RG9d
         GYDxCw/4exuV62PGMCtMf0VjzQc8jGjDyWbXXdubygvahHWrr31JhSu7wrHleesqUvsZ
         xOsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMWTeh3amHMdUP+Ge27nAc6WO4s/dUjtLbl7Ht7GMuBARjiVgldH01YM6xbu4RBP2YOxkyejjkeVcfEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YysQWhV6oNr5f7a+37jLaav44ieqXihlbhof4kC3r9ssbO8aPtG
	qFMKQK8IY1kWGIyVrenJqBt2dgbYiVANPtnftSh7aq8G0TbJk8t0FD1dYmnij8vsPViJDMzZwHN
	NZXnGtq+lHPyNmb1keHozFEMGGaRan5KYs8143NJfww==
X-Gm-Gg: ASbGncugsx7DGrKtVuRmxtQZfy/hP1dJWLOmrq/KJjGJudTp3ozzpTebSCwjewe3cSV
	2hKCfMx+2XawRwYhxK+mW6HeG2z5IiBPkW6pfzjHZ/vOqOJoskFdaWrUyIMdVWen98DgwQOkfSr
	fdmrK/IAfcfzmfBOIgZqOnjkoBfMzFu6o5GQ==
X-Google-Smtp-Source: AGHT+IEECTtnbfpfpm1PCJ+0qNEPhUm+SPgQTf/zlmkXsjTkZrawcTxrDJFp5prLSUOiP9b4jKSeL0mzxrsjJjV1G9g=
X-Received: by 2002:a05:6512:3e14:b0:553:2633:8a64 with SMTP id
 2adb3069b0e04-55366bee0a6mr3224048e87.23.1749449555474; Sun, 08 Jun 2025
 23:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-5-apatel@ventanamicro.com> <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
In-Reply-To: <aDV8E0TF_cYuoQ4A@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 11:42:23 +0530
X-Gm-Features: AX0GCFvPnCJfNRo5uBNaPo8NZXrvaeCQeQ6i_dUaHiR22KPdWkZ9co7wy5KHhiQ
Message-ID: <CAK9=C2XJ7+homTqdiYvYRv6J+4-gEM3jLmi3EpMDn=wZjkMOqA@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] RISC-V: Add defines for the SBI message proxy extension
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_231237_387090_0E49879C 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjoxN+KAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDI1LCAy
MDI1IGF0IDAyOjE2OjUxUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBBZGQgZGVmaW5l
cyBmb3IgdGhlIG5ldyBTQkkgbWVzc2FnZSBwcm94eSBleHRlbnNpb24gd2hpY2ggaXMgcGFydAo+
ID4gb2YgdGhlIFNCSSB2My4wIHNwZWNpZmljYXRpb24uCj4KPiAuLi4KPgo+ID4gKy8qKiBSUE1J
IG1lc3NhZ2UgcHJvdG9jb2wgc3BlY2lmaWMgTVBYWSBhdHRyaWJ1dGVzICovCj4KPiBJZiB5b3Ug
ZG8gYSBrZXJuZWwtZG9jLCBkbyBpdCBwcm9wZXJseS4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+
Cj4gPiArZW51bSBzYmlfbXB4eV9ycG1pX2F0dHJpYnV0ZV9pZCB7Cj4gPiArICAgICBTQklfTVBY
WV9SUE1JX0FUVFJfU0VSVklDRUdST1VQX0lEID0gU0JJX01QWFlfQVRUUl9NU0dQUk9UT19BVFRS
X1NUQVJULAo+ID4gKyAgICAgU0JJX01QWFlfUlBNSV9BVFRSX1NFUlZJQ0VHUk9VUF9WRVJTSU9O
LAo+Cj4gPiArICAgICBTQklfTVBYWV9SUE1JX0FUVFJfTUFYX0lELAo+Cj4gUmVtb3ZlIHRyYWls
aW5nIGNvbW1hIGZvciB0aGUgdGVybWluYXRvci4KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgo+Cj4g
PiArfTsKPiA+ICsKPiA+ICsvKiBFbmNvZGluZyBvZiBNU0dfUFJPVF9WRVIgYXR0cmlidXRlICov
Cj4gPiArI2RlZmluZSBTQklfTVBYWV9NU0dfUFJPVF9WRVJfTUFKT1IoX192ZXIpICAgKCgoX192
ZXIpID4+IDE2KSAmIDB4ZmZmZikKPiA+ICsjZGVmaW5lIFNCSV9NUFhZX01TR19QUk9UX1ZFUl9N
SU5PUihfX3ZlcikgICAoKF9fdmVyKSAmIDB4ZmZmZikKPgo+IFRoaXMgY2FuIHV0aWxpc2UgR0VO
QU1TSygpIG9yIGV2ZW4gdXBwZXJfMTZfYml0cygpL2xvd2VyXzE2X2JpdHMoKS4KCk9rYXksIEkg
d2lsbCB1cGRhdGUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
