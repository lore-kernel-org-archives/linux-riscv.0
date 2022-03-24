Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEBEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdD5sykjvj1dwnq5tQW7I/e0GQTved0kCjPnbOLathU=; b=zR8ZYJK9eSJNoB
	wmm8caPmsho10mu6QoQVeysiQPS9XTFgbyDWwB3j2JNseAkTw1bVNlEQ7dCJ9yIxi9ckZBmNxsoWu
	3VpvbI1w/S6tnjnXcEVPvhOgey9qGSIjVIRJbfkdT/4OJ6jafgzp11WcLhVksqmg4uZIuwtx2oM+m
	M1+goGhkRprNU1YAy+Laj1OBIOWbMRwFA9IRZtrSa/f9Ll/hCDbctDEdGLg9pfNq3vDkuB4mnb8EX
	+Jb/GHbPsJ71CrnyGAd/rKzkdawGOfRAwJC9Vd9QnzSTP12DFxckVaY7qwOaFO31aBAvTmOZPeEZw
	LkP+CXbLnxD51TqPgBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXFzb-00FdAr-8U; Thu, 24 Mar 2022 05:26:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXFzY-00FdA9-IV
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 05:26:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u3so5019749wrg.3
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UPHKSpU1uD0rrViGw+MJCaYsmsBqORLnJdi+EK4GXp4=;
 b=4erF0JJbyt2usIgCKQ+imVSaTwbCFuBUBSGC3nf3baGYXKVVnqcBre/vafj4XWaU/G
 XnT5YQsjvDnYmtg0ZOjzSlQV/ibKnYYjeu5Rah+WHNBj8QOT6ejLJ9ldrp3YsgU52hOl
 vT2/5QBVuiYhOK05YbvSgODYIO/mPAOvWwNVinxg11KAJSqJ+xfrKlFCjLT7hEfG7f3E
 9diC7FDnPlwJW8PMl9tHm5RX41GmhV8r0OFzLlNnksrcoz5tL/3kwlbuMWgCmmdGACWA
 rmL98RDvkILYLzFhUFiZz6QdnTddy/EM1BluEwHFcFeODsfvxsFhXQyKj5VeFbm29xz/
 NZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPHKSpU1uD0rrViGw+MJCaYsmsBqORLnJdi+EK4GXp4=;
 b=EPOeqUWQkVQr8YocWHtE3B3lndn52Nsw5LG+Nosbh8QyKfm/fxZPijJH5UxtlkelTV
 UQDbv9OxsOP1DwXTAiWrHMjXwgGrh3d72aFGSUz6z//8wvwsnCmC1FFX/cmJDmxfmfO+
 RYAxbiJ+LkcE+kfDidQBkQIoTMjI9EstuuxUtRHY/j2WzewvDVMIenBcx/pAEZT7UTZg
 dhzHUPx3EdflEzCu+8M77qk+bYs2SWMS+eMiZBWxhk9kPCueIsliN5c3JDxZU52d7Cq2
 vVSxkzODH+hcUC39DA8W65AS5METLUb5etL6iwzjRkY+N4X013uG3sBsQJnXerSmsuKQ
 CGLQ==
X-Gm-Message-State: AOAM533k8gUiZJy441neUqgLh2YY2yrDxOISmWCHe8fFEP7iWmGA21Ho
 UffX7n+m9k/r7L6OGhczpHW1To2LdEx37w6jmGI1y7drdUA=
X-Google-Smtp-Source: ABdhPJz3Mtc/BV9i1Kk0ZAafNaEBUtgYnsIvkd3WulJaS+i+A9mMD6+aniomgb2QMiOyr0HCbldKqPciea7+9bXnEtA=
X-Received: by 2002:a5d:6ac9:0:b0:203:de0b:295f with SMTP id
 u9-20020a5d6ac9000000b00203de0b295fmr3003827wrw.86.1648099594672; Wed, 23 Mar
 2022 22:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220323090025.546808-1-apatel@ventanamicro.com>
 <CAOnJCUJnc3VJq3PRn+wTMTbf2N5VdJs_uPjRyWTs-EKuC_190w@mail.gmail.com>
In-Reply-To: <CAOnJCUJnc3VJq3PRn+wTMTbf2N5VdJs_uPjRyWTs-EKuC_190w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 24 Mar 2022 10:56:21 +0530
Message-ID: <CAAhSdy0_9kL-TLCiB-tJ0bzRCmbaahyUKj09Jone6CipZvZ9Pg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable perf events by default
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_222636_675192_617B4E4B 
X-CRM114-Status: GOOD (  16.54  )
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

On Wed, Mar 23, 2022 at 10:04 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Mar 23, 2022 at 2:00 AM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Let us enable perf events by default in RV32 and RV64 defconfigs
> > so that we can use RISC-V PMU drivers on various RISC-V platforms.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/configs/defconfig      | 1 +
> >  arch/riscv/configs/rv32_defconfig | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index f120fcc43d0a..57aaedc7cf74 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
> >  CONFIG_BLK_DEV_INITRD=y
> >  CONFIG_EXPERT=y
> >  # CONFIG_SYSFS_SYSCALL is not set
> > +CONFIG_PERF_EVENTS=y
> >  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> > index 8b56a7f1eb06..21d422e740d5 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
> >  CONFIG_BLK_DEV_INITRD=y
> >  CONFIG_EXPERT=y
> >  # CONFIG_SYSFS_SYSCALL is not set
> > +CONFIG_PERF_EVENTS=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_ARCH_RV32I=y
> > --
> > 2.25.1
> >
>
> I think it is better to enable perf events by adding CONFIG_PROFILING
> to the defconfig similar to other ISAs.

Sure, I will update this patch like you suggested.

Regards,
Anup

>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
