Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lyaS6WX3em1M5SxwNmL14aJmikeUv9H7sWeyx7H6mW4=; b=yqfVfqs8wUePHd
	u0jW7z4/XIkApYAB3SJYW4gfIxkwRXSiq2VzyIF0oDS8zLJ1JQUeOz2HK3wqDEZ3v+PwczXc18PFj
	khZBxGIsf8Caw1B3ifvhBV+zgt9zEl9ikOU3KkHMrtogpqWAZ1ePiO8wpZ6N67qRBJDIzWIe55wM4
	NJz6dYHwlhOv2ClZ8j7OHpI2JmPzzClcfM+QJ2C8zlYlRTic49xXkiH8oeFCmNiQDjYa/xU/imBYZ
	8oHph2vSKMv+B1clj9t28o0mUqppvzVptXjEHZgAestvbBojedGyu11gBU8/XKpASKJQtnBQVG7US
	sQAdgkjTnHnRnU5Bq1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDo7g-009cjI-05; Tue, 19 Jul 2022 14:22:52 +0000
Received: from mail-qv1-f53.google.com ([209.85.219.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDo7F-009cP3-4W; Tue, 19 Jul 2022 14:22:27 +0000
Received: by mail-qv1-f53.google.com with SMTP id mi10so11176241qvb.1;
        Tue, 19 Jul 2022 07:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOo3Dh+u9eIpXPuxQ5+/nrksBNh/wB+hD8XQEf+YRJo=;
        b=SwUX1fTI5ZwEaQrzMKm1QGToBsbo8HTxkbUAyNxGVm51bLtL2jXvD6p/cAyQ+peFgB
         QrZwgKg8IKBpVYmTj9HqRJtGjU85DoFBdTCtheUtG51qNaKbONZ77Pz+fBZpb6Vlpm/g
         6qCvt9gx0EbTsuGXhCAjTohNqKmeZRUPRTB9cKZsKyvVypIkeZBPAwaHVmbXzIcTENqO
         tHxzS2SWkdRQ1T4M+yzQM7LzfwcUfpQqx4VzNlDUlELHXNkzrYyjIIJj1WGKbg5/p+NE
         s1gjUKKv1e3cnj+9DUluTYeZr76hwA5VefowFl4/Uv4jYv4fx7X9dJ3ZugaJDygOE6cI
         kGbg==
X-Gm-Message-State: AJIora93OA7JYOwSm9iPTctl2FkuDMfjM9eejMYyX4bUeVVY7D42acE0
	Vfrv6AJJFe9dK8/MkTwiqo1EyYdVmrTPKw==
X-Google-Smtp-Source: AGRyM1une4ep/IcOFoZ8it/OmswGZXzl+AYGdREqDOdhV54lCdn77taKoC9fZm1fgyP+xjnel0bJ/Q==
X-Received: by 2002:a05:6214:764:b0:473:b42:607e with SMTP id f4-20020a056214076400b004730b42607emr25688403qvz.93.1658240541678;
        Tue, 19 Jul 2022 07:22:21 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id s10-20020a05620a254a00b006a6d74f8fc9sm16072554qko.127.2022.07.19.07.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 07:22:21 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id j67so4118444ybb.3;
        Tue, 19 Jul 2022 07:22:20 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr30846962ybq.543.1658240540695; Tue, 19
 Jul 2022 07:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220704101605.1318280-1-sudeep.holla@arm.com> <20220704101605.1318280-10-sudeep.holla@arm.com>
In-Reply-To: <20220704101605.1318280-10-sudeep.holla@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 16:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com>
Message-ID: <CAMuHMdUBZ791fxCPkKQ6HCwLE4GJB2S35QC=SQ+X8w5Q4C_70g@mail.gmail.com>
Subject: Re: [PATCH v6 09/21] arch_topology: Add support to parse and detect
 cache attributes
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, 
	valentina.fernandezalanis@microchip.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Pierre Gondois <pierre.gondois@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_072225_218597_33CFD1FB 
X-CRM114-Status: GOOD (  28.95  )
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

Hi Sudeep,

On Mon, Jul 4, 2022 at 12:19 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> Currently ACPI populates just the minimum information about the last
> level cache from PPTT in order to feed the same to build sched_domains.
> Similar support for DT platforms is not present.
>
> In order to enable the same, the entire cache hierarchy information can
> be built as part of CPU topoplogy parsing both on ACPI and DT platforms.
>
> Note that this change builds the cacheinfo early even on ACPI systems,
> but the current mechanism of building llc_sibling mask remains unchanged.
>
> Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Thanks for your patch!

> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/acpi.h>
> +#include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
>  #include <linux/device.h>
> @@ -780,15 +781,28 @@ __weak int __init parse_acpi_topology(void)
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>  void __init init_cpu_topology(void)
>  {
> +       int ret, cpu;
> +
>         reset_cpu_topology();
> +       ret = parse_acpi_topology();
> +       if (!ret)
> +               ret = of_have_populated_dt() && parse_dt_topology();
>
> -       /*
> -        * Discard anything that was parsed if we hit an error so we
> -        * don't use partial information.
> -        */
> -       if (parse_acpi_topology())
> -               reset_cpu_topology();
> -       else if (of_have_populated_dt() && parse_dt_topology())
> +       if (ret) {
> +               /*
> +                * Discard anything that was parsed if we hit an error so we
> +                * don't use partial information.
> +                */
>                 reset_cpu_topology();
> +               return;
> +       }
> +
> +       for_each_possible_cpu(cpu) {
> +               ret = detect_cache_attributes(cpu);
> +               if (ret) {
> +                       pr_info("Early cacheinfo failed, ret = %d\n", ret);

This is triggered

    Early cacheinfo failed, ret = -12

on all my RV64 platforms (K210, PolarFire, StarLight).
-12 = -ENOMEM.

The boot continues regardless, and the K210 even has enough spare
RAM after boot to run "ls", unlike two weeks ago ;-)

> +                       break;
> +               }
> +       }
>  }

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
