Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE5C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtFHSBeixwWe6EPklh5mB13074PMKDVUjfOnHTd2Pmo=; b=Rl9MznTYg8bHBs
	CGRPUlTJqM1s0b7+qOo4bjTQYNeD1uo28gDt4ty0k7YNz1WaLjP35XEDxu3PGVBNqkoeYVasOZ27+
	pAw5ROWklPtrYWlbt0AIBVi23Nz6gqyEoOudmc7VKkmaE9XfcuWdylwUWZwbkdSTSDB3FgBP6zkiq
	asZQkjgJrzn5wC+gpxosM2WWYNQqyU7s9eLoeiHIyPH2M7PW7ZoAhSqnrZ1kWmqHqJcvdBwiPFzju
	5GKIBqDU//56JUq86kQLq4MtMUVFUVShBWm635tP/s/Uyn7FAAcQSzq08+1mNcKmIS5LVXvJkrXA/
	Vj3Z9ZQwFzLb4Plor+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2GN-00GBTj-2u; Mon, 25 Jul 2022 17:53:03 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG2GK-00GBPb-5K
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 17:53:01 +0000
Received: by mail-lf1-x12b.google.com with SMTP id z25so19286347lfr.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FreRpovf0mVIW2Zhb1lvjjWuatAZVEz7BtIiXLJK1wI=;
        b=sCqJneU/e+EImVUW0AgfhNVAzLxTz3jjWXmAgQWpV5hwZVrpflAC2CzroKrLuu30jC
         6Dm2/C+sdg2h/STEztOeeNNuiIp9gCS2ZrJCO7hCrVgCac/MV8i4BxFFrFYccCFAf4F1
         R5/BFt0beMKeW3hR3zbEZn3QKUpOpigSIsdXW2E0RZeh2FRmUB7ddJiJQ4BTRqShxXOM
         ZjDu97T3QoAG4DqtR7AQVbFYdokNc45w94e0WkgBiFYVu/Uk4zOibF01fXFZviUxbe9F
         Rz9iTDBpxMXQt5QvLklABzx4ed5mn/hCkiFQFg4WEQIiknvpPfbWpPP6Wg4Q9XhyygfZ
         qZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FreRpovf0mVIW2Zhb1lvjjWuatAZVEz7BtIiXLJK1wI=;
        b=GxKcrqCaNjTB7uG3uFi4Pe7vcCrAGMe7uXIPzwLCd68soMizq8WVRYEukp8qzN/pfq
         4f28uRhw3WkhZEuzw71peFtnoq/AXBXPja9VA302yPuG1NHnvIsgKGcjBkRHlV4bazAY
         Kbr7H6Uvu+LYl1yerp2SNaauHVYIKB0IF4BZ5qQRzzGEetjXlBo4ORdrsuOBO8gvLOPC
         RYkLmERAE0k3+S6X8WPqj76XXfdSb/y88OFk9XLRVqwtFVWQI7OBPWK/XnOb/Xviw1aH
         j3Auz0qmPqV0YxYxnaGGnQ9BX4nhOp/Zjt89AFEoUxaHTCttzK/tYLO/i7UWD3zHScDk
         rakQ==
X-Gm-Message-State: AJIora8IczYTSHhr6gjr4yrKxe0jT77zUOexcyQY4JplBqn8L5NEBvFF
	aAif2sVS1KN5rpcI7dtmBoKNhX0hmwwG9cI0ST3b6Q==
X-Google-Smtp-Source: AGRyM1vI4nBqg+nOIN1K6S/SLeIGDe2Bxh+Byy0/zOW8Qb1y2+dATjUCbmWBwx7zJqp+xU/9MPLu9ZTAvX99MFB0yek=
X-Received: by 2002:ac2:44af:0:b0:48a:9e9f:74e5 with SMTP id
 c15-20020ac244af000000b0048a9e9f74e5mr94845lfm.100.1658771573140; Mon, 25 Jul
 2022 10:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220725021902.625630-1-masahiroy@kernel.org> <20220725021902.625630-2-masahiroy@kernel.org>
