Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673EC27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ta41FxrHp3ZeMDBpXLRdQ6EDlGho75ynQZsKODXRdE=; b=QlQPxT8fgks/BK
	0kGVwDLugzkA9fR+1lej0aMhLZVnVdzQyS/mXdncEK9CjhtntEAlPsBgwMPs3b+Z9XaArGDWIzik/
	bu35WCzuMOkHqhgUxg0L8aZIurWEMjeBmj0rtBoSSCQRmgcYTb7cYewexUqR9qSZMmce/8dvtf4BH
	Cc7GrSGJTGwuc3TaS+UFsM9qNBr1khdpfIlY/kECpbaCyKLzX+1tcjVV3ZR2XhJKuaeLFwkwMVqOX
	w6eB4sDbaqJLGqJl/pjxzJ4Wbe/Pxu+UFe/7zr5vGCFPch7N6Q4cnzuFTaAfrYcVakFlitUHYR2gY
	Jdz7kHHupXx4UnoRhcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmV7-000IZw-Lb; Sat, 28 Jan 2023 14:48:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLmV5-000IZC-Lc
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 14:48:17 +0000
Received: by mail-ed1-x530.google.com with SMTP id x10so7129352edd.10
        for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 06:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lxUpJSfxW1ZZV9lMQmOX9ndF9VezYLbwHaqKcuesvo=;
        b=RtURjaujbaSgYg8dv56Qf+hC1TetbqbHqyIIY6s7dI+APqUXmnRn7NgNPZa+7Ndl5+
         6v7jYHiN8g//VSipATTE3qw/OcyFjSGO0uo0G2XXJOFzZiI97HJhidBHoXSf6Dm3+3d2
         /avcyh3HCkoNWpWxZ6iH7a2OwRQZy2+Fpwf9FXkCvn13xuHzVJ7RMPQHyPFDW3aKPMEK
         wkZuZ3d+k+TLl/d1Kgx+WY5uOM4tbQbH7pgBE/K8rCNmdnhMosXeyzFk1ge/mDutdbVN
         TBgu8Cg90KGe+fOACR0ryUCUIx70yjq5+7aMvln9XLzbbvQTOGk5iHbl6IrZA+QDwFLB
         S76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lxUpJSfxW1ZZV9lMQmOX9ndF9VezYLbwHaqKcuesvo=;
        b=OAnUWZ/voDnPFbyGvkHaCc1MmoseexWlHqChdxWK2iOysZwx+UudncsEKk6wTZI+K9
         AQOCNdqDN4E+/9b2RqUDpYFp+giPLn9HtrC84h8CSWGR2qVfiYss99RwRRFHgp/1Bi/E
         h9qKkBg10TXc/CytgVmB9Y4ssM+LDiTeCOw7L2MnVjWMMiDv5Ez7RV6W59I81jlDMZrW
         s+VgNof0ccQ3vuF3zB8dfX8eufTTz60UKGMXi54lSJk8W3vIOZTO7+hc1K9ZDTJ4efDO
         /GWoVjVNWbeOzKRP2pxpSi1O+FOxHEcawg5/3NpoUsyLE6LtR4UuTCsRoAR6f6LGFm0m
         G8DA==
X-Gm-Message-State: AFqh2krJjwTT5iKldiplsmSVJa7xMgq9CYbS4ObRpiyZTRGA2FFF0H0y
	5WOmUXnGFgKJO1mUCfCXdYBsvUNmzBtVAlocfL5GFw==
X-Google-Smtp-Source: AMrXdXs9+iKP9MWJQn3NINp9DainLk/ZniHxMwWvgN5wV3i7BI6ahOb7PK5VZdkvWkxkVNQKOjTSQ/LsSWIwwxDUJwc=
X-Received: by 2002:a05:6402:4494:b0:49e:89e:c7b4 with SMTP id
 er20-20020a056402449400b0049e089ec7b4mr6940024edb.1.1674917291865; Sat, 28
 Jan 2023 06:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-3-atishp@rivosinc.com>
In-Reply-To: <20230127182558.2416400-3-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 28 Jan 2023 20:17:59 +0530
Message-ID: <CAAhSdy3pCcbscpYa82Daji4bXT0EdosmH3Xn7MjeJPk-zTA_Yg@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] perf: RISC-V: Improve privilege mode filtering
 for perf
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_064815_732185_EB7B62BA 
X-CRM114-Status: GOOD (  22.38  )
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

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Currently, the host driver doesn't have any method to identify if the
> requested perf event is from kvm or bare metal. As KVM runs in HS
> mode, there are no separate hypervisor privilege mode to distinguish
> between the attributes for guest/host.
>
> Improve the privilege mode filtering by using the event specific
> config1 field.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
>  include/linux/perf/riscv_pmu.h |  2 ++
>  2 files changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6b53adc..e862b13 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -301,6 +301,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
>  }
>  EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
>
> +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> +{
> +       unsigned long cflags = 0;
> +       bool guest_events = false;
> +
> +       if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> +               guest_events = true;
> +       if (event->attr.exclude_kernel)
> +               cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_user)
> +               cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
> +       if (guest_events && event->attr.exclude_hv)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_host)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> +       if (event->attr.exclude_guest)
> +               cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> +
> +       return cflags;
> +}
> +
>  static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  {
>         struct hw_perf_event *hwc = &event->hw;
> @@ -311,11 +332,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>         uint64_t cbase = 0;
>         unsigned long cflags = 0;
>
> -       if (event->attr.exclude_kernel)
> -               cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> -       if (event->attr.exclude_user)
> -               cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
> -
> +       cflags = pmu_sbi_get_filter_flags(event);
>         /* retrieve the available counter index */
>  #if defined(CONFIG_32BIT)
>         ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index a1c3f77..1c42146 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -26,6 +26,8 @@
>
>  #define RISCV_PMU_STOP_FLAG_RESET 1
>
> +#define RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS 0x1

For consistency other defines in this header:
s/RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS/RISCV_PMU_CONFIG1_GUEST_EVENTS/

> +
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> --
> 2.25.1
>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
