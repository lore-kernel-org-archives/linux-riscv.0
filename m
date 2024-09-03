Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540D8CD37AB
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/LyYfC6TqQnrXkfSFe9XM4t9GJ99G/5uFKSJ1VXKpg=; b=oFAjT1jWDD8rx9
	v156eqUBAdV8igRMA9eWJoq4yWEEngqkljQkTb41S172QtbwGmU95EYjudeBybLz98ichgRZSbsLE
	3Q1PKDvHnNuPi4IZ5LRlLfN3bJye2PltTunrs271KtS3yguZZjOkEek2GDlNOdAuFqhkY8QOdWCHq
	XKj7zpOp9JQhsZG+mh5cO40o31oc/kuwm1dZ1eWnx6fuPpAo2rkCPWjno1OJvZDoxHY0MUmEfNg6J
	wJAfNO101N22O8t2azCpeCVtJYiAMWTXCfdl6dOx9JeQSJ8ruLUK/3mSq1AVyMJymjGNohZn54e4u
	Upagk0PCNDir3/GFb9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvH-00000001Z8q-27lX;
	Tue, 03 Sep 2024 19:10:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slYvD-00000001Z6L-1p8H
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 19:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 424F55C479A;
	Tue,  3 Sep 2024 19:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECFEC4CEC4;
	Tue,  3 Sep 2024 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725390634;
	bh=dbJsHm4vu/RSU3Ppal7NFr4QAfyU+2VbOxwEdvEqMeM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RLOXNBrhMlkQcdBIl2bM4XLcrSbF/8dnZfCGvNZb4U7QdNox05yu53yeQJejkChz8
	 BzYYIhLcTaW9rsfLwXMQjLVju/jwYsAH77FQYZfbFTwSmBvXLF+NbR2lSVLO1s434L
	 5RfZw14WxoxgNRa0qZ6fXY/MKTBT63JxNC5iSJM1R2EWEwDDOqvbZDc69cYiWBJDxk
	 iMFZoiEd+Ngv/NUX8Q2RWLmam3HBu4JK8O/iDgkCHZiNNq5UaXSDtmb0K7cumPINqr
	 SPhOTpP4MUAQC/03VLgishKSd6wlzy5MU1DGD1iAnD8gIYz9rHDjrWN0H8y5BY917K
	 SxdAVcWhMoa4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71A703822D69;
	Tue,  3 Sep 2024 19:10:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix toolchain vector detection
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172539063500.409367.1817166858428512996.git-patchwork-notify@kernel.org>
Date: Tue, 03 Sep 2024 19:10:35 +0000
References: <20240819001131.1738806-1-antonb@tenstorrent.com>
In-Reply-To: <20240819001131.1738806-1-antonb@tenstorrent.com>
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_121035_556904_20B631B1 
X-CRM114-Status: UNSURE (   9.10  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 19 Aug 2024 00:11:31 +0000 you wrote:
> A recent change to gcc flags rv64iv as no longer valid:
> 
>    cc1: sorry, unimplemented: Currently the 'V' implementation
>    requires the 'M' extension
> 
> and as a result vector support is disabled. Fix this by adding m
> to our toolchain vector detection code.
> 
> [...]

Here is the summary with links:
  - riscv: Fix toolchain vector detection
    https://git.kernel.org/riscv/c/5ba7a75a53df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
