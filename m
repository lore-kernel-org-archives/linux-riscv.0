Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4229C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLTI4yVuFPvtNOY01GO3i9rJUorXQl3ua8emi45L8j4=; b=JT22YLJOn+FFuj
	Dc6+LUZi4CVw5LFzXbcZeCgG19JcSW+tfRvxzhqrK/Uk53tdJ1JhK3ga6LMo8Vi2uQZFLItbECFui
	eiy4BPY7RJURWcyyPwpwX0MwosvojnlDwhldasYFY667Dm3t3qCSU9UHAZTw7DUuYolWxX0LFAzf7
	U+9VR0QmkXJuCBm75rTBeMhUtZ9/m9bpfCdvgSEpa8qqTd8n6C7GiQ40xVttBs0VTTXxvtb8Ax2SU
	lH45Ivfj8VQm0rARfhLy3P0rqPYKfSwytjf011g5caTInFrNUbB+W8HISyOEvN3LNvv4JTzGMSIR8
	3crMp/cS8IrmxWbEaP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSO17-00DlpW-WD; Thu, 10 Mar 2022 19:00:06 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSO14-00Dloq-UQ
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 19:00:05 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvJo7-1oJWla24W1-00rHfE for <linux-riscv@lists.infradead.org>; Thu, 10
 Mar 2022 19:59:59 +0100
Received: by mail-wr1-f44.google.com with SMTP id q14so9474019wrc.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Mar 2022 10:59:59 -0800 (PST)
X-Gm-Message-State: AOAM530kVRAIcHidlvD6sQGP/Pb+lJBEl2eL1FNNRVy2xis1G6F+cBc8
 7bUgm62MEiCOYzvU6noxjGWTqF2OUhJf+Y+NZlU=
X-Google-Smtp-Source: ABdhPJxh5kzO7+X7Vulcp10MK8TD08/mOPwAsExT9yMBy8UwuYQtg/z/TIajyux1R/KV23QdMmF2QvZcOqDpSmj7JN8=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr4862760wrh.407.1646938798999; Thu, 10
 Mar 2022 10:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20220310170845.17614-1-palmer@rivosinc.com>
In-Reply-To: <20220310170845.17614-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 10 Mar 2022 19:59:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0gqTNX7zNneE6NX1aXvnO77oY2nYyGK4KbwEYdFS8F9Q@mail.gmail.com>
Message-ID: <CAK8P3a0gqTNX7zNneE6NX1aXvnO77oY2nYyGK4KbwEYdFS8F9Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_{NON,}PORTABLE
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:pAqWAQSL2vYPTfZxv2PHpNPMhRyHgfG8YTr8q2e3aAUcjWbvTwj
 hHueZC9++OmsZ31mKgzONhB8+2jWKIwpUOLBGyhMtXO4hKm4Tz+bHADIDtpPqaxHAJdyi1U
 Q2Hc71evEL7d7InJJvPS0MPuKmGZWQfCSX5UVAHlEi0VGDeQawJ/hiAhbU/jrfgT6+OoYaX
 UwQ/ZLvSDq4hl3v0JQQfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HCMVXU6zPno=:cOTPwYsnymlRnUYN8qtfMN
 hFrBssVpRu6KbvE21kniQJUduWGOZswhx+i/6oXYj95iCHivKmPxkoOLAsg0D8SA2Ta5m6gDH
 WXopagNER22SNxcvmWvYQg8+aApp8jPdY2gvBpjhn7a47YlmaaZ0e6yY+TIWFZKiGHPH0umYG
 j7hQBhi+0SCTChFsqJAZApTXkQ8ByfN8u+N2Bl6vuwwLcUOpuZPqAMEmGG9G8QPfmoXvkoyWb
 Xj4NHtBqV1U6g6rkwjvMTGIYUzCjzYIQOjDMa60op3ApgZY72A6bWmH2m/geMKoRhZwWNV/SY
 UQQBGHo0NYegUOcQysumoOQYlyAKgP7s4oaW+a7yeaaFgKdqTYY5SUpFLtX2kaNao7sxUqTVa
 agSqBEJBGwRhQvPEaomOu7qVWFoiL384kftPe/ueDTN0baajlAoZVcr0jjbv9KSV560BdNXvA
 3m6DQQAzOkqxSwhwGMlSP49wBhkaoKb8Aevtecs7cZ7+u3c7PPsuRvzSOfspklIngp6Sessvj
 udZ7Ewtn+0g6m85SfrPVssLNZzdJci6SQ9qrh+FECqJenQHapswzUbPzCIoFLDh1PEys5Evqx
 CZN+Vakn/tGRHc3EMoCXukFvFakGQ3lNLhUN06FKN7Gi1ND830e8gC/aWvVWeq/z84c4wJlKf
 oeoveW3nqyIrVPIlt/gy3EKroHygt/a47dOIA+ebBEm3Wa0CTQrPegQkws5Pwydj/kuk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_110003_311625_69C389CF 
X-CRM114-Status: GOOD (  49.81  )
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

