Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D57C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bowul1PuBdfWq/Ra5++z7YEIUowTG5JOAb52hAvfZNM=; b=bCQyxpIzVYxjQr
	1wNuWgp1l4C7aR3/A1AkgKfCVdd21tBPLhfHswYmRtNxMX5OjG5vFFMzZ3mNmU8ql214L+z04PqPM
	a1SQqy7BTqQ9JnhDjfnKTBC+Q63NyOsURzfXlgyVWMf6JaxyCVw1JalEcV3EpLzLRWv9jb8L44Efj
	zGXW6gVj1zQYaKArgKDGfungu54Fl/Q6Kj1oVqnoXCNX6Zoc0wlcic8tOoBNpWlV4eAK2aD5n3cBL
	VlszXliDfQa+6DesGSg/O8K+O6TsWrelW20McQG/Mwq0Qb68MfGoUR8bWpRY9oXGhCsb6xpIiL13i
	oWwrn6BRq2+iX14Y8I1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryz79-0000000EleU-0cC5;
	Mon, 22 Apr 2024 19:14:07 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryz75-0000000Ele0-3843
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 19:14:05 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-618874234c9so52333307b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Apr 2024 12:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713813241; x=1714418041; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1scUmSJ5uGPUbNG6hIM1Mj3BSCgLvK4E9dbi4ZuMCc=;
        b=dnw/tZNbNw+pVpAAyj8rsEmmyGjToQ66wpZOl6Mir5FXFU8aEX+hfGtG8SK23syWyt
         RHC7pxc6A5z9oY6b4JnqQ6i/Np0stU4Sma0PO9aW4XVCS3k/bL6cV10tDGs0eyNaJGP6
         U2Ikgrq11nfLJmstsryjengM8KFZaW+RS3qhiE0fgTch8HhZiBj8Neu9kIMVHmUswW1v
         J7v6dpsDC7DCsaLXhDPYKGfiOiaDY1ZYVm53ytxatxTawaneXO6h+WfzyuAQ1jmtvNP+
         Izl20jiPz8jSkL2/72E81OmUx1uhlyTjNwzujOyaHPRlkGXrrBXovkRuIENon2I9R1JE
         WVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713813241; x=1714418041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1scUmSJ5uGPUbNG6hIM1Mj3BSCgLvK4E9dbi4ZuMCc=;
        b=dxoPP+TtPWCI7+rcI6hNcZyKn3FW2V+ULw6jjj7nJ959NAmuN6ATxEht3xS3+O0LVo
         6VAQYgnC1DT+k32l5sSc1qYQ9fm7G+yVkjXCvdwkwsxucuaI5bA8EgLCcHIrDWJ79Crp
         DmPcQTeuJUMAKCTGdkbbU9oqDdtSIMe1mViRJx2z24b+KJ2O1UIETc7LpsjCIz79eEq7
         RJA8RMN4KM8VTamQemYp9qEjF5lM6uhoRsduM19FoNufxlNI0+P+o73zEcXcLDy1rSiJ
         N5KN3RGFrpch7WDAFAcJCHsl8dXhericJq3X3Lw2MdSA4iCSUbIlV/Co2NFOTy9stYcC
         Plzg==
X-Forwarded-Encrypted: i=1; AJvYcCWwIldFxpVUAeSl4nXrXDOPHVlL5JovRUkuOWeb104Hc9VKVxgCikSgBsKK8tIHzRklYKpj9oKUFKgfK5x8iNN88eedtnuzNC04SMNQkpN0
X-Gm-Message-State: AOJu0YwuI9J6rncULbD1wLNK9PdOPZUJEAmC1c6oN7gOClvD3aSVZgsh
	0LJ975vN2IoMX7tl35RXuPrSrKoDSpPa1rmBihPDpj4UibvaDoQPkm7gaUDfvZY=
X-Google-Smtp-Source: AGHT+IEh+PQDiIdCy0QfaSEbiaLMuK5KgJ09F4nU0J2J8VhKDhoiFqsBkQ+g/bfcFms2IMO+uk2PgQ==
X-Received: by 2002:a25:b317:0:b0:dca:59a7:896b with SMTP id l23-20020a25b317000000b00dca59a7896bmr11388887ybj.50.1713813241302;
        Mon, 22 Apr 2024 12:14:01 -0700 (PDT)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id t188-20020a25c3c5000000b00dc6c58ae000sm2185935ybf.16.2024.04.22.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 12:14:00 -0700 (PDT)
Date: Mon, 22 Apr 2024 15:13:59 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	schwab@suse.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "riscv: disable generation of unwind tables"
Message-ID: <Zia29wYvScRVdXUP@ghost>
References: <20240416013138.28760-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240416013138.28760-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_121403_913094_6B0AF69A 
X-CRM114-Status: GOOD (  18.99  )
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

On Tue, Apr 16, 2024 at 09:31:38AM +0800, Zong Li wrote:
> This reverts commit 2f394c0e7d1129a35156e492bc8f445fb20f43ac.
> 
> RISC-V has supported the complete relocation types in module loader by
> '8fd6c5142395 ("riscv: Add remaining module relocations")'.
> Now RISC-V port can enable unwind tables in case eh_frame parsing is
> needed.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 5b3115a19852..9216bf8a2691 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -94,9 +94,6 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
>  	KBUILD_CFLAGS += -mcmodel=medany
>  endif
>  
> -# Avoid generating .eh_frame sections.
> -KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
> -

There are a lot of orphaned sections created by this, which throws a lot
of warnings. These warnings will only be present on GCC-13+ since
-fno-asynchronous-unwind-tables was a default before GCC-13.

The .eh_frame orphaned sections can be resolved by including

.eh_frame : {*(.eh_frame)}

in arch/riscv/kernel/vmlinux.lds.S. arm64 places it in the init section,
but outside init_data and init_text, so right after the .alternative
definition seems like a good place.

.init.eh_frame sections in drivers/firmware/efi/libstub also complain
about being orphaned, and other architectures have disabled unwind
tables for that compilation unit, so -fno-unwind-tables and
-fno-asynchronous-unwind-tables should be added to
drivers/firmware/efi/libstub/Makefile for riscv.

This also causes the resulting image (with defconfig) to increase from
22M to 24M. There are currently no users of unwind tables in riscv so
this should be hidden behind a config. arm64 uses this config as:

# Avoid generating .eh_frame* sections.
ifneq ($(CONFIG_UNWIND_TABLES),y)
KBUILD_CFLAGS   += -fno-asynchronous-unwind-tables -fno-unwind-tables
KBUILD_AFLAGS   += -fno-asynchronous-unwind-tables -fno-unwind-tables
else
KBUILD_CFLAGS   += -fasynchronous-unwind-tables
KBUILD_AFLAGS   += -fasynchronous-unwind-tables
endif

Using this same config name for riscv would allow riscv to use the
standard .eh_frame code introduced in
https://lore.kernel.org/linux-arm-kernel/20221027155908.1940624-2-ardb@kernel.org/.

This config is only enabled if some other config selects it in arm64,
but riscv does not contain any users so maybe this config can be left
unselected until there is a user of unwind tables in riscv.

- Charlie

>  # The RISC-V attributes frequently cause compatibility issues and provide no
>  # information, so just turn them off.
>  KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
> -- 
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
