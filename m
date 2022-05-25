Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC8BC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 23:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CYy6DRsNJjFV0IgBLbrkMxNcWjtkiDHVDHAo6y9pEI=; b=n4viLD+A8fj72x
	RHKjkTgXlpD4j4nO5Oif7ip18iZpHvMasSZTmndg7axQZmXbyE2b9q6ZuwllbNfi+XLds0e770C1H
	zLBmHuiOxLz1H5cBNZQNPaYHM1EkXdQI8KAb//sIoCWhCkeityeHyxo1xM/3Wxn1JySkm+LQF/tVD
	g6CduH0jGt8MN8nod/5EY6veSt96IxqeEjvHqOVnCl840zoPIAtYkaP6etTmpjAoH3HVf+I8ckrU6
	rYy1aggfJmxKSYZ6kPO+SSRpB7x2yTBRRXHnr/GRz8KJq65rCgH2+lBhV2nHfIWwYaA3zF3TE8idr
	PyhDkDLK0I/iG+XbU0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0AW-00CwMg-8u; Wed, 25 May 2022 23:11:56 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu0AT-00CwLo-Ko
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 23:11:55 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3003cb4e064so57670037b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3mm1aY/BdEGgm5C/qzynm8Cyr6ViPrOaHpTh3MCfMy4=;
        b=RyvnfDJs0Rseco3iLXTZ+iPwdihRyFfVKRrDTwspg4Qc3DIVeyzY+dHix2zI4nSgHn
         D8VGUZY6SG3XLMpJMLvsRxqaow/KD3Q905Gxx2t9oItcjYyMWz554n7MBnDqjhXq8zB0
         EAbgqyX8qFiN6NI545xyN0PB9sgEr5xtDCb08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3mm1aY/BdEGgm5C/qzynm8Cyr6ViPrOaHpTh3MCfMy4=;
        b=7zJywov1lnRIykvyxE+124n6LfGMhqeKahQkvUF0dvF76DHbBE/fJZYl5yTRAX02lC
         TmZXB+VrTOdfrj+UjCjK777s1u/tbEqEHcceiDrdAfb78AbmZUSC9DnwxmNWhoyB1M7j
         deiPekJzwf6O7ovJeCGgiqzx1mCgabEmBU3AoFJFvH7kcaH9tCdj/R7o4HokDeAdBzuX
         ncukFi17GXPd/Kdqad36JfPRY2cb0AgHHDFI8qlJStg4J6otLEBVxvT+hjUkg0oN8fsB
         Yc/tI7xAmvHrocwlxRp8ecX2GIGUIRIwzY8hSSO0nQ7XqpzfykFWsmCWaEwUws6jaQrQ
         KDCw==
X-Gm-Message-State: AOAM531AgXzHbqqSLbxz/TJTmNJmIrm8RAcHnevUmvhpGY9EIuJn9Nir
	nlz2vKSlBTazPYNQ9pIbKy/iz7P6My1/VP7LQ+e0
X-Google-Smtp-Source: ABdhPJx3ULvZXcVEBtgdS0E5XoYo/4N3FYTfZ2i5Gw2cvII72BCF9nS2480KdMribBkprxpRJSb7p87PCzEiQIU3yFI=
X-Received: by 2002:a0d:e88c:0:b0:2fe:da96:1b77 with SMTP id
 r134-20020a0de88c000000b002feda961b77mr35598083ywe.262.1653520311153; Wed, 25
 May 2022 16:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com> <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
 <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
In-Reply-To: <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 May 2022 16:11:40 -0700
Message-ID: <CAOnJCU+r6KgR7bd2dx5QLmmVLjJX8GhETHb6rG65wq0e_m6FVA@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-efi <linux-efi@vger.kernel.org>, 
	Sunil V L <sunil.vl@gmail.com>, Sunil V L <sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_161153_902096_D4D8F18F 
X-CRM114-Status: GOOD (  30.39  )
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

On Wed, May 25, 2022 at 9:09 AM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> On 5/25/22 17:48, Ard Biesheuvel wrote:
> > On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >>
> >> The boot-hartid can be a 64bit value on RV64 platforms. Currently,
> >> the "boot-hartid" in DT is assumed to be 32bit only. This patch
> >> detects the size of the "boot-hartid" and uses 32bit or 64bit
> >> FDT reads appropriately.
> >>
> >> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> >> ---
> >>   drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
> >>   1 file changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> >> index 9e85e58d1f27..d748533f1329 100644
> >> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> >> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> >> @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
> >>   {
> >>          const void *fdt;
> >>          int chosen_node, len;
> >> -       const fdt32_t *prop;
> >> +       const void *prop;
> >>
> >>          fdt = get_efi_config_table(DEVICE_TREE_GUID);
> >>          if (!fdt)
> >> @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
> >>                  return -EINVAL;
> >>
> >>          prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
> >> -       if (!prop || len != sizeof(u32))
> >> +       if (!prop)
> >> +               return -EINVAL;
> >> +
> >> +       if (len == sizeof(u32))
> >> +               hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
> >> +       else if (len == sizeof(u64))
> >> +               hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
> >
> > Does RISC-V care about alignment? A 64-bit quantity is not guaranteed
> > to appear 64-bit aligned in the DT, and the cast violates C alignment
> > rules, so this should probably used get_unaligned_be64() or something
> > like that.
>
> When running in S-mode the SBI handles unaligned access but this has a
> performance penalty.
>
> We could use fdt64_to_cpu(__get_unaligned_t(fdt64_t, prop)) here.
>

It is better to avoid unaligned access in the kernel. There are some
plans to disable
misaligned load/store emulation in the firmware if user space requests
it via prctl.

We need another SBI extension to do that. The idea is to keep it
enabled by default in the firmware but
userspace should have an option to disable it via prctl. If we make
sure that the kernel doesn't invoke any
unaligned access, this feature can be implemented easily.

> Best regards
>
> Heinrich
>
> >
> >
> >> +       else
> >>                  return -EINVAL;
> >>
> >> -       hartid = fdt32_to_cpu(*prop);
> >>          return 0;
> >>   }
> >>
> >> --
> >> 2.25.1
> >>
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
