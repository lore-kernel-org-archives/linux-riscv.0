Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04255C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 02:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KL8H2X0ICvivvNE0qzaj64oCR0x3jMdmBcFn7nfoSLw=; b=umgP4P62XxKIljvVFNjpjqFZ8W
	ynbcRL733zgV/iQ0TyLPkoAtS6cuXUEDqG5cL+vTI5HLEO0+GTnsgEOP2c6O5BNj2w6cq9XpnK0N4
	eXmCwBNBDqL/vsh4t3r04Pfo857scmbRhqq+O9kVYC8q629+kk89t5rsM8Z6+u6BuNHLGUoPagMT2
	/jmu4SoQHnlrxYAf3HjKWENXsPrNa1X3gOiORxxFUQ7+ewvm9/xJWTjvxb8tZW5NmtRCfWQtcRpLV
	yW1R3k7pQZOB57LijhZq2vSk9QDLf4LdJa2BvTBAEyCwirSJz2MJ/iFT08ksqrM1LEZp/GxcjCLb7
	5qBnBCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwaGO-0015HV-NL; Thu, 02 Jun 2022 02:08:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwaGM-0015GJ-M5
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 02:08:40 +0000
Received: by mail-pf1-x42f.google.com with SMTP id u2so3533472pfc.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=xYNTX2mpCMe8a0CcUXMvFebxOL0u5asl+aYsJ5XYMjw=;
        b=cfhjd+GFR3CD1LDDxAUy4k5bHPl45dgK9L/vFFk6dWbmx/2IC9t23TxgwOX8opDZRM
         q8PIsJmZe3IzZlTUIRJmdNQjMwjQ3gIuIV6REDqvDFlT7pcN28g2yQNraBLTXnwXjwnD
         OpDiVQec+JceZfIOIsKZPuETylI6T/gGahTY1z9K3QFzFxR3E8DI7zIi8DiFU2BhPYzu
         n4S/nURC3V6Kmfalq9dV6/Bfp6b6AdypUUOSZ8fJGXDVThTLGLlALsQLa7jKgw6An6O8
         jQ9qj4UyEVKijpALfnEctLkGitft0iaWZXJIo3FgGvL1ZIUoufO7zb6RpUC0kTmgN52g
         PlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=xYNTX2mpCMe8a0CcUXMvFebxOL0u5asl+aYsJ5XYMjw=;
        b=wP/fqj4TTy3QKbhA0wvh/lxT4oaZocr12FDj7vcd66XtPn4qPuEhn+yV4iOlzcO/jJ
         ENsr+RHXWrCjPM5jwdsGN41XDT6wZwpshnhkHccs6hshsclBN/i4ieTVy1FOdfNw9r/S
         SWjAlHZEYToV9vb9J4aXbbO2IEMA22QazA0NqAMRibOqeRKR2foROM8MEZ1eYy4Gwix4
         FLBVIyBfhFkch9N7z/nb+RRPPPDM0EEEg9M32lE9AMRt7j0QAIYR3USfMiVfrReQUezW
         A9l6ARNh/xoW7eefXMsdDWOWBanP7ay0G/T7UExbuHJ3DpVHofb69WAy8rjhqmzs+ff2
         /hrg==
X-Gm-Message-State: AOAM530PttOziXlBF1BbszT97nEJrQxO/+pa3Gon3QjwuNZ5yY8zoZpT
	ZU8bgkeMO1tJeEO5dmy1uarpGi2KWNic0w==
X-Google-Smtp-Source: ABdhPJwM6jMU+4HQhS5HV0eRbtnoUKzXjjqPmMTyZ9hNeBb7jNsAtYwRg5OlZ99Zx1IQ9DKrdMFlDQ==
X-Received: by 2002:a05:6a00:1a44:b0:510:a043:3b09 with SMTP id h4-20020a056a001a4400b00510a0433b09mr69073282pfv.62.1654135716389;
        Wed, 01 Jun 2022 19:08:36 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b0016641a37e71sm156846plb.225.2022.06.01.19.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:08:36 -0700 (PDT)
Date: Wed, 01 Jun 2022 19:08:36 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 19:08:34 PDT (-0700)
Subject: Re: [PATCH v1] RISC-V: Only default to spinwait on SBI-0.1 and M-mode
In-Reply-To: <20220421170354.10555-1-palmer@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>, mark.rutland@arm.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-5203a5dd-c960-4c13-827d-9512d4c1374b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_190838_763048_B7141350 
X-CRM114-Status: GOOD (  23.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 21 Apr 2022 10:03:55 PDT (-0700), Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The spinwait boot method has been superseeded by the SBI HSM extension
> for some time now, but it still enabled by default.  This causes some
> issues on large hart count systems, which will hang if a physical hart
> exists that is larger than NR_CPUS.
>
> Users on modern SBI implemenation don't need spinwait, and while it's
> probably possible to deal with some of the spinwait issues let's just
> restrict the default to systems that are likely to actually use it.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This seems to be the source of many of my new hangs when trying to test
> the NR_CPUS=512 support.  It's not really related, just fallout from
> testing different setups.
> ---
>  arch/riscv/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..dd5e975abe37 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -359,7 +359,7 @@ config RISCV_SBI_V01
>  config RISCV_BOOT_SPINWAIT
>  	bool "Spinwait booting method"
>  	depends on SMP
> -	default y
> +	default y if RISCV_SBI_V01 || RISCV_M_MODE
>  	help
>  	  This enables support for booting Linux via spinwait method. In the
>  	  spinwait method, all cores randomly jump to Linux. One of the cores
> @@ -370,6 +370,12 @@ config RISCV_BOOT_SPINWAIT
>  	  rely on ordered booting via SBI HSM extension which gets chosen
>  	  dynamically at runtime if the firmware supports it.
>
> +	  Since spinwait is incompatible with sparse hart IDs, it requires
> +	  NR_CPUS be large enough to contain the physical hart ID of the first
> +	  hart to enter Linux.
> +
> +	  If unsure what to do here, say N.
> +
>  config KEXEC
>  	bool "Kexec system call"
>  	select KEXEC_CORE

This is on for-next, with some typos fixed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
