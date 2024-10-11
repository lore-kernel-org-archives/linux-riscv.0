Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDC0D0EE24
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 19:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxUC25h+AobnTiEaL+BouT1AUGQhwqQae41UP7jGbqQ=; b=zlXda0HPFrAxK1
	rJ0vDYSKMYQuV/a8IfT3W8MAQt1P867ShD1p3hNO1w2Q+uOeTicbRv/tGSMpicis3bdCbNcC19jPD
	8rIauTS09LWiQ2DUmABZLOgzijwNegYUQKPwMAiAz/CsVrlThAO0tbr2VemNXcLhCxrHpqk3Dfvpj
	kWKrwYY7Zzw2zrOSpB+AFPqX8bEtUp1yEGF6a32qGp0xkvrh0a04qxLiIF/wyZ1LdX2a5LRjMOMb2
	tEn0iUzx56ZHqlfGcDFYN09wO9ocuuT19YyL6iULKF/stmGPNNVaasRd7sn/ZIeuJAkhgw2FXXon6
	j0od3SJ2c2GAbWd8fjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLJM-0000000HPYK-372l;
	Fri, 11 Oct 2024 19:28:28 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLJJ-0000000HPY2-22iR
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 19:28:26 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso26793031fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728674903; x=1729279703; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ib9PFYzvaqKheX8msfR0z/jz+7hM5FTJQOY9PaaT2U=;
        b=SGqdFtqWWzP6v8L1M+8+eOrSOWL63oGAchpL50QVKNdgFkoJ5LdQm79FfOAt0WRpos
         kUEYD6ZTmPgfCA+1R69WIT7Z1etOzlTvDiD5dG010mZoWAI3k/kMvm0C1UG7tQWUG4c7
         yAqN34fE8lb6MzxZLoqOuEmp2WNUioXJNI+7c/JA6IcZUz0X6Lmp0S3dtfudFR1DR3NY
         Bv7C2eq/G4CmG7C962oRQTx/6w1KddFt8hlwijfhkafeLDAIogLwOKusEnqoYZVA87wr
         22Z4vkSqAc4atXfnSdN8jo01/IQtg5CJBQ8aEc7+UQFu2QiNUWlPLK8h3RmMJVLTRkaI
         NaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674903; x=1729279703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ib9PFYzvaqKheX8msfR0z/jz+7hM5FTJQOY9PaaT2U=;
        b=GAPWsficVoGa6VhXVdwT0E3m+yn3d3crneV4RLVZamOV7nqtMXl0tUkbzOqVFPRxcF
         VRPOZYf62i6ZBsyylOqF9Nsb4xXgqb+gom88acy04tEcPKjKF2jlZtZvLG13agptJP5U
         xzoT/bOdIYj1PTvf2XnwnEiUhIuwu5VWw+OOGoxViw8Cl8slEWuIYcOSCSt1tOSP/t2U
         Uu0284zqS1bJ/z87j+LoBlSzOul7R+YgIXdQgY776iC9wtJh/9CDUnoucyRMuHsiVI69
         8VfZUy6jjg0zArPL5vev8ZJ+dCaxC4zj85d5u15xgZiIC90UJfo72kz8x4XN3dPeTuGI
         LXDg==
X-Forwarded-Encrypted: i=1; AJvYcCWkMBb5a/yqTONrWuCTEiHP692S7d9rFICkEgu4U4Am9rWa/lbREE3oU5Cc9lBD2nhtKuv+d6Iy07pcYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YydSowQZYi5dAKdbmd8mrO7DZWafKERTIAM+aV0l58PuHlpeSH1
	NxV6JtehL9TgXUPl1npQwHQdruCyI1/YbOhxDU/PiNLsSSIhr16Y6lme6c5T8gyzEOa8sr/pxBJ
	JipWJVHQTWxgR5SmhdRL2vz400xB5RL6Qd9MyjQ==
X-Google-Smtp-Source: AGHT+IHlWWYZkL7hRcimo9K372QrNGbFn3mXFWV+V/AQ1PzC7xBBqLXpG6DkMtKk+v5931tSyYIzbc46u7Y3dONqlR0=
X-Received: by 2002:a05:651c:b0d:b0:2fa:e7f2:764b with SMTP id
 38308e7fff4ca-2fb3f2b0d19mr4483581fa.33.1728674902415; Fri, 11 Oct 2024
 12:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:28:10 +0200
Message-ID: <CACRpkdayc=5ee_D-t_xpOe3hSNHKDYN63J_6WO0HECNUH36hrg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_122825_559510_BE85E441 
X-CRM114-Status: UNSURE (   7.70  )
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

T24gRnJpLCBPY3QgMTEsIDIwMjQgYXQgNDo0OOKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKCj4gSGVyZSBhcmUgMiBp
bXBvcnRhbnQgZml4ZXMgYW5kIGEgY29kZSBpbXByb3ZlbWVudCB0byB0aGUgVC1IZWFkIFRIMTUy
MAo+IHBpbmN0cmwgZHJpdmVyIHRoYXQgd2FzIGVpdGhlciBpbnRyb2R1Y2VkIG9yIG1pc3NlZCB3
aGVuIERyZXcgdG9vayBvdmVyCj4gdXBzdHJlYW1pbmcgaXQuCj4KPiBJdCBpcyBiYXNlZCBvbiBM
aW51cycgcGluY3RybC9mb3ItbmV4dDoKPgo+ICAgNmRiZDE1NzdiN2RjICgiTWVyZ2UgYnJhbmNo
ICdkZXZlbCcgaW50byBmb3ItbmV4dCIpCgpBbGwgcGF0Y2hlcyBhcHBsaWVkIQoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
