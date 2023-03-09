Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7062AC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/tX+meDuOtF0Q4EQ2qfymnfSi4ML2aqZGxMaZ9XvtY=; b=mcHZJu8k/5sCF6Yq23tYUDC09W
	j0WwEkzzDukNaD/L9C6UZntZ6Nzz5JhPFzGkboNaATGKl/p3/B3svr1mkFdE8bmeDdYM9Tr1/HRzc
	xk1aunpq6b7zse0uwqW5P98EwOdNG2J49tfjudmCLPxrF6ffiZsjW0GePp7oe5DkAkDJTSwbj8iqe
	G+Jp5uwuI8pn80S6luo9wlxjv2XmUwOdPwbh2tSyYMKVHE3IDW71qS5CsRtLqE7Dto2DNTZ/QeFep
	LnJoN/j3iaLO/HWrFTIp6XXsrKv4jcmX3P2GEDXeMSiHJBhtlcPdDOoforCFbIZ0C5kZ5znFNNCOI
	M00MZ55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHcp-00Agjb-1I; Thu, 09 Mar 2023 14:52:11 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWt-00Ae7d-FZ
	for linux-riscv@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MazV93nWrvM+WuVhyoGwlZKRCfqVFkV7DMvX8xwr9Wk=; b=Nfq/T12Gpitc2QQpqjapLFdF75
	1b9A0yhD2fvYYuGL7qYfMEDCnCXaV0syyPC2lao1BzZtn54x6Zc8vXKWLz0Qhur9abSe4c4BQEH7G
	AqZInkQyZ3JY1N+79MqvxVT/N5X2miROkqX6iRYDY+od1/1Z9t3ScnkfL/vbQdQYnMoWhRXohwB57
	wjHb2EpzGp5H5evzUod6Wjw/9WmRby09nUIjR7GIT0DxMduNLZ9XaYQ84BnvhwWIvCRxtvWub0Y4M
	6CugogBGgujSyf5ibYlozDXk1rnDardWPWc9yUacrK+PMdc2GlPfagbZRfsOShXCKA2DPY+Yt2FCn
	/j8wtB+Q==;
Received: from weierstrass.telenet-ops.be ([2a02:1800:110:4::f00:11])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAn-0008Vd-2H
	for linux-riscv@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:17 +0000
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4PXWcX1qrWz4x2RK
	for <linux-riscv@lists.infradead.org>; Thu,  9 Mar 2023 15:23:08 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:3a77:63e:b168:ae06])
	by andre.telenet-ops.be with bizsmtp
	id WENu2900l54Hw2A01ENuF8; Thu, 09 Mar 2023 15:23:05 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1paHAU-00BKv0-Lk;
	Thu, 09 Mar 2023 15:22:54 +0100
Date: Thu, 9 Mar 2023 15:22:54 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Hal Feng <hal.feng@starfivetech.com>, 
    Emil Renner Berthing <emil.renner.berthing@canonical.com>
cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
    Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/19] dt-bindings: clock: Add StarFive JH7110 always-on
 clock and reset generator
In-Reply-To: <20230221024645.127922-11-hal.feng@starfivetech.com>
Message-ID: <dc88e0df-4e2f-d2b8-4ecb-514862d01c3c@linux-m68k.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com> <20230221024645.127922-11-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142314_193566_4825C44B 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

 	Hi Hal, Esmil,

On Tue, 21 Feb 2023, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +

This lacks a top-level "description" section, to anwer the question:
What is an "Always-On Clock and Reset Generator"?

To me, "always-on" sounds like it's critical, and thus the driver
must always be built-in?

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
