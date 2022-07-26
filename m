Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33989C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 04:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH5NgTzlrbTJ1p17VUQYNROFPlimK6uOEB39XBgX6LU=; b=blYlazisgewHxi
	paW/TDvIQF5/EF2a60eZg15FAPpdz6bs0u5U8r3oMryzBF1cnoW66621OUrFEeTF7mTHqnDhLmtdN
	9S1vWU7DCPZcBi5yPiYFWxxV5ZnQ7xTjNHhkq5OxdQauvax1dZ6RLw0QHANZVaiArmlOo2EUsxS7u
	J/URzjoOnB2IJ9P0/XCqd9bhF8BKlzLA0I9v215KCNLu/4zcvGlzzdgn3G87AdFcp6lKzhFbbHtih
	tlmim/SdW1WvG4VFkrBWcfK24lJv04ctaY6Qg+fhrkhOxuEyloVzDdghF7KZ3OaU6VDYnk4+YJyZI
	DRmrYBCoWiY27mPi8D5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGCVQ-007avx-Fm; Tue, 26 Jul 2022 04:49:16 +0000
Received: from conssluserg-04.nifty.com ([210.131.2.83])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGCVM-007asa-HE
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 04:49:14 +0000
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 26Q4mlZA004983
	for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 13:48:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 26Q4mlZA004983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658810929;
	bh=TJAt1sPKJdZeEtouGB202AmkAZKPNWADM2oec71xILQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H+bAzdQoX1NlMoaWJVuA1qncXKv/uWJmIsm2+S5S1gbF5VtEW3a9Y6QLpOMnoJdPv
	 BEuiVLlmY65JNmt3oBdAif4zPVavxqucMyfPem6pO48uWP4Kb60m2el6Z6Ac2u9Qie
	 jidXg/g1F6OWB5fVtavRcOxYuELafLNxMxCACDt1bbiAlsXNN6ZKO8f3JlMto0wCS0
	 7v4S0r7IMUaC2dM3uwnoC/K3SGK/3qhAjES2Z3+O2smdYJv8iykVyTEW1DAslRL/zs
	 1VtyXoNwJwhjUoiKjVYc45AJDFEbZ0IfMm++K0NkIt0CQTr9NBB37CAxV8h3VOITbx
	 2djtMGiL149Jw==
X-Nifty-SrcIP: [209.85.221.42]
Received: by mail-wr1-f42.google.com with SMTP id bn9so7663766wrb.9
        for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 21:48:48 -0700 (PDT)
X-Gm-Message-State: AJIora+/jXz/dWvtkpEYUQXSkGYi6C1v0iHDH/n3Mf/WOpf6NnmrQGNt
	tPOSOdNSp9Ag1JAnuvsw2fO7azUK+0G+E3Qysgw=
X-Google-Smtp-Source: AGRyM1vqyF2N00F5xIlUZdPlGCSBPRAMhN1dql2XSqm2aGCeTkFnj866PnWyStoi52GSkOBa0GFxHDU1rqg4meNzUYA=
X-Received: by 2002:a5d:52c4:0:b0:21e:af40:7f0b with SMTP id
 r4-20020a5d52c4000000b0021eaf407f0bmr92775wrv.477.1658810926938; Mon, 25 Jul
 2022 21:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220713194112.15557-1-wafgo01@gmail.com> <fa77d640-a18d-ca77-ba57-6735094a224f@microchip.com>
In-Reply-To: <fa77d640-a18d-ca77-ba57-6735094a224f@microchip.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Jul 2022 13:47:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNARu4OU_hGQHu8B7F=5jLzU1jp7L=RHVcyo3eLkEyWNcQw@mail.gmail.com>
Message-ID: <CAK7LNARu4OU_hGQHu8B7F=5jLzU1jp7L=RHVcyo3eLkEyWNcQw@mail.gmail.com>
Subject: Re: [PATCH] checkstack: add riscv support for scripts/checkstack.pl
To: Conor.Dooley@microchip.com
Cc: wafgo01@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_214913_039911_BC62B8CA 
X-CRM114-Status: GOOD (  26.32  )
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

On Tue, Jul 26, 2022 at 2:40 AM <Conor.Dooley@microchip.com> wrote:
>
> On 13/07/2022 20:41, Wadim Mueller wrote:
> > [You don't often get email from wafgo01@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
>
> I feel like you might've been mislead by get_maintainer for this
> patch. It looks like the maintainer covering this is Masahiro
> Yamada <masahiroy@kernel.org> (at least he's taken the last few
> patches for it).


I can pick this up.

Applied to linux-kbuild. Thanks.


>
> I'll be honest, I don't know how to verify that the output is
> correct - but I did run it & it does output something that looks
> sane /shrug
>
> Thanks,
> Conor.
>
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > scripts/checkstack.pl lacks support for the riscv architecture. Add
> > support to detect "addi sp,sp,-FRAME_SIZE" stack frame generation instruction
> >
> > Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> > ---
> >  scripts/checkstack.pl | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> > index d2c38584ece6..d48dfed6d3db 100755
> > --- a/scripts/checkstack.pl
> > +++ b/scripts/checkstack.pl
> > @@ -16,6 +16,7 @@
> >  #      AArch64, PARISC ports by Kyle McMartin
> >  #      sparc port by Martin Habets <errandir_news@mph.eclipse.co.uk>
> >  #      ppc64le port by Breno Leitao <leitao@debian.org>
> > +#      riscv port by Wadim Mueller <wafgo01@gmail.com>
> >  #
> >  #      Usage:
> >  #      objdump -d vmlinux | scripts/checkstack.pl [arch]
> > @@ -108,6 +109,9 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
> >         } elsif ($arch eq 'sparc' || $arch eq 'sparc64') {
> >                 # f0019d10:       9d e3 bf 90     save  %sp, -112, %sp
> >                 $re = qr/.*save.*%sp, -(([0-9]{2}|[3-9])[0-9]{2}), %sp/o;
> > +       } elsif ($arch =~ /^riscv(64)?$/) {
> > +               #ffffffff8036e868:      c2010113                addi    sp,sp,-992
> > +               $re = qr/.*addi.*sp,sp,-(([0-9]{2}|[3-9])[0-9]{2})/o;
> >         } else {
> >                 print("wrong or unknown architecture \"$arch\"\n");
> >                 exit
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
