Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52215C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 01:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMdRS5YfQoiPQT82JOYe6rTV0nqXU2A4lRR58c8HicM=; b=fbtmQ0nPfXXkAs
	2LP9DdwMSG4hvw1mngPC7lXicz0feU0N8ZzfDtGr8Bh5nO19e/lE598ZA+3b+y7YIvDmv6Baxy0VF
	YYPki/UkU4g8Es8UGjtrl0IwK63W1NP2YXquo/4vCGHdEdw4P1jDQYFRMFLj8f/l4s36JT9nD3grl
	TklXtR8sO6Gak9wN/mnQCekN9abIRAxbCl3To89WzkzT54afe1Rw+x0co+WKAJjLs6dzj+oLpHrOc
	JheihTSrdmIzldaU46yFr8vcIQb/SwRW7kbDaFU7J3Qrv3vJqn0QYPuRJErUzdH+kjfpJDRgCbjIa
	oS9YJG1HaSzKILJqI7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4xn-006Xlr-TW; Tue, 12 Jul 2022 01:45:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB4xl-006Xj1-3n
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 01:45:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5488B8161F
	for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 01:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07AECC341CF
	for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 01:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657590316;
	bh=ug3EM0lWD6FBtLJmvnDlTpopo55TsPF/PU14j4ote2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZWk4O0+SICYK/UoA6NSPCMfkpdSVKyDu4idYp1/QzOCT6v1w9Wcq8WRtbTGOv5als
	 7Kj7D7xfU2VOpmglfedxu7/uyD13jxIaB98hSTw9+24rFyHB31uf8TMyYVA7Nji78L
	 SGpphqI7Io28zZgGg0iC5p/u9bQu+9aJkvN+7Y0EjkZJ2CFjC9TwFieq4ePd1eu6nN
	 e5dciWgwyWTsBQUw8EnGgkYbxlW1lZLCelKkF1gsQPnGopo/hY5km95rEieLDy5NN5
	 Su+oyuyiicHd5gp/nBRohCsHL+a1hPAa3B8oEJneIgYqAYEdEW2KekIDS6JSBjKtoL
	 aeQcJRlfAzaKg==
Received: by mail-vs1-f41.google.com with SMTP id q26so4101654vsp.11
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 18:45:15 -0700 (PDT)
X-Gm-Message-State: AJIora+8q8wyZC/zVSMPHd9xI1aMFLlCVmCVnXNbKN+0AqKObrpI/bsV
	2XAnRwUEpMGiTbhNspu+tZqHo+MnzqzMqVoSJyw=
X-Google-Smtp-Source: AGRyM1vAwFRACPEu1U1egIdw7WpvZsw4rgeb1YS+FcEt4kHUvLXb3rS/nPFG9yOVaqbk2/arVNwfuusgtfiULf/141s=
X-Received: by 2002:a67:e311:0:b0:357:58a3:6878 with SMTP id
 j17-20020a67e311000000b0035758a36878mr3266147vsf.2.1657590314910; Mon, 11 Jul
 2022 18:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220711174632.4186047-1-atishp@rivosinc.com> <20220711174632.4186047-2-atishp@rivosinc.com>
In-Reply-To: <20220711174632.4186047-2-atishp@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Jul 2022 09:45:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2G7A5+sdhrvuMxtVEwOxS976EguP6Fp1uxhDaxGZfYg@mail.gmail.com>
Message-ID: <CAJF2gTT2G7A5+sdhrvuMxtVEwOxS976EguP6Fp1uxhDaxGZfYg@mail.gmail.com>
Subject: Re: [v3 1/5] RISC-V: Fix counter restart during overflow for RV32
To: Atish Patra <atishp@rivosinc.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_184521_346772_3F1005DF 
X-CRM114-Status: GOOD (  15.91  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Tue, Jul 12, 2022 at 1:46 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Pass the upper half of the initial value of the counter correctly
> for RV32.
>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..0cb694b794ae 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -525,8 +525,13 @@ static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
>                         hwc = &event->hw;
>                         max_period = riscv_pmu_ctr_get_width_mask(event);
>                         init_val = local64_read(&hwc->prev_count) & max_period;
> +#if defined(CONFIG_32BIT)
> +                       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> +                                 flag, init_val, init_val >> 32, 0);
> +#else
>                         sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
>                                   flag, init_val, 0, 0);
> +#endif
>                 }
>                 ctr_ovf_mask = ctr_ovf_mask >> 1;
>                 idx++;
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
