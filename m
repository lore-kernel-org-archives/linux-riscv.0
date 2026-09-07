Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277A2C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1O9QATLEAbDwGeFz/vvDdl7IV6lLOtjryxYdEG8f228=; b=r7wnH5d/veOEET
	gyaRqVTzrdv/TzG9lPI2Ipjcx4thgN0+A6LnmHQ2SxuDuYE4tDlODdH9xzr801KelZ+g90VG1TURC
	C8VBplFbmnvKXs7zjct032IeH9UjWkxXAmQ1Dt19WrSk8pxOkSDtExvspucj83kioCZVbMPM8sRHP
	vxiAIHcJ6ekOxkgJ1Obrobwvp9P8f78m/CXuxp4wLCqqtAISaXRdV/cS8Mlusx4u41zC6bH22ajqW
	NAdANZZD8LdfRHHyLwSzzPJhgI8eROIlAC2J5Y+vpAq/AUh6u/58KZFPptjNvnQXKgcJ/KiCmb3aO
	PDwgIU1Vkfy9tsv6zY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U0g-00000006B5J-3KJP;
	Mon, 07 Sep 2026 07:43:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3U0e-00000006B4p-38JC
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 07:43:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2812E43A93;
	Mon,  7 Sep 2026 07:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B81E1F00A3A;
	Mon,  7 Sep 2026 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788767000;
	bh=Zr7A1tEkdrp6PUTPuyC3f4qOvrO1WN8HeZNd7b+EEUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AeQB8rer4btJEQehOGOZQzkGmqSKHoF1A2AQ0KWb7GqXcwXkzwQhi2qQFlycyFhH4
	 m4QX7T5IY5HfTPSgfCYUIH8hH/mbaWVBR7qPeDd3iFP5z1AscBuF9OlaQfgoD9mla0
	 AWWaeS8EPGVER4XHkmflz/OIUvRXXF7EosYS+CjfbQpJbl2G2+t2DGW/6mxHxpeSyq
	 1cWbjl6gZ7vNGqW4O9VgVktFugiG7/UKkczJmD3b669H+L7dnhMkMKu+F0hzWN1zTK
	 JFg+Qu+hLKR3c+woX0+CaNJnBnxjghNENqUYreylOl/EsQEbqmzqoeuWQVWuJippc8
	 LUNWhoHyZOoBA==
Date: Mon, 7 Sep 2026 07:43:16 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>,
	Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <20260907074316-GKC2330@kernel.org>
References: <20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260907-k3-pll5-pll8-1800mhz-v5-1-5cc96d716b0a@linux.spacemit.com>
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

On 09:54 Mon 07 Sep     , Troy Mitchell wrote:
> The K3 CPU PLL rate tables currently describe only one rate per PLL,
> although the hardware supports a wider range.
> 
> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
> support rates from 1.05 to 2 GHz. Populate the tables with every
> supported rate in 50 MHz steps.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Cc: stable@vger.kernel.org # 7.0+
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
