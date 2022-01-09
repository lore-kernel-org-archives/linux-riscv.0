Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1FEC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 21:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ipM3363H+lEGz/wtDRksadTeVcvhHTb4rW3e49HwWPM=; b=OD5AxI8wOG8I+9L21GQU3uSc76
	fe+tUl/WwzLUEia0/EIG9dm0/WNpuLxt34muygdnRHgdHxXfB/JsHi1Et0lnY41nl4FxDlxftnySo
	/9M2v/G5Rqi4C43VX5MbIgf9DSz6O9yxzrB/PYcWFKcNv37q+2S71M5Zq49yoABQYDFEKpmDcrCRC
	8/EbK3OLXC/cC6mXmln7CCfNrI4rPaphuYLEMFT4DxVdw8OITlsHcivyycg5hWT+Jmi9Y7RhsnyWA
	lm6yqB63tby0Rw9BmfGmkllVt6fFBzrupU9bVCcSEV3t5RrJdTwp2feJ6zcC3HSuAWY+1G3BH29Qt
	oYBCsENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6fty-008QqE-BX; Sun, 09 Jan 2022 21:38:58 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6ftu-008Qpb-RL
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 21:38:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z3so10389713plg.8
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 13:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rXdw2GcIBdIhjQSHYqX/xAztXUoROrQNXwxR+5wqtUc=;
 b=AgCkFBOYRL6wzgk9rUUtc87/SGNgoOCSNZvxIiEmHu8N65NJ73I7/1fkgcdCabpBya
 sez0kaMYbpf3hBENHp/9iJ6/1NJjScfXXRLN2BIqNQ9z/UnkrwPE4JtAQm+4Ry/NcsZV
 xqBYwshVDlri3NFFMasZ8qU7nPR97cKsDyWa0IyTbTuJ76O6MUG6E11F34sNugcleyWd
 /ekK5I8Kb+3dVeXqBzdBYSAJCMIJkGMDw4VpBT1KjU6Lsls6gecbzPRI1cU3sLNRqIb5
 UTbE+8X4M0Nn8Fsn4MZlKuZKtZKSjZCjqZ0r6TiMddVqeRFkJlQscHOxOl+qoH4H6Y0W
 K6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rXdw2GcIBdIhjQSHYqX/xAztXUoROrQNXwxR+5wqtUc=;
 b=J/HtJLN9l8EXzJtOEB7I+Giuh+n/5RRaPucMtiCC/q+A3UJA1dNg+U6wNKcLAGzk0B
 hSPmVbYL8rfz4RzusMAozQUQMNlgUL74WlIqdAKrYCQcICLLWRYFAYyd0FoOkPgNxp++
 2AuZJqTgJBr0Rk3BCnfC3bS14IB3k8/qUIzI074tDDwp4sAW/O+29bb5amY0wxAiHyjh
 IzpPjUg+ZjimEqu7TMOVRKUP8qp+JudWGNERS3QTj9ny/gv/1JZXLeBGN+Vc4+PsRMfT
 kz71VjdGlGY5N8JGfvDxuN5jvNtZjWvrFho8uEC8e+WC+ND+MDZbxIloZijFOtyHw7jN
 NyNA==
X-Gm-Message-State: AOAM532iIeuoiWcF9kfzNkEFfSfxNQ5IvFwi0RUTWJ9bz8XjSPzu0XHU
 XkA9MnBrGWe7Z5rJOE3gqX0yYA==
X-Google-Smtp-Source: ABdhPJysUToxCp9VCbTEcOIlt7PoOfuYKVF87cmkQs4e3XpzZEZnM/BsMXSiAxW8rrA31HyQHk8FOw==
X-Received: by 2002:a17:902:7483:b0:14a:2a1e:468d with SMTP id
 h3-20020a170902748300b0014a2a1e468dmr4301218pll.97.1641764333346; 
 Sun, 09 Jan 2022 13:38:53 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id lw5sm6965662pjb.13.2022.01.09.13.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 13:38:52 -0800 (PST)
