Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA7C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3JMXYF5iMykd6DR/RJRD1u+Jr1hIuZjAdIGNXH83+8=; b=o3mi27ArEK6T7y
	agYxU3VeMEioLiJt9d8YydEtRJPXiNxw4eXOsf9pUvn/FGNfF8DFigEbIxVx7c4GhXV9a2zYFAxm3
	FL5HY40kKsigRA8mj/MoLJHUGSiac1UOuzvBtshxAUNtFxpmB1r5Xa/XPbSo3H6MWZUfXGKpHJD6C
	pyO+AJahGI6jpvNZlENNM3m6Q56/7lF7Mtp4xbx+kzAJz2SmVQ7FehryUXuGGnvOysqRF3qudzJlA
	TbAO+hgWBcLDmRazCA1TDg0zud/dOsnqOJmC/rk88TZysXS0H0Z1BzkU7VUK0wjFG8byhiRcbwXyb
	0uQvy8Gey0keclSvTm2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9cv-0076iE-0i; Fri, 03 Mar 2023 17:55:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9cr-0076hY-CB
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:55:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id n6so3531311plf.5
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 09:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677866124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRWO/a0makPL7j0XITCw1g2YJTUyDK+2r5VDGpGpgco=;
        b=MewXJ09TAhZZU3SsVCmawiuEScOiCFcck9Ego9SXXtTRwrfEQNk8A4OdzL78aldjYc
         ULORaf8aWSIKLB0D2sfg8sUO3CHutDWOvkJlrkNiKidiQvzcN77g4k/c9bF5G5Kcfl3q
         EObgbGKKx+zSCQOsOIswVYilE21ZJ9/onqk84hEE3RDrr4tPDTWHTr592gKuj3rFMexh
         z2Vrhf+GrrWd6D15ri5SOo8b5JTYokU/g1aQpLE2DPSECqnZ19qWms3T0PSpQvB2bLEv
         KUMtSmV3jtcklEzhwwWUKAkAqNuJwyqWhMcv9ULrFIqNq37cfbY4ZSntLmbTwWeFpHpA
         hRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677866124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRWO/a0makPL7j0XITCw1g2YJTUyDK+2r5VDGpGpgco=;
        b=tHwZL8MFdyU7oq95mGbKVoAoW+3Q3bLSM3UH57KzXTO15SQcsUWb2wS7f8z4iZntQ/
         /a+EUAyABCnUIRt7Ff6NuwfeWPUlLDBCOhWSBTR4bR8NR40IZO1GBt0LBB9k3+oWTslc
         JHVgDLGvF+E3pgyZVICh42HLG2jWmR0EqC9QBiB95TFLOFyVXafAE9aJggRWNeGFUcVg
         NWACKvecC+qkdS9kySsoNsyTYqLXoVjkwIdvvJCb8NzbS+TS35/66zmBjfzcISKEyT5l
         RpDLYRNpla3CaFkh1qKkkU6qANVptYvq/Ha1csSXJneQeNKN8Xile99+q83FzO5FjnDf
         Fi+A==
X-Gm-Message-State: AO0yUKUPydElRXVQydwYJrbCCYdMIaXAP6D6gtiebYYhSMiJ/QtwnRfo
	mTnthKOtdW1pUpveV0hxKXlJhw==
X-Google-Smtp-Source: AK7set90R3peqzliFYxhEWKEcycvlf7/ubtd7KlEN2lKwGwj0JvfWi02bngMzYS1uqf6HGFQqBAfyg==
X-Received: by 2002:a17:902:e884:b0:19e:845d:d898 with SMTP id w4-20020a170902e88400b0019e845dd898mr2904318plg.14.1677866124605;
        Fri, 03 Mar 2023 09:55:24 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902ed5400b001963a178dfcsm1780752plb.244.2023.03.03.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:55:24 -0800 (PST)
Date: Fri, 3 Mar 2023 23:25:16 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 12/20] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZAI0hFuJjA8ikf2p@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-13-sunilvl@ventanamicro.com>
 <20230303161647.mksonnutzaw4d3gb@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303161647.mksonnutzaw4d3gb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_095525_456222_5098A64E 
X-CRM114-Status: GOOD (  19.13  )
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

On Fri, Mar 03, 2023 at 05:16:47PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:39PM +0530, Sunil V L wrote:
> > On ACPI based systems, the information about the hart
> > like ISA is provided by the RISC-V Hart Capabilities Table (RHCT).
> > Enable filling up hwcap structure based on the information in RHCT.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++++++--------
> >  1 file changed, 32 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 59d58ee0f68d..478dbf129922 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/bitmap.h>
> >  #include <linux/ctype.h>
> >  #include <linux/libfdt.h>
> > @@ -13,6 +14,8 @@
> >  #include <linux/memory.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <asm/acpi.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/errata_list.h>
> > @@ -91,7 +94,9 @@ void __init riscv_fill_hwcap(void)
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> >  	int i, j, rc;
> >  	unsigned long isa2hwcap[26] = {0};
> > -	unsigned long hartid;
> > +	struct acpi_table_header *rhct;
> > +	acpi_status status;
> > +	unsigned int cpu;
> >  
> >  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> >  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> > @@ -104,18 +109,33 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		rc = riscv_of_processor_hartid(node, &hartid);
> > -		if (rc < 0)
> > -			continue;
> 
> The above is an unrelated cleanup and should be in a separate patch.
> 
Okay, let me split this.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
