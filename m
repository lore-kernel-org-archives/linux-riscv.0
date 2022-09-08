Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DE7C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 13:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCHJO3hcozkGSOrjvkYJ9GWThJ49lmEPSJnVi2I//Rk=; b=3XLxqYzyh1Rkm1
	Pl3ychAcpbwstyfB7YxcciwPckSGhOEqo+crKEZnsro/JARZsYR0KeAMhEusM6wxi3cPBnqLV4gFT
	ZLRUb++k39Uq6g1+0dNfMQZLCvSnWOKe0jz+M86kI83EJWcExi4IbVp+YxhSXq6IFQ7RrLGecwPYA
	fSN+UVpmVp4IQQF5d8gGM+Ho4Qi7GvkIbDveASGg5EVkO4r7ySvNzpDT9+W+CHhaGV4O61CtvLZ0m
	POGyF7t9DL1ZMu7Sxrd5QSCTSYu7iWUoKudVWvA2y2TPBAw268ItGuFxLBAsJ8M4eWtM8g5UAKx5R
	Qu3BiA9VT/u9lpAOUubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHSK-003ip3-NS; Thu, 08 Sep 2022 13:20:32 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHSH-003imu-60
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 13:20:31 +0000
Received: by mail-qk1-f172.google.com with SMTP id k12so133050qkj.8
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 06:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nH7L3KimhWKQ6v9V2FWln1JYYf97pWD4ktksM0pFeVE=;
        b=uI3if9SInHPz7E7ITA1tCNnAKBW8/roRq1mEV/jdbAJo2RWEo6QVUCvIkgkM1SAxrx
         VnqYOQus4tO9WxqLC6sulyFISj/Pw4PLnkQQrEjCKUQfcdLsn5Slr6ttrVrVJqFqI0Im
         rs0mO9OXQyCUVoh5zLQbHSkUQeS5U37mAmW3VaXbg5VBJV/K4mknJTW4iZQx0AiZ7frJ
         7JCPuFQ4c/OKtt45UOhkjfzAuMM+gPYW6k5YJfPqj7qEx5Mp0rI856jN/MQ6tMhLuHBq
         ayn7KX4EAoa7GwLkh/l1VCYhWuIKEOKM91UAPNDMKKmqbjKFfSW00vnjW7PADnfyHN8C
         DgkQ==
X-Gm-Message-State: ACgBeo2RxZQEpX3hSqNTKqxYTUeifI+s4UfGuQ7PyLOl0RsJI9+SIXRF
	c3ICOJ2LjWHXxU8Ws7L7S0dk52HEa5z1NQ==
X-Google-Smtp-Source: AA6agR5VyMUW07uPyalLfpB/WkTBemm9GsNAGlC4TFZl8yoDscUWAojnjYVQZPbr0g+jZ5BzPz0lfQ==
X-Received: by 2002:a37:c84:0:b0:6bc:2562:d756 with SMTP id 126-20020a370c84000000b006bc2562d756mr6332262qkm.556.1662643226836;
        Thu, 08 Sep 2022 06:20:26 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id y14-20020a05620a25ce00b006af3f3b385csm17843087qko.98.2022.09.08.06.20.25
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:20:25 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id t184so26401611yba.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 06:20:25 -0700 (PDT)
X-Received: by 2002:a25:8247:0:b0:6a9:443a:cc0b with SMTP id
 d7-20020a258247000000b006a9443acc0bmr7305634ybn.89.1662643225008; Thu, 08 Sep
 2022 06:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com> <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com> <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <5e894d87-8abb-540d-fbd6-8a1d6f9d0e91@microchip.com> <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F6CC81114BCE7696BEDB86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Sep 2022 15:20:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyvVas51e1ozxyYG4_NnVYAMZ1B30raGgaj=FDPeOL2Q@mail.gmail.com>
Message-ID: <CAMuHMdXyvVas51e1ozxyYG4_NnVYAMZ1B30raGgaj=FDPeOL2Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"guoheyi@linux.alibaba.com" <guoheyi@linux.alibaba.com>, 
	"guoren@linux.alibaba.com" <guoren@linux.alibaba.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"atishp@rivosinc.com" <atishp@rivosinc.com>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"prabhakar.csengg@gmail.com" <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_062029_251360_2AD26883 
X-CRM114-Status: GOOD (  23.38  )
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

Hi Biju,

On Thu, Sep 8, 2022 at 3:01 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
> > configure the PMA regions
> >
> > On 08/09/2022 09:39, Biju Das wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > > the content is safe
> > >
> > > Hi Conor, Atish,
> > >
> > > What RISC-V devices you have?
> >
> > A bunch ;)
> >
> > A __couple__ PolarFire SoC boards, HiFive Unleashed, D1 Nezha, Canaan
> > k210 MAIX something & the VisionFive.
>
> If standard DMA api works without any issue means, on these platforms
> IO Coherence port is enabled in the hardware. So all peripherals
> involving DMA work as expected.
>
> > > Ours is RISC-V uniprocessor without IO Coherence Port.
> >
> > What does "IO Coherence Port" mean? Zicbo*?
>
> The HW will provide coherency between CPU and peripheral.
>
> If Zibco* is uniprocessor, then highly it may not have IO coherence
> Port enabled in their design.

Zicbo* is a set of extensions for the instructions.
These cannot be retrofitted to existing silicon, but perhaps they can
be trapped and emulated?

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
