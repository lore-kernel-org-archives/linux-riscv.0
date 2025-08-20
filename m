Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C48FCA0EDC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7os+gOVW3OrChaObmRf357nLkXR7GmdmqavqvsoT6o=; b=EDjGMtv3dARZyQ
	LIcPz7+La50UKc4AH272Q4pPqpYiQHcuBdk3MyOdcvw83H6tE7KPbvrjAfEvwtHmtXPCim27bF1+a
	PKsF0ej0XHzMX27lMHVsCfn39wSEGPygP+5PTlcGqFg5A+OIEQtR/+vDCGeH4KvJ89iCIWNEqFt/f
	t2hdWe984DV+x4Iaw5Y/MLAlGuCuES+OSIuuNoQeBU5V5BHUDGbCUW9Gz2eT2mYYE2MNN3bAUDGX6
	y5YMO1mURymZ4Ybp143KPWUb0XCdUe+qS8n7S5/G0QvgCwV/4DVonDXQRzS4geKfAaEHY0ktOJyT8
	Sn42yfwrBrw+eBvWPMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplB-0000000Et6r-10vl;
	Wed, 20 Aug 2025 20:50:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolP5-0000000EM99-3dPw
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 16:11:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB01443DAD;
	Wed, 20 Aug 2025 16:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAE9C4CEE7;
	Wed, 20 Aug 2025 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706269;
	bh=kILSVk3z9gI+nFGfR1y5ThbvAl+I3YUQHPIyOglHZhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7AiuSJHOQJiqlv8uD9FBGgeBFTKKvDcdvlq6x5IWBb0UlDJhj+vzIHW/5y2C3mn6
	 EyOvm0QWPGDdv2EW8cRjyzcyD0YIaDSKiOoS/OZIECJflmbbpbAeo/6IVCY0xapsMn
	 xU41tdoZvlQ2Q9Z99eMMr1zm74Lzh3miB8pgDLoWG070z2+enR8ycjy08wLrLSKtWD
	 PJX2zlPNEpbf2O3ScCCW9wHsY78289YB9c1goxC9QoKdK5bRz+xkbOgKLNnKs3LRvN
	 QqDp8MrA5hLfpCzIRhOWuoFtUa9uQHSZBwc0aU3WDoqI+4lNUBmWcDbmqZ5o4u68pc
	 eel+KA9tJ81xQ==
Date: Wed, 20 Aug 2025 09:11:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 07/10] riscv: Remove version check for LTO_CLANG selects
Message-ID: <20250820161104.GA3805667@ax162>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
 <20250818-bump-min-llvm-ver-15-v1-7-c8b1d0f955e0@kernel.org>
 <8078e385-e08e-40a5-b6df-31c0b5be8f43@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8078e385-e08e-40a5-b6df-31c0b5be8f43@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_091111_935190_373DBD34 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Aug 20, 2025 at 09:23:08AM +0200, Alexandre Ghiti wrote:
> Hi Nathan,
> 
> On 8/18/25 20:57, Nathan Chancellor wrote:
> > Now that the minimum supported version of LLVM for building the kernel
> > has been bumped to 15.0.0, there is no need to check the LLD version
> > before selecting ARCH_SUPPORTS_LTO_CLANG{,_THIN} because it will always
> > be true.
> > 
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Alexandre Ghiti <alex@ghiti.fr>
> > Cc: linux-riscv@lists.infradead.org
> > 
> > Small note, this will conflict with
> > https://lore.kernel.org/20250710-riscv-restrict-lto-to-medany-v1-1-b1dac9871ecf@kernel.org/
> > but I think it is simple enough to deal with.
> 
> FYI, I'll send this patch for some 6.17-rcX.

Thanks, that would help.

> I found another bunch of LLD_VERSION check in this file that could be
> removed:

Huh, I am very surprised that I missed those :/ thanks a lot for
catching that!

> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L253

I have added a patch removing CONFIG_RISCV_USE_LINKER_RELAXATION.

> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L262

I don't think this one can be currently cleaned up since it won't always
be either true or false.

> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L630
> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L731
> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L746
> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L781
> https://elixir.bootlin.com/linux/v6.17-rc2/source/arch/riscv/Kconfig#L804

I have added a patch converting those version checks to just LD_IS_LLD.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