On Thu, Mar 10, 2022 at 6:08 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The RISC-V port has collected a handful of options that are
> fundamentally non-portable.  To prevent users from shooting themselves
> in the foot, hide them all behind a config entry that explicitly calls
> out that non-portable binaries may be produced.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> ---
> This came up in the context of the no-M patch:
> https://lore.kernel.org/lkml/CAK8P3a3mzax-OiaxBcxM_RgKNsd6N8HW0odRmw38u2jKE5aYaQ@mail.gmail.com/
>
> I'm not sure I strictly need both PORTABLE and NONPORTABLE, but it's the
> only way I could come up with to force things like EFI.  I'll poke
> around Kconfig a bit more, but I figured this is going to lead to a
> discussion so it'd be better to just send this crusty version so we at
> least have something concrete to talk about.
>
> I've only given this a smoke test (ie, defconfig looks OK).  I'll go
> through all the configs if folks think this is the right way to go -- I
> figure it's better to have the discussion on a more focused patch than
> on that M patch, as this is really an orthogonal issue.
>
> I'm not really sure what the right option is here: I'm not selecting
> things like errata and basic drivers, but I could buy the argument that
> disabling those results in non-portable systems.  I am selecting EFI,
> that might not be strictly required now but it's the direction we're
> going so I figure we might as well start now.  I've also hidden 32BIT
> behind this, I could see that going either way but my guess is that
> users of 32-bit systems won't care about portable binaries.

These are all things I would have suggested as well, sounds good.

>  I'm also
> not sure if this should be tied to something like EMBEDDED or EXPERT.

CONFIG_EMBEDDED is weird, it's better to avoid interacting with
it, because it tends to not do what one expects. Hiding it behind
CONFIG_EXPERT would make sense, but it's also a rather strong
guard, so it's probably better to leave it the way you have it.

> My biggest worry with this is that users might get the feeling that
> current kernels will be compatible with new hardware, that's just not
> how RISC-V works.  I tried to write the help text indicating that, I'm
> not sure I like how it reads so I'll almost certainly take another shot
> at it (though suggestions are, of course, welcome).
>
> I'm also a bit worried that vendors might get the feeling we're not
> going to support systems that need modifications to these portablity
> requirements.  That's also not the case, as there's really no way for
> vendors to make sure their systems continue to run portable kernels
> aside from just releasing them publicly so we can test them.
> ---
>  arch/riscv/Kconfig | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 5adcbd9b5e88..de0916d7aca7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -9,6 +9,7 @@ config 64BIT
>
>  config 32BIT
>         bool
> +       depends on NONPORTABLE

This 'depends on is in the wrong place, you need to move it below
ARCH_RV32I, or possibly rework that "Base ISA" choice statement
into something else.

>  config RISCV
>         def_bool y
> @@ -485,6 +486,7 @@ config STACKPROTECTOR_PER_TASK
>
>  config PHYS_RAM_BASE_FIXED
>         bool "Explicitly specified physical RAM address"
> +       depends on NONPORTABLE
>         default n
>
>  config PHYS_RAM_BASE
> @@ -498,7 +500,7 @@ config PHYS_RAM_BASE
>
>  config XIP_KERNEL
>         bool "Kernel Execute-In-Place from ROM"
> -       depends on MMU && SPARSEMEM
> +       depends on MMU && SPARSEMEM && NONPORTABLE
>         # This prevents XIP from being enabled by all{yes,mod}config, which
>         # fail to build since XIP doesn't support large kernels.
>         depends on !COMPILE_TEST
> @@ -538,9 +540,31 @@ endmenu
>
>  config BUILTIN_DTB
>         bool
> -       depends on OF
> +       depends on OF && NONPORTABLE
>         default y if XIP_KERNEL
>
> +config NONPORTABLE
> +       bool "Allow configurations that result in non-portable kernels"
> +       help
> +         RISC-V kernel binaries are compatibile between all known systems

typo: compatible

> +         whenever possible, but there are some use cases that can only be
> +         satisfied by configurations that result in kernel binaries that are
> +         not portable between systems.
> +
> +         Selecting N does not guarntee kernels will be portable to all knows

typo: guarantee

> +         systems.  Selecting any of the options guarded by NONPORTABLE will
> +         result in kernel binaries that are unlikely to be portable between
> +         systems.
> +
> +         If unsure, say N.
> +
> +config PORTABLE
> +       bool
> +       default !NONPORTABLE
> +       select EFI
> +       select OF
> +       select MMU

A nice trick I would use here is to make PORTABLE/NONPORTABLE
into a 'choice' statement that defaults to PORTABLE. That way, both
allnoconfig and allmodconfig/allyesconfig end up testing the portable case.

Ideally both allnoconfig and allmodconfig would be able to boot the
same (virtual) machine, but getting to that point likely requires addressing
further issues.

If someone can come up with a better naming system, the
portable/nonportable choice could even be integrated into the
"Base ISA" choice, giving the user a list of the possible targets,
like:

choice
      prompt "System type"
      default ARCH_RV64I

config ARCH_RV64I
       bool "Generic portable RV64GC system"
       select 64BIT
       select EFI
       select OF
       select MMU

config ARCH_RV64I_NONPORTABLE
        bool "Custom RV64I machine, nonportable"
        select 64BIT
        select MMU

config ARCH_RV32I_NONPORTABLE
        bool "Custom RV64I machine, nonportable"
        select 64BIT
        select MMU

config ARCH_RV64_NOMMU
        bool "Custom RV64I machine without MMU"
        select 64BIT

endchoice

Not sure if that is more or less confusing than what you have
here, just putting it out there as another way to handle the
top-level platform selection.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
