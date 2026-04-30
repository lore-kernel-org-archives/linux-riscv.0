Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE28CD13D3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCuWfeVcGK9GYRXdTcgJFAZMH8f2Cnp6dKwr0WoONEM=; b=mq4tUnYWzHFSFi
	CwSkcMUqp1+nDjihpUoGGDUEhkO257SW9cx5oClPtOMSX0DKTbwzkQ7g/u2crCMa5wVaqlIOdBP5F
	CoKnQ/FmEiEFlroF9zBzcKYFJwiG0L46arh4MTuNHBuD1t+oiJEGwB+tTVJVEukcw+Y5uE2MQzQcM
	i9vardqarCd4RM3f4HFRhQdWEsxWLfiE+tdbl4sbnCqJUv2XEI6v1Sd5Fqgbrkn0ccTd845pA4h5I
	bZl2i7hS4cPGzHXfkVX8/ii+x7Ef00FF1N0E4IGhAc+hpKHKbk9gz0D49DUOginH1gNIKKCAdRIiX
	hC0/7D6pQCp3Je5mUQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3o-00000004Xly-09RJ;
	Thu, 30 Apr 2026 03:27:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2e-00000004WgY-3C4f
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3581A61344;
	Thu, 30 Apr 2026 03:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7EEC2BCC4;
	Thu, 30 Apr 2026 03:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519579;
	bh=fymdwygTMdsitrih17N18ZeBUCi7Zz4qY74EMXzQlv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NOBHLUvjXYpURKCkD/52HuRaCdJzvvWyR5BCjodwjgyqi2GKoL9IM9/hG75i3bsZZ
	 IeE0c6E9RXlOedlxD+dwpXGawEspBt0a5bCqs/xzFHAV757Z7cinfmVaMYfHK9i/tL
	 MQAy1wXY57nWVdrF3nIVL+WoeyPlLJJPIT3lbEsxa4H8fLkiyZsUr3SQvn/Z2oMSbe
	 qPshx2b20Daw/9g0rY7nlczfNrJvA1SZ7LCc2CkENy2tHflmw+wKP13JbaV/qtkKg2
	 AB8UPOE9JhC/VzZxqHIPIMFvQU+ulP0SB/7q6NTGFEfPh8aWURDhMqSJqsTUOO1fGs
	 aTcMed5IU7S8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD793809A07;
	Thu, 30 Apr 2026 03:25:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] riscv: cpufeature: Add Supm extension id and
 validation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751953479.2274119.7433375067666827705.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:34 +0000
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
In-Reply-To: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, samuel.holland@sifive.com,
 heinrich.schuchardt@canonical.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, evan@rivosinc.com,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, conor@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Conor Dooley <conor.dooley@microchip.com>:

On Sun, 25 Jan 2026 09:36:05 +0800 you wrote:
> Supm as an extension indicates pointer-masking support for user mode
> (U-mode). It relies on Ssnpm or Smnpm for the underlying hardware
> implementation.
> 
> Major change in v2 is added dependency check for Supm in bindings.
> 
> As a ratified feature, define a dedicated RISCV_ISA_EXT_ id for Supm.
> However, since Supm is targeting U-mode, it should not be added into
> devicetrees that describe hardware running privileged system softwares.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] dt-bindings: riscv: Add Supm extension description
    https://git.kernel.org/riscv/c/feb5dba31a36
  - [v2,2/3] riscv: cpufeature: Add ISA extension parsing for Supm
    (no matching commit)
  - [v2,3/3] riscv: cpufeature: Clarify ISA spec version for canonical order
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
