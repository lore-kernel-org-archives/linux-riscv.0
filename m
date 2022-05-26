Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8243C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qlm704m71MYzkHmFIIx4mnfz0c4rWgMGTfsOE9Zjm5U=; b=G/8PUodhjrF1Xl
	fIb0xXRNHeut4npV5Vgs2Wxb/iBxThQKNhbkKG0dnc0YD11Hk61Z8TyxvTezPWfyUEq3VkzaoqW9q
	WIHXAmTBLyYMxY2A/eGsS5jEQVbeJgEfZua6Ct62JIflB8VLmHEArsg2wz5cTxZZWKvltNJe5WZmu
	aziq9Jef1bDcJ4Tcbz8y6rfUg1r9TCkwz8dtZ6LWjjVJwRX+n/OV5NnmroNtz3V+Q+pBAPtp1ft9y
	wGQAAwAzKRyh32yVBQSFlPIVRRoNlS6qCZNRL2XTxa5zo/mmPdKzNeqbVWUhKjKTJGjA/1QzNCk9u
	ROLWzo4zqFBNQriiDT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAVJ-00EMe3-RS; Thu, 26 May 2022 10:14:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAVH-00EMbW-KZ
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:14:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id s14so1059643plk.8
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cJRzOpKgtwU4rrRmVY0G9vrNWq/M/GyTzVQS/4EO73M=;
        b=kw6tfDLlv/2wMtAl9/ySnsycGYMBVDM1PY4gGAFJmWDGBshKOu60vIaSpy3kRN4FMw
         Gdbw158BJWeB3Y6NIV8/WgaWu33kw5ZNXeeUmOLcpArVjyNXTp05Gz90KEH9XYCmkE/Q
         WLNuPNhkkVc3GhXhEElA0IrVKUpp8k1p3YMFQiOeN8sxjQnviRu8VjHp5Kq2yq0hhJmN
         2cwLt1kXhmgncnkwK4FSTbA0e6qwloIzM/tgmpHntFJIznFE/35Ii1v/h2dkSKIqPSaY
         VchGopo3XRBEaT4yg2au7r9Fi0hXPJG/63suLBlwPf4KWkHyneyFsZwLw1jqorBGW5MO
         gVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cJRzOpKgtwU4rrRmVY0G9vrNWq/M/GyTzVQS/4EO73M=;
        b=ALNfIicAuij5KeybrcU++zH0iulVjXc0hXYRKAaUl/HQXdeJdS6B/Oe6DTQanjrl9D
         z5VSpg2sP9O/oXo9FYcUTk2Cm0bm3bh25d1PzkWAgyEn0WrAYK1xpNaTZw6uNglT2QGB
         nGpCnY8XA9trCWxppKN2Kt+qUe764Wuz5F5i8BNaDQr0qCxbajJMfzljSn/3woFcCQJG
         FDTGLnJ2a/ZEMdzttDTCj7esEhe/BRcAZAsp885lpuq4Lek8PU3XgonNeesQibLj2WSF
         yKYJkoNuld/pPaajrXw9Z0ysZGmmJ36wNZKubHEF9vp1vXfhcuf7CXOgByAHPM4Nl/Rm
         mvQA==
X-Gm-Message-State: AOAM531sKo3N1ui3eZTXtlRr4JEZ4YsOBBbrWhkqBZb22oxteghxLWeo
	GxaGPsZYx/CZ2DhNE4AC5S02rQ==
X-Google-Smtp-Source: ABdhPJzZkEDR9mScCjsy8EHki8r7EX5qcp+SQ0l9TAfWxkM5LohggkZQCS3MIz6l/wdl311kgxq9Ww==
X-Received: by 2002:a17:90a:55cc:b0:1e0:c4a7:4a59 with SMTP id o12-20020a17090a55cc00b001e0c4a74a59mr1835936pjm.127.1653560040601;
        Thu, 26 May 2022 03:14:00 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id ce17-20020a17090aff1100b001e09a4afd69sm1090043pjb.7.2022.05.26.03.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:14:00 -0700 (PDT)
Date: Thu, 26 May 2022 15:43:54 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-efi <linux-efi@vger.kernel.org>,
	Sunil V L <sunil.vl@gmail.com>
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
Message-ID: <20220526101354.GA19431@sunil-laptop>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com>
 <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
 <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031403_691397_5FEBCBBD 
X-CRM114-Status: GOOD (  26.89  )
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

On Wed, May 25, 2022 at 06:09:05PM +0200, Heinrich Schuchardt wrote:
> On 5/25/22 17:48, Ard Biesheuvel wrote:
> > On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
> > > 
> > > The boot-hartid can be a 64bit value on RV64 platforms. Currently,
> > > the "boot-hartid" in DT is assumed to be 32bit only. This patch
> > > detects the size of the "boot-hartid" and uses 32bit or 64bit
> > > FDT reads appropriately.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > ---
> > >   drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
> > >   1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> > > index 9e85e58d1f27..d748533f1329 100644
> > > --- a/drivers/firmware/efi/libstub/riscv-stub.c
> > > +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> > > @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
> > >   {
> > >          const void *fdt;
> > >          int chosen_node, len;
> > > -       const fdt32_t *prop;
> > > +       const void *prop;
> > > 
> > >          fdt = get_efi_config_table(DEVICE_TREE_GUID);
> > >          if (!fdt)
> > > @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
> > >                  return -EINVAL;
> > > 
> > >          prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
> > > -       if (!prop || len != sizeof(u32))
> > > +       if (!prop)
> > > +               return -EINVAL;
> > > +
> > > +       if (len == sizeof(u32))
> > > +               hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
> > > +       else if (len == sizeof(u64))
> > > +               hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
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

Thank you very much for the feedback. Have updated as per your
suggestion and sent V2.

Thanks
Sunil

> 
> Best regards
> 
> Heinrich
> 
> > 
> > 
> > > +       else
> > >                  return -EINVAL;
> > > 
> > > -       hartid = fdt32_to_cpu(*prop);
> > >          return 0;
> > >   }
> > > 
> > > --
> > > 2.25.1
> > > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
