Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF139C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mggS5iWovXxG/4evYMtOhfUjepE+HOdbBgZeRV6smPI=; b=Z1pnQ9AnrSwAEExcAUbW5sRPZc
	vvB3hr1PoKoxQbJ5JMp7Q9V6wbQvDNcGgQlUgNOdb3wMoTurlvQB4S3rzxo6TzyV+w6zSrpdJWImF
	xC15iRzd2sKfAmpKTw5jyTojtLgyAZ73yBcKkvcs4b2DFUwirNa73Npwj+AVottGNrC8QtfKkSPSg
	wj6YluSF0PMwAyfY/+/yMvb/NZzRRQxvVfYloU5tsbtPiT183JyjTDDlEST44gD5oL6WPj9MQuACc
	13OtEu858eA/6JZGJgH2VKy1ndIgMRnDt76YEnnDvtZ6DNNCAzoCrhHs+xb40RAkKt/tDC5XoNbTT
	t2G4A4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvhK-00HQko-6v; Thu, 29 Dec 2022 16:24:03 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfq-00HPzT-Ec
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 16:22:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id d10so12644051pgm.13
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 08:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGyrD0+PhkAL5dbAeObFs9RwoqBo5ONG0NwovuaDsrM=;
        b=dahVygbdXamhJiKEgN7Jyg1lXYgvfTSo1DMUkYl6yXrdIMvfnyRS0HpjAJGhYD3IFg
         E+JY0GnUUwwkM2h9ox2Zgy/UxJJ4gx7kMRbUi8BoQs1MkH7ANMKs27AnO7PEO784TqXp
         ruuAqGepnkn93qVt3OFjdbG1AsqdvffnpusA3lSTC6zFKd8HiqB0qYg9fELjUJN4UbO/
         3lnm7IU3UfXKaT3AUgnmQMHaYpOZ2VZND7TcbraC5FIjkTHVAEIVzHPRo5TQwNIMJbMP
         q3kZJpTtujX11O+tGSd8oHpehkbK7CbScXp9TvIT0cj2FcWn3tOzaHwI3gNMSd/9wBDx
         rNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGyrD0+PhkAL5dbAeObFs9RwoqBo5ONG0NwovuaDsrM=;
        b=H4NMDccjhHhX0750y6WFAZkOOTzY4Sc0JqPaQEmzwFYnj8/RAub5T8HJspAU9QGhbU
         HrMfR5fz2+1HVC7MWDuZp4vy+fceDiA8Fz1HOCodJ8GhPW9VO0scr2m34VBlqw9ftA0j
         IT22lPsnymaP76GI95fmhmr3jN82h7sYjiwQO7gjDnKrEFp3SixXTRwI5n5DNERjZkLG
         eeIgPRDwHLKpgcSCRVGDLylX3KvUr7i1UKfjgyf1ejimsO+ckoS3hJphRVMDX9R/tTx4
         XtpKGd3sZ1uff0xRpHAr9hO9YsSU91ea2MQdVGMfpqODflFWtzsRWAfcnAwJB1vVJMdH
         s9xw==
X-Gm-Message-State: AFqh2krLUY8+tfUw609Y8W+N8juEUcUNdu7EtUd+Z1mpoBAZSR8vpw5w
	iyX3eRPL2nDF2LKQOboo90eGnA==
X-Google-Smtp-Source: AMrXdXvpdMbR8CMYmi4dUk/9PgGNumQG+p4T2pa56FD3JYpViB2+8Ov5fWBEh9VYECa0d3vj+bwoEw==
X-Received: by 2002:aa7:99cb:0:b0:580:d188:f516 with SMTP id v11-20020aa799cb000000b00580d188f516mr22924872pfi.19.1672330945228;
        Thu, 29 Dec 2022 08:22:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id x185-20020a6286c2000000b0056bfebfa6e4sm12277463pfd.190.2022.12.29.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:24 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:24 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:53:04 PST (-0800)
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
In-Reply-To: <20221221235147.45lkqmosndritfpe@google.com>
CC: christophe.leroy@csgroup.eu, luto@kernel.org, tglx@linutronix.de,
  vincenzo.frascino@arm.com, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
  linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com
Message-ID: <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082230_653054_182284A0 
X-CRM114-Status: GOOD (  21.84  )
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

On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> The actual intention is that no dynamic relocation exists. However, some
> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> relocations. E.g. ld's powerpc port recently fixed
> https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> generally no-op in the dynamic loaders. So just ignore them.
>
> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> not called "absolute relocations". (The patch is motivated by the arm64
> port missing R_AARCH64_RELATIVE.)
>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Change from v1:
> * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
> * change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
> ---
>   arch/arm/vdso/Makefile            |  3 ---
>   arch/arm64/kernel/vdso/Makefile   |  3 ---
>   arch/arm64/kernel/vdso32/Makefile |  3 ---
>   arch/csky/kernel/vdso/Makefile    |  3 ---
>   arch/loongarch/vdso/Makefile      |  3 ---
>   arch/mips/vdso/Makefile           |  3 ---
>   arch/powerpc/kernel/vdso/Makefile |  1 -
>   arch/riscv/kernel/vdso/Makefile   |  3 ---
>   arch/s390/kernel/vdso32/Makefile  |  2 --
>   arch/s390/kernel/vdso64/Makefile  |  2 --
>   arch/x86/entry/vdso/Makefile      |  4 ----
>   lib/vdso/Makefile                 | 13 ++++---------
>   12 files changed, 4 insertions(+), 39 deletions(-)

[snip]

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 06e6b27f3bcc..d85c37e11b21 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -1,9 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   # Copied from arch/tile/kernel/vdso/Makefile
>
> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> -# the inclusion of generic Makefile.
> -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
>   include $(srctree)/lib/vdso/Makefile
>   # Symbols present in the vdso
>   vdso-syms  = rt_sigreturn

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
