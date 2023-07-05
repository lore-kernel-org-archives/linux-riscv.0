Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E2EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCy07Wa/hOBzJ1JRgO5aFVqGru5RjBp19q46mrUSnwQ=; b=y6lgO+Je+zwC4y
	YpGV35OCAVifPmAhzF8tncTAscfqLqTVKb4+UupWLUjaPx38ibhlDpr6Gf1Dl2VCGMyq99o8APckb
	ZcLtQGOml4JPb11YTKfyXGa5qK+tqwHsPc9RVuVcX9zsQHVcUn6LVIYsFHsDycjChZsaZlvijZbj0
	p6NlDQXrt9QvZ6dmVIRbrbG2GP7SuhIrJPiTdol/HVzPk4HgZqxVBFttu1hJ6NqUJ+i3+PADynN6s
	R2REcSyq+6oxELjzIiCK5jYIBu8b56XNdyYU8AVS3Qhw/nYp5CF0oTWlY0N1UIh8nbFLxowPJOuyl
	1ZFo+80rrvqc63ofdMsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGR-00HOLL-0l;
	Wed, 05 Jul 2023 23:50:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGO-00HOJG-0J
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3829B617C0;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A14C4C433CA;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=wF3zf8/MLATQ/c23tboRByapQW7HjjUk1ZCKWbYWn/Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E/cxeRlcq3fuV4PqYFVqm21m6k06WPkO9pbgs39wagk89mo3QcEqiq/Pm/UnXCszy
	 82mS5ixKGiKI25bcYY8j36ss7wqGDICATLLxUiPRQ3amqx8Qv8ffsAtzWQPKxFj7o5
	 IfHwq/i7TILqtANFYoVKH2qhnGMlg2k21fmd2jX3RbbHak/jQRP1skIlLifGuH2JWr
	 IZS8eM+SMLCIsLRU9iQdYbfCfMAHea7C5UxktYA9NUCFPmkal6PngNkkav4g1vjYSl
	 NrvpF3dL92oX4GH9Hjacw2+DrMGlv6h1FvrRzEVHPSkdA06JWm/GUv47UHx280f+tT
	 TTs/9R2murMDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7CEBBC0C40E;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: move memblock_allow_resize() after linear mapping
 is ready
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102250.23922.10880634323125131800.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <tencent_FBB94CE615C5CCE7701CD39C15CCE0EE9706@qq.com>
In-Reply-To: <tencent_FBB94CE615C5CCE7701CD39C15CCE0EE9706@qq.com>
To: Woody Zhang <woodylab@foxmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 conor.dooley@microchip.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165024_201838_1887B612 
X-CRM114-Status: GOOD (  10.48  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 14 Jun 2023 21:19:07 +0800 you wrote:
> The initial memblock metadata is accessed from kernel image mapping. The
> regions arrays need to "reallocated" from memblock and accessed through
> linear mapping to cover more memblock regions. So the resizing should
> not be allowed until linear mapping is ready. Note that there are
> memblock allocations when building linear mapping.
> 
> This patch is similar to 24cc61d8cb5a ("arm64: memblock: don't permit
> memblock resizing until linear mapping is up").
> 
> [...]

Here is the summary with links:
  - [v3] riscv: move memblock_allow_resize() after linear mapping is ready
    https://git.kernel.org/riscv/c/85fadc0d0411

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
