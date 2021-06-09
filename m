Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387FDC48BCF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07ADF613AC
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07ADF613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBDC9kBzgbqpjzxk6RmmYyhZjKyRVBLkppI6tFjkAYE=; b=dc6X0M0k+21H5x
	I5T7V895YlQ2X77hwCx6Pxy4lo8xIQ2jKzS7nrnU+4UgljZ0M2q6d7fXm0IZ12lCIxMkDQCPRuEhf
	otC+x5zcVIvpAIQaTrkF9txwXhrOcIRH6Uvesf+aQrQWLm/zVMCVIe95mv5/Ps3cJqNO6iKggC0cU
	sa/QG3xmxYosuq8JPWCmUPpNQLOPHrVRGoA+COpcK8GO9w4ElAlORcQ2nCXt3PyN/DPCMT8DQQ+qs
	dAV4IZYrZmWjV7e72ZQHLcKafEwLOnwl7L38AORidvMdMWgh/P3bBFdBZT2eiLHz+SeHoBrf8BLEA
	Zb3MHtO0ts4XuOqhNvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvaM-00D3Dw-IQ; Wed, 09 Jun 2021 10:37:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqva6-00D36D-U6
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:37:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id f17so3707845wmf.2
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYodVtyswGkxjPZ1N4VGwVug/p/tXWlRC7vMIsTSrBI=;
 b=bPJatgBr7cf/n/nozcV2QXkJ6KuYcmc76wQhAXvk8Hq+0jiCf6/weX5BvAxYuOgBWL
 tWw35amLPl4/ErMRBcCXdpHGnDsivP8d9+T96WJsPIFQQuvwIwuFoyuH2TlXYHmZ2ekD
 ZHqceoPEjeLEw6zJEJ06j9uYxHOY54DttYbKMAdqmOlbIrAWgymewLD+n551uHTZtvzs
 sOjOc8+zgOxmMeABVYyDzKOSdJcSU9UhkbnQi+/fvmYNGPmcUMs04w8EC+rjHzLRf0ns
 4vQ2+Re0/hFuAliL64jRfAkIloDs4EoP1BMiVF3mO1y7nPY5SiFjRYqqgQMKjLc0z6Y9
 jWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYodVtyswGkxjPZ1N4VGwVug/p/tXWlRC7vMIsTSrBI=;
 b=jOz06xMh711VzBQsqRTS+NBYicmqKycKDfPIvIsV9HirOgMsAiu1FLMJsUirHXFQ10
 nAyeRumfsMBigD9X6UpNEieiVvXZP71dODNhTzMYnxezqI+JmXvjHqw8G3eVrOgjPLYE
 enVsFR/opJlwKxdV1ro0uxm6xsJYo39gGWyyVYTz2DzO8cUPUrBzAeih2NBfyxOjsTIG
 Wo0wPDIhrfQ6nHEkM2dGj4JdP+9hzv2ZgA2y1YsH0tY43kYfni1uojcWg46UtTpMOtUm
 R1jS36jO7gyu5ERdjv9nGn0hckglopHlRM+EDDHXA2DmYLe2E0VpB5DyXfoPrgYUj5zv
 YkmA==
X-Gm-Message-State: AOAM532HKOgV6f7tRY6OiV8LllAdGIVceb4/0+hsfr0jWHrlltrAxImw
 X0EsOvSvqI83jt514+LMfQLqtCazm/FEgrdPA1gyrg==
X-Google-Smtp-Source: ABdhPJwOxSjrqbtXWi10C+dUk2jqM3x4JRkuQ+gY4Ec5hihOhUwkVNAF+kUVfPzxoPSu0goTPjfOIV7UIM3SddRgI/Q=
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr13233266wmq.157.1623235022430; 
 Wed, 09 Jun 2021 03:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210602112321.2241566-1-anup.patel@wdc.com>
 <20210602112321.2241566-7-anup.patel@wdc.com>
 <26cddfa8-75e2-7b5b-1a47-e01cc1c7821e@sholland.org>
