Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007DDC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 19:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lbis3lfOse7rBhWIqgJbNjQ6guzW6e0nR80gX5zpGig=; b=iTR8fWyopo5skE
	w5X4eXSKZo7fWG13aqUghmzHe2/wUOdhJqyFeCD5AgavtQF4BIYLeP8B1zui+H+RlILc43BJcCuG1
	aiqPolxE5ogmfD2gJB0UUnev4uymwh9/Nt/vyDXCy7R9nHHRea83MUiZd9gotEM66/bu4cCFBlVNq
	RUrI/emRNhxWU/ynxp8tHIf0It1tA291E/jHnm7ipr2yBsWBHPO+IAVVJxAms8SMbEGFsH5xwHiKz
	xl5deH+NzA90v3mSwjEg7bcOclDceE2QidVa06XuezJuB5CVwEAX/Btaw3+AdU0OX07vZNNB4vDK2
	cXO5e1BOrn0HRuW/e3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oair7-0060KL-40; Tue, 20 Sep 2022 19:24:29 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaiqz-0060I8-Sg
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 19:24:23 +0000
Received: by mail-qv1-f45.google.com with SMTP id c6so2776592qvn.6
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 12:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yysm/muSvmUqRZUlhuFzQOUXKN32lBic33bRnAUB65A=;
        b=BAU7xP+HQLYQaDLYd41NjNKP2echHJP3sCytNgoZu4SHCv8x7og5xmMI20f7jj3XSG
         BAQxpHFqvDd0BvQ/y5yGgGTzTcrIjiIzkyARpa2o+6CDHnl5uYkFfkN35ZC32TCTN9HW
         saP9Y+VPy/fa+NpycFOHz7/593H2JDxqyTrsr0ZuEMJMe9d88JNxDzg7G/jUt5Ls1JpP
         vEd/tq5FMNQG/vo54recryce+sa+WvIldEnjYFL5Bkpxslg1qBlJIArmPsu26sMwnTU+
         a9BNAzRTNUe3lXi3WH5csYSLXwLQMovQFNIdalDDVf+KWpnTDIEFH4WydEDmhn/3qR+o
         gMQA==
X-Gm-Message-State: ACrzQf1VXNaCR2IB6IryoeCGXFseL937LTT09MZgMg8ahs6WBPAfSXPs
	ROmUYWJqdWrvL5w0pvODaHoSJbGaLgdBFg==
X-Google-Smtp-Source: AMsMyM5fg/9jqGJmvtukrjVktc2aWbgfSbxlLyOoeXwxM9bhWqtjMssCDDTBTRHmFmktK+cos30yxQ==
X-Received: by 2002:a0c:e152:0:b0:4ac:8080:215c with SMTP id c18-20020a0ce152000000b004ac8080215cmr20504209qvl.2.1663701858554;
        Tue, 20 Sep 2022 12:24:18 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g24-20020ac870d8000000b0031eb5648b86sm271551qtp.41.2022.09.20.12.24.17
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 12:24:17 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id p69so4948981yba.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 12:24:17 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr19432910ybl.604.1663701857015; Tue, 20
 Sep 2022 12:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <YyoSgGlkIB8GMog8@spud>
In-Reply-To: <YyoSgGlkIB8GMog8@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Sep 2022 21:24:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfkX-AOusfOn-6fmaJavWWoD1mW8QNqUCUdkHuz=3FsA@mail.gmail.com>
Message-ID: <CAMuHMdXfkX-AOusfOn-6fmaJavWWoD1mW8QNqUCUdkHuz=3FsA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_122421_948722_56FA6BAC 
X-CRM114-Status: GOOD (  27.70  )
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

On Tue, Sep 20, 2022 at 9:20 PM Conor Dooley <conor@kernel.org> wrote:
> On Tue, Sep 20, 2022 at 07:48:54PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > entry-class social infrastructure gateway control and industrial gateway
> > control.
> >
> > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > (R9A07G043) SoC and updates the bindings for the same. Below is the list
> > of IP blocks added in the initial SoC DTSI which can be used to boot via
> > initramfs on RZ/Five SMARC EVK:
> > - AX45MP CPU
> > - CPG
> > - PINCTRL
> > - PLIC
> > - SCIF0
> > - SYSC
>
> Ran into one complaint from dtbs_check:
> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c50200: '#phy-cells' is a required property
>         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
> arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c70200: '#phy-cells' is a required property
>         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
>
> Other than that which should be a trivial fix the whole lot looks good
> to me...

That's due to the placeholders...

Currently it is not yet a requirement that "make dtbs_check" is warning-free.
I'm wondering how we have to handle new SoCs with existing boards in
the future. Probably just more properties in the placeholders...

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
