Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54195EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqLUnJoWddykS54nFUwsaYIhc1RHLgHR0PFEWEQCcuc=; b=ZHkjRb3eSCP9mP
	p+RAN+gSaMVL+D31pxv54pwZImXplwOBLD1Ro4EKdiPGN2e/6mhJazt4wPVc5mkLs6EriLHt7VCpv
	JRws9s5+dHjKEagfuyW7C+Uzeq+yWKMdzqjQF+pH/WV5kCtHltIxwjXJSEjhne10uzTOJEbLfWfz/
	RWiLXqucpowO9upCeLlAamkIihqbAZRRu0VAbt55rJEjEIi4PjVS1Ap+iqo9rVEc+8n3PsgJycUuO
	QEK4LWvGrZuxusoL7ALivEXJGNnsoqMmd+lJK7JZYUNNLDyjVwIcof8qj1B+dYSaOHI9Br7rja2Un
	EVu/F3IcnUSjxBTjCwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM81W-007hTN-1z;
	Wed, 19 Jul 2023 14:19:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM81T-007hS3-08
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:19:24 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0825E3F460
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689776358;
	bh=GQssMG4sr5GfDopggRQSgpxYtYsDKGG3T/Izx89s/GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=JybAVPAjMvYjjfEzzHmz1PlXhAYbvXvCCYVnZi43bf3W440fSnVqsYfT4hciGasJh
	 ybySqwHY0tEzQg6hh489+v4pHZ8FyYg699+2f3VVOd+sgLrsHRJ3YbRwDUl44cuIuz
	 XLcP3uVvzPlafIKtbsvIl4Y2LPzmxFeb9+qo3nouVpgwKkLeriqDSn5Ve3gnCRi+Me
	 JMCXB/NOZVIa4h0w5wILU5moSvjScdvbNahFUa/3coYJWLj2zLjtRhJMuH+0HfqvlF
	 VqNMAJ3+omzBhJ4LMhkMwaOeoQQVKurT/HJdKxBg9wbJGzQPvxlZ3VzuYlJ2/dek1J
	 ofU0HGWNYNtLQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403fe35b393so15264091cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776355; x=1690381155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQssMG4sr5GfDopggRQSgpxYtYsDKGG3T/Izx89s/GE=;
        b=aw3HwABQjVV1lTQPfhx8opUZ/6vCUnrk0c6OENdzkjAzjGiMBtZnrWwHwT/m2YDwT/
         O1KZ1kLkj1Z38+Zr+HDhNQpK4uwdPUDvTcuJOKqMKIU5yE+CjpVyDI6DWtiRC2uLMVNv
         RLUEVVfxfI6gB6oWsH8QM4d1hwz/qBaEjqzICPACykXt+iKfDkYyPrmvC4djKaJXEySk
         SRqMbp8zHx1qdDCosZeGLtsdiTY5YiCw5b3PH9Z1RoHbETpPH69/vtGdTNIMNIu0ev6D
         9hTvGgS5h5DwaXQ7tYD25RlnE/xfGjFENOAoGL8Z8tJ/1g+NzK91q3A2fW6WFu912CGT
         yA9w==
X-Gm-Message-State: ABy/qLbXkGGfpX2d2+37Q62TPEZ5ZnQoHsEphOebi9xTn5hYMjanU5t4
	OYi6tODOXbCJNAjhDSpwVjPOzgRi3hFF108/bagkR3nvtbPWVGP8AAUnASrDkn+/UpLErmRdhu3
	okYko3J4B8KjZsQA24hIrQnNYcPfYaFrTY7EBWTWWecgz24N3YLfjPxqpoEuLRA==
X-Received: by 2002:a05:622a:1043:b0:403:e841:58cf with SMTP id f3-20020a05622a104300b00403e84158cfmr7250706qte.10.1689776355283;
        Wed, 19 Jul 2023 07:19:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF6ArzibyjU/HIAo8zVRkK4K5uiAaxY67dwKUBWu+e77t8a+bRUMd76ruBG00lvDGu4BDbxlfoFwop3e5WhMrI=
X-Received: by 2002:a05:622a:1043:b0:403:e841:58cf with SMTP id
 f3-20020a05622a104300b00403e84158cfmr7250684qte.10.1689776355066; Wed, 19 Jul
 2023 07:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230717210356.2794736-1-samuel.holland@sifive.com> <20230717210356.2794736-2-samuel.holland@sifive.com>
In-Reply-To: <20230717210356.2794736-2-samuel.holland@sifive.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 19 Jul 2023 16:18:59 +0200
Message-ID: <CAJM55Z9B6atT_t4321kOCGWoeqLxe+ZBsJDr4BeV1byaeYw5fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: sifive: Allow building the driver as a module
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071923_221888_925A4F75 
X-CRM114-Status: GOOD (  23.69  )
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

On Wed, 19 Jul 2023 at 10:07, Samuel Holland <samuel.holland@sifive.com> wrote:
>
> This can reduce the kernel image size in multiplatform configurations.

I don't mind this, but booting without this driver also means there is
no uart for debug output or any other peripheral until the kernel gets
to the initrd to load the driver. Does the earlycon console work all
the way until we reach the initrd? Otherwise I can't imagine many
scenarios where configuring this as a module is desirable.

> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  drivers/clk/sifive/Kconfig       | 2 +-
>  drivers/clk/sifive/sifive-prci.c | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> index 2322f634a910..49597d95602e 100644
> --- a/drivers/clk/sifive/Kconfig
> +++ b/drivers/clk/sifive/Kconfig
> @@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
>  if CLK_SIFIVE
>
>  config CLK_SIFIVE_PRCI
> -       bool "PRCI driver for SiFive SoCs"
> +       tristate "PRCI driver for SiFive SoCs"
>         default ARCH_SIFIVE
>         select RESET_CONTROLLER
>         select RESET_SIMPLE
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index e317f3454e93..8c67d1a7c8df 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -7,6 +7,7 @@
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/module.h>
>  #include <linux/of_device.h>
>  #include "sifive-prci.h"
>  #include "fu540-prci.h"
> @@ -618,9 +619,6 @@ static struct platform_driver sifive_prci_driver = {
>         },
>         .probe = sifive_prci_probe,
>  };
> +module_platform_driver(sifive_prci_driver);
>
> -static int __init sifive_prci_init(void)
> -{
> -       return platform_driver_register(&sifive_prci_driver);
> -}
> -core_initcall(sifive_prci_init);

Maybe also add the MODULE_AUTHOR() and MODULE_DESCRIPTION() macros
while you're at it.

> +MODULE_LICENSE("GPL");
> --
> 2.40.1
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
