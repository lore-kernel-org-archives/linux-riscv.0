Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1DCC3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 18:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktdLx6OjKPfswpwmtEXbdbGmH62oJXt5Yk5s97E2cts=; b=FSvmXuqH7lkkju
	det8m2xVmmaDZjWzIEhNftDtZOwk2IHlWfR9qg4Ur1HqugSuYe5lJaLr4ZUQU2O3bbqercuvNbkWk
	LbOnlZnaOv0yZRzbuMl3qbyNY7jnqeo6/pnDC9OcqqwK8HJdXqIvJeXkRfALe4rLZU3EZaOEnE6pB
	JDUGRYL06RuWwXnKr8RUNE2UBz1C3Z26VicR9u1EnNQ03BdqeuOJMkWRy0X4VVbPLI0wqjZtqWRJ0
	Wr+ttHbnHP6CsuvLCLBttEbS6DTKnco31es76ABaeZdMH2+xZTxFxCJEu4YWcK7KAa0KAHk/+w/cd
	cAeGAMPgYAKH1OWZBh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqGhq-00000004i4n-1ivt;
	Mon, 16 Sep 2024 18:44:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqGhn-00000004i4O-2k8y
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 18:44:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2d889ba25f7so2479503a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726512250; x=1727117050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWRt0WDZ9DWFdEsHGfP3sRZRYldXkufLSIbgP8dWZKY=;
        b=owwMcjXIaNj/U6lBkxRfFmCOSaTP4uwyKYfCXH3J2uupMs+QEFmoYgJkyheirnBw4P
         m3jRm6E7Ey7OibFIC3Cs0OHcpSTP6Gg0Tw7oZn/q9ogeyOmVaZpxGJ3m/Ou1lE2ScTeR
         ZRq78MNAgKqYdNNC/K3ZUt1lssZ+plu2XwXmQf4Nv9WapgPzSkP+0ntdP8y2NTsuJvro
         wo3z872mVQUPD8tamQFVeWbldg/bvyvjV1sxea56ghZnOaZSJRzi31NXpmo/E1SFdVl7
         Up8fXwWLUQ/v1uI9+zIBT4fBCet+SqiOWp39j3YOaEa6iwJ8u4E3IBO3buAUEYajBqQt
         HFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726512250; x=1727117050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWRt0WDZ9DWFdEsHGfP3sRZRYldXkufLSIbgP8dWZKY=;
        b=XK7XpUQkZyRWDjCBW8IBH+ezGDK9Grf5ZZuv5hZfMu45n5MSv874KtMlWKuzJhoqmd
         Mx528kkKsdfLksXX85Fi+8imZV1FPcH1ZBoLbl+R9r6uG9flqMY5A9EuUOlfgObvpXZN
         OIN40ap4D9UlyZCflDv/ZpjnTzSDio6+IQFXvG3DWeZHAjcUj2ftAh5TdmiuvOKH6AQv
         umSyFfLZHedX/HaDpR4aJO9eALwvN39fXWyQg/A3l4csLdIVHfLJ5GqWeuoaCHTzpeUt
         OlkuWtbLQMQg+VGDZVlPQQHzWAYhXTYUZX9eumCCAiS5ra3e1NLeTWH+aagTjpu8uMiN
         uIjg==
X-Forwarded-Encrypted: i=1; AJvYcCUOhecCHmDoUXDjqJf+1iUVV/Y+Puc2AS47otvEp7PnvOorT+edhDvYdMc9Tquv64BqZbi9+3Zeo4ds1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8oo4VfaFzv/DqfvVVo+qoHSIU4xBY9Yz3DJijtR2Kp6/SB4ts
	VgTJaOv87uG/nC8a+5LilZA+UUVh2Mk04M+XbUCaAMi7M/uhaXBzpouZcHba8ww=
X-Google-Smtp-Source: AGHT+IF8dispIWAu4SBpBRXvJsNyO6F3tbYcZrnsVzU7MIvT/flk7KgGQY9i8SqZ41S7cO9LZnYSGg==
X-Received: by 2002:a17:90b:1c81:b0:2d8:7307:3f74 with SMTP id 98e67ed59e1d1-2dbb9f31cf2mr13931669a91.27.1726512250018;
        Mon, 16 Sep 2024 11:44:10 -0700 (PDT)
