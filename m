Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC257C61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4WYHU4kffn8sKLO+2n/Qlznn8khAjpuwSIxUxd1UWpM=; b=y26RCWEmDMKz2TirbmIfzxHsy9
	kUl+NSJxsWeD/HdF921T28zL0crmh8f7ATCGtPzf8vM0gyn90eOm/fAU0HQEix5jpIvpasMqKnjqY
	oUlJzzQk6t5PZbvdNMylZuPpS4meI4P9bPOX9Urtme7e+CMmWNeN/85iQg59HnlX7R0+VvIFK7GYl
	nZJcp5EfUNMrrYcEVe0FGmns0KK6VTMSvbeePNJcdYov0zMTyzaTy4RUiFsTgRbSOte6GkjkHu8n1
	OjO2Oo3O+yKOd3jxwRCzsqmHruC7dwhnRyP0og1R88X4x+eh4t/zL2Fln/cgY+TdTnAvs7r7eduvY
	18tKqbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8n3-00000008QXe-05rI;
	Tue, 10 Jun 2025 23:54:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7Po-00000008Cob-2Abl
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:25:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4203588a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749594355; x=1750199155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dpwcZY5ynN16etaZr5TaZQpWfYppiovOVodgkPulHI=;
        b=Ns0JAsBMEYIU2JPf+kb4L8UeOHQuADI+MenG52U8uiZAR+ViKfSmNoC7oMhMbvPFJ+
         su+FZx5W0NKgdOth8z8RYqsSRbJHKFaAysBMFT1SufUIthlhSkHqZ3Dny0ZEOc1To0gn
         zH4wTxzEFE/hogeMEB8N82DLz9IqwaZNy7ng1vkZ7J8sDHmfEpjLmOkbSUzphf5UolMA
         npbDjQcXj/061PlzrhamfdPQC7mCiUDwll/bY3+BnCWfLIluIa8ncJ+zOSkYI0+zYaf2
         4exVZ9D8w6OleMJIK4w9sRuK0myHqjkVyxCXG87XKhZ1HHnEqSM51SSEe6G2iYkAyvLT
         VSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594355; x=1750199155;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dpwcZY5ynN16etaZr5TaZQpWfYppiovOVodgkPulHI=;
        b=MsknLXD79WYCvOCIvYM4ygT3koOmr34GMCHG7L2oeRjCztW7h+D/KVMAFsevYVj69N
         USQIV8NoSTCfue5ZJtLGEXmIiW4kAtrhQ4ZjJSpciTz7ol6vW3+zjEvwYJ/hEPswcu+3
         7DUohsDyg4+hzQam/vVeBjqBK4SywpuEwjPxd4RwN1JGTImxrPfr1H/r9LuLbNBv7cnE
         ZAWmSd4eJ0PYL09IAp8j36qDRoI5z/SuKIhlkaeO2sKBcd9yRvvwzbUu8Xpo7TJBgNmR
         zKKn6Glv7xZp4jtt86sz8/YL7Rd8KGeQDGH75MAOBbWco/AuXSVVWf6AZ12pZtnpzQ0/
         5lNA==
X-Gm-Message-State: AOJu0YziSNpE8s6oeXHiOqVLr0XMmSYEHbzalZTsLHftZO44XlTOKgui
	nFj2sy1dh13NjK/2T+ZdNHFwbvUqi/+NvCQUW/+NM4q/S7q1P2ockYdeZORojr3GtkPo4s/bxvG
	IB3nr
X-Gm-Gg: ASbGncsVoFKIyhO+47syit8nCpgKb8quUn96OZLs5cvZoZPGPOcRVZGXfSyMX5N6iFZ
	01vjU/eVzJmk+wRhsfK+lZg3lSdZlUKCm4tGNJZQRfDemgNbNoxrxlN/uTk+oLfGJiXZVvlFrie
	ds38VOnJYyFXes5G3t/a4CbppRKeTXhIgfxZyrPky27lbnjpGYmoneKt5vCYSKrkJQ/wJ9g4C5V
	lK7e5YeOuNXYIganl8+DpIBtn2VEr3/nFMduHK22T46GaORfsB0e25y2rhb84HexMJCIFtTOW6/
	HeM/y0Q5WQX+Ky0Sw7+I604a1BdKkX3zwchOV33M7tH0iT4JZr7sIPqZl5nb
X-Google-Smtp-Source: AGHT+IEXez6ef6MRwgOq/i+THZa2e1vR90BUGdf2GTUMezKIA+frl+RMV2NXJyuX+QHfG2OrFO9yug==
X-Received: by 2002:a17:90b:5404:b0:311:a623:676c with SMTP id 98e67ed59e1d1-313af243c3bmr1647811a91.27.1749594355414;
        Tue, 10 Jun 2025 15:25:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603c6c325sm74793705ad.173.2025.06.10.15.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:54 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:25:54 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:25:36 PDT (-0700)
