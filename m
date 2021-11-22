Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ME1N5SzZeKeL0c99Clqe7+5NDlVs/wrloNLNZz5RL30=; b=bgdGWYfJKYRH09
	CSRcSR3VMxeSer5auzCxxsl5jPIMpSIoCfoOCNilu2/3bc6PmS+xcj0OCk0xtFuylnE2wZx3cApMn
	9Ku+qgfwaVLnhEZTN5/56cn75fwGSgUST/E+H0JcgL7qGVmOizvz5dbUxPQaH2accNIky2YU5+jGE
	C0mYP5g+rgDuu18lOLdCK5pPVtUU/TS55UwLnfrpbFnYrxxz8tOhtqMYCzhM2c0kTanN3oN/+DE5+
	s1hAxBYbPT3QOpudVdcaYBIsr4a+b0XoDCxO0wlez70fiYziwC88DojjO8DoF++vlnDXU51lYuqQ5
	c49uGwAjZIQGZalBivXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAlf-00Gx0e-Ur; Mon, 22 Nov 2021 14:58:03 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAlc-00GwzP-91
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 14:58:02 +0000
Received: by mail-wr1-f51.google.com with SMTP id r8so33170701wra.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Nov 2021 06:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PjKdufrNjh+MwuSzwMClOkqUkC+hFoflMOBE6o9mvD4=;
 b=wTBHbEzFYrsoLbY7JG2DdCobv0Mh4fnbYypBcX9x8h7/8P8YZ/td9C+wEj3wjV/jZ3
 6eYf1glZPDAeifiMlmRq1CGNJZhYzj3MT41n88OxJP4/DA5d5PXOlz9bTqboTHX3r1xv
 4vaoZVfyxqx96VLD5U7mJCnNAiMD203sRBIzfeiNDz5QfQEf/YVPsKDdsZwj052yT0gU
 iYXqIxSjIKXf1ZnnOFMwRBbjQWlNtJsSk8KWzF+I2lfXbhFq4quUu3jnINOzYkY+eO/D
 q3BeUDevH5GD/aEPWyKCI9wulrBGEJGTLlHUWP0sqTJ68OFGbyI4HHzwUjdeUfkZxuBz
 GOKQ==
X-Gm-Message-State: AOAM533iEhWm9fvlXJIpf6AkycThs1u3gTOxVjI/DjprPcDqtl1ahpLg
 PwJi4w3VyW3xggLfYOPMsn0=
X-Google-Smtp-Source: ABdhPJw4BRZRbXo3RgR+f8sgtJ8AjlOwug5Y2h9i6b/SsyubPE4Kf0yoJgvCE+0+cKNpAJc7BhOhRQ==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr38913215wrx.342.1637593075486; 
 Mon, 22 Nov 2021 06:57:55 -0800 (PST)
Received: from joaomariovmubuntu ([2001:8a0:fa2d:4500:215:5dff:fe40:101])
 by smtp.gmail.com with ESMTPSA id s24sm8870736wmj.26.2021.11.22.06.57.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Nov 2021 06:57:55 -0800 (PST)
Date: Mon, 22 Nov 2021 14:57:52 +0000
From: =?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
To: Atish Patra <atishp@atishpatra.org>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 0/4] Introduce pmu-events support for HiFive Unmatched
Message-ID: <20211122145751.GA10739@joaomariovmubuntu>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211116154812.17008-1-joao.mario@tecnico.ulisboa.pt>
 <20211117152523.66f4ee8e@redslave.neermore.group>
 <CAOnJCULUmmtr=n3yB2e1x_DtyRGTZxVLW-OZOy2aWHS=nOK2gw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULUmmtr=n3yB2e1x_DtyRGTZxVLW-OZOy2aWHS=nOK2gw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_065800_359495_5634BA85 
