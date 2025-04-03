Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0619C3601A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfIcQ8F5HK9z5MGnYJ23cpyFJ/P/Xg4d5PX4LH2RnzA=; b=ezVRw8JGVWgMpO
	WZTDfhO5LeNAPznvzl8fhLEWLyb0po/l2wx5BmKCWk8mJ3C7ORCuBL2Gh1YWYhTCJAerOEnmrX3fl
	it69U1A+OWSAJ2BIhzCIpYF/m9jC2LLOwNzU7g7KjjgjDquTImmZne9MtC9fUEtjV0ZIM18CEvoX7
	BMIxtBJ5J6T9UQMn7/2/an4U7Snsgjxw2DUAUAy5yUFnyhykCcmCJF1TqEzjvUoD9DVxDr1GbgnwO
	IWOJBPd2zzAN2eqmBIz6XiYGOLDLz5mrFKXRJxt015OLmyUjuDA9ck4jgskzdkawtysD/Mmc02hJe
	KpmnIhWV4JmV3pFhqOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIa-00000009LJy-2mrF;
	Thu, 03 Apr 2025 16:20:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIY-00000009LBn-2vdH
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F0DD44910;
	Thu,  3 Apr 2025 16:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C096EC4CEE5;
	Thu,  3 Apr 2025 16:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697203;
	bh=rcZGb9wxRSmf6FvWkV5IkQo4iouEKnBTw/tL9ai8L5k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ukqS7FSfDgHDsXobOQquum9UKC4IZ2AITSYbMox9R5akm/JU3bfb8sSTN4yG8775M
	 e6JaH8UfVlOHfqUSUglp5+HJV/FnmMkf3rMfC//iedOQWX3Yjq6iHsiLtprwp601pv
	 vdYVHjVo5UPtu0Ms1rHXPvlNisq7fECSaRhVPRY+5kmH9FvfeoPjLsNRpThFuRB0eu
	 pl7MLGcDBIlKqIS400H6+PfFFWDPBOqYCygiNFVBZTcgv6QMNl2Fj5VXxVXrfUZAua
	 lx/suIVY4rvli6NErTEf2dXZGuxpiabEGlg4oMvGxH2r3Y2+y0Mf+rbHnHubCDAT46
	 yudOUEv4aSYNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBA6E380664C;
	Thu,  3 Apr 2025 16:20:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix hugetlb retrieval of number of ptes in case of
 !present pte
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369724048.2563936.1581552891050877179.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:40 +0000
References: <20250317072551.572169-1-alexghiti@rivosinc.com>
In-Reply-To: <20250317072551.572169-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, panqinglin2020@iscas.ac.cn,
 ajones@ventanamicro.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_092010_763552_F8C61548 
X-CRM114-Status: GOOD (  10.58  )
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

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Mon, 17 Mar 2025 08:25:51 +0100 you wrote:
> Ryan sent a fix [1] for arm64 that applies to riscv too: in some hugetlb
> functions, we must not use the pte value to get the size of a mapping
> because the pte may not be present.
> 
> So use the already present size parameter for huge_pte_clear() and the
> newly introduced size parameter for huge_ptep_get_and_clear(). And make
> sure to gather A/D bits only on present ptes.
> 
> [...]

Here is the summary with links:
  - riscv: Fix hugetlb retrieval of number of ptes in case of !present pte
    https://git.kernel.org/riscv/c/83d78ac677b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
