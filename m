Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB241C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 06:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6qiUHIP4q7WAB+UkGNdMfVVqlGpggzjCWb/eQMgC1w=; b=LMvQQ4O0gptTP9
	9lrtkCIryJarID17Bj0HoxM3D8C7DSbI4Q+DlzMjwOzPZTx8y76Dshk2oWLLv0lXqOZUH2adbGvtT
	ME7YqaXvdI+n9UQkANKrVvjB/RfUZ1eSQBaGIvAFh2CZq5d3a1k6NwmLI5yT937RctRLQRvZbA5p1
	WsOQXGwZ69NYPtLJSJmaVENMTyUX9QOACDslC/8T9YoY7QbQRAbL30ujscR8enDekbtgcHMLh/wor
	ee56Wbf9f1QnWtj4E1ytV5gWlVEMMwVG55CFqrv1s5XqFccZ4zDszz7XH+mqjQFNZMCa/qd2H5tha
	X3qjG7SU0hNf5KXPZWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpqS-0000000FmyY-1KvD;
	Wed, 20 Mar 2024 06:54:40 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpqP-0000000Fmwu-3gZF
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 06:54:39 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5a47abe2ff7so2710712eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 23:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1710917675; x=1711522475; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTJQaQxZhR2F3wHrCMNTf+e3Fq0ItLwh5zOXlIkVHvA=;
        b=wvwiZiI6nJABByyvR9yLvZvMRGAosmCxK/6bUlWlubqNUUNHCDsH1hGf7eBpMLT0Lt
         vuw53EP5y2E/jpjBEeYPIySCHWN9PE3G+p+2dbv5ud994AM3XadMJrdH4Zp0D1aDh71r
         lGYEqj86G9nd1Kd2eY1CJIMnTSTLRt7OXczdEp/MRpwpFIRFt3KLvgmI++G5F4kDfc1d
         rFMME5CiA0atIU1plXraWREG8VsD5FzunEIwjhKd50UtgHPrBS1wPI4+m60MZCyHtKsi
         l8m9rs8mkNJTamOYfe6kGridz9RQh/kaqJh3+CJMl0YQ7aaacRQ15gE4EBTXlKfIRX1S
         SoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710917675; x=1711522475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTJQaQxZhR2F3wHrCMNTf+e3Fq0ItLwh5zOXlIkVHvA=;
        b=CqMPWiDANtyaj+pf5WnkYGwkp8c9JD2sufd9GGS1mtx4HGNpCNKURlOFiuhnC5ho+r
         EPf8ri/ysFvAljpuEJk96qD5z3syln/nRhPYeA5YaCgM/3oXHt/rYJ3l3bcBwEOvW6CX
         mL3P1GOpB9AulZ7BsDuUzkjNXnjf/4kYQHYGLSvVvtkEvNSdA27Qd5FEdDbGAjf40JIo
         /w+sPEi3lt/XbRnTEq5dFv+WucyHlnnDTFUAJjBgN+uYiZ6dEshFCYgKXAg0rjpilhu2
         vI2y9sEFwJcAYdyoNPbUNTPwhLjiYmEDVijmB5rQ4hVWJ1Cl+hsWOnHHaovuolGeVxgd
         V4Tw==
X-Gm-Message-State: AOJu0YxlX4J07n9QTdaC545xnguHGEJZ0t2s3i9DSzgPQuE5iw2StmUl
	ZvLyKzqdanjiDLgaqBjHjUsz/h/B1vaZcojYZifPLYIiwqteE4QahcRv83ImYsI=
X-Google-Smtp-Source: AGHT+IG7X3jSDNZLrKRWi8e9irTqZ54hqhH9dSlyY23ZUykG+Oayhus4L7kkKddYgpIV/TxBlkZUEg==
X-Received: by 2002:a05:6359:5fab:b0:17e:bbbb:92a0 with SMTP id lh43-20020a0563595fab00b0017ebbbb92a0mr975086rwc.2.1710917675245;
        Tue, 19 Mar 2024 23:54:35 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:a790:26b3:a3f9:cbee:d9f9])
        by smtp.gmail.com with ESMTPSA id g70-20020a636b49000000b005ceeeea1816sm10037401pgc.77.2024.03.19.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 23:54:34 -0700 (PDT)
