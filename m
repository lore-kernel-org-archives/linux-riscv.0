Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EB8C25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y7WsVQLK9P5N39e/h92MYyaW2XgMoHpurUNb9acZgw=; b=QRKmp+1gyq6dfk
	aNLHxtg58RdZP18W1ekdJLaKErqQGqektBMTONwCyNki5VfrC4peYX1+amVNboi29WQK4n+hjBeJV
	gkwsB+Kbbkmci50ftgJavrBAuB41p/qo6CJlwgsCmmfCnMfPNIj4ITolDO9wccSOT7gkEdetzAI6L
	uhbiB63S+4zfomU5A3sXftmwXdTreoVwRaVM1bHJSmOX5YjCCta5x+lffMWUuEHdpEpMK+pMpen/A
	XXEkSfmOy3BbyBeDeRz4mZdkaw+OhOkezrAtRaCpG/ShpHKHECodCGyDgRzK3IYVN64jqKS+jWNYn
	FUn8RGEQXENX2cKPKTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEEX-002gRw-AS; Tue, 24 Jan 2023 08:00:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEEQ-002gQu-KN
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 08:00:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id n7so13009140wrx.5
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 00:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CqSZybdUuskI+UDVH1j93jvIbGoD0+XsFL55JSeaP+k=;
        b=b6H059p3q9xg6E9c9XQB6jeEpHYZpMtkObtgJ6shIqMFcjqV1MYW7qTz6S2CRHj27i
         1TKgxE7c8dtixSqWvF98vecR84mlfuZLI60RrLF4f/I406iDTKwZVOnoEw5xAJYTmbXA
         ngN8ug+S4wFE3dQ0QMTi4BOLCy2P3skctJM4mg9QhlJXWG22To0vkohGxqM4d3MokLSC
         GVmKpV3HRAOgqv8acmEXkW8AeyvWBiigkNMveO4uFIIHS4gK64om7JLDHTT+MlmIdSFN
         gaF9FbDAVVpedWKzzz3zdaZcywtPT71D0YdaPgUDV7O90c3s/sU/LQG5tjrC0EH4xyip
         RREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqSZybdUuskI+UDVH1j93jvIbGoD0+XsFL55JSeaP+k=;
        b=lHLsRK23h2MiV0mcKRp7tmcBPG0I3Qoy2kZoBUJ4ZywYjB/O51zJwxkWyPY9FGFaQ2
         BsOX/+4T1DpBvYHTMSE1PjTQIkecLG/SDq1x2JQQXgBkkAXQeA1wGMrIm4Hp5p+LbbiZ
         jKPSzVA5M+jkpZtNVif1Ab1b02BovspB9Q5XO5lw979hLL7md/YI8eaBx34A0JpKpo1c
         0e5VH44TMGrKDfTAvoY/DJgd7ypRWUqd9eIGGD1EL1hAduF+54YU82iC/uOgDCIQ7qpI
         dRmdPMNDkJ0utaUfJSYutduzkouRa1UY11DTvvx7DA/YH1zgcQCR7CezfLkBW24lqpRe
         3XyA==
X-Gm-Message-State: AFqh2kqY1SjHh4wDicBL6YOGUqeuiVjrUrlda2YKHGyRQbW5sKZfHsbP
	q1ilcnWZ2Iu53YuciEZWxnMVixFn+ftx+x1JI2I5/w==
X-Google-Smtp-Source: AMrXdXvPLscFw4dlQnNZxaTZSeeo5RV7pn56CWqRBz3ECJ7Gfy9qulLKrkg3tXoRsE2OvYfbItKgsSpGdywsTmb1+NA=
X-Received: by 2002:a5d:5190:0:b0:2bd:d6bc:e35c with SMTP id
 k16-20020a5d5190000000b002bdd6bce35cmr1218375wrv.144.1674547236441; Tue, 24
 Jan 2023 00:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20230123100951.810807-1-alexghiti@rivosinc.com>
 <20230123100951.810807-2-alexghiti@rivosinc.com> <Y88HD2ocLQilIuDr@spud>
In-Reply-To: <Y88HD2ocLQilIuDr@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 09:00:25 +0100
Message-ID: <CAHVXubiSJMyeuy253wyFALQ0DzDn_yuuR4HWKy9rmGYLNeXpKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] riscv: Split early and final KASAN population functions
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_000038_924670_0434C9A1 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Conor,

On Mon, Jan 23, 2023 at 11:15 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Alex,
>
> FYI this patch has a couple places with spaces used rather than tabs for
> indent.

Damn, I forgot to run checkpatch this time...

Thanks,

Alex

>
> >  static void __init kasan_populate_p4d(pgd_t *pgd,
> > -                                   unsigned long vaddr, unsigned long end,
> > -                                   bool early)
> > +                                   unsigned long vaddr, unsigned long end)
> >  {
> >       phys_addr_t phys_addr;
> >       p4d_t *p4dp, *base_p4d;
> >       unsigned long next;
> >
> > -     if (early) {
> > -             /*
> > -              * We can't use pgd_page_vaddr here as it would return a linear
> > -              * mapping address but it is not mapped yet, but when populating
> > -              * early_pg_dir, we need the physical address and when populating
> > -              * swapper_pg_dir, we need the kernel virtual address so use
> > -              * pt_ops facility.
> > -              */
> > -             base_p4d = pt_ops.get_p4d_virt(pfn_to_phys(_pgd_pfn(*pgd)));
> > -     } else {
> > -             base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
> > -             if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
> > -                     base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> > -                     memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> > -                             sizeof(p4d_t) * PTRS_PER_P4D);
> > -             }
> > -     }
> > +     base_p4d = (p4d_t *)pgd_page_vaddr(*pgd);
> > +     if (base_p4d == lm_alias(kasan_early_shadow_p4d)) {
> > +             base_p4d = memblock_alloc(PTRS_PER_PUD * sizeof(p4d_t), PAGE_SIZE);
> > +        memcpy(base_p4d, (void *)kasan_early_shadow_p4d,
> > +                sizeof(p4d_t) * PTRS_PER_P4D);
> > +    }
>
> ^^  here.
>
> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