Date: Sun, 09 Jan 2022 13:38:52 -0800 (PST)
X-Google-Original-Date: Sun, 09 Jan 2022 13:38:18 PST (-0800)
Subject: Re: [PATCH] RISC-V: Use common riscv_cpuid_to_hartid_mask() for both
 SMP=y and SMP=n
In-Reply-To: <20211129214342.1221766-1-seanjc@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kilobyte@angband.pl, anup@brainfault.org, seanjc@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: seanjc@google.com
Message-ID: <mhng-e5835f2e-6232-4a53-bb14-091d2a07b2aa@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_133854_954504_97215F37 
X-CRM114-Status: GOOD (  22.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Nov 2021 13:43:42 PST (-0800), seanjc@google.com wrote:
> Use what is currently the SMP=y version of riscv_cpuid_to_hartid_mask()
> for both SMP=y and SMP=n to fix a build failure with KVM=m and SMP=n due
> to boot_cpu_hartid not being exported.  This also fixes a second bug
> where the SMP=n version assumes the sole CPU in the system is in the
> incoming mask, which may not hold true in kvm_riscv_vcpu_sbi_ecall() if
> the KVM guest VM has multiple vCPUs (on a SMP=n system).
>
> Fixes: 1ef46c231df4 ("RISC-V: Implement new SBI v0.2 extensions")
> Reported-by: Adam Borowski <kilobyte@angband.pl>
> Cc: stable@vger.kernel.org
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

This is on for-next, thanks!

> ---
>  arch/riscv/include/asm/smp.h | 10 ++--------
>  arch/riscv/kernel/setup.c    | 10 ++++++++++
>  arch/riscv/kernel/smp.c      | 10 ----------
>  3 files changed, 12 insertions(+), 18 deletions(-)
>
> diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> index a7d2811f3536..62d0e6e61da8 100644
> --- a/arch/riscv/include/asm/smp.h
> +++ b/arch/riscv/include/asm/smp.h
> @@ -43,7 +43,6 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
>  void arch_send_call_function_single_ipi(int cpu);
>
>  int riscv_hartid_to_cpuid(int hartid);
> -void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
>
>  /* Set custom IPI operations */
>  void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
> @@ -85,13 +84,6 @@ static inline unsigned long cpuid_to_hartid_map(int cpu)
>  	return boot_cpu_hartid;
>  }
>
> -static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
> -					      struct cpumask *out)
> -{
> -	cpumask_clear(out);
> -	cpumask_set_cpu(boot_cpu_hartid, out);
> -}
> -
>  static inline void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
>  {
>  }
> @@ -102,6 +94,8 @@ static inline void riscv_clear_ipi(void)
>
>  #endif /* CONFIG_SMP */
>
> +void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
> +
>  #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
>  bool cpu_has_hotplug(unsigned int cpu);
>  #else
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index b42bfdc67482..63241abe84eb 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -59,6 +59,16 @@ atomic_t hart_lottery __section(".sdata")
>  unsigned long boot_cpu_hartid;
>  static DEFINE_PER_CPU(struct cpu, cpu_devices);
>
> +void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
> +{
> +	int cpu;
> +
> +	cpumask_clear(out);
> +	for_each_cpu(cpu, in)
> +		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
> +}
> +EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
> +
>  /*
>   * Place kernel memory regions on the resource tree so that
>   * kexec-tools can retrieve them from /proc/iomem. While there
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 2f6da845c9ae..b5d30ea92292 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -59,16 +59,6 @@ int riscv_hartid_to_cpuid(int hartid)
>  	return -ENOENT;
>  }
>
> -void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
> -{
> -	int cpu;
> -
> -	cpumask_clear(out);
> -	for_each_cpu(cpu, in)
> -		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
> -}
> -EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
> -
>  bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
>  {
>  	return phys_id == cpuid_to_hartid_map(cpu);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
