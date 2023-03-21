Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F7C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfrwOjlkKquMO7LXigm7RB95f32lhFn0AKD+uZC4tbI=; b=Z2EvyrvoDTnxdT
	OFGdLRZEUf5lambwdckxvH3gIEPNO2rJiuVEF69N3f/rhbAWTChxE878BiQt/qW9gnu+KW9MMQS+I
	ocyT2zYY8TA6wBg55cGleBOOAAvqgb1Mms8sUdUpdJbR7Bf7HKf7TPdl4dIGIe2zQarjrMqxNPpVk
	+HbhAWSm0j4FEPR/E+qbgNVmJjavBwoNkpywZlSQySfs3KMY9dFk4VLyooFb//pxpmxmEtvkQPZ1+
	jKoMQvYQRkyPXEx4NCb+WAv7txQgZY4SlV+4bmUwGEB0OfWv/nEcGYIYPKH2oZbablIoRxhLRw3Da
	CEn3vP3Gu2llHOPJeuFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peYHz-00Bsq6-0E;
	Tue, 21 Mar 2023 09:28:19 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peYHw-00Bsoi-2F
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 09:28:17 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5416698e889so269990337b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679390894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76Qus1bli/VwOY3y8BO9Hj8Ms3aeQpfzWEQJcd1zGgg=;
        b=VkpYKq5PwFB/4tSmj2zzDcO8TG8YaKieF9O6DL6vMZ17b6c3VAUsKvhZx9GWRjWNJW
         tcPskQ6SjDjflBtEMeBhXQ+0YlUzTnKYc+W69Phzp50XFaNeNGmLAeDnqgfzSZK5ivSw
         YQrGh2L9JNZ/Vaq0gHO3ipTylEYUiEE0pL7/2BTUAsQVCwe7R7JY03ywBVMGGSWqOb7s
         Kx9WTRMdYGMMR0MSb7qKDY1AgspEJrZeWK3ubDyFmtGaAqQ/gRHAe5awTEPAGc/cXWdn
         N6JzUarIhOdiehx8Hexc1yJuE0HYYnC1XQOIqeArQFNjYgpPWPTVNbjXraz8QMbtke8I
         Sqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679390894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76Qus1bli/VwOY3y8BO9Hj8Ms3aeQpfzWEQJcd1zGgg=;
        b=EnKVBUsrpMG5pUH57DzpmAwCs/FmARZWOk8UR8LrlTLHVyZbpHlT2LKQb9l8Wp75Wa
         l07x8fOlyGytBzRqZBre7kDwzJD3QE7+cQFXpl1z3Q/fGXWgcKsL/sc6eCytmG3qLedX
         1H7BSA2L+UPC/TYrJSpInQ+aSummcFTG9IeYnadaBaVgBZNlp2ADnFEfrWRGmNmA4DSX
         L2QjIaskx/ORf1nu/NrEFDG76OoGjMiihL4P1/GJ3Y0fy/J/IyF04h+XSCOt5PzNSK9G
         DY98DZyD0MUNSrtylH5OMZ0WetUtjIAehIboRi+jkR1KRQi71WN/FQokvoJ19/kKIjPb
         xriQ==
X-Gm-Message-State: AAQBX9cvkpfNOAD3/VZlceLo5VsGyFLg4/1rmF66Cp2txGqjdzYEMs3d
	LdRJIi4ocJTJRy2RAKqI835LUThu4DZkIhVkDUDrpK/VwoOpdpq9
X-Google-Smtp-Source: AKy350YexCT1RHA6Cn204g9h8Q7dT08X4aKbreYthmzBiusk86//w6WusQsW0SU29UHZG3AZ4xmbQp5CwJHhY3dQlIQ=
X-Received: by 2002:a81:e20a:0:b0:532:e887:2c23 with SMTP id
 p10-20020a81e20a000000b00532e8872c23mr636381ywl.9.1679390894044; Tue, 21 Mar
 2023 02:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230320233928.2920693-1-robh@kernel.org>
In-Reply-To: <20230320233928.2920693-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Mar 2023 10:28:03 +0100
Message-ID: <CACRpkdbrsh6e-AJ9Qp2G=47zBsRWxDxOfZXp9-7kvOSQ1Vw0Kg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Krzysztof Halasa <khalasa@piap.pl>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_022816_733112_AD6DB321 
X-CRM114-Status: UNSURE (   6.06  )
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

T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgMTI6MznigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
