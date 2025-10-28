Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0553CCF9E5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 01:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppA3X+Pd3BDXTcKNgCIKFj0cdhA9Z4TqX+OwAI0LpFI=; b=VUZM4eNpenSMyU
	jIO17Aq0p4L9wUwJoA6dng1sQxkiKbyeUcXFdVbMi3CNtparKFqNOV6V5Q/lskeuMQf/z9zwggxhs
	WFR6rLBrcHaHBqv554wZkPGuB1ECqO5+LqnAy/6Qd+9jOknc52+HH6uXqj7Y38VELEt3uiue7FUPT
	oALXejJ/LvewgXoYcIwIjF2pTRAoLjCug22Eki2T5/vj2WW09pvJQTqGlPeNCjIZ12bG2tvkkP7tJ
	lFrIsmVu46EaBqUJ9s1yo9k+476h/gAanJRCKBiGMGJQHHXa1wO3CeTXlJCjenGi53Ajf4er5BVb6
	eTRMMjiFSdspbDyDkTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYEY-0000000F2yN-2Oi6;
	Tue, 28 Oct 2025 01:10:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYEV-0000000F2y2-3V5M
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 01:10:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7AD548851;
	Tue, 28 Oct 2025 01:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96473C4CEF1;
	Tue, 28 Oct 2025 01:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761613842;
	bh=fKu5A38tU7onP6w2DYBQHZIZ1Xn4NdSSr0bXRHq5q3o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JiUJvZygzT5x/RVwpIX6QGRu2SLUCWQCOQL/vFTxIxuzdUexYHhxN/wEiHdN8gG20
	 SO0SCMUBckc/i92hwM01SApK66gUUqajc2JClboPeJdAE87i3DlH7Ib+44XF2kDx/P
	 uJpYzYIbj02m+ZKm6bx66a3vI9FbVA+hPfSLUw9Tl4WN4NTuQXaIBZ9Ms+8mmf6IGk
	 ashqWLExSChdZgywkmqtNLr68YuT4nrNxCfDS2Pq8WeBF6eBOSOq/KacBd3jbOiZdF
	 IkR6DqshZHScaTYWf7JZ6hp0OzgRoQvWPWhz8mJudUPxUIJEwhbmRldy/MhWjW7xCL
	 LOvqaDuWqOMMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADDA39D60B9;
	Tue, 28 Oct 2025 01:10:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] riscv: asm: use .insn for making custom instructions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176161382049.1648894.4123570763621940938.git-patchwork-notify@kernel.org>
Date: Tue, 28 Oct 2025 01:10:20 +0000
References: <20251024171640.65232-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20251024171640.65232-1-ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, macro@orcam.me.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_181043_894476_DCA84313 
X-CRM114-Status: GOOD (  10.74  )
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
by Paul Walmsley <pjw@kernel.org>:

On Fri, 24 Oct 2025 18:16:40 +0100 you wrote:
> The assembler has .insn for building custom instructions
> now, so change the .4byte to .insn. This ensures the output
> is marked as an instruction and not as data which may
> confuse both debuggers and anything else that relies on
> this sort of marking.
> 
> Add an ASM_INSN_I() wrapper in asm.h to allow the selecting
> of how this is output so older assemblers are still good.
> 
> [...]

Here is the summary with links:
  - [v3] riscv: asm: use .insn for making custom instructions
    https://git.kernel.org/riscv/c/44aa25c000b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
