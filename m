Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A0AC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HgwXb8teORz8N+MtxDxw6zXhQfBWf0GaM89ghd76Ps=; b=t4ZdXMyycWcMTh
	iQ7DvJ8i+BR/JTmCrgIcX3s5bpRWVlf0uJm6j4PMAE9NQtGH98wTKFvzyOkIllC4FRreW+DKTwhO1
	cVJklpAHIT459E/Bimpbj2JPo2ZbuEIgXvhlVa85c91vbjjAERCGXBMTsF9PSZcLAhQluCraWSstb
	bDO9L1vrN8LDXvySLdpv2BxEr05aJm4v3yGRXEruiV/FzMWDzQV3T/OI2ACKTswCqnt1QkQV2q0U7
	NQA9bY14XHBTkggWBhlsFegvuQNfJY8rSvx7cdxNnZfoZTonwrYc9ehiTrS80Ad2kJcNPy2mGg63S
	qHIA2WAg0HuKueJwLuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4w0-00000001NUF-1c3Z;
	Thu, 08 May 2025 17:21:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4T5-00000001K5x-3NrW
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 16:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42E954AD67;
	Thu,  8 May 2025 16:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD0C4CEE7;
	Thu,  8 May 2025 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723091;
	bh=CqM/OHPCyhT3HBcTk1o6Jg2KbU0I9Kyg6nGIy8ZyWcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BvkUaHrD0/kpfGObaoE8TbmREcP+uL/31YLX+6W9iH+SxgQAJCsbKETziKG4OOGu+
	 2p1dpeFjCi1KufIB7qrmuPXVIxLrCVmvOUKQFtUM96rIILswHxkxjQ4Fk9n9H5Uj8l
	 rBDzZXx+rnu3DzuvB0pC6omHtojlWbZS5yiPh5fLNIp6mtjIRRa87BiF97UPPljCjp
	 IHM66prCCZnB2pvGRR8xn4OYVbYIdbyaDDmdS0I0sMMx6a0dnUv+ikPxyeIu3iEKKv
	 orP/z8CdD3MPKiJuIoDjjCYDY15DnJcF/bYYHC8ZA7TYu/d4ZA+aojdRTiMLdlm2oV
	 XuXkvfAylVw6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA0380AA70;
	Thu,  8 May 2025 16:52:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] scripts: Do not strip .rela.dyn section
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174672312974.2976395.10364863541225876459.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:09 +0000
References: <20250408072851.90275-1-alexghiti@rivosinc.com>
In-Reply-To: <20250408072851.90275-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@rivosinc.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, ardb@kernel.org, charlie@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_095131_870048_81315C23 
X-CRM114-Status: UNSURE (   9.81  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  8 Apr 2025 09:28:51 +0200 you wrote:
> The .rela.dyn section contains runtime relocations and is only emitted
> for a relocatable kernel.
> 
> riscv uses this section to relocate the kernel at runtime but that section
> is stripped from vmlinux. That prevents kexec to successfully load vmlinux
> since it does not contain the relocations info needed.
> 
> [...]

Here is the summary with links:
  - [v3] scripts: Do not strip .rela.dyn section
    https://git.kernel.org/riscv/c/e9d86b8e17e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
