Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B56C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUIk18T76Ao7OUg2EglxOspG987RiKh3MmR2wQlc+9E=; b=HYRJEcZMP6bpKb
	5kk9vnSR38TgzcVfnV16x2rorjvWMHnTCEAAn50TIvehKnlap3c+4qQ8iQUqhs39DNQ4MTDZCrM57
	qWepTvP+L10tdR1Ynw5oRjnt75J9ZsuSSNNK4Jx9QKDIwQtcVDA8tEvi9I66/vNx7bwWjnYENc5l9
	qsxOPPdXyRqgLrIV2SOB/7P/nLi/+urtwc/gZNu5QEanpYFNeyzl8qu7CgpX2fby4MOaIdhxMXxV0
	KWro2dgH4Nu+gFZA/tzKNPTc6AmItrkVEYjf/p9IISVhT/+mEQUJnq9USHDM3RaYKrftsrXpUo8El
	kBVMa1Xi4B/CU7JClNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4VZ-00EDaM-SY; Wed, 05 Oct 2022 13:32:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4VW-00EDZM-Vz
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 13:32:20 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 631893F147
	for <linux-riscv@lists.infradead.org>; Wed,  5 Oct 2022 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1664976737;
	bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=mdDsovCOj0fBO4W3Yt+kwnmRTYxTvvcU+v/Q8DRckzz5HEQ2wuCBIqO3RHW6SYT4Q
	 qT06zARvyntRDqju2tdoNrutGu3qGlvDYyux4J1vOJEUOTJGeVSmnHfCixq9hzl3LQ
	 MUkJi8rQoDHnTdKzyxTiHtxTl/bf8HvoQB//r5sfroYeLObp54hTl0V/2UlGFW6PlA
	 2XGxzwuFB9SKfFgm0CkSVJHv+I/imFOhraZdhVFFWFvWCIE/h0a7zSNbKhtOAAFAkI
	 ZCXwiKSa2lgMD/wh3QzULC2QFfn0BSdeFNYAKfdZtV+1wSYfxqAEJUqWK5uhnWsTCB
	 cYSIGhwxicFrA==
Received: by mail-qt1-f200.google.com with SMTP id ay22-20020a05622a229600b0035bbb349e79so11322784qtb.13
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 06:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6LkuqTP0xa6XajPgZoG/IjY8IZRdyk1AbTrKKTZip3M=;
        b=6tUPMNom7/KELbwd2rl5DfL5LSaLddoY5sn3jnt94LSnhd5B1xQHwx7UXLNqGwG4Ql
         nQlGg/dHothnOSgscdO6i944AEoH6RzUj+g1xT5QilPOt3hde7q4smkGl1KbV+YVQFLB
         fHcA4GBKlf6X4wgaads1sTlRsIF+rNTveDvh16ozAsUWscGvPyO6lktLvItp3BgevXUp
         zXfzodd2I6yirxmGSAghO9rhPUdGf1ZnKRksbpk2PP0od1vPvb8zv7miwxqe3vzpGYE4
         Ljgf9vS8bxk6fw1Ub8Nmr6CSBwaFHrACnZTsQwXEsOUyTp/sxKSpTfdeLOrnWnHHGG8v
         JqtQ==
X-Gm-Message-State: ACrzQf1+q4Igvwc0RfkY0F3J5oy2YIfCruNzNq9znrAilsMeX/xEPabK
	VXIs/OHd42N9toT+OCuy/q3ork9DH+QQCJQw5E0Hc4yDysK6wYnddCGD0+7kOqW7gFuy+BQFM56
	ALT6WXcDnvj7LvD0NfuNY7OXfN7GhCe8fJqeUMIM5cpzxvoOWNBFLLAcdON/Xcg==
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id ea10-20020a05620a488a00b006ce5caa37d1mr19656625qkb.37.1664976735804;
        Wed, 05 Oct 2022 06:32:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Xl+UsR78BPCM9pC3pjMNNB38LjTXXtDyoeNI34kPvrpVwp+y4DCHK0DykjnJjicQW6z4ascUy+oxEZUfANUw=
X-Received: by 2002:a05:620a:488a:b0:6ce:5caa:37d1 with SMTP id
 ea10-20020a05620a488a00b006ce5caa37d1mr19656602qkb.37.1664976735563; Wed, 05
 Oct 2022 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930074341.6386-1-hal.feng@linux.starfivetech.com> <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
In-Reply-To: <CACRpkdYMQ98Q1iXr7-YdUkQrSK8aauZuSFeDp2f7ubNH_W7_HQ@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 5 Oct 2022 15:31:59 +0200
Message-ID: <CAJM55Z91TL4eLOjZsRVZuxspcL40gG2MQRZf31h0L2yyaW--Cg@mail.gmail.com>
Subject: Re: [PATCH v1 26/30] pinctrl: starfive: Add StarFive JH7110 driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Hal Feng <hal.feng@linux.starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_063219_376752_352A2B8C 
X-CRM114-Status: GOOD (  16.52  )
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

On Tue, 4 Oct 2022 at 10:57, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Sep 30, 2022 at 9:45 AM Hal Feng
> <hal.feng@linux.starfivetech.com> wrote:
>
> > From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >
> > Add pinctrl driver for StarFive JH7110 SoC.
> >
> > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
>
> Since Emil submitted the first driver I would really appreciate his review
> on this version.

I tried really hard to come up with a good way to share code between
the JH7100 and JH7110 drivers, but so many details different on the
JH7110 that it's probably best to just have a separate driver, so that
part is fine.

As mentioned elsewhere this driver certainly shouldn't be accepted
without following the generic pinctrl and pinmux bindings. You can see
the driver I wrote here:
https://github.com/esmil/linux/commit/c2633315385fef1a25aa3711facef07d915820e1

It is certainly not perfect and far from complete, but at least it
does follow the generic bindings. Feel free to copy all or parts of
that.

/Emil


>
> Yours,
> Linus Walleij
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
