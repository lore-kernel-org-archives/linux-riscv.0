Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89748FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNr6eNQ04ZhLI0rHh+gmeWDj3ITCm9mfDf1t2VNLO3o=; b=Csp7cVz6UyaYtw
	x1ReozK4CsJIP36OTGgX1yfPS5rl2GWeOjgZUryDWTf661OLKdLzdFyZbxUjNQXJ2Htq+SSUiXosf
	7OjkYhlevwQ79VSWhHuCai1quWNUa6FwAZ9NmvVvqXGfJu7X1MkidzUta1T2cA/f1V0TolxiIdYWs
	OGDcxBbsei5YTyhNUD5IkFlzeF3jEa0oacmy65xSADQn2aW7URU+VOrUQwqnYkqKQNqlJLCi2uMLs
	5E5ILZLVixr7nER5w5km47IGVfXTawaPeFW1NauYKaKAA4l0VcnNnWXI0Q0Y0m5IuXUTxvQKmmzUA
	j/wvjsdXxDHHKxUZO6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt3-00000002rl8-24k6;
	Wed, 29 Apr 2026 03:46:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvt0-00000002rk3-1JtK
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 03:46:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 607476132D;
	Wed, 29 Apr 2026 03:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285ACC19425;
	Wed, 29 Apr 2026 03:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434413;
	bh=45IZZlvy5m8D36o9FxaXN13xt/oU1CnjDv56aCuJzOw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CMEZ7Wx7i3JLG2fPGaPVomVTVfvffC472xgvjoZrpwaNiVAfRiOHWTnWFVnRWToVE
	 hays5e0R4dTqkVq1BdIET7Q0CVhsHHzduG/KP1ixv9tcV2kQaXXv64ubYqSh1qtNdi
	 861p4mBw9gtSA2PVgMXWb9E58QtUPGh/M0Ks+MCrBxJZXEmzk1VC3Uf6QTZJjgWrXN
	 nthuhbNW9cKa+Srv5wUooxyoS1JFoV91HgxBhPBi9JqkAYlPAeHaISRCxd4vjhqk5A
	 4YQ29V/6m3R6VE6mHMBpuG52yP71wFK8HTKEmENdI95bSrNTSXJiumKyWLCax3x+Gh
	 bbttZw/UW+eYg==
MIME-Version: 1.0
In-Reply-To: <20260424-k3-pdma-v3-4-efdf2e414a08@linux.spacemit.com>
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com> <20260424-k3-pdma-v3-4-efdf2e414a08@linux.spacemit.com>
Subject: Re: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
From: Stephen Boyd <sboyd@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, Guodong Xu <guodong@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vinod Koul <vkoul@kernel.org>, Yixun Lan <dlan@kernel.org>
Date: Tue, 28 Apr 2026 19:03:19 -0700
Message-ID: <177742819927.5403.12105832893857014560@localhost.localdomain>
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

Quoting Troy Mitchell (2026-04-24 01:20:32)
> top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
> all memory-mapped bus transactions cease to function, causing DMA
> engines to hang and general system instability.
> 
> Mark it CLK_IS_CRITICAL so the CCF never gates it during the
> unused clock sweep.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
