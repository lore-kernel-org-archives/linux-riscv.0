Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC02C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cGdfxTp4+cs70XfzUJkMMHiXmaExL+wlnqP4MAzFMI=; b=PwIFmWnE7hhr1H
	xfBDhL0MV9rZqdStHFQEDmFpUbtARgLJKFmRU25WOZh+H5oROAgGondNwSFiizpgav8GXg+N2thXJ
	5NtfinRdZxW92xu+3aFP4SM9JgNUX57YemVNG+2RV5yu8KqyxFURLXznCqlmtO88OSnq8SEU5aTqZ
	UP6mn95wxx8HcJqN48FCOzcvk8G9eOslj9rmV1+zx+DKmUF7y4CFRv1gcYr31g4PrqBZiDTYqx0Hp
	MpxcwF5LkRQsyiPOm8DM7NF60h/bUoK1dNxFMYUTuLiVMfF5kt1KwAFiZfOlCZHTotdulGm27jiuJ
	21gVnAT9PXK5oilF7yUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQaQ-00Bpus-UA; Thu, 21 Apr 2022 06:46:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQaE-00BpnS-Ve
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 06:46:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 334A16194A
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 06:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA0CC385BC
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650523588;
 bh=WLcq0GdQen5yk3/RVh8Mf7eEU1B/s0OWeYJVrPZbDag=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LAEQYR7sX7YDMyXV78AAfqajN8SSZo764KzAzfQb/vG1LF1YgTimIiIy4sh5VyVyV
 8OrYUYBNvCqy9hKdsXOizDQGoWSdVEwfjTrd7akcSHrBenqG2IQZX2izSTU5WOFPbt
 9B+ypR6vIHD7qEyxaIcxYZrD8IDjKgUsXlmDtLsH8Vpg964BaOCp+FZkZlQIVYcOqN
 soNwKn1RlSNSVRUjAsCjRKFeUoEbNLmRoNZs5Yk0JlR+ocDs2lGJdVV1yaDhqqOvog
 Gs8FVyCe2I0ogZmPC/awI/wVPvMAB2+1YsQJYBQ4bVNO5QpPPoyEJLr/TM+NwPEIug
 dV/ilnnCC0kGA==
Received: by mail-ua1-f52.google.com with SMTP id i26so1467846uap.6
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 23:46:28 -0700 (PDT)
X-Gm-Message-State: AOAM530TOcTdXJt4JrwxecERGYdksoAWnOVlUqKzWxHeUMDyAsr0D7ii
 i3UOuPFpUo6lQcaiQDn8M2qMtvYWQT9n4eOasXs=
X-Google-Smtp-Source: ABdhPJzfifliJQXuUzw+tNmc9xepcsDv53ylKDVONRQ7bmS/cqwxPIrc+JIGKlw6PJxKHEWSXiCwU0HKC2YG/Dzd8R8=
X-Received: by 2002:a05:6130:9d:b0:35d:352e:2810 with SMTP id
 x29-20020a056130009d00b0035d352e2810mr7376432uaf.106.1650523586998; Wed, 20
 Apr 2022 23:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220420184056.7886-1-palmer@rivosinc.com>
 <20220420184056.7886-5-palmer@rivosinc.com>
In-Reply-To: <20220420184056.7886-5-palmer@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Apr 2022 14:46:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ2hdv5w5W-U=PxMsNZrL4ZPx=f_m93nZ3FSUfWUUJr3A@mail.gmail.com>
Message-ID: <CAJF2gTQ2hdv5w5W-U=PxMsNZrL4ZPx=f_m93nZ3FSUfWUUJr3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] RISC-V: Fix the XIP build
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, jszhang@kernel.org, 
 Vitaly Wool <vitaly.wool@konsulko.com>, gatecat@ds0.me, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>, 
 Mike Rapoport <rppt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_234631_114197_5CE566AC 
X-CRM114-Status: GOOD (  18.41  )
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

On Thu, Apr 21, 2022 at 2:48 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> A handful of functions unused functions were enabled during XIP builds,
> which themselves didn't build correctly.  This just disables the
> functions entirely.
>
> Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 7bc9a21e29fb..d2054a6cd791 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -660,7 +660,7 @@ static __init pgprot_t pgprot_from_va(uintptr_t va)
>  }
>  #endif /* CONFIG_STRICT_KERNEL_RWX */
>
> -#ifdef CONFIG_64BIT
> +#if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
>  static void __init disable_pgtable_l5(void)
>  {
>         pgtable_l5_enabled = false;
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
