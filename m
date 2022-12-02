Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3808C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BXadbi+HG0FeFlg3dXFoWN/COcJw+i/By9D6ao0jZGI=; b=YVXFV1JxlfsJO6dCOP3eX//3cY
	iOjmiJ6EQiqFvaW0YDlZPPN61tQFWA/pKuSXVBFxtn6B1buTdmOi3nLFWtOA74ThJmsfcinCSpl2L
	KR7W63A0Cm6FSs+kL6qaslMEhKgkYNXe3J2M4LlJGcIZyBVFPJjS5E5AFxubIpvzkEFfisCgyKPMy
	oYyUiMRW498dQ8Os1/iJRV9fxxUyUVrLhzKmawYldy54xSDFKa2a3fgfUy60WOHE7Y0rp/ToYCSR3
	64q5qY8nLdKfRDNU3FrIwapgPMCvkQBjMx/wNvxJwXS5hF6QEvwSZtG6hlY7auTTXGa4igjXg0UR1
	P+YMYZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17WB-00Gx10-6r; Fri, 02 Dec 2022 14:59:59 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17W7-00GwzU-LO
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 14:59:57 +0000
Received: by mail-pg1-x52b.google.com with SMTP id h33so4552984pgm.9
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVn9fYReGWeklGU9GMj6LqOCAyq6HzvsmE8l0X+UGY4=;
        b=F4eIwSBlqT7o9RkATux/IYaxbq0p8cPog7/J3bPOef3vAZpOQnwSWarC+9qILgQEIl
         WEGxrNIRpMqZMGueMF9aiU2aR0KcfpclsAVf31iMwBVNL4KypWt25KrwHeGz0NUnXFMf
         LujR/fL8L9M0RB3yn/VF2M2xNXTflu1tnb+OL4BqS9gH3My9p3ew+miEleDXg2m1YRK/
         2OPE/SEq0MENOCn28ef9yWGizFu2289AeVed9hx2/gJ+jPcoRNpCKwkpbHel6g4Ay7+q
         /hjYw5fb8r+65IsHigcYPTehjvtNk2D82sOfsuilcqNJ4J5Ckmg0Ly+2hsuWH6vr77Of
         VagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVn9fYReGWeklGU9GMj6LqOCAyq6HzvsmE8l0X+UGY4=;
        b=J4ywzJE+FEPMNZn44WkQ/ljirGdza7yYVSBmIZy6wQ2lMFpx1q0+T6Yw9M+fmhNY5h
         koS+ZXxCGOjHKg7/m+vhpc/5wSRDne4BrLUtVBXpbiJc5gKSDxFPQZNm1pz5yu+4EzLU
         WBtYPxEvcxgqPwkd3GRt9R6EIBVbhM5vJOWOdvUelZQ7d6aXFjhuGCTv7+hiq24ko6C2
         wJ4Mkn2ZU+J6S+ZZtyb4Q0OsXeW89nsPzadyxEVeOvwMRojrF/h0GaZgL6kfeuI5X3DY
         NYpIgDHUEg+oAVBaevRLTDr7zfiWFrqJlhHCQ8PayLj6v0TLeltWJuvX90wfE3WUO4fU
         h4Kw==
X-Gm-Message-State: ANoB5pneCppU6jdNQ3MTvhZXr5mrl32y32ROI0fva49qwRiqu+qY+1bm
	8ZHHtCreddDp6KYoxR+kBitWTA==
X-Google-Smtp-Source: AA0mqf7+D9ptufQt6gtLv8VJWJ4Nyf0vHGoTCmcVlBRCz5hA+ZEj1frb5fsoCB3Aw8UmjpV8QROTrQ==
X-Received: by 2002:a63:fb46:0:b0:478:1c87:7fcb with SMTP id w6-20020a63fb46000000b004781c877fcbmr21990948pgj.330.1669993194175;
        Fri, 02 Dec 2022 06:59:54 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id y2-20020aa78f22000000b0053e62b6fd22sm5186907pfr.126.2022.12.02.06.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 06:59:53 -0800 (PST)
Date: Fri, 02 Dec 2022 06:59:53 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 06:59:52 PST (-0800)
Subject: Re: [PATCH]     Implement ioremap_prot support (v2)
In-Reply-To: <20221202083356.169176-1-jiangjianwen@uniontech.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  alexandre.ghiti@canonical.com, geert@linux-m68k.org, panqinglin2020@iscas.ac.cn,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  jiangjianwen@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jiangjianwen@uniontech.com
Message-ID: <mhng-5118b440-6182-41c4-81d2-a369336ee8e3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_065955_922607_63DFED60 
X-CRM114-Status: GOOD (  19.91  )
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

On Fri, 02 Dec 2022 00:33:56 PST (-0800), jiangjianwen@uniontech.com wrote:
>     Feature ioremap_prot only needs an implementation of pte_pgprot on riscv.
>     That macro is similar to the same one on platform loongarch, mips and sh.
>     We just need:
>     1. replace _PFN_MASK with _PAGE_PFN_MASK in pte_gpprot;
>     2. add "select HAVE_IOREMAP_PROT" into arch/riscv/Kconfig;
>     3. add "depends on MMU" into drivers/fpga/Kconfig to fix the building error "undefined reference to generic_access_phys".

That third one should be its own patch, it's not really related to the 
RISC-V bits.

>
>     Signed-off-by: Jianwen Jiang <jiangjianwen@uniontech.com>
> ---
>  arch/riscv/Kconfig            | 1 +
>  arch/riscv/include/asm/page.h | 2 ++
>  drivers/fpga/Kconfig          | 1 +
>  3 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index fa78595a6089..5ed2c7361040 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -95,6 +95,7 @@ config RISCV
>  	select HAVE_FUNCTION_ERROR_INJECTION
>  	select HAVE_GCC_PLUGINS
>  	select HAVE_GENERIC_VDSO if MMU && 64BIT
> +	select HAVE_IOREMAP_PROT
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..cb08a4911d60 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -84,6 +84,8 @@ typedef struct page *pgtable_t;
>  #define __pgd(x)	((pgd_t) { (x) })
>  #define __pgprot(x)	((pgprot_t) { (x) })
>
> +#define pte_pgprot(x)  __pgprot(pte_val(x) & ~_PAGE_PFN_MASK)
> +
>  #ifdef CONFIG_64BIT
>  #define PTE_FMT "%016lx"
>  #else
> diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
> index bbe0a7cabb75..0493272b8bff 100644
> --- a/drivers/fpga/Kconfig
> +++ b/drivers/fpga/Kconfig
> @@ -5,6 +5,7 @@
>
>  menuconfig FPGA
>  	tristate "FPGA Configuration Framework"
> +	depends on MMU
>  	help
>  	  Say Y here if you want support for configuring FPGAs from the
>  	  kernel.  The FPGA framework adds an FPGA manager class and FPGA

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
