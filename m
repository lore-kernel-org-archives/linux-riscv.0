Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741A2C47077
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvP8ANhRNDab1WGm64dQUZ+hsTVgLgAhGZ5VPuvOFkM=; b=YxLSHK9v2jYJ6+
	RE8fcDKIxeR38kgGAvEBbyd3QsDR0Vg76CraAFWRYxvt5Q98A4Ey+EJgKQVJ2YUAGV0EbLmfHrzPK
	Iy3PWgI5GFBRcMD+4Wzu7QtFPEpOFgqBwTCGSQt6z7IH4lzTlXWj0j5LbRMvNP+uj8m4VzcwLj99e
	lCwp4e5J3cXvJpcxyGHahN9LLtg+sc7GcUZzP2wcXBAQnUTxMcA+NezIC7uHV+nVs5g30snGgAfl+
	5ySF77U+DUdmO4dQqTlHQXyF5qpuZpMqsHVahkxwqERLC2J4xJymDfBHsCf7Q/Gf3MzJ+90HgEwIJ
	29Kn4F8f1lc3+FVWT6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtG7-00HLEP-1A;
	Thu, 11 Jan 2024 11:30:03 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNtG4-00HL9s-3B
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 11:30:02 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-598a0063134so801349eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704972596; x=1705577396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1/9OBgUnbI4qV6pkGpalRcx7MgtwXi8Ekel0WOHXQs=;
        b=myrCV7vZP2PnaFoQKEs6T4rTXeUL5IvyVuyeZ4FOgrUL5gpmQpt92MiKeSnB71ZICL
         D6lHIzvCxKUdobM8Cq2/6frTBPGGBdJmpZK+Prko0Dm3hhHho4rFuQKJXJskiCriGaik
         M9mZLPn+aaG+9agL+VlZmj3/6rM5gCJ5O+ZVoGFUTebcCqVKItTQfyyZxCRlC2JMvmP3
         mMEkHjTsYI4Vb+5ZBlEKOd/Xxk6n/wh+LptZRieKG3axxOAgJQyytRXd4udfQmnbRcGL
         W1tA1qQLShBXH/cOdWLvcZp5+NmRDy2cuMdg9V+7TdMMLO1hbusgOGNTZjr8qgsW1cHP
         Wz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704972596; x=1705577396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1/9OBgUnbI4qV6pkGpalRcx7MgtwXi8Ekel0WOHXQs=;
        b=wUB3UOSo/O6JP0ggg1Su5Ew1xlH+f0/EL2TBv7WLqOROp4blE938GSMkniitVa549P
         U4gu/mLb2Mn355gJ2GMPgw0XnR4nF5Oh26Eh6nKlMeNL4af2h6uzuKD16Wje2SRN1bj7
         zKdNzozQFkU+Rynmv1BP55rqwpfG3gAkOnwXtrvf5E3s09XNmsUJsuWWojQj/UtAw7vG
         wbMnlzH0mq1dxiXZUfOrU1ZJ3mfJkG5+blb4285fo2trwL2UVXcjRw4kPIoAlMxXaYtV
         h9lXipMwJvA3hoDf2S4yWUgUgqdQwn0bJt8K//K1KOwszNorvQS+QXgqU7u+jgvoQkyN
         r3Eg==
X-Gm-Message-State: AOJu0YxbI37N/GJf1DWGC0VheH/69GdPW5GLvt0lnTOa5k1tTmFKCHsw
	VP68BIbonVA7G/kz2jbsjSSqqFZLlmO6Gg==
X-Google-Smtp-Source: AGHT+IFCKZdtwrnCuFg7TdR7AtliYvHu3SQxC/Xbm2j8wl2ATuGO1M0kBIaUI9ISibSbZ6dp+SrhvA==
X-Received: by 2002:a05:6358:d39d:b0:175:9bfc:1b34 with SMTP id mp29-20020a056358d39d00b001759bfc1b34mr1332658rwb.22.1704972596331;
        Thu, 11 Jan 2024 03:29:56 -0800 (PST)
Received: from sunil-laptop ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id nb1-20020a17090b35c100b0028d804ef772sm3504720pjb.25.2024.01.11.03.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 03:29:55 -0800 (PST)
Date: Thu, 11 Jan 2024 16:59:47 +0530
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
Subject: Re: [PATCH -next 1/2] ACPI: Enable ACPI_PROCESSOR for RISC-V
Message-ID: <ZZ/RK49zoFtSt4Ed@sunil-laptop>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
 <20240111093058.121838-2-sunilvl@ventanamicro.com>
 <20240111-bb411d2dd39eb859dd049fa0@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111-bb411d2dd39eb859dd049fa0@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_033001_028427_3C93EC64 
X-CRM114-Status: GOOD (  25.58  )
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

On Thu, Jan 11, 2024 at 11:00:12AM +0100, Andrew Jones wrote:
> On Thu, Jan 11, 2024 at 03:00:57PM +0530, Sunil V L wrote:
> > The ACPI processor driver is not currently enabled for RISC-V.
> > This is required to enable CPU related functionalities like
> > LPI and CPPC. Hence, enable ACPI_PROCESSOR for RISC-V.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/acpi/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> > index f819e760ff19..9a920752171c 100644
> > --- a/drivers/acpi/Kconfig
> > +++ b/drivers/acpi/Kconfig
> > @@ -282,7 +282,7 @@ config ACPI_CPPC_LIB
> >  
> >  config ACPI_PROCESSOR
> >  	tristate "Processor"
> > -	depends on X86 || ARM64 || LOONGARCH
> > +	depends on X86 || ARM64 || LOONGARCH || RISCV
> >  	select ACPI_PROCESSOR_IDLE
> >  	select ACPI_CPU_FREQ_PSS if X86 || LOONGARCH
> >  	select THERMAL
> > -- 
> > 2.34.1
> >
> 
> Hi Sunil,
> 
> Typically we'll want the Kconfig changes to come at the end of a series,
> or squashed into the patch that adds support for it, otherwise there's
> risk of build breakage during bisection. In this case, we're safe because
> the two new functions (I looked ahead) have __weak versions when they're
> not present.
> 
Sure. Let me swap the order of the patches.

> Also, interestingly, it looks like this ancient line
> 
>  obj-$(CONFIG_ACPI_PROCESSOR)    += processor.o
> 
> in drivers/acpi/Makefile should be removed, since there's no
> drivers/acpi/processor.c file. I guess the make process silently
> filters object files which don't have corresponding source files?
> Maybe we should write a Makefile analyzer to see what other lines
> can be removed...
>
Interesting. 

Hi Rafael, any thoughts?
 
> Anyway, for this patch, which I'd prefer to be swapped in order with
> the other patch, or just squashed into the other patch,
>
I prefer to keep as 2 separate patches. I will swap the order.

> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
Thanks!
Sunil 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
