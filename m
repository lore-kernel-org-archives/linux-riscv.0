Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CEAC54EED
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 22:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt+C0HW+EH7M4w4J2vLoc3xPAGvX/bGy4puGV7Ljz3I=; b=h7XPkcGvxzEU2q
	zVz86lPbVddA8+ajPcX2FoS8V+/3RiJXR5cxMcR+0HX51/n2tGOgnAl4ye9ezSOGKD3/GzWO38QyE
	I241Rg3B1MIu1PlZswOqVOSnPhXegvJ0XwAuDYpVsFvkUo7hlNRD1jHBUUT5iwegd/e41y6D4DO7I
	t1MaJRXpdq4mtUsCF+8rtLqoNpDITXuKODkQdMRgfe5JL21gY2tdoo4AJSoHOz8s90Bgmzt29GP5t
	Ne3Vn4DbLneKfyin5ACK7UF85HINVnKgl1kFgwHcYGtPMDsNKzOn1pX18hMt1bPQBJWHSTwNsTJ7j
	yKkKBJsrKg5Ed/Jf4xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxw-005Xie-IA; Tue, 24 Jan 2023 22:40:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKRxl-005Xe4-V0
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 22:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9E656136E;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28D6FC4339B;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674600018;
	bh=c5l5hSPFhmkzd69NiFdJ7mZa+GvHGWKGt6gjahbSulk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LwGAqOkMVfkZepFXwRbbHCwGud5Oid0t0zYyYy2zmhpyIVq2mwlwLC5bQsxRwQYcw
	 aFpucBBu/A/YGf+ro3aunVADYy9afT2u4eqAg16/kxwefXlIVyiO5+7Nj4HFpyRLPG
	 qerB923l0RujUlme5PG7/c0b0r66FJvTXG7tYPm8opQJ7ZTMmt8tdU9YLqj5MN3ALk
	 bJSafVBsCzr5M4AbZuLMSjd64vV/Bdl83hrvB04OvnXvVRmyt8prpsnpVl7jVJni2h
	 Zd0FeU0OuUgOIJ2kOI3VdLgM1kEPkQHb/PTREATfPVEgsmdKoA6p7L/iR78EPiz3+2
	 FJBfDiSmwiprg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0FCB7E5256F;
	Tue, 24 Jan 2023 22:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: add an IRC entry for RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167460001806.14719.8982921389240916887.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 22:40:18 +0000
References: <20230106125344.1685266-1-conor@kernel.org>
In-Reply-To: <20230106125344.1685266-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_144022_056935_1F7301BE 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri,  6 Jan 2023 12:53:45 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I remember being told "Just ping me on IRC" about patches, but googling
> at the time was not helpful. #riscv on libera is not linux specific,
> but a bunch of contributors etc do hang out there.
> Add a link to the maintainers entry to help others find it in the future!
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: add an IRC entry for RISC-V
    https://git.kernel.org/riscv/c/6d0cc1b1f22a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
