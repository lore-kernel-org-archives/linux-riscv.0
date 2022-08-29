Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B550BECAAA2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 03:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SD3vZWBynYzGaMt16Lsa72uKLdyZNxT6ETVTeO+iTqA=; b=QWXIU8RJjBqVyX
	ojNgzd31MzGcEriKK4rKJOvDIYFOgMCQuhDJqXHpF8u4/2ilC8YAfCcRS8eHDjFFPVzMYLWJ/Fu2g
	lUX48xboXjIB5jTq3kIGFsL1MoIVAGcsC8pwUuQKtOTuhcffionrmKFLBvlGKsdSt7soXbbP+4ZCi
	UAClWfE8TiSUeTjiLUOXbqh0NxlMisIMle3GPVciPjovUsPOgSrfI9TX3r7bpBeuFfNAX6swOBDcT
	1P4SBe8u22t/qAYOY8Ecxe5accgVMX04rTGwehiJAbEo5z+gDNH/HO4e1m6tY3IuaY+6sqS0ptOiJ
	r/EFDeTl2sphGifrLkow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSV0q-003vRG-F9; Mon, 29 Aug 2022 03:00:32 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSV0m-003vOK-9V
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 03:00:30 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-33dc31f25f9so164431817b3.11
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 20:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=FxEqGVOxWo4CfjZbtxIGb6qGKvvik/aFKVrft6obxao=;
        b=Ls6cq9vBmUp9sU96vVz3RUD5Ups9j1qMMOUCDJGBfRwWfZmcptBunhaKBP1bY0xDRl
         mDbPVoKd0xLW4LcA73K8vDo5iFO6JzlBT35KedPwWKWrEkrcx/W2YucdD1ef8IcsW0ra
         aQUNRHz1fQ5eE4YiiLsGIe2rxAn5rscIPWB4xkl1Su0YzmYWD8Nj6jpRqXyloArxhfpJ
         HVeAK84ZNeDyPtc9yxTFLqZNYQdQnGVgD37bFpWf3vndNUaJzqgiKFzDqGi/CLdT52pZ
         f57c7IIhG0uNgW+lvvq0QpNI1ZERNGlyJyZpJQgt8EKCK0xYIxWplDx087/XyyHBNUh4
         iJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FxEqGVOxWo4CfjZbtxIGb6qGKvvik/aFKVrft6obxao=;
        b=58xI/tZc7tErWFPTQIk919lyTwR8X3/T3S0kmPsRArikxWohtZBl+aH+iUDjpRkTK0
         ycWgsdueaVTKbyeOxarpZcklvg9AN6Q402Fuc+B1mL/GdJtD/gs94qcfPtQAHLI9cyFy
         GdYmTb/uDSuMeiNAV8tOcpZwWJVpg+h7pbiZdmCkYlNL8gwQud1iqBHCqpG7WoyVRSZg
         J4vMZe9HVvYrqao+mp0Zv/Bus4f5lfcxzvses+NtZ491+lgPCd9INuvVFKcsaDxUyptd
         0yV4BLEqrAXfP70y/Uds71YyWr4EvyTz/areoGGj5VEk1lRPr33HPnGIIDHwgcWJ4d8l
         aPGA==
X-Gm-Message-State: ACgBeo2wemu1ue+mT7rhPe8+AouZaCd0B25bz6jDx5Y4AP4Yf2vN12pp
	XPlOpBRdyO/+L/hAzOnSZqYyY3w2bOaRMx+tBCZMzXbjaAU6tw==
X-Google-Smtp-Source: AA6agR5RekBOHwggN87C/mXTpSYMdD1Z7xcNpSwA3k6eug2L7ykiVE/1ZIcjpE57qLb0Pv2zwkP/FZ4X0nMEJXKN9P8=
X-Received: by 2002:a25:253:0:b0:696:4000:8844 with SMTP id
 80-20020a250253000000b0069640008844mr7310831ybc.619.1661742025413; Sun, 28
 Aug 2022 20:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220718084553.2056169-1-apatel@ventanamicro.com>
In-Reply-To: <20220718084553.2056169-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 08:29:45 +0530
Message-ID: <CAAhSdy0zGaZXoJHVAN+2n1sP4+2rsfo+G874NeBMgrhBeEW2ZA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Fix CPU_PM_CPU_IDLE_ENTER_xyz() macro usage
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_200029_001222_722460A2 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Palmer,

On Mon, Jul 18, 2022 at 2:16 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, we are using CPU_PM_CPU_IDLE_ENTER_PARAM() for all SBI HSM
> suspend types so retentive suspend types are also treated non-retentive
> and kernel will do redundant additional work for these states.
>
> The BIT[31] of SBI HSM suspend types allows us to differentiate between
> retentive and non-retentive suspend types so we should use this BIT
> to call appropriate CPU_PM_CPU_IDLE_ENTER_xyz() macro.
>
> Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Can you please take this patch through the RISC-V tree ?

Regards,
Anup

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index 1151e5e2ba82..33c92fec4365 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -97,8 +97,13 @@ static int sbi_cpuidle_enter_state(struct cpuidle_device *dev,
>                                    struct cpuidle_driver *drv, int idx)
>  {
>         u32 *states = __this_cpu_read(sbi_cpuidle_data.states);
> +       u32 state = states[idx];
>
> -       return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, states[idx]);
> +       if (state & SBI_HSM_SUSP_NON_RET_BIT)
> +               return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend, idx, state);
> +       else
> +               return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
> +                                                            idx, state);
>  }
>
>  static int __sbi_enter_domain_idle_state(struct cpuidle_device *dev,
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
