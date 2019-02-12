Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5EDC282C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 20:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 620A221B68
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 20:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtQPbPB2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rS1bcNk+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 620A221B68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jh8Wisz4kAPldokmYKQTg355UHEXBeAyoFKSaC5MiSk=; b=DtQPbPB241p0fr
	7FRLDhawumZIM8QGu0mqLKS8J3+VdVDq8vm1MCIMZALFKN/vXWalmD9ysgT55jbDgpkH46aissfJD
	cV3vM8h5dsgO26g9tlVORiGG95QojM7V9EB09YaoKz9KJmUlOigW+okvuojHyYOWdpCtcNwtHx1DI
	e9hroX76/BvR+pkgYVlkRRGXG3qia+NsQlT2C6P5Y+Z0eMLZSBZz5jpf9cF0Zq19RBnqPod95+bLO
	d/J/EXIwOBULqb4EXyRprTwxpUwj4J4DSRY8VCZm2MM2z1KkPDO77XtrX7F0eI/0U/UXuBnviB2k9
	bSF9NCjsewLkDi89EekA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtePG-00038z-M7; Tue, 12 Feb 2019 20:11:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gteP4-0002z1-KY; Tue, 12 Feb 2019 20:11:40 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61B81222C7;
 Tue, 12 Feb 2019 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550002297;
 bh=3jUa/zunVYEZn+DyMnsy8KXouqEiFYqtXTvcx6an4qk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rS1bcNk+w8HmhmSC51+HlkPK92wtM4VYvSp1r6hov6nO+UgUiVmNcSMLjdzccAjIS
 CGfD1WLWCgx6ETbf06Bs3l5HGaxPcdQTrOW4X3yWLL/uX4LMGl6JioWcOF3ro1y/xl
 I2QY4V+JzHuYKiqSYoL+o1vgv+BgF3yQob+EZwW4=
Received: by mail-qt1-f170.google.com with SMTP id w4so4556690qtc.1;
 Tue, 12 Feb 2019 12:11:37 -0800 (PST)
X-Gm-Message-State: AHQUAuboDxmhowUrps8CFaULZenvs3M5SIlQaHMCK6PT7C+Tx3mtfTAY
 HF50I6VQa9pPJH0oZU1cqlGdL4Vsk20wo//frA==
X-Google-Smtp-Source: AHgI3IbkdyI3kKb4Rqp5UgWWae9Pz2hV3loOAoVLCgrxJ3QQUi58Dd1hLL5El9rPrWVkYWU9ykNePmU2n4HW1F2r7SM=
X-Received: by 2002:a0c:9e05:: with SMTP id p5mr4072679qve.246.1550002296610; 
 Tue, 12 Feb 2019 12:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-5-hch@lst.de>
In-Reply-To: <20190211133554.30055-5-hch@lst.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Feb 2019 14:11:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJFGhTa+izRTeUxjtbyOek-zynZofOJGDK+xZbD4r5H0Q@mail.gmail.com>
Message-ID: <CAL_JsqJFGhTa+izRTeUxjtbyOek-zynZofOJGDK+xZbD4r5H0Q@mail.gmail.com>
Subject: Re: [PATCH 04/12] of: select OF_RESERVED_MEM automatically
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_121138_694193_FAE4BE9F 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, Lee Jones <lee.jones@linaro.org>,
 SH-Linux <linux-sh@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-riscv@lists.infradead.org,
 arcml <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 11, 2019 at 7:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The OF_RESERVED_MEM can be used if we have either CMA or the generic
> declare coherent code built and we support the early flattened DT.
>
> So don't bother making it a user visible options that is selected
> by most configs that fit the above category, but just select it when
> the requirements are met.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arc/Kconfig     | 1 -
>  arch/arm/Kconfig     | 1 -
>  arch/arm64/Kconfig   | 1 -
>  arch/csky/Kconfig    | 1 -
>  arch/powerpc/Kconfig | 1 -
>  arch/xtensa/Kconfig  | 1 -
>  drivers/of/Kconfig   | 5 ++---
>  7 files changed, 2 insertions(+), 9 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
