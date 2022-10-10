Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 06:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeobmp4GtPazfpRdDQFk4g5Fibj0ZLUAXrL6vYamdsE=; b=ekyPmBs8Cu/atg
	aUo6FZA8ivJ3sKclcCVVqyaytqSki/tHmhteUkUXRpLcerwaoQLBYpTNiuJA1FbShXaowaLejI42D
	EDH28g5vgsYXitZFGPiopQwKwQeRlXINK24ludPL2a8laJadx28fiIY0w36He6JlPkAXufhV3t/PG
	ErMrdk95Y3h5RP10N+yHTTrTGSuJeSRNq7UkfL9hZNCulJcSRkI17K9Fog/hQswsTz+4+KMX6E7XZ
	dDHefGoWF8mlsyPx20dMMvZGg5J3EdGcn/fkKaAwalJajVhF+j7fUsyVkDRIyW4VHjRYN8xvVkTBO
	W5jdyS/qMHjyLpbIxkfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmbn-00HHPP-IP; Mon, 10 Oct 2022 06:49:51 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmbk-00HHOq-GR
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 06:49:50 +0000
Received: by mail-il1-x129.google.com with SMTP id h18so5270090ilh.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Oct 2022 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=StmzGWQ2FLOMlUBqdG0YoDepffrHHrJJL+7kIac1kMk=;
        b=phMXaWK+UV0nZr1p6R0ccwAPvvF9qow/wGZn7WabRjQtu00Ornr4RN1oCKOxI5wnEc
         7f6Y9iqSLIMZkbrfY224cGSfJiYCB7A+IitZpwKUbpl/+MCnfFIoC2FrfV0q3DTQ/dl6
         stbLtA0j84TpJPDpxj6w7vAG0etNgEVsSHYrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StmzGWQ2FLOMlUBqdG0YoDepffrHHrJJL+7kIac1kMk=;
        b=czCJvwMpbILU+TgRGiuEJ+czrqN6+lXp8MqTjJ30+pbLcXbL1dF5lerLrmniyXlPgr
         YALrY4YbSvhXp6sjGPEDIT0KhGitflRoFJINhsjuk28hj1BOyXLTgsMmT0xCzNjgqW1j
         by1ORt1oD3pBHOTUV5nb2kwtDKTktHdsTDbGKohAG8FoDbigdlLHH5uBazWUYzmXwbaL
         SmOZwPhxzWIUx+T5ujhiecuSE2GUO3OxPm8JbCrFYshMdVdDc1F81U1jtau6+tBvUYE2
         OuNrplh045AFEbBpoiUEmOqt4R/bwrpEF3BDG0lvuQgJIBp+IFKEROLsflyoTTGQzQF8
         TtIA==
X-Gm-Message-State: ACrzQf1gOi0DdzJ+z42AZXOptlzt6KtkzWAjCUcpEgGGZ6oSJHUbBO6c
	2LhgjMhIsHjDLKdr6qjGymxt+EmMWehZEIJ+Mw8b
X-Google-Smtp-Source: AMsMyM4laGc9rGeTlqVCswkSboYYZyX6Iu4PX+zuvFf/hlqdyVkdHJwCeHcXsSuVkQ33D9tEI6TcIXrDLoJ54Dz2zoM=
X-Received: by 2002:a05:6e02:1a41:b0:2fa:969d:fcd0 with SMTP id
 u1-20020a056e021a4100b002fa969dfcd0mr8561021ilv.6.1665384586748; Sun, 09 Oct
 2022 23:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
 <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 9 Oct 2022 23:49:36 -0700
Message-ID: <CAOnJCU+n4gvyj=a=JjGMkC4PXHLNWt-_a9aqtp61XHCD-8UYHA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
To: panqinglin2020@iscas.ac.cn
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org, palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_234948_775132_51E0F58A 
X-CRM114-Status: GOOD (  23.84  )
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

On Sun, Oct 9, 2022 at 1:31 AM <panqinglin2020@iscas.ac.cn> wrote:
>
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> Hi Atish,
>
> It seems that the panic is due to the missing memcpy during kasan_init.
> Could you please check whether this patch is helpful?
>
> When doing kasan_populate, the new allocated base_pud/base_p4d should
> contain kasan_early_shadow_{pud, p4d}'s content. Add the missing memcpy
> to avoid page fault when read/write kasan shadow region.
>
> Tested on:
>  - qemu with sv57 and CONFIG_KASAN on.
>  - qemu with sv48 and CONFIG_KASAN on.
>
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> ---
>  arch/riscv/mm/kasan_init.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index a22e418dbd82..e1226709490f 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -113,6 +113,8 @@ static void __init kasan_populate_pud(pgd_t *pgd,
>                 base_pud = pt_ops.get_pud_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>         } else if (pgd_none(*pgd)) {
>                 base_pud = memblock_alloc(PTRS_PER_PUD * sizeof(pud_t), PAGE_SIZE);
> +               memcpy(base_pud, (void *)kasan_early_shadow_pud,
> +                       sizeof(pud_t) * PTRS_PER_PUD);
>         } else {
>                 base_pud = (pud_t *)pgd_page_vaddr(*pgd);
>                 if (base_pud == lm_alias(kasan_early_shadow_pud)) {
> @@ -173,8 +175,11 @@ static void __init kasan_populate_p4d(pgd_t *pgd,
>                 base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
>         } else {
>                 base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
> -               if (base_p4d == lm_alias(kasan_early_shadow_p4d))
> +               if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
>                         base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> +                       memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> +                               sizeof(p4d_t) * PTRS_PER_P4D);
> +               }
>         }
>
>         p4dp = base_p4d + p4d_index(vaddr);
> --
> 2.35.1
>

Yes. This patch fixes the boot issue for me with Kasan enabled on v6.0.

Tested-by: Atish Patra <atishp@rivosinc.com>

Thanks for the patch. Few nit comments:

You can drop the message addressed to me in the commit text.
Usually, that should be after the last sign off between two  "---"

As conor suggested, there should be a Fixes tag[1] in the commit text.

[1] https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#:~:text=A%20Fixes%3A%20tag%20indicates%20that,versions%20should%20receive%20your%20fix.
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
