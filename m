Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EAED3C521
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoFoi8fm1DZ9JD3x6rpeXrSN7PSCQLLdGL6Gb9kYNqU=; b=D2YdQhi83e49xz
	NXxAHIVq04tBwUpI4vG+kKDgC/W6g39Qpz8F4ys14MltoGrdQ0BiJRCQa69TDMPkK1w+Br2RMzRWJ
	kwJux/T11cbqTD71tlqwq1NbH5UGOln3QTw27OAXKfrjxC09Smv4x15ZwyRAJjvVgdOwcLBRqnJka
	VI3yhLjlhDiEBDMRp4PmmWYxVvTcLp771v7WI/S3EYufRq6+b7X8E6aFIuxkff1lMnYSc9ZW9qC+d
	NyfZ2qX5benSOPwj69uy8u+18Vz2Dft7djIlRxNWAkp5b9k/H1Nme1cq5wSRP9Ca/ybETLOL2+2+6
	/7WjueY/v3V3DazquHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOn-0000000FV0T-1zI8;
	Thu, 17 Oct 2024 16:30:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOQ-0000000FUrz-2Bwh
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95443A441B5;
	Thu, 17 Oct 2024 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AE2C4CEC3;
	Thu, 17 Oct 2024 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182629;
	bh=nAWLdZX91eIJ11BlrVEiY4ELlhecxxPurMVmz9N9nJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gOdPxAaWZj61iX7yjafGJrl+oxhuJ4iNs+5b4EzTnqjP1Z5sLUpU0KnYnzOYGhRxZ
	 kk/sfLvvTAD6IQ9H/AgGvyLsKg1hJRbmVnsGM/CDS3gtWFSvkD7loorMNNw+hNyPVo
	 +5DRx5+5Z7oG5wjrHtz3Lf9jGs9ePKVwtQJP/wAwn4826nTWwLukQ2YLLoyCUSXPPi
	 XM/djyAgTfoohVWsEAXasJjsk96kRHKfT5BmTGPKBlSvqJ7Q73L/3UKqcshlWje4+S
	 LD5v7kUlstTkSVJ1dVe9Oxrt5B3Vyu2SMZEozoG1iTsS/J7HaeNegnv8c47+8x7pbf
	 pZ2RdVCbEop6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADD63809A8A;
	Thu, 17 Oct 2024 16:30:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263473.2528145.2882493292845168667.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:34 +0000
References: <20240913080053.36636-1-mikisabate@gmail.com>
In-Reply-To: <20240913080053.36636-1-mikisabate@gmail.com>
To: =?utf-8?q?Miquel_Sabat=C3=A9_Sol=C3=A0_=3Cmikisabate=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 palmer@dabbelt.com, cuiyunhui@bytedance.com, sudeep.holla@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093030_648143_2C71142B 
X-CRM114-Status: GOOD (  12.60  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 13 Sep 2024 10:00:52 +0200 you wrote:
> When populating cache leaves we previously fetched the CPU device node
> at the very beginning. But when ACPI is enabled we go through a
> specific branch which returns early and does not call 'of_node_put' for
> the node that was acquired.
> 
> Since we are not using a CPU device node for the ACPI code anyways, we
> can simply move the initialization of it just passed the ACPI block, and
> we are guaranteed to have an 'of_node_put' call for the acquired node.
> This prevents a bad reference count of the CPU device node.
> 
> [...]

Here is the summary with links:
  - riscv: Prevent a bad reference count on CPU nodes
    https://git.kernel.org/riscv/c/9510c5b0db36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
