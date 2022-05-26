Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15656C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uj+81JzFOWywJwlWtYbrBKCUiPkk4MkRVMgFDMBjo4=; b=AFacJVu6mPcPFs
	GYBalRO1jR6SGbRSsYNg3sXqjeTnYQtX4m3FRGKd1fBEI07EKWK9ocN+BvBtIy3W4mMFt3DZqF9Jr
	YPmZUUJuX6LHzcmv0LrNEhABGZZyAkzLQCHh176OOpBz5ZH35N/tusQom+eKwz6ccuUn9/zsXXqmv
	JpUf67/b7Gxu64kZk5Bz5SbfVeOs9QPp/Z48UOv+auJRLLGXoNjQJqC/l/nEujR0j/zs9YrNN7Dd+
	3eb8YlRRO70LR6K2OGQIYZldTpVhwk7roQHhS0meImS8/j7GoYvM716Yn5gbAlQ0gG2SDB4TGetlH
	mykN8DAYBJbill7wRQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKim-00FydV-QR; Thu, 26 May 2022 21:08:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuKYv-00Fui6-Iy
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 20:58:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nuKYt-0006bZ-PZ; Thu, 26 May 2022 22:58:27 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de
Subject: Re: [PATCH 0/4] riscv: some svpbmt fixes
Date: Thu, 26 May 2022 22:58:27 +0200
Message-ID: <3505332.hdfAi7Kttb@diego>
In-Reply-To: <20220518170254.3178923-1-heiko@sntech.de>
References: <20220518170254.3178923-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_135829_719586_5252496C 
X-CRM114-Status: GOOD (  13.70  )
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

Am Mittwoch, 18. Mai 2022, 19:02:50 CEST schrieb Heiko Stuebner:
> Some additionals comments and notes from autobuilders received
> after the series got applied, warranted some changes.
> 
> So this is a small collection of cleanups for the svpbmt v10 series.

I've just sent a v2 of this which added another patch onto the series.

See https://lore.kernel.org/r/20220526205646.258337-1-heiko@sntech.de


Heiko

> Heiko Stuebner (4):
>   riscv: drop cpufeature_apply_feature tracking variable
>   riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
>   riscv: make patch-function pointer more generic in
>     cpu_manufacturer_info struct
>   riscv: fix dependency for t-head errata
> 
>  arch/riscv/Kconfig              |  9 +++++++--
>  arch/riscv/Kconfig.erratas      |  1 +
>  arch/riscv/kernel/alternative.c | 18 +++++++++---------
>  arch/riscv/kernel/cpufeature.c  |  5 +----
>  4 files changed, 18 insertions(+), 15 deletions(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
