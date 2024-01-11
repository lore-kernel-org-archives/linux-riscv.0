Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411E9C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDzZupeMDyQjznBbCFHixQrBOcIc0aY2BfGKtz+YP+Y=; b=ZPQVhk0rKUThb5
	Z3M0Ya5+gZxI5tXEQKpRD0Yo8v/IslZ7yJMVcYQbcQa5pP/0UTLan/O98BzHP/+9sZldvrWPDJmpn
	JGY4dnauKa9L6wHhNDHj4e1MbBesg/fyTPvNg3/FDlq26+zn8KpV8/qKEoLAN9nEnuzq6sCpVaEYE
	ce98OgUKn5AL3X4BwHijpvEfwc2jG6wIdFmY1pAecKO/A396oiaHDpI5bo0FWdZP1muIEMPhKizNo
	PQXYOnOjvMESRnjt4s74CDGH16P6CZHIQ1n65WD4ZX/Wp/nzbKLb/21N+J4Ah9BCDu7WhbF1h+Tcu
	cSMSiOS4jmtG3+zMNTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtID-00HN0E-1R;
	Thu, 11 Jan 2024 11:32:13 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtI9-00HMsc-0c
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 11:32:11 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5cd8667c59eso3421208a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704972727; x=1705577527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNl3tpkyK5Mul56pIgZxAMIH2IfRCEnxfyE9fY+1LDU=;
        b=ei9xlRnwxYWCBj3PwNOQsuIMVnRiKEn/yHUcxvymR/N0TaBRh2+oKO+CnXjwTf2uAV
         qhFDcvTklR5ebV1IjSPlBMJZJuOuM1TXHyau1haDdiVERoRTJky8MaOnBZByHMNIHhOR
         FomQCBRf5+vSt4RURigWjGVldm5UtX+lZwrJcWcZ0Em9Qjp7rIy7dT5e+uzf4kLRMMBe
         6XobRt+sRDhDtpAuMXrRlY8RlOqU8hOQWqsYuFE73YXPszHGkH0iaIbskFrzIm8Rr2be
         BKjoGwtr/adaimN56XvzCa9xkMp3jFi5aRPksS7dBc/I2hNWTNn+lli2rRS4yyTRPCFf
         upNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704972727; x=1705577527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNl3tpkyK5Mul56pIgZxAMIH2IfRCEnxfyE9fY+1LDU=;
        b=Yp0upN61dhMMCTd3rayoazK4xbzzc7luS4i13FUoRYr5x16E01CfE+95q6mmxq4b7F
         toyFq4rGj0l1e4vqfVKRvgpN5JRKxKYl929UwAHctW4I1+SAMmuhTi5oTDq06n3A6YZ6
         eeshrO/6v/uIvrauppAISnd3Ag0EkVKSumm1CA0bQ012n/fzOwX7ZKvmpiUn2KbbwuS5
         gdrataXmtnkz8XC5e4iCclqaDuBZQ1g8tykddBpLo8Hz5cEttOF0ndGpLjqN49wYvRq4
         r0wtQS1WSmNqUqG/FaPBquJ3Y51Fsscb9IV/bpTc9VWqHbrwInurJOFPviyDSgVm5Mn5
         OMaA==
X-Gm-Message-State: AOJu0YxLXojrAM9mIYpjZvJ1JrmNPZIX9SdS2rDIn0FuoQDgl6+Gj/3O
	gRNctfoPqoXO9oizOMmqIJqSg8GV7cHVAQ==
X-Google-Smtp-Source: AGHT+IFNT0pZlCC90UfGIUe+0iysvNpEOqgrUfAsJP18C9CfIaYaEO8KkvhcxXutmMYmMdMAFoeQNg==
X-Received: by 2002:a05:6a20:89a9:b0:199:dd9a:df27 with SMTP id h41-20020a056a2089a900b00199dd9adf27mr782621pzg.124.1704972727324;
        Thu, 11 Jan 2024 03:32:07 -0800 (PST)
Received: from sunil-laptop ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id mm4-20020a1709030a0400b001d4b46d8c10sm972947plb.66.2024.01.11.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:32:06 -0800 (PST)
Date: Thu, 11 Jan 2024 17:01:59 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Anup Patel <anup@brainfault.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH -next 2/2] cpuidle: RISC-V: Add ACPI LPI support
Message-ID: <ZZ/Rr7AXVAN4Ecmu@sunil-laptop>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-3-sunilvl@ventanamicro.com>
 <20240111-d37d338a6b1aa71e944ebe05@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111-d37d338a6b1aa71e944ebe05@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_033209_282033_DA6BCF52 
