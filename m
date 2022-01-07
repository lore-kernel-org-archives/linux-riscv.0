Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyKA54x3hyq5EhAUf2MN2wjAwH7r6XO9qFk525G5hM8=; b=QPdwsfs9VCByJ6
	M/LWNMpnKBoQ6BM+0CAck9jtWVkbqsFxsmbfKylN5q+fj0IV9laHXTTfX3GYGX3rC6oss3mJPwVgO
	4vfSBUiYaM4YmNvaz4kef1O9phZx3uTYXsBOuqeOA3FI0YO4JDJHBLA4j/vra66G7vGogMUjYKKP2
	P0bcz0hgFWmrG5VH2o5Oe3THYcd1AFtXy87BKmYBe8MXSiKYpkI8yoAnkRr69YuHrrB82KL38tcO/
	Iz9ZkuaZQnpcokMhs1icuj5mClXh31urkvV4bKR7A3HCUadBT0RJfqltlIS1tOnHKrQeEqPmHtapv
	08HhBXxQPOjiPdNvxkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qwj-004QbO-5c; Fri, 07 Jan 2022 15:14:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qwf-004Qa1-TI
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 15:14:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id s1so11654668wra.6
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWFnSZSkVt78joKOdVPndAq7OYwYhQIwpCuzvjLWjOI=;
 b=kCyflc64K0rGwhSAhnu47RGyIlEYilYbHSDzwammuSPdEpYo5gBrozbQ+b3C7T46AO
 bN+V7kEW6PIhsfYOYyOygLIzA/iuoITPMM2i1vDrSz6CRMEdvMcOfcxDAZ51eoQT+O2S
 tPqEqTmnGygP85L3WI+opsStfTbnOPcmTYJ7c7WskHbBdfHq4yKHEc6a2NOKSMWPmrIt
 /lUtcqbkpSwSwToe4PS8wRflihtUeHewZqYo7AK/Y9K9FbbOWu5ic739KEBtzw1SPtxG
 N01f84L3aUIyBGYDaHfLwDoJY9RpyoQJqfzKcOyyF+Xpie89AGhmehZmAJrCJg2j3Bd6
 /HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWFnSZSkVt78joKOdVPndAq7OYwYhQIwpCuzvjLWjOI=;
 b=pe/3JZfXHa3bs1j3hOkhoRgUATv0+Km6sSwaVrGKMm6wTqost49qoFMZZ5dmuOCC+c
 /h7lfWMxqilg51QyuQhl59d4FZWS4fKzcZnpEsvjetJtMVtvJlJjhPTdhxuO7xN1dy9b
 Q8/8ZKQ2ysv8aJZa660Em8K5oJTpZc7GP50zmuAPR28uG05FkZ3dTWOpRIydH0SBFJ6C
 bU5TlBGXQlh3RWGWWrjXrK5XefU1NaPqfqcFpj9WKypg2KcpW6QgqzplsCxdru7CaTU+
 bB7YztUmbFdQ8WIyzP2KsWXrfnzBD6+YFNiIi+KeV6h2wP4RZpf0jEFB8mu800Vnqnk5
 bHHw==
X-Gm-Message-State: AOAM532WDcZiGHBh/gOTgfenPecutwyfFVxIMGFlxRxQhHwyb73caz8i
 wthIYPSLLggSPMOQ8g5hX7rcBkliRpMIdtqs9vWTuA==
X-Google-Smtp-Source: ABdhPJy37VITo/bVicPgqYx42ZGSBKpNgt5lSoHKLyTaK/te/eyGpm6o9qndsFKZ08uYm/LiwTAmYcYv1LfeIIzuis0=
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr55233249wrw.313.1641568460514; 
 Fri, 07 Jan 2022 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20211228223057.2772727-1-atishp@rivosinc.com>
 <20211228223057.2772727-5-atishp@rivosinc.com>
In-Reply-To: <20211228223057.2772727-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jan 2022 20:44:08 +0530
Message-ID: <CAAhSdy1R5+e95-FxB63dUKj4xTXmeKhdUOK8UWSDG7-ShMZkcg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] RISC-V: Move the entire hart selection via lottery
 to SMP
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_071421_974379_E3A6D6A3 
X-CRM114-Status: GOOD (  15.36  )
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

On Wed, Dec 29, 2021 at 4:01 AM Atish Patra <atishp@atishpatra.org> wrote:
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
