Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA295C5B572
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K82+7cYG9v/1NY0tlUvA4lZuZxAr4TwB710gkGCJyf4=; b=rZjUnog+PhW/My
	/Hp6ynVa1/HwzwUYY/H5Cm+mhL8PbaIiwzqje9EmLhVsZhfHMDWoWwmm6hSQWz7S+IzFt9UX5IRrp
	ofLOiHHBVPtvQUNfJ1HjvNvIoyMTniVmmC+fyc1SgoBgXhTptwkjAC0UswniEpIasLRk9l7MBQS59
	TrctVv42mWfCWCGHKqPSplBjNaAf0Qmj+BQrdkfgjMUejKZMw8ZCUqYkpXPB8logkNk4/6pJNDEH9
	z+GOSIpzf7/kMToqgAiuGfzwhGs5tEULNE8a1mxlYnJzMm+lvRwBA3HPdVPrpj0/pgKtgPDeM51Eb
	XXrwx/DoB4qsn1hcpzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr2T-0000000Eji1-2sRk;
	Tue, 11 Aug 2026 18:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtr2R-0000000Ejhk-3zpn
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 18:17:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 64FDD600AD;
	Tue, 11 Aug 2026 18:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A91C1F000E9;
	Tue, 11 Aug 2026 18:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472243;
	bh=cq4yAgddgwMxze16Cx7rF1nhbwgu2c0MJTah2bwMsuQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=P3E/H0u0DWRHlz1e/KeGyULPwI0uH3SiPzzpcTV/R4Fnc4loR/S8hPqxlhRR3vaYJ
	 n23WZwN6TcHaTmzAYnm/VmshEvGybrTIoTDGAtHvYHxEofbn3tx4AXWlGafy0PWyEq
	 3/wMWDaNI3QChrfHPKbOt5B68aV2bYQykKIvmDmt7HqiRVeFNID4ZPTG15AJDNX4Zj
	 3rP049JG2dvGr2a0/h5yJhAU8JFPaFSKI2huN7xK2BFy2dWI8RkZhDiL9EkAfOr75d
	 C7+c9ZfbJ67LqD75JXWSxWVpJ4fMChuz9uYzjZaffgsWcBqdD2YQ0sa82OPxiRbXJo
	 mJH4xjTEmhH0g==
MIME-Version: 1.0
In-Reply-To: <20260706203425-KYC2957292@kernel.org>
References: <20260706203425-KYC2957292@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: fixes for v7.2-1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Tue, 11 Aug 2026 11:17:21 -0700
Message-ID: <178647224123.5862.9538366108280919307@lazor>
User-Agent: alot/0.12
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

Quoting Yixun Lan (2026-07-06 13:35:51)
> Hi Stephen,
> 
>    Please pull two small SpacemiT's clock fixes for v7.2
> First patch for USB2 clock fix need to go in pair with USB2 reset fix, the
> reset part patch was already accepted by Philipp Zabel as a fix for v7.2.
> Second patch fixes a system hang due to HDMA clock being shut off.
>    Thank you
> 
> Yixun Lan
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tags/spacemit-clk-fixes-for-7.2-1
> 
> for you to fetch changes up to eb525edd48907795c0d4e498ff57ad168070b289:
> 
>   clk: spacemit: k3: set hdma clock as critical (2026-07-06 19:45:17 +0000)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
