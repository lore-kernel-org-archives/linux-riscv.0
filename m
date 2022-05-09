Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16710C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qd0kpNuJMCPlOivHYdElRBn1gHvDCQ8y9qAsQFMNqkA=; b=j25mOg88HGlRVB
	LobAuMppJ1k15Hp8AHBDdPkUv2+17GSDsyHZ47vRhLhRNgO86JMZFR7TqqSwrFkAQiwWD8yVBz+n4
	cuj1GMdwEcKFKWEJT+5N6LxaIpc/Z05P8r7KzlUP7oOyOmjD4wXcrttfW50f4Dzop6AwMHbr7dKQe
	Wgjgysy1g6DOEmoTMtCckjycAkdQIeK5KFfZh+HuoN41V19epMVkl7XvawRFLVvHtDBaPG6cKlIVI
	rSSzLxcHlmVtAI1nZvaCy90rsAilTxW9ZKtNqE7CchStAHMmVNZK4OVACB1FQjwYRYzcI7WRfsVMl
	6ivMxhKn+a6uilgXt2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuRM-00CHDZ-0H; Mon, 09 May 2022 03:52:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuRJ-00CHC7-5t
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 03:52:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so7532678wmz.0
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 20:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l12WE5mp9PhO1IPRjTjpwmDGOQ7wb/4a5m9y3nBGeOA=;
 b=pvxaieywYUVpcXk0gT3Q+TKVFmt3IoMc62S6eEy129dttwYSJqT9gWsXPzLeg+zFPI
 PLe7o1fK9XGaF1Qesmimu/v+hehti1bDynbD4bKR/jpI1CYfNzYt6QF2rR7GxoW4FJ9t
 0kHZGsLEq7+bVTe4bIW5WVDYJL3zfzvAl63bDcfyCH/k73KZYhfI5iQeSZkRXci8yJCi
 mS1IfKYGnAxTSiGDmgemHWf/sStPKQ4nK5xMhXbQTNxlK0z2CaBgcTbNJJ3WQ/p4E6hh
 QjQGB47vH+kz7OiQHuN41JmNpw6cK7sULCd4ksimYRZehABS2BXGakngjKeoHtaH4av5
 AklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l12WE5mp9PhO1IPRjTjpwmDGOQ7wb/4a5m9y3nBGeOA=;
 b=hKrxAqnZ696mVqxm7Kp4YdVROM9YEtAKwkG82pIBHguoiezV1090UyQ3Q5Vk3qswDz
 nPW1yAfCkUUotcrZaXdXVfuEdmttgPAJ0szovBt890Sm8RUSDEVx7U6evV1BE5icChZl
 bd5DvwwdfVlYx4iOiA7VSWQrf8rEdM289gBmbrtES7nbDB3+IRKL7vxpgXjP3LDkp7Ki
 jsW6uOwWFzaQ6wBc/A6n2Wo1pNZHt9Jg19b34uK+8q54RkLRsTZ0NtDdbb9ubPKwY7+k
 3xRoXZKhXWJd+gYhh+Cc91Tvhoc5O0DhyFHXKy8siOgGwtaCjUH7BBJCoIMRbU+HPAaI
 uMWQ==
X-Gm-Message-State: AOAM533RG6onG4ysWbBmBg/Ut/9KdKMP/TK9X52sO7z1duWhTGY0erDs
 j4SrJwONbi7RDwd/SNtgEpAEi8WJuWYBsotNrR3Rzg==
X-Google-Smtp-Source: ABdhPJwC1APi3CYSHkdsQEXeqQMbYX056D1XGJXeGfizpAHDTp/Hd2oR5snXTCoQWjC29wCqNqBAMXzIclLr3fpNcSY=
X-Received: by 2002:a05:600c:4fd5:b0:394:55ae:32c7 with SMTP id
 o21-20020a05600c4fd500b0039455ae32c7mr20677459wmq.73.1652068323237; Sun, 08
 May 2022 20:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220508160749.984-1-jszhang@kernel.org>
 <20220508160749.984-2-jszhang@kernel.org>
In-Reply-To: <20220508160749.984-2-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 09:21:52 +0530
Message-ID: <CAAhSdy2-L+eSE5P+-TG94exgTsDp8wPiuhD23fZQ88nukoNj-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] riscv: mm: init: make
 pt_ops_set_[early|late|fixmap] static
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_205205_260363_E0755587 
X-CRM114-Status: GOOD (  18.55  )
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

On Sun, May 8, 2022 at 9:46 PM Jisheng Zhang <jszhang@kernel.org> wrote:
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

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
