Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511DCCA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 06:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnDKbpgUurYP9JaNVQIeRp17pMInxRv9hRE+hnDyBdE=; b=e52HuBgXF4Al/8
	q/L0G+vufYzZunwZ6jXC0Ly7s43ogv1Rs8I2PLkqgnPQow1xEoAEb20PVMAAynvbubftLoicHqnQ8
	+Y9RO0zkPRoh9mUV9JAr/IHwynJRV68Ffl9WCoT05kQeiqQ/I6OwCAfetlRPvUy0QYKVoAOhWmZh4
	lJjddHa3vh2IU3UG4dCUs55/SIojMOIJOlPhJZVAk52HGqDqhJhNR2digTU5kyG4iphfrnK9Y1IdK
	iLxjFVqjCbAFOvStSQgyH6KgNit/b9uazPV7aE2ew48d96ta/MmIwThbpr0yac8Ra2sifJwYGMR8N
	BA6eBdlW4VZAEdyu+GNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliT4-0000000A1aq-3DFO;
	Tue, 12 Aug 2025 06:26:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliT3-0000000A1a3-0RHM
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 06:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88413613B0;
	Tue, 12 Aug 2025 06:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F5DC4CEF0;
	Tue, 12 Aug 2025 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754980000;
	bh=DW4caqAaUAFiJnppjj7GSSRY5w1nJcdZe58Eqb/GHPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9IVLmyTqRl/js9PJE7kEmyGdv2/ri+Q6qzrTzHrcv9aTuZ80RmQwDtmovA4g9Ogt
	 nJG2XqL+Vb9m/FJk1+GzFtKK1kVKKl5OdsxsM2V8j/4TJ1TR/5SavbGHACdrJws4FC
	 sz3yI46Gxu50x3LiYtj0KutJin3umWc4fiAIDv6e7nXI2DLNpHrDUaBMQbYIfP/sUt
	 idLp7MyLjFlhLXRGvHqW2XEFVHoAkKPRIXlZqqfeyu+xqtTUE8JkO2nLcgrWdH3ZzL
	 fPsNI7UcO8a1r6MLTEYgaACXuWBPbW63CAMpJiRTme1mU4r1uWd0xHN40ejoaEcpdA
	 IGN8Gw8eEzzWQ==
Date: Mon, 11 Aug 2025 23:26:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4 FIXED] clk: thead: th1520-ap: set all AXI clocks to
 CLK_IS_CRITICAL
Message-ID: <aJrenvdlWd2mxzGB@x1>
References: <20250812054258.1968351-4-uwu@icenowy.me>
 <20250812060408.1979487-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250812060408.1979487-1-uwu@icenowy.me>
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

On Tue, Aug 12, 2025 at 02:04:08PM +0800, Icenowy Zheng wrote:
> The AXI crossbar of TH1520 has no proper timeout handling, which means
> gating AXI clocks can easily lead to bus timeout and thus system hang.
> 
> Set all AXI clock gates to CLK_IS_CRITICAL. All these clock gates are
> ungated by default on system reset.
> 
> In addition, convert all current CLK_IGNORE_UNUSED usage to
> CLK_IS_CRITICAL to prevent unwanted clock gating.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> This is for fixing my unfortunate rebasing error when tweaking the
> sequence of the patchset.
> 
> Please ignore the original 3/4, which created a build failure because of
> forgetting to remove extra definition of npu-axi and cpu2vp.

Thanks for fixing. I'll review the rest.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
