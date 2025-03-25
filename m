Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464F8C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OK9Q2PtGIZOgXzMYOgh+1c563bHIuaVGLZPasY2jYS4=; b=4ssJUoNZIgH9o5
	+t/m9LCwvucYePXhyspiNIW9dWP40hogizUin1DEZtcv6QeAyl8Ubt8QoNzjCL84JrQCyzGlT/Mqi
	8ftqKTCW+UUrmyyOq4lvmgAnkvct01gwqlTTVFgZIf/ErdMDjSX7PntfSNsWIbicsLBDlSqmO3lM1
	2S5tLQGy3bFNAbPzOKrRuyIxpQcWmQsVZDmhzSGRbAoCbqpQtaBKwjsKl8zwj1Fu/MwEJc7iMnaAl
	ChegsrMcHgiSOOETfR1Hf2O+81Sj+bkQGjZb/RPEyM97sUDYFa1C5Tcq/mRpYtcq+2/uPVstSGZmW
	as9M1ABAT3bBwlXdVqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9hP-00000006pRD-3m8i;
	Tue, 25 Mar 2025 19:12:31 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9Mg-00000006lk6-3aeb
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 18:51:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so848505e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1742928665; x=1743533465; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKFyRYKxF1WM7/Qzxwsb5esyJjWasxcKEvmo6HpGkec=;
        b=E0C1p50sveSCwZsBHYvnW1PPpIQpertiCUoiqYEjgYQHu198ZvHcxuGRIscdYDKMXm
         vcUCWZk5Wv6+s6YGsyhH3Ec74qtiUq4I/UpUm5pjqhhAH1Ng8rGAs5dhU2I9qAhtwhUy
         /0BnRtWzd7bsTlmexoAWiO/gZwwQp54EgZRBtTGEzP9poylV5SD3ijdU1NoUykTjlXM8
         ZDOWiAQXNxjo6tZsiE8b3gTis2DrCVqcWB1rzhx0TmKdccbc9QD4AIIjy7bq4P9UINAg
         /3bfJFmesjREVMmzFL1H0CC3Ajq7Ktb9/YcUBXV9zgNxLyFsJLgRYRgj+qSHQCBamzuf
         i6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928665; x=1743533465;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKFyRYKxF1WM7/Qzxwsb5esyJjWasxcKEvmo6HpGkec=;
        b=AJe4SvfbxeDWF2+CGXEboYbS9CkmI/VQMlcKuRy7q3b8XgZ9/UP0W9w2UueasyugTA
         CEX6HJTlvRHbqP4pMyPQoJtw0XS/15+iXO1gCDHaN4YvpAhMFKM8pVaxBBwCvC9z/vXc
         qTf+Im7QUxJrs5sViYKdTVEYakl1CdMkuKtxxYa6sRcyxIajWTmh2CgjU5Te1yjnpwN5
         4g0GSagaxra8krIiaG6jiMi3E82GNRXQNlnbFRfg2OkI6bXtD9ndqqU6hBKXxpQfscFK
         v626A7kB9+4izl83qzbiNCFNOlxXJEHkhw1RMXhydnVw/t8KdkbEml8Wt6ROKqqCbMOH
         7aLg==
X-Forwarded-Encrypted: i=1; AJvYcCXX/8emn93xCXoZgvkqlly0PwyvmNZg/Z4km7cndBm+wtGGzB/gWvBZK63Pw0tgsMQEMuYSKd0OBKKE1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt2CK4LKU4Zlq0LMUIprsmclzSJkKpILZSfcj1TngGHTVTao1v
	6joGWDiu7bzk1Ad6/rqMazSvZIB2HRaqhydaV86Y0jQ4simsZsys++tJOYRRJpg=
X-Gm-Gg: ASbGncsn9524tvZj7KgyqbCyjsj+aT1kef3ER8l5T2GasF8PGw9wRHwvCNhdKjuWEXc
	7iZ4FO+PvwrP3rVoSJELf+EYhELwKUki/pC7fVDHIy9U3pNXdFBG4r9XoNWqTsFQ+fqg6HeBH28
	tl/dKNWT1k5zIGaeaBjW4NG6zPKa9dMYm5Rfevba+XMAS369VVkT2Ol66vwhiKhqav1V/ADA4iY
	yrLt4Aketbuy7PdEx+vm25W5g5rgjo01/b/VRFeFQZUFLGwBuZZbqw3s5G4QSajWf6+ZZVqK/Kv
	9R70Z6hB5P8HnCtFKkFStUN7eRNnuzGr01OxCWGj75zsGaJX4a4xXFTv/Q==
