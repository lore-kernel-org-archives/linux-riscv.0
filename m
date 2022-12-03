Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D795DC47088
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeBUvPGJufy6mSNkdcWNOeg/QhrdViId8ATcJKyejCA=; b=d3CFgvbBZHOZs8
	vEl5Q7iM4LmRgRpSbZfpyZNy79gM+M5+Ei0qGs4SZPuodJwAscd7VrDRJzIGNJEbGYQExH9xj49UW
	t5WDNLWq155mNuGfNj/NwDiz7J8liK/6rGMwngFa5BbbBn5N0io0Fto764oRBddwaDI+U6ukGDITZ
	htAg43ZUXkCuL521e0cm8ASl7cODTVqA82nZU2aZrFzA27ZSLYjWq76VNiDU1xTZpY1qwHubUdSYQ
	/+du7Yj30hBKmESD4f5/psvHvX/pMvh4O+4SrspzRBj+fZIPFXjnx1XsIwvZ3UTYNOLsM9jEnSoHj
	4/jP8UH28N7RCvCiFqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1GZq-001pmo-45; Sat, 03 Dec 2022 00:40:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1GZm-001pmK-UE
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 00:40:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 911BEB82320;
	Sat,  3 Dec 2022 00:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 065ADC43146;
	Sat,  3 Dec 2022 00:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670028016;
	bh=EgjYaw3xClikiWk08UjYSKTmVdLc42t9ZT+De5dXUd0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tIvLsGKxo3/mcTaH1mrn6z/7iPfslD/AAGdSt0X5U5rdQhcHzpEJfeex3Dm9+oLqy
	 DfKmx+OFbP6gGJ2OvHp4GjxeNvEz3PbOrHM+zSNSHAiZqn0Apb2xQeIZTqbVbpFQL0
	 MtbQaB7MxDu4kqfjZetikb9WrPeNrQUqZpcblHiDpE2FpNo5x7gGLM5H/GfA5BQ98Y
	 CDQIiY6tDbVcMqYKPKLOUB5kx51vRP+aCY+zgXW5xWsNHJQqc/GBwtvM46vLOjl8Ta
	 rBRv992BThNIDIWdZxFNVdQcIwNqzxxV6nTbPzDmNgF/9myKf4QIeRbTakcyfTgptX
	 Ncjr6y84LJgKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6A23E21EEF;
	Sat,  3 Dec 2022 00:40:15 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v9] riscv: add riscv rethook implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167002801594.8228.14116873241404694670.git-patchwork-notify@kernel.org>
Date: Sat, 03 Dec 2022 00:40:15 +0000
References: <20221025151831.1097417-1-conor@kernel.org>
In-Reply-To: <20221025151831.1097417-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com, l3b2w1@gmail.com,
 anil.s.keshavamurthy@intel.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org,
 naveen.n.rao@linux.ibm.com, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_164019_137223_E5C1D6A3 
X-CRM114-Status: UNSURE (   9.77  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Tue, 25 Oct 2022 16:18:32 +0100 you wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> Implement the kretprobes on riscv arch by using rethook machenism
> which abstracts general kretprobe info into a struct rethook_node
> to be embedded in the struct kretprobe_instance.
> 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [RESEND,v9] riscv: add riscv rethook implementation
    https://git.kernel.org/riscv/c/b57c2f124098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
