Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F370C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiE2R8VtbK3MMbuKkkseMYMHsonDgxqljQ92uGytcWE=; b=B3VCtVIRl6unvw
	KQVGZzt3wTpcV9fRJX/6VehK1DH3CvkTwdhreF8dRjIBvUzl8fdGbHTQ4Z4RjdvwHw93x9rrvPoHe
	915O4WA/rru5OcuIle78ytAJMGc8s57s8kAEFoBZa6O7rt2zbjJsUplSsthMFJXwdDejmYQnAP6uL
	qkfI2qLsgaG6x8MBZlt748enQiRDk9aY1FGCwOsera4SYnd8bqFND0Hh9n4y7PKBxEjv+v0NfwOYt
	Q865kmdNSLy/fCIT5C7F1JoFO+ZxX1qdy72wJH8nmszSXiS1urG7NohciAk7VJjyQEyoyNKjdRvdD
	73/K/xO4Tqg169JdblFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIha-004oIm-35; Thu, 08 Sep 2022 14:40:22 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWIhX-004oFv-Qb
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 14:40:21 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 130so26737426ybw.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 07:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=P6etuL406xLRhT6RqJwslD+tK1bv2bUyoaOC1vIESrQ=;
        b=O7auhBhG7nxbGY34/Uxjtdn3WKa+7mB6yfQqIFe4x0OwSVxuqbTI0a7XpqHZl+qGjl
         v/ztxcw4PGowK8XQDZJ85NQsGMFU+nhf+4Rj6XloT7dXP6SKyIuTcDO1CWY+MG8maIts
         vu4AGwuE9yPyNwiToDAW6uOq2n4ZfgTiaTE1BEW8EQzTAenoM5lN/YtoAbSgid/W9UcZ
         KMh1dco6H3N68pTCN/vGZuauX05Pg3FspKaE80UDKPtfwR2N8LffSYUjhADQW2NMHlpD
         KRyAK9Ni45PHdEY6JlRZ0RgKUJs8OcVXqZRLhYeAXAIokd3607h/95knWVh8afYsysxc
         s2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=P6etuL406xLRhT6RqJwslD+tK1bv2bUyoaOC1vIESrQ=;
        b=2ZM9NJvJDJBYfQ7CT6V9arGcR/vA4KTvf1Rixk7MXP/xfpJTsmMjwyKr4AIXfnbfAI
         g86SyfUD74dLHsRwx/FxJpFBbTkRZPPwu6vOxRqUGO8SQWLSJRDIIhUYnqXE1LK0TsXl
         jv9V1Lor6ItTGu7AmyJK3IbcUhi4mJO1VYwMMp4flFMWjqgAKJ80Na9uQCZ0zn3EWoQQ
         S7yPh11f78ORkCN3LCX3z9vqQ9OS8/g2VOYrVf5YU/CL+Silv8WjgD1sXdv49ngY9EVY
         HPG1J2MBOWvtDTHa9o0A1bXLiozmAm3Vi+Ym2Zzhrb4VJMSo3u2tvg+Ugt6Rh5BrahF4
         2+0w==
X-Gm-Message-State: ACgBeo2iEkfLS3l4Mm0trXb0OQnYbbeWeBoZtk8546xSCVdlIm2ORp2A
	lQDkqA2vEMi6RCv/7z8Brx/f+Ykm40i4rEy0/Lo=
X-Google-Smtp-Source: AA6agR7UZHUk270jZt+chAm9rm9ZheP07KjHt6vNXD9pMgs6BeYqfa8JQMvKdUhJpTPAuGK13ZGmu2capesX8rTXTyE=
X-Received: by 2002:a25:83d2:0:b0:696:1071:1a01 with SMTP id
 v18-20020a2583d2000000b0069610711a01mr7807235ybm.335.1662648015777; Thu, 08
 Sep 2022 07:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com> <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com> <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <5e894d87-8abb-540d-fbd6-8a1d6f9d0e91@microchip.com> <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <02df5db7-99bc-5476-2530-4237c3904933@microchip.com>
In-Reply-To: <02df5db7-99bc-5476-2530-4237c3904933@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 8 Sep 2022 15:39:49 +0100
Message-ID: <CA+V-a8sBvS6Xp0vEV__GTMu-qqy3QJoFzr+F42tL7jkTDszWYA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
To: Conor Dooley <Conor.Dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, atishp@atishpatra.org, 
	guoheyi@linux.alibaba.com, guoren@linux.alibaba.com, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, atishp@rivosinc.com, 
	apatel@ventanamicro.com, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_074019_898467_5F4B927E 
X-CRM114-Status: GOOD (  28.63  )
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

On Thu, Sep 8, 2022 at 3:04 PM <Conor.Dooley@microchip.com> wrote:
>
> On 08/09/2022 14:01, Biju Das wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Conor,
> >
> > Thanks for the feedback.
> >
> >> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> >> configure the PMA regions
> >>
> >> On 08/09/2022 09:39, Biju Das wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >>> the content is safe
> >>>
> >>> Hi Conor, Atish,
> >>>
> >>> What RISC-V devices you have?
> >>
> >> A bunch ;)
> >>
> >> A __couple__ PolarFire SoC boards, HiFive Unleashed, D1 Nezha, Canaan
> >> k210 MAIX something & the VisionFive.
> >
> > If standard DMA api works without any issue means, on these platforms
> > IO Coherence port is enabled in the hardware. So all peripherals
> > involving DMA work as expected.
> >
> >>> Ours is RISC-V uniprocessor without IO Coherence Port.
> >>
> >> What does "IO Coherence Port" mean? Zicbo*?
> >
> > The HW will provide coherency between CPU and peripheral.
> >
> > If Zibco* is uniprocessor, then highly it may not have IO coherence
> > Port enabled in their design.
>
> Zicbo* are cache management extensions as Geert pointed out.
>
> >
> > Guo, Please confirm.
> >
> >>
> >>> Currently USB, ethernet, SDHI/eMMC doesn't work with standard DMA
> >>> api's.
> >>
> >> Sounds pretty similar to the D1 so.
> >>
> >>> On RISC-V world, how do we handle DMA api for uniprocessor without IO
> >>> Coherence Port?
> >>
> >> If you do mean Zicbo* you're into errata territory there & I don't know
> >> if that'll be acceptable upstream - not for me to make that call...
> >
> > It is not errata for sure. It is a HW design where we don't have
> > IO cache coherency port enabled in the HW. So looks like it is not
> > an extension or errata but it is core stuff.
>
> If you do non-coherent stuff that is not Zicbo*, the precedence set by
> the D1 is errata. As I said to Prabhakar earlier, do a
> `git grep "ERRATA_THEAD*`. I am not a maintainer so I don't know the
> "rules" about doing cache management without the dedicated extensions
> are.
>
Maybe we could have a discussion about this topic at LPC too ;)

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
