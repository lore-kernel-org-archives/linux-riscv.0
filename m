Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5C7C02187
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 22:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCJ1D87xroTxGHcqvbqfruUBmKsm0clL8Vs6LPobe/A=; b=uLIs9cQH4PRrUq
	gWwTwwaTbnNEGWAs+IfRSNwkYEVgqaP/aDraXyu2dAaWkkuIjqoIjFkd32NI42gTWJ0eWRcw8abTj
	L5glgQR8hJ6ccRR4lmluAz45GhL4x9sZmBBQ3mcxbVL16qa3i+owQNN9jZLC0n01JkOMJxXCWv3i/
	FvdDcUrQNeUnJ+Difza2VSVWGRKY6MfK30NI9uPYtnLxB8ET1atCAlA50oJlQuTrIUxCuV5jXte9l
	/S3ppYVQh+bazqpAKmFiujzmbGM7DOL8gD4ZnCNSxodlvBVGz4R3j2YxmDvpEEA0rtVGFsYdOJunm
	dDmtvqq3cgZD/k4qJ/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXwl-0000000GBU8-1Z4D;
	Thu, 16 Jan 2025 22:02:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXwj-0000000GBTP-1H0F
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 22:02:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216634dd574so17323755ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737064956; x=1737669756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9HyN5fzzsxjX7rL5WN4+ekEIWemc4MJvOPgL3AWRJU=;
        b=lCrRD3h803HsYxCR2/kVBKAxRjsBtpDoucthcEtc/+Wv15+dvTyMsWJ0XS/4zMI9dS
         YHTNcqas8EGzfvFf8JqdEAdj8rqEi9SaiQXGkf6oowwop+oPKZlY0pDo2ge2Bo4VyflN
         zduw/93gal6uer7bKLgdLuNNH40rM3Hs4u+EQEs4sN2sTiuVjkPBsQhrGGzAbOTWg4wq
         PuPoIXQyLLBHAemP2bk6Usu6uBIhuZYJvRy/PotBPkhCf9EXI4YPE8zY4/+xdohKwbEl
         94JsRlsZnJaa8F1JIZqWRjG2ZXt7SQGWcJuBe38edP1n1EUtVhMJE0pe2wQbdgogwikB
         99SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737064956; x=1737669756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9HyN5fzzsxjX7rL5WN4+ekEIWemc4MJvOPgL3AWRJU=;
        b=E9BkoEYWaek8BmaWktpDPIZVhXqwGmHQ29LYe79sZVZZ43ISqgJ5LPKjO8hjciKG28
         U4X33+rB5UykMAaGMVHct4snMFlSndacUrAAX3YAmliuOqsxgaRygYDsZVaf+Yvutjzd
         xpcK72qFC1VrY/NfBvzSM3Rvfv8QZjTzp5zpTWvtFdBL+nf6W4eTQ8WTQukAUwlMxVPP
         8+sGKODxLeB0+UaeET3QXx+cbQUFX8J2koDnW1lbl4aJR783VOinIOs++IttAPsf2XzY
         5I6TnMNmTSkXgWqzbWbtUxfxBmQjb/U2i5caEiLrzdu+2Qe6lKqNYYsW1PwJjOloh2J/
         wcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfBKFGxt5J/Ut4Dvs6+C7f9ON4bGlMMz2njZhVJkECVzJHpcoYx06UOQlXrZCE8tfwX5jLrdz5cos6RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMIVG6zSY8dhnri45wF9/Y5pXOqUwv2WRQfcjHWXGyj+XZJD+l
	VpzqZiyIJ++qTfSIy5SMQKUi0t9aitaab03tye3n4xIUFh1fgYmTZmjFp7VHa+E=
X-Gm-Gg: ASbGncvRfFbKqp+3vGeW2LgQaQgTHsHDJzn3TyDmCED70Hx5gwJ158Vk4LY7LWFNwrR
	PbRAxxtbTnhy4192tbDHuRe/GsNn+5u0dOT0hQb4g2XrinLP6Tmphyegnrgxy7YXhT/LYB+mjhr
	QMebDci+N/BJ5A1cYSGo5nA3jN6ITlnqL3GAXLGw9OcrNdrj1N8rHcJr4cGjIB2P26/ek9RE9aA
	0VIDf9IIIpkNUTdwsobwhJM/BFP2x2esGpiIAB582luvms=
