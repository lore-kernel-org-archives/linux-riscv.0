Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9744C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 09:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oBcOqqdBu9N2u7K30co0iszh8hmnhfZ0/1Bdrmanis=; b=U83nv5bt7k1Rzo
	QCa/BNUQPkvYSOy+BAhmbMPvwwsKv6uhwZ1eYVkf569q118ALfDH3w4oTmgoQ1UPmxxmZxxMPLtGl
	j/Kn/Bp2aq+PQPB2w71KUuddITRynd1p3yRYn23MMg8HPIS3BVJlX9UjA0o1T0Wm+sp8V4BprFO1e
	Vcd2fnQv/fc74mKWEHFGAAhBI8EYUUXnYMPpFYllCedA4kYhpTgUNrCmHKEtD8e5wR0nmYK0EXMuC
	rE24aFT7G9GXj6a0O+HvdOJMhyFm4FjlLS7JYA1HbpnbYCucTntAnrZ3h5PRH4bgVgw+HCfdrDb7A
	8P/JxD7vfjKT4W2Bk7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kHw-002vOE-2y; Fri, 08 Jul 2022 09:28:40 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kHs-002vLC-9j; Fri, 08 Jul 2022 09:28:38 +0000
Received: by mail-qt1-f179.google.com with SMTP id i11so26440529qtr.4;
        Fri, 08 Jul 2022 02:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8P8vfH9HKefblWeEsLpHl1JryF7MgcGtCA94wYmgSRA=;
        b=aGPUdicthjrHuuWnUU0iHgZiKB3PMb/nCnOAzQzOBGpvt2CSLVK8YZ+Ra4QJrVZAhF
         2lH6twRdEnlwDAYA82rTw4xUjWENyb+azPNCggx1LYeYjoxErRFQlcPagIVp3hd1uWNn
         2qmUmLkVzwMcgwWZphl7u6gmfdVRWSZ2XuiTWE3W1MO5lUjtNt3++vkHOQlmau1nxJ+X
         zzVaj46hzlnjLEkT26wDbNbVAqrqKht0rFqi2qvafB5O9Eu0SFLpfJoRVWjW00vaKsGb
         fVfSDqmpFAU+ldmbWP3xaIBsnleEpd6q1y6PFkKd5ndGDlwhjKtuK7Arc0mGi62Lmo6S
         aulQ==
X-Gm-Message-State: AJIora+sLq6mN9fe7VlNpNmaEOP+K4R5C1ukkp504Hwb2tZ0VuyT/zZa
	2YeVb4MkIcYovUFTtCBmE72CgvuJ821eFw==
X-Google-Smtp-Source: AGRyM1si2ebfF3UJhbBnReXuGTEpjOV9aIw6/GROH4oBYqb0AOcTeYPhSa1cYFVmxpu573KTZD/dww==
X-Received: by 2002:a05:622a:4cd:b0:31d:26a1:2536 with SMTP id q13-20020a05622a04cd00b0031d26a12536mr1976627qtx.626.1657272513787;
        Fri, 08 Jul 2022 02:28:33 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a454c00b006afd667535asm25101058qkp.83.2022.07.08.02.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 02:28:32 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-31cac89d8d6so123531157b3.2;
        Fri, 08 Jul 2022 02:28:31 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:31c:e3b9:7442 with SMTP id
 g9-20020a0ddd09000000b0031ce3b97442mr2831959ywe.47.1657272511310; Fri, 08 Jul
 2022 02:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220707220436.4105443-1-mail@conchuod.ie> <20220707220436.4105443-3-mail@conchuod.ie>
 <20220708082443.azoqvuj7afrg7ox7@bogus> <473e6b17-465b-3d14-b04d-01b187390e66@microchip.com>
 <20220708092100.c6mgmnt7e2k7u634@bogus>
In-Reply-To: <20220708092100.c6mgmnt7e2k7u634@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jul 2022 11:28:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUjmG9n3BuRAz_irkmHQbp=7SYxe5VEfOhMdT4D2JfwQ@mail.gmail.com>
Message-ID: <CAMuHMdXUjmG9n3BuRAz_irkmHQbp=7SYxe5VEfOhMdT4D2JfwQ@mail.gmail.com>
Subject: Re: [RFC 2/4] arch-topology: add a default implementation of store_cpu_topology()
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daire.McNamara@microchip.com, 
	Niklas Cassel <niklas.cassel@wdc.com>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Zong Li <zong.li@sifive.com>, Emil Renner Berthing <kernel@esmil.dk>, hahnjo@hahnjo.de, 
	Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, changbin.du@intel.com, 
	Heiko Stuebner <heiko@sntech.de>, philipp.tomsich@vrull.eu, Rob Herring <robh@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Brice.Goglin@inria.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_022836_415716_1AD206D7 
X-CRM114-Status: GOOD (  35.82  )
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

Hi Sudeep,

On Fri, Jul 8, 2022 at 11:22 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Fri, Jul 08, 2022 at 08:35:57AM +0000, Conor.Dooley@microchip.com wrote:
> > On 08/07/2022 09:24, Sudeep Holla wrote:
> > > On Thu, Jul 07, 2022 at 11:04:35PM +0100, Conor Dooley wrote:
> > >> From: Conor Dooley <conor.dooley@microchip.com>
> > >>
> > >> RISC-V & arm64 both use an almost identical method of filling in
> > >> default vales for arch topology. Create a weakly defined default
> > >> implementation with the intent of migrating both archs to use it.
> > >>
> > >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > >> ---
> > >>   drivers/base/arch_topology.c  | 19 +++++++++++++++++++
> > >>   include/linux/arch_topology.h |  1 +
> > >>   2 files changed, 20 insertions(+)
> > >>
> > >> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > >> index 441e14ac33a4..07e84c6ac5c2 100644
> > >> --- a/drivers/base/arch_topology.c
> > >> +++ b/drivers/base/arch_topology.c
> > >> @@ -765,6 +765,25 @@ void update_siblings_masks(unsigned int cpuid)
> > >>    }
> > >>   }
> > >>
> > >> +void __weak store_cpu_topology(unsigned int cpuid)
> >
> > Does using __weak here make sense to you?
> >
>
> I don't want any weak definition and arch to override as we know only
> arm64 and RISC-V are the only users and they are aligned to have same
> implementation. So weak definition doesn't make sense to me.
>
> > >
> > > I prefer to have this as default implementation. So just get the risc-v
> > > one pushed to upstream first(for v5.20) and get all the backports if required.
> > > Next cycle(i.e. v5.21), you can move both RISC-V and arm64.
> > >
> >
> > Yeah, that was my intention. I meant to label patch 1/4 as "PATCH"
> > and (2,3,4)/4 as RFC but forgot. I talked with Palmer about doing
> > the risc-v impl. and then migrate both on IRC & he seemed happy with
> > it.
> >
>
> Ah OK, good.
>
> > If you're okay with patch 1/4, I'll resubmit it as a standalone v2.
> >
>
> That would be great, thanks. You can most the code to move to generic from
> both arm64 and risc-v once we have this in v5.20-rc1

Why not ignore risc-v for now, and move the arm64 implementation to
the generic code for v5.20, so every arch will have it at once?

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
