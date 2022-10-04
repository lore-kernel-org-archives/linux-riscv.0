Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA20BC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 08:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkEsquP8FieGOhYEzAzBQP9r0w1AaRMA1X7SNATh2sI=; b=ZStUZXXaKZXgrh
	J+ODesHqbDb86Dd6iLSfxzZd5R4S0YArmk5MeUjqDC+nz9mhAuDxNAq4XOQdjE9kZi4aB+vJHht2Z
	qrfcaOlzDaYlisvh2J6z4veYUikTSeCJtzicgTWZBX6CkAmMQFI2DMHqhZI/P6w+bFucQKrlyQmxF
	S397oxysk4B6WukGh+HQoCPDX+VZqaG22m8xNUMBHcilOUoFSq2i1YmxmBAH3QgP7qGLSqTetJNo5
	1MRatqO4UVVAnWu/aaA90HfAb/YL9h73GshywO8Cz0Em6KC8gL+2tyIg7xFFiXyBjwxH/Ube3wDaS
	zgAFst18F/A983S4jhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdjI-0092tx-Sf; Tue, 04 Oct 2022 08:56:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofdjF-0092t6-Nu
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 08:56:42 +0000
Received: by mail-ej1-x634.google.com with SMTP id hy2so27376843ejc.8
        for <linux-riscv@lists.infradead.org>; Tue, 04 Oct 2022 01:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lxkTJcblLVu6NuOqlRauwNwEZChGxIJKAd+juLm/hHA=;
        b=X5rSaOtzy6x5snBiRSfNAOjP2pRfTI8CdpgkUbTuQHwkzOk8SMvojJcn8YMGuLfi8g
         Y6LXIRCXQpP7WrH/rE2KaWCF5hdNoZ+3u5UvksYwE+4ANCwKj4JlsqMq6Uwg0vd641nJ
         T7OwkZMM6p6i8h7smNdvtg8vIfnIip3mURLBQscSkyd1O9SLf51YhHmpxqJpF7rLoVPR
         6/N6vTX3UJjl71RxhP7LN+EoY2pXFWf9CYLW6IJX1WfDxmdrXAZezEI9/iA4OY0C1nhk
         Em3Ja6XNZmNzh94nYm3kcG+fVMsgzAH+zhd/Ivj3PB7oHkgl5QiIHTT+u/Zk20c61MAu
         dYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lxkTJcblLVu6NuOqlRauwNwEZChGxIJKAd+juLm/hHA=;
        b=pysQYkzUdxjTgyUUmSohM7UEQSRQs3S6/mHazbugmuN3YrmNybXLw83XBmpEiqoKPL
         yv0uI/qUSunhyLPMvbohAejeykyvM2iIUwS07WgaLqecuCtgJpV3gVqPuq+7A9FWajiM
         6RRcwfMYUrgJTcPR99jwGT38UK5ljWBGf7muyC1q16FhVGjxMU4i14EOLwl+3Jt2iCmO
         m3wcSyycZzD05GJxeeyfMDzK7ijlu+7qEY57RIcj2nB3FbtTXXIK+W6K+GRQu1FQcNog
         WbvKSzQkkRT+v1qVSKyOWUDkzSDwKBdEFmmEtZrF340DSZAvD4QFSwVZTspM1JZZ+Xll
         nWAQ==
X-Gm-Message-State: ACrzQf3JcOa9QV4vUlMMSKdTMB3Lb/OLiB0ZxdZ0b0OfYp5P4am+6HVk
	eH7d4iocQgQxHh1lyD94G9Dn+r5I3nZql4A6shjLGQ==
X-Google-Smtp-Source: AMsMyM7riW2z2sUUR3aIi4rAMS6ggGMmmrCrrTuvodb/LcmYfbLSB3cfWOTk+/hvzu00TNxkrT5FaalupYxMRlmbHac=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr18648224ejs.190.1664873800297; Tue, 04
 Oct 2022 01:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com> <20220930074341.6386-1-hal.feng@linux.starfivetech.com>
In-Reply-To: <20220930074341.6386-1-hal.feng@linux.starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Oct 2022 10:56:28 +0200
Message-ID: <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
To: Hal Feng <hal.feng@linux.starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_015641_795930_A2AA2F5D 
X-CRM114-Status: UNSURE (   7.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
<hal.feng@linux.starfivetech.com> wrote:

> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>
> Add pinctrl driver for StarFive JH7110 SoC.
>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>

Since Emil submitted the first driver I would really appreciate his review
on this version.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
