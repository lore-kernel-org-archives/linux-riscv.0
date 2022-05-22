Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E92C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWiOM8UxSmlGvpOYd4IwS1WVqF9rqtRmFkXRqACOesQ=; b=wbEjqVrVA4MZ6k
	K7e+HskFynDg13VVltC0nO7cEms9DQgwvlam7jFuO1xQ3So4QrU/Fht7fz/wsQESMco6a9MZNe/h6
	LqD7ijsIqjCXeZQUe4chs5Ys7UmJHK1PAvMMh321gqMIxhTN4AfVG3PjfDNdPjOCZ1o//lf+/X7Tq
	kQhUiAJqd1qosxL5IZQexBDSnw7ljZ/fUBXsQ8n6pfnyHDixHElPd9r42RveP1DagYH/tLT3Glw89
	l2zaynHI9s21icbpVbE2Idl/wpxMZZZQy67t0SUEJiyV3e2li/qGmdhV8jtu52DbArBr014AyNhwz
	Xwp+1QA2JDp11j2d4ViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsgqG-000sDK-Qf; Sun, 22 May 2022 08:21:36 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsgqD-000sCt-RD
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 08:21:35 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ff90e0937aso46672017b3.4
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Znw7LJlbn1r+wdsACS1F0N9XbG/RiiVDOXyDXO5CsQE=;
 b=oI5Lsg53Bix9/s98Dk6RwCbWEJtDNIO6hHRev5nvmxWVtypqgkp09ZLZmxl7WuChR8
 LdcdeJwLgDHQzEW1HEq/uwiQpgs5NECaDSRup/YaGHZ6YCWvsXWwVsF/PB/1Oka6zHVa
 0F5wghO4TAWAr6ItAuRaO3TLHmMzJKFmnWskQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Znw7LJlbn1r+wdsACS1F0N9XbG/RiiVDOXyDXO5CsQE=;
 b=aNK+SY3psc2+cWEwtKAe+OHSFUPEbmR6TPk6qwe15Oj9RX9lKKjCXo2T8V8ItenmKQ
 xtu/NTUxH7ysFqNXeXSQMbca1cr+ciVP9GEafBpjgvlwm6R9D0o2RkncZCDrLEjvKY8c
 bJZ6r3lYe+ysCwgqXfrquyinX04XCHcUXPK38X+iG2JTiSV8TnMVK2LQjbH5o3XrPoGl
 t67dM6ZukHZ5xinSEz2Pmup2ZIljIQgYjN3hzAXi1ZwKQ4dGLObwNZXwaPLJS0bITTiN
 bzmGGPcQ5fieWd0/Tc5jlLAKfBCmQQ4Minr5GIL3/nQWNHD/3nEO+0QTneMebaW1Xqgn
 X4sQ==
X-Gm-Message-State: AOAM5308YBoHXJbBTBF/X+VVfq8FxAgA5+G2LCeKmIBt0gJFUk13aa8/
 c9lhuZ4UBCkTCcYa9EugFWARUZiByuFinXwiFPVJ
X-Google-Smtp-Source: ABdhPJzPUEYEU781zCIU9/dh8A2Evos/v/c0AEiyTU81BdY0IPzvjMDDVTC7tJgmrtM8d3WDf0TgxCnJdVQPY8Dh8N0=
X-Received: by 2002:a81:8494:0:b0:2fe:ff73:cdb7 with SMTP id
 u142-20020a818494000000b002feff73cdb7mr17834758ywf.373.1653207692599; Sun, 22
 May 2022 01:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220516143204.2603-1-jszhang@kernel.org>
In-Reply-To: <20220516143204.2603-1-jszhang@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 22 May 2022 01:21:21 -0700
Message-ID: <CAOnJCUJcEiRMKj7=77qnE8RpGmWnJALNhCTaeTo2rb9-NqEpZg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: mm: init: make pt_ops_set_[early|late|fixmap]
 static
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_012133_923023_C31A4AB2 
X-CRM114-Status: GOOD (  20.66  )
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

On Mon, May 16, 2022 at 7:41 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> These three functions are only used in init.c, so make them static.
> Fix W=1 warnings like below:
>
> arch/riscv/mm/init.c:721:13: warning: no previous prototype for function
> 'pt_ops_set_early' [-Wmissing-prototypes]
>    void __init pt_ops_set_early(void)
>                ^
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>
> since v1:
>  - collect Reviewed-by tag
>  - move out from the static key series as a separate patch
>
>  arch/riscv/mm/init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 05ed641a1134..5f3f26dd9f21 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -849,7 +849,7 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
>   * MMU is not enabled, the page tables are allocated directly using
>   * early_pmd/pud/p4d and the address returned is the physical one.
>   */
> -void __init pt_ops_set_early(void)
> +static void __init pt_ops_set_early(void)
>  {
>         pt_ops.alloc_pte = alloc_pte_early;
>         pt_ops.get_pte_virt = get_pte_virt_early;
> @@ -871,7 +871,7 @@ void __init pt_ops_set_early(void)
>   * Note that this is called with MMU disabled, hence kernel_mapping_pa_to_va,
>   * but it will be used as described above.
>   */
> -void __init pt_ops_set_fixmap(void)
> +static void __init pt_ops_set_fixmap(void)
>  {
>         pt_ops.alloc_pte = kernel_mapping_pa_to_va((uintptr_t)alloc_pte_fixmap);
>         pt_ops.get_pte_virt = kernel_mapping_pa_to_va((uintptr_t)get_pte_virt_fixmap);
> @@ -889,7 +889,7 @@ void __init pt_ops_set_fixmap(void)
>   * MMU is enabled and page table setup is complete, so from now, we can use
>   * generic page allocation functions to setup page table.
>   */
> -void __init pt_ops_set_late(void)
> +static void __init pt_ops_set_late(void)
>  {
>         pt_ops.alloc_pte = alloc_pte_late;
>         pt_ops.get_pte_virt = get_pte_virt_late;
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
