Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ABC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 14:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsvBl1brx2J+eV9wStKUZo+pKz1S4vWI2d8KFVQnuK0=; b=WthGjr4qqBsy+U
	9kxe9wmtNYlxg9DmuyChIhS5oP1kgZLGiLZlGtq50Qx1hRC4HsnXCIZpFPWHnDgVzg/X4DYXiSEdM
	l6CNcXbZRk5jpuyCdkdIDL4ke1NHdOenHwRmEPJI6gQNfMYGuK1OY6jaw0mPwIXoiEfTbxqhSonMd
	p9t0/P/g7A5yZZzSnP6SRJgp2SrvigzdAcTofwcqn1cLR4+Ejx2E8r0/kMP5Df5pg+v3DpL62hQ1a
	A4u3+qWV5BDOp0ZsyzvlDD6F6Ss3tDIxgL3WiZiao48vhaTU+zZ/Uf7sxdAkjuta48lFqtC7/DRU6
	62YLrYJ3AxWHL+aXYBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizk6-009weO-LD; Mon, 25 Apr 2022 14:31:10 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizk3-009wdB-WE
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 14:31:09 +0000
Received: by mail-qk1-f177.google.com with SMTP id y129so10867107qkb.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 07:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AQutAyrZWpmZU4yDPLFnJpPPFugXdqhIJFR321HxU64=;
 b=WuWqUyqegP6hXP4gGyo9sljsJYAhXCdLsygTImZXj3rrNkQZWy6R2Qvx6htZVqdH6+
 w51IXE4ftN8lyNJyHE1T4WpDxnZ4eeJN6+mgYdzvbTyBp6ApyP40bg7rgBn0x8FDC+kl
 xP4pr9a/MEWrlUxb80SPmhfrwuvvHi1oKZvFNDh91h2C0xXmyTH+bBMNKNKMkGfcp3Tb
 5sG9fwPbMPmG1b1gdhTv3wK9i66vG8uOyH/uJysa9meGgBsaMSta5Z73YJgi2sXApCjA
 rE805whxEaVgZCn402KZGDXkXbNCuPWZvLRl55BAShwlhlgKK16g3DlbHFN0aeHq9CVR
 OWMw==
X-Gm-Message-State: AOAM531w0NrbVPX5tg+YlFA0QkWE+1JrAQ/sXQG7h6BW3PnasT8qgMUo
 JhB8Q+UHEZRghlz7H4UUE7qxMceFSoLcLQ==
X-Google-Smtp-Source: ABdhPJxJA522eFk3JYkBbc/FoK+2rQP+rWJVAUyaxDO3ygY3CeSCSKOYi/ir9f9FhAkHAdyUwRa1cA==
X-Received: by 2002:a05:620a:2807:b0:67d:6349:2577 with SMTP id
 f7-20020a05620a280700b0067d63492577mr9880477qkp.785.1650897065613; 
 Mon, 25 Apr 2022 07:31:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05622a144e00b002f1f32f86a6sm6084054qtx.5.2022.04.25.07.31.04
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 07:31:05 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y2so8465122ybi.7
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 07:31:04 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr16168790ybq.342.1650897064718; Mon, 25
 Apr 2022 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220422211055.9278-1-palmer@rivosinc.com>
 <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
 <CAK9=C2WTY8+-98XuxRYTaRe4aVJufaB5wr35KRoTKEttUM7JzQ@mail.gmail.com>
 <CAMuHMdV4aZ1U2CGjSOSvFsq-rHKq34wyS-TMvR=7kX68YQHFjQ@mail.gmail.com>
 <CAK9=C2X5qvWEwwMJK52+UFC8DJBDbZBPY0_iXVHdBA0Y5Ps19w@mail.gmail.com>
In-Reply-To: <CAK9=C2X5qvWEwwMJK52+UFC8DJBDbZBPY0_iXVHdBA0Y5Ps19w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 16:30:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVE9mpRStjo3+jy9k=6A7Fur1xPW6hMtx1Nbr=3NURZTQ@mail.gmail.com>
Message-ID: <CAMuHMdVE9mpRStjo3+jy9k=6A7Fur1xPW6hMtx1Nbr=3NURZTQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_073108_074033_86B6269C 
X-CRM114-Status: GOOD (  42.85  )
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

Hi Anup,

On Mon, Apr 25, 2022 at 4:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
> On Mon, Apr 25, 2022 at 7:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Apr 25, 2022 at 3:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > On Mon, Apr 25, 2022 at 6:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Fri, Apr 22, 2022 at 11:42 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > > > Similar to the previous patch, this allows a dt-selected downgrade to
> > > > > sv48 on systems that support sv57 in case users don't need the extra VA
> > > > > bits and want to save memory or improve performance.
> > > > >
> > > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > > ---
> > > > > This is on top of the patches from Alex's set that I dropped.
> > > >
> > > > You mean "[PATCH v3 13/13] riscv: Allow user to downgrade to sv39
> > > > when hw supports sv48 if !KASAN"?
> > > > 20211206104657.433304-14-alexandre.ghiti@canonical.com
> > > >
> > > > For both: "DT describes hardware, not software policy"?
> > >
> > > It is possible that HW is designed to support both Sv48 and Sv39 but
> > > there is some errata due to which Sv48 does not work correctly ?
> >
> > In that case, I assume the software has to disable Sv48 on its own?
> > Fixed hardware should use a different compatible value, so software
> > will know when the issue is fixed, and the feature can be used.
> > How else is DTB backwards-compatibility supposed to work?
>
> Usually, HW vendors will use different names for incrementally
> improving implementations so they will tend to create separate
> dts/dtsi files for newer implementations with some sharing via
> common dtsi files.

Even for a minor update of the SoC to fix some errata, where newer
boards just contain a newer revision of the silicon?

> > > We should allow users to downgrade the MMU mode, due to
> > > their own reasons. In fact, users can also disable an extension
> > > by not showing it in the DT ISA string.
> >
> > That sounds like a software policy, too.
> > What is wrong with a kernel command line option?
>
> The MMU modes are detected very early and even before the kernel
> command-line is parsed.

That can be fixed.

> > If you want it in your DTB, you can add it to chosen/bootargs.
>
> If HW vendor describe complete details in DT and disables few
> things in chosen/bootargs then it means there is some issue with
> those things disabled via chosen/bootargs.
>
> A HW vendor might never want to advertise broken extensions in
> their implementation so the ISA string and various HART features
> in DT will be set based on working functionality on real hardware.

That may be true in a perfect world.
Depending on the level of brokenness, the issue may not be detected
before devices are released into the world.  So you're better prepared
for such cases.

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
