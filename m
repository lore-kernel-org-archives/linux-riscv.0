Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B69C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 09:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDp89wGUQBpE2r0i2AMiGi8oLzrbzSFzFnxVed3OJwk=; b=ef8HKnfywYn69n
	SkK3XrtFttqZL3aBJvu3ByipJ5mWol1r75DX3q1MaTyUzC4EzYWn1XbHrY+qoE7g/TY4dCSAAXspL
	JJNd5W7gBSclgbivkk+3DmObLRu3T0qNZmf0yxzFKuG887Mmp1RU98Z5o7lNrpzHk3LjI7uFvTZyK
	ybF7iH+Htc/kDy9td9652lc3gt7eImikax5dvl49TyqHg2hm2bsV+2TpKqKnuMtA+uO7HIn9PXPfD
	r2EQOH7YJkzT6BOzu0HjMZ646wRD5qLXm989rw3nXKmlJFmWbT9nETX9i6ZFboLuNHEVcL2VE2dt0
	AWkmlOWYFUTgzWBmKwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqL7-004F42-Qy; Wed, 08 Mar 2023 09:44:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqL5-004F3E-TH
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 09:44:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id a2so17134918plm.4
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678268641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bv6GQABTyvlUo8n5V+5AOScxA1OJXslTI0WCdpQtyc4=;
        b=lsdiFEmzBt55hVroblb079wHiV07NNRRrmXMwYMFoADw16GE8O2BiYk8f4FmyVrnJj
         HXphoOrakUNIHGGPmkToOU2wQ9PAzQsWjfrdepMWhQbBThTbIpvMKPZcvGhz3CXlIOaB
         Tm3oilEr6EM3DuawtYrOFEUz+iuTQyasqqEwmn0mtpuv3BJEnXoiRPzMPgxWnGioPJ+2
         7alSFZTHit7Wd/Z63Ro1i3Q6mTKL43o6dK4br2KcaGvnEXhqCBsBZt/7iuMttOaIf9MV
         aVQs9imzjlulAr3Sxa3mzHIXS0i6FqUkQrkwpEYoVWc4NF2ng4ZO7kXytYIvmBNC+SJV
         3bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678268641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bv6GQABTyvlUo8n5V+5AOScxA1OJXslTI0WCdpQtyc4=;
        b=4CgsXQjTprTcx57UteQQxiSZsXZOz2uY6uZQuF2jM3hNTyInSoSXlYX5FAYd3mrkaP
         V3W8OwTb052wwY91jdCs0aGjuTavQdhFo+RRkeSQYivfGd2ERIE3YFXVHy30Xl6OB36p
         5pBrVi5USZVlpVLa9I14gpqJry7DUzuoC30pYFdlS37ym+BeqhcIx+NWJvTL6q3p30Ro
         L8QiAT/6aPO1qi7Lxu6VTdK+tAs9kyRXDA9BH2jDS9TOEE4SBr19/Hyd/C1cQ5qhqZCs
         bnlcFcz/UhVcyi3obCL0tscOhjFRzwHMGI4Md3ifdpMxqFUG8xZvZqI1CPoBp+SbG89Y
         Y4yg==
X-Gm-Message-State: AO0yUKVT2gJ727g5i9/PiT7qeWYz4V1rFMNVmb4nsTRY27SivzuTPZqb
	ZxvcaKKDYFqahQ1wVOG4FX4wMw==
X-Google-Smtp-Source: AK7set8+7oXejOnlrwNi7JTHrVcEN9fDrM3oo4Jq00Uh/vXOHeP1adEYP5gSS2Al/s5ESn312YharQ==
X-Received: by 2002:a17:903:32d2:b0:19a:7d73:ef47 with SMTP id i18-20020a17090332d200b0019a7d73ef47mr22273674plr.17.1678268640954;
        Wed, 08 Mar 2023 01:44:00 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902ce8d00b0019926c77577sm4759989plg.90.2023.03.08.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:44:00 -0800 (PST)
Date: Wed, 8 Mar 2023 15:13:51 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
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
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 17/20] RISC-V: time.c: Add ACPI support for time_init()
Message-ID: <ZAhY10oQ6uwVIlb8@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-18-sunilvl@ventanamicro.com>
 <0cceafc3-522b-4ce0-9016-e931c818adec@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cceafc3-522b-4ce0-9016-e931c818adec@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_014403_965524_23562C24 
X-CRM114-Status: GOOD (  19.96  )
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

On Mon, Mar 06, 2023 at 09:09:11PM +0000, Conor Dooley wrote:
> On Fri, Mar 03, 2023 at 07:06:44PM +0530, Sunil V L wrote:
> > On ACPI based platforms, timer related information is
> > available in RHCT. Add ACPI based probe support to the
> > timer initialization.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/time.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> > index babaf3b48ba8..2c29543549c3 100644
> > --- a/arch/riscv/kernel/time.c
> > +++ b/arch/riscv/kernel/time.c
> > @@ -4,6 +4,7 @@
> >   * Copyright (C) 2017 SiFive
> >   */
> >  
> > +#include <linux/acpi.h>
> >  #include <linux/of_clk.h>
> >  #include <linux/clockchips.h>
> >  #include <linux/clocksource.h>
> > @@ -18,17 +19,27 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
> >  void __init time_init(void)
> >  {
> >  	struct device_node *cpu;
> > +	struct acpi_table_rhct *rhct;
> > +	acpi_status status;
> >  	u32 prop;
> >  
> > -	cpu = of_find_node_by_path("/cpus");
> > -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> > -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
> > -	of_node_put(cpu);
> > -	riscv_timebase = prop;
> > +	if (acpi_disabled) {
> > +		cpu = of_find_node_by_path("/cpus");
> > +		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> > +			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
> 
> I appreciate that it was like this before, but a newline here (and in
> the corresponding spot below) would be nice.
Sure!. Will update in next revision.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