X-Google-Smtp-Source: AGHT+IFU/8awlpMa01JGFciAUeb1+31NMw3m/BNIqOBK6PrwzwYa7UYwhd6+mC4PgxTTkBxFrumquQ==
X-Received: by 2002:a05:6a20:8423:b0:1e1:aa24:2e58 with SMTP id adf61e73a8af0-1eb2145dc65mr527617637.7.1737064955823;
        Thu, 16 Jan 2025 14:02:35 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabace1bdsm488740b3a.171.2025.01.16.14.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 14:02:35 -0800 (PST)
Date: Thu, 16 Jan 2025 14:02:32 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Ron Economos <re@w6rz.net>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
Message-ID: <Z4mB-I5jeGithAQX@ghost>
References: <20250113155306.1922992-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_140237_343505_9EB51965 
X-CRM114-Status: GOOD (  24.45  )
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

On Mon, Jan 13, 2025 at 04:53:07PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
>   [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al
> 
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8
> 
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.
> 
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: Ron Economos <re@w6rz.net>
> Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> v3: put back missing 'endif' to fix the RISC-V build
> v2: add missing include of scripts/Makefile.lib
> 
>  arch/riscv/Makefile.postlink |  8 ++------
>  arch/s390/Makefile.postlink  |  6 +-----
>  arch/x86/Makefile.postlink   |  6 +-----
>  scripts/Makefile.lib         |  3 +++
>  4 files changed, 7 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> index 829b9abc91f6..750d2784f69e 100644
> --- a/arch/riscv/Makefile.postlink
> +++ b/arch/riscv/Makefile.postlink

When I compile x86 as relocatable I see the problem that you are fixing
here, but I don't see it on riscv. It's probably better to keep around
this code for riscv, but I don't think it even needs this stripping? I
am adding Alex since he added this for riscv.

Anyways this works as expected:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> @@ -10,6 +10,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  quiet_cmd_relocs_check = CHKREL  $@
>  cmd_relocs_check = 							\
> @@ -19,11 +20,6 @@ ifdef CONFIG_RELOCATABLE
>  quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
>  cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
>  
> -quiet_cmd_relocs_strip = STRIPREL $@
> -cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
> -                                --remove-section='.rel__*'      \
> -                                --remove-section='.rela.*'      \
> -                                --remove-section='.rela__*' $@
>  endif
>  
>  # `@true` prevents complaint when there is nothing to be done
> @@ -33,7 +27,7 @@ vmlinux: FORCE
>  ifdef CONFIG_RELOCATABLE
>  	$(call if_changed,relocs_check)
>  	$(call if_changed,cp_vmlinux_relocs)
> -	$(call if_changed,relocs_strip)
> +	$(call if_changed,strip_relocs)
>  endif
>  
>  clean:
> diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
> index df82f5410769..1ae5478cd6ac 100644
> --- a/arch/s390/Makefile.postlink
> +++ b/arch/s390/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  CMD_RELOCS=arch/s390/tools/relocs
>  OUT_RELOCS = arch/s390/boot
> @@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
>  	mkdir -p $(OUT_RELOCS); \
>  	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
>  
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>  vmlinux: FORCE
>  	$(call cmd,relocs)
>  	$(call cmd,strip_relocs)
> diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
> index fef2e977cc7d..8b8a68162c94 100644
> --- a/arch/x86/Makefile.postlink
> +++ b/arch/x86/Makefile.postlink
> @@ -11,6 +11,7 @@ __archpost:
>  
>  -include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.lib
>  
>  CMD_RELOCS = arch/x86/tools/relocs
>  OUT_RELOCS = arch/x86/boot/compressed
> @@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
>  	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
>  	$(CMD_RELOCS) --abs-relocs $@
>  
> -quiet_cmd_strip_relocs = RSTRIP  $@
> -      cmd_strip_relocs = \
> -	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
> -		   --remove-section='.rela.*' --remove-section='.rela__*' $@
> -
>  # `@true` prevents complaint when there is nothing to be done
>  
>  vmlinux: FORCE
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 7395200538da..f604f51d23ca 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  
> +quiet_cmd_strip_relocs = RSTRIP  $@
> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
> +
>  # Gzip
>  # ---------------------------------------------------------------------------
>  
> -- 
> 2.47.1.688.g23fc6f90ad-goog
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
