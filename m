Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A86DC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2Y9sVOcO00jzrAUBDDZ13JClIiy0Pxi+fiJIkG9MRo=; b=17eEfu2tP9exT6
	z+lAQtBnts4+mEFEOvZk27Xs960SQKy23d4YJlGep1C8MCcxNbi7d9FkxlBnOLehlKgHxMIrY157J
	dL4y9A84u3/T8Lo/7R/IryzU/UWP/gw5uZrZBJro0JJsyrju1Dk5a3EHIXy+xlrlbdD0RZZpin+Yz
	P8+QqQ0kR9gxw+hknPYSVyRPhoryRKnFl7/ZQmgLB+99CsVfPzFRgVlbVgy3ObgH3ZG3TNGGEyDut
	QNMdI3HnAe3l8D7+pyNqoDIY55u2ilHhDv/r3s6ZtdWFuIF0Hos+2dwZ/0dJdQ09GTCL25B2Iawrj
	nAVje0sbuiIkC8H31oaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Gw-00BPWV-Lp; Tue, 29 Nov 2022 21:36:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Gu-00BPVY-CL
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:36:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD3A0B8190F;
	Tue, 29 Nov 2022 21:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A799C433D6;
	Tue, 29 Nov 2022 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669757765;
	bh=3KIQnw0NnPKuqprUYf8yQHE+pa9Hn9xsZhMXfMacs3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbzWBs9y/Ojy4//+Xh38Z0uw+tzTPGcaERHeXpw5p7w8XHEqhJz49LP5TkD8x9dnC
	 MeupO0IckobF/QLICxUAOplt4kwK0rWRW7j2FwskSbnhIyy9C4dfgZ15rnXLUX79Sn
	 HXQTe8pMj0VCw/5FgddVEcvUwcyyFA01it/5MORxJI4gW8rjXNgbRTURu0PYBz1pvp
	 2rYhJMEbMNMP5amGjnBf/3qjhcP9VQixtHz0NlUGly1YSfoRNFUYCIJZZAe4tp1yRf
	 2wufRtR1naZgs020Lf+jbBZ+ZwRnAtTf4oWlfj5c374OR+KzNIQidbTLtlEdrRu5Rj
	 jd5geCInsBWTg==
Date: Tue, 29 Nov 2022 21:36:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	daire.mcnamara@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] RISC-V: enable sparsemem by default for defconfig
Message-ID: <Y4Z7Qcfglxv6EuZz@spud>
References: <20221021160028.4042304-1-conor@kernel.org>
 <166975687110.10326.1643787645847753206.b4-ty@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166975687110.10326.1643787645847753206.b4-ty@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_133608_580672_7D070A87 
X-CRM114-Status: GOOD (  24.37  )
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

On Tue, Nov 29, 2022 at 01:21:11PM -0800, Palmer Dabbelt wrote:
> On Fri, 21 Oct 2022 17:00:30 +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > on an arch level, RISC-V defaults to FLATMEM. On PolarFire SoC, the
> > memory layout is almost always sparse, with a maximum of 1 GiB at
> > 0x8000_0000 & a possible 16 GiB range at 0x10_0000_0000. The Icicle kit,
> > for example, has 2 GiB of DDR - so there's a big hole in the memory map
> > between the two gigs. Prior to v6.1-rc1, boot times from defconfig
> > builds were pretty bad on Icicle but enabling sparsemem would fix those
> > issues. As of v6.1-rc1, the Icicle kit no longer boots from defconfig
> > builds with the in-kernel devicetree. A change to the memory map
> > resulted in a futher "sparse-ification", producing a splat on boot:
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] RISC-V: enable sparsemem by default for defconfig
>       https://git.kernel.org/palmer/c/41555cc9e2e9
> 
> I put this one on for-next under the argument it's not actually fixing a
> regression: if flatmem is now broken then that's a regression, but just turning
> it off isn't really the fix (even if it's still a reasonable thing to do).

flatmem is not broken, or at least - I haven't seen any evidence of it.
It's just that to support multiplatform stuff properly we should not be
assuming flatmem since systems may not fit the bill. The above oops is
because the memory map is too sparse for flatmem to keep papering over
the cracks any more after some DT changes I made for v6.1

> Maybe that's kind of pedantic, but it's late in the cycle.

No, that's perfectly reasonable to me. I'll just add an exception in our
CI for testing v6.1 when it becomes a stable kernel to not build
defconfig as-is ;)

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
