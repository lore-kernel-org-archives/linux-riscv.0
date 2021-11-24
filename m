Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6979C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 06:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBU6q+1mOCFbom2FU3zrDNLW1AO0yZbVckrcGVt+ArQ=; b=3zNc7VDzT36QAf
	L3lR42R58p6OX8vCq1SyFsMHT/LM26joJS7vQgAcWAvQjAvt5jgYdkOwJPPa+UdHg40I87epd2kKD
	1riIonbC4ARFgAtC7Nw4LHcUunWInMWlN7o+y/hRGR87U5ck5oY0cySurpMXzvrXRue8TmlxrSHYZ
	Tytka+wXoaWRmxMYr921+5NmYsK2X1FpYQxoNLertcqXCoOPcYoJzdjFqgka69+gjg7EOdLbsmo/7
	kyDiOODJfuntRUsGfDzsSILEL3+IodyYWfBrT0WEWMQJFwU6Ozm99/7B3Lh379P6nWTXhby1nEhn1
	6KcLRUjE6Qbjqc1/jzhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpmBn-00429X-42; Wed, 24 Nov 2021 06:55:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpmBk-00428r-MR
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 06:55:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso1153569wmr.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 22:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMC8pp4mVpNvhRL3jm1hX0mNoR6GBx6c8qg48EuKy2w=;
 b=nI0EaHE/M+xl/HsklYIGJKHl+ovr78hwBFi5nMaij8dYWmuAsns2/PROeqWJ3FJ8qf
 aD7wNLNDhLoxy6UsbYz2FAusX29C2JrTgc0ewkjPLAdLQ6bTCpUuN9yvU1QVCLoEx/vE
 x9h8cFPjnvKJkmrzTDrilrNUzVgzqQlULh7tlyEnHMRrHzKilpBfuytFei4rRxOcBGmc
 a3NSzzaOe647/6qkGS6f6wFVijbAqrKDxt8SmICwNCsLp3bujQFccjS2D8UiaQM8Ooxt
 u4DOTXYziau7u0+e5tFDL+Z82QjeKNbIhzuelK61J7ehqeV5g64GB85hzqrgxuYvm2N7
 rDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMC8pp4mVpNvhRL3jm1hX0mNoR6GBx6c8qg48EuKy2w=;
 b=LvwPtJNGnrTglHCxFVDAqJBXzghDcPpddFcMngSPkW8d9+5+VqsSZ1CSS120FvO0n5
 pJIr/KW4k4spALk68FPKNwwPHO6EZMEUrGOMg8pnl5+VltpQnogYSTyZyjOjpbFFY7n4
 3Gam8id5HPDS2jLJJtUKnOMgGph5sGhe8KXGdxB+wDDv9gpM0ozSXIvihH3+sVWBdu3X
 qa3sJ/X6WxhahLrN54/5LJTgRHkMcuN4Y+IbjgUn+eRawnBOiUmwDFIodMrs8MAO8Gsa
 2QLy/DfaO4+jt8DJjbx9yahtT4aO344JLroRrkNTSGEjz0JP9V1q14vW/2K1LxXr91Br
 aAcg==
X-Gm-Message-State: AOAM532Y5GdT75MoMFeNFOb1VGoaXmoXYlEH75Sxqb6K2mNNi2kwqqwK
 H/fFqRY88b7eLO2Cjw8L9wnLri9PFInWzUURfdS2pg==
X-Google-Smtp-Source: ABdhPJyzY2RHxrAEL5Q8QxrTjXOPnheMWIXDQcEdBHU0XPG5cgjRLiKr064wWKsNaG5Rf+AS4V+fxKmWCH54gG5PTmo=
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr12303753wml.59.1637736926050; 
 Tue, 23 Nov 2021 22:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20211124060521.614015-1-guoren@kernel.org>
In-Reply-To: <20211124060521.614015-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 24 Nov 2021 12:25:14 +0530
Message-ID: <CAAhSdy1CZbdAPEYxFOhrn=wUcmc9Yea0ziMUmHjaudKdH2Yw1w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup one-page wasting
To: Guo Ren <guoren@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Atish Patra <Atish.Patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_225528_797147_4C42E4B5 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Nov 24, 2021 at 11:35 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> For small memory systems(Allwinner D1s/F133), one page size memory
> cannot be ignored.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Alexandre Ghiti <alex@ghiti.fr>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <Atish.Patra@wdc.com>

This PATCH breaks the CPU hotplug functionality.

When a CPU/HART is turned off and turned on at runtime, the
low-level relocate() will be called to enable MMU on the CPU
being brought-up which in-turn uses trampoline_pg_dir.

Regards,
Anup

> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 24b2b8044602..097bb3bc4020 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -241,9 +241,9 @@ unsigned long riscv_pfn_base __ro_after_init;
>  EXPORT_SYMBOL(riscv_pfn_base);
>
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> -pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
>
> +pgd_t trampoline_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
