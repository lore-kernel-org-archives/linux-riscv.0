Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58230C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSdo/3yfIkEYWAJinXkZfH+5yvFSsXCp9yI9It9spgM=; b=zUSUzup+RX3a/Y
	R0XcMSzCJARfrYskBoe711gwKkFdA+diL77v5dmGu/zbpy1ZA0TCW22wZvy5oCj9y4pzbvs9A5fRI
	YrTcX0S45plRc+w3BYYnGbj9AEcgwPxxyEiAh62nfUE4FUUMiS+B0LmpTtuM01cNPXQZlubRKbj9L
	cnbfPBHgucI37zlAOGAM/HNDySC6oMFHNhythTKnfQ2pUnRXQq1FsE6QEYYYvC2ZlqDb5AbCuWS+R
	6hRyhTr/Lq3Qtl7t+gX5GL8LSO1dj8mR2chkz/yietkxPoW3AOGnIbDOs+aCgpfA7ez/MMb7dSZm9
	1BLVPQJXNtdb3rz8f5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thaUr-00000001N9o-264H;
	Mon, 10 Feb 2025 20:35:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaUp-00000001N8q-2NZP
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ATbIomvA0CFvw89gXQZaIyQGKreDtxRz2w/GlH0/m/Y=; b=g6iFpU5bKNcAL75EHNcb5v/SWE
	QIELIsaN5zWNFYVEX+0qRaDEtC2iOhVu0BBqIwlTcguxpijw9GFzey+ahmOZZk3JJpVSnVetZ6DXR
	+BVIB+L2CdbVxxpNuobFn9tXKcTfkKcoJjvcnb2eLxIZiKFFRJlQwvPm4OmjABaBE0kAuno9Eipah
	HzUN55Da5obMsENHj9rbEiPf5qV8kO/KFOli/YNqeNbNBAJj8DdiJO+TaQJ69VvPYJOz902lZ2I5b
	d58hHt0E087g+Bhhe2oePt0hQ/Zox+4L0WYW276uSC8juXb4odLVMG2ypnLJ6YSXaE+W1/ZJtDCAY
	reAAYJYg==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaUm-00000000EtX-21uL
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD312A4118C;
	Mon, 10 Feb 2025 20:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3C6C4CED1;
	Mon, 10 Feb 2025 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739219707;
	bh=OECw0u7i4muZXytvNKEOLncdneDKdhOefhqMgPbmzfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4mnDFPSEL1n4qJPB9cSa+/IjIgz2RtVcax8/3dL4uXpCEWZb0qlN881QV910ZBtJ
	 f1cI854VMlvSv2hg2dIh7uOCtJGGEdHsE8p+t/qsOF8RkrBVQRxi4DGyAHCyj484gW
	 fhXtEq5hKzPzc9IKtjBv16B8LbFMROnXsn+VJ8ZIs2JEEEWPah6Ny4yBA/4fI9DnPH
	 JW0JVz+Kwdp2gGGQEzN72I17FWjXyk/NiC7wXEea+R3FC19nw1bjFj5L5NO/vPwlAf
	 XZaK4Ycx5W9I9WjjtJ1uxL6M+1DjLOBYMiK7lOBci2ABQ0zrY7mY59QLEf9+hmWRGr
	 oSUtyQkj9gH7A==
Date: Mon, 10 Feb 2025 12:35:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH v3] riscv: Optimize crct10dif with zbc extension
Message-ID: <20250210203505.GA348261@sol.localdomain>
References: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
 <20250205163012.GB1474@sol.localdomain>
 <20250206201950.GB1237@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250206201950.GB1237@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_203508_723320_A242B0A5 
X-CRM114-Status: GOOD (  23.07  )
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

On Thu, Feb 06, 2025 at 12:19:50PM -0800, Eric Biggers wrote:
> On Wed, Feb 05, 2025 at 08:30:12AM -0800, Eric Biggers wrote:
> > On Wed, Feb 05, 2025 at 02:58:15PM +0800, Zhihang Shao wrote:
> > > The current CRC-T10DIF algorithm on RISC-V platform is based on
> > > table-lookup optimization.
> > > Given the previous work on optimizing crc32 calculations with zbc
> > > extension, it is believed that this will be equally effective for
> > > accelerating crc-t10dif.
> > > 
> > > Therefore this patch offers an implementation of crc-t10dif using zbc
> > > extension. This can detect whether the current runtime environment
> > > supports zbc feature and, if so, uses it to accelerate crc-t10dif
> > > calculations.
> > > 
> > > This patch is updated due to the patchset of updating kernel's
> > > CRC-T10DIF library in 6.14, which is finished by Eric Biggers.
> > > Also, I used crc_kunit.c to test the performance of crc-t10dif optimized
> > > by crc extension.
> > > 
> > > Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> > > ---
> > >  arch/riscv/Kconfig                |   1 +
> > >  arch/riscv/lib/Makefile           |   1 +
> > >  arch/riscv/lib/crc-t10dif-riscv.c | 132 ++++++++++++++++++++++++++++++
> > >  3 files changed, 134 insertions(+)
> > >  create mode 100644 arch/riscv/lib/crc-t10dif-riscv.c
> > 
> > Acked-by: Eric Biggers <ebiggers@kernel.org>
> > Tested-by: Eric Biggers <ebiggers@kernel.org>
> > 
> > This can go through the riscv tree.
> > 
> 
> Actually, if people don't mind I'd like to take this through the crc tree.  Due
> to https://lore.kernel.org/r/20250206173857.39794-1-ebiggers@kernel.org the
> function crc_t10dif_is_optimized() becomes unused and we should remove it, which
> would conflict with this patch which adds another implementation of it.
> 

FYI, I've removed crc_t10dif_is_optimized() in the crc-next tree via
https://lore.kernel.org/r/20250208175647.12333-1-ebiggers@kernel.org

If you can rebase your patch again and address my comments, I'd be glad to apply
it to the crc tree for 6.15.  Thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
