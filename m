Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B448CC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 00:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4aYvSwSNPo0/ZNzKOTkgZdjcIMxfEoFaO/1eig0y1g=; b=ylXHFZJHFp9ECD
	KgCZ4+xYABw8ghw5pT9KVNAqNFgbjEA/+kqZZ3OehQZyY363vNTsMbnU1yaoqNnyq7+N82W9/UfhT
	oKdnNCc6P+ceLO0DRZx3onsnNlDVd622dGX6G32Uwm07KMNYQtOq9PtpugODUzcYxd9w8Nse3tw0S
	V5TKTnLyXgviqbtzyqvHZxuIcFEq+a5DvNpUDZ5FJTpUAe5Dql0npsdR5rbIh1QCa8kg+Aqg9o6EL
	nIuzQG9ZUMkZkfbIZt2SNZ1zytq2cEzLd89s0+tmBYs1dqnvefoRGC3OAk9R3m5JEFrOJFWiOxQL4
	FpPTYUAD3XH3eS5W3N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAg46-008jVd-2D;
	Wed, 06 Dec 2023 00:47:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAg44-008jVF-0A
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 00:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 549B8619DD;
	Wed,  6 Dec 2023 00:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A3FC433C8;
	Wed,  6 Dec 2023 00:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701823619;
	bh=b5r5GxuYWHo36uh4ovYgu5m135G+N9ZSSwh0htqUnfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=la+CqPPqfkLVqIiY+xzaHmGFS9CkyQKnrbETqIQqwbah3+lvOql3uSGTnKbd83GLn
	 CzuOC3tBU4YX+V8KeKYAKaiAHdqLsvqhqCFg79UNf+B39DvfMCQ6TyyGfa1uXiTgQu
	 VlXLmGB/edcKWRAWOUYlFMEIz0IXVwPjs+cKEXvZlGOhgd7iIzfj22r0+1vDGkIRxE
	 3LT0+Z1LetBYgNADApH2HDkkJ/mM04ENyOwRyK9PytwjoKUnF7Dgr+OxQzx/IF3oeU
	 CpYVPv9ANhxGcLcr/YNz+008+G6UFW1VV5Vd/GgNA57hTptrXjkS++E1NxT5ERcKXq
	 5Q8PKY4BV++Wg==
Date: Tue, 5 Dec 2023 16:46:56 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, conor@kernel.org,
	heiko@sntech.de, phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3 00/12] RISC-V: provide some accelerated cryptography
 implementations using vector extensions
Message-ID: <20231206004656.GC1118@sol.localdomain>
References: <20231205092801.1335-1-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205092801.1335-1-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_164700_154692_5277CE0D 
X-CRM114-Status: UNSURE (   5.73  )
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

On Tue, Dec 05, 2023 at 05:27:49PM +0800, Jerry Shih wrote:
> This series depend on:
> 2. support kernel-mode vector
> Link: https://lore.kernel.org/all/20230721112855.1006-1-andy.chiu@sifive.com/
> 3. vector crypto extensions detection
> Link: https://lore.kernel.org/lkml/20231017131456.2053396-1-cleger@rivosinc.com/

What's the status of getting these prerequisites merged?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
