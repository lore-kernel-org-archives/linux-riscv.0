Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DB0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLznr+Cik5k/jrdn6OJ2MQUofxdPQq+fWyuHRV5Jy1c=; b=h2zXAef7my4BKG
	DahaOxRiFG15AKI3MNqU9hAkCPfEYU7i4J6/XJ+I2917ZImynziseT5ggAQoX2vCpCKiRTxDNO6va
	Gs24b0qf3m+66qgMIl+BHEgcJoYSosD2hBz0vY9rmo/ld/kK4B2pRx+KV6otXv4mDO5WgbpofHyKO
	Wl9fFaO/NIzW34P5l/eX3rCCV8aEz039JQ107AEv3olgVecsTRlZQ7NLcht6wbzttKyOE3n928Cvt
	d2ofwK6n6Wm8PVEOJ/7tuUVy5BEAs2vHqxzHMqQKwhOCZcTdN0YeQVFQ1kZUmYQgbIYv31Il2OeLt
	NGpHBl7eR23mL2TjtVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIVPf-007GRi-B2; Fri, 11 Feb 2022 12:52:35 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIVPc-007GPd-8q
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 12:52:33 +0000
Received: by mail-vk1-f172.google.com with SMTP id z15so4889620vkp.13
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 04:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3yMDJ4AXnEfuVrUfk2PsPl0dHnN7EmeDB26b3zVqHM=;
 b=t50OCXjUvqf2zGELG7PzBXd6lQbp2G3czILnM5TIQljipcNOLxpyR6OxPzMhsrax1p
 2B5PB0W/LY+a8eUvRdF/hP+TcnHGMGZtxdrJ4esSkHRdjbw94W56pktwieY+GHKQNXFj
 qrzSYSiOlGweQl9h0ewyutmfpSBOY4R/oSDLrvIyNEYhYZQVHjeqfqrK/8a1WJjRZUfz
 ydryFWcIT4ZKmpVIqkuoKRzuyZ/cv2unSvYlMMVSMPm+DRRJGhHsC6dezYB3TNWfkm2p
 zp7vvCvAAADs0VwML3vItpO3FQElVcWE9CSUTkdX7bmb7We4165inc+/senpeyPMfW6X
 VvCA==
X-Gm-Message-State: AOAM533b40Pnbir1YunSEoczeZhZxjSNXzrYEJ3Eh/0GcZ93k98Kj7e7
 IwT/TfwaOjKxUl1GyimvmC1oLh+/rOQSmA==
X-Google-Smtp-Source: ABdhPJydnnaBnfifZNKQ4tnME+vL5diLLOPXcAudyZAa1AyjJL8t+0xOcdQtRiAFo57Irm6O3nUPtA==
X-Received: by 2002:a05:6122:793:: with SMTP id
 k19mr396220vkr.15.1644583949761; 
 Fri, 11 Feb 2022 04:52:29 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id n21sm1321497vkq.21.2022.02.11.04.52.29
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:52:29 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id t22so10120932vsa.4
 for <linux-riscv@lists.infradead.org>; Fri, 11 Feb 2022 04:52:29 -0800 (PST)
X-Received: by 2002:a05:6102:34d9:: with SMTP id
 a25mr415124vst.68.1644583948840; 
 Fri, 11 Feb 2022 04:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20220210214018.55739-1-atishp@rivosinc.com>
 <20220210214018.55739-6-atishp@rivosinc.com>
 <877da2xu32.fsf@igel.home>
In-Reply-To: <877da2xu32.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Feb 2022 13:52:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4P82B96ZbANyF6cWo9CnrW9hg5up6pCb0PZ99=sPZ_A@mail.gmail.com>
Message-ID: <CAMuHMdX4P82B96ZbANyF6cWo9CnrW9hg5up6pCb0PZ99=sPZ_A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Atish Patra <atishp@rivosinc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_045232_362405_FFDAFDB9 
X-CRM114-Status: GOOD (  20.88  )
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

Hi Andreas,

On Thu, Feb 10, 2022 at 11:00 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Feb 10 2022, Atish Patra wrote:
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 469b9739faf7..cca579bae8a0 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
> >       for_each_of_cpu_node(node) {
> >               unsigned long this_hwcap = 0;
> >               uint64_t this_isa = 0;
> > +             char *temp;
> >
> >               if (riscv_of_processor_hartid(node) < 0)
> >                       continue;
> > @@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
> >                       continue;
> >               }
> >
> > +             temp = (char *)isa;
>
> There should be no need for this cast.

Indeed, but only if "temp" is changed to "const char *".

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
