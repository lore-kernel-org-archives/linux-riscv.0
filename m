Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D5DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81Tg5N8AowTKtpCsbDWk5nt9hqWQDNcYxAU9zwqVMHk=; b=WwMIS/YuG25VZb
	UE3ZAE378aU0U2tmSfDYdTZw2vYwT76aIErXT3ZEVccFYDEtFzpo2H3qCGxrsRgRUWqEWrCuhu7Vh
	ni/2CeUZwcqUUQcGOci9T/qMR0wdMr04AnbLg7vylomgECVlG2knlpR7ee8PwQ2A4VMOeF1k7vNrD
	08qWd56IuW4dsOXnGyWduc3M97ZHC6orTkPVwdjy96Vvd1c4gZel/6KIPxtkYoGCsBxMgHg1zasyF
	dfmwfCB+raI4uHcgGOiEJi+3XTxeV5hufchd2iNcLLbRNewLOyHJZnvC2eBv3kHYJABrWthaWl5eS
	OlHnD44blpluni4ObUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwku1-009Zz7-6W; Mon, 13 Dec 2021 12:58:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwkty-009Zvm-QD
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 12:58:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id v11so26859230wrw.10
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 04:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yE1NJoEkLqbokvSpYWlB5SSkQY2Cm5a8iW3gPGrAhJo=;
 b=PJxID4B12j0WhNVy8KHFxju8Vb2bQts3b/GClW7DEWshVXbi0n3PNdVUELBCGfLVDl
 UJedf2MHkTH3hM+TpFo7ZwXT1GbXZqKSb87nZmJ9h4VlScdQmaiYStfHjP15sRELDyZK
 KegJdJBW48yegrV8oNFawPxqThJK4cTOy568QFka8TzIpgVXNTP1e5P0OV0kq1sfMhGV
 0BcXtrzW0EM82hItZ1ZIauFV2usXzJsrVnGU5KZKBQQlr4gmo0odargrD0gAtL1evuAh
 ckK0EFmAjYmOzol9uLbn12ZN91d9NVyKKeOGvC8abt16ZC9fExyd8KOBMQ9t1aDOgwAc
 KVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yE1NJoEkLqbokvSpYWlB5SSkQY2Cm5a8iW3gPGrAhJo=;
 b=CLuk3yZWQ2e1E4u1XUOVcJ6hvq50/TTusjh+l1kBKEb2KMpd8kC4KC6NroHNrpglds
 KDbbz9Z7cdpOsB2dQhYfak59XQQmu2DEJWPx4POwuhdXta0mqn1rMIpPBINOse0iAA+D
 rPpD11ylnmCFUOe10af/ueAi1z+JBdln/XYxeKwWEOW2QRQT4AkY4ZBLz6Zi9Fw4uJhF
 R/LWK5rVnXGbAasw0hgyxolRqHqcc5nIq46lQ7kkCsCcTUw1nlWznenRvrj7XmBRAi7i
 ngBHMtNbsypHbjfWGin5W6j1AiadeqNHsjTZTmHutfsFKcHQwP8j8rWJ/5p4Ru7omuQ0
 qsrA==
X-Gm-Message-State: AOAM533XNQHJUdKTtlswTGqeoiryCQW14FmaJzCZJmyaMRjHr49lE84q
 YA5vwl97njFeRhTgL3eKzLSxqvuSm/U8yFeWAEuHaQ==
X-Google-Smtp-Source: ABdhPJw0wDrF/tG6W57VsldBBElix+LWOpHfqvCneGFs2MEM3WHX0DOgs6XYRpRNRcHyuIwTLfW1L+AXGIDM4L3IoHM=
X-Received: by 2002:adf:d082:: with SMTP id y2mr32412769wrh.214.1639400258561; 
 Mon, 13 Dec 2021 04:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-5-atishp@atishpatra.org>
In-Reply-To: <20211204002038.113653-5-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:27:27 +0530
Message-ID: <CAAhSdy2NydGsa1Mw-hmJRNeCkQh=z_Q4ob5nTr1ZQDPTRjHDaw@mail.gmail.com>
Subject: Re: [RFC 4/6] RISC-V: Move the entire hart selection via lottery to
 SMP
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_045758_859954_040C543B 
X-CRM114-Status: GOOD (  15.81  )
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

On Sat, Dec 4, 2021 at 5:51 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> The booting hart selection via lottery is only useful for SMP systems.
> Moreover, the lottery selection is only necessary for systems using
> spinwait booting method. It is better to keep the entire lottery
> selection together so that it can be disabled in future.
>
> Move the lottery selection code to under CONFIG_SMP.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/head.S | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 6f8e99eac6a1..9f16bfe9307e 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -264,8 +264,8 @@ pmp_done:
>         blt a0, t0, .Lgood_cores
>         tail .Lsecondary_park
>  .Lgood_cores:
> -#endif
>
> +       /* The lottery system is only required for spinwait booting method */
>  #ifndef CONFIG_XIP_KERNEL
>         /* Pick one hart to run the main boot sequence */
>         la a3, hart_lottery
> @@ -284,6 +284,10 @@ pmp_done:
>         /* first time here if hart_lottery in RAM is not set */
>         beq t0, t1, .Lsecondary_start
>
> +#endif /* CONFIG_XIP */
> +#endif /* CONFIG_SMP */
> +
> +#ifdef CONFIG_XIP_KERNEL
>         la sp, _end + THREAD_SIZE
>         XIP_FIXUP_OFFSET sp
>         mv s0, a0
> @@ -340,8 +344,8 @@ clear_bss_done:
>         call soc_early_init
>         tail start_kernel
>
> -.Lsecondary_start:
>  #ifdef CONFIG_SMP
> +.Lsecondary_start:
>         /* Set trap vector to spin forever to help debug */
>         la a3, .Lsecondary_park
>         csrw CSR_TVEC, a3
> --
> 2.33.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
