Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D70FEDE994
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9i95I5chrVuBh3s69sz1CpabArWZ2I3JUsFjekC8yI=; b=qSxRgALAHxrvkm
	XgecVN1lzh6l0cG7YuuLYgeDfgU6Gt6uz5ns7+w4Va2xTtW8szOdxX1GDso97l5hjooYgCDm5kCUO
	n86izreBt2bqgeiS6EORcnwqUcBXoAqDF5tV4sjjgwv44Tgc0sHciLRkZ45AULi4JfOua2jZbnQQI
	BmQw96pe2U1Vn9Ph1H6Efi088n8N44nO0f3ePYquYPlTmKzQgKuC2CmI6sf0tK/N0fXLxHuwOgZGx
	qxVwKO0rBvjJNzcwWftetWN2NdDGNRGCtbFqEc9QsF1Y+e8JaDQ+iLS7nPlKr2cXjdL9GOQevVifa
	KvUffJHQCDc5OxVks5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghmV-007iS9-1E;
	Thu, 14 Sep 2023 08:32:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghmR-007iQG-22
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694680372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/v5LVGgI1bCh7IZ5F5HTHb9gqgvRzQ+J2np7/S42Q3I=;
	b=P0C9IWfNUXHy4UOL33TYP4hvbjVD+wgMQ77xOuDZrF6uHa7nmPlSz/qrgXecYZPGJiMFye
	47r9Rrf6Gkcls9SC6u0/4r1Krs84I/zd7Yef+CZ/jmwNJMq/+qmHrAmZ8sP/wd0FkvWcMc
	OYFJIUND9j00vu89G+RLvoF9uoRLkM0=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-oAGJGtzMOYmhu8gHpU3msg-1; Thu, 14 Sep 2023 04:32:50 -0400
X-MC-Unique: oAGJGtzMOYmhu8gHpU3msg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1d5d3735b87so1035496fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 01:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680370; x=1695285170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v5LVGgI1bCh7IZ5F5HTHb9gqgvRzQ+J2np7/S42Q3I=;
        b=XWU+kmdK1lQhW253ATaUg3HL5/pnF2rXmbpn4P/b7B7354KBIhdq3r7wmcJvMlYNvL
         NJaQljPA1837G5IdV6PvjTkdeSTtlKco5T+PR3RW6GZtskKs71ni6HXFsvqNWrKa/Bpk
         COctEWkmLjArfufgMGL3ZcBVZgQj1Jc8fHszZF2y0dC3y76aGYyKhM6VypwbwdBMpptR
         jA1GBIk2BklVDA2TxO3eZGQo3sFOqFR78ibNOMnRZ9ogOWKkQb9O/u8k1XGawEoHcKKH
         MiEBP40dl4O1zZ0AR2609k/CvxL6VzXPsSLVQ7U0geQt7vdRHqeTcn475l81II+GKEQn
         nsig==
X-Gm-Message-State: AOJu0YydUix3G6tRCXnQtwP1s+0LAkHumPEn+42uuI1HaTVjNjoiWB8R
	QxrISaLO3vBLwp+hZNvJo3Fe3Pvi6TmHBRDUB0f8TOdaK65NjasF9MCpweN4HUaN0ssoZBPbneI
	HFNbsa7KrgSB1C0kGRpv+zOhlhQf+
X-Received: by 2002:a05:6870:5608:b0:1b0:2f63:4ff6 with SMTP id m8-20020a056870560800b001b02f634ff6mr5153858oao.1.1694680369738;
        Thu, 14 Sep 2023 01:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETspTdZzZYvBIau8sxRS9qB0qJSQdMZkzC5B1Noxo923sXXDhRBNsu3bJAqLvOXStAslAzvg==
X-Received: by 2002:a05:6870:5608:b0:1b0:2f63:4ff6 with SMTP id m8-20020a056870560800b001b02f634ff6mr5153842oao.1.1694680369455;
        Thu, 14 Sep 2023 01:32:49 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id sf23-20020a056871231700b001d4fe4293efsm535197oab.36.2023.09.14.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:32:48 -0700 (PDT)
Date: Thu, 14 Sep 2023 05:32:39 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 09/17] riscv: qspinlock: errata: Add
 ERRATA_THEAD_WRITE_ONCE fixup
