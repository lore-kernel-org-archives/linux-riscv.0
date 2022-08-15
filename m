Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AFFC00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHLQVPKsWO+XmfqmyrGqjHgay0IonJjuSedOzoD5Crw=; b=hnqEMvWzaZHSE+
	R4d/FlE9Ecp6d55gnI8SAGx1HSXEipPQcvHDAGa+GqE4nwKnjZkUDAvZ36hrJ7F6iR+z5ONvSq9gT
	a3JyOJs8CKd11WSVsa+BLSeHgb3TDjAym7bHU4pah0VJyC7SNFV26hZoPRLmaTSi64Mu2A/P43/bK
	L5G+YrBaPHYT6wgK+f7LdKKuXhBUnfQfXX6KygmJ2ziMjHB/+GpyET9taYKqgjUDuSwW6R1uRP243
	+FJGrVnCNJ0+FqwmQsuNjE5bo3G9xnz48D+tQIXWghJBIz+vLydseEnhhHiwNM/5dDxrfMugmw6RJ
	x4l+7R0eAJipwiFy3V9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg1v-004G3c-K5; Mon, 15 Aug 2022 19:45:43 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNg1c-004FmS-JL
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:45:31 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31f445bd486so98486977b3.13
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 12:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=aKAUEkS+nxe+8CF3Cg4JzlhCE0M6xQePI/Wm6Vu7wQ8=;
        b=oHDu53VBYdrBxP0O0VnR86YXNBBfpUPpOthxZldcqPDnZ+Ax2dM6/E2D6YUpQvxvzK
         VHQ3fyvr5hJ+nffN1kDZxF4DuihzqpFdhZm8LckcpnUJNiiTVPyN5MxNf0VaXX2csK/s
         ksqZ2/2perzZUkuJNxMJu+l0O9F3KJQFvgTSK5dTgT7f4bH3vtUhJckA2hz0C62ujK4f
         fQufWXGzdZe/carpvrscoOzBYxOOaCIThPoTUipebBddGm7MP1EW6mK7FYJdKD+/gOV4
         1/Jn39vgFs9VokZVpwDPbCY/3zf7BcUe+a88CFXopD3Z5meODzRIOVEAQ6OS7ZES4jte
         13cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aKAUEkS+nxe+8CF3Cg4JzlhCE0M6xQePI/Wm6Vu7wQ8=;
        b=uRZD+QFtoVzYjiLtxXOS4QOFpkwMC9Pj7gQgAAoylFWOgPwVzFDpcyOf5OQoDXdRLR
         3xUuzCrMigC2jLFaTfssWGEJ7ANzmrQ2/rb14jUpw0hqJiftqBLtdNq7ptCEzpsIKxh7
         uJb8ZBSnhb3L0b8+jvJB/0SqSuLCC2eTFqH41Eq6xGvSM8eM87Pxeq76Hg1y5zdLhmu5
         B8iHyKbNfpa9VXLesespi72cfJjtbL+FGatBNuv11MaXtR3jWi5cJEJIeFivjOBMprnY
         U/LWslgwWS3PPDWY1K6ZieKVmYqasTqewjaqK5gYSv0KNJot0B4VnVw7QkhAwaZBPo6I
         l7wg==
X-Gm-Message-State: ACgBeo0DlwadYbH3Oho3AWsn9o9RCuqP7aMnwqZmaQkZ91n7Bt1hVQce
	lB0uIJKWkRJc6GtnkxDCdUsFpE8RtUXNVQAAtrY=
X-Google-Smtp-Source: AA6agR6r36ZxL/xnpPXAmgiVzKS611cTDSGT1HVsjeqfqgBQRurO87Va5m0cLkbjwqM4Gbyd/++Vy9xExcdTjdU9amE=
X-Received: by 2002:a81:910e:0:b0:332:4030:4f06 with SMTP id
 i14-20020a81910e000000b0033240304f06mr2876771ywg.340.1660592721375; Mon, 15
 Aug 2022 12:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <ca555430-055c-debb-fdb4-fa7f78129780@microchip.com>
In-Reply-To: <ca555430-055c-debb-fdb4-fa7f78129780@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Aug 2022 20:44:53 +0100
Message-ID: <CA+V-a8s=RoZmMvDqnBpYZTR2uotv6srumeoRn2=828zhAbOQZA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] RISC-V: configs: defconfig: Enable Renesas RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_124529_237080_4C539619 
X-CRM114-Status: GOOD (  20.36  )
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

Thank you for the review.

On Mon, Aug 15, 2022 at 7:52 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/08/2022 16:14, Lad Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > upstream kernel to boot on RZ/Five SMARC EVK board.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * New patch
> > ---
> >  arch/riscv/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index aed332a9d4ea..de0ccf816c08 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -26,6 +26,7 @@ CONFIG_EXPERT=y
> >  # CONFIG_SYSFS_SYSCALL is not set
> >  CONFIG_PROFILING=y
> >  CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > +CONFIG_SOC_RENESAS_RZFIVE=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_STARFIVE=y
> >  CONFIG_SOC_VIRT=y
> > @@ -123,6 +124,7 @@ CONFIG_INPUT_MOUSEDEV=y
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> > +CONFIG_SERIAL_SH_SCI=y
>
> What's this? The patch text makes this look like an accidental
> inclusion, but I figure it is required for boot?
This enables the serial driver used by the RZ/Five SoC. SInce the
intention was to have a bootable board with default defconfig. I'll
update the commit message.

Cheers,
Prabhakar

> Thanks,
> Conor.
>
> >  CONFIG_VIRTIO_CONSOLE=y
> >  CONFIG_HW_RANDOM=y
> >  CONFIG_HW_RANDOM_VIRTIO=y
> > --
> > 2.25.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
