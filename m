Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0060BC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRv8vezM0xoUJsBgGCiplz7P4T35PS+NnJxPH5ce7QU=; b=nTdGlbspCbdKcg
	ATOjjYv9yKQknEIa2kEHMLzxu55WOsCNSArtpElFi1sQ2Ff/NPr9Hk5qIZ4eBX7NLzF82hFKjP0cX
	PK0w9FoWwsyatkyseG3A5fXkuPQFcgn5V2/e7SDt+Cy5pKNv8i5Lszjuo2ufI/z4DJ/keskJ6Vjc0
	Efp6k1ELcawteXKAVGUeQlyyvMx/eqwTOvns2CU6F3Az6qHAJOZeHyuX+u0nxSM4qEfYrMDwvfAE6
	dAiN7uqmloNeq0gD+cPUdvOhs1uo5ndtndqX2W/Oy5/Ngd58B7H5yr7zdlc7J7F7b0Qfk5yyeIRW7
	SpHwPfLkK0Ud4j+iY68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsAb-000sCM-1d; Mon, 10 Oct 2022 12:46:09 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohsAV-000sAN-Qk
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 12:46:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id j4so16533024lfk.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Oct 2022 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY3VUGhKW8CmP8tRkiumn3t63ZndWcrOVy3NInH/4F8=;
        b=WfYSNe539shRVw3WcHUUuaSo4y4sxxkTYIo+JJ2wCMAWW2aWI1Eq9mu8QHheZcuj8G
         Ry+T/Jne36cmdNNXoi9BcZpSv156/ok1H3pu5j2RYmnqpyoSvXXrbFNE4kWXCOPq9sEr
         AtLTEKdptRqLIylJUqivtWseFoXqJ+k3xxBSz544xUrjyNEIjMcj8s7dO1Fn/r94zogP
         lYeQzTkfcDqdBWL5FZYMM/6+7yMiLFcqFLtjIBJTEq+ag0t4HbR16ZyChHehVSw80ht5
         gsgJAZeTec8t+Id5zNmQwvcFy+bXBjP075aOy+6RA3QwMn2KLxxicyO6T33ctGR0rOUn
         meMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY3VUGhKW8CmP8tRkiumn3t63ZndWcrOVy3NInH/4F8=;
        b=k34QJJ4ww2b9JNFDvkLVhGRExth4LGg2KHalkfzhwzfqSMwBakFM/gZkTiloX8svHS
         EIE/lqdB0tAf9MMwQmyawOXFsdL/qjhUAn4/Y9XLsz4ahBwev051BrLbLFd2gPoKO9Ca
         2KRPjAldG0iP+aSFT7VFm2JCpnq6DHn+/LU++0Tra0J5bcadmeyHAiXLIZJPmTAnfk5h
         XYg1cewLIm5rp3eqC379YpYYuK3QaivRic5YUALdXhGD0moODxXfYlY3fOo9mbpusAHX
         9s/Kis3T/DsSQAXM6V55ElMWPyj5Umu7ZvI5yk05qD1bTD6MRkXM2fJo+KnzsuX0i3AR
         fMgg==
X-Gm-Message-State: ACrzQf2Ft/RyH4oCuOrpGuLsCcSgqNvlqiV65j8fFXioCcFCRcSNKaKQ
	RB4vgE0SL4iHlZmgB+0ahf2qtbNrauQ3i69afiOUTQ==
X-Google-Smtp-Source: AMsMyM4qRD8FUFL9wvBdJ8LsE/Kv1B22ucAF/oQm3g2adt2U2w+xc8dH7xAKqzwr2z9qiTKLV1eGAUeC/AE3pzclOfA=
X-Received: by 2002:ac2:5616:0:b0:4a2:61f6:85e9 with SMTP id
 v22-20020ac25616000000b004a261f685e9mr6346865lfd.419.1665405955788; Mon, 10
 Oct 2022 05:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221010122726.2405153-1-heiko@sntech.de> <20221010122726.2405153-2-heiko@sntech.de>
In-Reply-To: <20221010122726.2405153-2-heiko@sntech.de>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 10 Oct 2022 18:15:45 +0530
Message-ID: <CAK9=C2VHPBgL208ZHb78Nab1dQjfF6tZuKTRRT5V=vnvfODEGw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] RISC-V: Cache SBI vendor values
To: Heiko Stuebner <heiko@sntech.de>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_054603_890605_E37B6679 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, Oct 10, 2022 at 5:57 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
> called multiple times, though the values of these CSRs should not change
> during the runtime of a specific machine.
>
> So cache the values in the functions and prevent multiple ecalls
> to read these values.
>
> As Andrew Jones noted, at least marchid and mimpid may be negative
> values when viewed as a long, so we use a separate static bool to
> indiciate the cached status.
>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/sbi.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 775d3322b422..cc618aaa9d11 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -625,17 +625,41 @@ static inline long sbi_get_firmware_version(void)
>
>  long sbi_get_mvendorid(void)
>  {
> -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +       static long id;
> +       static bool cached;
> +
> +       if (!cached) {
> +               id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +               cached = true;
> +       }
> +
> +       return id;
>  }
>
>  long sbi_get_marchid(void)
>  {
> -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> +       static long id;
> +       static bool cached;

This breaks for heterogeneous SMP systems (similar to big.LITTLE)
where HARTs will have different marchid even though they belong to
same CPU Vendor.

Due to the above rationale, the patch adding marchid, mvendorid, and
mimpid in /proc/cpuinfo caches these values on a per-CPU basis.

Regards,
Anup

> +
> +       if (!cached) {
> +               id = __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> +               cached = true;
> +       }
> +
> +       return id;
>  }
>
>  long sbi_get_mimpid(void)
>  {
> -       return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> +       static long id;
> +       static bool cached;
> +
> +       if (!cached) {
> +               id = __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> +               cached = true;
> +       }
> +
> +       return id;
>  }
>
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
> --
> 2.35.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
