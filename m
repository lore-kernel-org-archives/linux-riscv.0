Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0097CCD5BAF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 03:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSN5vGg4X6q0Xunz07+r4DQ3Gk7i0mdSIGo/IF7bSRQ=; b=KWEghYk+uy0Di4
	PAoLcBUgmcWuzC9zUSYKkr0KrosNoT0aWCSFEUgb55mrzpIjkZNk7FDxdnhXU/Ul3lbBg2m0VSdgM
	W6IrbJT4eXvky4wuwZW4c5nAWSLYIkjMHcmCJLNDkfE5DwqvgiHFWyBK60wWcyIGs61kDZEwIpSEV
	NZ+e5pkZg5dVsvC/bzAa/41y/QPUiwj4iBdmFOpS287V8Wi+Prvd6gu6GOn4LAn1NXQmMPX5pz9xh
	Z67sZWe8ZYy7BPeACGKgwuiUOfpdDGV9GJu7vmg4Dccg6XB6tvbt5dnwtvcRvylgc7/w1mtlnOhut
	2qir/wACjWw1zachKO8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGEs-00000009c7E-3OyK;
	Fri, 22 May 2026 03:07:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGEq-00000009c6L-1LRp
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 03:07:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71C1941896;
	Fri, 22 May 2026 03:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541DF1F000E9;
	Fri, 22 May 2026 03:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779419271;
	bh=5FG7KSvjKvo6OQmu17Ltjp3/qRFxGUfJVX6JnhSGvLU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ar4Nq8+9Jd68ONE0GOeo3VxrFeCzy55DkGzd3wTJIoFsqtSlJuPTv21tsC4PhI7YN
	 qv6oPlru7Tize6b5Ff/bwXmKFp04n2N2LSxtIaBVXc+I+8nX1J6c9PdvA/cfXOSU9B
	 xrLd+wOirbowSgRv7N8cdjgukcssXSGPP9Y105D4csGAulSiszB+Rsvcrd57FGB6PZ
	 4cvckmqbuNjHP8PcaZLqJWJ0/uMUgsZ7OlOn7dQ1BCkS4ug9uMFyI7VvbgduU8FmNi
	 55yBZ93ROCjt0G4YiApfZur2z7UI1i6UUdkB5svTOr9lQFrGW2NJkjQ4T/rhCMaabY
	 g9AYJ7gseS02w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199293930E40;
	Fri, 22 May 2026 03:08:02 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177941928064.602940.14455551713912931345.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 03:08:00 +0000
References: <20260316-cc-can-link-riscv-v4-1-64c072b456dd@linutronix.de>
In-Reply-To: <20260316-cc-can-link-riscv-v4-1-64c072b456dd@linutronix.de>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=3Cthomas=2Eweissschuh=40linutronix=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_200752_380074_0102D71B 
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

This patch was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 16 Mar 2026 16:46:14 +0100 you wrote:
> The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
> These are not supported by riscv compilers.
> 
> Use architecture-specific logic using -mabi instead.
> 
> Prefer the 'd' ABI variant when possible as todays toolchains are most
> likely to provide a libc for that one.
> 
> [...]

Here is the summary with links:
  - [RESEND,v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
    https://git.kernel.org/riscv/c/c586c8394c6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
