Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B733ECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oh0JPdsbTWPEE4W4AiTus4NtpUKYIHyf0bDR9qIq66g=; b=XI4E/rMcz/DxJD
	BkJrvfHz8ZCH26SJ8RcrIJaO4aXMWo+WZE/Ppau9Mtx4UzMRsorNOmrn7kcewMlieNVbuuVLzi84i
	PtK5gNS17aE5IUVQjUKNbpZyWG+mgkqJvYZBGBboouv6YH8pxSM/aCfGxehLvKVRqqqYcLrw7pqzc
	chLw78k6ZPMjHXSNxAkjg3Eccyx5DO3ZAAakPEHsWNdMjqegs+fJyyDsET4IGYw5AyhMUXKSX12Cp
	5iVsz4rgEBe8SVB2sPecPCrPbx7+XJJRlVA6SNJH6XPlLUx8xJfGamxf+MfcuX0mzk0Ht1N6LI7uZ
	NHZTyPzhCT/Tbiz5PUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxZ0-001IxZ-RT; Thu, 15 Sep 2022 22:42:30 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxYx-001Iw7-Ia
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:42:28 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id p69so23232794yba.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 15:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VZkLrzQnH90/ZOn6VC9U1uJcYyUQoQOz40iJvaUx3Xw=;
        b=ALpTpBfZaO6EdxZJ3PRguyDjIOgqUpDGKA9rSQWz84KweFNQ7PB0WIAoO1bHDMVYnT
         cwqGEvu/o0hsiWxTsTlrFUxZLhKFT7ZaOo5cKGLwrRrEylyP29uQtlBJfDn1BO+WFCBz
         B9kxEW9v/rIBNKkoWzzds7giiw4/jY6t8/oC3GDP7WdNDxlJz9Yml6SiSyiGBaSFpJU3
         HktmJd2zML9MdGbjxCPpj0tUKbeNSNHRyThR8sLXu9LtcMeCaJpp+YVD8zgny4O64UIY
         NgEb09+NBp3msOjfzu4rdIoppluNfOX3zWDJNWMMFwsyMGHFfL5lY90g9m8JY1xnwgbB
         oS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VZkLrzQnH90/ZOn6VC9U1uJcYyUQoQOz40iJvaUx3Xw=;
        b=NugQbuQQDmUFBct3OJnflGFbqa9+37Spg1QmNAKsRsrBtUjiXU1WQjTMv+hkt13xoI
         KzNyLddOeq53pFY+IvnaymnRTAK2MrGg30TXxvs0/hmoqH/82MoWn/Dvt2QbvJyiyuP0
         WEgkoZ1u5DTlpAyynDJZ+fRtMmnNsv/0FJFr+cOZcR6bCx5ldAruO/A+nqPhSwbN3SDg
         Qeg6vCcoCGqrhCOBkzP8Zzg0Vvo9p2lUVeBZhcyXlUdErSFo4fsTsyv2R+GcpAVG3Z0K
         aHoQbvuHfLA+DG6S09PnQsMbTbXm/PokGl35SgR3+1vGEuhzcfOR84frrlCjD/XAbwDy
         Toyg==
X-Gm-Message-State: ACrzQf2Yd7C/eF4DetN8TUM8Kz/PqRRnW3HmsaTueWzcX0+LNRx1fsNP
	dj8DadwnyQi2GA4KotAKEVjLJp5U1UdkQCdeKMMge/9KS0jNAQ==
X-Google-Smtp-Source: AMsMyM6JRqPOyYQGKlzh/X2UUL4/D8J4GvS5ObaPp+Rfit/kiHbrpelPKbIn/EfXcNYewcJF+fH67RvyKrUCIeddfeI=
X-Received: by 2002:a05:6902:1007:b0:6ae:6cd5:4b0b with SMTP id
 w7-20020a056902100700b006ae6cd54b0bmr1962121ybt.354.1663281745095; Thu, 15
 Sep 2022 15:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <ce1bb9c5-c1e3-b6ff-ec8f-c9ae1f0bf3b4@microchip.com>
In-Reply-To: <ce1bb9c5-c1e3-b6ff-ec8f-c9ae1f0bf3b4@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Sep 2022 23:41:58 +0100
Message-ID: <CA+V-a8tWaKPNmNjJY6sX1yyUz1V5S7JXP+Eenxo4jOtu7uXXLQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220915_154227_633613_1C24F83D 
X-CRM114-Status: GOOD (  19.57  )
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

On Thu, Sep 15, 2022 at 10:56 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/09/2022 19:15, Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable the minimal blocks required for booting the Renesas RZ/Five
> > SMARC EVK with initramfs.
> >
> > Below are the blocks enabled:
> > - CPG
> > - CPU0
> > - DDR (memory regions)
> > - PINCTRL
> > - PLIC
> > - SCIF0
> >
> > Note we have deleted the nodes from the DT for which support needs to be
> > added for RZ/Five SoC and are enabled by RZ/G2UL SMARC EVK SoM/carrier
> > board DTS/I.
>
> idk, I am not sure what to think of this approach.
>
> What do you mean by "for which support needs to be added"? If the support
> does not exist yet, then is surely you can just add the nodes and it will
> be fine?
>
As pointed out previously, I am re-using the below files [1] (SoM) and
[2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible. Since
[1] and [2] enable almost all the peripherals (status = okay)  on the
RZ/G2UL SMARC EVK which are supported. For example [1] enables SDHI0/1
this high speed block needs DMA and without cache management fixed on
Andes core we cannot enable this on RZ/Five SoC so currently a
placeholder is added for it in the RZ/FIve SoC DTSI and is deleted in
the board DTS file.

Below blocks suffer the cache management issue:
- DMAC
- ETH
- SDHI
- USB

Rest of the blocks will be gradually enabled (as soon as this initial
patchset is merged) along with the DT binding doc updates.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
