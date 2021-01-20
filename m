Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E30CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 21:46:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E745323602
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 21:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E745323602
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m6/Jjx2Ezz0mgDxnxmAshIKJTGyLWKFw0bXspl9Sa5Y=; b=MYNNdBsPCg7bfORbRoVSzdLEC
	tprgYIbYTu0W5jDSgfiCsgwOrWX9aEuVkC3fNhiCte/H+qRkk33vcVGjuzkIR0i8Pl+D8ZBbfld00
	DaWhOx2jz6q5uN8X/bSSlumCSgwsU0BGuwF5KpMNhJxhYsYbIsnWBeRHBQ2XPFEaddiBYhoyN9sc7
	wHgI52JB0yND8My0Yfn5G26j6ybYRF1Rc5tO6MzLmbQG68d8/IlfwVU8GCh3qNFgL3V2sP3ikTNmH
	GwLQaDMaWfg6urXWfoBxgH9f28pfX662wNRKK/5YTuRFja6khFyTceFD573arkwZSOv5Km3GlUUao
	OzIT/SSbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2LJA-0002Mp-5X; Wed, 20 Jan 2021 21:46:32 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2LJ7-0002Lj-OW
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 21:46:30 +0000
Received: by mail-qk1-x736.google.com with SMTP id h22so2270851qkk.4
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 13:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8NzCUdMQMvN88u/fqxqFMGHYAw7U6x8lsT5MGWH9Hc=;
 b=Mmyvs9MlyfnrDINk81HyfAnsbRaFbIBGDIcca4EOSKkbAOJXgUuEVD9DyT5RtUR3TE
 K0sGViTJkkvPUdy2vtZtp549g8+fypsnJwHYAlUkbCTmpIXjYECA9A4vobKDiZL8GlL8
 F9OPFb8gEbQmzW5h8LnjmnZAnjhOU1ND9kroE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8NzCUdMQMvN88u/fqxqFMGHYAw7U6x8lsT5MGWH9Hc=;
 b=DDv9qM38lRD58732Qu1pPoZPS/cp9lxwYA5Oav2SmfBh2eg3t3UWTq/pKGW7ik5T/8
 IpylIT4knxrdzJQK/oFEdpGXFV12zNIcZq02c02VPTE/bmSWpQ9e8gbfi4IafktSHKxK
 yX98b5jzyFWygQSKqrcQ4Tdw56vzQx6vRT8pJdww2nPBvwWHgGThmIPiiaHU5YYt5xGd
 +yp0rNQV0lQiRtUvErIsMWFS+jinxKqdGjsAfj21D/BXBN9tlmmcRdxWnnaI0fj3hS8D
 XhbF4Zn41IeM3h+fb+kXKEiPBRmZRP6dq8+AlfEy017eWQvXqK8cEVCSPhg9p5Ubzx/K
 cAUA==
X-Gm-Message-State: AOAM5302ySSsn2HY10srLEiEbzvuNPhbaXgbzmWXSYcd1FE+MzGn0rt3
 jafmWmhI0nS1dCDyxpYOEXz4ekvXcfCCTI7CK3s=
X-Google-Smtp-Source: ABdhPJwq7n8HIc4iAe9C7OhO9ciCYj36dR+LJel/pZ6W5RZVHThTDrnRjqUpeMxvfVJOibIL82cHVk8QgXQVfJlhEjE=
X-Received: by 2002:a37:a085:: with SMTP id
 j127mr11405768qke.273.1611179186264; 
 Wed, 20 Jan 2021 13:46:26 -0800 (PST)