Received: from ghost ([216.9.110.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbcfcf7f3fsm5689098a91.14.2024.09.16.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 11:44:09 -0700 (PDT)
Date: Mon, 16 Sep 2024 11:44:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v10 14/14] riscv: Add ghostwrite vulnerability
Message-ID: <Zuh8dLsA50IHXymz@ghost>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <20240911-xtheadvector-v10-14-8d3930091246@rivosinc.com>
 <20240916-pretext-freehand-20dca1376cd4@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240916-pretext-freehand-20dca1376cd4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_114411_730637_FBB99A6E 
X-CRM114-Status: GOOD (  48.08  )
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

On Mon, Sep 16, 2024 at 06:12:04PM +0100, Conor Dooley wrote:
> On Wed, Sep 11, 2024 at 10:55:22PM -0700, Charlie Jenkins wrote:
> > Follow the patterns of the other architectures that use
> > GENERIC_CPU_VULNERABILITIES for riscv to introduce the ghostwrite
> > vulnerability and mitigation. The mitigation is to disable all vector
> > which is accomplished by clearing the bit from the cpufeature field.
> > 
> > Ghostwrite only affects thead c9xx CPUs that impelment xtheadvector, so
> > the vulerability will only be mitigated on these CPUs.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig.errata            | 11 ++++++++
> >  arch/riscv/errata/thead/errata.c     | 28 ++++++++++++++++++
> >  arch/riscv/include/asm/bugs.h        | 22 +++++++++++++++
> >  arch/riscv/include/asm/errata_list.h |  3 +-
> >  arch/riscv/kernel/Makefile           |  2 ++
> >  arch/riscv/kernel/bugs.c             | 55 ++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c       |  9 +++++-
> >  drivers/base/cpu.c                   |  3 ++
> >  include/linux/cpu.h                  |  1 +
> >  9 files changed, 132 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 2acc7d876e1f..e318119d570d 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -119,4 +119,15 @@ config ERRATA_THEAD_PMU
> >  
> >  	  If you don't know what to do here, say "Y".
> >  
> > +config ERRATA_THEAD_GHOSTWRITE
> > +	bool "Apply T-Head Ghostwrite errata"
> > +	depends on ERRATA_THEAD && RISCV_ISA_XTHEADVECTOR
> > +	default y
> > +	help
> > +	  The T-Head C9xx cores have a vulnerability in the xtheadvector
> > +	  instruction set. When this errata is enabled, the CPUs will be probed
> > +	  to determine if they are vulnerable and disable xtheadvector.
> > +
> > +	  If you don't know what to do here, say "Y".
> > +
> >  endmenu # "CPU errata selection"
> > diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> > index f5120e07c318..5cc008ab41a8 100644
> > --- a/arch/riscv/errata/thead/errata.c
> > +++ b/arch/riscv/errata/thead/errata.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/string.h>
> >  #include <linux/uaccess.h>
> >  #include <asm/alternative.h>
> > +#include <asm/bugs.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/dma-noncoherent.h>
> > @@ -142,6 +143,31 @@ static bool errata_probe_pmu(unsigned int stage,
> >  	return true;
> >  }
> >  
> > +static bool errata_probe_ghostwrite(unsigned int stage,
> > +				    unsigned long arch_id, unsigned long impid)
> > +{
> > +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_GHOSTWRITE))
> > +		return false;
> > +
> > +	/*
> > +	 * target-c9xx cores report arch_id and impid as 0
> > +	 *
> > +	 * While ghostwrite may not affect all c9xx cores that implement
> > +	 * xtheadvector, there is no futher granularity than c9xx. Assume
> > +	 * vulnerable for this entire class of processors when xtheadvector is
> > +	 * enabled.
> > +	 */
> 
> Is it not possible to use the cpu compatible string for this? Given that
> we only know if xtheadvector is enabled once we are already parsing the
> cpu node devicetree, it seems, to me, as if it should be possible to be
> more granular. AFAIU, some T-Head c900 series devices are not venerable.

