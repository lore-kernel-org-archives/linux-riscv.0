Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6B1D148AF
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ot4DLDIUZQerKN06rwbQaukA7RgaOwafNFi8b64YOeg=; b=DuMDBRfANzgqGG
	+cZ/DEx3ajQ54LxFXVOj538dc6UjKxKER1FKonUWsac7pmZtwxo5a8YZh23hfxA1c6VAOpn/7qKoq
	ubs5bQKTzUMd+2a5VQB846rCBHQu8dUeYlwxxna2ax6sQkynZ02TiB1k4aAXhTAc319+lcdtf9MeK
	+sZHWDuAhs0878MpoYHAxuNFuM1PczVPVd6rjYIiLEqIsHXarf3IPoTLZuPTZdxlBUGZ7OXvL10AY
	HIz46h3tZmOgWzZI493slInPdmvLzwOKPn4BZv3LmSIrfJKznlMx+OtMCgqhPHEiqPgrLGw0h3eS2
	Cu26yQdg77p5M6X8fsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjsl-0000000G1n4-3qqJ;
	Thu, 08 Jan 2026 06:52:31 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjsh-0000000G1mQ-3buS
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:52:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so1641112a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 22:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767855147; x=1768459947; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ui1md6GLIAbVR5qdoR2S2qe4tIaQfGaBLcdNaqS2s2A=;
        b=lyE9xF4blLzlKpKLt3IkZ1YepneZJXO/ipGRTiwUlX+b7m6WMsTowrhuK7e3X7ZSsk
         xFSiyaUKVnChJnMHrNc4Auql44FHXmigvUbC2Yy0bXrMTFaOvTdjYMNQ6pLgn7vpRNLa
         LydAyf7riWW+FHEsOBHGCOShVq+GIZOSk1PEhW9a5UU1xxqmUj2IM7WtrH0hArdTi1QA
         2tD0uNlPfuqP6qYdwaxn2ika8HmR0zrZxFUnG8OIKPWcutTIsiPVmD7tvO0d3nX1HiT5
         revhkUuftPYIshec6o0Ogre2RMhy81mERGax0ul1ftrGfYMNbCqAW2Op+h9z1eGQ3brZ
         ekKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855147; x=1768459947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui1md6GLIAbVR5qdoR2S2qe4tIaQfGaBLcdNaqS2s2A=;
        b=fOZVPQTY0XdrkprOfMxEahHS6T1CSvUjxleOUwFGsanXZiZ5UkD4Q4KxBISg39Bp37
         q8rXc6AyT1h9Tj8LG0L1CP7oAoNQbGPFCal0b7tryc7bEcHAXREBFmVLQ6K8oKkloJTd
         v62FhRGdCuUi5puLFTOz9b/5QjyD8lJarOrx4Gpv/9gQ2ZwJ3CilqL612+lXQyg9TijT
         BemS7T2GsDJxYU3GwwdRkjzVDZ4jUex/vdv+k324hFbeXQQxAeKvOOOaJgcGn4jS/B0E
         38eJ4RrvIKiccdF8q3i9XCur+u11OUxSPTK5j79eO2JuafL/xFqRAWggSrX1liV8nH84
         sE8g==
X-Forwarded-Encrypted: i=1; AJvYcCVMhQgjPgsLNo6/pz55H//p/OqstDiS0jS9uIDXN9kZaSzNJAhckuqQ8HUCEZL7Px0tzwrECfCyZtvGOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGG8XnLpnin+0IF+LcglPCmTMNkVdoUpGjsw7mTv3mwM5cHHbS
	pU24bWPgT2GGXlOtus4dLZKSG+ocOxwgv8akEuUQ1C9kWslieLhWug3TUGGss82NMKA=
X-Gm-Gg: AY/fxX6yFDOw/YHBq8fzf/8MHPB1UW4DdHvGscIJULSrFwDJuip+ZNQTiBskrpiEyuY
	nxfkz1pTAwDvls9YyI8T5PTNt4JBzGa/vWaFaX9Tjp7nC111kiVFKTlAxAXNrMqp3MllgVJnmSb
	Rf9ZNS0MBVJe/qkGkcOqzU1Z30qGzQ6WPL5B4R3NwhZC9yNmuDdVeFatBN2KyR+mCifgZsz8Ubv
	1M1p25CVkkZZNxElATi8dr8MaBRtPY6IpAbYxJgovaqu9ShMOIKH7Asl/hj6nH6exuydvuHP13W
	3TP5zxiemgBoE6ml4CSomsNg68qqf9dW1gid0Fci15QIKX/Nrz9R+dCTseD662oMGucFGTK4GM2
	7tvfHpAsvY99usdO6BGGTk/0UbyY71AIVab4e5maQic1VkrvcsjCpUFvsCv5OGw8YVjVAp6g3nQ
	PTRcNxE4mzM+U=
