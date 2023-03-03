Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946F7C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy1E+z1VHNmbx/3Id42F/PKs2a1nLEzfYI2PiDatPTM=; b=wgQP2aqlEEWo9G
	KIti5QNChDsU7pycgDIUB7oGYAaYI/eIffTH2gW2MMKL/lR7wx7P/GFbuGo9TZnDdqhXVIfIBLt+p
	05N1IT/hz1D8W1n2dhkZDSG2OZcREMisy7Kz5j7W9nZue3DiOabh68+9ePeMcrv3gvQFwj2n3z1r2
	Scm1kA90PAHm+9EX9pi04WzVwSxxHwy6iRSDNNPudn09+jFtRuZBmWepfR5mwOCgDWvuGcFcRZXAx
	rCKdTVQ8TKYSkUsJo7L4O2gwr4Gp3Yl74zeTEoBN4o5x+vMkiuQFvKJJ+ShYDbOad2KKF7DG8M9E6
	ckUfr4hi01Ko+7wykrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9D8-006x0u-1G; Fri, 03 Mar 2023 17:28:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY95r-006tAi-Od
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:21:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id s11so13116944edy.8
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 09:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+P2Jt1gem1+5/B5CcM4rTOyPV+AeTyxbIp+/3dNo5A=;
        b=WPye6mZe6O/Y3KmvZJOOqo9FbOHD+uSL2hAl7O6U/eRKKUFOvMUWsgvNScZIWVRC54
         DwpVvEGp/nxyrPtYQcd5glZaTKkBSkQFtbXf/jChUSn+pim62zgFQLnZwulS0dIbjBw8
         HY6B5/Nxg1WyR7suWAzlxnhqoFShCFqbjx/FFhgGonYtTHnB1TvkGc6fUnzH0W48NNs2
         ouktdj7fJnlxWqGLesJoO+KK/MrDq8wTly+giIiuIa3hYYUyta/Hj6GicCFXqohC5f64
         e1z/CtP9tEXuFnM1QXBcwvY01FdX3hZwn+oK6gh1JOuFYDKqkVoW2dSVbBZlaH+Un+9z
         FxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+P2Jt1gem1+5/B5CcM4rTOyPV+AeTyxbIp+/3dNo5A=;
        b=GSr2UVLjoNpA8O0tLhcZ2w4P+Kt+q28kYZW5hcDEtiyLbYdtVrWLuy0KBL/kzGH3Vu
         bs7U69o4/bneFQ/wcxmf+hGjRAkXbNwYr4F1TuYIgeVfZxsddGLFgWOBu0JomlzpK29E
         bXmMj9qVZzzzhROtaOr0o1bABamLDbh7P2PrJ3cBlMzXrvsVbV94Y0oIADrsDKVZUmqR
         HWaRBBJwAmyfNSkSWCGHYxGfpdbjIHJP61D6x3Wf++8WD1EElQP5jKw9GE3rdDYol8Fn
         zj/bnlcVsbRlPC0Re6Moa+qm2pVAPiL/etu/TaYOzHxfZFV1dBsITiojqp0uwUw8erbu
         96Sw==
X-Gm-Message-State: AO0yUKUec10ChB/7ykLcAyQ1iiNQuzGpDq+ckHKmvi4Djnyu2HnmTg9c
	a9dKZAPYdcqbxv0GmLIit0uLGg==
X-Google-Smtp-Source: AK7set8ZD2J/CsfQlCGk7mFzIWQdBS1dzaQEQ6jA3tE1K1Vw8oYIqCClLWU5JnIns07/oFdwwCC5uQ==
X-Received: by 2002:a17:907:c60c:b0:7c0:e30a:d3e5 with SMTP id ud12-20020a170907c60c00b007c0e30ad3e5mr3030314ejc.18.1677864075213;
        Fri, 03 Mar 2023 09:21:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709060c5a00b008ec793ac3f4sm1146250ejf.192.2023.03.03.09.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:21:14 -0800 (PST)
Date: Fri, 3 Mar 2023 18:21:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH V3 11/20] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <20230303172113.jskripuyr3xx2z7k@orel>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-12-sunilvl@ventanamicro.com>
 <20230303160556.lezccmwa7ymymxws@orel>
 <fdb52973-0cbc-4d7e-88bc-534fe43eec9b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdb52973-0cbc-4d7e-88bc-534fe43eec9b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_092119_822886_9C9AE7EF 
X-CRM114-Status: GOOD (  23.97  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 03, 2023 at 04:58:53PM +0000, Conor Dooley wrote:
> On Fri, Mar 03, 2023 at 05:05:56PM +0100, Andrew Jones wrote:
> > On Fri, Mar 03, 2023 at 07:06:38PM +0530, Sunil V L wrote:
> > > RINTC structures in the MADT provide mapping between the hartid
> > > and the CPU. This is required many times even at run time like
> > > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > > the RINTC structures and provide a function to get the correct
> > > RINTC structure for a given cpu.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > ---
> > >  arch/riscv/include/asm/acpi.h |  9 ++++++
> > >  arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 65 insertions(+)
> 
> > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > index 111a8ed10af1..8be16c1ef7da 100644
> > > --- a/arch/riscv/include/asm/acpi.h
> > > +++ b/arch/riscv/include/asm/acpi.h
> > > @@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > >  
> > >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  		       unsigned int cpu, const char **isa);
> > > +
> > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > > +
> > > +u32 get_acpi_id_for_cpu(int cpu);
> > >  #else
> > >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  				     unsigned int cpu, const char **isa)
> > > @@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > >  	return -EINVAL;
> > >  }
> > >  
> > > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > > +{
> > > +	return -1;
> > > +}
> > 
> > Why do we need this stub? I wouldn't expect non-ACPI code to need an ACPI
> > ID.
> 
> I think I asked for this (or assumed it existed) in v1, when I requested
> the removal of #ifdef CONFIG_ACPI stuff in riscv_fill_hwcap().
> Personally, I'd rather have this stub than the ifdeffery :)
>

Yeah, avoiding #ifdefs with stubs is good if we need to call the function
from non-ACPI code. I'm wondering why we'd need to, though. In all the
cases introduced with this series, we could pass a 'cpu' to
acpi_get_riscv_isa() and then have acpi_get_riscv_isa() call
get_acpi_id_for_cpu() itself, for example.

We also need to be sure -1 truly means "no ACPI ID" in order to stub this.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
