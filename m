Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467DEC76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 13:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyxUALIW31OBxG8lgceqJ4CUTXcSj+nTDLkf+fB6UUY=; b=AwRX5Y7AVhR/6S
	He5CluQ07X4H8wqwxx8dlZXaFA4BUKso3nwqviCtm8uI+wRqSQGwz6OlwOGj4+JTi30u4LF1X9F+V
	BLzCOFvvXYa6MhFtSurh8ntjAQa6QVsnfjhCeRF1JhdQqeXvXXL3CvATb05N7rC+yOeddhZMOuXCL
	5EwNIJor/vvgrOZFiS2BDfgO9fLtAIrfT7EADlT39cYn0+xFYZQI3kdnq6u32RMn25698cipsQ5TT
	fiYjiJSLd7teioos2Uk3CVAndJQlBVPuTqtfIHiiF4quKQwRR7tN6ldjpDe2Zd71UKGmxI8qNzUEA
	DhA/PHmGevsfeORioyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmcM-00B4JY-0D;
	Mon, 27 Mar 2023 13:10:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmcJ-00B4IV-1T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 13:10:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id t10so35848544edd.12
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679922627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ON1TRFTyjP269YlSlypUfBZaP5DJM7YPobS1hNusbJA=;
        b=oPkcSdVZEGtbuQOXS697FnTNSJxMY5MC+8ocH1eK91m1uNM89kJSQzhIqIoiWXl1pk
         iCuROR2/Go4dnukO7B3eGxalDbuIi4oYmQQTDAZTseZhPZQAT6SGKeeE34WsNp7ljS/E
         NwnuILPs46OmmAKz6xfUBPtBYHPTlVKSLNMmRCPSblZzVOCIMI1LvGyV+sBqv5aaZaCI
         XSuiQeSQIeZKLJanv0Wj/lVkz5rbRfFS/N6PqXKAmKTx099fxnDlXiMNqPDFpkTAiF7t
         c0THPpKVaCmH9k2zo05XDcVbt8zPzrw35mT5iOZg1xYZifclwcNzkhwgUKc5sAyw4CVX
         y1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ON1TRFTyjP269YlSlypUfBZaP5DJM7YPobS1hNusbJA=;
        b=XHj6fVJnM3LmjWkcTtpMbRICJutxhmTNh0lSYVvYTFidFVSYnFHcIXEkBNdf/G8O9X
         ElF7FifoEr5+BNsmrWkqMC+tMcXqSljFjMm0CaZhb9wisg84HinpxgoCNVR0Sz+Y8w1m
         iS7B3ARNqrmSz9XFTHRNn+BhU5unRH2XR2b8RYdfqtKEpYhhhLNM40IUbkGsK0Lbx7z1
         xq1zkPvmEGy+tc0b8V1kTEIifrrJPAJy9+7Vg1okgQFRpEi7Q17jpVCRYw3byV1Uf/6t
         r5T4btvW+JHR12fPVNFvNWBi90k0Qoi7wQQSAZOaH2szthfqxg9waMJAgqFasQ9qhtlg
         H7Tg==
X-Gm-Message-State: AAQBX9fkhzoqJ9r/oE0+gH8qba+lCCwVE9CjUZForODdsmvRUZXJE9ri
	J/uL+yi4RuaWlYtxclkLiX9RpA==
X-Google-Smtp-Source: AKy350Yi2wo1LkaGRXXGGfRvdgclqblvOUAJV7al09yJLUCGZzgx0fvK5AIXEyEsSdVVcX154pxpVg==
X-Received: by 2002:a17:906:2f96:b0:932:8cd:1021 with SMTP id w22-20020a1709062f9600b0093208cd1021mr11597586eji.33.1679922627362;
        Mon, 27 Mar 2023 06:10:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090630c400b0092b5384d6desm14061725ejb.153.2023.03.27.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:10:26 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:10:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230327131025.6bawvoti65sth4rk@orel>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
 <20230323045604.536099-5-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323045604.536099-5-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_061031_496398_491B329F 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Mar 23, 2023 at 12:56:04PM +0800, Sia Jee Heng wrote:
> Low level Arch functions were created to support hibernation.
> swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> cpu state onto the stack, then calling swsusp_save() to save the memory
> image.
> 
> Arch specific hibernation header is implemented and is utilized by the
> arch_hibernation_header_restore() and arch_hibernation_header_save()
> functions. The arch specific hibernation header consists of satp, hartid,
> and the cpu_resume address. The kernel built version is also need to be
> saved into the hibernation image header to making sure only the same
> kernel is restore when resume.
> 
> swsusp_arch_resume() creates a temporary page table that covering only
> the linear map. It copies the restore code to a 'safe' page, then start
> to restore the memory image. Once completed, it restores the original
> kernel's page table. It then calls into __hibernate_cpu_resume()
> to restore the CPU context. Finally, it follows the normal hibernation
> path back to the hibernation core.
> 
> To enable hibernation/suspend to disk into RISCV, the below config
> need to be enabled:
> - CONFIG_ARCH_HIBERNATION_HEADER
> - CONFIG_ARCH_HIBERNATION_POSSIBLE
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig                 |   6 +
>  arch/riscv/include/asm/assembler.h |  20 ++
>  arch/riscv/include/asm/suspend.h   |  19 ++
>  arch/riscv/kernel/Makefile         |   1 +
>  arch/riscv/kernel/asm-offsets.c    |   5 +
>  arch/riscv/kernel/hibernate-asm.S  |  77 ++++++
>  arch/riscv/kernel/hibernate.c      | 427 +++++++++++++++++++++++++++++
>  7 files changed, 555 insertions(+)
>  create mode 100644 arch/riscv/kernel/hibernate-asm.S
>  create mode 100644 arch/riscv/kernel/hibernate.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
