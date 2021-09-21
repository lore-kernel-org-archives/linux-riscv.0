Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A8BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:17:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CCF60ED8
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2CCF60ED8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkD7h6EMXx5B21FZH8XwAh7hCeRkGb8+slWnSEP3d8I=; b=X+VYQLT74l0ACb
	MKL1rBn/axeh4YXBeMPABg7GxyMUgNzXgbkMh3oW1/lsaW1ZYR/Kjt57jwr1Tw2UuLOnrReRByYTg
	vcPmy5Msyv3R2nywZzWF6/ti95Cb9kO9YYJUKN2MoDNzgUxNfsRYzhtajER/2m67XWCwtELQvLRFR
	oyEPV6tywN/7zCJfqwWd5QO+ldLoU0RQ3W3p32Ucxbar5cb5g7Lyna5eI/h+LgBpdPqIkI5RxRNQA
	pykHSNduIkN1ob2ACrtTsmtOd+IPbnpBYMczLWoL2GDG/6S6IrLXDH67RcT5UW3car9E9Dg0/p+Vd
	G4VY5DBNW/7gJDveMkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mScpq-004GTE-0h; Tue, 21 Sep 2021 10:17:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mScpj-004GPk-PJ
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 10:17:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id t8so37529680wrq.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GObT1QYVLArBTvZ53NGOnJNRdUva3/8xKoXuesJHn/Q=;
 b=BaASjxyq8SgeaqU0juZT51Yv+Bfv3TpFjlq5dJY8za2s8dkyRKpgBsJXU8wXp3b5Dl
 3b6Fe1KWGtXs8hjSsuzDVZ49YYr0HVeibjdu8ZxPB9JM6q/nqpF7sV4sHATQ3qaVqUtK
 W/D+zFCtXzfCSnMIUkt2jEnvy/y1sfEffNeKmVpGTAqHNe7wgxLBFf0cf7XyJigxLfeV
 tS2h5tHtGHkKB6+u7Fmffr4dn7EdjQs30p19JcGJsx3y88xCk+nL6+q2BuQSn2sPrb9W
 lMhHLdRUZtTbSDlAfiCls1vQs2niCJB7z4cGWzArRqzfhJKmVlvX+UbqCRUJthG8T2FY
 0uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GObT1QYVLArBTvZ53NGOnJNRdUva3/8xKoXuesJHn/Q=;
 b=IzByqjEamxi6YKhcqrtRvXqcfWLwYsk1XLISQBqspkVTrJ/b1flL/qDfsNA5x015Cc
 eV0tDVpEQHFDg+d+/2MisRDya48q+/vXIzF4xiT1KdcwLiB+Si77BnRBv7k0UZrHuNDM
 yMmSKO1tCQn30Fn/zBrluQIm3yEnK95ApqhzIwQULjL9ZEtQ5/T2EOZQ8lNoeTy3ZyaF
 DKh1AJlKBhJ3WOoqPeuzOMb7GLYqqTi8iDBin0nXM25iVivFFy3X98IilEuH3QRabPFq
 XWpYFmfPG1UDP/a5uCC9nqj+CfZAZMusXl/gyrtvS3+zeIib9cqVfIArBzXjRWs9+Q9i
 wowQ==
X-Gm-Message-State: AOAM53130nYwHmj9MgIq0HSkC7dwNAyoSvmRxDOMWa+4rBquuxyavYIM
 s4EtjCC8Sm1xR8cjt/cdg550tv0tY5GSFAO4W2ZG4AW9OoggQA==
X-Google-Smtp-Source: ABdhPJwS8af/THbsnVe/Np78G/uGepO75XhEk4CqOvW2fqhayqORudb14v9rogGJTqk1NDdaRJzHf+P6GCGZsOtvQgk=
X-Received: by 2002:adf:f50b:: with SMTP id q11mr11342711wro.306.1632219421062; 
 Tue, 21 Sep 2021 03:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Sep 2021 15:46:49 +0530
Message-ID: <CAAhSdy07KzQnTH+ad4esxtfhogzpXQagY8KeDkq1Kc81-Z33Yw@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_031703_959553_1075AE42 
X-CRM114-Status: GOOD (  20.90  )
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

On Tue, Sep 21, 2021 at 11:04 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> notifier that will execute a small i2c sequence allowing to reset the
> board.
>
> The original implementation comes from Marcus Comstedt and Anders Montonen
> (https://forums.sifive.com/t/reboot-command/4721/28).
>
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
>  include/linux/mfd/da9063/core.h |  3 +++
>  2 files changed, 28 insertions(+)
>
> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> index df407c3afce3..c87b8d611f20 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -20,6 +20,7 @@
>  #include <linux/mutex.h>
>  #include <linux/mfd/core.h>
>  #include <linux/regmap.h>
> +#include <linux/reboot.h>
>
>  #include <linux/mfd/da9063/core.h>
>  #include <linux/mfd/da9063/registers.h>
> @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
>         return ret;
>  }
>
> +static int da9063_restart_notify(struct notifier_block *this,
> +                                unsigned long mode, void *cmd)
> +{
> +       struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
> +
> +       regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> +       regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> +       regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> +
> +       return NOTIFY_DONE;
> +}
> +
>  int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>  {
>         int ret;
> @@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>                 }
>         }
>
> +       da9063->restart_handler.notifier_call = da9063_restart_notify;
> +       da9063->restart_handler.priority = 128;

How was this priority value chosen ?

I mean, we will be having SBI SRST as well so we should choose
a priority value lower than what we choose for SBI SRST handler.

Regards,
Anup

> +       ret = register_restart_handler(&da9063->restart_handler);
> +       if (ret) {
> +               dev_err(da9063->dev, "Failed to register restart handler\n");
> +               return ret;
> +       }
> +
> +       devm_add_action(da9063->dev,
> +                       (void (*)(void *))unregister_restart_handler,
> +                       &da9063->restart_handler);
> +
>         return ret;
>  }
>
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index fa7a43f02f27..1b20c498e340 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -85,6 +85,9 @@ struct da9063 {
>         int             chip_irq;
>         unsigned int    irq_base;
>         struct regmap_irq_chip_data *regmap_irq;
> +
> +       /* Restart */
> +       struct notifier_block restart_handler;
>  };
>
>  int da9063_device_init(struct da9063 *da9063, unsigned int irq);
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
