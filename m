Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97898C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ThFbZYxnTmKkWFyf8x0WGz7/AW973NmRpnKOIbQm4A=; b=FBWhGhtsfBIIqp
	x/HBqIY5hlhaJg0TZQPlbVY3mycAVaqNYlk+vIUaHj5n+jAzt5gEFrEer/rt3INobjaJAUtf04R2r
	3pKOAiDMB2bgzq8vxG31PWD8gSwSJ2LE8aylztjvTMHys3OKyp6c/a0Fpk5vNMYRAKLmGKqw5IMUJ
	8c3TBZP/llVYYUKt7HGAMBszU/3D6aj74QMaj4TAhJdJG8hdHJAMte7dLVJVjCUTyWHwKhov9lPTx
	+yCyZcLd30l4ryBh8I+BcnV6V+gPk3HQfbA0bC/25U7ZEJThKHh4VkT6grGo/MBD0lgO1jXHbSp/Q
	EJD64ONj3sNf785NxYPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKuv-00Ha6j-1W;
	Tue, 23 Jan 2024 17:50:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKus-00Ha5X-2l
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 17:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57F5D61EB7;
	Tue, 23 Jan 2024 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3B08C433B1;
	Tue, 23 Jan 2024 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706032230;
	bh=u33xhrMBvP0hFGXf59MDOUATT/HE9dP7AK7MeLkj+j0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JaVmgOMvIibr/9DU4fx/gNLTAI5Ho0oScX8yqWemKxp7k3ZLKE+ybjmkHz96+i5lG
	 5AyYwYKkMgtHLbeiUiYPPLsErlaHLUvE86IKaoh6meSFVz08n6J2RY3duFpWWVn8Zh
	 ba3h/PnZIW8czIS9BeW8uWS9rqjpgFpBQMmp6n+itEQv5upy/vweFekmoPDLRGmF0O
	 tElnEddkDNGxhgvOUz9CC+zyah9PVvXN/1jSLlBUKzlrUBJrdS3xTquo9qJRf9wskT
	 J/GESn0r+6F/26CMj92B94cZ37RCUqPOB7/hBXJud6BNcZ6spxjycqFcUFHKLjwkhT
	 Z9Ox82Z02FSkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBFA9DFF761;
	Tue, 23 Jan 2024 17:50:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RFT 0/2] RISC-V: handle missing "no-map" properties for OpenSBI's
 PMP protected regions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170603222989.30461.11049056164459674443.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jan 2024 17:50:29 +0000
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
In-Reply-To: <20230802-purse-hydrant-6f44f77364b0@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 paul.walmsley@sifive.com, atishp@rivosinc.com, apatel@ventanamicro.com,
 alexghiti@rivosinc.com, bjorn@rivosinc.com, suagrfillet@gmail.com,
 jeeheng.sia@starfivetech.com, petrtesarik@huaweicloud.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_095030_937916_5E3DB232 
X-CRM114-Status: UNSURE (   8.88  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 2 Aug 2023 12:12:51 +0100 you wrote:
> Hey folks,
> 
> I was kinda sitting around hoping that someone who cared about
> hibernation would decide to go and work on some patches that permitted
> using it without having to use NONPORTABLE, but that has not yet
> happened so here I am.
> 
> [...]

Here is the summary with links:
  - [RFT,1/2] RISC-V: handle missing "no-map" properties for OpenSBI's PMP protected regions
    (no matching commit)
  - [RFT,2/2] Revert "RISC-V: mark hibernation as nonportable"
    https://git.kernel.org/riscv/c/e2d6b54b935a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
