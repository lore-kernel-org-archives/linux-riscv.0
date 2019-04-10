Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36B8C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 06:59:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF2F217D6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 06:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T57wDgJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF2F217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOSbJyNfqXyydYRWmCl5NGAkfA2W9GpxneX/rDTPPO4=; b=T57wDgJwASklI6
	FjXkEwJYQ2AsapshbFGEUNCNFBiT6rYUUbguyleQooS2hBS8FG09OtwJlTg465vFrW3KqolAmRsyO
	LlfjWYTajOlIspWj+Y72no1VB+IX+bsZvtqwakHp7Cl6gbmt4tt6EFHdKfunorKxdN+1kQ1NTsALv
	kloFU5cHuUHRKeCGv1Byp0Y7XYGl5Iy5OavN2IcVcRpbrZAxUfd2PoRC+TdhdLoBJESkaxc4WwCUN
	rz2cG+dR9yaZFqi2uVb/o9LV9jC02z1PE+tCDavwXb5ufLzAoyYyOmza0dmVlS4IYD6b43Uc9vKnl
	dQMsw1+RU16XiYWJdZ7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7CR-0003R6-E6; Wed, 10 Apr 2019 06:59:11 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hE7CO-0003NH-8Q; Wed, 10 Apr 2019 06:59:08 +0000
Date: Tue, 9 Apr 2019 23:59:08 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 2/5] arm64, mm: Move generic mmap layout functions to mm
Message-ID: <20190410065908.GC2942@infradead.org>
References: <20190404055128.24330-1-alex@ghiti.fr>
 <20190404055128.24330-3-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190404055128.24330-3-alex@ghiti.fr>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 04, 2019 at 01:51:25AM -0400, Alexandre Ghiti wrote:
> - fix the case where stack randomization should not be taken into
>   account.

Hmm.  This sounds a bit vague.  It might be better if something
considered a fix is split out to a separate patch with a good
description.

> +config ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
> +	bool
> +	help
> +	  This allows to use a set of generic functions to determine mmap base
> +	  address by giving priority to top-down scheme only if the process
> +	  is not in legacy mode (compat task, unlimited stack size or
> +	  sysctl_legacy_va_layout).

Given that this is an option that is just selected by other Kconfig
options the help text won't ever be shown.  I'd just move it into a
comment bove the definition.

> +#ifdef CONFIG_MMU
> +#ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT

I don't think we need the #ifdef CONFIG_MMU here,
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT should only be selected
if the MMU is enabled to start with.

> +#ifdef CONFIG_ARCH_HAS_ELF_RANDOMIZE
> +unsigned long arch_mmap_rnd(void)

Now that a bunch of architectures use a version in common code
the arch_ prefix is a bit mislead.  Probably not worth changing
here, but some time in the future it could use a new name.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
