Return-Path: <SRS0=gQVT=WE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B996C0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 12:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80926214C6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 12:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uLFqI/Oo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtZVW9S3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80926214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJK6O/t8cIuolTZ213z/f/fSx50PLG0xT9FG/DVzd3w=; b=uLFqI/Oo4AkQGj
	qg6j4xBlWyjX14Q+egNljqGU21HCxN7dTycp+ZfnzPk0BWkrAfNqHglpjOOlsMRpHewCVa8meOfz6
	clCx1qe12AbqYxXox+Aa32ErGoAtjopgrXcOM7lvjo/VHTdLRNbM2/mDu1iw9U2ODRhmsLDhqBU7d
	BhLUJSv9SIajSER/cj3fUGElqggQu7Y6PotHm62E8nosNbFVGypkU9TKDr/9VMQlbdD6qpe7BBPwU
	VOuOaQQVOOfn5Fdjp+TLg8Ykp3alO9fyPwC7db7zt9rmU/W9ENaGWPUN4UKB1dRAv/JrER4imwbZ2
	mw2Lfg8OPwG1mcSEQ6pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvhNt-0006Z0-Qf; Thu, 08 Aug 2019 12:19:09 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvhNr-0006Wu-8o
 for linux-riscv@lists.infradead.org; Thu, 08 Aug 2019 12:19:08 +0000
Received: by mail-lj1-x243.google.com with SMTP id v24so88844279ljg.13
 for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2019 05:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WM5R1w6ZezI/U8oeoimaxsFIAEeSSoKIeGsMNKCHrOU=;
 b=TtZVW9S3NzftSIyl46edaBOsxhYUU/PJIt3TV5e/GJUECtRdRaD2cs9B7G0qAEnOHS
 zSUpkH471fkaogRmFu8LreJyZEjTk8jBQ7cUGhiZs+MnFimMUf10YYwLG6CTX6SRA/fO
 335JeQdgMuliSyhVeo242x46hP7T+tfeXhEJUzm7l5Fw6M8RyJB65bB2HFDI9A1XUvdh
 aNhCKcduCr4il74S/575Zd4cUkflUIqohzFq5nBbXtQQUdIpDg8XLgVGoAjUZXYQ+X/o
 Yb1QvPjrBmbzhaj1LBOpIcQoj83MXoWAolPfb17JpMRdrV/x13u+jZ1kx4bCWqfQISmQ
 7GWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WM5R1w6ZezI/U8oeoimaxsFIAEeSSoKIeGsMNKCHrOU=;
 b=su5/PwdKZX+ISjiYjC9JuvBpTH9GjRmFZqQRpX+1t8ddVaeJ29KqgLsCA+V8bBOY+V
 bVImMC5Z3CaEXkAplGe8DFr1w9uUOMkSAJgToEjg292N8lyIt2GaVFGvROBI3ROSjezx
 N9OLUGrxn4xssFpEHZVT+BDylKUaXosA0NNp/cm7V/KqtaS4iRFW8sJpBx+2isjFs61w
 OdE60qNX5lXONYk0ZdrroBdYXg9DWSc2wQgPEiQM7+S35JzC5le2taycrG+3TBGmL0oq
 ux2blQrND8jsGUdsdR/DeWuhCCBSklzhJ7zTF/tmktPvMoAnMBiEUgBx17AFf2MDTkYk
 j/bQ==
X-Gm-Message-State: APjAAAXitEU5SED4Vzsw5dwcMFgeSRyYZNFA9sH3eik/VkNlGIAqJcmM
 khZiJehfI3yLNjLPnIixbx4tR/XUPh9UJghiibQ=
X-Google-Smtp-Source: APXvYqxaF6HN4Qke9gmz3jYRh+w8mmBxBNf6ZxmxMIqo3nQ5zpxPLpKGvTx8Va1CrAD4fJ6XJ5TLEzX+iOAKCqrnz5A=
X-Received: by 2002:a2e:8696:: with SMTP id l22mr7985367lji.201.1565266744317; 
 Thu, 08 Aug 2019 05:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1908061929230.19468@viisi.sifive.com>
 <CAEUhbmVTM2OUnX-gnBZw5oqU+1MwdYkErrOnA3NGJKh5gxULng@mail.gmail.com>
In-Reply-To: <CAEUhbmVTM2OUnX-gnBZw5oqU+1MwdYkErrOnA3NGJKh5gxULng@mail.gmail.com>
From: Charles Papon <charles.papon.90@gmail.com>
Date: Thu, 8 Aug 2019 14:18:53 +0200
Message-ID: <CAMabmMJ3beMcs38Boe11qcsQvqY+9u=2OqA0vCSKdL=n-cK9GQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kbuild: drop CONFIG_RISCV_ISA_C
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_051907_317670_93E9C36B 
X-CRM114-Status: GOOD (  11.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Please do not drop it.

Compressed instruction extension has some specific overhead in small
RISC-V FPGA softcore, especialy in the ones which can't implement the
register file read in a asynchronous manner because of the FPGA
technology.
What are reasons to enforce RVC ?

On Wed, Aug 7, 2019 at 2:29 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Aug 7, 2019 at 10:30 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
> >
> >
> > The baseline ISA support requirement for the RISC-V Linux kernel
> > mandates compressed instructions, so it doesn't make sense for
> > compressed instruction support to be configurable.
> >
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> >
> > ---
> >  arch/riscv/Kconfig  | 10 ----------
> >  arch/riscv/Makefile |  2 +-
> >  2 files changed, 1 insertion(+), 11 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
