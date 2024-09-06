Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A46ECE7AA6
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS3yFCdDZ5QArHzIXhsS4w+PWriGWJm8xO2cigmLCFI=; b=V+J0hi3JnVPKXb
	xS/4MI44Wy26DseK+MxxW6EW3RsyyQf5tXkCd083cRUAZtfOfQiF2LeEuvpu2pdghX9Hd8uf6e0f6
	pG7QJV+lBFhPK4HM4h4ZNHT/Y1wVIx3leL2KcSA+JlIfOqA9XOCl8LTNcWH1Lf1z487sQhulg21Ny
	7Ze9+ZgOb3Dx3yfbyKm60AnPDnJ2hZ1ySdOx2whuUjKgKGB19pW8+SOK1hnaZJkuVrvefDlZrUvEW
	8sCOc8GDZnBUsTg2BAim5+MCTzFbR35FiavPOOnOJ5zths/IXrcpZcR+AfyVJO8nFIl0JU66O8z9d
	7L/DmerY/LVDc6l2FtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smNst-0000000AIgq-1knB;
	Fri, 06 Sep 2024 01:35:35 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smNsq-0000000AIgM-1rPs
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 01:35:33 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-268eec6c7c1so680390fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725586531; x=1726191331; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OMgbS41L4QCYKYzW6bBuy48fjTdOYZvxaDewb5mrAAA=;
        b=KqSben3wkigqt121mt+ob8/2HVlRq51eOK3/FPRSNsZIKTwne6BXQW3KddIzgzdPwl
         AMgU0xoQWP5c2WAT+5/mKFDn4fg+cnGfcySJJBFbn/Ac2X7IuduBIjvEl1MS5AlZqgnn
         V0bzhykbR+LUZpzEt1TKHwBTrWJoS6cmdH9y0JuJUaRjoF/K9HsUZupjTyDTxhi1hxqT
         3Ml0mVEE99zWqArKwgcCPxbbujvF+s++o5pWBOb805IFfvr3RHoB9wTdYBCWEZRD60CX
         qe/9PlgolCt/yS9AWy9HFjbiB0Ey9IUTNGv0r+JBUfDl6b9zEJpKPdzku3lni5tF1SQo
         skxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725586531; x=1726191331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMgbS41L4QCYKYzW6bBuy48fjTdOYZvxaDewb5mrAAA=;
        b=Naf3Ix3Xs02NeG0l73OZY/jJpmRv4CPB5slaOE2ixkbJq3YaB8gxRZfNpFeOewMO6H
         0EbvDNNxTRFyBEeCrqcfs76NR/UI8RLR/id2ZG4c3aWwHVJyuBqwtShAjoHyJ6JT+oPX
         aEpP2K3+NdioygXCi6rvywKgRlas4UYfqz61i9WdzxwGfFlb09VgJK/SyeWffcaLUBAb
         vUxJjR9JFtpGoHh3y0zvLCxn+uIw2R+XEYq+WR1RZEinai19sPVanYSePzlqiueVorbj
         kccqSXRE9wJUsRN4htXfMn6hVgKj3SKkxGqMXZ/MesbU9FEb20PXuaj5zKxbMKB1mq3/
         Vwkg==
X-Forwarded-Encrypted: i=1; AJvYcCWMjt57k4duEtoV/peZc8yxn9T4RPEaYH9HcXr0Nxu6nx8ttxyNebHv7yFBDJHsAn2APCH3txm6AksBVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIa6Zr6cXMzsa6TM5e1eFpUCINigVuIIyDCPN26fS/m+rNKNfx
	3AmWPKw5RkAgfmnneQ0N4wn5HvxnGbcM5Gd6JbiFitB+ojzDgaryRBvTQc6hGMvpfDnOjEfTUEH
	B8hrIVnBhaKjoiEW/2lc2SYqlqcI=
X-Google-Smtp-Source: AGHT+IHfjCIHKFZIUvkTEZAvNmlhTTwAGrLTVFkuFCCz9tZ6BL6/rVTGbLGzacJbVMCXomf+S2cSsB2RvS+nLTAMdmo=
X-Received: by 2002:a05:6871:826:b0:27b:6ffd:bfd0 with SMTP id
 586e51a60fabf-27b6ffdc42bmr4273089fac.17.1725586530530; Thu, 05 Sep 2024
 18:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240816101912.1049329-1-zhangchunyan@iscas.ac.cn> <665dee3c-1833-49c9-88d1-9f92475dbb59@ghiti.fr>
In-Reply-To: <665dee3c-1833-49c9-88d1-9f92475dbb59@ghiti.fr>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 6 Sep 2024 09:34:53 +0800
Message-ID: <CAAfSe-uyHNmMU97ZtsSYpUDw4shPx+v32tCY3j3vu2dweOCppA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove unused GENERATING_ASM_OFFSETS
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_183532_509608_066EA6F2 
X-CRM114-Status: GOOD (  22.25  )
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

On Fri, 16 Aug 2024 at 20:30, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Chunyan,
>
> On 16/08/2024 12:19, Chunyan Zhang wrote:
> > The macro is not used in the current version of kernel, it looks like
> > can be removed to avoid a build warning:
> >
> > ../arch/riscv/kernel/asm-offsets.c: At top level:
> > ../arch/riscv/kernel/asm-offsets.c:7: warning: macro "GENERATING_ASM_OFFSETS" is not used [-Wunused-macros]
> >      7 | #define GENERATING_ASM_OFFSETS
>
> So this warning never shows up in a "normal" kernel compilation, but it
> happens when using W=2 (with quite a lot of other warnings).
>
> This unused define indeed seems completely useless, I guess not all
> unused defines fall into this category and we should be careful when
> removing them, but for this one it makes sense so:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I think this should be ready to be merged.

Palmer, would you please pick this up to your tree? Or I can resend
the patch if that's more convenient for you.

Thanks,
Chunyan

>
> Thanks,
>
> Alex
>
>
> >
> > Fixes: 9639a44394b9 ("RISC-V: Provide a cleaner raw_smp_processor_id()")
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> > ---
> >   arch/riscv/kernel/asm-offsets.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> > index b09ca5f944f7..cb09f0c4f62c 100644
> > --- a/arch/riscv/kernel/asm-offsets.c
> > +++ b/arch/riscv/kernel/asm-offsets.c
> > @@ -4,8 +4,6 @@
> >    * Copyright (C) 2017 SiFive
> >    */
> >
> > -#define GENERATING_ASM_OFFSETS
> > -
> >   #include <linux/kbuild.h>
> >   #include <linux/mm.h>
> >   #include <linux/sched.h>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