X-Google-Smtp-Source: AGHT+IHDhLngCXk0+vr5I8WQ83ajbpSXd1J3uu2NiCef0XJDNyI8VNxhq7B1GWkAhONpFP7xS/AZaQ==
X-Received: by 2002:a17:90b:3e43:b0:34c:cb3c:f544 with SMTP id 98e67ed59e1d1-34f68c50868mr4787427a91.14.1767855146587;
        Wed, 07 Jan 2026 22:52:26 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm6658548b3a.42.2026.01.07.22.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:52:25 -0800 (PST)
Date: Thu, 8 Jan 2026 12:22:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: "rahul@summations.net" <rahul@summations.net>, 
	"anup@brainfault.org" <anup@brainfault.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "rafael@kernel.org" <rafael@kernel.org>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "jms@oss.tenstorrent.com" <jms@oss.tenstorrent.com>, 
	"darshan.prajapati@einfochips.com" <darshan.prajapati@einfochips.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"dfustini@oss.tenstorrent.com" <dfustini@oss.tenstorrent.com>, "michal.simek@amd.com" <michal.simek@amd.com>, 
	"cyy@cyyself.name" <cyy@cyyself.name>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
Message-ID: <paq3iilgrnuhf4aia7umhc6m26ghusyibptutvrpfm4wmoew3i@repcvxossgot>
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-5-joshua.yeong@starfivetech.com>
 <5nfljdaewlmafydt5a3jijjlr2krszbnadmjkpkgo7in364yzy@tiejhive2siv>
 <SH0PR01MB084174DCDA011CDD9D6557FFF9852@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SH0PR01MB084174DCDA011CDD9D6557FFF9852@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_225227_917993_F3175821 
X-CRM114-Status: GOOD (  24.15  )
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

On 08-01-26, 06:48, Joshua Yeong wrote:
> On Thursday, January 8, 2026 11:27 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 06-01-26, 17:21, Joshua Yeong wrote:
> > > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig index 
> > > 78702a08364f..9aaa1f71000e 100644
> > > --- a/drivers/cpufreq/Kconfig
> > > +++ b/drivers/cpufreq/Kconfig
> > > @@ -4,8 +4,8 @@ menu "CPU Frequency scaling"
> > >  config CPU_FREQ
> > >  	bool "CPU Frequency scaling"
> > >  	help
> > > -	  CPU Frequency scaling allows you to change the clock speed of 
> > > -	  CPUs on the fly. This is a nice method to save power, because 
> > > +	  CPU Frequency scaling allows you to change the clock speed of
> > > +	  CPUs on the fly. This is a nice method to save power, because
> > >  	  the lower the CPU clock speed, the less power the CPU consumes.
> > >  
> > >  	  Note that this driver doesn't automatically change the CPU @@ 
> > > -65,7 +65,7 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
> > >  	select CPU_FREQ_GOV_USERSPACE
> > >  	help
> > >  	  Use the CPUFreq governor 'userspace' as default. This allows
> > > -	  you to set the CPU frequency manually or when a userspace 
> > > +	  you to set the CPU frequency manually or when a userspace
> > >  	  program shall be able to set the CPU dynamically without having
> > >  	  to enable the userspace governor manually.
> > >  
> > > @@ -134,7 +134,7 @@ config CPU_FREQ_GOV_USERSPACE
> > >  	help
> > >  	  Enable this cpufreq governor when you either want to set the
> > >  	  CPU frequency manually or when a userspace program shall
> > > -	  be able to set the CPU dynamically, like on LART 
> > > +	  be able to set the CPU dynamically, like on LART
> > >  	  <http://www.lartmaker.nl/>.
> > >  
> > >  	  To compile this driver as a module, choose M here: the @@ -147,11 
> > > +147,11 @@ config CPU_FREQ_GOV_ONDEMAND
> > >  	select CPU_FREQ_GOV_COMMON
> > >  	help
> > >  	  'ondemand' - This driver adds a dynamic cpufreq policy governor.
> > > -	  The governor does a periodic polling and 
> > > +	  The governor does a periodic polling and
> > >  	  changes frequency based on the CPU utilization.
> > >  	  The support for this governor depends on CPU capability to
> > >  	  do fast frequency switching (i.e, very low latency frequency
> > > -	  transitions). 
> > > +	  transitions).
> > >  
> > >  	  To compile this driver as a module, choose M here: the
> > >  	  module will be called cpufreq_ondemand.
> > > @@ -367,4 +367,18 @@ config ACPI_CPPC_CPUFREQ_FIE
> > >  
> > >  endif
> >
> > Unrelated changes ?
> 
> Will remove the blank space in V2 patch.

You actually removed the unnecessary blank spaces at the end of many lines,
which is a good change but in a wrong patch. If you want to fix that, send it
separately.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
