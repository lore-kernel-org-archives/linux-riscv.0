Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0096FED3C3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvs9Bw4NYZuWeSup2AnChM0hbX7kXv72c9eU3u04F9M=; b=q7gPJUcGCwKnwW
	cYlx1f69mMvLoEury5520HLE2Ho/iKBGr/hCpbsMxBtLA9WTP1TrGKYe9zC5UFmdU659CXBqi4R6F
	5cFoJlsc2sLsPDpOTOa6IoOxGfxOn/JOg5cFlymcdIs6yvTPVkw2pJ70U4w8H020cUZi7BybEN7sj
	oChCdZovL3kOinvaMs85unMFYLpkOdMVyp61j8lLfFyEeXjEPR7RGD5eW6HD2oO4iOc0tqST8AOxr
	2BzQTfxyQrhw9O4F06p5Ro6y1gRBlB09YZTQtPgQ8WvLEMdOdfgwldib1I/jsQqEkvE6R78W0/SG4
	fhwgDx4Hf59mIrtIeSMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGcP-0000000DFHl-3vMn;
	Fri, 24 Apr 2026 13:30:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGcO-0000000DFHX-2dS5
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Apr 2026 13:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R5ykPf2iG6JtuEXh6xdZ2lQ2g/BOblReoyfGPOKiRnk=; b=BoCaYnkchYSiMiVzOa9drU8iJ8
	I24+MmZpQTNn4yM5q3Pn3TfRWxIEYwWQMdTqO6XmRmfLVvZk8f8+JIS58EQCouktn3da6ciVkSykn
	HMwKUmzvP0REziWX/glUDdCmMNaUBxZ1ZAFWLTi/cLlByvM0YofX4K8tki+AP2jk/RIeOSyRLcLcn
	lf5NDfTNLVjXfjfLr2yVOEtBlumYSQNXRTkYseTIJQ0fZ1ja6GDuWynVIqybkhggD6DNDRMn29pMO
	JvIaLbjIfn8qJuzzdc/gldiQA2p8ud2s+tyFcs/a4zH56sOK5OS2bzl8iOhDdTafh3KbMwLpWR28o
	xSQjNwww==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGGcL-0000000Es40-2WCJ
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 13:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FA18439BE;
	Fri, 24 Apr 2026 13:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2763AC19425;
	Fri, 24 Apr 2026 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777037445;
	bh=RiNuWDFYpfa44/lF4GDzMT8158MNWuPbfUfLAG44zCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QVwdpoqDi0gT3jikgq9PqI29RhXdHVtCBds5aTVhsXCjoZDi2s5gXXwrbCc+wkWKp
	 OpLxaZeumhnvKL5Utk5aQGzz9BeTR1qgK4tikwko8UxK8A6cgPKP7Lh5xoWNvGwCTV
	 P5uCEXBotITljBMP5kP/ik8feGWxVqp7WtxcBMwGXcqHeYUzyomYVMId3AIoyGzDD4
	 xpdo3W+ERs8wMFg0+JC5JeiStxCuXHIQ1Zp5+hNh/1ZYy0EmECJgZjfz0dUjzkiEcH
	 yKklRLM8eOUHIqJ5QsoLFYoPH1nw/5PC9B3x6aVgM7XWcXvkR3MWMZhfsR2QwBpN8i
	 ChT2bzPljo/tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02FBD3811979;
	Fri, 24 Apr 2026 13:30:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177703740582.1127153.13431496503049547939.git-patchwork-notify@kernel.org>
Date: Fri, 24 Apr 2026 13:30:05 +0000
References: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
In-Reply-To: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, namcao@linutronix.de,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_143049_828241_42BCC117 
X-CRM114-Status: UNSURE (   6.94  )
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
by Paul Walmsley <pjw@kernel.org>:

On Mon, 06 Apr 2026 16:25:49 -0700 you wrote:
> After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
> reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
> check_vector_unaligned_access()"), there are CFI failure when booting
> kernels with CONFIG_CFI=y:
> 
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
>   CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)
> 
> [...]

Here is the summary with links:
  - riscv: Define __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
    https://git.kernel.org/riscv/c/70d39025809b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