Message-ID: <ZQLFJ1cmQ8PAoMHm@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-10-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-10-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_013255_741363_6D2CDAD8 
X-CRM114-Status: GOOD (  34.10  )
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

On Sun, Sep 10, 2023 at 04:29:03AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The early version of T-Head C9xx cores has a store merge buffer
> delay problem. The store merge buffer could improve the store queue
> performance by merging multi-store requests, but when there are not
> continued store requests, the prior single store request would be
> waiting in the store queue for a long time. That would cause
> significant problems for communication between multi-cores. This
> problem was found on sg2042 & th1520 platforms with the qspinlock
> lock torture test.
> 
> So appending a fence w.o could immediately flush the store merge
> buffer and let other cores see the write result.
> 
> This will apply the WRITE_ONCE errata to handle the non-standard
> behavior via appending a fence w.o instruction for WRITE_ONCE().
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig.errata              | 19 +++++++++++++++++++
>  arch/riscv/errata/thead/errata.c       | 20 ++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h   | 13 -------------
>  arch/riscv/include/asm/rwonce.h        | 24 ++++++++++++++++++++++++
>  arch/riscv/include/asm/vendorid_list.h | 14 ++++++++++++++
>  include/asm-generic/rwonce.h           |  2 ++
>  6 files changed, 79 insertions(+), 13 deletions(-)
>  create mode 100644 arch/riscv/include/asm/rwonce.h
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 1aa85a427ff3..c919cc3f1a3a 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -77,4 +77,23 @@ config ERRATA_THEAD_PMU
>  
>  	  If you don't know what to do here, say "Y".
>  
> +config ERRATA_THEAD_WRITE_ONCE
> +	bool "Apply T-Head WRITE_ONCE errata"
> +	depends on ERRATA_THEAD
> +	default y
> +	help
> +	  The early version of T-Head C9xx cores has a store merge buffer
> +	  delay problem. The store merge buffer could improve the store queue
> +	  performance by merging multi-store requests, but when there are no
> +	  continued store requests, the prior single store request would be
> +	  waiting in the store queue for a long time. That would cause
> +	  significant problems for communication between multi-cores. Appending
> +	  a fence w.o could immediately flush the store merge buffer and let
> +	  other cores see the write result.
> +
> +	  This will apply the WRITE_ONCE errata to handle the non-standard
> +	  behavior via appending a fence w.o instruction for WRITE_ONCE().
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index be84b14f0118..751eb5a7f614 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -69,6 +69,23 @@ static bool errata_probe_pmu(unsigned int stage,
>  	return true;
>  }
>  
> +static bool errata_probe_write_once(unsigned int stage,
> +				    unsigned long arch_id, unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_WRITE_ONCE))
> +		return false;
> +
> +	/* target-c9xx cores report arch_id and impid as 0 */
> +	if (arch_id != 0 || impid != 0)
> +		return false;
> +
> +	if (stage == RISCV_ALTERNATIVES_BOOT ||
> +	    stage == RISCV_ALTERNATIVES_MODULE)
> +		return true;
> +
> +	return false;
> +}
> +
>  static u32 thead_errata_probe(unsigned int stage,
>  			      unsigned long archid, unsigned long impid)
>  {
> @@ -83,6 +100,9 @@ static u32 thead_errata_probe(unsigned int stage,
>  	if (errata_probe_pmu(stage, archid, impid))
>  		cpu_req_errata |= BIT(ERRATA_THEAD_PMU);
>  
> +	if (errata_probe_write_once(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_THEAD_WRITE_ONCE);
> +
>  	return cpu_req_errata;
>  }
>  
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 712cab7adffe..fbb2b8d39321 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -11,19 +11,6 @@
>  #include <asm/hwcap.h>
>  #include <asm/vendorid_list.h>
>  
> -#ifdef CONFIG_ERRATA_SIFIVE
> -#define	ERRATA_SIFIVE_CIP_453 0
> -#define	ERRATA_SIFIVE_CIP_1200 1
> -#define	ERRATA_SIFIVE_NUMBER 2
> -#endif
> -
> -#ifdef CONFIG_ERRATA_THEAD
> -#define	ERRATA_THEAD_PBMT 0
> -#define	ERRATA_THEAD_CMO 1
> -#define	ERRATA_THEAD_PMU 2
> -#define	ERRATA_THEAD_NUMBER 3
> -#endif
> -

Here I understand you are moving stuff from errata_list.h to 
vendorid_list.h. Wouldn't it be better to do this on a separated patch 
before this one?

I understand this is used here, but it looks like it's unrelated.

>  #ifdef __ASSEMBLY__
>  
>  #define ALT_INSN_FAULT(x)						\
> diff --git a/arch/riscv/include/asm/rwonce.h b/arch/riscv/include/asm/rwonce.h
> new file mode 100644
> index 000000000000..be0b8864969d
> --- /dev/null
> +++ b/arch/riscv/include/asm/rwonce.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ASM_RWONCE_H
> +#define __ASM_RWONCE_H
> +
> +#include <linux/compiler_types.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/vendorid_list.h>
> +
> +#define __WRITE_ONCE(x, val)				\
> +do {							\
> +	*(volatile typeof(x) *)&(x) = (val);		\
> +	asm volatile(ALTERNATIVE(			\
> +		__nops(1),				\
> +		"fence w, o\n\t",			\
> +		THEAD_VENDOR_ID,			\
> +		ERRATA_THEAD_WRITE_ONCE,		\
> +		CONFIG_ERRATA_THEAD_WRITE_ONCE)		\
> +		: : : "memory");			\
> +} while (0)
> +
> +#include <asm-generic/rwonce.h>
> +
> +#endif	/* __ASM_RWONCE_H */

IIUC the idea here is to have an alternative __WRITE_ONCE that replaces the 
asm-generic one.

Honestly, this asm alternative here seems too much information, and too 
cryptic. I mean, yeah in the patch it all makes sense, but I imagine myself
in the future looking at all this and trying to understand what is going 
on.

Wouldn't it look better to have something like:

#####

/* Some explanation like the one on Kconfig */

#define write_once_flush()			\
do {						\
	asm volatile(ALTERNATIVE(			\
		__nops(1),			\
		"fence w, o\n\t",		\
		THEAD_VENDOR_ID,		\
		ERRATA_THEAD_WRITE_ONCE,	\
		CONFIG_ERRATA_THEAD_WRITE_ONCE)	\
		: : : "memory");		\
} while(0)


#define __WRITE_ONCE(x, val)			\
do {						\
     	*(volatile typeof(x) *)&(x) = (val);	\
	write_once_flush();			\
} while(0)

#####

	
This way I could quickly see there is a flush after the writting of 
WRITE_ONCE(), and this flush is the above "complicated" asm.

What do you think?

> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
> index cb89af3f0704..73078cfe4029 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -8,4 +8,18 @@
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
>  
> +#ifdef CONFIG_ERRATA_SIFIVE
> +#define	ERRATA_SIFIVE_CIP_453 0
> +#define	ERRATA_SIFIVE_CIP_1200 1
> +#define	ERRATA_SIFIVE_NUMBER 2
> +#endif
> +
> +#ifdef CONFIG_ERRATA_THEAD
> +#define	ERRATA_THEAD_PBMT 0
> +#define	ERRATA_THEAD_CMO 1
> +#define	ERRATA_THEAD_PMU 2
> +#define	ERRATA_THEAD_WRITE_ONCE 3
> +#define	ERRATA_THEAD_NUMBER 4
> +#endif
> +
>  #endif
> diff --git a/include/asm-generic/rwonce.h b/include/asm-generic/rwonce.h
> index 8d0a6280e982..fb07fe8c6e45 100644
> --- a/include/asm-generic/rwonce.h
> +++ b/include/asm-generic/rwonce.h
> @@ -50,10 +50,12 @@
>  	__READ_ONCE(x);							\
>  })
>  
> +#ifndef __WRITE_ONCE
>  #define __WRITE_ONCE(x, val)						\
>  do {									\
>  	*(volatile typeof(x) *)&(x) = (val);				\
>  } while (0)
> +#endif
>  
>  #define WRITE_ONCE(x, val)						\
>  do {									\
> -- 
> 2.36.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