MIME-Version: 1.0
References: <20210119080938.1832733-1-geert@linux-m68k.org>
In-Reply-To: <20210119080938.1832733-1-geert@linux-m68k.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Jan 2021 21:46:13 +0000
Message-ID: <CACPK8Xcj6L7StcBayPVV8QH7DbE+1oQBojfHviAmzaSq_xo7Uw@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_164630_043252_ED47148D 
X-CRM114-Status: GOOD (  25.00  )
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
Cc: Mateusz Holenko <mholenko@antmicro.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gabriel Somlo <gsomlo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 linux-riscv@lists.infradead.org, Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 19 Jan 2021 at 08:14, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Let the LiteX SoC Controller register a restart handler, which resets
> the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
> v4:
>   - Drop bogus "a" from description,
>   - Get rid of static litex_soc_ctrl_device and litex_reset_nb
>     instances,
>   - Unregister handler on driver unbind,
>
> v3:
>   - Rebase on top of openrisc/for-next,
>
> v2:
>   - Rebase on top of v5.11-rc1,
>   - Change reset handler priority to recommended default value of 128
>     (was 192).
>
> (v1 was not sent to a mailing list)
> ---
>  drivers/soc/litex/litex_soc_ctrl.c | 42 +++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/litex/litex_soc_ctrl.c b/drivers/soc/litex/litex_soc_ctrl.c
> index da17ba56b7956c84..a7dd5be9fd5bd8ad 100644
> --- a/drivers/soc/litex/litex_soc_ctrl.c
> +++ b/drivers/soc/litex/litex_soc_ctrl.c
> @@ -15,6 +15,11 @@
>  #include <linux/module.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
> +#include <linux/reboot.h>
> +
> +/* reset register located at the base address */
> +#define RESET_REG_OFF           0x00
> +#define RESET_REG_VALUE         0x00000001
>
>  #define SCRATCH_REG_OFF         0x04
>  #define SCRATCH_REG_VALUE       0x12345678
> @@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
>
>  struct litex_soc_ctrl_device {
>         void __iomem *base;
> +       struct notifier_block reset_nb;
>  };
>
> +static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> +                              void *cmd)
> +{
> +       struct litex_soc_ctrl_device *soc_ctrl_dev =
> +               container_of(this, struct litex_soc_ctrl_device, reset_nb);
> +
> +       litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
> +       return NOTIFY_DONE;
> +}
> +
>  static const struct of_device_id litex_soc_ctrl_of_match[] = {
>         {.compatible = "litex,soc-controller"},
>         {},
> @@ -78,6 +94,7 @@ MODULE_DEVICE_TABLE(of, litex_soc_ctrl_of_match);
>  static int litex_soc_ctrl_probe(struct platform_device *pdev)
>  {
>         struct litex_soc_ctrl_device *soc_ctrl_dev;
> +       int error;
>
>         soc_ctrl_dev = devm_kzalloc(&pdev->dev, sizeof(*soc_ctrl_dev), GFP_KERNEL);
>         if (!soc_ctrl_dev)
> @@ -87,7 +104,29 @@ static int litex_soc_ctrl_probe(struct platform_device *pdev)
>         if (IS_ERR(soc_ctrl_dev->base))
>                 return PTR_ERR(soc_ctrl_dev->base);
>
> -       return litex_check_csr_access(soc_ctrl_dev->base);
> +       error = litex_check_csr_access(soc_ctrl_dev->base);
> +       if (error)
> +               return error;
> +
> +       platform_set_drvdata(pdev, soc_ctrl_dev);
> +
> +       soc_ctrl_dev->reset_nb.notifier_call = litex_reset_handler;
> +       soc_ctrl_dev->reset_nb.priority = 128;
> +       error = register_restart_handler(&soc_ctrl_dev->reset_nb);
> +       if (error) {
> +               dev_warn(&pdev->dev, "cannot register restart handler: %d\n",
> +                        error);
> +       }
> +
> +       return 0;
> +}
> +
> +static int litex_soc_ctrl_remove(struct platform_device *pdev)
> +{
> +       struct litex_soc_ctrl_device *soc_ctrl_dev = platform_get_drvdata(pdev);
> +
> +       unregister_restart_handler(&soc_ctrl_dev->reset_nb);
> +       return 0;
>  }
>
>  static struct platform_driver litex_soc_ctrl_driver = {
> @@ -96,6 +135,7 @@ static struct platform_driver litex_soc_ctrl_driver = {
>                 .of_match_table = of_match_ptr(litex_soc_ctrl_of_match)
>         },
>         .probe = litex_soc_ctrl_probe,
> +       .remove = litex_soc_ctrl_remove,
>  };
>
>  module_platform_driver(litex_soc_ctrl_driver);
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
