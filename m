Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DFC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mx4z7mHrWz9Z7vl/yF9g66+k5eLJ4mAFUn2wTTLggE=; b=M5LBNoGrQxQ1YL
	Q85Ad7lFMo1zsSwX3s54zebNWmg/8tHWNBcOSRa6VvncrJB8eaWzC+681gxhggHbLjAEsZ4C6W5Cz
	PGZiYh5DGTuXKq0/P99j/vF6IZBn2BCX6QYpFeLBS2zR+piqDdngEPlNf+ngw7uYqcpvogtQPaMQu
	ZwI2NCreLQE3g8GuipCTmQC9jTgeP9i3qHnWi5OGSxtsYpep1Fl/h3gX7rriKo18qBhkno+pm890Y
	FcSJQxM6SYMdqqtnZZo/DNKQUZI1GZGFSUOMQxQxHCW134ZOzOtyqC15ElN7bVDdmeWETeSQSQGPe
	FW8YpixK4mlSNz8B8++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdWV-0090Y8-4w; Tue, 04 Oct 2022 08:43:31 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdWQ-0090V0-6t
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 08:43:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id bj12so27281430ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 01:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9y6mckp6QwqVlkCMwSWHyLCrVK+e0UEzLE8ZnwJRiY8=;
        b=ktTkCfG+LGxaPC1FxhwkFYJUP/uVyiOL59RxCdYRtkujLdjXw8gvt2wUv+3x36ZqEK
         gr+uKk6uEhNT17sQPZ+KjFSX97a/KZpXepfHXgmhrDb/3eL9AHcIu+haa3EHsmJlJnzs
         R+SN9ofuPDXQjzLSQb4X72bpgfANjBE8P6Ib46jOf8xbgd6EArUjlzdayYBgqbKSLnRb
         yA9oWfoFVPykqzj7yWWyR9cV4XJmxmMBtiBzim10xNw0tIseI7tW35fyhQC0NGXVzhMy
         VlAoApKSJ0FnZlTgOKRnAPpO6m++30KnTUXBS3hDU/FaSdixESMfE5c4EeyFBh4KwinZ
         wxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9y6mckp6QwqVlkCMwSWHyLCrVK+e0UEzLE8ZnwJRiY8=;
        b=P+5GkJf9Tc2reqK1Nc3tSB1kt5XTEymCyY2sCdl/eGpQ0B9eCB7uYWtVhsDZQ2gfHa
         f5vtkOjCPsGIXYCmWci8lYlbgW6F3eBRfGoqGn33HD5AitdfEdX2b2wx8aByOD7bd6SB
         0NGwrVLr7PhLKgQUgdacxYzWwYBvCXZvFGyoaxDT9FcbWrKnaP5oc/tlzx5q2ZNVoEhZ
         XL8Q8OKZ1jZHSyFxvgbrw3WHjQFxG3Agc7hc75osivus0z2na3NFRegwQ6XQyFdDNZ84
         gvfIifrA5072dd8TQi/Jlqcy8G3gaKebwEBi7JZIW6t/Xu5j2jrozfnhL3bZA10P0DNO
         mi6w==
X-Gm-Message-State: ACrzQf06T7jNQk1WTZNPG38in9itjZ/yrs2BIUukFcAzDN17gkSZkJmn
	O9BBwXZIdqYb/utSGClk/UyFRqmauoDrt6BXbyUsvw==
X-Google-Smtp-Source: AMsMyM7smwSso6PfOzdvyNfHYtM5xmnUQGdDRlyqmuW7idFRUM5gJbnvbj0OLrfrEFIn9hTirM/sNLEnKZ34nmjZXfM=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr18624979ejc.500.1664873002520; Tue, 04
 Oct 2022 01:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220930060819.5320-1-hal.feng@linux.starfivetech.com>
In-Reply-To: <20220930060819.5320-1-hal.feng@linux.starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:43:11 +0200
Message-ID: <CACRpkdb-7YxfJB5YpYf4t1rT+u=mctLyVbCwm4+TtEHm1k2ANA@mail.gmail.com>
Subject: Re: [PATCH v1 22/30] pinctrl: Create subdirectory for StarFive drivers
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_014327_861644_33DE6093 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, Sep 30, 2022 at 8:08 AM Hal Feng
<hal.feng@linux.starfivetech.com> wrote:

> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>
> Move the StarFive JH7100 pinctrl driver to a new subdirectory
> in preparation for adding more StarFive pinctrl drivers. No
> functional change.
>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>

I applied this patch for v6.1 so you don't have to reiterate it, it's clearly
just infrastructure that you'll need going forward.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
