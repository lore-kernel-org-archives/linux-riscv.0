Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4088C7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 18:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MBemVmY86P22v9+0F/SiPDnf+bV5Hf/9kFPJfFxTH9U=; b=pFSDX1jgSALCgA
	hIU4pp8LVsmTQzUZhc1DmooArXgn5CN6QGRJJ4HopUygQ5jK228x3UU/BbS6HnLMapeV0UEFqcJEe
	8nKLhRl2Y9TdS5y8M14GUhj8VK2c1UVrQn+VS/XeW36+lEQUX5cjLXIESh3IefSt1hOEYmLPaxni2
	Q88+/2BlW0bjfrTiXkha1tDEtQL4N46CIckt/T/7hv5GdSJ7BnJtpV2VOb7T1pyugmIMbrNT+G+/T
	6YtjMfQXqegMLrW8YB3vN7I0J5QMDFTOkrjwUY3WJlpSvzoWn1EgpQjyYw7/Pw+ZzXDLQEz5kEuE/
	qWPulifZSPukTvC2MT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xxx-006qyF-2B;
	Wed, 07 Jun 2023 18:33:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6xxu-006qxQ-1I
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 18:33:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F19DA636DF;
	Wed,  7 Jun 2023 18:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B2CC433D2;
	Wed,  7 Jun 2023 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686162781;
	bh=R3ANen+nYxN6y2OhJU+Wqoin5M/3/8ATRMK3ROqeqcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzNRu7ISd5l4UK3JJuIXR252/aenULzsrVwMXDBzfZFCivBgNQSd3bjhhzuabBrVJ
	 sO2VDTaqp77COxkZ81fy9UxOiy6V00xDgngTb/PO7ZRp6JrFoce7cGKPFzLtUccBy6
	 NdfAAaJnv/tbhPeR7IpAyOQ9bW7XHmtRzm2VeSJc=
Date: Wed, 7 Jun 2023 20:32:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Nathan Chancellor <nathan@kernel.org>, sashal@kernel.org,
	palmer@dabbelt.com, conor@kernel.org, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, ndesaulniers@google.com, trix@redhat.com,
	stable@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 6.3] riscv: vmlinux.lds.S: Explicitly handle '.got'
 section
Message-ID: <2023060752-chaffing-unable-8b26@gregkh>
References: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>
 <20230606-exploit-refill-b9311f2378f3@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606-exploit-refill-b9311f2378f3@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_113302_481373_AD04E693 
X-CRM114-Status: GOOD (  16.93  )
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

On Tue, Jun 06, 2023 at 11:40:35AM +0100, Conor Dooley wrote:
> On Mon, Jun 05, 2023 at 02:15:08PM -0700, Nathan Chancellor wrote:
> > This patch is for linux-6.3.y only, it has no direct mainline
> > equivalent.
> > 
> > LLVM 17 will now use the GOT for extern weak symbols when using the
> > medany model, which causes a linker orphan section warning on
> > linux-6.3.y:
> > 
> >   ld.lld: warning: <internal>:(.got) is being placed in '.got'
> > 
> > This is not an issue in mainline because handling of the .got section
> > was added by commit 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
> > and further extended by commit 26e7aacb83df ("riscv: Allow to downgrade
> > paging mode from the command line") in 6.4-rc1. Neither of these changes
> > are suitable for stable, so add explicit handling of the .got section in
> > a standalone change to align 6.3 and mainline, which addresses the
> > warning.
> > 
> > This is only an issue for 6.3 because commit f4b71bff8d85 ("riscv:
> > select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL") landed in 6.3-rc1, so
> > earlier releases will not see this warning because it will not be
> > enabled.
> > 
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1865
> > Link: https://github.com/llvm/llvm-project/commit/a178ba9fbd0a27057dc2fa4cb53c76caa013caac
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Seems reasonable to me chief.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Now queued up,t hanks.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
