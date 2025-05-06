Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87125C3ABCB
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 23:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BtxJRx5jr0L1SvR+qfJ0R4dc4KqA/6YFwInWecQeYk=; b=wpBT7qYuVJ3okc
	ASuxlNtaCDDo+Yui7cAvr4iIHdM2Jwqfd8dp4YJWInTHZsKQXpWg3CXlY/pgkNbnnF967pMGbg9kv
	iFSJ8vdmYbM3lPI7aLjGnqS/0tagpD2ub3felcu6wINR+vIJ3yu5PkiniHqka0uVaTlSmBp3C+qqS
	sZYIRaIOn/OfrGzCwR+ESF64BLJepGmiMWTcJXSyqUzawe2ffySoHtXzjVN0g5tskcoH+cpA5/VZ0
	WguFsMIku38P9s1/IJRzxq2t4fl4fgmTYIO14BjxiYhFKHYE02Fz5iu8C3ZtuWGaE3NllEKmDQrdu
	g9kobHoPacVgK3kEE3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpL-0000000Dfss-1NRT;
	Tue, 06 May 2025 23:35:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMcN-0000000CvSq-02a3
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 18:02:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ABDA61165;
	Tue,  6 May 2025 18:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AC2C4CEE4;
	Tue,  6 May 2025 18:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746554529;
	bh=G1aAgIJtzzc73TTKS2uIpwQA5CYlGrgkkGROGjWiHJc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i4SvuSe0YE8MMNUJxcCVHkmGXKZbd6WaRRQhWFLObz9I6aPU+2v6xuBzi441ddLXp
	 WTRpCGegaBLcNbYhl4JwxITBh5lbWwSvZZLPpSAVFTLe2gej/7I3GgQTTLOgrhJMlB
	 uFMatuCF56OIwrgds16aBKk/2abnG46sKh6xh3EfTDrH+Ar6oItNpHZBk0ttxcLfU3
	 N+l3eQ9beE/mGxUloJ7BMnoyDlPY8qvJ4KDBvfF25a5FdtikmGae3qkTFCYxN5sxr2
	 fL/5hcVCmrMwkkXfl2x//7f8lHaiAthvn0ksThAe/ytgGK1Xg+E1ZXo0gk+kcAMVLr
	 0Ps6rElpiCQRw==
Message-ID: <a28e4eca6e2a9522cb8e707845a9117b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250430012941-GYA288294@gentoo>
References: <20250430012941-GYA288294@gentoo>
Subject: Re: [GIT PULL] clk: spacemit: Add K1 SoC clk driver for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: spacemit@lists.linux.dev, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@gmail.com>, Alex Elder <elder@riscstar.com>
To: Michael Turquette <mturquette@baylibre.com>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 06 May 2025 11:02:07 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Yixun Lan (2025-04-29 18:29:41)
> Hi Stephen, Mike
> 
>   Here is clock driver added for SpacemiT K1 SoC, please pull for v6.16
> 
> Yixun Lan (dlan)
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.16-1
> 
> for you to fetch changes up to 49625c6e4d90a9221127c49a11eb8c95732bb690:
> 
>   clk: spacemit: k1: Add TWSI8 bus and function clocks (2025-04-17 03:22:56 +0800)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
