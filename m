Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74175C61D9D
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j17iLI7WXCdkws3AjLG2eUn8hKsNfrX2SquNFeEoEMA=; b=aM23Mm94ULW9/Y
	uRQ8vJFYIXGjqW8bMJbeQK3zxubgv2qhB3i1M+2/uMGH66Gzpmr+aEOzj8xT8mgViYbmNuC65crmU
	tQrHwwv0YFwS+fwDR1T5/3p5lmPUAkT9AidlobmAFhj6X9tApLF/KT36NikdpPW/d5QWESjD1Q7sb
	l7ptEaTF6Unt/EPz3UPbO8C5vr5V4/W7dZ12XbKMQcAvZTnWzqAMYoF2VHrBGOs0AShKVz3Byd8rV
	4EQAqunyX4hhKyb7NvHDR+30ZncgW7Pfnv4PceoN/YFA+8ULj8JyFoDv+IPDcvWumEuEjx5aQAupu
	2NTuv5mCa11wthBZdBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnn-005x5i-MP; Wed, 25 Jan 2023 03:50:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnk-005x2u-1S
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CFE36142F;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B82DC4339C;
	Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674618619;
	bh=5zYmil3GpjhlKKEO9HlMg1matkV2+zsa3NF9i+Idsaw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QYYA1Z0/PbzFDo8jvAvczuNLHcVO9ml0x5u3HcjnIfdZLSX41QzZnBxyor1elhfLm
	 Gc1MUf7+c0N8W9HnXviYlwtBw65xD/GaEEwXGNTBWs1S8RRfR1NxzgQOyX1gyLuxnf
	 IQGnNQD3wyG40/hbQ+m82/67Hd+5KILCbHbLQPOTfmvLwP1KTY2rhQPhlR1B0qhb+B
	 Gg7PiA7PT8jHr92jX9h1R5vauTzL0nXVWnh0u5YaBJRG+8upI/TwrFePJW+wH65+Mo
	 NZLPvY/cds/pnpXkDEoc/WF0xrcazmiJYoOoK+Yzd4HvSB+lG/F1rH5vK5Qsedz0Kl
	 0sUmfwSDD3NKQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC620F83ECD;
	Wed, 25 Jan 2023 03:50:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/3] Putting some basic order on isa extension lists
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167461861889.411.5843489021071731633.git-patchwork-notify@kernel.org>
Date: Wed, 25 Jan 2023 03:50:18 +0000
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
In-Reply-To: <20221205144525.2148448-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 ajones@ventanamicro.com, aou@eecs.berkeley.edu, conor@kernel.org,
 corbet@lwn.net, guoren@kernel.org, heiko@sntech.de, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_195020_135584_F58DEE31 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, 5 Dec 2022 14:45:23 +0000 you wrote:
> For v2+, I added another path with some uapi docs & switched to Drew's
> suggested ordering of alphabetically, except in the /proc/cpuinfo array,
> as per the discussion today in the pw-sync call. I also added a
> sprinkling of comments around which things should be sorted in which
> way.
> 
> Pasting from the chat on v2, since it's relevant to whether re-ordering
> what appears in /proc/cpuinfo is even permitted..
> 
> [...]

Here is the summary with links:
  - [v2,1/3] RISC-V: clarify ISA string ordering rules in cpu.c
    https://git.kernel.org/riscv/c/99e2266f2460
  - [v2,2/3] RISC-V: resort all extensions in consistent orders
    https://git.kernel.org/riscv/c/80c200b34ee8
  - [v2,3/3] Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo
    https://git.kernel.org/riscv/c/f07b2b3f9d47

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
