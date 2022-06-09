Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7527EC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC3Ff3CqYmhrOiHr0TgkJcA77A+XDRmCIz9LsCyxYV0=; b=TdY8eR/kKDw27K
	03HMHkK6w2Rrm4B/VqGRCMmWZIn2dZ6MMLo2dLfB/oCEPXQgDxlMWwjh14y2zyZvRSkYfnlN2CITB
	q3dZMTwR9wB043/WInHbJMDZJL79aC/khyTSoJofYzKUf6IDlAtxa4LcMyf0+aNARDv3z/6qmRHUA
	92fswM3Yglh6LYQ/Ae+KTyu/djJ01hDYavnhuR31vEujqoY8dk12CgsTQE1dl+4yjSjcHhExKiicE
	9qQycJy6ChWYwaeIHqeOEf8/jKv+rIEQEN/MCGb8g9WoEB8/WnYnLnYdshUZC2c9HQFFJlNXC+SrO
	ccW1EN+r6dFnf/B7DKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz79E-00FVto-BR; Thu, 09 Jun 2022 01:39:44 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz79A-00FVqA-PW
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 01:39:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 00150B829F9
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jun 2022 01:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349DCC341C4
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jun 2022 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654738776;
	bh=XrNFivstGcREotp/ejreDD8MYrzaaoJ1HDe+rHV6SiI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SO9yRAN+z/Wx/+RHafCFXpnTtQEjhI5cmYLqrKfZZ79PiJ27hYXyAEu2RAsPsYWrM
	 w1r+NrnL3krC5y8F208gWHSvnsbZUZ3GU1mvIrDZhWVXWWNcODcUmkov0l13jviFlC
	 vOTj48HGAZiJQPNxjXUxYNvQtTRilz+NJtVtns31+w2dxy+GvKuodXcErwKWADdbv+
	 LzT4twV0kYGhieg9PoWQaBTrnRX2+82iKvI50r8zxczZ1OUX3rCLQgruYuW125423+
	 29ciTLE12vPw5kLpVIefSt/0i15OH1qsXQtgfWzq5yt1hvszjUjR9N42syOLrmL2OV
	 Y/5hU68y1ov0g==
Received: by mail-vk1-f176.google.com with SMTP id m30so5749824vkf.11
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 18:39:36 -0700 (PDT)
X-Gm-Message-State: AOAM530RWSUYrJtXUQIFaM/M1Swc7WgTRLP1Kl8msuiknJPYShe+Gh9F
	6FL+991eWikBxsmuiABJ3Jc3Vob8RJx/F57E7Vw=
X-Google-Smtp-Source: ABdhPJxl6MrvZBaZBkp2TXQkBzbGPPoQcmZjY6ux9wf7A5CXRZX0XwIDyj2z2t6RfyS7wnT5fvJeO1He/0YXZwhNfmk=
X-Received: by 2002:a1f:2093:0:b0:35e:21fb:1b65 with SMTP id
 g141-20020a1f2093000000b0035e21fb1b65mr7691636vkg.35.1654738775080; Wed, 08
 Jun 2022 18:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220608120849.1695191-1-heiko@sntech.de>
In-Reply-To: <20220608120849.1695191-1-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Jun 2022 09:39:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT_xihu58V43bQ0X-WS0STCT5RNjiEHdwPBaoXmrnX2OA@mail.gmail.com>
Message-ID: <CAJF2gTT_xihu58V43bQ0X-WS0STCT5RNjiEHdwPBaoXmrnX2OA@mail.gmail.com>
Subject: Re: [PATCH] riscv: don't warn for sifive erratas in modules
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_183941_131205_2DD99408 
X-CRM114-Status: GOOD (  26.73  )
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

On Wed, Jun 8, 2022 at 8:09 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The SiFive errata code contains code checking applicable erratas
> vs. actually applied erratas to suggest missing erratas to the
> user when their Kconfig options are not enabled.
>
> In the main kernel image one can be quite sure that all available
> erratas appear at least once, so that check will succeed.
> On the other hand modules can very well not use any errata-relevant
> code, so the newly added module-alternative support may also patch
> the module code, but not touch SiFive-specific erratas at all.
>
> So to restore the original behaviour don't warn when patching
> modules. This will keep the warning if necessary for the main kernel
> image but prevent spurious warnings for modules.
>
> Of course having such a vendor-specific warning may not be needed at
> all, as CONFIG_ERRATA_SIFIVE is selected by CONFIG_SOC_SIFIVE and the
> individual erratas are default-y so disabling them requires
> deliberate action anyway. But for now just restore the old behaviour.
>
> Fixes: a8e910168bba ("riscv: implement module alternatives")
> Reported-by: Ron Economos <re@w6rz.net>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/sifive/errata.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
> index 672f02b21ce0..1031038423e7 100644
> --- a/arch/riscv/errata/sifive/errata.c
> +++ b/arch/riscv/errata/sifive/errata.c
> @@ -111,6 +111,7 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
>                         cpu_apply_errata |= tmp;
>                 }
>         }
> -       if (cpu_apply_errata != cpu_req_errata)
> +       if (stage != RISCV_ALTERNATIVES_MODULE &&
> +           cpu_apply_errata != cpu_req_errata)
if (cpu_apply_errata &= ~cpu_req_errata)

Shall we still guarantee the module's must be a subset of the main kernel.'s?

>                 warn_miss_errata(cpu_req_errata - cpu_apply_errata);
>  }
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
