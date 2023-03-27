Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF02C76195
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdLDvtvkg8m1VXySvoiL2OwugpVvGZRBblFUrMAD8DU=; b=h4dJa9OxRMIKCa
	+dTv+in/6q2fDGiFWy0dz9nzB7qq8yMcVthf3dVMzoZOcfS8gFmJJZiHMz6oK6XEwezLRQrxXwPYV
	AqIYwfWt8lyb56NMV/cx9IiUqcNJdsStfcxshGxFsg09rDRplAHyHej87txTZVU6HR6/t/M1FOyhg
	mXQy6cGFrMm8DOeeWVbICU/zBQtZ044N2UGk87kO5QUStXsma6Xr1s3oH8YG0o/d0WGRK9gBN+JyJ
	pAEc3FQnQLaWzKyirrQj5BAXzAQHYgMcnYfSM4Em27F+MCMhxBohkFgSbF2xwXoQJEGg18qgPzpMM
	TbpK5wwaPhf9QEdR0VGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmoL-00B6EN-0Z;
	Mon, 27 Mar 2023 13:22:57 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmoI-00B6DL-1e
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 13:22:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id er18so24920670edb.9
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679923373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3Hg3IRZJcKZEd+RKFgTwf70BPDyS0eSk5Lua/ThRTs=;
        b=a8MHnDZPBeryTpxj69Ku0ZIgR4F8C1eUbXgq43qEj3nm/+QKFfB1cbWusIyDlq9fso
         DsRyy7bxL0IIq7QtO9d4oGZFmne8zagLSW038ZOjcA4QReDUPHT7Ry1sYCdrYQ+7sM1l
         HUlq6eVAKB94+bu59WksTRygAxWbMTV24DxFQ5cUk7BzcFJ2SMiU8WLbGQ7Y0xrSCrFQ
         Dft31PkVsv7kxiAgcoMkYFEVGEu3bHUBZHulwO2xfFzzp4/f50PJr6cfPYWb9FQFjwPS
         04eguUoEkF1LmUh0p1QwY9AFO96mUYoomXcnStv5kyK3BUtD8PrXFoMkDQj+jyWSuRDN
         a8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3Hg3IRZJcKZEd+RKFgTwf70BPDyS0eSk5Lua/ThRTs=;
        b=FqtZWzecBbrX/X+YoqgBq/aoTTZD3bN5T1giWvKmvRuXpBZYsCo7qLg8czSc3ZNz1i
         bnU3IBqVeZVft4ZbjqgNl6Dok88SN/5WL8DaNp9rpqCYUSDpO/uRujkqtPYxW/eTpjGD
         PZygrrhgyGDeuGOFaxOOFY4ETx0Af4KnViliOTAou07RU2dm4FpJ2HJT4vDCOmAJMroC
         ut5vI0zS7tnkljM7KwK+glQiMsil8LlvgvxY3EMOdK+4c8s0Ytsx1/vorExs0EEog4dx
         X81NQUbrWw5vfcKuMnIgJ6J2iTUQGychWoJNytVBUSAcFtG39j6ic2Qur+HEp1jfv2fH
         qMXg==
X-Gm-Message-State: AAQBX9d8V1OrK/bUXh21JJGIJmdymrs8YFiyvQ0OYJVQ8NbMjysLRfEZ
	yrLLGIhhpRr/tXsWWFh6pZ0fNA==
X-Google-Smtp-Source: AKy350YRV0n0E7DcfpzNQRrUb7Qfxz2jjIkfznLll4YgsqV+NzMGPMqWL6RPiy5zgm9t9SmibPweuA==
X-Received: by 2002:a17:907:75f2:b0:88a:1ea9:a5ea with SMTP id jz18-20020a17090775f200b0088a1ea9a5eamr11366800ejc.65.1679923372946;
        Mon, 27 Mar 2023 06:22:52 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m2-20020a50d7c2000000b00501fc87352fsm7908381edj.13.2023.03.27.06.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:22:52 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:22:51 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230327132251.dejgmcpxjdrqzmvk@orel>
References: <20230323045604.536099-1-jeeheng.sia@starfivetech.com>
 <20230323045604.536099-5-jeeheng.sia@starfivetech.com>
 <20230327131025.6bawvoti65sth4rk@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327131025.6bawvoti65sth4rk@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_062254_546769_9EF1640A 
X-CRM114-Status: GOOD (  22.35  )
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

On Mon, Mar 27, 2023 at 03:10:25PM +0200, Andrew Jones wrote:
> On Thu, Mar 23, 2023 at 12:56:04PM +0800, Sia Jee Heng wrote:
> > Low level Arch functions were created to support hibernation.
> > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > cpu state onto the stack, then calling swsusp_save() to save the memory
> > image.
> > 
> > Arch specific hibernation header is implemented and is utilized by the
> > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > functions. The arch specific hibernation header consists of satp, hartid,
> > and the cpu_resume address. The kernel built version is also need to be
> > saved into the hibernation image header to making sure only the same
> > kernel is restore when resume.
> > 
> > swsusp_arch_resume() creates a temporary page table that covering only
> > the linear map. It copies the restore code to a 'safe' page, then start
> > to restore the memory image. Once completed, it restores the original
> > kernel's page table. It then calls into __hibernate_cpu_resume()
> > to restore the CPU context. Finally, it follows the normal hibernation
> > path back to the hibernation core.
> > 
> > To enable hibernation/suspend to disk into RISCV, the below config
> > need to be enabled:
> > - CONFIG_ARCH_HIBERNATION_HEADER
> > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> > 
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/Kconfig                 |   6 +
> >  arch/riscv/include/asm/assembler.h |  20 ++
> >  arch/riscv/include/asm/suspend.h   |  19 ++
> >  arch/riscv/kernel/Makefile         |   1 +
> >  arch/riscv/kernel/asm-offsets.c    |   5 +
> >  arch/riscv/kernel/hibernate-asm.S  |  77 ++++++
> >  arch/riscv/kernel/hibernate.c      | 427 +++++++++++++++++++++++++++++
> >  7 files changed, 555 insertions(+)
> >  create mode 100644 arch/riscv/kernel/hibernate-asm.S
> >  create mode 100644 arch/riscv/kernel/hibernate.c
> >
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Actually, I forgot to point out something. As hibernation depends on
suspend.c for save/restore_csrs, we need something like

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 73cca7f17f6f..f1d2289df660 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,7 +54,7 @@ config RISCV
        select CLINT_TIMER if !MMU
        select CLONE_BACKWARDS
        select COMMON_CLK
-       select CPU_PM if CPU_IDLE
+       select CPU_PM if CPU_IDLE || HIBERNATION
        select EDAC_SUPPORT
        select GENERIC_ARCH_TOPOLOGY
        select GENERIC_ATOMIC64 if !64BIT


Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
