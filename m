Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD44C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Dl5OgEn4OsO5jsJjQN7piMmkkYjRDOH1yvC0PPZfVeo=; b=ljTpu5zyTyZioalJWxBd3+MHVn
	EgcZf0qQvNnOvw4irqOj59U6pnuNClsHqL7v5MrD29+5oxiDdkfXFDWzVHK1NKEwfNyC4Q8mlS1k0
	Dn/M2gbCa5Huj9CFlOHC8U4kF3nNYF2BCr4doGGIWyxir15PeRXGoowAiNsEY34k5vC0xch3L1niv
	wJQyAYzLcETrIHE1o+PVYSbeZTkuPAJgaWgYz/5I2LvnHGTqvg5nSCwJYoPdo0KGZK3rlGyuv+E+a
	rbghIC6K3teVdm2MtL9FJLp0QSSHFmab4L5N5xdEnIKGdoPveFLnxznAe77fD22WNGUXmAyWKjlTs
	DM3TBHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAgi-00Eskl-DK; Tue, 14 Dec 2021 16:30:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAgE-00EsMR-3K
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 16:29:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so17565273pjc.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 08:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LbhcwdEjVBuTWcw138d9uhpwM/fmzxoan1Tk4b0oxOk=;
 b=o213zq5gjrDybTwk1avMHBjs463xMZsvVZIbrQKKDZhb/59GcjtymJ2NyqMimZN2Om
 ArOhKAfNdnAcvm03VvIZj135E4y4kKpaIu4KIyOoLGLQ6BtveAVTwdXn8nRUivKojwKM
 o16ONNQpycnxn32bRD6rSsfRA2PVfHunP4GwkKzJiGfLZf2SD3lKjyYt1e1WQq739cUH
 iVrInqIQwTMxvXrQ+z2BrbVlSRNhiGkaLiQgfiCo6sNx7P8fQWUbhTTPoUEKgsQvuU2u
 XSNQBxrnXShKAD3uIUPGJI14ZTmwIbEf7yiF3YW2hrkh8C8zippTKPbVZu0xyTEgctAx
 1RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LbhcwdEjVBuTWcw138d9uhpwM/fmzxoan1Tk4b0oxOk=;
 b=i19/Dt+hE3544KO129NUlTPcgc7fXG+SQ35D4XH5eu5P0zGha4ae6gAp84llAjl1MC
 EuMAScE11a0PH3qn3e4e+CodhLBnKBTRcrbEBYU/5UHvkOqADyOM1KLOJl+Nh5r0aSO0
 Li6L/PkcxOhc7+e6/HAvu/14VRO9S1i0RaffCBaDNN/b9trU5lxfG8locReEr9Q7aHMi
 44WYRkIeHc7MtYLUilc5xeaFt1GW6D/4CI2GSjIecDiTOt6kgjF2Al3D81jET+4TSfmR
 mjneh7qNVcD5D5ANy4T+67+LO7UMmhCgmaU1nk7lky6qZvzGrOS9XOrGPfoCbfqUH75u
 /LnQ==
X-Gm-Message-State: AOAM530oYegU58rd9tu6TN18aBjO88LhesWvz/n7hNHAuTlfQvMYQ5Yn
 aK4o2kmyOKJ7WpBfqgvZS3WFfQ==
X-Google-Smtp-Source: ABdhPJzYKzHCxWlO4x1Csefyyo13hL4E3aSLw+rdmFxGOG/bUDmCjyGV/lfWbLwo7Tkau0pcgpoTYA==
X-Received: by 2002:a17:902:d4d0:b0:141:c13d:6c20 with SMTP id
 o16-20020a170902d4d000b00141c13d6c20mr6689302plg.44.1639499367222; 
 Tue, 14 Dec 2021 08:29:27 -0800 (PST)
Received: from localhost ([12.163.77.120])
 by smtp.gmail.com with ESMTPSA id d9sm2705493pjs.2.2021.12.14.08.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:29:26 -0800 (PST)
Date: Tue, 14 Dec 2021 08:29:26 -0800 (PST)
X-Google-Original-Date: Mon, 13 Dec 2021 18:25:36 PST (-0800)
Subject: Re: [PATCH v9 06/17] riscv: Add has_vector/riscv_vsize to save vector
 features.
In-Reply-To: <8652c476f08626d52f0412ca1a8427cfe7b4104f.1636362169.git.greentime.hu@sifive.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-bd89b83f-fd99-42b2-ac20-c3d98a4468e4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_082930_187921_7B3144CB 
X-CRM114-Status: GOOD (  19.39  )
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

On Tue, 09 Nov 2021 01:48:18 PST (-0800), greentime.hu@sifive.com wrote:
> This patch is used to detect vector support status of CPU and use
> riscv_vsize to save the size of all the vector registers. It assumes
> all harts has the same capabilities in SMP system.
>
> [guoren@linux.alibaba.com: add has_vector checking]
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

IMO those SOB flags are a bit out of order, but checkpatch isn't 
complaining so I'm not sure it matters.  Otherwise:

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 7069e55335d0..8e7557980faf 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -21,6 +21,11 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  #ifdef CONFIG_FPU
>  __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
>  #endif
> +#ifdef CONFIG_VECTOR
> +#include <asm/vector.h>
> +__ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
> +unsigned long riscv_vsize __read_mostly;
> +#endif
>
>  /**
>   * riscv_isa_extension_base() - Get base extension word
> @@ -149,4 +154,12 @@ void __init riscv_fill_hwcap(void)
>  	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
>  		static_branch_enable(&cpu_hwcap_fpu);
>  #endif
> +
> +#ifdef CONFIG_VECTOR
> +	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +		static_branch_enable(&cpu_hwcap_vector);
> +		/* There are 32 vector registers with vlenb length. */
> +		riscv_vsize = csr_read(CSR_VLENB) * 32;
> +	}
> +#endif
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
