Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5405FC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 19:42:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022B260FF1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 19:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022B260FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSj6hu+mvsvNNPooBgbSddvCVXrw0mSP1zHBKrtlUbQ=; b=aR+5q5z7j9HkxvxYfsjs+3U1u
	F6KKcfsdINifSoFPEhd5f9unm7ZKPpbE0SEwpmeL8s7+JybD8NwytQV2bta2lU1B/4XirES6qQ8s6
	4rpA3ifQqU/XHmMP6lxMPOsdG9/hbHmU3/ZTXa1jY4waXU6hE5GsD8SKvQhYM0WFNpze3tOlbSAHj
	/TMxp7KiUMm941Ld1dCyxWXr1ja2eGiIHaET6hCtjk9gXAsKs5Um61io8vfGFlxRlrquNbUOxPLuE
	htCgif15OTufIQz4ao0Bx7y5/gDY5Xp3wHceOfq1f690xVO0ibKCvIv9yTURmt+B+KKViMd5UZRJN
	CcTTxrLGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUaXX-0097nL-2i; Thu, 08 Apr 2021 19:42:07 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUaXK-0097mF-DM; Thu, 08 Apr 2021 19:41:56 +0000
Received: by mail-oi1-f182.google.com with SMTP id z15so3369286oic.8;
 Thu, 08 Apr 2021 12:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FITwZl80gS3YR2FZtlgpQ5oYWS85Ct2sijj6jggUvFY=;
 b=Qh7lTex/F0mUpnwsuMBJcgLZMlvNvTPk4OoegwbfIyuLuqOOJspfKIxA4bbgOWXaWI
 rbnlP9YkChTwJDZG9GnQQdh5pje3Oa/C946mvm1FUJfqber9bAL+0InxkaJZnYPtHgd4
 GYjpra8mKOIIpQMHIUAHbg7mCsBDod1U0AVYjHyGFQdw8Tq4Q0YYLLt0p2fCz0iuJ9Cp
 yu6mpHK13Y48Btjg7cHvSxXoUbXScq3Ir3esduGrai7mRhaIW3aEKNH7Euaw09CYODOk
 1PBEoAOCc1nRa3TDoYAEoQey8ABJurALXa5qMhIePBlONTDfLODONXWT0lVrJc/iYMQ0
 K81g==
X-Gm-Message-State: AOAM533wpHDza38gp4pBIZep2CURcr63PZZsU+C3J6cn/LsVX0Hykh0E
 erjbPym9bmFtpgaFZ4XanQ==
X-Google-Smtp-Source: ABdhPJws8AH5mE+MDBnJXs7fKUy6WuwH3lOBsNvmWgFCUyZHpaJjOknPdkw2lABZOuOUgpOplmGZIg==
X-Received: by 2002:aca:4ad2:: with SMTP id x201mr7515600oia.46.1617910910592; 
 Thu, 08 Apr 2021 12:41:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y10sm72595oto.18.2021.04.08.12.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:41:49 -0700 (PDT)
Received: (nullmailer pid 1844346 invoked by uid 1000);
 Thu, 08 Apr 2021 19:41:48 -0000
Date: Thu, 8 Apr 2021 14:41:48 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: will@kernel.org, danielwa@cisco.com, daniel@gimpelevich.san-francisco.ca.us,
 arnd@kernel.org, akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 18/20] x86: Convert to GENERIC_CMDLINE
Message-ID: <20210408194148.GB1724284@robh.at.kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_204154_589479_CD906ABB 
X-CRM114-Status: GOOD (  31.35  )
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

On Fri, Apr 02, 2021 at 03:18:20PM +0000, Christophe Leroy wrote:
> This converts the architecture to GENERIC_CMDLINE.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/x86/Kconfig        | 45 ++---------------------------------------
>  arch/x86/kernel/setup.c | 17 ++--------------
>  2 files changed, 4 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index a20684d56b4b..66b384228ca3 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -104,6 +104,7 @@ config X86
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_USE_SYM_ANNOTATIONS
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> +	select ARCH_WANT_CMDLINE_PREPEND_BY_DEFAULT

Seems to be non-existent kconfig option.

