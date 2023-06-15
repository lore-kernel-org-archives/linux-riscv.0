Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71886EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFZCYDRU2TfOg/IbdsWGMOA/seAdrIvswVE32jv9eqM=; b=GnLgWoF/W1y173
	SetBI6aNTzZtKUFKAgofpsv9Z0I7uSmhBiMgzhzCAb6DXLkz3mjsMm/ytlye0wrLNkejUdDor6jPb
	1hzms7QDDwd+Lpmlhjy1WSZyKqhQ1ax1kZUnSv9ouQNRkRW0UVaO0focZ5HH78zLakcy9OkTGzh+A
	hDSDQQEIIESmc0zr6doSXo+8tFPeVeX/h1Uc1fIBdcJE8qcRQXleW4wE5wbd66u4THHDuX3GJyIGr
	BVsb2vD/zNNzxt+aF7jkAv9jIWhdYsoMRNiSSpj5uUiPxlaNQX53vpQYkuUoSInNjyrG1f/18ww3x
	qD0JV0sdUX8tak1jrz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qe1-00FZIB-26;
	Thu, 15 Jun 2023 17:20:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9qdy-00FZH9-30
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 17:20:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D30C4611DA;
	Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3262DC433C9;
	Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686849621;
	bh=8HcCCoHWF4ekjLwxHQjTpZFheFFCm2IRjeJ5OsPAf20=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oTTMq5PuQcV+kvtLwmIsT/6bcAbf+zhNBaRXzaI4e29nsJhPg99ZLFd+KZnhtxsco
	 kItEQwAJK6xS8qGKB0fICCEkXPGo7tkY3m2KEIEHwomdN7DAWkvBXC8tbbMMFUcoKA
	 CWG0+6oc/Z7IkW0STkjo0S0IPK4mMRyNilO2FZhs6b7jwAIdUqs65T3u8vyaz3wGSM
	 gnZxGo2FWNNNVz0/eMP4HcsK0CAEBEfbNvCh0uFOhz4v3nXvlcV5wPnmBUsACB2api
	 ZPa8pmAxDEZbYv5uAT9h5Cu9g1gpid0QP5cvl4h+Dpha2jPbLj0jBW3X722mthN9tO
	 +e2SlJSfHlSGQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F6B7C64458;
	Thu, 15 Jun 2023 17:20:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] Documentation: RISC-V: patch-acceptance: mention
 patchwork's role
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168684962105.16910.15134304668253401668.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jun 2023 17:20:21 +0000
References: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
In-Reply-To: <20230606-rehab-monsoon-12c17bbe08e3@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 bjorn@kernel.org, paul.walmsley@sifive.com, corbet@lwn.net,
 linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_102023_032177_7469DBD7 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, 6 Jun 2023 07:59:19 +0100 you wrote:
> Palmer suggested at some point, not sure if it was in one of the
> weekly linux-riscv syncs, or a conversation at FOSDEM, that we
> should document the role of the automation running on our patchwork
> instance plays in patch acceptance.
> 
> Add a short note to the patch-acceptance document to that end.
> 
> [...]

Here is the summary with links:
  - [v2] Documentation: RISC-V: patch-acceptance: mention patchwork's role
    https://git.kernel.org/riscv/c/b104dbedbe61

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
