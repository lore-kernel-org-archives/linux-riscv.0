Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C31AC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMSGoOXA1zf8O73LgW72F5rHwl9yZKc+0VpDqJE3xAo=; b=j1cCK1+rIODISd
	nt+UaDG6Yt0neCLL/X/dliX1CMtTSatXesNfdoOtyADfU66AEVDiQ/CRhvij6q6ff4Vc+K+xV/6nY
	5+0OOQtZU9USdJWOHl9mKbQJx8xndmWgrLusV85ZEEYfQQasi9XfiyQUqnvVwlSkDEICMdCmK2Ad2
	bAEFz22LPLYFfP3aT3sIFRmlrsgIItFH9YRFAA7Vzb3/IeYP8B05AwPLnM62TJVLR/RkdMRWfPJ53
	wE8mZ9ZyT94JaA4NTOLdxQJfpxdmliKpiGPqobTJ7ro7IfFsFd89fbDOlZVghyMUI7PF0bXnG8bFx
	Uk79tn/uaSaKX5f31wZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxaxR-00C0yi-Jw; Tue, 22 Nov 2022 21:37:33 +0000
Received: from mail-il1-f172.google.com ([209.85.166.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxaxO-00C0xR-QP
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 21:37:32 +0000
Received: by mail-il1-f172.google.com with SMTP id h17so3587794ila.6
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 13:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYuFRqLNqtbjraOouiWkagMjg88w0HPqis6czLPeub4=;
        b=QenxwHntoNFffY+GfnkkPMGZTlKfPhi5a9WhXvmCwbT8QjOgnIKMVrwvn4aSbNC1Av
         26EbN5rgaPELoTEdCINOahftOuJbO/wRPBNHUKoe75ArNK3QpCnTXdoPw04CNY8rVLQa
         g4iXcrszLy6RezFpLTRDiy8wKUPHg9ll3sFCKq3R3S0gthr3G5bPWIsioVdPpqdUWv2R
         lFxp1Z8WUu/Z/BnOmzByNYjVYbqovwMPJfPUBwA2x5UZnguLIMkYLIGcXEUbZhrw5wWt
         d3AzTojXLjE3Qh7k8aJe+ZUK18XI3W9nzGauXRh+cPKgyL1rR+z6ZnXDK6/4QurGGx2F
         u8cw==
X-Gm-Message-State: ANoB5pn1sKZpANcvRqMx1vQMW2hI64+nrA4IE2ma+Gmp1vbtCJcZ3N0X
	Be+dX3gxXvkGx1Tb/MKaJw==
X-Google-Smtp-Source: AA0mqf7q2sbxK3tUm65CzOZyUynrHlmB0F9b9om4Gd847uJg297ZztoQje/lG3t10QRLf01ocxNSkw==
X-Received: by 2002:a92:b741:0:b0:302:39d5:937e with SMTP id c1-20020a92b741000000b0030239d5937emr2930451ilm.37.1669153049468;
        Tue, 22 Nov 2022 13:37:29 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g5-20020a05663810e500b0034294118e1bsm5724889jae.126.2022.11.22.13.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 13:37:29 -0800 (PST)
Received: (nullmailer pid 618630 invoked by uid 1000);
	Tue, 22 Nov 2022 21:37:31 -0000
Date: Tue, 22 Nov 2022 15:37:31 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH] riscv: Use PUD/P4D/PGD pages for the linear mapping
Message-ID: <20221122213731.GB583854-robh@kernel.org>
References: <20221122084141.1849421-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221122084141.1849421-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_133730_878042_EF238FBC 
X-CRM114-Status: GOOD (  33.62  )
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

On Tue, Nov 22, 2022 at 09:41:41AM +0100, Alexandre Ghiti wrote:
> During the early page table creation, we used to set the mapping for
> PAGE_OFFSET to the kernel load address: but the kernel load address is
> always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> PAGE_OFFSET is).
> 
> But actually we don't have to establish this mapping (ie set va_pa_offset)
> that early in the boot process because:
> 
> - first, setup_vm installs a temporary kernel mapping and among other
>   things, discovers the system memory,
> - then, setup_vm_final creates the final kernel mapping and takes
>   advantage of the discovered system memory to create the linear
>   mapping.
> 
> During the first phase, we don't know the start of the system memory and
> then until the second phase is finished, we can't use the linear mapping at
> all and phys_to_virt/virt_to_phys translations must not be used because it
> would result in a different translation from the 'real' one once the final
> mapping is installed.
> 
> So here we simply delay the initialization of va_pa_offset to after the
> system memory discovery. But to make sure noone uses the linear mapping
> before, we add some guard in the DEBUG_VIRTUAL config.
> 
> Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> in a better TLB utilization.
> 
> Note that we rely on the firmware to protect itself using PMP.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> Note that this patch is rebased on top of:
> [PATCH v1 1/1] riscv: mm: call best_map_size many times during linear-mapping
> 
>  arch/riscv/include/asm/page.h | 16 ++++++++++++++++
>  arch/riscv/mm/init.c          | 25 +++++++++++++++++++------
>  arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
>  drivers/of/fdt.c              |  5 ++++-
>  4 files changed, 55 insertions(+), 7 deletions(-)

[...]

> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 7b571a631639..04e3ecb51722 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -895,8 +895,11 @@ static void __early_init_dt_declare_initrd(unsigned long start,
>  	 * enabled since __va() is called too early. ARM64 does make use
>  	 * of phys_initrd_start/phys_initrd_size so we can skip this
>  	 * conversion.
> +	 * On RISCV64, the usage of __va() before the linear mapping exists
> +	 * is wrong.

I assume the 'does make use of phys_initrd_start/phys_initrd_size so we 
can skip this conversion' comment applies to RiscV too. Or you just 
don't care if initrd addresses are not setup?

Please rework the comment removing what platforms can skip this. Which 
platforms skip it is obvious from the code. 'Why' is not, so that's what 
the comment is for.


>  	 */
> -	if (!IS_ENABLED(CONFIG_ARM64)) {
> +	if (!IS_ENABLED(CONFIG_ARM64) &&
> +	    !(IS_ENABLED(CONFIG_RISCV) && IS_ENABLED(CONFIG_64BIT))) {
>  		initrd_start = (unsigned long)__va(start);
>  		initrd_end = (unsigned long)__va(end);
>  		initrd_below_start_ok = 1;
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
