Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CF3CA5FFC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 17:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mvwvwi2XAlXetBxGojAuefHvgyPkadu3vie32+I7yE=; b=AnuMkjvj3wx3ZH
	p4H6AhRA9jaTdRvUSSyMzCumhvfN3KYR2I5+PWEKowQm2CUqdscAlUlHRrb8tCcVdlc6C9Rmgv5SU
	sbvhZvNZB+rp/6xWoqdgzBd/K4sRp3aZbaEhDYUSC0nj8fBEgVs7n8Da7Hpj5SVG7rIg/E0fVPnNj
	PpwKZ/OVtApgQpjmuqNbOOcYUGVJ39LQ5z8R5t0uk+qHQer+4U//SzcGm1Ftc9+P/e7Jvbi2F6MJG
	vvxxN4v9aVJr6OAKfctlr+id77383tuvZ1YU+6yyqZG+ECELoBhNDdJbgHPkY1uO1/3sy7CsNzv4E
	8gZfwlEuHhd220EcsEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmFw-0000000Gtza-41iA;
	Mon, 05 Oct 2026 17:13:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDmFh-0000000Gtz9-3dAW
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 17:13:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC31E60008;
	Mon,  5 Oct 2026 17:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64D41F000FF;
	Mon,  5 Oct 2026 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220403;
	bh=PJGQiGG2EhFdB2vRXI/iToPB7BKM0nrSllWgrPUANUU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=WP1Grhdjr9mHHfqIVRUvx/mjm3ZRAsUhyQ3nUCRqi/Q+gXrYvCQopj+ntzVmhW6Qr
	 itH/aPggqcw86qFpEqX/OeKScRUJz+TicfSpbj7jDGTg9i3CjKuD6L0fL6iCa+JeyM
	 ng/eDkJGa4YM0KEeDZ+/x5JLhwADhdyusOQCXFKVOO3OrHK8qTPBIjIPmRP6Irqijs
	 4/+oRhbLJY7lhCYNgXoUV2WZ64FG7lbX7bLKEtcCOuKZvo8Z5Y0w4byDw07HpSGD5I
	 9vMrQV8eqn7BCrfM5mixvVmKUwU5iLqgxQKXRA9saa0TaF6F801CEEvy4bjG/niVfQ
	 gDAFBd2Y84RKg==
Date: Mon, 5 Oct 2026 11:13:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: shao.mingyin@zte.com.cn, gao.rui@zte.com.cn
cc: pjw@kernel.org, mikey@neuling.org, jiangfeng@kylinos.cn, 
    palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    zhang.yue5@zte.com.cn, david.laight.linux@gmail.com, 
    qingfang.deng@linux.dev, aurelien@aurel32.net, troy.mitchell@linux.dev
Subject: =?ISO-8859-15?Q?Re=3A_=5BPATCH_v4=5D_riscv=3A_lib=3A_Fix_ZBB?=
 =?ISO-8859-15?Q?_strnlen_wrap-around_regression_on=A0huge_count?=
 =?ISO-8859-15?Q?s?=
In-Reply-To: <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
Message-ID: <970c63ed-9fa8-9d1f-4521-0a7119b9d6e5@kernel.org>
References: 20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
MIME-Version: 1.0
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

Hi Shao Mingyin,

On Mon, 28 Sep 2026, shao.mingyin@zte.com.cn wrote:

> Hi Paul,
> 
> Gentle ping on this one - it has picked up more tags since posting, and
> should be ready to be picked up:
> 
>   Acked-by:     Michael Neuling <mikey@neuling.org>
>   Reviewed-by:  Aurelien Jarno <aurelien@aurel32.net>
>   Tested-by:    Troy Mitchell <troy.mitchell@linux.dev>
>   Suggested-by: David Laight <david.laight.linux@gmail.com>
>   Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>
> 
> It stays a minimal fix: only the two boundary-computation instructions
> in the ZBB path are replaced (18 insertions, 2 deletions, no new
> registers), so the scanning loop itself is unchanged.
> 
> This one matters for stable - the regression is in v7.1.10+ and v7.2:
> strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string and
> truncates names built through FORTIFY strcat/strlcat (device-mapper's
> sysfs name "live-base" becomes "live-bas"), which broke blivet/anaconda
> installs and LVM on RISC-V systems.  It has since been reproduced
> independently on a Fedora 45 riscv64 image with ZBB enabled, where the
> fix restores correct behaviour.
> 
> Cc: stable is set, and the minimal form should backport cleanly to
> 7.1.y.  Happy to rebase onto riscv/fixes or adjust anything if needed.

Thanks, queued for v7.3-rc.  Rather than posting a new patch, it would 
have been better for you to comment on Gao Rui's patch:

https://lore.kernel.org/linux-riscv/20260819161821053fNUWuvdGIo4HUBmxlcNfG@zte.com.cn/

However, since time is short to get something into v7.3-rc fixes, and the 
approach you took in your patch seems better, I've queued yours instead.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
