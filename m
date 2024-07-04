Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F22EC3271E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIBgVZ+cpjFo13plOTOmYQZfcBFX1H9NL9CXKmGXMOM=; b=neqFm9XEF3xxHs
	1lnFhxSScF4W8J/sQBs1Sl9IQVAh6Ub7cXSi0G4oLxMdjKFI8jUcPrdxeOVpJUShGS+kulKeh0F11
	z0yNocA1WPia9W27STDF5udO4lvBsyuhfziprpJGq1xiGGa8VTp/db+SxSrUF1zHXX8ulfWcxb0ap
	toK+PcTXnbkRRzo/Vqc9rl/sFIpuFCozLnw/1DBLLFkdXfhRm2UWz+le0XDnFKsa+60X4y9w+FfJR
	Cbz+ssY2BcRMawt/y5Aj8o1CfSsZyyBTjq7z2Mbj1TociScOp7Ev3izGexFw5u+eWUWU/qfGZTE5+
	SJcxfBMQURkzHc3I4ZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMF1-0000000DEfn-1UKh;
	Thu, 04 Jul 2024 13:11:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMEk-0000000DEX6-3wxj
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 13:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D7C3CE34C1;
	Thu,  4 Jul 2024 13:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE7B7C4AF0A;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098656;
	bh=P52GeseScYIMI/6SpZlxsaUn4vxd5oniu7tXtl7TbGo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a9WEZoNSW5x9LREt6QpcGDpp7AhfxjGaJ0PJUvK9YZKSHAbEBn0Xt6RXZF7v1i2Xt
	 gFqqaWmhRboESpn0lIuXmBwEng5XhifPNUfWArRs8C7wC50bN7VASOVfMFo5aVbos6
	 OxtNPMbLZqp56BRdBCm10wMga/TglC1G4EcwvZQA2bhEjsCWNwc9HlGB0Y1ohVxTaa
	 4zM71QZ72rJDt5zOZprKRzWzMStI8ouJwEGkbbaDuPUslmRliczv+3tizB1CgYz3KW
	 OyOMNFk1rmPQwvsTBk9Q7Gs3G6M4kTeMQflzm91rWEFQYVhD/MmRmsMhGWKsGwbUXP
	 XYVmzftOrKBFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E51CC43446;
	Thu,  4 Jul 2024 13:10:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] documentation: Fix riscv cmodx example
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172009865664.17306.16379914644000401734.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jul 2024 13:10:56 +0000
References: <20240628-fix_cmodx_example-v1-1-e6c6523bc163@rivosinc.com>
In-Reply-To: <20240628-fix_cmodx_example-v1-1-e6c6523bc163@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 atishp@rivosinc.com, palmer@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_061059_176850_C53D3EDE 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, 28 Jun 2024 17:25:49 -0700 you wrote:
> ON/OFF in the keys was swapped between the first and second argument of
> the prctl. The prctl key is always PR_RISCV_SET_ICACHE_FLUSH_CTX, and
> the second argument can be PR_RISCV_CTX_SW_FENCEI_ON or
> PR_RISCV_CTX_SW_FENCEI_OFF.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 6a08e4709c58 ("documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl")
> 
> [...]

Here is the summary with links:
  - documentation: Fix riscv cmodx example
    https://git.kernel.org/riscv/c/7c5d838d7090

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
