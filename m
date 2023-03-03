Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9DDC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Amn2urAqUifA/Vdp4r71hCVCoQMi4nrVzTfght7dIZQ=; b=KZzy5j7zWzAsA6
	yARsLxlorJe0KS9Tu7GYCUMpXJwaUYnwgJuXBrI1BoY8T4v8E7ar8USVzFljByVTkFa1pr1WKjRFM
	wiB21C3MDM7TRyZ2eoVYJzw2gUlGfhdgYjECbVH999VoGhJKFQGDYG9cMrcYx7gl2nz2J4Su8qqiT
	Pb2dp2orIqX8T1or7vmwPL3IngeMoRAkGrZuh7IFpJWTNHYyJOgimTnlBOpPp1qq8lMg8oiqV2Rbz
	fdCWkV0tVfIz2YVpjkvPUKk633Mu6Llt/TELKdRS/3vCIYqpG+kn3zhyVsnAhjrHXEdYXjD75ViKH
	Qu3rWXJ3wXrCm/BtPe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9XJ-0075YN-1s; Fri, 03 Mar 2023 17:49:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY9XG-0075X3-HH
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 17:49:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id p6so3576431plf.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 09:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677865777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ci3RnlB0VZFKqzzAEnpOLkE36BOnr4VRjKen387ZgnE=;
        b=iz7Fbv/e7nazEjnOF1SV143FLcPMaNcE4smxk4E9MSI/T59GJkyBupMF1A4mRoR3BG
         +jwbF26UALINlRANG1ZIOk0fDrIsu5O6TEFRKSTUTjlqMAZHAunjuUit8tU3zO3h45Od
         asjPP2iJPLCjSZKoJhxXsNhbLhBv6vkx1+el6dKiDz8AjV6QiX7RT4G4Og/KvYCiiH7R
         EAnkKzLbyhoTNPq39S7jst7ZfOsILBEx7zl358FEK01RyqDe7KNPiSghDlETXMU308oc
         jNma8oumdTjwqg6hAthoKLmRxnnW7dUVBLsa0eegq1WdP5lL3eVO3cPc+mFzR+30AEFN
         rKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677865777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ci3RnlB0VZFKqzzAEnpOLkE36BOnr4VRjKen387ZgnE=;
        b=hYfosdg3MWqzlghBPAQN8nuu6+xEmxw0wtkLnZHONGMCGNkz932IhYB9vvmKimZyhA
         +Cj31SMPWUw5Y5j4VwKfemW3PVo1cI88JF88WgTW7gS2Xip+2cn78XR5X+37U4Lbya8/
         VcA0RiPQRUdxoThaqoG7g7/Ve/Q9pPBR/IELYzAZrRnr7X735Cm9jnDGq7T5ZCBqVe5Q
         8lgRveHSWnYzxDDAbVFtTH1cl/nHnCHq174mWbP6LbkyuGk/2bZ9YckQEBcgXEQkPLtZ
         h+J5GiFeJWb16z39mF35kGhf6Nm46WzUvk2nnVT2SM1N5YeUu9DUE8iyMhE2Xk09dV6S
         RNrA==
X-Gm-Message-State: AO0yUKWIIlQllJh+cn4lYLXl1KphZ0n7MNi01A36nOJAgEa4/yJLeggB
	uQjjZVItQtmOycuJnn+BcvfJwQ==
X-Google-Smtp-Source: AK7set+Bf+zqq8sNm9WNWTp7EAHBGvsHuLhVhVk39cIGjEsd50L3ZxtSbFwAzHH6JTd/AxqyzAnIWg==
X-Received: by 2002:a05:6a20:160a:b0:cc:88af:12ab with SMTP id l10-20020a056a20160a00b000cc88af12abmr3571575pzj.28.1677865776948;
        Fri, 03 Mar 2023 09:49:36 -0800 (PST)
Received: from sunil-laptop ([49.206.8.117])
        by smtp.gmail.com with ESMTPSA id i23-20020aa787d7000000b005a8b882a239sm1905656pfo.109.2023.03.03.09.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 09:49:36 -0800 (PST)
Date: Fri, 3 Mar 2023 23:19:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
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
Subject: Re: [PATCH V3 11/20] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <ZAIzKLzKE7MpQ+Yr@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-12-sunilvl@ventanamicro.com>
 <20230303160556.lezccmwa7ymymxws@orel>
 <fdb52973-0cbc-4d7e-88bc-534fe43eec9b@spud>
 <20230303172113.jskripuyr3xx2z7k@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303172113.jskripuyr3xx2z7k@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_094938_635434_31FB3FA5 
X-CRM114-Status: GOOD (  26.57  )
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

On Fri, Mar 03, 2023 at 06:21:13PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 04:58:53PM +0000, Conor Dooley wrote:
> > On Fri, Mar 03, 2023 at 05:05:56PM +0100, Andrew Jones wrote:
> > > On Fri, Mar 03, 2023 at 07:06:38PM +0530, Sunil V L wrote:
> > > > RINTC structures in the MADT provide mapping between the hartid
> > > > and the CPU. This is required many times even at run time like
> > > > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > > > the RINTC structures and provide a function to get the correct
> > > > RINTC structure for a given cpu.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > > ---
> > > >  arch/riscv/include/asm/acpi.h |  9 ++++++
> > > >  arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
> > > >  2 files changed, 65 insertions(+)
> > 
> > > > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> > > > index 111a8ed10af1..8be16c1ef7da 100644
> > > > --- a/arch/riscv/include/asm/acpi.h
> > > > +++ b/arch/riscv/include/asm/acpi.h
> > > > @@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> > > >  
> > > >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  		       unsigned int cpu, const char **isa);
> > > > +
> > > > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > > > +
> > > > +u32 get_acpi_id_for_cpu(int cpu);
> > > >  #else
> > > >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  				     unsigned int cpu, const char **isa)
> > > > @@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> > > >  	return -EINVAL;
> > > >  }
> > > >  
> > > > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > > > +{
> > > > +	return -1;
> > > > +}
> > > 
> > > Why do we need this stub? I wouldn't expect non-ACPI code to need an ACPI
> > > ID.
> > 
> > I think I asked for this (or assumed it existed) in v1, when I requested
> > the removal of #ifdef CONFIG_ACPI stuff in riscv_fill_hwcap().
> > Personally, I'd rather have this stub than the ifdeffery :)
> >
> 
> Yeah, avoiding #ifdefs with stubs is good if we need to call the function
> from non-ACPI code. I'm wondering why we'd need to, though. In all the
> cases introduced with this series, we could pass a 'cpu' to
> acpi_get_riscv_isa() and then have acpi_get_riscv_isa() call
> get_acpi_id_for_cpu() itself, for example.
> 
Yes, that's a good idea to avoid the stub. Will update. Thanks!

> We also need to be sure -1 truly means "no ACPI ID" in order to stub this.
> 
Yes, with your BUG suggestion I can remove this.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
