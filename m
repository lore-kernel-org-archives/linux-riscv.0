Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18DCC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z441MCMwwccTDF/2XbEarwPF/+p5hdejodHhPVcjpnQ=; b=wdsdi1yS7Pc4Mj
	zC2YykNRWft29ahW5Rw62Ppsie4kMSkRUOwS+XHti4iC3vnvcYqDDPvyacLjFYb5Z75HPQUDz72cg
	vVCpLlKRCb++MOiVVYeAhIbv0BwkvVuk/nkC5Ff49VQdzuB9O0aqzomnDw2cKFK8sXfDi5JGsEn4Y
	i4m+IwPjZGweCq8bWY/K3dWV9dMOqm9iPG8aRa8fhSgO62cVgjVonO58Ku/FOlsRICfo6V63XlSNM
	BRce3I5NAjY3aY7dv+1DAobNTStW0Wpr2ZcV/1Hb5DzGmpFWnc1yE5tlYE3zp7Qj88T+jFXvaRVBa
	9w4lSl6/ysHgK/adn4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEe4J-00AeeR-SB; Mon, 31 Jan 2022 21:18:35 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEe4H-00Aedf-MN
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 21:18:35 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 23so44570405ybf.7
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 13:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLrElREa9gDRrr3UXLFE3XuFDh6Kk9U69RG+VXKvGAY=;
 b=cK2gP/SNjAb/GGapc6aQslme4aLhccD5fifPcCE+Agf31/qOs58VZKrnIp3VBfGR0S
 pJCWjuso04ZRB+4ANK51tw64K1/528UomxxCxRvxJu0wR3lsJniHSM64V/Y+o3gopKaK
 WlRavGpcYXSbJpc1wxUgXicxidTT0CLR6Ms48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLrElREa9gDRrr3UXLFE3XuFDh6Kk9U69RG+VXKvGAY=;
 b=QU3Vs+4ek4UIloGCVkBjowrwEgkNBb5KT6/jy25u4QHT6UOG+T+JBQfpKqhMA8JPBz
 efZ3H3nWAY/ysaXTL1T6oQh5FpIdqC578tA3yEDPxYeJjY71eaUiqbayeinwa6pSy+Te
 OErK6jL3HfX84BhiKO5SxcfDBxGEQzNqjjYBS153Gx4gBxfl+i/sEotKvo+r1wE6B1cz
 k/MjULkoAvZ7O0eqZluhXC1ZU6kWoeKxWeAJr2nkQhVClTCoj8OxJx2EK9dJtmp6wJhN
 R0w3VnUNia8EKSBZrs5qSvu6bkZGLUsyesJS0og9ZEoaXKxTpT1uFEu9LOj6LA/Wg85C
 uaCQ==
X-Gm-Message-State: AOAM532l2M5/Be4AU72mL6ZJV3g1eXjcibq8bwnag/1dNEuWn/2JkdWP
 MhX8UhqsjqRYnFnrp9uDUwlK52kOriPi9R6oQ0eP
X-Google-Smtp-Source: ABdhPJxbbjH8EQvopZaSQLElFVMM94MroU6dmol4AZX5EYJ8t8s1wvX8PYVHbf8mXK3Z7I3vcl885DKJiCimKgMkttU=
X-Received: by 2002:a25:bd08:: with SMTP id f8mr24421228ybk.121.1643663910806; 
 Mon, 31 Jan 2022 13:18:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643635156.git.geert@linux-m68k.org>
 <a45b0242160d97b312c64baec4f45d9f666cbed8.1643635156.git.geert@linux-m68k.org>
