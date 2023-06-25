Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1078AC001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c30tRcAEmJgON6WIfzlE2APdUgDvPrPrqlYR658+td8=; b=J0U6lSotQQ8eKI
	1Pbtvz28iWweci3QSuOSK77V53cP1dGJSyoBz0US6B7d7480O2O7T+cdZfml/PJ15ebE1qB7zkM4a
	zQHMH9eQxeZFHJyBwMy91pc+/+Tdy5sMcJeAupTYkeYPfPJOhuIPUDx1rJVsKps6EcbU8jxlwpw6n
	WaFoVIAexNECKrtVqOVbZ8lZECTM+X5dfoSAeRLSdqT2B1k0CivhNY6fnnpOS5cVMRyxkf7aUfVDX
	tCzYe1HSnGi1pnn/cabnUOqFq7eKgfG79yF5MBQW27BW/rF9FS27lPas2GoIYFVsOj+4ECji6i0rS
	VmLS5Qxu8XuY53oHDjKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ23-008uNN-12;
	Sun, 25 Jun 2023 23:20:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ1t-008uH5-2l;
	Sun, 25 Jun 2023 23:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA9EF60C61;
	Sun, 25 Jun 2023 23:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3217C433CD;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687735224;
	bh=i5xRLAe5dg791RInG06iVVdKNk+C04r6Q3jjBplkE7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KqZV83V7MkY57HGYdKzKvFoB7+9DQ011FaJH5XFY6q/Xa9t69E5EUX//3vmNPnnbK
	 SywtzZnLthOoWD+rpUFLVi4vE1nqAOf6TMeZ9i0QD7XinCMeVHD38xv2dLQrb6W2zX
	 I0tAE8jdg6qH2iAh5+TQJw+MKVvf5r/oSSyLaJZueT+G3PiA5eVYS/Hw/1MbG7JjqS
	 UhqWnPv+pDjP8tD9WLrksPRaaCVUJvVMNs770xmGVDP2WN0m4bsHYbFBy1XfMycNka
	 Qr0n3SYJtq9tMrGnN+zz3nuhGRrRCBIBxqSeL0QJq7BE69PksXGphOkYTeEihneedT
	 4w0Qj3I7XgTfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA37CC43157;
	Sun, 25 Jun 2023 23:20:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/1] perf: RISC-V: Limit the number of counters returned
 from SBI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168773522382.24181.12828652442172753351.git-patchwork-notify@kernel.org>
Date: Sun, 25 Jun 2023 23:20:23 +0000
References: <20230505072058.1049732-1-v.v.mitrofanov@yadro.com>
In-Reply-To: <20230505072058.1049732-1-v.v.mitrofanov@yadro.com>
To: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
Cc: linux-riscv@lists.infradead.org, linux@yadro.com, ajones@ventanamicro.com,
 atishp@rivosinc.com, atishp@atishpatra.org, anup@brainfault.org,
 will@kernel.org, mark.rutland@arm.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_162025_938185_E52B72B5 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, 5 May 2023 07:20:57 +0000 you wrote:
> Perf gets the number of supported counters from SBI. If it happens that
> the number of returned counters more than RISCV_MAX_COUNTERS the code
> trusts it. It does not lead to an immediate problem but can potentially
> lead to it. Prevent getting more than RISCV_MAX_COUNTERS from SBI.
> 
> Signed-off-by: Viacheslav Mitrofanov <v.v.mitrofanov@yadro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [v3,1/1] perf: RISC-V: Limit the number of counters returned from SBI
    https://git.kernel.org/riscv/c/ee95b88d71b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
