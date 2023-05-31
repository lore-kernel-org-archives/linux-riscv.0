Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12FFC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJq3FNB8/iK4Q+eSI7pbgmwfyRcufwCBLJo1QILU1Io=; b=tUrhGm43teBleL
	wApXYF6n62rN0eEgzByVOhGAThn7MXzOCZ8Rch7yGOwCYDcCfWFE1BvIe5+7QSnTHct/lLqfvzFlW
	4arMNTcmw2oGi+KxXzwEOdxDfjHfWeqMPzqlSxjM9X5XuZh0sVLETDt/S3+9AeCAT/zr1fYDgRYQE
	KIyWcDDlM37omFRZysXGiIClb+pS0EB9cxG/Wwl3HqRW2GWiY8CSKfd2yqBOAKsnzPPXC+VZUV+H2
	Rj4/TLubdXYAAksiy/fbv53zXcmJmaYUGKv32y0NTMpXMsT6K7Ur4YO04DwULMwpXc2CNqB1xa9Qt
	dxoq+bbjSX0RFBtWtG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NT3-000FNQ-3A;
	Wed, 31 May 2023 15:10:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NSz-000FKx-1W
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:10:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3FC63D1F;
	Wed, 31 May 2023 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8D5EC433D2;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685545822;
	bh=pL4sre/8I+lAJhI65dVhLrNVbXbcple+qv/qIynQKwk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IaeeWc9hF4u/krb4rVlynNldh5n74wLIBCm7e57SCXt9rvaIZPoGOIqX+07gBi5gW
	 +Loemm5FJflzXLSe03XSsKn439lbLMH82yykl6EcLfY79+oST7hD+HiQtlGpQPeeGQ
	 aVOHgPVxbjv4w+PTXwSV7Z/n8jms0yZ37a0pWVsOxr3DgWMajZpPNvBmirOTWcvnkb
	 RrXG22AR7/1RBH8f6rdPaFkWZ8qAKWPh020qY2QmoDVEH4OKR+FpkC9Q2KsmwKpXJb
	 5T9f9dXfNb1/9vVE46eZgNaWhTem4oNGgDIDRdNhY+avb7pfSUqHuZ7XhW0GT85nKX
	 UhDsy6b9THQbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA578E21EC7;
	Wed, 31 May 2023 15:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: mark hibernation as nonportable
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168554582182.8247.5723560098196678790.git-patchwork-notify@kernel.org>
Date: Wed, 31 May 2023 15:10:21 +0000
References: <20230526-astride-detonator-9ae120051159@wendy>
In-Reply-To: <20230526-astride-detonator-9ae120051159@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 suagrfillet@gmail.com, jeeheng.sia@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_081025_571369_47AE67D3 
X-CRM114-Status: GOOD (  12.05  )
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

On Fri, 26 May 2023 11:59:08 +0100 you wrote:
> Hibernation support depends on firmware marking its reserved/PMP
> protected regions as not accessible from Linux.
> The latest versions of the de-facto SBI implementation (OpenSBI) do
> not do this, having dropped the no-map property to enable 1 GiB huge
> page mappings by the kernel.
> This was exposed by commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages
> for the linear mapping"), which made the first 2 MiB of DRAM (where SBI
> typically resides) accessible by the kernel.
> Attempting to hibernate with either OpenSBI, or other implementations
> following its lead, will lead to a kernel panic ([1], [2]) as the
> hibernation process will attempt to save/restore any mapped regions,
> including the PMP protected regions in use by the SBI implementation.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: mark hibernation as nonportable
    https://git.kernel.org/riscv/c/ed309ce52218

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