X-Google-Smtp-Source: AGHT+IE3tPDzR9UC+jvepT8+s1j1/v6Ba1MUiSkiWeQVK07RICCfaGQOUUCB6kQZK6oyqwZkxgnC/w==
X-Received: by 2002:a05:600c:5247:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43d775fbf63mr8654245e9.9.1742928664501;
        Tue, 25 Mar 2025 11:51:04 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3c2csm14167481f8f.46.2025.03.25.11.51.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Mar 2025 11:51:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32 bit I/O bus
 platform
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250325144252.27403-1-luxu.kernel@bytedance.com>
Date: Tue, 25 Mar 2025 18:50:53 +0000
Cc: tjeznach@rivosinc.com,
 joro@8bytes.org,
 will@kernel.org,
 robin.murphy@arm.com,
 alex@ghiti.fr,
 lihangjing@bytedance.com,
 xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Message-Id: <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com>
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_115106_908982_70CA86C0 
X-CRM114-Status: GOOD (  19.29  )
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

On 25 Mar 2025, at 14:42, Xu Lu <luxu.kernel@bytedance.com> wrote:
> 
> Introduce a new configuration CONFIG_RISCV_IOMMU_32BIT to enable
> splitting 8-byte access into 4-byte transactions for hardware platform
> whose I/O bus limits access to 4-byte transfers.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

Is such a platform conformant to the specification? Either way, why is
this a static build-time configuration choice rather than a dynamic
run-time choice based on the FDT / ACPI tables / some other platform
probing method?

Jess

> ---
> drivers/iommu/riscv/Kconfig |  9 +++++++++
> drivers/iommu/riscv/iommu.h | 28 +++++++++++++++++++++++-----
> 2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
> index c071816f59a6..b7c9ea22d969 100644
> --- a/drivers/iommu/riscv/Kconfig
> +++ b/drivers/iommu/riscv/Kconfig
> @@ -18,3 +18,12 @@ config RISCV_IOMMU_PCI
> def_bool y if RISCV_IOMMU && PCI_MSI
> help
>  Support for the PCIe implementation of RISC-V IOMMU architecture.
> +
> +config RISCV_IOMMU_32BIT
> + bool "Support 4-Byte Accesses on RISC-V IOMMU Registers"
> + depends on RISCV_IOMMU
> + default n
> + help
> +  Support hardware platform whose I/O bus limits access to 4-byte
> +  transfers. When enabled, all accesses to IOMMU registers will be
> +  split into 4-byte accesses.
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 46df79dd5495..0e3552a8142d 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -14,6 +14,10 @@
> #include <linux/iommu.h>
> #include <linux/types.h>
> #include <linux/iopoll.h>
> +#ifdef CONFIG_RISCV_IOMMU_32BIT
> +#include <linux/io-64-nonatomic-hi-lo.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#endif
> 
> #include "iommu-bits.h"
> 
> @@ -69,21 +73,35 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
> #define riscv_iommu_readl(iommu, addr) \
> readl_relaxed((iommu)->reg + (addr))
> 
> -#define riscv_iommu_readq(iommu, addr) \
> - readq_relaxed((iommu)->reg + (addr))
> -
> #define riscv_iommu_writel(iommu, addr, val) \
> writel_relaxed((val), (iommu)->reg + (addr))
> 
> +#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> + readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +   delay_us, timeout_us)
> +
> +#ifndef CONFIG_RISCV_IOMMU_32BIT
> +#define riscv_iommu_readq(iommu, addr) \
> + readq_relaxed((iommu)->reg + (addr))
> +
> #define riscv_iommu_writeq(iommu, addr, val) \
> writeq_relaxed((val), (iommu)->reg + (addr))
> 
> #define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
>   delay_us, timeout_us)
> +#else /* CONFIG_RISCV_IOMMU_32BIT */
> +#define riscv_iommu_readq(iommu, addr) \
> + hi_lo_readq_relaxed((iommu)->reg + (addr))
> 
> -#define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> - readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
> +#define riscv_iommu_writeq(iommu, addr, val) \
> + ((addr == RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> + lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> + hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
> +
> +#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> + readx_poll_timeout(hi_lo_readq_relaxed, (iommu)->reg + (addr), val, cond, \
>   delay_us, timeout_us)
> +#endif /* CONFIG_RISCV_IOMMU_32BIT */
> 
> #endif
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
