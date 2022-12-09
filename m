Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA8C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xHYktomn6orTsnrzjbUdmb1ki0L9poHh7ldK7cOiok=; b=YcU9qXPoQm8uzv
	ERrOrWTqq3DwwMmzSrjd6o9Zn7eTucbKNAkAXcsvNVG3ggdDROlo19KsrjRoDiIFsU9pszsOqyBFP
	vReDS8Lz8mT85rcK9ZMclmCsmg76SYt4LOgoNXGOWm2eZdSVJtnJdaWb4xCYQd5bmK/PhyKrZaXCi
	KVvJiX+043C2Ily2VICktaLoWajEOiD8oaT0Q2hvbzCpejZ6DcY0oMekuhem+NQs4dPMiZpUSz1Xv
	fP8vV4TxqA2BdhHcoijBe4yfH4semMS2TjpxrUl12/1X8Pg64Zg2fUEZ70qP2bpMmRSxsElbXyFEa
	QpnV5xpsOi4tCxMbSkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3ibd-00AXIi-Qc; Fri, 09 Dec 2022 19:00:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3iba-00AXFe-VX
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:00:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9BABBB828E6;
	Fri,  9 Dec 2022 19:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F573C433D2;
	Fri,  9 Dec 2022 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670612416;
	bh=HhzObmealiumgLE/hiuztZWY02q27ALbHNUmhYu2rz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IQWboPdjYV6eaUeyNme4FGwk/Agx0y+09lvz1u2bxhEZGhmJRMM/GTiUvmsGsf4sC
	 HXuxRXdwY4vXdWjyUDkxVyPNQJ+deqkqUWRvjPnv4/JPlCZg5aadvzuzGaa/cttvQx
	 0PmKJ540LHLLYiksmrpCfc0FDkvsdzHmHMYweUdiRQlX5yuyB7HQk9dmuaT7jaw06L
	 Ge43ziueva9jR4jIbpUtNIMwAvs2lcQVn1RRznGH3EQHx1WJWGSpjIHG/8310mFpJO
	 OftjQotEFD5TtlT2WiSn27LiAWPKjs/dCgesrIHXLVpvkqRItQWdG0sevKPRmWUndc
	 Ao/XT3y4zn8Ew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43F30E1B4D8;
	Fri,  9 Dec 2022 19:00:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] riscv: Fix crash during early errata patching
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167061241627.2369.16766839910285576298.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 19:00:16 +0000
References: <20221126060920.65009-1-samuel@sholland.org>
In-Reply-To: <20221126060920.65009-1-samuel@sholland.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, heiko@sntech.de,
 aou@eecs.berkeley.edu, alexandre.ghiti@canonical.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_110019_188856_1BDD4D8C 
X-CRM114-Status: GOOD (  10.14  )
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

On Sat, 26 Nov 2022 00:09:19 -0600 you wrote:
> The patch function for the T-Head PBMT errata calls __pa_symbol() before
> relocation. This crashes when CONFIG_DEBUG_VIRTUAL is enabled, because
> __pa_symbol() forwards to __phys_addr_symbol(), and __phys_addr_symbol()
> checks against the absolute kernel start/end address.
> 
> Fix this by checking against the kernel map instead of a symbol address.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: Fix crash during early errata patching
    https://git.kernel.org/riscv/c/61b2f0bdaa3c
  - [v2,2/2] riscv: Move cast inside kernel_mapping_[pv]a_to_[vp]a
    https://git.kernel.org/riscv/c/583286e2072e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