Date: Tue, 19 Mar 2024 23:54:32 -0700
From: Drew Fustini <drew@pdp7.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq
 support
Message-ID: <ZfqIKLnaAqOmXnWj@x1>
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
 <ZfiKooxO88h1nj35@x1>
 <Zfj4FnG5vAPP55ri@x1>
 <Zflm5cje/+rnZ7HH@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zflm5cje/+rnZ7HH@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_235438_162929_41702B0C 
X-CRM114-Status: GOOD (  28.09  )
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

On Tue, Mar 19, 2024 at 03:50:21PM +0530, Sunil V L wrote:
> On Mon, Mar 18, 2024 at 07:27:34PM -0700, Drew Fustini wrote:
> > On Mon, Mar 18, 2024 at 11:40:34AM -0700, Drew Fustini wrote:
> > > On Thu, Feb 08, 2024 at 09:14:11AM +0530, Sunil V L wrote:
> > > > This series enables the support for "Collaborative Processor Performance
> > > > Control (CPPC) on ACPI based RISC-V platforms. It depends on the
> > > > encoding of CPPC registers as defined in RISC-V FFH spec [2].
> > > > 
> > > > CPPC is described in the ACPI spec [1]. RISC-V FFH spec required to
> > > > enable this, is available at [2].
> > > > 
> > > > [1] - https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#collaborative-processor-performance-control
> > > > [2] - https://github.com/riscv-non-isa/riscv-acpi-ffh/releases/download/v1.0.0/riscv-ffh.pdf
> > > > 
> > > > The series is based on the LPI support series.
> > > > Based-on: 20240118062930.245937-1-sunilvl@ventanamicro.com
> > > > (https://lore.kernel.org/lkml/20240118062930.245937-1-sunilvl@ventanamicro.com/)
> > > 
> > > Should the https://github.com/vlsunil/qemu/tree/lpi_exp branch also be
> > > used for this CPPC series too?
> > 
> > I noticed the ventanamicro qemu repo has a dev-upstream branch [1] which
> > contains 4bb6ba4d0fb9 ("riscv/virt: acpi: Enable CPPC - _CPC and _PSD").
> > I've built that but I still see 'SBI CPPC extension NOT detected!!' in
> > the Linux boot log.
> > 
> > I'm using upstream opensbi. It seems that sbi_cppc_probe() fails because
> > cppc_dev is not set. Nothing in the upstream opensbi repo seems to call
> > sbi_cppc_set_device(), so I am uncertain how it is possible for it to
> > work. Is there an opensbi branch I should be using?
> > 
> > Thanks,
> > Drew
> > 
> > [1] https://github.com/ventanamicro/qemu/tree/dev-upstream
> 
> Please use below branches for qemu and opensbi. These are just dummy
> objects/interfaces added to test the kernel change which are otherwise
> platform specific features.
> 
> https://github.com/vlsunil/qemu/tree/lpi_cppc_exp
> https://github.com/vlsunil/opensbi/tree/cppc_exp

Thank you for providing those branches.

The CPPC extension is now detected okay during boot but I see the
following in the boot log [1]:

[    1.094707] cpufreq: cpufreq_online: ->get() failed

Have you seen that too?

This appears to be from the following in drivers/cpufreq/cpufreq.c

1500         if (cpufreq_driver->get && has_target()) {
1501                 policy->cur = cpufreq_driver->get(policy->cpu);
1502                 if (!policy->cur) {
1503                         ret = -EIO;
1504                         pr_err("%s: ->get() failed\n", __func__);
1505                         goto out_destroy_policy;
1506                 }
1507         }

I'm not very familiar with the cpufreq code yet. My first thought is
that maybe the get() function pointer isn't set correctly?

thanks,
drew

[1] https://gist.github.com/pdp7/00ab047509d25871f87b3dc1b2445eaa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
