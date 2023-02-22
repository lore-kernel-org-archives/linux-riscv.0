Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF1AC636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szZ3qvEDkU2h5EJ++uxQSY6olYVcdAllhwJAdwFjLyo=; b=GXpEjO68Hy0EI+
	2SCtHBpwCoe/oVZgeic4zbAmVwpBpWh1sIganRxkQk97PdK71VLQedOKBumbGxWS2f0+sQk2IB2Qr
	LKuBTXa6/dErT0wpLyxUyymcKHZrVxoouC/jpcIZ+86uL6hU0Y1raKCUtNPNL1R5GcY7bH53CILaa
	MWHKjbB3x5vd+a8Id/AM9jrfrvx7FkH14D8tmFa133jYg2OyLZQJ5cq8ppc8v7q7Xs/RH5v6UyayC
	asnv8epQQ97WnK3BUOJHUigwFchd8yYeX5k3VDX8bhPga4cQcoPz58L+q+cCDQbX/eQdZFVjwXt00
	InrXevrIjpOOs+H+454A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqcE-00Cmbm-Ad; Wed, 22 Feb 2023 15:01:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUqbw-00CmMn-HN
	for linux-riscv@bombadil.infradead.org; Wed, 22 Feb 2023 15:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xo5bmqGdelyD1EQY1HgDNO9+ILldcjL4AXynQNIwQuk=; b=LIqbKvaJPvJZCHaskkXWanuy5R
	cvH7rQvSnkspNV9quYwNOdhzSl7VEAHzvNKllUjEzARngDHs2CsQ/G3WU53rK71D1bz++PA2rX+cp
	AUaH8aCNhgjEa1GspRaAjB6a1Pn/iS6o8MFYCrAecInBhEZK/jM/FqxfydEeBzaiF3L1LTbJpNOoH
	nl9o4K3opqyLomXg98QbGFEqdviCnqJ1mepYWSoBq+8CqmFs9krZ3CeQ1jA+mpJ8etYvmNdo7/0Wi
	gTZl3qF8f0zz3RwP+57sJh1NKr9wAeHkGYNdLYPL117ZLAuBK5cFzVlwJZ4UovALRi8kyDBLbo0eq
	WpoVZ9tw==;
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUqbf-00CZvO-1P
	for linux-riscv@lists.infradead.org;
	Wed, 22 Feb 2023 15:00:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45DEBB815DB;
	Wed, 22 Feb 2023 15:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98B4EC4332B;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677078022;
	bh=hIRN8tehXwNHubfdhEu3xNrgKNVctXSNEDEqcMC2+x0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pQEg7YpP/OIIJ328RI2/Cp1AX7a0zra/vKuf2Wl6N6eD6882WyfsWKZexQW9iznaa
	 w6wQg+5MyfB8Rb06h5bDGAWFxirdZDYpPF7USLiGGL4iN+EMMdJ5c15duSt3TUHjlZ
	 XBbJwZQAw+3BwPuPGr8LQn6ZwJxYw1xpd1OFDhQRu+T7rlesBmN/Am/UU/1mKoO5vr
	 On7ZcVxzLKlWGZ//fiEnnyCyP4SyOL1wI9+rEDOTtinqQgkpVBLbdW+X6LxZSoSMvP
	 TLWK/OsIdVfPXCTSYiVH8xatvR9NgF5/VNNe5ePJmFOf4LVlgTvGhduxzcJHAXBoWI
	 ns4lGbqXfisBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8163CC59A4C;
	Wed, 22 Feb 2023 15:00:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: hwcap: Don't alphabetize ISA extension IDs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167707802252.24438.7610659561758047093.git-patchwork-notify@kernel.org>
Date: Wed, 22 Feb 2023 15:00:22 +0000
References: <20230209123636.123537-1-ajones@ventanamicro.com>
In-Reply-To: <20230209123636.123537-1-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 panqinglin00@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_150039_312769_D152A302 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu,  9 Feb 2023 13:36:36 +0100 you wrote:
> While the comment above the ISA extension ID definitions says
> "Entries are sorted alphabetically.", this stopped being good
> advice with commit d8a3d8a75206 ("riscv: hwcap: make ISA extension
> ids can be used in asm"), as we now use macros instead of enums.
> Reshuffling defines is error-prone, so, since they don't need to be
> in any particular order, change the advice to just adding new
> extensions at the bottom. Also, take the opportunity to change
> spaces to tabs, merge three comments into one, and move the base
> and max defines into more logical locations wrt the ID definitions.
> 
> [...]

Here is the summary with links:
  - riscv: hwcap: Don't alphabetize ISA extension IDs
    https://git.kernel.org/riscv/c/dac8bf14bb49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
