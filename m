Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A802C71136
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbMG+2Nj+j7e5BMrchW+yn6BqipZZfukKHB1VxOlPIM=; b=jsX/9+e5rFTLAV
	J4vx031UvibaAIVm9OtsnnP3NJYojyLar8nVVJNO8+2eLrsom7KicxRWzYr8KCCz+LtvxMXVWkFzI
	2a3bDBRCY+Tdl2P81na3FkrpTl3G7bdIMqb1jrugnXV0uPc4MVAYsMxme1wvGFHdrzIf76gMDr85r
	0mwh2rE5oxYEV+thoSd0p+zHXonr0Xcua0Lz/FuK/TTvNCK4drMtptPJVZgEPW/htrQMnAc1lr+uO
	lH3Um95ddqSMeM7fnOZPtrRrETPjvDSUTGthh9sZ8Mot6RNC6rXVDXcS4sPRT245CQUO0MadbK7+m
	Z0BEPVdhP0g7UHxRiBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57I-00000007z2D-3czX;
	Tue, 10 Jun 2025 19:58:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pS-00000007T4N-3peS
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 23214A5149B;
	Tue, 10 Jun 2025 16:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA8CC4CEED;
	Tue, 10 Jun 2025 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572881;
	bh=XpKG6U7SUEDx6WcwKev1QZDTNBiTYhfWnKPEGgxnf44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dIGC3Ft0E6fUFpwr5EO0a3vwKR/NPZcxmwIAFd++UTG7xF2tN8FNLwHMN13cM/jHH
	 5U4ujPKj92PwceN5B04bQA3Diedc6LEKja3TlErcKgrHoqSEX/IEXNJSGOePMS904m
	 9P4EKz+t4O7CjXuLpMTIA99/iaxMWrgvcyv0EgNyqhsw4kiBXJTCws/KV3RJHBmqOr
	 h6fJ6t8o0E5+Gkv8h7SumAxho0F6pWXhbf9qWtRhy7Mja6ouSNVbgxTEzLOpC5nzmz
	 pctGAzAajYZLL2jJoUiPnZNV0Z1xy8HkHBFYw7PClnQdPxIMIctEcFy8YNKu5LfBjr
	 JQM4OCFhIxDlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B1C39D6540;
	Tue, 10 Jun 2025 16:28:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: Remove obsolete cpu-topology.txt
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291224.2454024.11937218792717571483.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:32 +0000
References: <20250410201325.962203-1-robh@kernel.org>
In-Reply-To: <20250410201325.962203-1-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, samuel.holland@sifive.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092803_021910_EAB46599 
X-CRM114-Status: UNSURE (   9.08  )
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

This series was applied to riscv/linux.git (fixes)
by Rob Herring (Arm) <robh@kernel.org>:

On Thu, 10 Apr 2025 15:13:22 -0500 you wrote:
> The cpu topology binding is now covered by the dtschema cpu-map.yaml
> schema with all the relevant descriptions moved to it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpu/cpu-topology.txt  | 553 ------------------
>  1 file changed, 553 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt

Here is the summary with links:
  - [1/2] dt-bindings: Remove obsolete cpu-topology.txt
    https://git.kernel.org/riscv/c/3fb7bebcb6e5
  - [2/2] dt-bindings: Remove obsolete numa.txt
    https://git.kernel.org/riscv/c/540994337d47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
