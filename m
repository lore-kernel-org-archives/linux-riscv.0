Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72273CD8C88
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEl0pCVnau0YzT4D7W//xmfr3oZQWJ7VNMIuFXVNimo=; b=xWPBRPXRRgZD68
	xWtZoFzkg02m2d1rWfXebIP2ddJDNNRx/YaJKIV1/9yXlRL8zgPYroKUf3ERSv/Xi30AeosEDoErg
	sl327OdgL/q4aNgSdctkQG+/p33FkJHdjrm0O0dObcZoWNy9+uAPsgm/7uPBMfGmouwRp8K56RDsj
	1MAHondBCAHo5UEsmIMgMqeMyiXi7Wzht+frNCDPHzYfSQAJbuiWf9I6iKtXwI/H+8K+cKeGLSsy6
	/5hYLBMZGbuzMD9QqVs+G8ythH1EHRYTzBMaV0K093to5m442zxXazBMRyY9dmImvmI2HASQdFXxD
	jAkK5Hcy0PFNoiLc8kAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8QT-000000026l8-2g7D;
	Sun, 07 Jun 2026 08:00:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8QS-000000026kw-1E16
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:00:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B327A43DEA;
	Sun,  7 Jun 2026 08:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9487F1F00893;
	Sun,  7 Jun 2026 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780819207;
	bh=jO4jV1/6SN2onRJRAvM4X17hEiA2izSef4Zh9LbL1sA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Sw0o6AYZpNEb9ecgTKhamOFGQkfQA5nh/dJCPy2Uv/h2rwdS5ryI2HXNALeX6R38i
	 /l1maIxw9KuoBCoBzhYZAiyscnhIdcSGavAFP7iezma/gdQndXTs1ylSOHf4pV2Uv3
	 zRPNXZB1kAJ3nzzxRkvICUwaopSVnT/h0g6MxQftHf0GuUPXTGl7DhTXOS92E2i98k
	 88ukl6FTbP9/mjB6qqA+O3qtQtqzraVFaozSpf/vvYAR7J1Xq7gN4omSEAMAk1Pd1Y
	 aH36eT53aT1+YP9x5gcaG04D/lFvmaL4iViDIjjducB91npg1sZtnAN2723JFlEKna
	 wh5F9v9gYzLCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569173930C87;
	Sun,  7 Jun 2026 08:00:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] riscv: alternative: Also patch the CFI vDSO
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178081920690.147064.6320265225927754862.git-patchwork-notify@kernel.org>
Date: Sun, 07 Jun 2026 08:00:06 +0000
References: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
In-Reply-To: <20260504-riscv-cfi-vdso-alternative-v1-0-bcdf3d37f62e@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com,
 cmirabil@redhat.com, linux-kernel@vger.kernel.org, namcao@linutronix.de
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
by Paul Walmsley <pjw@kernel.org>:

On Mon, 04 May 2026 08:30:49 +0200 you wrote:
> The dedicated vDSO for CFI-enabled userspace can also contain
> alternative entries.
> 
> It seems the vDSO alternative patching is actually dead code since
> commit 0b1d60d6dd9e ("riscv: Fix build with
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y"). However new usages will be added
> soonish.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: vdso: Always declare vdso_start symbols
    https://git.kernel.org/riscv/c/499578e22ae0
  - [2/4] riscv: alternative: Use IS_ENABLED() over ifdeffery for apply_vdso_alternatives()
    https://git.kernel.org/riscv/c/4fd6505f189d
  - [3/4] riscv: alternative: Pass vDSO start as parameter to apply_vdso_alternatives()
    https://git.kernel.org/riscv/c/6386161abb02
  - [4/4] riscv: alternative: Also patch the CFI vDSO
    https://git.kernel.org/riscv/c/d3e0634787a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
