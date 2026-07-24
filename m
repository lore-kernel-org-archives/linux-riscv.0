Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01560C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 22:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5zepeJiY6MJZKiEmgAYmSgAk/CCuIxK+S8iLiqRsMpk=; b=lj6Q+R+MFa11ip
	1v7nXePFFxKhlGynwuCuDFlE2s2a7qJE61/YCOJZ+4alhDO59hn7Zxrw6M5pvfGtdXus6muqdo3ro
	i7SVwRwGp+keF3xvyipZQw8mpLLpPiI+Z6J9XnsnPlaNDwx0/z6TjHHMsuOHRysf94GYHGN2keP/c
	Azmr99qy2AzMEmzpLS+s7u1x3MVanVApYvBmfwU0COtg9sIA8xkGEHvQuLgtjUj9PkldPCjFK0b0x
	5OUMtGNIF81xXbS3gDK6JiM6BqgqHu8t7q9at8m2LwyazNsex3gL2ncYZWt1LsCYqo/+RaeoTh/jT
	G3brquKAAzRVm5ARmptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOkX-0000000HLDj-12Ki;
	Fri, 24 Jul 2026 22:52:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOkU-0000000HLDb-0txJ
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 22:52:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 235284034A;
	Fri, 24 Jul 2026 22:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C821F000E9;
	Fri, 24 Jul 2026 22:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784933529;
	bh=j7VH+I1lcj9KOCqFU/y/KDTXauZwmnuiNnkt0ffMsyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vx2PrZUNdbhNA5e32im1FcrlqlzID9yIgWaOccGgWy7tnwVk696zvUlJSPHsKYlGi
	 gKzSo5R5i92N7fE27fNPAnKJWCvj/pKBWM9eX44lq+/LkGJ4v44Gzsc0YBaBiWIvpo
	 ffI8bb44JNyeAGjZudK3SM3U2o96mFxxyubGxfJNlTgYEsHiQ2UDq0dBD1GzwgZhm7
	 4abwKjyOoolzDVXVsPUsfSzF+8M2w5ngb67UfNJ7kwAvpVt+v9YJO3XBBIVzXn1EyX
	 qZKmxhumcavIvL+zLez0aTYn76FQlNqsqt7iS6zP1SSeOFk+VKFegE3oApyhwtJ02p
	 2j3efIWm/xDHg==
Date: Sat, 25 Jul 2026 00:52:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: spacemit: request IRQ after controller
 initialization
Message-ID: <amPsP5o2wWqszbfU@zenone.zhora.eu>
References: <20260722094302.2284191-1-lilinmao@kylinos.cn>
 <20260723021140.2293844-1-lilinmao@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260723021140.2293844-1-lilinmao@kylinos.cn>
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

Hi Linmao,

Please, next time don't send the v2 as a reply to v1, it makes
things confusing.

On Thu, Jul 23, 2026 at 10:11:40AM +0800, Linmao Li wrote:
> spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
> the controller and runs init_completion(). If an interrupt is already
> pending, the handler runs too early: it reads registers while the clocks
> are still off and calls complete() on an uninitialized completion. Request
> the IRQ after the controller and completion are initialized, but still
> before the adapter is registered.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Cc: stable@vger.kernel.org # v6.15+
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> v2:
> - add Cc: stable # v6.15+ as requested by Troy Mitchell
> - collect Reviewed-by from Troy Mitchell and Alex Elder

No need to send a v2 just to update the tag section.

Merged to i2c/i2c-fixes.

Thanks,
Andi

>  drivers/i2c/busses/i2c-k1.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
