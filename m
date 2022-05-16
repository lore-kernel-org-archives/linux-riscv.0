Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D690AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mh/UMuvbeS4FTFOVhUHcRGXtnKGUQnzKnM0wqsq7Ec8=; b=Lt2yqb+zq0Jhlo
	MD56F6p3OBzgAOZTWlKLizh4dFin+G7YuGWKCKprpE84IFtZLU3FZryr5qbx55AalIai2WeZQtqSs
	/Y/y2NtOHxUoS0Z4jtykLIMHg3ThQRse8Bf4Nss2CLRrHyMpZ+sEzkA2QT6SNvG8VC/vXUhGadSfz
	kfrjMToKQXzPDss5vOEgNJaIo4+Xvs1xQ7Ib4ApzgaMBSSrrfU0vtaAcL4dk81jnrQrwWvV8/pP9u
	7ooEbrXvoew11j9IB1/Q5QU1aQwk9ByRU5fqkRWG11RWcCE38e0uQ7JG7ofP/NubfIzRd5irisUdP
	3eseuq6ymD6JqrPpayGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqUdq-006HH8-HP; Mon, 16 May 2022 06:55:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqUdn-006HFd-5y
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:55:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A40360FFC
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB31DC3411C
 for <linux-riscv@lists.infradead.org>; Mon, 16 May 2022 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652684136;
 bh=VqIRCv2LMNB0QFdFUt96jLC25HR73ExKxi3u86pjpWE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Qru5duK8wRBYYrhrERVxr3VWex79J7Nw+63a7Aegi/amXc63tnm9Lnl4KH2VR3bjy
 WezbNMt1G3ZeDuJeUN2+cOU0TL/R6HOlmcxTmaym2uH5d7nEqmiFuLFs5R3zYD/ZHC
 qZBuX6hY8fYIHQ2h+E7Bam7Cbg+2mbGDswRhsloejAvGDtm1Ijkmni3pjg+Ejekgoh
 hhICXed1kIIujYIoqSN/DUaKtjlPo3QfCY6kKbQFiULvN8A4M3LIahmO7LwyjUB9U4
 qHCVxD0kFrldnbmhQoaYMf1nz9Eb/98f7rLlorzE3RdfteoYAMOlhaBzFaCP6+9kki
 oGHUU1S/6bIBg==
Received: by mail-ua1-f49.google.com with SMTP id n8so2205319uaj.12
 for <linux-riscv@lists.infradead.org>; Sun, 15 May 2022 23:55:36 -0700 (PDT)
X-Gm-Message-State: AOAM531MNdEoHIt4v9YpUbmKog3DoBDYNCtcLjZQyipDDLxWk43lhZXK
 J4buWd1lNIGqGdWL/6XYfoVkJvH2xqXckYQ4tdI=
X-Google-Smtp-Source: ABdhPJxmtz2zRffn70WwdXZCEN/EtZzhyD5YAzH08JCQyLUCluirTTig9RHWjzPE9xvnfEBH+E790EU75vYagB1kBNc=
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr5603921uao.114.1652684135694; Sun, 15
 May 2022 23:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-7-heiko@sntech.de>
In-Reply-To: <20220511192921.2223629-7-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 16 May 2022 14:55:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTDnqXKuEBGttN-1sJD9GH8Y5FLP2R5cpxnWnkfyqaFVA@mail.gmail.com>
Message-ID: <CAJF2gTTDnqXKuEBGttN-1sJD9GH8Y5FLP2R5cpxnWnkfyqaFVA@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: prevent compressed instructions in
 alternatives
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
X-CRM114-CacheID: sfid-20220515_235539_364360_7A927345 
X-CRM114-Status: GOOD (  19.64  )
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
> Instructions are opportunistically compressed by the RISC-V assembler
> when possible, but in alternatives-blocks both the old and new content
> need to be the same size, so having the toolchain do somewhat random
> optimizations will cause strange side-effects like
> "attempt to move .org backwards" compile-time errors.
>
> Already a simple "and" used in alternatives assembly will cause these
> mismatched code sizes.
>
> So prevent compressed instructions to be generated in alternatives-
> code and use option-push and -pop to only limit this to the relevant
> code blocks
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 8c2bbc7bbe50..e13b1f6bb400 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -21,7 +21,11 @@
>         .popsection
>         .subsection 1
>  888 :
> +       .option push
> +       .option norvc
> +       .option norelax
>         \new_c
> +       .option pop
>  889 :
>         .previous
>         .org    . - (889b - 888b) + (887b - 886b)
> @@ -31,7 +35,11 @@
>
>  .macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
>  886 :
> +       .option push
> +       .option norvc
> +       .option norelax
>         \old_c
> +       .option pop
>  887 :
>         ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
> @@ -42,7 +50,11 @@
>  .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
>                                   new_c_2, vendor_id_2, errata_id_2, enable_2
>  886 :
> +       .option push
> +       .option norvc
> +       .option norelax
>         \old_c
> +       .option pop
>  887 :
>         ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
>         ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> @@ -76,7 +88,11 @@
>         ".popsection\n"                                                 \
>         ".subsection 1\n"                                               \
>         "888 :\n"                                                       \
> +       ".option push\n"                                                \
> +       ".option norvc\n"                                               \
> +       ".option norelax\n"                                             \
>         new_c "\n"                                                      \
> +       ".option pop\n"                                                 \
>         "889 :\n"                                                       \
>         ".previous\n"                                                   \
>         ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
> @@ -85,7 +101,11 @@
>
>  #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)  \
>         "886 :\n"                                                       \
> +       ".option push\n"                                                \
> +       ".option norvc\n"                                               \
> +       ".option norelax\n"                                             \
>         old_c "\n"                                                      \
> +       ".option pop\n"                                                 \
>         "887 :\n"                                                       \
>         ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>
> @@ -97,7 +117,11 @@
>                                    new_c_2, vendor_id_2, errata_id_2,   \
>                                         enable_2)                       \
>         "886 :\n"                                                       \
> +       ".option push\n"                                                \
> +       ".option norvc\n"                                               \
> +       ".option norelax\n"                                             \
>         old_c "\n"                                                      \
> +       ".option pop\n"                                                 \
>         "887 :\n"                                                       \
>         ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)    \
>         ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
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
