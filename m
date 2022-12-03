Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6ECC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V51HJU2Kg1HTtUGhW5uOXYe5kPBclZFudIQX6+pKqME=; b=SFv7WjHRY6TTk2
	bRIIAWjd3xg85G5naQle/xhQO8MqaLyrdUdObRrohQ4YPyBdaOXr0Nr4U91KjAAnoRCm/YKJubP5T
	UCVoO+d9Q413rTEW1wfzNcLoLMcq1R5Rt+4P0QBZX7A50M3LYpzTCrcnSWg7AYYmi4t9wAQ6uyw+x
	Tk843pGuHIzB8ZpREseAi+Bv9o2fOv66pFR3VuE7tFse3D6VEbyX6E2Zggo72ZHG1kC6gKNbT2lK9
	XohyXlQ/d2bEzoNKa+S1gMhPhaNEgK56vg+89XevAWrgMkbScm53e+U873UDWgntzcp3JVNLwV1qx
	GuSVGazSuKakzn/yHiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1PZx-0032co-1S; Sat, 03 Dec 2022 10:17:05 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1PZu-0032bm-CI
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 10:17:03 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3a7081e3b95so72281387b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 02:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFhvss5aMmQ+kv0KSTC8kHK4WCB0iwiEKwFY3zES3lw=;
        b=V+vi7iKVKjgiAHLkEo0H1N3fJ5hGECkiIG/Yw62WwVU+lxhpxriYXvZNuJmxyvi2d0
         HfT88d77NeBzFJVq8K5F8Q3zl30q4ueYuRPVcjF9Gc86wQQz5ZdnwotIeL3CKXWOX/Mq
         07RwGWNBKZjRYmcjt7yn4GIscGYEDKdw/Y0mAPQ3KrepmK+9ObNOfItNiBYDC5mQuDtT
         K+DRheOibopStci2oy/BIVF18GQvugereM2nRnU+vytd2N/8MDtSklxp+GiD9scNv0gF
         Z+YKhE0XsfvHAsYCe33PkoOQGq7pmQ3JeBAMsPWH8MOjHUER0Bhr/4XwrxBOV12W+a2m
         FisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFhvss5aMmQ+kv0KSTC8kHK4WCB0iwiEKwFY3zES3lw=;
        b=myxpDPj3tNULKKn4i3+q9qmYEQ5OAu/GMiPJabJtO23Msq80Qbiq820tSjwKuuY+RU
         zkesoX7ItsceyX0lLLjyl2RVwlDJp+k6d8aZCgPcTynwNAA5xyXL9KW7Ki+fF+ipEEWj
         5lPt0jlEtOzFSaAFfOhjnnHzlm6EuxbfnB2U61FCzezQ/37uv6yigzgtBJRL48P+YSyl
         S1bhd7SBTHxC43T0UhzVjzQvUsPiEqpgWF4bLgeFuJWLz1dBJwWtyzcIOrmEviElenot
         Ep/GOldJppQ7mo6rG9gz1xFF6D0+su+wEh1/3rFt+iYjlOdT/AKLExJG6tlys/gr9Hpx
         pHgQ==
X-Gm-Message-State: ANoB5pmBA+9E1GOnGCdJzjAGM7lVtTlh2HjnnoQin38/Sg00S/uBNeHG
	kCLjpSrNjphbIBQRLxFp/rdC7Ge/W+7B/1huLtWe8w==
X-Google-Smtp-Source: AA0mqf6rcqJslJdF7Pfmvq3+Ee/rlhXlOKrZZ1PIfvQTZM+mk0hPS4YqfWfF6fdMJslzxm+SyJ5wEWn0zftNuP+QeKI=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr54919659ywc.380.1670062620358; Sat, 03
 Dec 2022 02:17:00 -0800 (PST)
MIME-Version: 1.0
References: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
In-Reply-To: <4ee1a396acc34871dbae73a5b032915f745795ec.1669738949.git.geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 11:16:49 +0100
Message-ID: <CACRpkdY6+a-cWDeDAi9tNrdgG2Qv3-tqjCxJ1p9F2JP0nEVaDQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpfs: Make the irqchip immutable
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marc Zyngier <maz@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_021702_727618_3026F560 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 29, 2022 at 5:23 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
> immutable") added a warning to indicate if the gpiolib is altering the
> internals of irqchips.  Following this change the following warning is
> now observed for the gpio-mpfs driver:
>
>     gpio gpiochip0: (20122000.gpio): not an immutable chip, please consider fixing it!
>
> Fix this by making the irqchip in the gpio-mpfs driver immutable.
>
> While at it, drop of the unneeded masking of the hwirq number, as it is
> always smaller than the number of GPIOs/interrupts handled by the
> controller.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
