Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E490C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAKHL63q0JC1nGTFUMtXs3Zcm5Hkww7FWPGC75mwbNM=; b=qkqqJKkyPmx94s
	N3x321HE6FKnLjpxF5cSPACquD5uZ7u0DrJSWkXwDDX5JTceRJW4CE3Z7+WNAWkhRyeLgaO+yydwe
	aZ23Rqt3yGvn7kIA+dBVCUNy+1D3x301CUnYiRfyEPMJDxc1O0e8hPS4M9XOloafweErYDW0NHL42
	XhIeakITsVe/Hbn+Ey67FJB/DKKi3VDyytblFntWyt+roalFXB849PsECQEL/IIluSTSg0XoRcZ7j
	IWSGuO6XYwQyoFDpnbN/RavbcG+PXXPnIVs7yU8ACBx6KnpCmIr9Ac8KMqkFYX/f3ivPjNIBtyIhm
	Z/+Vzp0tAe9YzEGw5AbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXKL-007OA8-Bu; Wed, 12 Oct 2022 08:42:57 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiXKI-007O7w-84
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 08:42:55 +0000
Received: by mail-ed1-x52d.google.com with SMTP id m15so23459797edb.13
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=096nZF81b1D12ii7TVdwo0GKEaFqtBX6kHbwyA9xkjs=;
        b=4e2k4kYleevBG2qRYo9wW+tbYP81M6M2BYGFNoSgnqZlElezE4tdekCM044rcprUa3
         IWffV3ZWpJjNkJKCofHRJOvAsI/b+UJhXJJaTgJ49VRiwIPrEsZnQIUH8OXoj/AAxkZn
         DLvQdL0O+Le51LJgHqtWz/BQ7cZgQtqvJM3vRZ+J4l+mKGY04j/wiqjMD5CPpZo7pGTR
         3romyhuOIHx/z4cDpyFT4IvBYgjsUCg7fcNNb/1QFTSbwF6brgMZA0h4tyFlIF7iWOJs
         Vm2tijMSrQrOKIicI0/2fBJAgYxappzIWhDKIxiSZ7GxLb82hYPfAHjmmt20o3AGVNGL
         Z4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=096nZF81b1D12ii7TVdwo0GKEaFqtBX6kHbwyA9xkjs=;
        b=bRD1sHv6QLCEjri9MlQrn1bSKN/wEnjBrqSMWObM1Ln6iHaS04Wpn1gm1ArQRYk0H6
         cJW1Fibh+ztZTFppCdhqls3/4hI/al/mSi97BCvdShbfbNI2tEd+6eQX42ienDdKKKOT
         VHB2jfDY+lalho3+0GC8kK+pApV7L2Q1RiEuPcNiTsXQznr1g6LXyRhx+KrSc7MdSG3d
         KnbX0/8d40cCnYwdJbRKrv9dgoS9rXf1dA2Nski77VhGNmRSl7j3usLT+oz9rEKNNa7g
         szYOOzIfqk+DoLC5DV8IngAIibOpL0MCBck/CQe3T1LCQB3n3WRImzJe+z8c7pEYWJkK
         lTdQ==
X-Gm-Message-State: ACrzQf2tTe9JbLDV0nzOi9QG03PYrUc9mUv9ss2r2C17/lcWAG6vfvQb
	0i9cLUWUe9cp/tRfCSjYMOdC2hsneeeB1h6IAMwB3g==
X-Google-Smtp-Source: AMsMyM4iYsC35jXTI98Y6tQPeI1Q78rw/L40ioWayj86T2tm5+4ql/rqPvCgfIsKQg6nhlFeKauy2lkkyLKzQi9hcu0=
X-Received: by 2002:a05:6402:169a:b0:458:fe61:d3b4 with SMTP id
 a26-20020a056402169a00b00458fe61d3b4mr26147347edv.140.1665564162929; Wed, 12
 Oct 2022 01:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221012082949.1801222-1-ajones@ventanamicro.com>
In-Reply-To: <20221012082949.1801222-1-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Oct 2022 14:12:30 +0530
Message-ID: <CAAhSdy08e52Lg_AEuByDV0dwrA7V_Bu5Fc2ZOHg5ufmY8fnU6A@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Yury Norov <yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_014254_687360_11D36598 
X-CRM114-Status: GOOD (  20.80  )
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

On Wed, Oct 12, 2022 at 1:59 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
>
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
>
> which will issue the warning when reading /proc/cpuinfo. Ensure no
> warning is generated by validating the cpu index before calling
> cpumask_next().
>
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Cc: Yury Norov <yury.norov@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
> v2:
>   - Got comments on the x86 equivalent patch and made the same
>     changes to this one
>     - Added all the information I should have in the first place
>       to the commit message [Boris]
>     - Changed style of fix [Boris]
>
>
>  arch/riscv/kernel/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 4aa8cd749441..63138b880b92 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
>
>  static void *c_start(struct seq_file *m, loff_t *pos)
>  {
> +       if (*pos >= nr_cpu_ids)
> +               return NULL;
> +
>         *pos = cpumask_next(*pos - 1, cpu_online_mask);
>         if ((*pos) < nr_cpu_ids)
>                 return (void *)(uintptr_t)(1 + *pos);
> --
> 2.37.3
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