>  	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_WANT_HUGE_PMD_SHARE
> @@ -118,6 +119,7 @@ config X86
>  	select EDAC_SUPPORT
>  	select GENERIC_CLOCKEVENTS_BROADCAST	if X86_64 || (X86_32 && X86_LOCAL_APIC)
>  	select GENERIC_CLOCKEVENTS_MIN_ADJUST
> +	select GENERIC_CMDLINE
>  	select GENERIC_CMOS_UPDATE
>  	select GENERIC_CPU_AUTOPROBE
>  	select GENERIC_CPU_VULNERABILITIES
> @@ -2358,49 +2360,6 @@ choice
>  
>  endchoice
>  
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> -	help
> -	  Allow for specifying boot arguments to the kernel at
> -	  build time.  On some systems (e.g. embedded ones), it is
> -	  necessary or convenient to provide some or all of the
> -	  kernel boot arguments with the kernel itself (that is,
> -	  to not rely on the boot loader to provide them.)
> -
> -	  To compile command line arguments into the kernel,
> -	  set this option to 'Y', then fill in the
> -	  boot arguments in CONFIG_CMDLINE.
> -
> -	  Systems with fully functional boot loaders (i.e. non-embedded)
> -	  should leave this option set to 'N'.
> -
> -config CMDLINE
> -	string "Built-in kernel command string"
> -	depends on CMDLINE_BOOL
> -	default ""
> -	help
> -	  Enter arguments here that should be compiled into the kernel
> -	  image and used at boot time.  If the boot loader provides a
> -	  command line at boot time, it is appended to this string to
> -	  form the full kernel command line, when the system boots.
> -
> -	  However, you can use the CONFIG_CMDLINE_FORCE option to
> -	  change this behavior.
> -
> -	  In most cases, the command line (whether built-in or provided
> -	  by the boot loader) should specify the device for the root
> -	  file system.
> -
> -config CMDLINE_FORCE
> -	bool "Built-in command line overrides boot loader arguments"
> -	depends on CMDLINE_BOOL && CMDLINE != ""
> -	help
> -	  Set this option to 'Y' to have the kernel ignore the boot loader
> -	  command line, and use ONLY the built-in command line.
> -
> -	  This is used to work around broken boot loaders.  This should
> -	  be set to 'N' under normal conditions.
> -
>  config MODIFY_LDT_SYSCALL
>  	bool "Enable the LDT (local descriptor table)" if EXPERT
>  	default y
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 6f2de58eeb54..3f274b02e51c 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -5,6 +5,7 @@
>   * This file contains the setup_arch() code, which handles the architecture-dependent
>   * parts of early kernel initialization.
>   */
> +#include <linux/cmdline.h>
>  #include <linux/console.h>
>  #include <linux/crash_dump.h>
>  #include <linux/dma-map-ops.h>
> @@ -161,9 +162,6 @@ unsigned long saved_video_mode;
>  #define RAMDISK_LOAD_FLAG		0x4000
>  
>  static char __initdata command_line[COMMAND_LINE_SIZE];
> -#ifdef CONFIG_CMDLINE_BOOL
> -static char __initdata builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;
> -#endif
>  
>  #if defined(CONFIG_EDD) || defined(CONFIG_EDD_MODULE)
>  struct edd edd;
> @@ -883,18 +881,7 @@ void __init setup_arch(char **cmdline_p)
>  	bss_resource.start = __pa_symbol(__bss_start);
>  	bss_resource.end = __pa_symbol(__bss_stop)-1;
>  
> -#ifdef CONFIG_CMDLINE_BOOL
> -#ifdef CONFIG_CMDLINE_FORCE
> -	strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -#else
> -	if (builtin_cmdline[0]) {
> -		/* append boot loader cmdline to builtin */
> -		strlcat(builtin_cmdline, " ", COMMAND_LINE_SIZE);
> -		strlcat(builtin_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> -		strlcpy(boot_command_line, builtin_cmdline, COMMAND_LINE_SIZE);
> -	}
> -#endif
> -#endif
> +	cmdline_build(boot_command_line, boot_command_line);
>  
>  	strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
>  	*cmdline_p = command_line;

Once this is all done, I wonder if we can get rid of the strlcpy and 
perhaps also cmdline_p.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
