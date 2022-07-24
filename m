Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2544C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqKG1rg6G0lwjR/7MFMN6pKzhXip5K3ZSkn8mOzoOh4=; b=m9TqUE/7XxnEhE
	ZRkZKmKABA5jvM8HdrLjmsPAnFslmRtHwOb5YjSgbd6t1Grn3AupjC/Iwh/Th4ZBCmUANOXm8kV2p
	oJqwez8Db63hiMp6rm1z/9wTjd7bHRBgyIWlcbLeHbi7X5CHHKmIfL4dww8yychTLWS6fcy7MGyES
	ClwhP2gfHckpu43scAi/nJ3/+m52EPcGzVWZ6GOPvIJSmuo2c67HYHKYgjy3mlHKmWa2OUQL2eWzP
	6s4Yxshqa6kQRDC2m8TY7ixLavXshmMmiNm/m1wEgRzbQrGM+KI5EFjO2/JEkBkrcWnWNr+6J+8/A
	oEtLyRK8oZN8BYc88nfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdIq-006p2R-MA; Sun, 24 Jul 2022 15:13:56 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFdIn-006p1F-SV
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 15:13:55 +0000
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 26OFDbYB022701
	for <linux-riscv@lists.infradead.org>; Mon, 25 Jul 2022 00:13:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 26OFDbYB022701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658675618;
	bh=oiFMhm7uDjU3kqq1a01hrOtShD22Qh3LrQK0lfMWe9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A3UlfYb+zU4edSjqU3suKNUFKaWpU2OUYSgmaueuooSedaujiCC4SPBnM7AapWgb5
	 JEas3SQWl3RHGyMgrTfKVMxtrhnD9X5CGO3Lo41kPNQ8HbZf278t5Gzsio/dtcNTw4
	 cAyVRzrj6KOH6Nc5UxWV4wFc0YYKZgYzMDoK1EbBOp8qplS9uIN1wZj2co/NU9qk09
	 tChl/cFRHSTjAjeN/z/KqHvGJS20KO8OAtC7qECKsqto3TaFe0HJ0DZEO4IqwnWqwn
	 ySnnP/Z7zL+PDto7jSvo3Z41J738Mu0GD27OXpBzMeQPXc2M3mkIiti3NeJO+NbYla
	 r5XnWF2oYLSAg==
X-Nifty-SrcIP: [209.85.221.41]
Received: by mail-wr1-f41.google.com with SMTP id h9so12706010wrm.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Jul 2022 08:13:38 -0700 (PDT)
X-Gm-Message-State: AJIora/EWZG/8CyOVDdDNr52yyJ2SGUuE29iRfvgkSzpyYwCJAaI/OeR
	eIZMFabc3myiAJKIisj3pxrW9pEYPTNGIc38U3g=
X-Google-Smtp-Source: AGRyM1uShHrO4T5UY6OkXCTlB4FwmFpeRAb42CPm68h6kQJyePMiAKxYFTuMHzEAd03vpoTkKvgGqonm79ayIOslvxk=
X-Received: by 2002:a5d:4e08:0:b0:21d:a689:7dd1 with SMTP id
 p8-20020a5d4e08000000b0021da6897dd1mr5254632wrt.477.1658675617101; Sun, 24
 Jul 2022 08:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223438.835408-1-masahiroy@kernel.org>
In-Reply-To: <20220625223438.835408-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Jul 2022 00:12:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyhvn1mU=cAA5zagJMExnfoTEZqi2irVvBKxfooA0JVQ@mail.gmail.com>
Message-ID: <CAK7LNARyhvn1mU=cAA5zagJMExnfoTEZqi2irVvBKxfooA0JVQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/purgatory: hard-code obj-y in Makefile
To: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_081354_163651_D02374A4 
X-CRM114-Status: GOOD (  14.71  )
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

On Sun, Jun 26, 2022 at 7:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The purgatory/ directory is entirely guarded in arch/riscv/Kbuild.
> CONFIG_ARCH_HAS_KEXEC_PURGATORY is bool type.
>
> $(CONFIG_ARCH_HAS_KEXEC_PURGATORY) is always 'y' when Kbuild visits
> this Makefile for building.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

 Ping?


>  arch/riscv/purgatory/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index d4df200f7edf..c2d14e2f345d 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -92,4 +92,4 @@ quiet_cmd_bin2c = BIN2C   $@
>  $(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
>         $(call if_changed,bin2c)
>
> -obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += kexec-purgatory.o
> +obj-y += kexec-purgatory.o
> --
> 2.32.0
>


-- 
Best Regards
Masahiro Yamada

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
