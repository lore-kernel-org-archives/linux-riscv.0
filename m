Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BF3CAC593
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 22:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2f+HPD4gE2dnMDTFQWVrYJu+ZEf5ZFzbLS+EKMV2W3E=; b=06iZhB60Ho8FHL
	GUs6Vw/YPFX4KejaSf4pdutehPZm39h9npWtsvIkn05CNfk1f0msw/C8tNDAjJZPRtM1n7W8dxW/e
	JV6OONWEzR6ifbD0JOiqyAmWNfFl+N61er9RXBQ1FDNNnxslWCdDIw6quiQNBdJjTT6eqKjxaaMai
	3lLVNvW/x2qrk+ZRyIjpgLuJP07VeqTBLci/s2rjuIj3I9KtA/NMVZv2DuhPHWWOyUyoBOviR4NNW
	/+YuvOkjrF4WmGPiOIoCfIppgFNjj0KSnIXZ3BB6Xl7WIAcdKrZxbysaN7ekrwTKkrIZQ3URAuIfD
	YwgJz88W8GcR22kBo7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYNd-0000000GSnb-3W8i;
	Sat, 13 Sep 2025 22:06:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxYNa-0000000GSm3-2s6F
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 22:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C689344C21;
	Sat, 13 Sep 2025 22:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5BFC4CEEB;
	Sat, 13 Sep 2025 22:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757801157;
	bh=fuRN9sDs6dXkvQ77eK0VxpVXR3WpUFozkEd78OmmtIQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=We1IPP37ACpr4Dzx9imqWs8RBtMbfJ0aPIIGonYxVnzzE0YoY9L0wvLxb3n15N/x0
	 1XcXEBJsUxH5WKPJy01d7yms75Ra2pMC5Dr6uP4TfknhyeHUE5CS7P7bw54Gg3RSWu
	 Ss76ZOnuaIDAWi6mYM4BU4XV2AyCKbr5MWIb1Y9fRknSfGNTX13kuz5Gki9BSrbEZe
	 /VUBhc/Vrh9KMlEIzk02idGYtkf9BEisHOF//lRdLCZcR2G9K15h7ZpYMVXiKbwb3b
	 PZTduFEp88X7F7W41WWYyigrL8i1JVg5esTBm0m+F9nKhCeHuC7iCY/JoQVAsaJXYR
	 cufAiI7N0YKtQ==
MIME-Version: 1.0
In-Reply-To: <20250909171321-GYC7803064@gentoo.org>
References: <20250909171321-GYC7803064@gentoo.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v6.18
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@gentoo.org>
Date: Sat, 13 Sep 2025 15:05:56 -0700
Message-ID: <175780115692.4354.14857999848718953911@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_150558_739997_4BBE2034 
X-CRM114-Status: UNSURE (   5.79  )
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

Quoting Yixun Lan (2025-09-09 02:15:03)
> Hi Stephen,
> 
>    Please pull SpacemiT's clock changes for v6.18
> 
> Yixun Lan
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux tags/spacemit-clk-for-6.18-1
> 
> for you to fetch changes up to d02c71cba7bba453d233a49497412ddbf2d44871:
> 
>   clk: spacemit: ccu_pll: convert from round_rate() to determine_rate() (2025-08-26 06:07:45 +0800)
> 
> ----------------------------------------------------------------

Thanks. Pulled into to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
