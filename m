Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6A4C3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ial8D5OuHqur8FO2+zzPJfitDN6cdSgCoGgrzHX38lE=; b=uJ1r08zWtIA9U4
	DJ31o2q33Td+B6LQf0xE3sSe4rPHM5SJxmSfUNqUYkLsM0V3mpYm8HVMYnZI5qISSo2vZFInsJaZd
	yzzaorVzhItmh3w1tB7kAWlybPFzSEm2SeUkb3/W8y7Kjoy50cZguiO1+2eEPNXit/sPXQwJTjGaS
	SJkNuW/M9wKIyLmKrTp+yOkHpK8HYvkdhsGM4rdCqUvirn3bqSahzAFC74Qv2sP1GJvtV2Y48/GvA
	rvzdxHVKGqanDO8jGC+R0HNEEMYrdeEpXpJ3hgrxPbfDUmsuRY450DudsJ9vGDvI7U12Az2GW9K/v
	2tAYAebOmVHV0AaMpB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJWP-00B4vI-Jm; Mon, 02 Jan 2023 12:02:29 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCJVz-00B4lg-00
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 12:02:05 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id 3so28732860vsq.7
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VhOthAFxC6hcqPoBMVHQCGrB41HLTYe9QzI4mQ4bIh4=;
        b=ytE3GGObj9Dbe7E3Iin3KfJyQ04br0cP9ErJfs1DwAWqPXLH1qa6q2wVi7Mu5vZw7f
         Matpjl42k7jNOlYLL5u+566d70q9lmAhKAZprPBIpokHJcIsrWxqrJZkZXrAO4FGq+LP
         hMEgVcyAkLzeQMgqZBMDtaC+bQgunbO9UpmKTCdzEHti0u61H3ICrvNL0KK6T/Jwi2vo
         yBvMWvpPH+D6T+amM4jOywRK9iqknhIXO9VvyMLAPHKJRG2CL3EjbIeWjCPXvPVxFgqV
         dhK/ZJpEo1QC1ZCASaSYZJFHHLnKzEeSZDatFxGPryQHd96y2kIJM61Wp8KQmIKDQpar
         bvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhOthAFxC6hcqPoBMVHQCGrB41HLTYe9QzI4mQ4bIh4=;
        b=4PcGZS80kMu2yi9dTwnNghfJYOupdjUGb/EdF7hVgYM+eIbFk/hkfA2stjzzpZURze
         iW2YMJrnDZ0yG4CwxCMeoEarWG9s2LHwdrxTbrT0zYw8XdBxWDoNXPIP6loyZOAgmGQT
         GltwjgB6ef+WZgHQaCXOVU7UuIZ/FkrA5UG6nw+Sil2R736QCky5mxtEckZ9Pu76lOj+
         FhtmycFoomKcGNRE7V+uj4vdI3B09Qq2gTfji5xPb4ePC/76AFdV/QHNpd+cQWJB3kV7
         X1I//zh6uycGNbGlzPnFp84sMqpUEU1IrFBCSfsvhQKKTemcycgbRcZiqfPIs+KdH/W6
         FzuQ==
X-Gm-Message-State: AFqh2ko15HygtjgldLmmCaIHHMCdmdV5HdLH8e9ltmKqvgmvk1ShyniM
	e7LFxPrY24cyESKjbXeEgPXu+UwmlpUFGlAUSxBDog==
X-Google-Smtp-Source: AMrXdXt+qPLLphRKNSP8tHgCUL9jwISK0BhYe+7qRZsBDoalW6YAZBqaOIUYH+mVNV5t4VP+cMmyW0UR/IEHYT0MgwQ=
X-Received: by 2002:a67:df09:0:b0:3ce:88b3:d7da with SMTP id
 s9-20020a67df09000000b003ce88b3d7damr490644vsk.62.1672660917947; Mon, 02 Jan
 2023 04:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20230102082039.3941790-1-linmq006@gmail.com>
In-Reply-To: <20230102082039.3941790-1-linmq006@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jan 2023 13:01:47 +0100
Message-ID: <CAMRc=Mcfs0=CKv4YXpg5h+u6aoeLsEAz7PgUPUk5y6RHbKydZg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Fix refcount leak in sifive_gpio_probe
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Marc Zyngier <maz@kernel.org>, 
	Yash Shah <yash.shah@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	"Wesley W. Terpstra" <wesley@sifive.com>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_040203_352592_507F3230 
X-CRM114-Status: GOOD (  16.86  )
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

On Mon, Jan 2, 2023 at 9:20 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_irq_find_parent() returns a node pointer with refcount incremented,
> We should use of_node_put() on it when not needed anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpio/gpio-sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 238f3210970c..bc5660f61c57 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -215,6 +215,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>         parent = irq_find_host(irq_parent);
> +       of_node_put(irq_parent);
>         if (!parent) {
>                 dev_err(dev, "no IRQ parent domain\n");
>                 return -ENODEV;
> --
> 2.25.1
>

Good catch, applied!

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