X-CRM114-Status: GOOD (  34.09  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 18, 2021 at 12:00:09AM -0800, Atish Patra wrote:
> On Wed, Nov 17, 2021 at 4:25 AM Nikita Shubin <nikita.shubin@maquefel.me>=
 wrote:
> >
> > On Tue, 16 Nov 2021 15:48:08 +0000
> > Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:
> >
> > Hello Mario!
> >
> > Thank you for your patch series.
> >
> > I have reproduced your test with some u-boot dts tinkering, and got
> > similar results.
> >
> > However,
> >
> > >
> > > [1] https://github.com/atishp04/opensbi/tree/pmu_sscofpmf_v2
> >
> > OpenSBI sscofpmf has been merged.
> >
> > > [2] https://github.com/atishp04/u-boot/tree/hifive_unmatched_dt_pmu
> > > [5]
> > > https://github.com/atishp04/u-boot/blob/hifive_unmatched_dt_pmu/arch/=
riscv/dts/fu740-c000.dtsi
> >
> > Is missing the adaptation for OpenSBI bitmap patch for
> > "raw-event-to-mhpmcounters".
> =

> My patch was just an example and predates before the bitmap patch
> posted by Vincent.
> I will update the U-boot patch along with the next kernel version.
> =

> >
> > > [3] https://github.com/atishp04/linux/tree/riscv_pmu_v4
> >
> > The link is broken.
> >
> =

> Sorry. This should be
> https://github.com/atishp04/linux/tree/sbi_pmu_v4
> =

> > > [4]
> > > http://lists.infradead.org/pipermail/linux-riscv/2021-October/009408.=
html
> >
> > > [6]
> > > https://patchwork.ozlabs.org/project/opensbi/patch/20211105013301.276=
56-1-vincent.chen@sifive.com/
> > >
> >
> > There is a version 2 submitted, and it won't apply as require rebasing
> > and some renaming.
> >
> > Please share your u-boot dts changes - they should be small and provide
> > a common base for this series.
> >
> =

> Yes. That would be really helpful to have a DT path with all the
> entries for easier testing.
> =

> =


As the changes to the U-Boot are short I'm including them here, please tell=
 me if I
should include them in other way. I merged my changes with Atish's own
patch to simplify the process.

diff -u b/arch/riscv/dts/fu740-c000.dtsi b/arch/riscv/dts/fu740-c000.dtsi
--- b/arch/riscv/dts/fu740-c000.dtsi
+++ b/arch/riscv/dts/fu740-c000.dtsi
@@ -141,6 +141,49 @@
                #size-cells =3D <2>;
                compatible =3D "sifive,fu740-c000", "sifive,fu740", "simple=
-bus";
                ranges;
+               pmu {
+                       compatible =3D "riscv,pmu";
+                       pmu,raw-event-to-mhpmcounters =3D <0x00000000 0x000=
00100 0x18
+                                                       0x00000000 0x000002=
00 0x18
+                                                       0x00000000 0x000004=
00 0x18
+                                                       0x00000000 0x000008=
00 0x18
+                                                       0x00000000 0x000010=
00 0x18
+                                                       0x00000000 0x000020=
00 0x18
+                                                       0x00000000 0x000040=
00 0x18
+                                                       0x00000000 0x000080=
00 0x18
+                                                       0x00000000 0x000100=
00 0x18
+                                                       0x00000000 0x000200=
00 0x18
+                                                       0x00000000 0x000400=
00 0x18
+                                                       0x00000000 0x000800=
00 0x18
+                                                       0x00000000 0x001000=
00 0x18
+                                                       0x00000000 0x002000=
00 0x18
+                                                       0x00000000 0x004000=
00 0x18
+                                                       0x00000000 0x008000=
00 0x18
+                                                       0x00000000 0x010000=
00 0x18
+                                                       0x00000000 0x020000=
00 0x18
+                                                       0x00000000 0x000001=
01 0x18
+                                                       0x00000000 0x000002=
01 0x18
+                                                       0x00000000 0x000004=
01 0x18
+                                                       0x00000000 0x000008=
01 0x18
+                                                       0x00000000 0x000010=
01 0x18
+                                                       0x00000000 0x000020=
01 0x18
+                                                       0x00000000 0x000040=
01 0x18
+                                                       0x00000000 0x000080=
01 0x18
+                                                       0x00000000 0x000100=
01 0x18
+                                                       0x00000000 0x000200=
01 0x18
+                                                       0x00000000 0x000400=
01 0x18
+                                                       0x00000000 0x000001=
02 0x18
+                                                       0x00000000 0x000002=
02 0x18
+                                                       0x00000000 0x000004=
02 0x18
+                                                       0x00000000 0x000008=
02 0x18
+                                                       0x00000000 0x000010=
02 0x18
+                                                       0x00000000 0x000020=
02 0x18>;
+                       pmu,event-to-mhpmcounters =3D <0x05 0x06 0x18
+                                                    0x10009 0x10009 0x18>;
+                       pmu,event-to-mhpmevent =3D <0x05 0x00000000 0x4000
+                                                 0x06 0x00000000 0x4001
+                                                 0x10008 0x00000000 0x102>;
+               };
                plic0: interrupt-controller@c000000 {
                        #interrupt-cells =3D <1>;
                        compatible =3D "sifive,plic-1.0.0";


> > Tested-by: Nikita Shubin <n.shubin@yadro.com>
> >
> > > Signed-off-by: Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt>
> > >
> > > This work was developed at INESC-ID, Instituto Superior T=E9cnico,
> > > Universidade de Lisboa.
> > >
> > > ---
> > > Changes in v2:
> > >   - Fix compilation errors and warnings
> > >   - Remove space idents
> > >   - Correct formatting
> =

> =

> =

> > >
> > > Jo=E3o M=E1rio Domingos (4):
> > >   RISC-V: Create unique identification for SoC PMU
> > >   RISC-V: Support CPUID for risc-v in perf
> > >   RISC-V: Added generic pmu-events mapfile
> > >   RISC-V: Added HiFive Unmatched PMU events
> > >
> > >  arch/riscv/kernel/sbi.c                       |  3 +
> > >  drivers/perf/riscv_pmu.c                      | 18 ++++
> > >  drivers/perf/riscv_pmu_sbi.c                  | 47 ++++++++++
> > >  tools/perf/arch/riscv/util/Build              |  1 +
> > >  tools/perf/arch/riscv/util/header.c           | 66 +++++++++++++
> > >  tools/perf/pmu-events/arch/riscv/mapfile.csv  | 15 +++
> > >  .../pmu-events/arch/riscv/riscv-generic.json  | 20 ++++
> > >  .../arch/riscv/sifive/u74/instructions.json   | 92
> > > +++++++++++++++++++ .../arch/riscv/sifive/u74/memory.json         |
> > > 32 +++++++ .../arch/riscv/sifive/u74/microarch.json      | 57
> > > ++++++++++++ 10 files changed, 351 insertions(+)
> > >  create mode 100644 tools/perf/arch/riscv/util/header.c
> > >  create mode 100644 tools/perf/pmu-events/arch/riscv/mapfile.csv
> > >  create mode 100644
> > > tools/perf/pmu-events/arch/riscv/riscv-generic.json create mode
> > > 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
> > > create mode 100644
> > > tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json create mode
> > > 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json
> > >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> =

> =

> =

> -- =

> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
