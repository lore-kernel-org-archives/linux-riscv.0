Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A691C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Mar 2022 22:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LY15zbFta2vFW6jzr9PWy/CdZY3rzjNf/rlmuyhknUc=; b=2LoK2imE88NDPr
	kqK5ieXEBtihu2vcFhBS3ZktoLBNXhwmtf0WjZ2O0GjXT/RNMqELz6XNhngNO8hGFHTa7q6lpeiAj
	QJydCGjDl5JlOA3ney7Mmxd4wKJTjTV9QhdFUjkRSnRBZEbEfERYJG+TdoYm2879dlHKuk4/IFiuL
	zHyaSyeujHtYyFP61/SsDnHLkGr9YUNrFy7tdo3wN4rwU2ig5qdYg00G6VrD/mVcxmqib+vsUlvvz
	f3xVSxyIzYkCMeEcL5zsEc2KLc0fWhsjeMK0VpYwr9LYT4QQAiReHyI5n/14be/58bDg2Jf8QRkha
	eSoRk24ogxH8l0FdjbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWn9z-00CMq7-8m; Tue, 22 Mar 2022 22:39:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWn9m-00CMoJ-Mj
 for linux-riscv@lists.infradead.org; Tue, 22 Mar 2022 22:39:16 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e64a6b20eeso68472187b3.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 15:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZNSeafrE1nmbZ7HSkTix7SZpM+7OtfLvB9wwfIPQnVU=;
 b=YfpG3zrHM4XGX58Gp4i9zVcqKUf/p4wAvaNN8+2adT/ZK1z44LeJlwbwUZfZP7QZMe
 zalNYKjApH4UDG2bKi0T7Z5TO/uQ2kVTGInsCSUDFuuYZSp7ebjPiPufFKPNZfvn1Y+J
 QKhSXFaqR3FYw2fbkbwUiYAarv4MPfDJyHZh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZNSeafrE1nmbZ7HSkTix7SZpM+7OtfLvB9wwfIPQnVU=;
 b=U7wtZEaZ0pGHdftl/HhWx21/ypG7UWvCnme0OblkJ4gCaXxS+dq1TZttGWT96ggiJH
 bL6jxeCZK+B+x7oboSajBg8dKnK8i4xLjdlnbrXJr3cKRJHm1B4NzTS4rd05ANeUOXVK
 rUtQrBPMCsLMCLuUK0aa+hrD+TtanmBP4vD9EntEeqYsatTLQzgsqv1NOtlojB4zL7NB
 xkAxyZPztJJP896Q0Uuzpexx64OkzOzdnZ59xfDUtcX0xg1z7uWEDE0bHjv9vON73rE5
 w2bwbjq8xH1UQ6+TLjVBTc3jiG5lWoIicdbLONxWDBz7G4B+4IcetQZkAvtTP1imD0L/
 uClg==
X-Gm-Message-State: AOAM531hLaFF1Nl4y7cFSlBjj6LfjxdKoElPBx1nL6PyBmbUC8EA9aKR
 lOubM4ZzIHZaxJQH7lSeW28VGl+GfHH8mZHtSeEx
X-Google-Smtp-Source: ABdhPJwGylMq9FNbaaZRwaP1kpc9KskXKzv38UDmB8eQIrg0xAGndakGfimL3QxqgIpkVpmFTD66yyPZkKin3+e4wzE=
X-Received: by 2002:a0d:d757:0:b0:2e5:beac:5b48 with SMTP id
 z84-20020a0dd757000000b002e5beac5b48mr29717878ywd.478.1647988750394; Tue, 22
 Mar 2022 15:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220322220147.11407-1-palmer@rivosinc.com>
In-Reply-To: <20220322220147.11407-1-palmer@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Mar 2022 15:38:59 -0700
Message-ID: <CAOnJCU+udBVYwoaaB-UOUY2owrCrrLfSRJW7p=vjAkhOF8bt7Q@mail.gmail.com>
Subject: Re: [PATCH] perf: RISC-V: Remove non-kernel-doc ** comments
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_153914_813303_EAD338C4 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Mar 22, 2022 at 3:02 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> This will presumably trip up some tools that try to parse the comments
> as kernel doc when they're not.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> --
>
> These recently landed in for-next, but I'm trying to avoid rewriting
> history as there's a lot in flight right now.
> ---
>  drivers/perf/riscv_pmu_sbi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index a1317a483512..dca3537a8dcc 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -35,7 +35,7 @@ union sbi_pmu_ctr_info {
>         };
>  };
>
> -/**
> +/*
>   * RISC-V doesn't have hetergenous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -477,7 +477,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>
>  static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>  {
> -       /**
> +       /*
>          * No need to check the error because we are disabling all the counters
>          * which may include counters that are not enabled yet.
>          */
> @@ -494,7 +494,7 @@ static inline void pmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
>                   cpu_hw_evt->used_hw_ctrs[0], 0, 0, 0, 0);
>  }
>
> -/**
> +/*
>   * This function starts all the used counters in two step approach.
>   * Any counter that did not overflow can be start in a single step
>   * while the overflowed counters need to be started with updated initialization
> @@ -563,7 +563,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>         /* Overflow status register should only be read after counter are stopped */
>         overflow = csr_read(CSR_SSCOUNTOVF);
>
> -       /**
> +       /*
>          * Overflow interrupt pending bit should only be cleared after stopping
>          * all the counters to avoid any race condition.
>          */
> --
> 2.34.1
>

Sorry for the fallout on linux-next. I just realized that these came
in with the BUILD_SUCCESS subject line from lkp for me.
I was filtering those out to a separate folder and missed the
"warning" part in the subject line. I have fixed that.

Reviewed-by: Atish Patra <atishp@rivosinc.com>



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
