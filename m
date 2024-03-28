Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A961ECD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 21:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLJpFKcmFcS80u84fue2mKHLnY9u8BAAlWPENrZxkO4=; b=pru2xZQa1k8F15
	m3Czs6seqDt5CbBc2r/Rh2yUlzD063KqgnzpdcXPagpwMF/MIVTXg4/WnYAIrUFLCc9MaiET7Nq9p
	OT/rnl1csI1t+n56vZ9i94wlArUT6DNFTJVcTCe5v91p4Ybg7OtAYyF/DcRD5iY0GwQCt0F+snABT
	RAd0MLnN6dOBoifv4mGA4LwrReKCGfNrMquhqYDdRtNtH11Byu6s+w7F1S2cV+MyEhJ6gmAKtQY8P
	OG14sO/YiSalltmCzWNDMX/vZtTyY+HYD91BP6TU58PLgYEEXzndzu5kwjRdUtey9jswfLrUJ/26f
	ag3vKXTzN31rNzLUaJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpx1q-0000000FjMy-0qW1;
	Thu, 28 Mar 2024 21:11:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpx1n-0000000FjM4-0Mkc
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 21:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 715BACE2D12;
	Thu, 28 Mar 2024 21:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B615C433C7;
	Thu, 28 Mar 2024 21:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711660271;
	bh=z/Cuj9LA0Xa+ZmEp2IaF0jg2a2SqBYyo+Qx1gEBlZ4Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dJb/PbFkhKeWQW3nrlKB/eUsLXiqQAybCDxyo6QVeBaJWG9uZ3Gk8JdHO0bx0EqWC
	 JV4qreNyeLwvbrnJOvvQiSiUIPLUTFv7hq4KLCH2eRI1x2VmXdrKQgx5DhqwatvvD4
	 RNFyc3NtRGHy4CA3LRYjIVkynsunONgoX0/VOuVdj/cCnJGHIldR8PUAe1rdk20Bns
	 vxrbhVmpMm8n0fCy6dQyuHD4HyY43518l1bW4/yCYgXD+sryj2m9MzByL2mQiKLgoH
	 98A3hzSQEPqpwBlAvltDkCxFQ4Dr8qVpxRFy34euNzdtVPK3ZkPPf+8Cx4YBvVlhP3
	 RsX/RW9+mBlug==
Message-ID: <8615090f3ccdfc6c7d8e3e0dc7f55e32.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <tencent_4FC67CBE4B41306D52C71C5CEC989690FF07@qq.com>
References: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com> <tencent_4FC67CBE4B41306D52C71C5CEC989690FF07@qq.com>
Subject: Re: [PATCH v1 3/5] clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Date: Thu, 28 Mar 2024 14:11:09 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_141115_326106_8AB29B2A 
X-CRM114-Status: UNSURE (   7.89  )
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

Quoting Yangyu Chen (2024-03-28 10:06:11)
> Since SOC_FOO should be deprecated from patch [1], and cleanup for other
> SoCs is already in the mailing list [2,3,4], we remove the use of
> SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,
> 
> Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
> when it has the symbol SOC_CANAAN_K210.
> 
> [1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
> [2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
> [3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
> [4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
> 
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
