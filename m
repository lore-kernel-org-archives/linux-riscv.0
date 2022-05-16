Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A0CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOn6EnlwUggHC6YVNKVmRO0gMxozVTcWkZD5UCQWqyA=; b=M5NYDS8PTSFkK8
	QP1hLkN2AtSDXDVp9HP4QE9UBuMvUnHriIf4fIaEQ/W0bn+XqI6bXxuEinszZmB13fpGoQkzUC43H
	s32co0HKysPT4bH9xmRid2T97E2oVowkoB1M1Lp+tEt70N69sUEsVQOAsMp6nKEYWEKfYbKnbUSwP
	DelNJSJepJqKMvKznNtXOQpyv7RZz0NueGdNWhMoOIHUxhpyBTpb+6Dmi9RfdHaW5DdoAS/Q8BdFR
	8ScoAaeYdECWDnAlVtZ1eXMBvMkXbzJed1g6Eu50JD8XXwAzhOONAeHZmYUMrYALKFgDWRjGKqdKe
	LAkBNeH/OnkZQWyb0yGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUdS-006H5n-5g; Mon, 16 May 2022 06:55:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUdO-006H3K-Dx
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:55:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C26DD60FDF
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9F5C36AE7
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652684112;
 bh=wiA8FGI75YrhJytAH6LfccFoNYeTu2gqXP2d9q68wmE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QBcl4ClJ6DSsqgG12TPkgIFLpZdex++xIZWM/ijBVeyIPLm7SFadVpGwPs6jFVfwS
 f+K1Qe3VdyFNR+1ajdzAmUmUJ3rhTV67Wk16lBjlTGu/ichk+GFD3Yv48lDvDT0ncD
 dewzk5kehdxZa3Gk9WEB0NIwks73bRUkPSArzey4aW/ZM/MHqlGwQcJHNPq3JBTEEh
 edMNohwGZeiaynqVgSqz30fjAb5VYdtOP3jw8XONk9XiAWr0A/yxBgfRbB7TrHMhxf
 hy6SVauBONMj33MHJtv8NIHf2+GKhZZKWi6myEWcQAgNkN3m6x+m5CbwG9H/nEwxvX
 uh6eKoA4os53Q==
Received: by mail-vs1-f47.google.com with SMTP id a127so14528420vsa.3
 for <linux-riscv@lists.infradead.org>; Sun, 15 May 2022 23:55:12 -0700 (PDT)
X-Gm-Message-State: AOAM531Yr3CndeKrP4GfXrMWYwBDRFUTRLuD+14zHm/5lpCz5fLLdi4X
 yLvgqcZ4z5H9GxVozI+stfPU4SMnD4MU6z6piMY=
X-Google-Smtp-Source: ABdhPJxqZd+B6RKf18XydNXla4kQ0DeUyoAzG1PpmIb+sedlMpCmC9EXBvzh4A5Oqa7KT0dW2lW6LBCsjdOZBV2BUBo=
X-Received: by 2002:a05:6102:390b:b0:32d:5fc3:bd2c with SMTP id
 e11-20020a056102390b00b0032d5fc3bd2cmr5079622vsu.51.1652684111598; Sun, 15
 May 2022 23:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-6-heiko@sntech.de>
In-Reply-To: <20220511192921.2223629-6-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 16 May 2022 14:55:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR7WXDNfvxYaSsTaqjinyRBfQsfz+C7HvtKh4qyviFf6w@mail.gmail.com>
Message-ID: <CAJF2gTR7WXDNfvxYaSsTaqjinyRBfQsfz+C7HvtKh4qyviFf6w@mail.gmail.com>
Subject: Re: [PATCH 05/12] riscv: extend concatenated alternatives-lines to
 the same length
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 liush <liush@allwinnertech.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_235514_664488_C051DAE0 
X-CRM114-Status: GOOD (  17.76  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, May 12, 2022 at 3:29 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> ALT_NEW_CONTENT already uses same-length assembler lines, so
> extend this to the other elements as well.
>
> This makes it more readable when these elements need to be extended
> in the future.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 9e04cd53afc8..8c2bbc7bbe50 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -62,14 +62,14 @@
>  #include <asm/asm.h>
>  #include <linux/stringify.h>
>
> -#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen) \
> -       RISCV_PTR " " oldptr "\n" \
> -       RISCV_PTR " " newptr "\n" \
> -       REG_ASM " " vendor_id "\n" \
> -       REG_ASM " " newlen "\n" \
> +#define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)                \
> +       RISCV_PTR " " oldptr "\n"                                       \
> +       RISCV_PTR " " newptr "\n"                                       \
> +       REG_ASM " " vendor_id "\n"                                      \
> +       REG_ASM " " newlen "\n"                                         \
>         ".word " errata_id "\n"
>
> -#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c) \
> +#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)           \
>         ".if " __stringify(enable) " == 1\n"                            \
>         ".pushsection .alternative, \"a\"\n"                            \
>         ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
> @@ -83,10 +83,10 @@
>         ".org   . - (889b - 888b) + (887b - 886b)\n"                    \
>         ".endif\n"
>
> -#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable) \
> -       "886 :\n"       \
> -       old_c "\n"      \
> -       "887 :\n"       \
> +#define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)  \
> +       "886 :\n"                                                       \
> +       old_c "\n"                                                      \
> +       "887 :\n"                                                       \
>         ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