Sure we can do that. I figured that since T-Head didn't feel it was
valuable to change the archid/implid between cores that Linux shouldn't
go out of its way to fix the granularity issue. Since you think it is
worthwhile though, I can try to work around this hardware issue.

- Charlie

> 
> Cheers,
> Conor.
> 
> > +	if (arch_id != 0 || impid != 0)
> > +		return false;
> > +
> > +	if (stage != RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return false;
> > +
> > +	ghostwrite_set_vulnerable();
> > +
> > +	return true;
> > +}
> > +
> >  static u32 thead_errata_probe(unsigned int stage,
> >  			      unsigned long archid, unsigned long impid)
> >  {
> > @@ -155,6 +181,8 @@ static u32 thead_errata_probe(unsigned int stage,
> >  	if (errata_probe_pmu(stage, archid, impid))
> >  		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
> >  
> > +	errata_probe_ghostwrite(stage, archid, impid);
> > +
> >  	return cpu_req_errata;
> >  }
> >  
> > diff --git a/arch/riscv/include/asm/bugs.h b/arch/riscv/include/asm/bugs.h
> > new file mode 100644
> > index 000000000000..e294b15bf78e
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/bugs.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Interface for managing mitigations for riscv vulnerabilities.
> > + *
> > + * Copyright (C) 2024 Rivos Inc.
> > + */
> > +
> > +#ifndef __ASM_BUGS_H
> > +#define __ASM_BUGS_H
> > +
> > +/* Watch out, ordering is important here. */
> > +enum mitigation_state {
> > +	UNAFFECTED,
> > +	MITIGATED,
> > +	VULNERABLE,
> > +};
> > +
> > +void ghostwrite_set_vulnerable(void);
> > +void ghostwrite_enable_mitigation(void);
> > +enum mitigation_state ghostwrite_get_state(void);
> > +
> > +#endif /* __ASM_BUGS_H */
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> > index 7c8a71a526a3..6e426ed7919a 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -25,7 +25,8 @@
> >  #ifdef CONFIG_ERRATA_THEAD
> >  #define	ERRATA_THEAD_MAE 0
> >  #define	ERRATA_THEAD_PMU 1
> > -#define	ERRATA_THEAD_NUMBER 2
> > +#define	ERRATA_THEAD_GHOSTWRITE 2
> > +#define	ERRATA_THEAD_NUMBER 3
> >  #endif
> >  
> >  #ifdef __ASSEMBLY__
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 06d407f1b30b..d7a54e34178e 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -113,3 +113,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
> >  obj-$(CONFIG_64BIT)		+= pi/
> >  obj-$(CONFIG_ACPI)		+= acpi.o
> >  obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
> > +
> > +obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
> > diff --git a/arch/riscv/kernel/bugs.c b/arch/riscv/kernel/bugs.c
> > new file mode 100644
> > index 000000000000..0c19691b4cd5
> > --- /dev/null
> > +++ b/arch/riscv/kernel/bugs.c
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Rivos Inc.
> > + */
> > +
> > +#include <linux/cpu.h>
> > +#include <linux/device.h>
> > +#include <linux/sprintf.h>
> > +
> > +#include <asm/bugs.h>
> > +#include <asm/vendor_extensions/thead.h>
> > +
> > +static enum mitigation_state ghostwrite_state;
> > +
> > +void ghostwrite_set_vulnerable(void)
> > +{
> > +	ghostwrite_state = VULNERABLE;
> > +}
> > +
> > +/*
> > + * Vendor extension alternatives will use the value set at the time of boot
> > + * alternative patching, thus this must be called before boot alternatives are
> > + * patched (and after extension probing) to be effective.
> > + */
> > +void ghostwrite_enable_mitigation(void)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR) &&
> > +	    ghostwrite_state == VULNERABLE && !cpu_mitigations_off()) {
> > +		disable_xtheadvector();
> > +		ghostwrite_state = MITIGATED;
> > +	}
> > +}
> > +
> > +enum mitigation_state ghostwrite_get_state(void)
> > +{
> > +	return ghostwrite_state;
> > +}
> > +
> > +ssize_t cpu_show_ghostwrite(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR)) {
> > +		switch (ghostwrite_state) {
> > +		case UNAFFECTED:
> > +			return sprintf(buf, "Not affected\n");
> > +		case MITIGATED:
> > +			return sprintf(buf, "Mitigation: xtheadvector disabled\n");
> > +		case VULNERABLE:
> > +			fallthrough;
> > +		default:
> > +			return sprintf(buf, "Vulnerable\n");
> > +		}
> > +	} else {
> > +		return sprintf(buf, "Not affected\n");
> > +	}
> > +}
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 56b5054b8f86..1f4329bb8a9d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/of.h>
> >  #include <asm/acpi.h>
> >  #include <asm/alternative.h>
> > +#include <asm/bugs.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/cpufeature.h>
> >  #include <asm/hwcap.h>
> > @@ -867,7 +868,13 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
> >  		riscv_fill_vendor_ext_list(cpu);
> >  	}
> >  
> > -	if (has_xtheadvector_no_alternatives() && has_thead_homogeneous_vlenb() < 0) {
> > +	/*
> > +	 * Execute ghostwrite mitigation immediately after detecting extensions
> > +	 * to disable xtheadvector if necessary.
> > +	 */
> > +	if (ghostwrite_get_state() == VULNERABLE) {
> > +		ghostwrite_enable_mitigation();
> > +	} else if (has_xtheadvector_no_alternatives() && has_thead_homogeneous_vlenb() < 0) {
> >  		pr_warn("Unsupported heterogeneous vlenb detected, vector extension disabled.\n");
> >  		disable_xtheadvector();
> >  	}
> > diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> > index fdaa24bb641a..a7e511849875 100644
> > --- a/drivers/base/cpu.c
> > +++ b/drivers/base/cpu.c
> > @@ -599,6 +599,7 @@ CPU_SHOW_VULN_FALLBACK(retbleed);
> >  CPU_SHOW_VULN_FALLBACK(spec_rstack_overflow);
> >  CPU_SHOW_VULN_FALLBACK(gds);
> >  CPU_SHOW_VULN_FALLBACK(reg_file_data_sampling);
> > +CPU_SHOW_VULN_FALLBACK(ghostwrite);
> >  
> >  static DEVICE_ATTR(meltdown, 0444, cpu_show_meltdown, NULL);
> >  static DEVICE_ATTR(spectre_v1, 0444, cpu_show_spectre_v1, NULL);
> > @@ -614,6 +615,7 @@ static DEVICE_ATTR(retbleed, 0444, cpu_show_retbleed, NULL);
> >  static DEVICE_ATTR(spec_rstack_overflow, 0444, cpu_show_spec_rstack_overflow, NULL);
> >  static DEVICE_ATTR(gather_data_sampling, 0444, cpu_show_gds, NULL);
> >  static DEVICE_ATTR(reg_file_data_sampling, 0444, cpu_show_reg_file_data_sampling, NULL);
> > +static DEVICE_ATTR(ghostwrite, 0444, cpu_show_ghostwrite, NULL);
> >  
> >  static struct attribute *cpu_root_vulnerabilities_attrs[] = {
> >  	&dev_attr_meltdown.attr,
> > @@ -630,6 +632,7 @@ static struct attribute *cpu_root_vulnerabilities_attrs[] = {
> >  	&dev_attr_spec_rstack_overflow.attr,
> >  	&dev_attr_gather_data_sampling.attr,
> >  	&dev_attr_reg_file_data_sampling.attr,
> > +	&dev_attr_ghostwrite.attr,
> >  	NULL
> >  };
> >  
> > diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> > index bdcec1732445..6a0a8f1c7c90 100644
> > --- a/include/linux/cpu.h
> > +++ b/include/linux/cpu.h
> > @@ -77,6 +77,7 @@ extern ssize_t cpu_show_gds(struct device *dev,
> >  			    struct device_attribute *attr, char *buf);
> >  extern ssize_t cpu_show_reg_file_data_sampling(struct device *dev,
> >  					       struct device_attribute *attr, char *buf);
> > +extern ssize_t cpu_show_ghostwrite(struct device *dev, struct device_attribute *attr, char *buf);
> >  
> >  extern __printf(4, 5)
> >  struct device *cpu_device_create(struct device *parent, void *drvdata,
> > 
> > -- 
> > 2.45.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
