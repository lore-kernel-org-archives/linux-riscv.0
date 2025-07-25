Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D2C83F26
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 02:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/VQBU98yOeebZC7W4dCJjurG5Wi5W2RdRo/5P8KdBY=; b=eTgNF4Xqpf+54x
	4nu3c/4/8/qEWcES3AYM8qd/G6NN9Mle6F4YcEAtUVVUUS3WYP7wp5AAmm2Muz+y6GUCCuYo70CLH
	0wN/5mxqhequJeAMwgP1/bnopaoGOxkMkGiKUzEKAOakb+HQMrp/R7CqmrZomq+O60wizrX6S+XNa
	B32fxmk4mgN9ybqAuJRZ5sCxB2D4Iu4CLkj8ctOwh42RId5hbPHxzrxMy/qM8jylsAIZupAc6eMjY
	I6nU8au3AgMzmOcUybuohGIAzC8wOdxH71Ua8BLfrHC8XZMsnDFWiyUF/csGH+vkqqXjp/+QttqhP
	ENRP3zCpJb8oKpPQv91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8II-00000008uQo-3owG;
	Fri, 25 Jul 2025 02:36:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8IG-00000008uPZ-1W3L
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 02:36:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 454175C689E;
	Fri, 25 Jul 2025 02:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5198C4CEEF;
	Fri, 25 Jul 2025 02:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753410978;
	bh=PD6yNKlOQ50g3fj8b0UIlHxrb5aRw2tI6N7hOAC57p8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qC6IAGoM+G8TVtULOwiKQ5AsRtfRGXLRrS55E3Yx1n7Neh+BrVVTgodw/mCXSoNhn
	 XbdC/e9jNOCv/sJDEsaHPILKHzsE7BkjKnNG04amtL6pGwbWWE2zPHBRvGKR1E1xmQ
	 p8/sdLJCtCj3zhLTvqAW1oD0lwIWmDQroUDSn1/5NfdyLg7ku13ob6l157bBncDvmK
	 KsVehsHQnqmu50XY6hduGoklsed6kJlkvJ3/GZWiZloX/wfb/f2rAQpOHT3O7K9iI0
	 uynUU+3XXxyUNEVUJ1NX8DnDMrcpfUptNjnsKePBgRsNJ0LKfMWMgz9mEiL3w9hIW5
	 Rue7fw8s3Lthg==
MIME-Version: 1.0
In-Reply-To: <aIBzVClNQOBrjIFG@bhairav-test.ee.iitb.ac.in>
References: <aIBzVClNQOBrjIFG@bhairav-test.ee.iitb.ac.in>
Subject: Re: [PATCH v2] clk: spacemit: ccu_pll: fix error return value in recalc_rate callback
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, unicornxdotw@foxmail.com, jszhang@kernel.org, zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
To: akhilesh@ee.iitb.ac.in, alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, dlan@gentoo.org, elder@riscstar.com, heylenay@4d2.org, heylenay@outlook.com, inochiama@outlook.com, krzk+dt@kernel.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org
Date: Thu, 24 Jul 2025 19:36:17 -0700
Message-ID: <175341097796.3513.9495899738615799188@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_193620_437963_0002F6F4 
X-CRM114-Status: UNSURE (   6.04  )
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

Quoting Akhilesh Patil (2025-07-22 22:29:56)
> Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> get correct rate entry. Follow .recalc_rate callback documentation
> as mentioned in include/linux/clk-provider.h for error return value.
> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
