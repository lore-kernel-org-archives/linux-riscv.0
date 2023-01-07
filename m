Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AACC54EBD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 03:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WslJqhSUHM1NHS3/+5yS6k5apgOvoL9lPYn40yn350Q=; b=K5er3rbw6e18Y3
	bpkH/cHXBIg7+x48jl6Qa6HqLw0lALD7QQ52I87i5IOuDc7ipt9T0QWS7jjwGvgOrBzkTs79mXk2w
	h8eHMfvqjtU/23/tc6kjjf1nrbQcyhcd1oSVVAt28lkMO6mtKSSpfU9Q24c27BnXgA/gmDDstX0/6
	KVS6QiOWFY/1u357iUPZImYAGvbOUwS2InR96q4xVmf1bTcxQruBbW9vnoamNGbvtrIoT3u0BUvNi
	8etOLgXTDo8AtZ0LtxE3IlNbYSDdBPSY9fH7O9RX4jTexTll7MRwIKsFsOR/4vTNThT1LT5MHQFJo
	6/oDTz7wk1xKxYkv24qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDzeP-00H957-IE; Sat, 07 Jan 2023 03:13:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDzeM-00H92y-KA
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 03:13:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9FC03B81F48
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 03:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C77C433F2
	for <linux-riscv@lists.infradead.org>; Sat,  7 Jan 2023 03:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673061214;
	bh=kHYtHRHGn7twJkIe2cynHtKyyDevJdUo628b3VfPG1s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cPmrnN9wGzbPkN/CM+lMFG7sPDzhiqyKzxMruys0bSUzFKBJvVtE5oFiOBatjp4Dl
	 1UeBBKuIo9qH4RzKHPrJBcfpo+rHTv+yojN2/968kn0V6bMocH68yIs6mrfmAMeZuv
	 G91k139rNbglkfx6LMAbFUS38pTM1lvl0TX59a9Ts1Lp+H6p0eGIkNaZLvHAHgwWRl
	 uHp2K1fCE4qdA8LtmrZi3kQ9kAYv4V/EM9tzuei2z0jGpWEeRfn9VE+AfUAyluK9dw
	 QRVaDS3mou75SSCV5Z7P0YuYfGI5BT3nt+kiLLoxSIahAHbTKFyoVnXfuYAwPnDCBL
	 ml2W4O75n6gEg==
Received: by mail-ed1-f49.google.com with SMTP id v10so3491880edi.8
        for <linux-riscv@lists.infradead.org>; Fri, 06 Jan 2023 19:13:34 -0800 (PST)
X-Gm-Message-State: AFqh2kpmcUFJ8s6J/+m2pAtTCAXzH3aT2SqtbtFh857XeFp1gCbepCA0
	9zbPlQufRhKO9/BzQ6gKAIEvu2BJ9vjDvsZHrAg=
X-Google-Smtp-Source: AMrXdXtTiVczT8IADpqw8kgoiJmJBEiH9C7QTwy2SBSC8cHolHS29dg6CbH0/ykUXzVuTBb1ZIwVbtyslDTt4QC7QP4=
X-Received: by 2002:aa7:dc05:0:b0:47f:b4f3:6dc3 with SMTP id
 b5-20020aa7dc05000000b0047fb4f36dc3mr5147537edu.340.1673061212566; Fri, 06
 Jan 2023 19:13:32 -0800 (PST)
MIME-Version: 1.0
References: <20230106161213.2374093-1-masahiroy@kernel.org>
In-Reply-To: <20230106161213.2374093-1-masahiroy@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 7 Jan 2023 11:13:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRor=2FwY2ZesZribpSQkneh8OYMph7unP6_toa2k=S2g@mail.gmail.com>
Message-ID: <CAJF2gTRor=2FwY2ZesZribpSQkneh8OYMph7unP6_toa2k=S2g@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Myrtle Shah <gatecat@ds0.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_191338_865664_9EAAF698 
X-CRM114-Status: GOOD (  16.45  )
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

On Sat, Jan 7, 2023 at 12:12 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 80b6093b55e3 ("kbuild: add -Wundef to KBUILD_CPPFLAGS
> for W=1 builds"), building with W=1 detects misuse of #if.
>
>   $ make W=1 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- arch/riscv/kernel/
>     [snip]
>     AS      arch/riscv/kernel/head.o
>   arch/riscv/kernel/head.S:329:5: warning: "CONFIG_RISCV_BOOT_SPINWAIT" is not defined, evaluates to 0 [-Wundef]
>     329 | #if CONFIG_RISCV_BOOT_SPINWAIT
>         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> CONFIG_RISCV_BOOT_SPINWAIT is a bool option. #ifdef should be used.
Fixes: 2ffc48fc7071 ("RISC-V: Move spinwait booting method to its own config")

Right?

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/kernel/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index b865046e4dbb..4bf6c449d78b 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -326,7 +326,7 @@ clear_bss_done:
>         call soc_early_init
>         tail start_kernel
>
> -#if CONFIG_RISCV_BOOT_SPINWAIT
> +#ifdef CONFIG_RISCV_BOOT_SPINWAIT
>  .Lsecondary_start:
>         /* Set trap vector to spin forever to help debug */
>         la a3, .Lsecondary_park
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
