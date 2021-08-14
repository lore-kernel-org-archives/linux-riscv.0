Return-Path: <SRS0=nQgR=NF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD38C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 23:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D81A060F00
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Aug 2021 23:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D81A060F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZUu57z4ZgI6Z6MBPryXKR27B74kZVEUfepZX5Rvpyk=; b=yLXSnzWuUNiXW2
	1wFLuz9Kqum8I6oMesCSOPc8IWrLpmAsG191H5b/omNK1hqOsu/9r5bhAEiOvDl3a8keILvd1n8gQ
	8UP5cAAchXdNtumIrrvwjEGiiluocn2vgvs8g1vqm9L6Mbuh83Pyc0LeWPCK1Ze0gelOFlTnv8YVZ
	nFSlcwJW9IVdJHM9Pc0G56zbYRqz5LTZM2PRqSjZwQv5mKUQCiCO/DmBS/TDjbOZD+KpmzMXHHlpW
	jWUMEhMtQ8hvp0sXGY8Po0gUT1cSC8cy1NkKAz4+RgK6k+9yVS/wYxXiZ7fmuZYYyQksP8E5bU6Ih
	2MAP5pgLfp/BOIZ/wtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mF3Pv-00EiPP-5N; Sat, 14 Aug 2021 23:50:19 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mF3Po-00EiP0-J8
 for linux-riscv@lists.infradead.org; Sat, 14 Aug 2021 23:50:17 +0000
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 17ENnp0T018905
 for <linux-riscv@lists.infradead.org>; Sun, 15 Aug 2021 08:49:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17ENnp0T018905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1628984992;
 bh=4qC4AERb0Snk+55rk2CLhMwMYEU3AtPhxGssFF1Wn6E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2dbOfK20z85mtZRexmRyPdAfSlmQ0bHm8Jl+QEWw2ylAPkiK0jgeuKXizVsKL19BK
 ZLrJQdxtYIzkS4rBn948m0KKuMH/Vyy7/yOm50LEQcGJGMPRClb5MT2wNdxA9ribrw
 rXUQ3D1vpTW+/lpNrsnKze/ikY1CxKA1/wPDylZt67zO61DRpVpGNSkNp76BrUGBeh
 G1nNauOf+DA2J7WeIl55xMHl10zgACZ9CPFpsDkZ/Ze3k8e2gXVvDjpKU161zaK8WG
 GxV68Ntoklzat2/3Dxul8PmOzfJjeVBg83WmOtgyaCmrQkBKPcY1EgRO3CSjMTc7dB
 WVU48LLmjWpcw==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id w6so9528836plg.9
 for <linux-riscv@lists.infradead.org>; Sat, 14 Aug 2021 16:49:51 -0700 (PDT)
X-Gm-Message-State: AOAM5307lzp78IzumgvxTr6QX8zLqGclAEhdHiCBibi8jmfV4Dd8gbtR
 AyOSwZdA12FTwGLyc2PkQFyP/yic/YrjIsSUHrg=
X-Google-Smtp-Source: ABdhPJz5XOqnHANztna/aYDFzteB9C6xf5kkT9BSKSsHlNBNwwsYo2uIuqDV+v3Cw8m6EcYrntZp4ngs/Fdz8lEcXDE=
X-Received: by 2002:a17:90a:7384:: with SMTP id
 j4mr8993112pjg.153.1628984990887; 
 Sat, 14 Aug 2021 16:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210729142147.445593-1-masahiroy@kernel.org>
 <mhng-fe558e10-6cee-4e55-b975-8c525c2bcb02@palmerdabbelt-glaptop>
In-Reply-To: <mhng-fe558e10-6cee-4e55-b975-8c525c2bcb02@palmerdabbelt-glaptop>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 15 Aug 2021 08:49:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVjdVf5QRFduKrxb-TJyiCdUPkpSSMtYiS7yN2yAZhEQ@mail.gmail.com>
Message-ID: <CAK7LNARVjdVf5QRFduKrxb-TJyiCdUPkpSSMtYiS7yN2yAZhEQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: move the (z)install rules to arch/riscv/Makefile
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Tobias Klauser <tklauser@distanz.ch>, vitaly.wool@konsulko.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_165012_902877_071DA26E 
X-CRM114-Status: GOOD (  17.97  )
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

On Sat, Aug 14, 2021 at 2:00 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 29 Jul 2021 07:21:47 PDT (-0700), masahiroy@kernel.org wrote:
> > Currently, the (z)install targets in arch/riscv/Makefile descend into
> > arch/riscv/boot/Makefile to invoke the shell script, but there is no
> > good reason to do so.
> >
> > arch/riscv/Makefile can run the shell script directly.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/riscv/Makefile      | 7 +++++--
> >  arch/riscv/boot/Makefile | 8 --------
> >  2 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..3c437fb09a07 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -126,8 +126,11 @@ $(BOOT_TARGETS): vmlinux
> >  Image.%: Image
> >       $(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> >
> > -zinstall install:
> > -     $(Q)$(MAKE) $(build)=$(boot) $@
> > +install: install-image = Image
> > +zinstall: install-image = Image.gz
> > +install zinstall:
> > +     $(CONFIG_SHELL) $(srctree)/$(boot)/install.sh $(KERNELRELEASE) \
> > +     $(boot)/$(install-image) System.map "$(INSTALL_PATH)"
> >
> >  archclean:
> >       $(Q)$(MAKE) $(clean)=$(boot)
> > diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
> > index 6bf299f70c27..becd0621071c 100644
> > --- a/arch/riscv/boot/Makefile
> > +++ b/arch/riscv/boot/Makefile
> > @@ -58,11 +58,3 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
> >
> >  $(obj)/loader.bin: $(obj)/loader FORCE
> >       $(call if_changed,objcopy)
> > -
> > -install:
> > -     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> > -     $(obj)/Image System.map "$(INSTALL_PATH)"
> > -
> > -zinstall:
> > -     $(CONFIG_SHELL) $(srctree)/$(src)/install.sh $(KERNELRELEASE) \
> > -     $(obj)/Image.gz System.map "$(INSTALL_PATH)"
>
> Admittidly I don't see a reason to do it this way either, but it looks
> like the other common ports (I checked arm64 and x86) are doing things
> this way.  I don't really care that much about which way we do it, but
> it'd be better to keep everyone aligned.
>
> Are you converting the other ports over as well?

Yes.


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
