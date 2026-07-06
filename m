Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5A0C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fa7vj2phQymMOVB7SupnQACMIM6vI5mJBSo/wkTFqsA=; b=F9V8jC+3NTnvzO
	7heeN8aMuVFsFNzzIcWuHAgyyb6p9M70l7h7ulDTSc8oqo4sGbr6FOVFXX31cJPHoGODQHv1Vx705
	OmYHIwnq5ObxbA4zvg1JLRFz2REoPTsE9HQpcksAhvhLhsNnSUBxm6pUKnlslfV4UlhQ9uCAArhAc
	/ElMQQcyN1A2a5xcpLdhfrm7qVo0x6GgchejSkIhQ0+fSo8qaNhSlTVtmjeloDmaDUy+g8tHL0Kt/
	3/dYEKG845IMwOHynxe8CHqnwWqJAw4QNYWe89Aj55DiYnp+qb3WDq+zw1AZsHUHeJhvf52cvpjoC
	2N/tkAP/RFMe1XZftAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpb7-0000000DX7M-0QMo;
	Mon, 06 Jul 2026 20:07:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpb5-0000000DX7F-2DK3
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 20:07:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FF14600FC;
	Mon,  6 Jul 2026 20:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1331F000E9;
	Mon,  6 Jul 2026 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783368438;
	bh=CkZHCYA2DevLfCsQnJY3TrD+OoWM9RORj16SR09p82k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QBzhBI8xRIkLKkOqJo7nvjcxvlhhfqZAORALMzMu5QWqDmjEXUHdKaMiJBkoo7Ejl
	 +83yZ5JrB71Srk2b6RhwM/lhRmxNweutuWUDaDfcy4h1GOA+V+XVhSm48modEyyyLe
	 gbxCHBiM6xHlUx5nJutqs5XAW0FAxWmK1D6dt0vBe4dscbGC17txjdAoQyK/joRzqX
	 XGAqGEc1XKARGWolR51CBbNVGokZHCEibB+zSlK7MSCqNZOhzx9PSxXyOIpcrI+UqN
	 dpNvRMh27FaAzx3b2gFGs+KMrIOvYCoha0HkdlDUXOJlaoQXN2XFiMILcInPOOf+SK
	 vcUaujYT3LMDw==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: spacemit: k3: set few clocks as critical
Date: Mon,  6 Jul 2026 20:07:12 +0000
Message-ID: <178336796970.834791.13749678515323157051.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
MIME-Version: 1.0
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


On Tue, 30 Jun 2026 08:53:18 +0000, Yixun Lan wrote:
> Some clocks in K3 SoC need to set the critical flag so it will never
> get these clocks closed.
>   The HDMA clock provides the clock source for internal TCM access path
> of X100 RISC-V core, and from the real test case, shut down this clock
> will cause whole Linux system hang in a quite minimal environment with
> only ethernet, UFS modules enabled.
>   The RCPU clock is needed for RCPUs which are two RT24 RISC-V cores and
> it's responisble for running ESOS instance. ESOS should be always kept
> running behind Linux, so set it as critical flag to prevent it from being
> shut off.
> 
> [...]

Applied, thanks! Queued in for-clk-fixes-v7.2 branch
(Pick only patch 1/2, while leaving 2/2 for now)

[1/2] clk: spacemit: k3: set hdma clock as critical
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=eb525edd48907795c0d4e498ff57ad168070b289

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