Subject: Re: [PATCH v3] riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot
In-Reply-To: <20250528142855.1847510-1-wangjingwei@iscas.ac.cn>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, ajones@ventanamicro.com,
  Conor Dooley <conor.dooley@microchip.com>, cleger@rivosinc.com, Charlie Jenkins <charlie@rivosinc.com>,
  jesse@rivosinc.com, dlan@gentoo.org, si.yanteng@linux.dev, research_trasio@irq.a4lg.com,
  stable@vger.kernel.org, wangjingwei@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangjingwei@iscas.ac.cn
Message-ID: <mhng-FC7E1D2C-D4E1-490E-9363-508518B62FE5@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_152556_559795_72F86856 
X-CRM114-Status: GOOD (  27.02  )
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

On Wed, 28 May 2025 07:28:19 PDT (-0700), wangjingwei@iscas.ac.cn wrote:
> The riscv_hwprobe vDSO data is populated by init_hwprobe_vdso_data(),
> an arch_initcall_sync. However, underlying data for some keys, like
> RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF, is determined asynchronously.
>
> Specifically, the per_cpu(vector_misaligned_access, cpu) values are set
> by the vec_check_unaligned_access_speed_all_cpus kthread. This kthread
> is spawned by an earlier arch_initcall (check_unaligned_access_all_cpus)
> and may complete its benchmark *after* init_hwprobe_vdso_data() has
> already populated the vDSO with default/stale values.

IIUC there's another race here: we don't ensure these complete before 
allowing userspace to see the values, so if these took so long to probe 
userspace started to make hwprobe() calls before they got scheduled we'd 
be providing the wrong answer.

Unless I'm just missing something, though -- I thought we'd looked at 
that case?

> So, refresh the vDSO data for specified keys (e.g.,
> MISALIGNED_VECTOR_PERF) ensuring it reflects the final boot-time values.
>
> Test by comparing vDSO and syscall results for affected keys
> (e.g., MISALIGNED_VECTOR_PERF), which now match their final
> boot-time values.

Wouldn't all the other keys we probe via workqueue be racy as well?

> Reported-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Closes: https://lore.kernel.org/linux-riscv/760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com/
> Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
> Cc: stable@vger.kernel.org
> Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> Reviewed-by: Jesse Taube <jesse@rivosinc.com>
> Signed-off-by: Jingwei Wang <wangjingwei@iscas.ac.cn>
> ---
> Changes in v3:
> 	- Retained existing blank line.
>
> Changes in v2:
> 	- Addressed feedback from Yixun's regarding #ifdef CONFIG_MMU usage.
> 	- Updated commit message to provide a high-level summary.
> 	- Added Fixes tag for commit e7c9d66e313b.
>
> v1: https://lore.kernel.org/linux-riscv/20250521052754.185231-1-wangjingwei@iscas.ac.cn/T/#u
>
>  arch/riscv/include/asm/hwprobe.h           |  6 ++++++
>  arch/riscv/kernel/sys_hwprobe.c            | 16 ++++++++++++++++
>  arch/riscv/kernel/unaligned_access_speed.c |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 1f690fea0e03de6a..58dc847d86c7f2b0 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -40,4 +40,10 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
>  	return pair->value == other_pair->value;
>  }
>
> +#ifdef CONFIG_MMU
> +void riscv_hwprobe_vdso_sync(__s64 sync_key);
> +#else
> +static inline void riscv_hwprobe_vdso_sync(__s64 sync_key) { };
> +#endif /* CONFIG_MMU */
> +
>  #endif
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 249aec8594a92a80..2e3e612b7ac6fd57 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -17,6 +17,7 @@
>  #include <asm/vector.h>
>  #include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
> +#include <vdso/datapage.h>
>
>
>  static void hwprobe_arch_id(struct riscv_hwprobe *pair,
> @@ -500,6 +501,21 @@ static int __init init_hwprobe_vdso_data(void)
>
>  arch_initcall_sync(init_hwprobe_vdso_data);
>
> +void riscv_hwprobe_vdso_sync(__s64 sync_key)
> +{
> +	struct vdso_arch_data *avd = vdso_k_arch_data;
> +	struct riscv_hwprobe pair;
> +
> +	pair.key = sync_key;
> +	hwprobe_one_pair(&pair, cpu_online_mask);
> +	/*
> +	 * Update vDSO data for the given key.
> +	 * Currently for non-ID key updates (e.g. MISALIGNED_VECTOR_PERF),
> +	 * so 'homogeneous_cpus' is not re-evaluated here.
> +	 */
> +	avd->all_cpu_hwprobe_values[sync_key] = pair.value;
> +}
> +
>  #endif /* CONFIG_MMU */
>
>  SYSCALL_DEFINE5(riscv_hwprobe, struct riscv_hwprobe __user *, pairs,
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 585d2dcf2dab1ccb..a2cdb396ff823720 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -375,6 +375,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
>  static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
>  {
>  	schedule_on_each_cpu(check_vector_unaligned_access);
> +	riscv_hwprobe_vdso_sync(RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF);
>
>  	return 0;
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
