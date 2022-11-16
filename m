Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29476C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoumA+v48tHM7Abl56PyahNV0wk8cAdE1Qk9R78tV3Y=; b=CzjDe3Z0Zse6t4
	EGXV1Dh33wr70WNmRSw3HWR12/mi0jMMD5MyaYXBkyixJfnsmELTpKvG10aFw80T/WIwn7ga2MbUQ
	CWnm2DhNLz6XgmUnRJyWFlrcTn+KpKXqr+ysOQD7iZfJXfvVBrgbqganb5JpCB1jrMa9+IH6OUDFa
	DBCVbhNFtYRj5WqB3Y/ttgPTq1szxMA7IQ055wquiY8XZzX21LhI/T7aX/JP5EFKmc1kfu3tGFr5I
	hqGucQIXjOHmECbciuOhvkCkrAyrooNgmyj4ZjyQPv5LpHk9+KKOiC+MxwDQEttb6pPb6OdBm7uyA
	K/ZxVhad7e/BpaBabmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEh4-001geC-Di; Wed, 16 Nov 2022 09:26:54 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEh1-001gct-Tq
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:26:53 +0000
Received: by mail-qt1-f170.google.com with SMTP id c15so10313265qtw.8
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGSh9ezbCO5Cs+0MRBpsxP1k4L0kzxgW9LPRl1yAGr0=;
        b=h9rdSZXI757o9+Pm4ILE2Y9uhhHesl5128XfkrfmAXajiI73r+9Zk7xSAe2DN4JYgm
         0H8JaePxx/z/bVIXGo8ortZzq2VX5WijVafIcHdbeWivMFwDgINvb7jvt1bcToiAl/1y
         kbPXntiiyiy+zbpicc/d29hCPhYinQVV1jJxjFCClfShC8M+uCEN6U/K9hyHDoqCYtSS
         noyEcsQWLNrBTJ9w8Yd1QRzvtLRK+853eIn/jlqm4SbBso2C1T9nRonnomvAL5hOiP+b
         LxQGPqI/rDBfc4pXqCx0NPYdJA9G2YkOhrRvn2Z7E0FY3i3iPg9KmGx7Je8FO0LvKssk
         k+UQ==
X-Gm-Message-State: ANoB5pm9CScuZgd1LcMcIXxXRUVr8Gqgbrb33dt7eODLKPYhvJFT480F
	801HLKuXl/KG9cOzkBIwD1NEVJzS47ubaw==
X-Google-Smtp-Source: AA0mqf6Ix0Hwm9OZzQWT4+to3Beza3r0acCQ1TNiwogC/Hb4zelh8vHFpv0bxA/WuG3lCJT96+gHow==
X-Received: by 2002:ac8:7e84:0:b0:3a5:3cc0:8139 with SMTP id w4-20020ac87e84000000b003a53cc08139mr19579794qtj.533.1668590809589;
        Wed, 16 Nov 2022 01:26:49 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id c8-20020ac86608000000b0039d02911555sm8406986qtp.78.2022.11.16.01.26.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:26:49 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id f201so19030326yba.12
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:26:48 -0800 (PST)
X-Received: by 2002:a25:844b:0:b0:6de:6c43:3991 with SMTP id
 r11-20020a25844b000000b006de6c433991mr19268568ybm.604.1668590808744; Wed, 16
 Nov 2022 01:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3OgSAnst0qt5WSk@wendy> <CA+V-a8vL5r-xMeCiYRax-dM2Uo0ghgzRiyY99nNn089CjJwoBg@mail.gmail.com>
In-Reply-To: <CA+V-a8vL5r-xMeCiYRax-dM2Uo0ghgzRiyY99nNn089CjJwoBg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Nov 2022 10:26:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXquU632vu37WkewmashjSxV8f8J6WGawAD4uL3B=6pHA@mail.gmail.com>
Message-ID: <CAMuHMdXquU632vu37WkewmashjSxV8f8J6WGawAD4uL3B=6pHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] RZ/Five: Enable ADC/CANFD/I2C/OPP/Thermal Zones/TSU
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_012651_982200_44A798CA 
X-CRM114-Status: GOOD (  33.19  )
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

On Tue, Nov 15, 2022 at 7:23 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Nov 15, 2022 at 2:21 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> > On Tue, Nov 15, 2022 at 10:51:32AM +0000, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Hi All,
> > >
> > > This patch series aims to enable support for below blocks
> > > on RZ/Five SoC/SMARC EVK:
> > > - ADC
> > > - CANFD
> > > - I2C
> > > - OPP
> > > - Thermal Zones
> > > - TSU
> > >
> > > Note, patches apply on top of [0].
> > >
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git/log/?h=renesas-riscv-dt-for-v6.2
> > >
> > > Cheers,
> > > Prabhakar
> > >
> > > Lad Prabhakar (3):
> > >   riscv: Kconfig: Enable cpufreq kconfig menu
> > >   riscv: dts: renesas: r9a07g043f/rzfive-smarc-som: Enable
> > >     ADC/OPP/Thermal Zones/TSU
> > >   riscv: dts: renesas: rzfive-smarc: Enable CANFD/I2C
> >
> > I know ~nothing about your SoC so idk if the values are correct, but I
> > did give it a go earlier to see if it did anything warning wise. Seeing
> > that it didn't cause any I am curious - how come these didn't land in
> > the original dts? Just waiting for driver stuff to land to support it?
> >
> I wanted bare minimal stuff in the initial patchset.
>
> > Anyway, no new warnings which is what I care about - I suppose that
> > makes it an acked-by?
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Can include that tag if you like. Either way, nice to see some of the
> > /delete-node/s etc being removed.
> >
> Thanks, Geert should pick the tag while picking the DTS/I patches.
>
> For the Kconfig patch it needs to go via the RISCV tree or can that be
> picked by Geert too with the rest of the other patches?

IMHO the Kconfig patch (or Conor's earlier version) should go through
the RISCV tree, as there is no hard dependency.

Yes, I can take it with an Acked-by, if all else fails, but the soc deadline
is near.

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
