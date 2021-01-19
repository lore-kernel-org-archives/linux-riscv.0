Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB238C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 08:18:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FDF222227
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 08:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FDF222227
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tU1v6//WvUdIr1IP7vZfBa5EFElvZwb1GSU4+5IIySY=; b=aBGP49ODqn0kJqWPuY1fMEkVf
	OaiaNinRAuKHG19RwxLsZnx9LzIN7RckJ08FIR+tS5cTmfWvJZV09zGYKbxWdP4di8GSZHJrO2FJB
	M3Zl35D740muKRanohpGlOkIH9t8iFimNF9TqxdI5E+LIJy6Wn4ssExYtcKOycPD8oCV/ER383BKd
	VadxPzg5eOn5jNiewve7plW7fgXVv3OWFiVMdVsAAwb8WvRtIqNqjhETG+2xxbgJyzityocuGFr1V
	ZmZJnZDKssX06TIcpANsnjTvTQRNg4r+F3oVf+x62gDRnz6yhRG2GBN2+5RRcgMQIqugASuMClXQ0
	yP/nBhQDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1mDJ-00013r-K1; Tue, 19 Jan 2021 08:18:09 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1mDH-000136-D6
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 08:18:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id o19so27859221lfo.1
 for <linux-riscv@lists.infradead.org>; Tue, 19 Jan 2021 00:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bex7COrdJ/07+iU2EYVxWE5mtZ00AfCIkhn7mqzRkwQ=;
 b=Sgy4vEIxGxOZvbB0AyDKeuqwfz/6V6aXNblu7uZ5cg7SaUuH8ICezC0KLXM1Q5kLr/
 NiIc4bRWnjBbprMMa8osrRXVoebxfEO2rSliTgXU6ct47WpOnO/VAn8Vj6xTwVwKiYJO
 sOQzNAidTzRAb4jQ5ksO6JvwbjlHIgerkFd/mAr8eFocesTIa6rJO2AXlST/aMJPSTgW
 3rvob0OQvjDg5JTCYjJpgpafHGFyVclpCOa1mzGJbydEuuMeqyBbeFiANi7TvT8FgZyl
 urVA0VXipjl+FKLtGefVHCiAQB03hhgugYHH5Fnn5GfFEjyVFlSxNzpV1ASfECgIIQKe
 zbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bex7COrdJ/07+iU2EYVxWE5mtZ00AfCIkhn7mqzRkwQ=;
 b=ooj9zINi1gcjKXs27HgSW1PDHErGrrQAiXeWlPPoWaE8Nz+JAdI9rAq7Qhzk3lkUb8
 uO1hgnHgklykp4WXAeqSSoeOxbO6II1sC2tLh09qZcYn+/nnZf9OgojvO2m+zBRJDQWE
 jn3/UB57BJAHxleMiXqAYRgtA1+cTWRJra56YJXhntJDK4bGQewSkM1o4RIC60TOHfL8
 89Pq8VIz3AvfHl57hOnCtSmxhCTBeqz70tAKpi5pJwUFRw0hTKdh7TliV8kNFeZNHScI
 SxbsnyGP4oSeObqpH02efc4Rrs3pDjGefaUZsmM3q2oYuPuLBtDruKgILNxP/uY85JpT
 gWWg==
X-Gm-Message-State: AOAM5317Q6WVbd8A4xPxWl01JVEwCd23Dz+wh9j8vuHA2bhUGj3qOZvs
 bn3abNMdUuBJB4J610UK8RT7aFcALdIofP58r66Zzg==
X-Google-Smtp-Source: ABdhPJwMoFMQkXJv8+k3HuexsPpIdE6JBDv/cvZETT+bzC6wWwKKKfJL1Y27gtSD+KcJe4tpj3GeOHICWb8qtoxWEeI=
X-Received: by 2002:a05:6512:3222:: with SMTP id
 f2mr1404944lfe.25.1611044280842; 
 Tue, 19 Jan 2021 00:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20210119080938.1832733-1-geert@linux-m68k.org>
In-Reply-To: <20210119080938.1832733-1-geert@linux-m68k.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Jan 2021 13:47:49 +0530
Message-ID: <CAAhSdy3woKdo1=sZRO3ua=hK6M8NM7dp3nMFX99dKoUOC6+W5Q@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_031807_548953_AF89F9CF 
X-CRM114-Status: GOOD (  28.12  )
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
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Gabriel Somlo <gsomlo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Karol Gugala <kgugala@antmicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jan 19, 2021 at 1:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Let the LiteX SoC Controller register a restart handler, which resets
> the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

We have SBI System Reset Extension (SRST) in upcoming
SBI v0.3 spec. Using this SBI extension, you will not require a
dedicated reboot driver for various projects such as Linux kernel,
U-Boot, EDK2, FreeBSD kernel, etc.

The OpenSBI v0.9 (released yesterday) already has SBI SRST
extension implemented so we will just need platform hooks for
LiteX.

The Linux support for SRST extension is already available on
LKML so far no comments: https://lkml.org/lkml/2020/11/25/6

Regards,
Anup


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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
