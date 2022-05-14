Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CFCC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v8hCSj1o6QHXyu/cGGdmD8UYafwm4lCnPjETPzmQQA=; b=CpdiiTq9u16J0o
	SmQxAkXMCYwsRc7YKwo1dK1JXli16QXj4dfFesEvWRWIYhWf0tg2/CsdRPNgxO8dICct5x6z89m2A
	zUl/3y0E8h7TJ7Et6irtsivukn8X1blN3y3HZv9CUpWy1pKP+pwE54XlytSFWsQShnclc7j4DtdT3
	nr8yGvWNybPGmEa9ypbDDclXHS/XSvLrMjjtmYUEVW8VEBcb85Q/uIi0obKu8uw3tfIchbWeFd8gR
	W61NFp0R9+Jnj4oN0ZzHU9FM0HSEXiSGNriib+KmOqKrVZcYWRIFNruW6eUfwQGtYqBwh7JPIB2Zv
	0rv6NMUU/TdmfhFILkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npuwm-001qv1-L1; Sat, 14 May 2022 16:48:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npuwk-001qtU-1J
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 16:48:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id q23so15106095wra.1
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9Ne+v1fWGSBcxhiyeEoVMQ4rFmfRWh1mmd5YIH/r7U=;
 b=meRQd62ep69g3tBqBYUeXf3me9m4oJ40AN+j1I4vlanRExPpzRRvwJGiZsLYWDyhUd
 INUHrkzVoQbMxwzgnNexlklgKVtXN71UobSDGxwNOupmGxiJLLVDLriwyM4gsuQYSAem
 FnSvIK6r1IjytddhDA39hO7kvmvRaLmR4FkQFhFkSBb/6XBSG0Hja8KDeT6hmGFjhdrO
 w3gKjf6NfulL/sCas5YgKZC5aHSNIbfBU1JjOHyAYFP140etjYNiMZ5zIUUw30xts2jh
 6mSYZXNzv11NKlDDULNg+MaipgsRINAnRucaHw+mp6UGZHPd8l9v8uGP9Vj7uuw6b6nS
 Whag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9Ne+v1fWGSBcxhiyeEoVMQ4rFmfRWh1mmd5YIH/r7U=;
 b=O4TIkJRpC5B6gehHQK2QQbU1U7MdTp5sM/JJDA3M+rM428KlAXszc+dn//51I4g8y+
 +cku3klX2RMQvT9RlhJeQw730dUNzX0OwWDLxoNHfsb5ziENxdOL6jAajy6GQLiuPQBX
 fr0HJugZzvpg0tAZeQT71VZBL7AMgi4Srj2PlXnmFshTWSD+B4/PwdHoLtE5lWEdq3Yn
 BkQdkC0ohJEdKCaCv16heDg5tJW9RycOQcHdxr8GizbxVSOfudLUnlne3pbf3W6e/ZU6
 jzSZO225082HPBeAKmti9VYPsUH2Gz6Hw9v/O5Gq6cd5lPPX8NMUXXmcCWh6vvBS1iHz
 ZU9w==
X-Gm-Message-State: AOAM533nH680Jgi3b28F6Vql9a4rLx+H6DHzipUhMvOgU+QKRdx0IYEq
 IffGWQccG1x5krjpOAqKhtJkXpFPcUbrYn0+sbtjgA==
X-Google-Smtp-Source: ABdhPJzDGeojNw7I+D9/Q7eW0grf3LDdqkTv+/FnRYaAGPuKeMRYFm+g8lQXX1H8/begn/XMC+R1eTY1NiPkP69InEU=
X-Received: by 2002:adf:f001:0:b0:20d:22b:183c with SMTP id
 j1-20020adff001000000b0020d022b183cmr1403508wro.313.1652546927571; Sat, 14
 May 2022 09:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220514152032.758738-1-ulf.hansson@linaro.org>
In-Reply-To: <20220514152032.758738-1-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 May 2022 22:18:35 +0530
Message-ID: <CAAhSdy3m3FzbkL-On5kPtrZgyO4x=6onr6mXi_=te5B=m_n8GQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Fix regression leading to no genpd
 governor
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, 
 Maulik Shah <quic_mkshah@quicinc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_094850_140406_19F523AF 
X-CRM114-Status: GOOD (  16.83  )
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

On Sat, May 14, 2022 at 8:50 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> While factoring out the PM domain related code from PSCI domain driver into
> a set of library functions, a regression when initializing the genpds got
> introduced. More precisely, we fail to assign a genpd governor, so let's
> fix this.
>
> Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index 755bbdfc5b82..3db4fca1172b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -52,7 +52,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>         struct generic_pm_domain *pd;
>         struct psci_pd_provider *pd_provider;
>         struct dev_power_governor *pd_gov;
> -       int ret = -ENOMEM, state_count = 0;
> +       int ret = -ENOMEM;
>
>         pd = dt_idle_pd_alloc(np, psci_dt_parse_state_node);
>         if (!pd)
> @@ -71,7 +71,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>                 pd->flags |= GENPD_FLAG_ALWAYS_ON;
>
>         /* Use governor for CPU PM domains if it has some states to manage. */
> -       pd_gov = state_count > 0 ? &pm_domain_cpu_gov : NULL;
> +       pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
>
>         ret = pm_genpd_init(pd, pd_gov, false);
>         if (ret)
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