In-Reply-To: <26cddfa8-75e2-7b5b-1a47-e01cc1c7821e@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Jun 2021 16:06:51 +0530
Message-ID: <CAAhSdy3jKY_48bFCSyzCcJ8kW=aERNEjBRz=5GEasefuN3Bydw@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] cpuidle: Add RISC-V SBI CPU idle driver
To: Samuel Holland <samuel@sholland.org>
Cc: Anup Patel <anup.patel@wdc.com>,
 Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_033707_072797_0FE9B456 
X-CRM114-Status: GOOD (  28.83  )
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

On Mon, Jun 7, 2021 at 12:09 AM Samuel Holland <samuel@sholland.org> wrote:
>
> On 6/2/21 6:23 AM, Anup Patel wrote:
> > The RISC-V SBI HSM extension provides HSM suspend call which can
> > be used by Linux RISC-V to enter platform specific low-power state.
> >
> > This patch adds a CPU idle driver based on RISC-V SBI calls which
> > will populate idle states from device tree and use SBI calls to
> > entry these idle states.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  MAINTAINERS                   |   7 +
> >  drivers/cpuidle/Kconfig       |   5 +
> >  drivers/cpuidle/Kconfig.riscv |  15 +
> >  drivers/cpuidle/Makefile      |   4 +
> >  drivers/cpuidle/cpuidle-sbi.c | 626 ++++++++++++++++++++++++++++++++++
> >  5 files changed, 657 insertions(+)
> >  create mode 100644 drivers/cpuidle/Kconfig.riscv
> >  create mode 100644 drivers/cpuidle/cpuidle-sbi.c
> >
> > ...
> > diff --git a/drivers/cpuidle/cpuidle-sbi.c b/drivers/cpuidle/cpuidle-sbi.c
> > new file mode 100644
> > index 000000000000..f743684d07de
> > --- /dev/null
> > +++ b/drivers/cpuidle/cpuidle-sbi.c
> > @@ -0,0 +1,626 @@
> > ...
> > +     /* Initialize idle states from DT. */
> > +     ret = sbi_cpuidle_dt_init_states(dev, drv, cpu, state_count);
> > +     if (ret) {
> > +             pr_err("HART%ld: failed to init idle states\n",
> > +                    cpuid_to_hartid_map(cpu));
> > +             return ret;
> > +     }
> > +
> > +     ret = cpuidle_register(drv, NULL);
> > +     if (ret)
> > +             goto deinit;
> > +
> > +     cpuidle_cooling_register(drv);
> > +
> > +     return 0;
> > +deinit:
> > +     sbi_cpuidle_deinit_cpu(cpu);
> > +     return ret;
> > +}
> > +
> > +static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
>
> This function should be moved inside the CONFIG_DT_IDLE_GENPD block
> below. Otherwise it is defined but unused.

Indeed, sbi_cpuidle_pd_power_off() should be under
"#ifdef CONFIG_DT_IDLE_GENPD". I will update in the
next patch revision.

>
> > +{
> > +     struct genpd_power_state *state = &pd->states[pd->state_idx];
> > +     u32 *pd_state;
> > +
> > +     if (!state->data)
> > +             return 0;
> > +
> > +     if (!sbi_cpuidle_pd_allow_domain_state)
> > +             return -EBUSY;
> > +
> > +     /* OSI mode is enabled, set the corresponding domain state. */
> > +     pd_state = state->data;
> > +     sbi_set_domain_state(*pd_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static void sbi_cpuidle_domain_sync_state(struct device *dev)
> > +{
> > +     /*
> > +      * All devices have now been attached/probed to the PM domain
> > +      * topology, hence it's fine to allow domain states to be picked.
> > +      */
> > +     sbi_cpuidle_pd_allow_domain_state = true;
> > +}
> > +
> > +#ifdef CONFIG_DT_IDLE_GENPD
> > +
> > +struct sbi_pd_provider {
> > +     struct list_head link;
> > +     struct device_node *node;
> > +};
> > +
> > +static LIST_HEAD(sbi_pd_providers);
> > +
> > +static int sbi_pd_init(struct device_node *np)
> > +{
> > +     struct generic_pm_domain *pd;
> > +     struct sbi_pd_provider *pd_provider;
> > +     struct dev_power_governor *pd_gov;
> > +     int ret = -ENOMEM, state_count = 0;
> > +
> > +     pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
> > +     if (!pd)
> > +             goto out;
> > ...

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
