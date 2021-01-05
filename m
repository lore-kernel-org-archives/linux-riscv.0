Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF7BC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F22C022262
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F22C022262
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dShwRcdter+iSLkvPsptMvOzhT+apoHMXBhG6t6QSF4=; b=V7RSw3UYTl5Tg0eENFG/hFt0S
	tumYlpS62ByX5T6UFrSvaE4HL1WkZr6gMpgCPvaT+zZKp6LzQnac56qEkl3pcpGyGWCi5C8ZxrMUx
	IAxBuO0CsPyZFmOpl1uBxbiEzTwUo+UifIaRdGvuueaQtDOE1W9XtwFpsbBLVs5X7p8fGld8hLEIr
	RN9dP1qwgsoITqHcoUNfoRj+B+uJdfMo40NOTgrcFJjKpy/zAdEK82Q/7IlYYUq0mmRl/QUR3RYLj
	exIq4tcuTjhmo51YkIhDniyvR+0UVe+ZqcbYnq51IrA2/iOUNuVQoqc3EQs6Ksy3JZtKq8LOzaqBP
	NaXOHHvhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwtFp-000756-P1; Tue, 05 Jan 2021 20:48:33 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwtFn-00074I-LW; Tue, 05 Jan 2021 20:48:32 +0000
Received: by mail-lf1-x12f.google.com with SMTP id o17so1650134lfg.4;
 Tue, 05 Jan 2021 12:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=VI6nFNhOrDBsKOeartd6J0bcnx10OA5inX4UBRpL4qE=;
 b=XMzvAK1uTDP9sqD7pLv4Wz7WB5ahyaA4m6Kusb5//KKj6ORucbf4DEkHedVG2WYchx
 ww5E+S2pe/MVFqDwCWn3GDiS2f5riKTPoV75h71RVrW0K2vBiy9ckj/U7dA9PWNjyCNI
 nX5bomPKCcbVJeOgp/Cj7QeOBmzBoXkvbgT+W8lDuSsHgW8SMCpsK5rlGY82XsKP7qkx
 a29IAV41Ls1xim5un7jcVMha0ymLBu7etMhtRuauiNm4Zo6NPbxuUdxGaFB5dXcGICKr
 V9gREmCqoUjAr+3BJU51evd6QVFkDSbGIsK3A3GwKvAN8OhPsBEmC8Moy5N8LCKzSIDI
 qz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=VI6nFNhOrDBsKOeartd6J0bcnx10OA5inX4UBRpL4qE=;
 b=jhyQk8MVzZ1uZx6/Mlf9Cdqjcr2yHpaHJ8TFrigj5CE7YR73gPuOYf7Bwf2Sz/f9ej
 IFKVEIV10ITvzS3znimPf861Q5TGeiQ6prn63K2ry+gquHEz/b+ZIvaQdwInysmQRS9n
 JK+I4I+7df7G27/6sIBJlWfiZrEIsejN85F5r61SlQlFrV4yxjt3RIUd1/5Vzs66YIAP
 qwSDJKth4DAvco5k77Yc0pUrQbWF4j9pZSUSh1tmXvJhsdTCLEQ/rgZC2Pisytxcpd/z
 En2cwE5Yj9q0LgkaikKUnI6UkZdN3yUSTrToh0NPyk662UFnXGQg9MHbUMVfYI+6gygd
 F+xg==
X-Gm-Message-State: AOAM530QlZrQl0DlZkHan8ZDme3Hm7HMwXvLo7sPbKIW2CByBt8msggD
 QykoqHmjwH86lvIGXxccNASuCq/VkFWm36xVJeA=
X-Google-Smtp-Source: ABdhPJxu0obS2EF+VNsGTCaRCOLzZxvocXJO+DOkx1q/eD1CrMCNDr6ayRfy6f/783TFKHGmdZ4OqMWe5HwKjoHK0HI=
X-Received: by 2002:a2e:8084:: with SMTP id i4mr635086ljg.291.1609879708350;
 Tue, 05 Jan 2021 12:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20210104230253.2805217-1-robh@kernel.org>
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Wed, 6 Jan 2021 05:47:51 +0900
Message-ID: <CAGTfZH11n8cRbrNB6XbzCydR4387d7V-gmRWou8hFFXbFBgvHQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_154831_752180_DCD6C9F6 
X-CRM114-Status: GOOD (  18.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: cwchoi00@gmail.com
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree <devicetree@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, linux-gpio@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-spi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Tue, Jan 5, 2021 at 8:03 AM Rob Herring <robh@kernel.org> wrote:
>
> DT properties which can have multiple entries need to specify what the
> entries are and define how many entries there can be. In the case of
> only a single entry, just 'maxItems: 1' is sufficient.
>
> Add the missing entry constraints. These were found with a modified
> meta-schema. Unfortunately, there are a few cases where the size
> constraints are not defined such as common bindings, so the meta-schema
> can't be part of the normal checks.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-ide@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> ---
>  .../socionext,uniphier-system-cache.yaml      |  4 ++--
>  .../bindings/ata/sata_highbank.yaml           |  1 +
>  .../bindings/clock/canaan,k210-clk.yaml       |  1 +
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   |  1 +
>  .../bindings/display/brcm,bcm2835-hdmi.yaml   |  1 +
>  .../display/panel/jdi,lt070me05000.yaml       |  1 +
>  .../display/panel/mantix,mlaf057we51-x.yaml   |  3 ++-
>  .../display/panel/novatek,nt36672a.yaml       |  1 +
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      |  2 +-
>  .../devicetree/bindings/eeprom/at25.yaml      |  3 +--
>  .../bindings/extcon/extcon-ptn5150.yaml       |  2 ++

For extcon part,
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

(snip)

Best Regards,
Chanwoo Choi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
