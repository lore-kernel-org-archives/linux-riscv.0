Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8D8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDEJQhIQUMnCwywG3st7VGU7ssofpxkP+G7T2M97WNc=; b=ZSg4x0ht+303Tk
	iIReCWCTITRlSU7wsAOM/+SccE2lfRZq/jKTdKYOBnkloO6oURXe9dYL/h+wGcynsBw7UY9MDCXvu
	hVC2HQK1CiZtQRkFAJuYsTqfI5eM+UqYifnQmyDg7yXnQAriGUtCJaxfNoHNDLpc828zT/5VJdWam
	t7B8ujucVxujwySJdfwuQXUpVF5TBT4foYLSFtszmOnLX0EDsORcFwSpejg7oYXU3hFCXaWCO5lD6
	GJyBHn4X51Szh7BswMD3iSqfCHQE40wo0AlUMw1nVYvGVWWqShx7pT0/ZyJhl7Tzf4gwhOvMOpUTs
	u++4uyER5mHJ182UR8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEe2u-00AeRA-1D; Mon, 31 Jan 2022 21:17:08 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEe2r-00AeQp-Mb
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 21:17:07 +0000
Received: by mail-yb1-xb36.google.com with SMTP id i62so44549366ybg.5
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oE1YmZoSx/nWIRjEIBPwgNw6U3IPmomCkQFroxME2e0=;
 b=V+ftJE9mj5wwBvEQpQsLqauQoF0wWGdfdpcMkv8T2la3XBRSFMcv8w8dnnHhnUaCB5
 3ojC0xP6TrnU27Sc2qKY4DbqCNKiJrm4jW/GehbOx12GBIY+WMMpO8S26rJFRe624VfR
 7BH45NDDgnlxdDynfnrKUg6PdwT1TAckp6R5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oE1YmZoSx/nWIRjEIBPwgNw6U3IPmomCkQFroxME2e0=;
 b=HunxVnB1cbvD1AIB7617tKECjn0pQ4LIEh3eu3a4VH8fi26exHhlzUhTZiaNLstwtn
 R618vOfOwGiRrtM+sudBAEaxwQGpGwhu51tdxa3XVVJ0ihehqO0o02tGF0uA3HmF+xhG
 l/P9vneRqluTFDCSVKQvfCbUyga0ymDP5pBtcj730g5xLLZX0c2eaRTlYu1DlgOS9OiS
 EprxriNGwg8uGiMJq2vuxFYTqR+P3u/R1wQbn4gPe0PaOVMbGtq+CSxW5NBY0A1JP9VH
 tXFTsjAu3cF8gkPkxxk0ooea7YhJaBgHsjo4H7moDACHJ9YAEdwU4wVl8YUkFT/wE1/S
 mAPQ==
X-Gm-Message-State: AOAM530PrqGzdV9DbAZWN1Yl/XhgGvzYPRQ8Yqolo4q3/30nsnA5KOTA
 ASVra4C50FEtxw1POuGYwRHEVv1iPIZEf+azecX8
X-Google-Smtp-Source: ABdhPJyobHoVTaYvZPuG5ukRPdncvn3ScCVvPWllSJaJ3m2s7Px6ynK2uGfLdn+Yx1gIy4RJSQxM+49wTVK18fahP6Y=
X-Received: by 2002:a5b:44:: with SMTP id e4mr33205228ybp.713.1643663824956;
 Mon, 31 Jan 2022 13:17:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643635156.git.geert@linux-m68k.org>
 <35936f19a9727b14e4fdb7f5fadfabfa29d53d96.1643635156.git.geert@linux-m68k.org>
In-Reply-To: <35936f19a9727b14e4fdb7f5fadfabfa29d53d96.1643635156.git.geert@linux-m68k.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 31 Jan 2022 13:16:54 -0800
Message-ID: <CAOnJCUKXOMgn=RmMDGBSS_Zy4J4Ng7EHwWnS5PnRKPTntDHk0Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: Fix handling of empty cpu masks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_131705_760487_B795AD89 
X-CRM114-Status: GOOD (  18.58  )
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

On Mon, Jan 31, 2022 at 5:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The cpumask rework slightly changed the behavior of the code.  Fix this
> by treating an empty cpumask as meaning all online CPUs.
>
> Extracted from a patch by Atish Patra <atishp@rivosinc.com>.
>
> Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
> Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/kernel/sbi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f93bc75f2bc43c8e..22444cfcd56cc646 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -161,7 +161,7 @@ static int __sbi_send_ipi_v01(const struct cpumask *cpu_mask)
>  {
>         unsigned long hart_mask;
>
> -       if (!cpu_mask)
> +       if (!cpu_mask || cpumask_empty(cpu_mask))
>                 cpu_mask = cpu_online_mask;
>         hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
>
> @@ -177,7 +177,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
>         int result = 0;
>         unsigned long hart_mask;
>
> -       if (!cpu_mask)
> +       if (!cpu_mask || cpumask_empty(cpu_mask))
>                 cpu_mask = cpu_online_mask;
>         hart_mask = __sbi_v01_cpumask_to_hartmask(cpu_mask);
>
> @@ -254,7 +254,7 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
>         struct sbiret ret = {0};
>         int result;
>
> -       if (!cpu_mask)
> +       if (!cpu_mask || cpumask_empty(cpu_mask))
>                 cpu_mask = cpu_online_mask;
>
>         for_each_cpu(cpuid, cpu_mask) {
> @@ -348,7 +348,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>         unsigned long hartid, cpuid, hmask = 0, hbase = 0;
>         int result;
>
> -       if (!cpu_mask)
> +       if (!cpu_mask || cpumask_empty(cpu_mask))
>                 cpu_mask = cpu_online_mask;
>
>         for_each_cpu(cpuid, cpu_mask) {
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
