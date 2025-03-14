Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA55CC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4HyDT0m7US+G4W4VxjJ1hl+0EUTGpI0K2DNvFurtYw=; b=U3kgzNENGpRXys
	S2TIDEzjeyFIuGY8FN3Z+e82aFX0Uxpxqnn2stL/JEZc7oyLj+8v8qc2PbpSW8mggBAAly9akJAZ3
	dyyO1t0ooG/UgMOj/X3sNzpO3lyOKiXIdlnY42AsHAb3O/ZNeRm2PGgyaHW2T1MER3sgFObykZbgW
	tsW68ev/SmQjsxrXuxeYwzzd94VNZ99xvqBW0LAApEcPzjYwFTuFq4w1vCgJ8ZdnV3GGZ1vBiXwVK
	IL5h4A7x1iZYf/srKij20ONM53rB5Bqju64N6pXVM7Wm4pcgVGvzqvEmbLMcm1oSYuCiMvfdg1C01
	4WqGnWctZOOCl8HAU2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt23J-0000000Do9y-3pXm;
	Fri, 14 Mar 2025 10:14:05 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1sJ-0000000DlMo-2yOm
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 10:02:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-543d8badc30so2203665e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 03:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946562; x=1742551362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=cRrQY4ROeYOef3NMTg2Ew3XpfRncM3JClcXTQFlfJusTQRM9Jcig+y7GITBeoY02Xe
         Fs3TlwSQpnnCvPBYfXQaz4CigrliyjYOdEs43Kll2Xi6iraXYCp1/PPIQKYStrZnm59/
         XJ8x4ncbBZNyR+Fd/in+7JNHf5r4cYJzMSwiOFroVzVoXTvG09I6+lybyAJcdtzFZIH6
         MgeuhGYSI5HKjvwYuBUEjAitw5TlTGkHTsv7ArYBj5v9h3GGla8uYY0M8dQ6EEspYzJ7
         ext++P37UmBmK9Y9QDeslDWfb5cwanNykDpwcYifoMVTk2RGcJobo7rx6OprAUFQt5OG
         TYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946562; x=1742551362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgDGPJH/f2nB2c+Evt/o3RF6NVVH+v37aRKEs7m2bog=;
        b=tbTL2Bxn0o3Dxve/Mq18z4h3tFuMQPIOSHDnMBHm9cirHZpn+StkIampE1H4TP8dqE
         HssN6W0imWFGXpfb/EzDiwNzJKaof+a36fT11Q6NFmuG5NAWHkCylE8+HonB+T6GpuNy
         g2QEgOZNJL/BHBZx1cnZC5/OCl6i8SG7Zf1dHmhAFUdk9aYfNyPpiET1uyIb1d/bN9ee
         2aG9VT1GW7CgaWC8pVn2mXGQLIJ8Ejgghvrxi/PZouv5AAl6Cfulwrrr55ShS7Mz/Y40
         PAlGJJAwsf3neBh9Xb5jTXFzdOXM9jpt/enrBs9iQoWNBO8hV3Pr+QCce0zFm+SsRuic
         aypQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDRrbMECpHkvsRuN8s2FMqM+q9uXNZ3+S1fSjncOofWfhIjbH2166Vh/xKf8v500ITdha6YLD/wR4PAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMgPW1CQrI9SVykxgtZvc4MOiibJCYf6MyjpSoRzp9U4dM4Ty
	H1yjEHGx/GtzeQkmCKqwZ2NFkjiimHacbfiY+hjCJVK6nF7JARg66iVT0GVOYJoXrkeTTlIcWmy
	qajpDnmNKfJScgeNGrICsrDaFXc6YU6aO/0u+Yg==
X-Gm-Gg: ASbGncuAgYt/yKD5drnpvXNVTpo+Nbd6Tq3j7SCtInV4Qywyx2/30WZcCCDj1++rx8L
	DSLrTeobN/cUUcxuRiwHat8YsqHGbTQi5/5TYyGGhCYnMg0sC+0S0gBFS6JSsHfXVIiYH+XXrZx
	Y/gywgu5MDae9UDTi/frtIsiU=
X-Google-Smtp-Source: AGHT+IEEU7fjMObFqi/KtorNaUacAgpVCp1R7kdy9gSMkZkxP5Vzr2YrX/ekX9hw0P90QrGqnfIHas94yzAS0vLKMiQ=
X-Received: by 2002:a05:6512:2823:b0:545:5a5:b69f with SMTP id
 2adb3069b0e04-549c38f542bmr532360e87.9.1741946562016; Fri, 14 Mar 2025
 03:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250305102710.52762-1-brgl@bgdev.pl>
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:02:30 +0100
X-Gm-Features: AQ5f1JoBxpl_Z6DDGsIcNQamKwhe2gdhb1zrS5tCM67ikkg1OHhuzYaOr8bu7bg
Message-ID: <CACRpkdYOVoLBwd6N9xSSjufguXzN+9y-Et2uDAQDjYvXyJftCA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_030243_747224_D851F01B 
X-CRM114-Status: UNSURE (   5.90  )
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

T24gV2VkLCBNYXIgNSwgMjAyNSBhdCAxMToyN+KAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBUaGUgbXV0ZXggaW5pdGlhbGl6ZWQgaW4gcHJv
YmUoKSBpcyBuZXZlciBjbGVhbmVkIHVwLiBVc2UKPiBkZXZtX211dGV4X2luaXQoKSB0byBkZXN0
cm95IGl0IGF1dG9tYXRpY2FsbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3
c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpQYXRjaCBhcHBsaWVkIQoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
