Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E68C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWPqINtUfPUVxJ5xKs9zj7CjjK5LwrolHdfixEp9vlg=; b=YvNthjcXtNKrBc
	5QvBg4/9rc/YpDy8Olk+CJqLpJgeVBxtBzpESH5ltKct8Mgon5AByQIkGBtCBxKwmZ858QUrUQ927
	E6Yj+2TbkOr0hwfiyAIkJA1z6pMyFz8oVkac4QV4y8QlgzcanZQfK0a1WbUmzn7UJfqaT0yz/lcUJ
	uKPOoj7yRkEXdur1AQNg3gyLHnJP9TDuzl6jfan5E7rimLy2G6Jae2uh3HjgPKA7y660Smwsx4faK
	h0w9IcxXVkyyXWpteqZiNabKqQW2kYEb9ALt2sisNJdarmQDFwRlpGWBap77brlOxtBiLkuUoZa3X
	/Ypetl+8r/tbQG9hoipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDWD-00000005DTO-3Uxo;
	Fri, 10 Jul 2026 15:52:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDWC-00000005DTI-1Lrp
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 15:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63D5E60051;
	Fri, 10 Jul 2026 15:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF921F000E9;
	Fri, 10 Jul 2026 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698719;
	bh=0Sgoh7/RxsFePSFsMzG9fKuzgPHgLtxTqVoyNO11ia4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jAWE/UXLy+qngfTw9rxZFmgWyYnkZaeBz4l0Yn4XxasgdrrruSe4DnKmbzqIIfSEf
	 nudYP7EzE8bv3mQvXiX12I4SqlkgG57ZFne6Qv7pCdynmqIj6aflpMknIR8NktBPEi
	 rgMKIjPwFzzNTrDN51ShNbrMC1gdwSz1Hwp8Cf86N7WiwmPSMcTqJvvuamYCjzfLG1
	 zWXOa57dk9oz+mcmyO41SznnoW5J/f4RznnaZ0SisEU0U39NPpht2z/qMdR+EnEFjV
	 Q9uCVD8bz+8OT7UA+qv0ez4sv2L/KFFkAUhanJsuQsLy+WPhu5BjS/QqhgNucp22dD
	 D6j5NAvIOo+Gg==
Date: Fri, 10 Jul 2026 08:51:55 -0700
From: Drew Fustini <fustini@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.2
Message-ID: <alEVGzSqo5FANRTa@gen8>
References: <ajAt3ml9pMIMTLTq@x1>
 <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0f61421-5db5-474b-b904-b5764352671b@app.fastmail.com>
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

On Fri, Jul 10, 2026 at 04:23:54PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 15, 2026, at 18:52, Drew Fustini wrote:
> > Hi, this is a late pull request so no problem if it misses this window.
> > It is just a single patch for the WiFi driver on the TH1520-based LPi4a.
> >
> > I recently setup new branches for riscv defconfig patches and they have
> > been added to linux-next. I talked with Conor and this seemed like a
> > good way to pull in defconfig patches that RISC-V SoCs need without
> > adding more to the plate of the arch maintainer (Paul).
> >
> > Thanks,
> > Drew
> >
> > The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> >
> >   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:tenstorrent/linux.git riscv-config-for-v7.2
> >
> 
> Hi Drew,
> 
> I assume you saw that this didn't make it into v7.2 and you
> already plan to send it again for 7.3. If not, note that
> the URL above is invalid and the tag is no longer there.
> 
> When resending, please use an https:// type URL.
> 
>     Arnd

Thanks for replying. Yeah, I sent it very late, and looking at it now, I
also did the pull request command incorrectly as it is actually in
fustini/linux.git.

I'll cleanup for 7.3 and make sure to use https://.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
