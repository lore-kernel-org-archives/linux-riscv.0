Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8507AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 10:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DF36135E
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 10:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50DF36135E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhR+yajOTlxKkjBrZpK+zWmlCwNJ3KIKRMUd4Mp4S4s=; b=4SOC6wISDZqv5H
	scIFZPEZjzKmptIBzdi+gKl/ud5SINad3X/mGaP3/39m3mTKAQ6nbAWDeHmvJYnsq0h37X2Om9Gw/
	PHhUIw28cS7HQkwFmEKn/F42eLJlLv4K8CXeGbJmSpy8fkwfRlLfUnfkGhnMz9y7T1UgSEcb1D0QI
	iorzi10IjCivZjKHxvpFL/q50GlshQvgiRLzSx8k82db1J2EHRhe2Fr+5/6HqG3oygxa7Tijeaa9o
	ICzXv6lH539S9sLA0xdaYJTzTXCBa9Dwj9+TsrqiGoou/j6Q5XDElWsL9vqohbSGsETiwCefGBfyc
	6LYo2OnvKPMnYVBYvDMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWel-00AhLG-21; Wed, 29 Sep 2021 10:17:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWeY-00AhIa-Cl; Wed, 29 Sep 2021 10:17:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 596CC613CD;
 Wed, 29 Sep 2021 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632910650;
 bh=ApwjsuHkRLKIvYsUtPvCU+3a2n55yhVlsEyPpAqiq0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7UIdY1ptOrLLATvIT6DQbSfUmSx4SW/6eQVuBkuabAAD6uJYv4KiaePlAqUnYzIO
 GWvJvq0km3JiPj6oi8WIpC7VAhVnopNtYfFQ5TfCQmqWH/jYFXW5/5nc9UXGqjZfMb
 s4b9oUKpC2NR2W8UPrHHup6LTDl/yvXmNXhJnb4D4YqHdXiDvgoKL1VAUTAE/OzaT/
 h7v+R1Nu8NrQgzctHkX8920rEm0HTH/b5a/VWhWRUhVBHJLYHe88ZnR+UOy/kHxHQm
 KJlpI5M79mfgpL7cLLj6EGaYGvFx8zdBTlGWVrlYSSCCzBuvmaOxsoj8MrcBrikKei
 DEg8ELCDAzEng==
Date: Wed, 29 Sep 2021 11:17:21 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20210929101721.GC21057@willie-the-truck>
References: <20210928075216.4193128-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928075216.4193128-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_031730_490761_40775F1E 
X-CRM114-Status: GOOD (  27.75  )
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

On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing drivers that require access to a firmware layer
> fails when that firmware symbol is unavailable. This happened
> twice this week:
> 
>  - My proposed to change to rework the QCOM_SCM firmware symbol
>    broke on ppc64 and others.
> 
>  - The cs_dsp firmware patch added device specific firmware loader
>    into drivers/firmware, which broke on the same set of
>    architectures.
> 
> We should probably do the same thing for other subsystems as well,
> but fix this one first as this is a dependency for other patches
> getting merged.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Simon Trimmer <simont@opensource.cirrus.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Not sure how we'd want to merge this patch, if two other things
> need it. I'd prefer to merge it along with the QCOM_SCM change
> through the soc tree, but that leaves the cirrus firmware broken
> unless we also merge it the same way (rather than through ASoC
> as it is now).
> 
> Alternatively, we can try to find a different home for the Cirrus
> firmware to decouple the two problems. I'd argue that it's actually
> misplaced here, as drivers/firmware is meant for kernel code that
> interfaces with system firmware, not for device drivers to load
> their own firmware blobs from user space.
> ---
>  arch/arm/Kconfig    | 2 --
>  arch/arm64/Kconfig  | 2 --
>  arch/ia64/Kconfig   | 2 --
>  arch/mips/Kconfig   | 2 --
>  arch/parisc/Kconfig | 2 --
>  arch/riscv/Kconfig  | 2 --
>  arch/x86/Kconfig    | 2 --
>  drivers/Kconfig     | 2 ++
>  8 files changed, 2 insertions(+), 14 deletions(-)

For arm64:

Acked-by: Will Deacon <will@kernel.org>

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
