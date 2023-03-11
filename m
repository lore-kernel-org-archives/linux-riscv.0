Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6638FC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=va39PqlcGWv6gfNiFzK+Y83ugl9tMOZaMSr0huIisWo=; b=zZ6W6rbTDeqR0I
	7P1Qm6TobHmEHiBJ2ELYiEhJVxAy04Nu9xbh7tjYx1CyFYLQGBdE9rj211gPu58vbFkCtuvTFBmmK
	5FnW7e3xdPgjrEPYdUYpZ8h+qlrDAmhlknjaUdY2Va74t6NbLFwrOCoTphsEPetEIXHMIWVRw0wGY
	oTN5/33Wdej0sQE1P+hYQgfbZjOhmqq8BvIOxhZtDpWsY4seHnQEkbHjUfzpuj7gDesXdpP0UNYTY
	0BTVd0E4gLedhlsig0twZOhozPamrC1yQs40Q7Z/NnCsRbvSkdzFX46RlP1CE6jm/u3Mcj3LROG4h
	+5q9CMFhpb61qrnkEugw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb76i-001Kwd-Tz; Sat, 11 Mar 2023 21:50:29 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb75q-001KSb-Rp
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:49:37 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-536af432ee5so170324837b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdmQqssz5Had8oKQ72+apTinz2h275pm1ruvmQEjspY=;
        b=gciPTBzc5QeQj5KkAuxfF0sr1ewqzJhakiSPDo1gsE2A9ZXhCZQ/hG3a1t4iRAPLfP
         +Aq1XLuuOZ7AFqgJg18C8Vseq0+EnNzJGT+gM3mdSjeVH6p6d9z7+juyFi6i2IDuJcIv
         +0vTAd//fng+HqncXPI12NlxScniKk0OjN3SS3nfTrW9PUFOc0oy+e8HOl7mEiqT369q
         BaK3O5gh3pce+h1asTlYvdww/3ov658708qg68yHf2XNiMhNKlqaqcb6ltmApDhPB0WP
         lYkO6k9AuEYVUVgQLTh3Osg/S5H71A5yTqz+W4DSmr24BcmU8J6l2J9basel3DzvBeS8
         fC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdmQqssz5Had8oKQ72+apTinz2h275pm1ruvmQEjspY=;
        b=kH3uZ9FQNVlBRDJgTzGloyPGWc4zzvW1A9WAzas4butzUHGJAoalllMvpDktAErcGr
         xqEiQok/rxBz8xXq7ny8cw+EnlD5xjTjB5PVdd5Okq6mgifZTYfTYwve54u29zmdbyu3
         x4XoM4xh5UBv0pWCMfOmCxcZM0NbaCE8yxHThfh4/Ey2/A6cl2LP93ZeO44wVZikKCq1
         joWUZGwjPUcKKT/qz5FezvvKjPlCHCZouBJVdQn5/fd4C9iWsGKfJvzk0D6qVlCfys7r
         8cUhTr+xKqqDFTTxbjU+pT+0N1HPeIFOnOD8AcoDI5sjiDn3OZwqs8hiCrSDMhCuz413
         8jiw==
X-Gm-Message-State: AO0yUKUDDNpnJyYKM+ZBzoepYsBuphfhVXAX5F2XSn2+MgeEY+OoCqLF
	DMlK7ol+XNBg7XkqrKYc5twlNKPJ/2iYor0VUysvWQ==
X-Google-Smtp-Source: AK7set9h5X62z/8PFc5WjUF7Ll5771AgCuJ/tNffuI9FWePIEX3T7EXV62ldi2qaq2E3cBiPjBF6dCcp1OVBnvB+Tg0=
X-Received: by 2002:a81:b665:0:b0:541:8285:b25 with SMTP id
 h37-20020a81b665000000b0054182850b25mr905504ywk.10.1678571373151; Sat, 11 Mar
 2023 13:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-7-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:49:21 +0100
Message-ID: <CACRpkdbmDh=45ZpXCUkL=f2h=LzxdHJmiCCOtkmCB9c=A9Q6fw@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: xra1403: mark OF related data as maybe unused
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134934_926721_2CF8B1D9 
X-CRM114-Status: UNSURE (   6.53  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBi
ZSBjb21waWxlIHRlc3RlZCB3aXRoICFDT05GSUdfT0YgbWFraW5nIGNlcnRhaW4gZGF0YQo+IHVu
dXNlZDoKPgo+ICAgZHJpdmVycy9ncGlvL2dwaW8teHJhMTQwMy5jOjE5ODozNDogZXJyb3I6IOKA
mHhyYTE0MDNfc3BpX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVu
dXNlZC1jb25zdC12YXJpYWJsZT1dCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
