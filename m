Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B986C44506
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywYtUfj/voe+aKbzVBVW3ESyz3I5yPgGks2qhenVyEM=; b=tCtZbPIA4EnhYh
	pPmdPnQ6chVAl5P6rc341bgS+HEhqnfCTo0Omc1UEaRnF+G64/rgXtQe3WZ+TAgBK91DTdzkcEzjU
	Gu29cfliP0r+z78ma5l5/JCED+kwXNojxtX7gEK3TYi6vISV5LvnGnzVcDrrXtpPBu/YpvMeaXLRU
	W7LJtnsbreLUOBuy/oH2e8hleV6yCnOD+szI7K5eWB9CbG8SbbTp/AqGCHTmVO5xSk9I+LdrmCMys
	Mk2QnRYOhN8CYnv9b5zeUYDnCqzsd4HCPZuXr5BIcgY7em4DZRqjmn2z/mC7RAK3wNyT+dGNwc00q
	svV9jpvZPiT/kFQ5JLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidaG-00000005xyF-0Pok;
	Wed, 21 Jan 2026 19:09:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidaE-00000005xxv-0Swr
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 19:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 004FA44042;
	Wed, 21 Jan 2026 19:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D7DC16AAE;
	Wed, 21 Jan 2026 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022576;
	bh=KL2Tnen2kIHUY1dDWeymZfKFuD7uZ9MVUAn4QAyYmQY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=epqsfxKNElJEjtN923mwMr2GHF1jdmCb4xW1reHHsNLfGSV3iEsHeW+4Ndg2Sz7LB
	 yOoiA1vhsRPvQIQOWmIaQgjUA1IhkgbN22F/LiwkEA4QjmCTigAzjSHdBkZQRKwj3P
	 Igdak/kw+aEpDoxoBtVoYkrnmy66QLEWk8es/oFDZCBBYOZu0DN5nGQD1Gbp+ebqKm
	 kgXfezilIh2pTcS/lppl6gEjUJrnKc45JF/ZQAKYCdugQ98/YZWr0147OUOfE3Bkxf
	 UW/CkXeKLKa/81bvmo43xU3GhzbWIeAQFldc+D2S3I5mTQGFejgW6J3MNYZPqua8hp
	 3mcofaaw8JnHw==
MIME-Version: 1.0
In-Reply-To: <20260114092742-GYC7933267@gentoo.org>
References: <20260114092742-GYC7933267@gentoo.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v6.20
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Michael Turquette <mturquette@baylibre.com>, Guodong Xu <guodong@riscstar.com>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@gentoo.org>
Date: Wed, 21 Jan 2026 12:09:34 -0700
Message-ID: <176902257445.4027.5972559722832621691@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_110938_191999_62DE9D6A 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

Quoting Yixun Lan (2026-01-13 18:43:33)
> 
> Hi Stephen,
> 
>    Please pull SpacemiT's clock changes for v6.20, This PR basically adds
> support for SpacemiT new K3 SoC, while doing this I've created an immutable
> tag (spacemit-clkrst-v6.20-3) for reset driver in case it also needs to be
> merged during same merge window, otherwise everything is normal.
> 
> Yixun Lan
> 
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.20-1
> 
> for you to fetch changes up to e371a77255b837f5d64c9d2520f87e41ea5350b9:
> 
>   clk: spacemit: k3: add the clock tree (2026-01-09 10:48:17 +0800)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
