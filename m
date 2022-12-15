Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQn6z2AAD4GBdIwJ2JPmESjIJL2z7Yno7kp83VgDxpk=; b=sJ5t2zpkGx3yZP
	9bDj8n9xgh/Uy6XABeoEKNDfuiCtH5co3nypT8r4eTcuLLr7UaZFgTSiwTiwoGrtwM3r4wIEIUiKm
	gkvU4qbZmiTCtXZI16KS/w5NjKJSCHn+gGtbRj7WNxkpTHK8yviEp4ItpyQM01ClaBReF5/MUoLyQ
	WLBR+TQ3cY+mbMdIewvnCJo72ug7aolTy4YmmT7fARc/A7O+q903g7vVCPsYxonn9KgaNcorXeV14
	Dqr+veQUuhNVMimfhehF5WzorXBK1+mRHrcdqvxB4Tj4KOcYBOHt7R6BHhM5JsaS74lrmnK4oflE3
	GfvateX+3q/BMFb+W+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kAe-0080vy-IE; Thu, 15 Dec 2022 09:04:52 +0000
Received: from mail-vs1-f50.google.com ([209.85.217.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5kAb-0080ru-H1
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 09:04:51 +0000
Received: by mail-vs1-f50.google.com with SMTP id k185so2328748vsc.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 01:04:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lu90K/ctwOLQV8gWvT0jknM3Lq9BYGH2KzhYwJnHx5A=;
        b=uaGXfh9cennMu6Q9ZUUcQqHAF9VuRvQu6LLnn8MO1KPCc3tUeqBYcV2ldPbHKv7a8Y
         6f5/QTE2byv3Glmi2Nu0qGwzUkTmP0mjZrmdt/vq7jKTyxUQKKDRs2lpl4HZcxO+G5hR
         1ftRCLCn5YyMszXR6zY0EP7DqOxFtMMsMITk9EG4R0NrgLCIVIzcoU31UO/RT3dVvKfU
         p9CGqIP4SyDeAljfYze5wkuMF//Tz2/p021aQ8INGknxljFO4KQS7eGDjewhrEa92yy5
         7UjlCWdaKBzsOQSbPQcYgfdXM/lwC2ZVKQEPk43Ysby7pmHMM6j6gOwJ0MAensN2CHdm
         QPeQ==
X-Gm-Message-State: ANoB5pmpLBpKNPdh45GQ7kMaVv2FL2K3RQq5ggSHAekGR4Rtf6Uik/gz
	UUDZecWkiD5UYK0k2f6F9BG5hB+FlZbFuQ==
X-Google-Smtp-Source: AA0mqf6qR+WDSsZXjriWGw6BRKFVCReyLctIfDxLP468Zs5dn42Pad8KmNHWuDSpISLNe0wIdGz3nw==
X-Received: by 2002:a67:cc08:0:b0:3b0:f68a:6c93 with SMTP id q8-20020a67cc08000000b003b0f68a6c93mr15490303vsl.17.1671095086789;
        Thu, 15 Dec 2022 01:04:46 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id bi35-20020a05620a31a300b006faa88ba2b5sm10164269qkb.7.2022.12.15.01.04.45
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 01:04:46 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id g4so2732295ybg.7
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 01:04:45 -0800 (PST)
X-Received: by 2002:a25:d655:0:b0:6fc:1c96:c9fe with SMTP id
 n82-20020a25d655000000b006fc1c96c9femr34391603ybg.36.1671095085279; Thu, 15
 Dec 2022 01:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20221214180409.7354-1-palmer@rivosinc.com> <8DACBAC8-F220-4DA7-BCC2-4E2ED9E3E03E@kernel.org>
 <b8665f9d-44cf-5719-c206-5eb622978b1a@arm.com> <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7019D761845E3AC9E30F2D2DAAE09@OSZPR01MB7019.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 10:04:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
Message-ID: <CAMuHMdUt7coFBx-+mXJcf7E0f5S_Q_Rmb6VVq-4E7_m99GXyRw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Conor Dooley <conor@kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	"arnd@arndb.de" <arnd@arndb.de>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_010449_588152_E57ED8B9 
X-CRM114-Status: GOOD (  27.04  )
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

Hi Prabhakar,

On Wed, Dec 14, 2022 at 10:40 PM Prabhakar Mahadev Lad
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> > On 2022-12-14 19:46, Conor Dooley wrote:
> > > On 14 December 2022 10:04:09 GMT-08:00, Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > >> Without this I get a Kconfig warning and then subsequent build
> > >> failure when building allmodconfig on rv32.
> > >>
> > >> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> > >>   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64
> > [=y])
> > >>   Selected by [y]:
> > >>   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] ||
> > >> COMPILE_TEST [=y]
> > >
> > > This here is your problem afaict
> > > I got a report from lkp about it yesterday, "blaming" Prabhakar for it:
> > > https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > > .kernel.org%2Fall%2F202212142355.b7vf3Jh0-lkp%40intel.com%2F&amp;data=
> > > 05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7Ca51ccd27ccda45e7
> > > 53c208dade16c553%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63806648
> > > 6632283001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> > > iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=FshRCpnIoU0b
> > > c38MYnesotcgOV4JT%2FXVOidbDMpAWbc%3D&amp;reserved=0
> > >
> > > I hate selects, just ignores the dependency :(
> > >
> > >   && !GENERIC_ATOMIC64 [=y])
> >
> > I think the existing assumption was that ARCH_RENESAS implied !GENERIC_ATOMIC64. If that is no longer
> > true then please feel free to adjust drivers/iommu/Kconfig to suit.
> >
> IPMMU is not available on Renesas RISCV SoCs, so maybe something like below?
>
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -283,7 +283,7 @@ config EXYNOS_IOMMU_DEBUG
>
>  config IPMMU_VMSA
>         bool "Renesas VMSA-compatible IPMMU"
> -       depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
> +       depends on (ARCH_RENESAS && !RISCV) || (COMPILE_TEST && !GENERIC_ATOMIC64)

Negative dependencies on a symbol like that tend to need future
extension.

What about

    depends on ARCH_RENESAS || COMPILE_TEST
    depends on !GENERIC_ATOMIC64

instead?

That does mean the question will show up on RV64, too.
Adding

    depends on ARM || ARM64 || COMPILE_TEST

(like we sort of had before commit 97215a7df4351fdd
("iommu/renesas: Expand COMPILE_TEST coverage")
would fix that.

>         select IOMMU_API
>         select IOMMU_IO_PGTABLE_LPAE
>         select ARM_DMA_USE_IOMMU

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
