Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FAD61406
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46FAD61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FiJjTV46mjnmq/weQbsq3yyp+Wi+5fNA800PADf8T9o=; b=TT8S4GbMJ/o555
	IfUYlCoMiv0nM5/gG2FlcvDRqxpMgwuXj4/49EmOp92h8DyRY3pB48DLB772XeM0hWj5K+UFmJ+rP
	Uw+2nKiZ0Z6y76zhzRa9yvwbRAIObHKeUq45Rs/FpTfuDy6n3WBe4jFBw+0dhRwjTTH0Y/bL6FqTf
	kzzJ12Hse3X0Tm7IyLlSZT/hHNHwdiozShZo0leIcIBbTiMEbZ0ATPQBFgBC881ImnxehIfgwud+h
	Msvfo4q+aOg1o5H2v/lgrFPckwurbyf4MmvJqHEFpzbIoIICu3f3IdyZrNp8DrCiNMRW5SGei8+27
	ucOmpY8+HRhqOXE36Uyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb4U-00BRym-Es; Wed, 29 Sep 2021 15:00:34 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb4S-00BRx6-9x
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 15:00:33 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso3197158otu.9
 for <linux-riscv@lists.infradead.org>; Wed, 29 Sep 2021 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TyCjlk+pKET0YnhEJ9dBR7JvrBUso42NvxusqbVesPE=;
 b=ZRsAtTKKZkNWJDjgYxhe3J0JQ6O4p9PNnpilI5M/5ibU0Ns8JNWVFybSsX6EBzrksN
 R65R1h5hDzyJkWBSxO3Xxu/askCvW9MkdwMQeGoYWNAp/yRQTADpthmpMjax5IO0Q4WI
 ABtba/4i+sNFFRausiGclbZIeWVV4PF2DdELi3MG65Kq6dNP4mPUi67cxEZH2EnIRgh2
 3YDUFsI25i8zD+stDMZoSIPbe7zURBUfdxGb9UdP1TCeRUrIk9n+aGAbWLeeuzYU6cgv
 YlHzJlkMzt/yCDcFfWeOtRlteCpTbVMVzBTbhRhqYzLKNUw6qhAkjCl4deGNv2Zh0TQ0
 ZoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TyCjlk+pKET0YnhEJ9dBR7JvrBUso42NvxusqbVesPE=;
 b=q6+YsNZ5HrNm1iEaO27IW4V0qCpYcBgNaMe284ZKVz7l4/VXhFjo11O9dU8k93tm4z
 kR6dgMcJBOu0hpM2LBrM2EX+E4atqIc1MtPyNR1I+bUSksw5/J/dIssCFhgw0hUioCEy
 r55q36jgh1ifQMmfF8lYhEcmnYAtMeYDxU7Imf/zTL7cBboY5vf1WyAnTtQRyq+VVKGe
 GdRFENEdlihGnZ5KjkrnsX6VgbcFSP4Sa/RZAf9diBEYWDkGcoYj7KH4SAc1oxxI4K/X
 4Cs/vRVnccyL7ibb/FjqDFO4iMRycpEfqzkB0rxn8/eaVu255nnvYWTh+nvM40p4wIKr
 WigA==
X-Gm-Message-State: AOAM530v7JP8VJZj96Nfl50WJEel3dZQaTDgyGaf3Dov3h6/bHsNhgUC
 qkTGY+E6i+0lhtTOwjQIZyGg9g==
X-Google-Smtp-Source: ABdhPJxvnP/V+YuEnXmU9u5fhBlMx5mvuyCq8Z16F2mnD2G8Ku4DbjlhH8TBG8+ZLm2LdxATitXYnw==
X-Received: by 2002:a9d:3e54:: with SMTP id h20mr421968otg.236.1632927631577; 
 Wed, 29 Sep 2021 08:00:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id y83sm490275oia.47.2021.09.29.08.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 08:00:30 -0700 (PDT)
Date: Wed, 29 Sep 2021 10:00:28 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
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
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <YVR/jMv5HZj1hxmI@yoga>
References: <20210928075216.4193128-1-arnd@kernel.org>
 <20210928115856.GK4199@sirena.org.uk>
 <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a05oRxgncJb04+niAKSO_2Adki03a04tnj8YuQT=Py54A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_080032_373203_4C7B762D 
X-CRM114-Status: GOOD (  21.31  )
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

On Tue 28 Sep 07:22 CDT 2021, Arnd Bergmann wrote:

> On Tue, Sep 28, 2021 at 1:58 PM Mark Brown <broonie@kernel.org> wrote:
> > On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
> >
> > > Not sure how we'd want to merge this patch, if two other things
> > > need it. I'd prefer to merge it along with the QCOM_SCM change
> > > through the soc tree, but that leaves the cirrus firmware broken
> > > unless we also merge it the same way (rather than through ASoC
> > > as it is now).
> >
> > We could also merge a tag into both places.
> 
> I wonder if I should just take my two patches as bugfixes for 5.15,
> after all they do address real build failures. In that case, all  you need
> is a merge with 5.15-rc4 or higher.
> 

I'm in favor of this, better get it over with.
With QCOM_IOMMU fixed up as well, feel free to add my

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

on both the patches, and for the qcom_scm changes you have my

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
