Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15CEC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O7ICCoAaZR683KPW/a6vuAzd5jm8uGpsfA9BZr9F+yM=; b=mN6BfjVN/ppm43ECQ8XQs51zzi
	8p8L76adBhT06xB5ufonJSMzhj6YOcRr48L5K+c61FHIj95li/BY+AvoMAnFQtcbhagi2KrTElGX9
	7Ugy4l+4RNquPYtJHBVrlxo5BpRe3YFcFL+3K4eAI4ZV4QEzSW6HKXcgfPq6EQlEoiAwbUReKxtZs
	Wm6DcEMBTbLhOoaSN54MuvmQBQCi+s7NSWOJLRXJ6X9zPZoIRTDQ9bzqqSOhHNrY+/TH7AMT+vCyo
	NFrqVuF/WuKCfGXtj7PmMDVunN6C1WYb79J26SwHfojFX5Ku8/nzJtccK7/Hb6nvnIYdT4yhME8Fh
	cwGLRtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBR2-00FMHI-I8; Thu, 11 Aug 2022 16:53:28 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMBQz-00FMDV-P9
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 16:53:27 +0000
Received: by mail-pg1-x534.google.com with SMTP id s206so17619669pgs.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=FrEgly12wj2ttxZWwOI1z30y1JdS/EZuSClhPVGvhZ0=;
        b=QZ5Z6/hK+x84b+71V1583oW+eo8ZntWTD681dmHF5tMcqWEcKm77ur2URjyeChO7Kw
         Dc/Iz1jNz1zd8Fi+wgT9f/kHanPE54dIBe6/4xSI7SpSKExiFGn+QrQ83dGmgHJC6Jw3
         9ug8SKR+1qqNfoxncgtdvbIqbYZysw0Zm7LN6HUf9gqSoZpIuyNEWBRgggHKoUp7GuGt
         Q+u06MkeaKgMmhuYhL1+xqNIwfCQUqZH6YJHidUSgIQ5yQFn/8KRMx0Wxnc2UNR9DlQp
         wIKC6qY1jrS8SB0Fa1602gNNQMLH0m8e7cGFZVnJRUZZtOaiXQU1Y5TA+Br3DwTktk7k
         N21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=FrEgly12wj2ttxZWwOI1z30y1JdS/EZuSClhPVGvhZ0=;
        b=zEfEYRX2kY27r361BSjrbxMxBOmFD6qlB2lx+4PtaY0YpqXord+Zz7OpbdbPhA1sw0
         KrTsKpSWh0qBTAhoOvmTV4JYUB+8KWjOWkkSNCGL1pQxd5K2zmuKGVo35vOqLS2v/0Vp
         152mF0LFnB4jz4YrflQDtRdFmn0YMvxswnEopTrVqLjKo59n27G9Ft3LRB43FY6/jRde
         3iAR3ODmPzhBT/eLf97ewfjs6lu4RY0qBesNiGliWS7UhOfChhRBB7a//ymuyu7RD7tw
         jsPLsw+EP1sVJfRqdT8rze0ysdbadpYSXKswmmcBuERaBVsyyeEmZeiFSWQGQtX7XR+Q
         Uc7w==
X-Gm-Message-State: ACgBeo3F3C94cG31IqO3GoXPSgt+DwXA65jIknyH15/zWxAmzQxPxWkZ
	pZcpyb8XzmIJ4kwy1O+CVdZBTJRKqKwRBg==
X-Google-Smtp-Source: AA6agR4fuHrlbaBUcfW6dqvlDIAK+Gdkb0dRJ7THLkB8hrpd5Nm7gJB9VVI4+QcYfHGkZI3VELHz6w==
X-Received: by 2002:a63:8143:0:b0:41b:ee3b:1b66 with SMTP id t64-20020a638143000000b0041bee3b1b66mr14399pgd.31.1660236803743;
        Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709027b9700b0016c68b56be7sm2751222pll.158.2022.08.11.09.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
Date: Thu, 11 Aug 2022 09:53:23 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 09:21:37 PDT (-0700)
Subject: Re: [PATCH] irqchip/sifive-plic: Make struct irq_chip const
In-Reply-To: <20220624175639.2677-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-riscv@lists.infradead.org, geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org, prabhakar.csengg@gmail.com, biju.das.jz@bp.renesas.com,
  prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com, Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-16e473fc-4513-4998-b732-9059d2c0b870@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_095325_837250_A6EAF7DF 
X-CRM114-Status: GOOD (  16.73  )
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

On Fri, 24 Jun 2022 10:56:39 PDT (-0700), prabhakar.mahadev-lad.rj@bp.renesas.com wrote:
> These should be const, so make it so.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/irqchip/irq-sifive-plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index bb87e4c3b88e..173446cc9204 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -176,7 +176,7 @@ static void plic_irq_eoi(struct irq_data *d)
>  	}
>  }
>
> -static struct irq_chip plic_chip = {
> +static const struct irq_chip plic_chip = {
>  	.name		= "SiFive PLIC",
>  	.irq_mask	= plic_irq_mask,
>  	.irq_unmask	= plic_irq_unmask,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Not sure if this got picked up somewhere, but it looks fine to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