In-Reply-To: <20220725021902.625630-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Jul 2022 10:52:41 -0700
Message-ID: <CAKwvOdkWxZy-is5uxWEizgNM4UXB5E_=QSO3iEeVFdPFqv00EA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv/purgatory: Omit use of bin2c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	Borislav Petkov <bp@suse.de>, Helge Deller <deller@gmx.de>, Li Zhengyu <lizhengyu3@huawei.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_105300_231021_2B3E6FE4 
X-CRM114-Status: GOOD (  22.07  )
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

On Sun, Jul 24, 2022 at 7:22 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The .incbin assembler directive is much faster than bin2c + $(CC).
>
> Do similar refactoring as in commit 4c0f032d4963 ("s390/purgatory:
> Omit use of bin2c").
>
> Please note the .quad directive matches to size_t in C (both 8 byte)
> because the purgatory is compiled only for the 64-bit kernel.
> (KEXEC_FILE depends on 64BIT).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Seems fine.  Is the overall goal working towards removing scripts/bin2c?
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Fix a typo (kexec_purgatroy_end -> kexec_purgatory_end)
>
>  arch/riscv/Kconfig                     |  1 -
>  arch/riscv/purgatory/.gitignore        |  1 -
>  arch/riscv/purgatory/Makefile          |  8 +-------
>  arch/riscv/purgatory/kexec-purgatory.S | 14 ++++++++++++++
>  scripts/remove-stale-files             |  2 ++
>  5 files changed, 17 insertions(+), 9 deletions(-)
>  create mode 100644 arch/riscv/purgatory/kexec-purgatory.S
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 32ffef9f6e5b..218c2f12b3ef 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -447,7 +447,6 @@ config KEXEC_FILE
>
>  config ARCH_HAS_KEXEC_PURGATORY
>         def_bool KEXEC_FILE
> -       select BUILD_BIN2C
>         depends on CRYPTO=y
>         depends on CRYPTO_SHA256=y
>
> diff --git a/arch/riscv/purgatory/.gitignore b/arch/riscv/purgatory/.gitignore
> index 38d7d1bda4d7..6e4dfb024ad2 100644
> --- a/arch/riscv/purgatory/.gitignore
> +++ b/arch/riscv/purgatory/.gitignore
> @@ -1,4 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  purgatory.chk
>  purgatory.ro
> -kexec-purgatory.c
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index c2d14e2f345d..dd58e1d99397 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -84,12 +84,6 @@ $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
>  $(obj)/purgatory.chk: $(obj)/purgatory.ro FORCE
>                 $(call if_changed,ld)
>
> -targets += kexec-purgatory.c
> -
> -quiet_cmd_bin2c = BIN2C   $@
> -      cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
> -
> -$(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
> -       $(call if_changed,bin2c)
> +$(obj)/kexec-purgatory.o: $(obj)/purgatory.ro $(obj)/purgatory.chk
>
>  obj-y += kexec-purgatory.o
> diff --git a/arch/riscv/purgatory/kexec-purgatory.S b/arch/riscv/purgatory/kexec-purgatory.S
> new file mode 100644
> index 000000000000..32c53581b8f2
> --- /dev/null
> +++ b/arch/riscv/purgatory/kexec-purgatory.S
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +       .section .rodata, "a"
> +
> +       .align  8
> +kexec_purgatory:
> +       .globl  kexec_purgatory
> +       .incbin "arch/riscv/purgatory/purgatory.ro"
> +.Lkexec_purgatory_end:
> +
> +       .align  8
> +kexec_purgatory_size:
> +       .globl  kexec_purgatory_size
> +       .quad   .Lkexec_purgatory_end - kexec_purgatory
> diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
> index 7adab4618035..d75a52199a38 100755
> --- a/scripts/remove-stale-files
> +++ b/scripts/remove-stale-files
> @@ -40,4 +40,6 @@ if [ -n "${building_out_of_srctree}" ]; then
>         done
>  fi
>
> +rm -f arch/riscv/purgatory/kexec-purgatory.c
> +
>  rm -f scripts/extract-cert
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
