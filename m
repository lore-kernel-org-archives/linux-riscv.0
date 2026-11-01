Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB1606F2F1
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bRrZFfT7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4ZsiFDt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IDPMwJq0xK5Stz79bdYvzSLSYDKjZIDicx/BiF2zlCg=; b=bRrZFfT7fwA6DyrWPQJ29jdN4W
	UxArI/65F+7CioxEgDtOckxIsVXjj1OV5bqIaL+5+w2zN4xMqzGVZU+qSTFXXiK5M1lqD1xXDwjmN
	vDugYgjs2YUMRDuUTkxeCrHmgGX+kayfQ78Lp6JjWopDYKpxVBCOA8Mvc2FeC4grT0L8d6OmnBRwW
	/fXrbZUXSV7Yrhs40/SC9a8JDL8fzN7Bsknzl1TK+86uQ1oYdeOdTWfKjoNyzmX79zKYYBdNTwEAm
	ct4c3DhpZOqs8rr93EJfTCg1RuknPXhk0Fa/IPi9XJGFS05521XDTpu08lvj2hF0oWzZBCNVqRWkd
	dLKvvk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrh-0000000F3LB-1486;
	Sun, 01 Nov 2026 22:17:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrA-0000000F1Qe-201u
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6CE843C19;
	Sun,  1 Nov 2026 22:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59771F00919;
	Sun,  1 Nov 2026 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571411;
	bh=1M18UEoj2fkXVA3N5MwFODgLvNc8kgHEtwNhvCdbEts=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=G4ZsiFDtZ62yw/+PrdD8L5Da6gB7BqqsvG701dZBR1txA7fSnfvZerKJe/hPf9qvZ
	 4dhfa7sn+SvyWYLr7JPbMzZROg2ndHcu7yFY9M8ejckEQk4zQGTsveX3hMKIkIAR/h
	 PEOoFYc5ThbkMFFjiIdoT8PETipkrDFzVTx+1f+O/+qNRcnzOuAxDSUC01qJCR5DHV
	 IwXAm8U8f+iDeO4dcnr2aFpB55Po8yP/uLgPpGwbX+WgwBeS9CZ3V717KQuYvMjhJQ
	 epfyR6Fge8m1DNcfsWd/uIU03aC59pi4rQI3NJu/wm3NOxeMOZXb84fp+XODxAaIA3
	 sDGSj81m6UQ2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA28A38003B8;
	Sun,  1 Nov 2026 22:16:51 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] spi: sophgo: Fix SPI NOR errors and clock limits
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357141023.2624073.834055517039065391.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:50 +0000
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, broonie@kernel.org, looong.bin@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 chen.wang@linux.dev, inochiama@gmail.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, rabenda.cn@gmail.com,
 lihangfan@iscas.ac.cn, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@gmail.com>:

On Thu, 01 Oct 2026 02:22:49 +0800 you wrote:
> The SG204x SPI NOR driver ignores transfer errors and clock limits.
> Fix both, enable SPI NOR on SRD3-10, and use 12.5 MHz on SRD3-10 and
> SG2042 to match EDK2 and the vendor kernel, respectively.
> 
> Tested on SRD3-12 at 12.5 MHz: both flashes identify correctly, SFDP
> reads succeed, and two full 64 MiB reads per flash match.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] spi: sg2044-nor: Return transfer errors
    (no matching commit)
  - [v2,2/4] spi: sg2044-nor: Honor SPI clock limits
    (no matching commit)
  - [v2,3/4] riscv: dts: sophgo: Enable SPI NOR on SRD3-10
    https://git.kernel.org/riscv/c/0fe449e8ff7b
  - [v2,4/4] riscv: dts: sophgo: Limit SG2042 SPI NOR to 12.5 MHz
    https://git.kernel.org/riscv/c/a3a8c25c59f8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
