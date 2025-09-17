Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ABDCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 02:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18RP0i/L2WIXL8aDAS3HUPjs3NdYcZF/2AkRe5tzlyI=; b=Cch2QOpYf7+eOE
	t3sVDFZ+ylVIRO9RP+B/fZNtrLbnpK/Mi9XEO+cvpUm/jtnfV1tzetL6fHR0pRlik+ePbAa7r92S7
	dpXaLmaTWUj+b77dCpYPSCD6x2sXx7Y25VgNAUHUdypxGqRVDQcI/2Pmu117hLl3fV3AU/fr8C7St
	peeaGngvTE/s/7dmXTZ7QeXYrS5i6d8N35cbcONu1iZuUjMpWqmyLlN8+OygTc+c+nhEnJDIe+RUe
	9UzH1K0J9gozfycVqFH/LExcGzTTt6iw0OdEnQHBUu8k1FkJ+33mhRPq7lEI4bbgPL4qfz6G3eNuQ
	+/m66elOucOotP+cmLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5g-00000009zPT-2yr7;
	Wed, 17 Sep 2025 02:40:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi5d-00000009zO8-36uB
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 02:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3620B4086C;
	Wed, 17 Sep 2025 02:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A29C4CEEB;
	Wed, 17 Sep 2025 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758076811;
	bh=w4wLr2yP8Lf0P8+wu6uiNnPTZbO4BPOT3E8l8dJYdWA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pV0gbRikLFcdAi6S6oBasXHUmazo9Ijq3E1YrL4stpdS1JqA+JI66tleB1GCtaDRN
	 Y7R4ElrtL/gNYTxlyJN9cVKJnEkM1+xVxx28zI/LNqsrFpfx0H2gcaHtLX+uNl7GOZ
	 NpazGumn8ZKM9sKSlJ/5LVslpZvlO9y80i2vGK+26GnT1zKESblKd4RnxmmsonkPbI
	 CtzcJJw/zktmjeSUpXXFHdxkHjZYpDvLn1mSlzNENjCRBUQ300u8zEIByis5kavqlN
	 bYYJWVcUXMEYw2GFZX3nVg59xhelLfolp+sHHyiCWBmBuEqmVzJWQdb25PYaeuYoRh
	 Zj1/H65b9WFJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3239D0C1A;
	Wed, 17 Sep 2025 02:40:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Common csr_read_num() and csr_write_num() for
 RISC-V
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175807681200.1444719.17820860384159771040.git-patchwork-notify@kernel.org>
Date: Wed, 17 Sep 2025 02:40:12 +0000
References: <20250818143600.894385-1-apatel@ventanamicro.com>
In-Reply-To: <20250818143600.894385-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_194013_809266_CCCFE451 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: mark.rutland@arm.com, alex@ghiti.fr, rafael@kernel.org, anup@brainfault.org, atish.patra@linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com, will@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 18 Aug 2025 20:05:58 +0530 you wrote:
> Some of the RISC-V drivers (such as RISC-V PMU and ACPI CPPC) need to
> access CSR based on CSR number discovered from somewhere. Add common
> RISC-V csr_read_num() and csr_write_num() functions under arch/riscv
> for such drivers.
> 
> These patches can be found in the riscv_csr_read_num_v2 branch at:
> https://github.com/avpatel/linux.git
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ACPI: RISC-V: Fix FFH_CPPC_CSR error handling
    https://git.kernel.org/riscv/c/5b3706597b90
  - [v2,2/2] RISC-V: Add common csr_read_num() and csr_write_num() functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
