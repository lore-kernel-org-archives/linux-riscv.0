Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E01BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ENBhLhFFWvDycTNHWSt4/J2AiNTCoxYe9blK4S476I=; b=uf7UpLiWWt7JSW
	QHVHqQ7hTRsz2TCibXfts/nTXdPvZqm4A8/aXbHo0ofohfsx9PaTALGlXh7x//xxY79FfV8vRpSUm
	7YsR/rvmXjt7/ucfJOPf1IedPxWVClklAnH+QkSr4yW4m/ZE+rqxkjmeo1rfqGgvua5rTqarcKsQ+
	Cli2bSvmjUah2vQN+M8dWeUv2DQw/B9VVGJA9sixeUKQguekP1Edny45q6q1PFvfEh1c5pGiQj/4k
	+3i7H0mtbVLcxrwD5tbSIY3QtxyPnkUxFsNyvUzr3T5M/SpI1Q9S9Q5wX2kErM2TwObdnjoVtHShf
	bg0sdiCZDd0zj98BKEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdPh-00GnLx-9t; Thu, 02 Feb 2023 17:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNdPf-00GnLL-BZ
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 17:30:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CFF261BF2;
	Thu,  2 Feb 2023 17:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69B81C4339B;
	Thu,  2 Feb 2023 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675359017;
	bh=4PONHIEudcXNZESaUql5vum3JtEcjpY8pniiHFOE15w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HQveGkALcid7UBYNr7QwtKoolhvCGaYfmB3m3zEH1HtC4+U+Ulm2wjrgX2hgqZmcv
	 uGOFMDhl3/1Lr5mnNvMZbvA0impyok2Ga+PtW6vH4+bmJON5pEp2JKahJXJ/obZ7oM
	 d5R85b6K8n5OTmrT31WWHiVWSjZ8txpxduKr9IfzmYF4mJX7ncczG1jYMv9YukOzf7
	 jEBw+mT1ZSPWWS6J7zdgE6ZpXRv+wp3FDdAnayDbUJINVVLY9D7+nMa12sC+7g89BC
	 BklVVXsXB94VRWLzrx/Ku1TZ99HNCjjBOZ1XvQ5+GFxto+gFEtneUco3fcxf5nnavA
	 Ydg1Oa3FRpNng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D25FE270CC;
	Thu,  2 Feb 2023 17:30:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: kprobe: Fixup kernel panic when probing an illegal
 position
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167535901731.19827.1576402289548615657.git-patchwork-notify@kernel.org>
Date: Thu, 02 Feb 2023 17:30:17 +0000
References: <20230201040604.3390509-1-guoren@kernel.org>
In-Reply-To: <20230201040604.3390509-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com, bjorn@kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_093019_472719_FB040592 
X-CRM114-Status: UNSURE (   8.23  )
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

On Tue, 31 Jan 2023 23:06:04 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The kernel would panic when probed for an illegal position. eg:
> 
> (CONFIG_RISCV_ISA_C=n)
> 
> echo 'p:hello kernel_clone+0x16 a0=%a0' >> kprobe_events
> echo 1 > events/kprobes/hello/enable
> cat trace
> 
> [...]

Here is the summary with links:
  - [V2] riscv: kprobe: Fixup kernel panic when probing an illegal position
    https://git.kernel.org/riscv/c/87f48c7ccc73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
