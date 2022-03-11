Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB93C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Mar 2022 02:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw5fFl4NLHT+ej/84VD8i/Ez1es91F0a2OJ/bXDogRQ=; b=l5r0RMIxmhJ9ji
	SxqMwM+Se/x+qRgwl6WUp4k4HzrGi7YIwCZhctPlnFlCJ59eKt7ykkGGnz9M27CeI6KvfIWyl61cd
	JUwvj65RdQ+ifEiKhRYd34Jn7axNmSIrHJbxnJ5RXPAHLkLGKP0Z3Qnhz8ykh2Kwy7aT5tzhdNzbD
	c6AF+z3jDDh0QLTufJ5u6sDA9k/Y+RnQDQJgpqfXw8PDmLzL/w9ZCE0svBQcHnYEgSCv/1QeI4QyI
	nSbdF5LmLza0JsxdR4qyIjvPJ8Zx4A4QEYptuNaFBzy1bhiryoJ6rDZcqx+JtXfR0w3rzKSwtqoZR
	jt4mh6KIbZzKFZIrqGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSVAq-00EmjD-U9; Fri, 11 Mar 2022 02:38:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSVAf-00EmgS-3B; Fri, 11 Mar 2022 02:38:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4C15B829B5;
 Fri, 11 Mar 2022 02:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C079FC340F9;
 Fri, 11 Mar 2022 02:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646966301;
 bh=Jl8zmUlue4qqSpvupSe770nwEDFbxuYU+7Bv15ArLNk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lSDH6JbZLjCrBKwhP5l06T0OkCO9oN/A8aEEjauCFSKrSGqZSLjhPkfyba8lYXT8b
 qYNbLTfBYoaFYS9/EdstBjbcmkW1UfcrGbXKAA3XzivX2N/X7M8/MG2dJGhgzUj1xe
 JwIgADZuHHJQV+vkPugE9tLJ05ZgR4K+s7Tqg3OYy0S0d/gkDWxZGRTQdcVyEyVTta
 XcdW+bJU/6F0zGvwFWhD4c7+eaOFthHqbXVWvY103F1BoVPLPmpdBFX9VrRB9dX0cQ
 RFdNXU0aoXtMTFwXmsyOd8jEdA/NcC/+rOGDrpxxb7LrGBkBTS5gvraGhc0yhF8ir3
 59IUblFQhb99Q==
Received: by mail-vs1-f43.google.com with SMTP id u82so8193324vsu.0;
 Thu, 10 Mar 2022 18:38:21 -0800 (PST)
X-Gm-Message-State: AOAM532r5GgooZIZtnVQzKVdGb7EdhZD6MpIk4w/6lz8g75yUY0D9B3l
 /A17J+FxRkS6JFWDmX6edorvaiCnF/V3IapwZ/Q=
X-Google-Smtp-Source: ABdhPJzYUvUjuAFq8XvtZ71Qsvionf8y5EprAZIyEokbvQbCG5RE3xULelpIsGE/d8q0ktAquLt4SKjjcxqaZOgU8Ls=
X-Received: by 2002:a05:6102:806:b0:31e:2206:f1c with SMTP id
 g6-20020a056102080600b0031e22060f1cmr3912870vsb.59.1646966300562; Thu, 10 Mar
 2022 18:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20220227162831.674483-1-guoren@kernel.org>
 <20220227162831.674483-14-guoren@kernel.org>
In-Reply-To: <20220227162831.674483-14-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Mar 2022 10:38:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
Message-ID: <CAJF2gTSJFMg1YJ=dbaNyemNV4sc_3P=+_PrS=RD_Y2_xz3TzPA@mail.gmail.com>
Subject: Re: [PATCH V7 13/20] riscv: compat: process: Add UXL_32 support in
 start_thread
To: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>, 
 Drew Fustini <drew@beagleboard.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_183825_432755_36B79C08 
X-CRM114-Status: GOOD (  19.66  )
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

Hi Arnd,

On Mon, Feb 28, 2022 at 12:30 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> If the current task is in COMPAT mode, set SR_UXL_32 in status for
> returning userspace. We need CONFIG _COMPAT to prevent compiling
> errors with rv32 defconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  arch/riscv/kernel/process.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 03ac3aa611f5..54787ca9806a 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -97,6 +97,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
>         }
>         regs->epc = pc;
>         regs->sp = sp;
> +
FIxup:

+ #ifdef CONFIG_COMPAT
> +       if (is_compat_task())
> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_32;
> +       else
> +               regs->status = (regs->status & ~SR_UXL) | SR_UXL_64;
+ #endif

We still need "#ifdef CONFIG_COMPAT" here, because for rv32 we can't
set SR_UXL at all. SR_UXL is BIT[32, 33].

>  }
>
>  void flush_thread(void)
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
