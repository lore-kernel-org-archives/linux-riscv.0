Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGc5ScotY3UScD5gcA0k9UaOjR1+P9aFfNkVTmehG08=; b=RCqyXTenLZSM+w
	PATLtun7nRiGG3QDjd5/z5cTPgkMCyVAtBBY1/e3yl9XJ7UJzndPQ2BzX0NE8Yj4yIvUBJ76182km
	u4liFiS0NGyyhdgryPU0SJpXtKxS0PjzvgYV7MUBxnuVYROhfH8bcIanIdK1kJGw7aUufYghb2mQt
	Glguj99WR/piUqi9VOl257scM2w+ziKvlfhGR2ZBu47yG6A4/Tq2254Nn6qicXRLj92/WL6blXbFB
	tb3sC1y762aeJk6veX+CU+ueZSVfcw33lVk7DBz95dYNSE27aZNjzG5s6x8bc386eoRWG2MaPbX8x
	3ciHeYnn6ZF+qV5bOCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUd9-006Gwt-OJ; Mon, 16 May 2022 06:54:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUd5-006Guj-Vg
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:54:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 981D1B80B55
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9A8C36AE7
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652684092;
 bh=Z7r8/HgEaFRztMM+sEwTZMelcIhQM0l1vKVED8bIwDE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jfSDwH9PRKVd+X7+E3oComxtk84NNEfaY8cvJbqa0z1bZweoT+5NyWHLBNI+rhNLQ
 EAohJXf+y0hqJxsV59c3kcuyiGAnEVaItACirMN15wfB2+Q5AztEuJ12rUqhcnlYtk
 H3+G1uVDNzL9BlvWBS/YkOW4uj5pkJ/iMW1NMrEvDkWS0OyXWnP27ZMOi6GPI9JjFT
 12yG+QLqA1Eq9VL7Blqy+q9SGWOzuSBu6wxlFbUFWZT3Tq/T2+smLjTHRnN2rdggFW
 y57Aqk3Y0b4sDQ+uFgMZk7+E6gwv+G1aG11S44HrkJvKnjzjReUPpI30UNdJg6jWfm
 FfbHlujkbtNRg==
Received: by mail-vk1-f172.google.com with SMTP id e144so7027556vke.9
 for <linux-riscv@lists.infradead.org>; Sun, 15 May 2022 23:54:52 -0700 (PDT)
X-Gm-Message-State: AOAM530RcWFKSShNTknTr435Pcci5lbO0pgFYpTmj4eifWQKYhS2xhs8
 ArcSz/tPkj8Ovqf1XpZEIrT8QqVJb4236SjSOqQ=
X-Google-Smtp-Source: ABdhPJxK0jUxDo38IFCo+aamIzqLft2o8K1gPTVfOz01KxbCLrQyt4VVgntdfLWqMm4oTyLLN9iddI9RyiBviarw7sU=
X-Received: by 2002:a1f:1856:0:b0:34e:be86:97b4 with SMTP id
 83-20020a1f1856000000b0034ebe8697b4mr5612859vky.8.1652684091532; Sun, 15 May
 2022 23:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-5-heiko@sntech.de>
In-Reply-To: <20220511192921.2223629-5-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 16 May 2022 14:54:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS9_s9DFpbKJA3pDepK76TUNNp35_1ZUb+4wFwQZpFKwQ@mail.gmail.com>
Message-ID: <CAJF2gTS9_s9DFpbKJA3pDepK76TUNNp35_1ZUb+4wFwQZpFKwQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] riscv: implement ALTERNATIVE_2 macro
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
X-CRM114-CacheID: sfid-20220515_235456_363691_1D981E64 
X-CRM114-Status: GOOD (  20.32  )
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
> When the alternatives were added the commit already provided a template
> on how to implement 2 different alternatives for one piece of code.
>
> Make this usable.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 78 +++++++++++++++------
>  1 file changed, 58 insertions(+), 20 deletions(-)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 5dd8d03a13da..9e04cd53afc8 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -39,6 +39,24 @@
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
>         __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
>
> +.macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> +                                 new_c_2, vendor_id_2, errata_id_2, enable_2
> +886 :
> +       \old_c
> +887 :
> +       ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> +       ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> +.endm
> +
> +#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       CONFIG_k_1,                     \
> +                                 new_c_2, vendor_id_2, errata_id_2,    \
> +                                       CONFIG_k_2)                     \
> +       __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       IS_ENABLED(CONFIG_k_1),         \
> +                                  new_c_2, vendor_id_2, errata_id_2,   \
> +                                       IS_ENABLED(CONFIG_k_2)
> +
>  #else /* !__ASSEMBLY__ */
>
>  #include <asm/asm.h>
> @@ -74,6 +92,25 @@
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
>         __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
>
> +#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,  \
> +                                       enable_1,                       \
> +                                  new_c_2, vendor_id_2, errata_id_2,   \
> +                                       enable_2)                       \
> +       "886 :\n"                                                       \
> +       old_c "\n"                                                      \
> +       "887 :\n"                                                       \
> +       ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)    \
> +       ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
> +
> +#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       CONFIG_k_1,                     \
> +                                 new_c_2, vendor_id_2, errata_id_2,    \
> +                                       CONFIG_k_2)                     \
> +       __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       IS_ENABLED(CONFIG_k_1),         \
> +                                  new_c_2, vendor_id_2, errata_id_2,   \
> +                                       IS_ENABLED(CONFIG_k_2))
> +
>  #endif /* __ASSEMBLY__ */
>
>  #else /* CONFIG_RISCV_ALTERNATIVE */
> @@ -86,6 +123,12 @@
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
>         __ALTERNATIVE_CFG old_c
>
> +#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       CONFIG_k_1,                     \
> +                                 new_c_2, vendor_id_2, errata_id_2,    \
> +                                       CONFIG_k_2)                     \
> +       __ALTERNATIVE_CFG old_c
> +
>  #else /* !__ASSEMBLY__ */
>
>  #define __ALTERNATIVE_CFG(old_c)  \
> @@ -94,6 +137,12 @@
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
>         __ALTERNATIVE_CFG(old_c)
>
> +#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,   \
> +                                       CONFIG_k_1,                     \
> +                                 new_c_2, vendor_id_2, errata_id_2,    \
> +                                       CONFIG_k_2) \
> +       __ALTERNATIVE_CFG(old_c)
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* CONFIG_RISCV_ALTERNATIVE */
>
> @@ -119,25 +168,14 @@
>   * this case, this vendor can create a new macro ALTERNATIVE_2() based
>   * on the following sample code and then replace ALTERNATIVE() with
>   * ALTERNATIVE_2() to append its customized content.
> - *
> - * .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> - *                                   new_c_2, vendor_id_2, errata_id_2, enable_2
> - * 886 :
> - *      \old_c
> - * 887 :
> - *      ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> - *      ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> - * .endm
> - *
> - * #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> - *                                   new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
> - *        __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1), \
> - *                                   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2) \
> - *
> - * #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> - *                                    new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2) \
> - *         _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1, \
> - *                                         new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
> - *
>   */
> +#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1,         \
> +                                       errata_id_1, CONFIG_k_1,        \
> +                                  new_content_2, vendor_id_2,          \
> +                                       errata_id_2, CONFIG_k_2)        \
> +       _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1,     \
> +                                           errata_id_1, CONFIG_k_1,    \
> +                                       new_content_2, vendor_id_2,     \
> +                                           errata_id_2, CONFIG_k_2)
> +
>  #endif
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