In-Reply-To: <a45b0242160d97b312c64baec4f45d9f666cbed8.1643635156.git.geert@linux-m68k.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 31 Jan 2022 13:18:20 -0800
Message-ID: <CAOnJCUJuOxNZvUQ0-Bg5STr=OzkqaS729RQevmQyfDMXNLG8ag@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Fix IPI/RFENCE hmask on non-monotonic hartid
 ordering
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_131833_761011_14B2C82C 
X-CRM114-Status: GOOD (  25.76  )
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
> If the boot CPU does not have the lowest hartid, "hartid - hbase" can
> become negative, leading to an incorrect hmask, causing userspace to
> crash with SEGV.  This is observed on e.g. Starlight Beta, where cpuid 1
> maps to hartid 0, and cpuid 0 maps to hartid 1.
>
> Fix this by detecting this case, and shifting the accumulated mask and
> updating hbase, if possible.
>
> Fixes: 26fb751ca37846c9 ("RISC-V: Do not use cpumask data structure for hartid bitmap")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/kernel/sbi.c | 57 ++++++++++++++++++++++++++++-------------
>  1 file changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 22444cfcd56cc646..775d3322b422fe14 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -250,7 +250,7 @@ static void __sbi_set_timer_v02(uint64_t stime_value)
>
>  static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
>  {
> -       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> +       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>         struct sbiret ret = {0};
>         int result;
>
> @@ -259,16 +259,27 @@ static int __sbi_send_ipi_v02(const struct cpumask *cpu_mask)
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
> -                       ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI,
> -                                       hmask, hbase, 0, 0, 0, 0);
> -                       if (ret.error)
> -                               goto ecall_failed;
> -                       hmask = 0;
> -                       hbase = 0;
> +               if (hmask) {
> +                       if (hartid + BITS_PER_LONG <= htop ||
> +                           hbase + BITS_PER_LONG <= hartid) {
> +                               ret = sbi_ecall(SBI_EXT_IPI,
> +                                               SBI_EXT_IPI_SEND_IPI, hmask,
> +                                               hbase, 0, 0, 0, 0);
> +                               if (ret.error)
> +                                       goto ecall_failed;
> +                               hmask = 0;
> +                       } else if (hartid < hbase) {
> +                               /* shift the mask to fit lower hartid */
> +                               hmask <<= hbase - hartid;
> +                               hbase = hartid;
> +                       }
>                 }
> -               if (!hmask)
> +               if (!hmask) {
>                         hbase = hartid;
> +                       htop = hartid;
> +               } else if (hartid > htop) {
> +                       htop = hartid;
> +               }
>                 hmask |= BIT(hartid - hbase);
>         }
>
> @@ -345,7 +356,7 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>                             unsigned long start, unsigned long size,
>                             unsigned long arg4, unsigned long arg5)
>  {
> -       unsigned long hartid, cpuid, hmask = 0, hbase = 0;
> +       unsigned long hartid, cpuid, hmask = 0, hbase = 0, htop = 0;
>         int result;
>
>         if (!cpu_mask || cpumask_empty(cpu_mask))
> @@ -353,16 +364,26 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>
>         for_each_cpu(cpuid, cpu_mask) {
>                 hartid = cpuid_to_hartid_map(cpuid);
> -               if (hmask && ((hbase + BITS_PER_LONG) <= hartid)) {
> -                       result = __sbi_rfence_v02_call(fid, hmask, hbase,
> -                                                      start, size, arg4, arg5);
> -                       if (result)
> -                               return result;
> -                       hmask = 0;
> -                       hbase = 0;
> +               if (hmask) {
> +                       if (hartid + BITS_PER_LONG <= htop ||
> +                           hbase + BITS_PER_LONG <= hartid) {
> +                               result = __sbi_rfence_v02_call(fid, hmask,
> +                                               hbase, start, size, arg4, arg5);
> +                               if (result)
> +                                       return result;
> +                               hmask = 0;
> +                       } else if (hartid < hbase) {
> +                               /* shift the mask to fit lower hartid */
> +                               hmask <<= hbase - hartid;
> +                               hbase = hartid;
> +                       }
>                 }
> -               if (!hmask)
> +               if (!hmask) {
>                         hbase = hartid;
> +                       htop = hartid;
> +               } else if (hartid > htop) {
> +                       htop = hartid;
> +               }
>                 hmask |= BIT(hartid - hbase);
>         }
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
