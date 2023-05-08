Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D24C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfQS1ayHWw/eDehVRT4d4zOUujAceEID6wij7i8nV/I=; b=Xi/TAIFa+L9nkr
	Per5JC5sxfgCemaJN1uMSpuqO4VMsWvBHrA5xXO+MVVuIC3X/WSvJ1J4hLMV4hzHmU7dvi2cYu6Px
	lTNonLq6NKZnaGiySUJYckH5L/z3ESYkXFzetBL3HtPY5W6oZTUnFm9AiSK5nR7JYQtFQtu8Vos/x
	iYtWCnGlcrHnmOvOLfvabgBOaiZ708ED6a0Cni8WUxNWL9BEFjfH3GV/x7bKViBIBgVgQcMNt/JFG
	FdxWtzCq6frEkpwQTfgIPX5baJEihNW90mOjmoYSxwzlgl5Ma2SNZkB/CD4VTWUcmbEVgUcsKzxsQ
	5CeVNpSIkTgmU6K2TL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23z-000mad-0G;
	Mon, 08 May 2023 14:42:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw23s-000mWV-1I;
	Mon, 08 May 2023 14:42:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13C1A64086;
	Mon,  8 May 2023 14:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8673BC43321;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683556916;
	bh=MQ5DoJA1f5DU0Jx7eqFBYGiVwF/uh9yVBMTNrxYMYIE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tZJut4FMcHrALPqDh2zYAwVmSSL7WEktSeQju/lInVcIKyJV3YQxdELZDXzE/4FcV
	 a+xdEVih12ZS09iwE4Cm7uDi5XAkYq2iaNyHIVbmZXEboLjmZ8cfdXhzq7+UaIdf8A
	 DNjVewcBH3R4CnX5tKmHoahlkyC4jKqL9T2bRbUtUwHvowwtM2nCZTnTdPw9k/8O4i
	 ENIVVieYaTy45YyTku7vFGBJ2EDIStmGZRYki8YIU44aoVgcZQ1VuyQ15DT0HCDLzZ
	 QNXcq/0bYs0XsBzoDkPjcOkopq37LnQAwMfOEBznR8/TLD3KGAT0LxllTbmXO2tSbm
	 Hvrxnly9AVAaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6A92FE4F0A1;
	Mon,  8 May 2023 14:41:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] cpuidle: Use of_property_present() for testing DT property
 presence
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168355691642.25692.10503148227988680423.git-patchwork-notify@kernel.org>
Date: Mon, 08 May 2023 14:41:56 +0000
References: <20230310144703.1541888-1-robh@kernel.org>
In-Reply-To: <20230310144703.1541888-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, ulf.hansson@linaro.org,
 rafael@kernel.org, daniel.lezcano@linaro.org, anup@brainfault.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_074200_486407_38A5B51A 
X-CRM114-Status: GOOD (  11.08  )
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
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Fri, 10 Mar 2023 08:47:03 -0600 you wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> [...]

Here is the summary with links:
  - cpuidle: Use of_property_present() for testing DT property presence
    https://git.kernel.org/riscv/c/f914bfdd7f84

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
