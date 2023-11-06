Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83068C001B5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc6TfSA3U5P7vXQM0+2g+oQVGVJD5zNS/iPNQc2GxNQ=; b=YixAw0zv+hIOev
	guj8M3R8moQjD9ySK7oMRbWFcuPbcHw8evBc6sYUdpxUargGvMGEi1KH6+dXtbf9pdyPjieIUFepk
	suGYFgVtmpELGd1HyukFkC/14sYkOjyjuXmGezLK6l2z561s8g6+A0ii6MOyTyZQuvtYahIHjVFxg
	413JgrJQXQM7OIUigs/ifHA1tRNrlSd8Ydi7bOlaB7Htt297nkN9JFTqa1JnxvbXpWMy2N2I0RlRm
	EFw4su9KWbMO5ivEXvkcvXc2B/eF+qb5P7QYkpD/IeGeRd23DmD4SoFuQidb7HMA9vYWniyr7ur8z
	pnlgqSDWj73DBnMU99kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r015i-00Gvfu-1n;
	Mon, 06 Nov 2023 15:00:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r015c-00Gvbu-16
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 15:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DED860FB1;
	Mon,  6 Nov 2023 15:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 627B6C433B6;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699282829;
	bh=VWCKe7SjFh7Bq6TAg/SU7Px7u48cI9rpqXcfMsj++00=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UtDBledcwcoJZyUIZWrXUPzitXxY+nodql2ACEEcF2akw2wiv7yLIcIUj2RdqcZ+v
	 zikdWGqTGs2h+wnWlzL+tVuE4pIa1Dv7pVB/SJ12+aWmpXSSMbKovYIBUWJ6cGRSvo
	 M11dxmDHUHjmyEW4hOAzlxaKZXqYtjRdof4Uf0Td0utwqVoTWa+KuNHdeyXmhfEY6w
	 +B/9GWmZvNvYab6hE6twYg5LGz+zpAdrsVCm9O226fG2dxcDzqf7LKSt8ArJYooTMs
	 fqUMqezbEvhoqhoau4EzSlEeOIg8vzabQw/pBXtHAO5qoe40+rGC2ti+lFzQt+ANMO
	 agFBETtvRWGZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4232BC04DD9;
	Mon,  6 Nov 2023 15:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: capitalise CMO op macros
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169928282926.16503.8131988006359901785.git-patchwork-notify@kernel.org>
Date: Mon, 06 Nov 2023 15:00:29 +0000
References: <20230915-aloe-dollar-994937477776@spud>
In-Reply-To: <20230915-aloe-dollar-994937477776@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 conor.dooley@microchip.com, ajones@ventanamicro.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_070032_420493_C0809178 
X-CRM114-Status: GOOD (  11.40  )
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

On Fri, 15 Sep 2023 16:40:44 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The CMO op macros initially used lower case, as the original iteration
> of the ALT_CMO_OP alternative stringified the first parameter to
> finalise the assembly for the standard variant.
> As a knock-on, the T-Head versions of these CMOs had to use mixed case
> defines. Commit dd23e9535889 ("RISC-V: replace cbom instructions with
> an insn-def") removed the asm construction with stringify, replacing it
> an insn-def macro, rending the lower-case surplus to requirements.
> As far as I can tell from a brief check, CBO_zero does not see similar
> use and didn't require the mixed case define in the first place.
> Replace the lower case characters now for consistency with other
> insn-def macros in the standard and T-Head forms, and adjust the
> callsites.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: capitalise CMO op macros
    https://git.kernel.org/riscv/c/d3eabf2f2c81

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
