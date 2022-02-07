Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DBFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX8EDsOtX/StYj/o9DryRdtqy/3k3g7948s30dmPwL4=; b=WYJc5KpVc6KBlI
	BI6DDCOXN4xKSDMBbNWdYDvnobrv3j2JleB0Ee/LA8dDeSQXLvmzjqKMz0zJ4uxhLLAEtIczqlb2l
	zOA6nAtlh4gt31Cf3lF8fX3gvUZq0BfMhTUhzK/pQ4IQTsyz5AukY1n3ksSkNv6hue5+XMCJVxm9i
	U99p+Fcoe83mErZMm2rMTlwpB/JKEKqow9hTXNZL1XuaNtPQqydispu2NOVIKLBcN+56ASIQHn5rN
	Vix8YVNcZbEJfp4OItKxq1Vn5N2071c2TV9PG90Ea5koRGT0jtYD69W2jfec+fDF2o/MVPDbm0aJa
	IZ1j6VujpnYGjm1k+4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGwTY-0093Yt-AY; Mon, 07 Feb 2022 05:22:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGwTU-0093YD-Tq
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 05:22:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id e15so480126lfc.1
 for <linux-riscv@lists.infradead.org>; Sun, 06 Feb 2022 21:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGto9Xi5kXT109TGKxmESbnUdLkURSUbKuwtAM3GVRY=;
 b=GJYJs5kr8L0CzbroD4u7gx12y0B2e/A+Jz8EL53bOvsjtCs/mAgZDnq3jzwqzO+xl0
 06SVvCAQ48ly9xfH1vZ6XttX+BjiM2aLz9J2QV4dBlFL8h/cyY3oUnTdJkio5YwZHtl4
 lb/EmaT+WIxT2jh5rzhWwHE1Grpz5T517csUsI6DBroXvJtpWzAcLvbv2Ab59sf4IMbI
 hREJpECLkM3ZhSswZ025QpXrE0kHPdHcqJU8I81V42KTMNbVLg/31QDZzz4XRZ5jNf7q
 +FnQIDVk2DuB1eCWk9/RjawuZp2iqT8o0aj2dwGZskWk2gLHmX2BG6gkBIN0hXKS/fBu
 6gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGto9Xi5kXT109TGKxmESbnUdLkURSUbKuwtAM3GVRY=;
 b=k+3Rd9vqSCgxE0qcY2LifDU2XCbQhiB/WYrLdxEWZZtrQWfW7whhVvA4GpErF3SZNA
 ts3s6K5hIqYkmxtNvK4vWRliD66txkRZzivJrRLtKezBbpcHCZuLZrwcx56Wzlm6QaiK
 6Rg6GLOnCWZaollxf0RZaokHi5kJva6W/3jopAMmr2ZjztwzEeE7axF98+5KP1+v6NZP
 6awaPAuLYvi/VSL5jiJOZp5bHLKdMT4oT2qXb1xPqhXjRJJPxKcOgh5r4JIEnby4nsFA
 PUFijSH4il/ea8qI7lVHzQjczkHTdctM0LpPGAiWVEIFKBKwTjZN0sFizglccflKj8iR
 EpXQ==
X-Gm-Message-State: AOAM531QZadXQIf7eY7Ib1iNxEspcNuD33Tfifpw85OQmWMw0fB+LTJg
 hpGno3bdo6FR9qUe6PHuAgQdV4fjbi0mYfEeq9SN6w==
X-Google-Smtp-Source: ABdhPJxpeJtXFqUmwrOBzOQ8MX54Xs5LsU2VrMor7DxLiCWIdFLgRJ2+sq3U6j9wrfCSu7HJ7TGRQJP+lUaFlqERBQY=
X-Received: by 2002:a05:6512:3e0b:: with SMTP id
 i11mr7348588lfv.510.1644211321557; 
 Sun, 06 Feb 2022 21:22:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642582832.git.zong.li@sifive.com>
 <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
In-Reply-To: <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 7 Feb 2022 13:21:50 +0800
Message-ID: <CANXhq0pYHfsa4T1t=FK2=jM4OEfgXD=sDS5vVV4EKCpkwTz6og@mail.gmail.com>
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Lee Jones <lee.jones@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_212205_021466_C3C70097 
X-CRM114-Status: GOOD (  25.64  )
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

On Sat, Feb 5, 2022 at 2:56 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 19 Jan 2022 01:28:37 PST (-0800), zong.li@sifive.com wrote:
> > This patch set tries to improve the PRCI driver to reduce the
> > complexity, we remove the SoCs C files by putting putting all stuff in
> > each SoCs header file, and include these SoCs-specific header files in
> > core of PRCI. It can also avoid the W=1 kernel build warnings about
> > variable defined but not used [-Wunused-const-variable=], like 'commit
> > 487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
> > 'prci_clk_fu540' where it's used")' does.
> >
> > This patch set also contains the dt-bindings and dts change, because
> > we change the macro name for fu540 and fu740 by adding the prefix
> > respectively.
> >
> > Thanks all for your review and suggestions.
> >
> > Zong Li (4):
> >   dt-bindings: change the macro name of prci in header files and example
> >   riscv: dts: Change the macro name of prci in each device node
> >   clk: sifive: Add SoCs prefix in each SoCs-dependent data
>
> IIUC these there aren't bisectable: the bindings change will break
> builds of the DTs and drivers.  I'm not sure what's generally the way to
> go with these, but I always try to avoid broken builds in the middle of
> patch sets.
>
> Aside from that this generally looks good to me, but the DT and clock
> folks are probably a better bet for a proper review here.  Happy to take
> this through the RISC-V tree, but IMO it's a better candidate for the
> clock tree so
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from breaking bisect
>
> Thanks!
>

Many thanks for your review and reminding, and yes, it seems a bit
hard there since the DT binding docs and includes need to be a
separate patch.

> >   clk: sifive: Move all stuff into SoCs header files from C files
> >
> >  .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
> >  .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
> >  .../bindings/serial/sifive-serial.yaml        |   2 +-
> >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
> >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
> >  drivers/clk/sifive/Makefile                   |   2 +-
> >  drivers/clk/sifive/fu540-prci.c               |  89 ------------
> >  drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
> >  drivers/clk/sifive/fu740-prci.c               | 134 ------------------
> >  drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
> >  drivers/clk/sifive/sifive-prci.c              |   5 -
> >  include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
> >  include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
> >  13 files changed, 254 insertions(+), 277 deletions(-)
> >  delete mode 100644 drivers/clk/sifive/fu540-prci.c
> >  delete mode 100644 drivers/clk/sifive/fu740-prci.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
