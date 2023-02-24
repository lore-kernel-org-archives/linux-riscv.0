Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3BDC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9EjkUlvlKZ/+YvgYrthYvb+BZnd9o+6CxJ3MY8fr6g=; b=NTKGiNv61N3rUV
	3V1WcaiSZbUjM9Wo/IJgdIEGpSX5ffCrz1scXPREsAdsMExgeGWcqZQnW+BleICB6CBY5n5kkH4Zk
	6wvlCKHQKuxQhWHvgDPH0aZ0PV6RjygwVP16AYm0LVqjkqen3I58zaPFAhi2H0AgGnRaXa1Iqf3GC
	uXkGgY/RH0RJXxA+JfIwYbw4MskxAiPk/uKwxo1f5taWQcH1wmd1Bx5UcBOkl30QF7MECCGrvKl0x
	7T7mNZFCZb5ILMmi8zQWEo9oujOMlwkG98NXhDhU5AYfZUdn6ciWBI1qvrwBkzBU/1OkIH1KAjc+u
	E6DRHS62tJ8gYJMUAb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXKq-002QNs-V0; Fri, 24 Feb 2023 12:38:00 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXKo-002QLt-4i
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:37:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id gi3-20020a17090b110300b0023762f642dcso2556562pjb.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 04:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5cdK82uYYWIkMpYOxPb+LiZ+QZGBRA1VBR3+aMujYg=;
        b=cC2qAF4jOGUX/vmGUCUQNb2G05k02Hy6IUMPzKnWHG+TFFoluwLfg5ooCUzQXLR9Py
         ZVl4JZ4i6W9qK2CihvOj9q4hJF88V8eBBrltKOD9MaYvoCyvO2bvO4UiI6aNWkmNJMKY
         vC/JYJyn8YIj9xWuJopjfxJH54fPWVO+yQ8XEC9J63bSd+rVtSYNZvRa71spmyrfLG4w
         //UUsTiSnXgW6s8TGKzE0Vl00UigDqakMeyMZ9DpFgZzxWajuJHV+P7lvoGjML77gAJF
         ncBmyPr5evHqoQ/zoy6/sjiFq5gKFpzjJCsBZz+gB84rzWYq2FAlQUO+1FekkMWeDlGF
         cW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5cdK82uYYWIkMpYOxPb+LiZ+QZGBRA1VBR3+aMujYg=;
        b=ONcHYUaay7Vw33+du/MBmigfLg4p99UU+vuS8zkdc1tffg9Rmvp+wxO09m6OaDWL2R
         AuhfBoOIo1QXXosn/rk2JBd3zQZG9fh+d2Mca+Q9fuqmEjlSX4278596jKtoYM6Em5rn
         UqKZdZ4/p3JwPoGQIrurwGaSzoEgjujv7+xK3Qw/3YAF8BmLN6//PD7XAOCySQ5Ld616
         1s9wCWHUlQH0p/hG80g8MzvU1arvLs8WoCVqXrYMEDDr4LGeO78SMEQ4Vm3LYLFn8uw6
         yYG7tKvEI2Sm2XTtbsSJCs5BKKLg5a1HDt1TQE+IVMK18D+PHaifnoYXkp+0CvGSLGOF
         giQQ==
X-Gm-Message-State: AO0yUKVOdbVIGvZL0yaS9Ib959FmSsF2lk1XU6KKMAhCcbPQDXAayMM6
	c+NTWorBoJ0afxCxrfL46BaLug==
X-Google-Smtp-Source: AK7set+n8H0sjTNOAzuYeNksjuz1vlAaBpY0t2F3L1sUMLaPKnrtXpH5OEf5yUzRpzs0fZkCR1zrNA==
X-Received: by 2002:a05:6a20:914e:b0:cc:7967:8a75 with SMTP id x14-20020a056a20914e00b000cc79678a75mr2021251pzc.46.1677242277425;
        Fri, 24 Feb 2023 04:37:57 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e4-20020aa78c44000000b005aa80fe8be7sm4841450pfd.67.2023.02.24.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:37:57 -0800 (PST)
Date: Fri, 24 Feb 2023 18:07:47 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 21/21] Documentation/kernel-parameters.txt: Add RISC-V
 for ACPI parameter
Message-ID: <Y/ivm3YDi4SL6nGd@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-22-sunilvl@ventanamicro.com>
 <20230220201556.i3dihi3oj2lwckno@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220201556.i3dihi3oj2lwckno@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043758_220974_81437216 
X-CRM114-Status: GOOD (  20.85  )
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

On Mon, Feb 20, 2023 at 09:15:56PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:43PM +0530, Sunil V L wrote:
> > With ACPI support added for RISC-V, this kernel parameter is also
> > supported on RISC-V. Hence, update the documentation.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 6cfa6e3996cf..b3a5a5844daa 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1,17 +1,17 @@
> > -	acpi=		[HW,ACPI,X86,ARM64]
> > +	acpi=		[HW,ACPI,X86,ARM64,RISC-V]
> >  			Advanced Configuration and Power Interface
> >  			Format: { force | on | off | strict | noirq | rsdt |
> >  				  copy_dsdt }
> >  			force -- enable ACPI if default was off
> > -			on -- enable ACPI but allow fallback to DT [arm64]
> > +			on -- enable ACPI but allow fallback to DT [arm64,riscv]
> >  			off -- disable ACPI if default was on
> >  			noirq -- do not use ACPI for IRQ routing
> >  			strict -- Be less tolerant of platforms that are not
> >  				strictly ACPI specification compliant.
> >  			rsdt -- prefer RSDT over (default) XSDT
> >  			copy_dsdt -- copy DSDT to memory
> > -			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
> > -			are available
> > +			For ARM64 and RISC-V, ONLY "acpi=off", "acpi=on" or
> > +			"acpi=force" are available
> >  
> >  			See also Documentation/power/runtime_pm.rst, pci=noacpi
> >  
> > -- 
> > 2.34.1
> >
> 
> I'd squash this into patch 18, "RISC-V: Add ACPI initialization in
> setup_arch()"
> 
Sure. Let me squash in the next revision.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
