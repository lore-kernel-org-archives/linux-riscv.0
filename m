Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8265DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jan 2022 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOGe7hdlAn/IHflSwrDQSWo5kK/KObEW1+ylwldIacg=; b=sR1qlQH+86pCmj
	x7ApB+GIEsWcfTNkKOVnHYSf6St1ygfYA5pDZD5Q8PtIHnkERZtbtRkvPkendrNZjRBW3M62J/gly
	FsfUZKEdPGk4hsXFo1EznraB8ggW+SrUsFefpDw+fTU0PBUU8cf7flVRQlXRNg/TS1HUokwaQDKei
	1b0KL2J5QXMEuOjY2nl7j1ifi5hQtOIIsfwJn4ywim1dgI07MJBbBcVNPf9q+dkc5yfxiIoHA1voh
	KCnYqWa+9XPiv09MWLjpJiXHJJpCvP0mnoMqMdzdne7GqsM7IY5CNQmfttf3/1/pI3pKb+3UiMgTV
	SfiQrvxsvYs0s6TCxqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB7jk-00GZkb-RH; Sat, 22 Jan 2022 04:10:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB7jf-00GZiN-Q6
 for linux-riscv@lists.infradead.org; Sat, 22 Jan 2022 04:10:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id i133so45403wma.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 20:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xtBzfTtDG7oKM+x9UqD0E0Ye5bVhGGdjMoStNboz9r0=;
 b=3khVdGAzaP4cQaVtq0HqR9t2SgSWu0COjVPL79LLhIjzhULd13thKBLqgrjopbvSr3
 wlasjQ0Om1cjyWDMZ1b/u5EzP+bnoY8fp3WwM4IM5ovzXGd1ON/+JXeVcrv7DEeEEXjV
 fgwKJVGLREOR8VjIbMMr7a3iEmgBfsz4LpoAjOD7iem6oLcwrP2nS8m349y5HvnN+sfQ
 KwPaC9w0G3jRr5EcaYWDFgh6e8AltN4veUgmbzxRn1gHnI9V4o3Oo5+Buh1HCunNbe4X
 bR8b4uWXLVGoOo7gvIB6Hmgc6UL6nCHGR9/NmY7fE9owoFb6hlYTr9lBKWEdbRIDY8Gw
 njwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xtBzfTtDG7oKM+x9UqD0E0Ye5bVhGGdjMoStNboz9r0=;
 b=BwT0GYpk9DOyyfgqEvfR8uDX6yeoESL3TP2iLh1eqOXVfSNaDmVeLjf2PyzhAOK64H
 PpcgZKKcmNqRsxQUbfeUZBz6HUov6941Pmm1HZ0Vkh7ZsFkP9QSHcMwL0Ja/Xm5wiRCG
 qjOYviK0O8EFYt22jcrgl9C7gVp3q8IX9IM3D3GGmQbigWkwnsRRE+FsODQlMWg1ttQ2
 vnxKbW5NthWy9O3YrZM3kXfsqRwNNt8F4TN539t8xMoJcfrKVum4mjTtUgZXaVAN7zr8
 xxQLtnzzOAX52Am1aZTJwfRKqLCeY5yRAdmq0YizeXUeCpBP5mAvzwIUjMBzvcftR9Hp
 ntuQ==
X-Gm-Message-State: AOAM5315tNdr0OpU6/buzOqBwIrGxGBN6qLdseodXw48cS2kCrl0XL4A
 Wa/ER3Te20PR1GUiZgfbD4oWLk3RkMM4xl3gx0zXVw==
X-Google-Smtp-Source: ABdhPJx6sfY92HZ0xDDUQCFCf4Hlk2yHd1KucAzOdklPTxk3FJgXWdL1u5os7d9ynNFEuL/bjXv/ZFLMdP2ILtQjhfw=
X-Received: by 2002:a7b:c181:: with SMTP id y1mr3058395wmi.137.1642824635202; 
 Fri, 21 Jan 2022 20:10:35 -0800 (PST)
MIME-Version: 1.0
References: <20220121163618.351934-1-heiko@sntech.de>
 <20220121163618.351934-2-heiko@sntech.de>
In-Reply-To: <20220121163618.351934-2-heiko@sntech.de>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 22 Jan 2022 09:40:23 +0530
Message-ID: <CAAhSdy0GgUOEZeVeOgRFt80AvJ9DNJJpuT=-gQT-mdX-Km+BmQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] riscv: only use IPIs to handle cache-flushes on
 remote cpus
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_201044_793524_A512389A 
X-CRM114-Status: GOOD (  24.14  )
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

On Fri, Jan 21, 2022 at 10:07 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Right now, the flush_icache functions always use the SBI remote-fence
> when SBI is available, leaving using IPIs as a fallback mechanism.
>
> IPIs on the other hand are more flexible, as the ipi_ops are initially
> set to go through SBI but later will be overwritten to go through the
> ACLINT/CLINT.
>
> In a discussion we had, Nick was of the opinion that "In general we
> should prefer doing IPIs on S-mode through CLINT instead of going
> through SBI/M-mode, so IMHO we should only be using
> on_each_cpu_mask(ipi_remote_fence_i) on flush_icache_all()/
> flush_icache_mm() and remove any explicit calls to sbi_remote_fence_i(),
> because this way we continue using SBI for doing remote fences even after
> CLINT/ACLINT driver is registered, instead of using direct IPIs through
> CLINT/ACLINT."
>
> So follow this suggestion and just do ipi calls to have the proper kernel
> parts do them,
>
> This also fixes the null-ptr dereference happening when flush_icache_all()
> is called before sbi_init().
>
> Suggested-by: Nick Kossifidis <mick@ics.forth.gr>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

For Guest/VM, only virtual IMSIC provides faster IPIs so in absence of
virtual IMSIC, the SBI IPI based IPIs are the best approach.

Like Atish mentioned, please base this work on the ACLINT series
because the ACLINT series adds required IPI infrastructure which helps
us select SBI IPI versus direct S-mode IPI based on hardware capability.

Regards,
Anup

> ---
>  arch/riscv/mm/cacheflush.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..c35375cd52ec 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -17,11 +17,7 @@ static void ipi_remote_fence_i(void *info)
>  void flush_icache_all(void)
>  {
>         local_flush_icache_all();
> -
> -       if (IS_ENABLED(CONFIG_RISCV_SBI))
> -               sbi_remote_fence_i(NULL);
> -       else
> -               on_each_cpu(ipi_remote_fence_i, NULL, 1);
> +       on_each_cpu(ipi_remote_fence_i, NULL, 1);
>  }
>  EXPORT_SYMBOL(flush_icache_all);
>
> @@ -66,8 +62,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>                  * with flush_icache_deferred().
>                  */
>                 smp_mb();
> -       } else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
> -               sbi_remote_fence_i(&others);
>         } else {
>                 on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
>         }
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
