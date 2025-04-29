Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364FC3ABA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1xILdLNFkP5dCCcQ68VPpLYldzNjjuAQB3Yk7VSHXo=; b=iMBzW3hf4Lr+lA
	j8uQ2o7j5z4jEdjjGUBwaFhjokgUCho696Xs9On2lyzCPcD5YeXlkZIMjrL73be3p7Ld5ut6Gt94E
	3TLnsBkIl5v8YVskV/gDG0A1ZN8AglG6aX52VKMwuqY/vn008KRN6nxASCEixjR0YhDqh/++jKLKK
	RXRm9EmyHIbYtML++pRXGBgt0io7csS/b0dnbBpeCBoQ/iMDqgymxMDGoT+7BMJVo0XjGFOQLzR3h
	vF1Msa3nMy28aqux0fklv1dSG6lSY6fs6V7fzUJYZWTbwn3PHOL1TEHvby/zoKSeztl68IC+ebZoJ
	IUuzL7vL5Is3fcOqNoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s4q-0000000AoYT-0aW0;
	Tue, 29 Apr 2025 21:01:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rzq-0000000Anmy-3XIs
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 20:56:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA5646846E;
	Tue, 29 Apr 2025 20:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A7CC4CEE3;
	Tue, 29 Apr 2025 20:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745960165;
	bh=Z+5E4pYeRS7hyX8eMeNUqz1ihn83QuyCW7khmFvB6bs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IW+Hcqtl59JpPsGx8tNlXjWmQ0xINyBpkJMz859eVD0fUROkHrae3NX4PntW2uxzA
	 q3LHkxAHvcu9dNTAoq8yp5eP/o2kgjANVARI5NsCGKVMaUgpFunK0l5MRpkL2uj/Z3
	 jSMSZLEnABl8Nhi3YGaJ4+4BxGrhUtXKj18sY4787pMIV+wGtgdSHjDRVl5NPcjc6e
	 +KXZIuD8PtuD6gkI8S/UB+uf0u0FvhtDh5wI1oQcg9sGtlHp56yDaF5dIJrxplHvzN
	 zN8JTdMyIAh1D/CfYSFI4Iw9hkyACkm4x5de2QPNtFE6KNE02+/QPHimcULeXT1GTR
	 PiYaruyE4lbeg==
Message-ID: <aa67592bda7a30bec19d49414e5732c6@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
Subject: Re: [PATCH v4 0/7] clk: spacemit: add K1 reset support
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alex Elder <elder@riscstar.com>, conor+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 29 Apr 2025 13:56:03 -0700
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

Quoting Alex Elder (2025-04-14 12:17:07)
> This series adds reset controller support for the SpacemiT K1 SoC.

Please put the reset driver in drivers/reset so that it gets proper
review from reset maintainers. To do that, use the auxiliary bus when
the device is both a clk and reset controller.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
