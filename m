Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E792C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOKTp/3zm+Wu6+33GRkAOYZx/mrOwrl2bE9MdQp8gAs=; b=ZD6H09lRqqcyE3
	SviLssQnW0qSzrr1+ja1Vn3r7vtg0NhJnmxSxB6zAN5z8BcQ7n3hLV3+XdBGP+DU6JvSNBrFosoJ9
	3gQUrP45nAa6eglu5DFKJqslCeO7+/fiLmj43EJ2siSoEO3GY/4XiC13+sjkrQ0AwQKsoRzvW4hOE
	/tE3caai8v7Kq1D35qQef1Xb1jboMvK6m+4MdVVBBC81PC7ngeBuTKZUtXZ7dLz2vnQO/UKId4iEP
	mFjdQ28oeHla979NwYxN+7PF9aaQMS7HbYpmZDzm5aelIxfTZl8Vjx74EzZJZRLteFvgfv8hWNiYw
	0yC04khOY/BJzRW1YCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npuva-001qcO-Se; Sat, 14 May 2022 16:47:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npuvX-001qb8-90
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 16:47:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id t6so15106798wra.4
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/mgIjRvvJPY19sTVzBgUbBKV/toAZXWOr19sK94Ueg=;
 b=FnLI62tda7G4LUCDCeToyihFzqCLwmokw+LF+XC/D2mcefciSGP2A24Igxnhkkhahc
 vRvtv5rMVO2/vot6MWLs7i+BA9EuNCGusNNxfsWkF5D2sDrvpcnkRgDaLq+nVeIIhGNN
 LscT7xk/lrUsi0/oGm6JQpcsNHpPzodIUkHRGPUVcsidAuObpjxwwF0yzekrXG7igOgg
 BDmhv4snk6f0ykJPqElje/EJsyubnaGWxri4UaWNnz3oMQnmM1qWE1WRsoi3cR7XRCSy
 Pg2ICmtFYTpGLHnE9/elllsWYTHKc+63SC41gUBrvWrNGsVnE87liAaIl/3wKnsgQkzE
 jLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/mgIjRvvJPY19sTVzBgUbBKV/toAZXWOr19sK94Ueg=;
 b=I0AdOnoF4rkpzSFRL7W8Bs7r2TA0WMjkaXM9S1ju6fKdxKa2KEZYkx2FsbLURnEwog
 tMv1h3Ke7VRoQNg+deUQeAmQwO6wAxNg9EUy6PfmTE3Cb5tNGc45G/j158o2D6wmWJnH
 NXcTAKOtQyikWJgEDFABCIFbADgkqE7zy9KLbwK2bsiZSn43b/eAB1bzxltSkpvXop8/
 iRyDuhA7aOglMJSHe6Y7zHwcAuwVMnpP+FEzPo+hW+2QDoOmI/UHsQyNdvzfFe1/z04/
 p13lWvJqACoOFlbHZW3AZAUl+T2UvMDFCmoV8E+5a+n/cCPNSP5IarHhrWC130Mu3+PQ
 JBPQ==
X-Gm-Message-State: AOAM532VuUNxO5eBW2eHbV/LvOCpmy8MNUAVBLQzSzeTSs55ofTHk40R
 eLZvxh36aDEILdRmSelm3Js9EoZfcNqbEj+CeZ1q9w==
X-Google-Smtp-Source: ABdhPJxUfYpE2VhGuI45d7fw+1N7B/jx3qn+wllVENZjJFA+V3lCXac+BxeHu6VSjPf+yHW2DPEhjWtwJvgc5wit8dM=
X-Received: by 2002:a5d:6483:0:b0:20c:5c21:5c8c with SMTP id
 o3-20020a5d6483000000b0020c5c215c8cmr8122994wri.86.1652546852805; Sat, 14 May
 2022 09:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220514152044.758802-1-ulf.hansson@linaro.org>
In-Reply-To: <20220514152044.758802-1-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 May 2022 22:17:20 +0530
Message-ID: <CAAhSdy0=jvJ-Gqx7CEeRS+ZSBS8mEaZiZ1vT5p=47n=p3wBaBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] cpuidle: riscv-sbi: Fix code to allow a genpd
 governor to be used
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
X-CRM114-CacheID: sfid-20220514_094735_568746_216FE1D8 
X-CRM114-Status: GOOD (  19.80  )
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
> The intent is to use a genpd governor when there are some states that needs
> to be managed. Although, the current code ends up to never assign a
> governor, let's fix this.
>
> Fixes: 6abf32f1d9c50 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Looks good to me. I have tested this on QEMU RISC-V as well.

Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index b459eda2cd37..478970fa3b0c 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -413,7 +413,7 @@ static int sbi_pd_init(struct device_node *np)
>         struct generic_pm_domain *pd;
>         struct sbi_pd_provider *pd_provider;
>         struct dev_power_governor *pd_gov;
> -       int ret = -ENOMEM, state_count = 0;
> +       int ret = -ENOMEM;
>
>         pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
>         if (!pd)
> @@ -432,7 +432,7 @@ static int sbi_pd_init(struct device_node *np)
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
