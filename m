Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ED9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 12:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D9B611CA
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 12:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2D9B611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WstGsolX31hUtBkMUYq1CRA5DQJ/1Tdjq3UpKd85gAc=; b=HCiFwITj/Sh5IJ
	OhA6VTtUlnMLEOgM312ddT5HrAiEProkeSq9at7STgeVaIPx8NJpdMs/oHRqPKppQdZMMqMw35QDC
	7SdTarXLDN/pOlwcFApdO/L62ni35irh/1J2zVPXOHKka9z60Wb8IlzO30rew6buJdxBPuFH5OzXV
	fJ+A+PzojHJ3058UkLJYLaH9l+ngmkkNHCtU6kCn40pI5uf1axXZuH40dVlpdUhpJMouF0wAtMgH+
	XAxcOcboJrRpPh+JyQ1pdJTpNS+LjxbSErXaXSOfV/tjbJ94rUn/6LDmuVgrR27bHWt2CahB9CkNd
	UglMm7bSLwBuVnd3RGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCIw-00797z-FY; Tue, 28 Sep 2021 12:33:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVC8u-0074zB-LP; Tue, 28 Sep 2021 12:23:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C4CA611C3;
 Tue, 28 Sep 2021 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632831808;
 bh=03/X04FU8UxgwY9Mo44SL71H8TSm+bohH5WJX8dDLIM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lXMQvuUeDrOCpRx58iDmKbIyMuSR7PFdyV6WSvhmNLnwTdy7J6qzqmgP4RhhKAr5W
 UvM/K2ZUJQSrsnYxKBWDVFQXv+jcM6keKcw202J4p1+kx9uj2f1AXr2rkN/fD/8tcG
 9wASBGQkch33emvuAHSyBCuLfbqtHGLPZO7F/7yDDG+XobvW7qWLQZc+il4FxSQLal
 2vkqYtcLcJXtz76iKAbtzKEMDR6o/EbxRgzCfx4rivClk+fMLrCPHbm2w/Y2RCnA0N
 jdvt7THT496W/bXzRQCDV9D0dWtaemplMu7moy4lnNGvAh0uGuUT1AxnJYQnWI8qGG
 Ipw9xGp1yZ4jw==
Received: by mail-wm1-f45.google.com with SMTP id v127so3325694wme.5;
 Tue, 28 Sep 2021 05:23:28 -0700 (PDT)
X-Gm-Message-State: AOAM533wDhWJDnwmCsVN8tD2BeFhLsz8EsZb9gxA92EkOb0ax14VgAZW
 6Ltv6aV9yHTyfgKxZM3ovpl1JQHQ3WXR1I4j7Ac=
X-Google-Smtp-Source: ABdhPJxYldORYw+hO1zWq/uLFvhSnh5cxNha2dBDAYRrpPQ4C27UAAvrZ0nnDHSRNRZxLVjpogTo9BmSECl/om/jbF0=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr4467363wmc.98.1632831795912; 
 Tue, 28 Sep 2021 05:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928115856.GK4199@sirena.org.uk>
In-Reply-To: <20210928115856.GK4199@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Sep 2021 14:22:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
Message-ID: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ia64@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_052328_800304_1BD7F771 
X-CRM114-Status: GOOD (  15.94  )
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

On Tue, Sep 28, 2021 at 1:58 PM Mark Brown <broonie@kernel.org> wrote:
> On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
>
> > Not sure how we'd want to merge this patch, if two other things
> > need it. I'd prefer to merge it along with the QCOM_SCM change
> > through the soc tree, but that leaves the cirrus firmware broken
> > unless we also merge it the same way (rather than through ASoC
> > as it is now).
>
> We could also merge a tag into both places.

I wonder if I should just take my two patches as bugfixes for 5.15,
after all they do address real build failures. In that case, all  you need
is a merge with 5.15-rc4 or higher.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
