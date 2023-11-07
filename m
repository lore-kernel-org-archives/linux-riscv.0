Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75884C3DA6E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbmrHvVAvgZwP9rNI9xuyJ2qop9S0tY7jacZkRa3SQE=; b=nkSGpDBz24C5zE
	+RKRzYNFCvi7qhUhd/E86fyupU9k+odXUMv81s2STuzsL4Ad41B2Xj5iGT8kVcoaFEj6my9gsBd4/
	ZnPQl4WJJ0YnWPAjHYaEx6/qcx9IPNuLX5nfj74xRJUrBEU4b/iE+ldtBiOtN25yeQwpdyuY1Du1W
	WUNUWYfYg4ua3De3vze0vnVKRsB9hKsRI6fIJixshuDBlFGgE6bk+Sa1ZHoFiFimGSNpgr/07gNcc
	ipxoga0P8ee7thPEomc1O9+21iZFkFlNzBPpx2vhoLWJVhDs75CW5lYEyv6K+joLx8Y7gBXOG0R0+
	2G3oNdWlgYSCDVRbim+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fv3-000fGL-1y;
	Tue, 07 Nov 2023 06:50:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fuy-000fCZ-0S;
	Tue, 07 Nov 2023 06:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 41753B815BB;
	Tue,  7 Nov 2023 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC07CC433C9;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699339826;
	bh=cHbIfxGacqWBpCzOzghDzS7RRPAFPkidFECXn4+18cw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O1Us4YLU/3AmrFt3w0GvHCF05NxtYEvKMSfZPzcYbJXzygIDTuPpgicU9FPgakbdF
	 sBn6EmDp2BorJ0zjTQnzsE7ZVwHvKxE6n5bf029nz2xO2iGXbqCkgRitbkCqNpHv02
	 n5m+IJ/4EoX8aEz2twQWrkk9jP/lWRS2heBJNabhed5uejm63DUULWfcpT0pLOUu5u
	 vshPsS63PW+cZKPzDGRLxjWGjebSHhG62XWTFKU6kTgyPI40HK5yja9TL7Sqtha8NB
	 pMvQN8oBF3OOyusucd6bhlf7ooBQdABinpib08uGmTENOd5E+CXwilXnYD6YKb+yHZ
	 +muFZukI1AlkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC77FE00087;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] riscv: cleanup assembly usage of ENTRY()/END() and use
 local labels
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169933982669.6233.10371170118616950256.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
References: <20231024132655.730417-1-cleger@rivosinc.com>
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 atishp@atishpatra.org, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_225032_329496_35F8108D 
X-CRM114-Status: GOOD (  11.91  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 24 Oct 2023 15:26:50 +0200 you wrote:
> This series does a cleanup of all ENTRY()/END() macros that are used in
> arch/riscv/ as well as use of local labels. This allows to remove the
> use of the now deprecated ENTRY()/END()/WEAK() macros as well as using
> the new SYM_*() ones which provide a better understanding of what is
> meant to be annotated. Some wrong usage of SYM_FUNC_START() are also
> fixed in this series by using the correct annotations. Finally a few
> labels that were meant to be local have been renamed to use the .L
> suffix and thus not to be emitted as visible symbols.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] riscv: use ".L" local labels in assembly when applicable
    https://git.kernel.org/riscv/c/b18f7296fbfd
  - [v2,2/5] riscv: Use SYM_*() assembly macros instead of deprecated ones
    https://git.kernel.org/riscv/c/76329c693924
  - [v2,3/5] riscv: kernel: Use correct SYM_DATA_*() macro for data
    https://git.kernel.org/riscv/c/4cc0d8a3f109
  - [v2,4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
    (no matching commit)
  - [v2,5/5] riscv: kvm: use ".L" local labels in assembly when applicable
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
