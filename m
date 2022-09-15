Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EFFC32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai3Mtmkg+j0sAlAi6Xh9KuWzrPwAUOd2DinHg7ywhGI=; b=Se1gFzuzzYrV6A
	h//cCaQZ0jbbaA3+oEzVTmJizbWeOyykDstYBMLE1sZTHcXDsgQVMWYlKE1/oQE0U+unlGJ4k5+TI
	gpt17nBL67ikpCATgf4aCNQz448APfVz5Utgh9YFANxD871exlEKV046Pot8mR1HPJhTlw7DwbOea
	kKtrEMiYCBF9v96INWoOHn+oqaVRBwaqlCOz0PsRDLxMo08bLW+0hDkRj3Z/QoPD5Ghm/Lpe0xl9X
	q6JgjUFIfXeaV5jsyodYvasJWjTZae+oMrAs7Wno99JvGZ6g8zT4jOCsBSIpZPl4wqhOH+9vLxAEK
	1BFfHVJOP6hKJH9NZ1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxiB-001QIO-P6; Thu, 15 Sep 2022 22:51:59 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxi8-001QEH-6R
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:51:57 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id a67so29955438ybb.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 15:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=o1EVXmyOGUfFQkox8g7eU5ep5qYnL2D0Sb1HeWjL6OI=;
        b=CmEDtGhYhc+kSiKpnXWIzm1IaPnUZh0/4urfe+lEcZBnQO8ynI9TceiVqOUvUmzQda
         OQ4FTVbHwsz1dNV9fNIaZdVwUajnWpUnTW/uAAONievZjeYZyT/65z/OtGUe/yyTKoxU
         UfUxHdctbG8/tZL7pWiZjLS5gZwhMoZcyooqGxn16AO7w0sjfXZzlKCiGDBH1epIDbsF
         JKehjj10NX0KgdxS9k5J+dGnPY95YwvDewuoc+vtK9UW3/0XuWx5UeYM54dHTRy5RrRb
         2stDthatvNV2TYzS1sYlclkII9xrg+gQzw8Q5+aVpYgVSwpeRCwwGPfJxEoDqSD5NEW+
         2yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=o1EVXmyOGUfFQkox8g7eU5ep5qYnL2D0Sb1HeWjL6OI=;
        b=IJFvFr9TK+mQTCrZOyl9OwkxUuWX1EjCx3L9VGBKuEHDkkd1vFyOpuxet71E3Z776d
         lH9UDibM1kFJMOXyGEpRj8k/rX54FOaEDfr1t2L2JMpwssc3ron9EOQjQSbYuD8JiS66
         CyWU5DB8c6QU4SM3DtQf7d8wcoAI3sr9duP4Ou9yNtp0AocJJ+BXlNbx5atRBwGvvSQ/
         Kqgxl/ZDiQNFT1a3POLH2mH0ckIWkSBguNH/wZrBzUB0F5PYibAcUVw2hCZ1FuY0ZZ3D
         kRHz5kbZgyBHjglooWrUYqrelyLeB2d5K8QkEerks4wVZX8/O8zssuA6u99XL/oltvGp
         xT/w==
X-Gm-Message-State: ACrzQf3AyTFmbcl8yifXEQ/GeAqN7CXDTbirnrloTivolzDNLyxJaGfA
	g0oU19wMN00QaN1tlOxsTbc1yiccA2Q4+CXsx/g=
X-Google-Smtp-Source: AMsMyM6fMB5rSpVPOQBw4/ro/bIVfsiOS1VtXuR20b64oyEoe9sQv/Tfxv1POcyhHFztI/g3eCFqxVV0iHYOCWc9leI=
X-Received: by 2002:a25:3c45:0:b0:6af:f2b8:e15e with SMTP id
 j66-20020a253c45000000b006aff2b8e15emr1997729yba.299.1663282313489; Thu, 15
 Sep 2022 15:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ce1bb9c5-c1e3-b6ff-ec8f-c9ae1f0bf3b4@microchip.com> <CA+V-a8tWaKPNmNjJY6sX1yyUz1V5S7JXP+Eenxo4jOtu7uXXLQ@mail.gmail.com>
 <cdd42171-872c-cb6d-e540-240b233b74fc@microchip.com>
In-Reply-To: <cdd42171-872c-cb6d-e540-240b233b74fc@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Sep 2022 23:51:26 +0100
Message-ID: <CA+V-a8thCFB1OBeVBecCEHw2ZVcKQRq4Pe850BVHU23uESBjtA@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] riscv: dts: renesas: Add minimal DTS for Renesas
 RZ/Five SMARC EVK
To: Conor.Dooley@microchip.com
Cc: geert+renesas@glider.be, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de, 
	atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_155156_278360_743264F5 
X-CRM114-Status: GOOD (  26.14  )
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

On Thu, Sep 15, 2022 at 11:44 PM <Conor.Dooley@microchip.com> wrote:
>
>
>
> On 15/09/2022 23:41, Lad, Prabhakar wrote:
> > Hi Conor,
> >
> > Thank you for the review.
> >
> > On Thu, Sep 15, 2022 at 10:56 PM <Conor.Dooley@microchip.com> wrote:
> >>
> >> On 15/09/2022 19:15, Prabhakar wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Enable the minimal blocks required for booting the Renesas RZ/Five
> >>> SMARC EVK with initramfs.
> >>>
> >>> Below are the blocks enabled:
> >>> - CPG
> >>> - CPU0
> >>> - DDR (memory regions)
> >>> - PINCTRL
> >>> - PLIC
> >>> - SCIF0
> >>>
> >>> Note we have deleted the nodes from the DT for which support needs to be
> >>> added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> >>> board DTS/I.
> >>
> >> idk, I am not sure what to think of this approach.
> >>
> >> What do you mean by "for which support needs to be added"? If the support
> >> does not exist yet, then is surely you can just add the nodes and it will
> >> be fine?
> >>
> > As pointed out previously, I am re-using the below files [1] (SoM) and
> > [2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible. Since
> > [1] and [2] enable almost all the peripherals (status = okay)  on the
> > RZ/G2UL SMARC EVK which are supported. For example [1] enables SDHI0/1
> > this high speed block needs DMA and without cache management fixed on
> > Andes core we cannot enable this on RZ/Five SoC so currently a
> > placeholder is added for it in the RZ/FIve SoC DTSI and is deleted in
> > the board DTS file.
> >
> > Below blocks suffer the cache management issue:
> > - DMAC
> > - ETH
> > - SDHI
> > - USB
> >
> > Rest of the blocks will be gradually enabled (as soon as this initial
> > patchset is merged) along with the DT binding doc updates.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5
>
>
> Explanations are reasonable, but again - that information is important
> and really needs to be included in the commit message etc.
>
Sure, I will update the commit message while sending the v4.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