X-CRM114-Status: GOOD (  28.03  )
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

On Thu, Jan 11, 2024 at 11:19:49AM +0100, Andrew Jones wrote:
> On Thu, Jan 11, 2024 at 03:00:58PM +0530, Sunil V L wrote:
> > Add required callbacks to support Low Power Idle (LPI) on ACPI based
> > RISC-V platforms.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/cpuidle/cpuidle-riscv-sbi.c | 78 +++++++++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> > 
> > diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > index e8094fc92491..cea67a54ab39 100644
> > --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> > +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> > @@ -632,3 +632,81 @@ static int __init sbi_cpuidle_init(void)
> >  	return 0;
> >  }
> >  device_initcall(sbi_cpuidle_init);
> > +
> > +#ifdef CONFIG_ACPI_PROCESSOR_IDLE
> > +
> > +#include <linux/acpi.h>
> > +#include <acpi/processor.h>
> > +
> > +#define RISCV_FFH_LPI_TYPE_MASK		0x1000000000000000ULL
> > +#define RISCV_FFH_LPI_RSVD_MASK		0x0FFFFFFF00000000ULL
> 
> GENMASK might look nicer and the type mask is 0xF000000000000000ULL,
> where 0x1000000000000000ULL means that the type is an SBI identifier.
> We need both defined
> 
> #define RISCV_FFH_LPI_TYPE_MASK              0xF000000000000000ULL
> #define RISCV_FFH_LPI_TYPE_SBI               0x1000000000000000ULL
> 
Sure. Let me use GENMASK and define both MASK and SBI type.

> as I point out below.
> 
> > +
> > +static int acpi_cpu_init_idle(unsigned int cpu)
> > +{
> > +	int i;
> > +	struct acpi_lpi_state *lpi;
> > +	struct acpi_processor *pr = per_cpu(processors, cpu);
> > +
> > +	if (unlikely(!pr || !pr->flags.has_lpi))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The SBI HSM suspend function is only available when:
> > +	 * 1) SBI version is 0.3 or higher
> > +	 * 2) SBI HSM extension is available
> > +	 */
> > +	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> > +	    !sbi_probe_extension(SBI_EXT_HSM)) {
> > +		pr_warn("HSM suspend not available\n");
> 
> The comment and these lines match what's done in sbi_cpuidle_init().
> How about a static helper function to avoid duplication?
> 
Sure.

> > +		return -EINVAL;
> > +	}
> > +
> > +	if (pr->power.count <= 1)
> > +		return -ENODEV;
> > +
> > +	for (i = 1; i < pr->power.count; i++) {
> > +		u32 state;
> > +
> > +		lpi = &pr->power.lpi_states[i];
> > +
> > +		/* Validate Entry Method as per FFH spec.
> > +		 * bits[63:60] should be 0x1
> > +		 * bits[59:32] should be 0x0
> > +		 * bits[31:0] represent a SBI power_state
>                                         ^ an
> 
> > +		 */
> 
> Comment block needs opening wing (/*)
> 
Okay.

> > +		if (!(lpi->address & RISCV_FFH_LPI_TYPE_MASK) ||
> 
> This should be (lpi->address & RISCV_FFH_LPI_TYPE_MASK) != RISCV_FFH_LPI_TYPE_SBI
> 
Sure.

Let me send v2 in couple of days with these changes.

Thanks!
Sunil

> > +		    (lpi->address & RISCV_FFH_LPI_RSVD_MASK)) {
> > +			pr_warn("Invalid LPI entry method %#llx\n", lpi->address);
> > +			return -EINVAL;
> > +		}
> > +
> > +		state = lpi->address;
> > +		if (!sbi_suspend_state_is_valid(state)) {
> > +			pr_warn("Invalid SBI power state %#x\n", state);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int acpi_processor_ffh_lpi_probe(unsigned int cpu)
> > +{
> > +	return acpi_cpu_init_idle(cpu);
> > +}
> > +
> > +int acpi_processor_ffh_lpi_enter(struct acpi_lpi_state *lpi)
> > +{
> > +	u32 state = lpi->address;
> > +
> > +	if (state & SBI_HSM_SUSP_NON_RET_BIT)
> > +		return CPU_PM_CPU_IDLE_ENTER_PARAM(sbi_suspend,
> > +						   lpi->index,
> > +						   state);
> > +	else
> > +		return CPU_PM_CPU_IDLE_ENTER_RETENTION_PARAM(sbi_suspend,
> > +							     lpi->index,
> > +							     state);
> > +}
> > +
> > +#endif
> > -- 
> > 2.34.1
> >
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
