Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B310C48297
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkIpDPLaRXi4NqcF31tTvdoHhjd/16Ya8j/q3ogpx0M=; b=xUpJBo5Z66k264
	JzXorfUFZy4mM2a2Yg/rPI0d+1iRi5hP30TXtbi/cyXOYKmfbvEt60ampbK2sLx8jIDT0ID5hgNSC
	sxcyoJZtV3n/6h0S8Vn0dM4WlfgZMpQ4TAo4zk0f5s28hmHAGkVlxUmvYV4LmI7pT1l82615CYrzA
	lGJOqxlLXEXKdhogAHjROEB/2AaEUooF+rT/4jXE1iypbD9MktMHrWCWAKKRvNCKSddJquTgm6RjF
	jrAWQdeNNN5kPDBug70nVUqUa7uZ2ZAju2kNDtCjdCVwpegOvAKKih+GXze6ESx17UY5v3PDOZBAp
	WyFlTWiUKFt0G6AjKdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXRIA-00000008hmc-1gEy;
	Tue, 06 Feb 2024 19:39:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXRI7-00000008hmJ-3bJc
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 19:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4445B616C0;
	Tue,  6 Feb 2024 19:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC340C433F1;
	Tue,  6 Feb 2024 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707248374;
	bh=BqxQ7FEXnzOrBOd7zj6mYuOjgycKqkJG9Ox/LfYw7ms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nt77VMdXUt5FjMlr8RCREY65FvC8+hBjPE8hs4xXz1s7YvoV7OToDZl1R19bOZDIZ
	 ZQad5Rw+Gk34NATfN8E5itpqs6s6KSoo+J9Xx+tjbhAMJ57w0XbMBdz+N09oXPbjPl
	 AdOMZUZ3EwFkcaVS85n60VP8YHCiF6SqO+aOL+oLQdgjUtpB5GKahUNc4Srdo2TuKR
	 DZBemHXcgkVo/pjtzisQkzavKbr6Lx3fNPoWjMk7AJ/d2ZfAULTIncMSJ6mjS6SAGM
	 b8k9t1/y4YWGYPthsbJKg0j4K936lUUc/xrS27z7b17HDCHRcrzl+q/nCOmEQMr3Jy
	 q6JTU7zynApsQ==
From: Conor Dooley <conor@kernel.org>
To: green.wan@sifive.com,
	vkoul@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	conor+dt@kernel.org,
	shravan chippa <shravan.chippa@microchip.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nagasuresh.relli@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: (subset) [PATCH v5 0/4] dma: sf-pdma: various sf-pdma updates for the mpfs platform
Date: Tue,  6 Feb 2024 19:39:25 +0000
Message-ID: <20240206-luckily-udder-ffd828ccdc57@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=443; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xmtgk10aREoc8W34f44KzSWunePLW5lmhs8pdAnijqk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmHut7wx7dWlExfcNHWa3tnQMT2pqO2387rZOe0dZstl 98k7fmjo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABN538vIsJF7rtPM7173ukOX vrPqXhavN/VYiDjfpgseC85sqa9+nsnwk3HRzTmVmgsWbM5TeJudttX7Q8HFm/veCVy/58+8SWZ FEzMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_113935_970341_7EC3DF69 
X-CRM114-Status: UNSURE (   5.67  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 08 Dec 2023 16:08:52 +0530, shravan chippa wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> Changes from V4 -> V5:
> 
> Modified commit msg
> Replaced the sf_pdma_of_xlate() function with
> of_dma_xlate_by_chan_id()
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[4/4] riscv: dts: microchip: add specific compatible for mpfs pdma
      https://git.kernel.org/conor/c/5669bb5a16a0

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
