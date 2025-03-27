Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99ACC36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZeUVeoZs/cd2LwWxgCK+v5Z36u1RYM0JEEgiK/kJds=; b=U6J5mVeQ/wXT6a
	YWABG/SuDfEgNMgMBCq3ksOD8Fu/1/Mvyl8eqRGnq9jPz/3xYXQQOxErJnByYJ9OQOp5wFk3OoGlo
	ko5+YDnqNc6/ziidWl4pMMMWr19qTsGLtYVSngoQ/I67WQUlcEqHVdxfvnI708bEOqNc7E6T9Mmvp
	i1CE8fMDUrp8XQ6hE//4QBBhN/TxWTSoprk/D0CWre2cFGAnqcLF0OpP0A52R+Xn4+XfalXt3YrC6
	zPtqtAU/wGK6twd7nyfHiJYj1+LvL0hrKZJta1jzQ7dVEbIpKu/ruSYqSAeylXOMBNOlL18QmMod2
	gjR11oUn9qOHSl2rV91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqk-0000000A48e-338I;
	Thu, 27 Mar 2025 03:24:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqh-0000000A45J-1Zru
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9744C43B26;
	Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4070C4CEED;
	Thu, 27 Mar 2025 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045846;
	bh=V5q+L5MEwmlD3IO5ghSBb/GcQVG1wIMzE6ywtDo/D+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ck/jmJzVpramqNP9f1zzuIpRjoDKhHwQtRfSgrWJAA8Q1E4h1+4Ppz6EkQ6aVbg6S
	 xWzcI8AdDujfKJpofUc2OV5xXzotsVadCZPvuDM8IMYiA9Cxg4eql7vQvMrut9KPjb
	 OnrodztxE1gwTF8KZ6uNGQPT1IwhuodXgQ7PIIiRMxlUxxX6XR9UAuFMQrnTPvLIl7
	 1HeoxphVlZWKntmjTk8DD313Cvuwa3iaQOzLYonB8kgsiJm/7AfmK7bRV/RNWt8ZU/
	 RycBMkJKbtPXxDN8+k1J57kpXZrHBKY5eKP4vNCH0RA+SYUFZmG0Rnhbn8EgfhPmB0
	 ge6mudUncGm3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC5380AAFD;
	Thu, 27 Mar 2025 03:24:44 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Fix the __riscv_copy_vec_words_unaligned implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588308.1549280.18024028894833270695.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:43 +0000
References: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
In-Reply-To: <20250227072721.5889-1-tingbo.liao@starfivetech.com>
To: Tingbo Liao <tingbo.liao@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202407_446166_047A7686 
X-CRM114-Status: UNSURE (   9.87  )
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 26 Feb 2025 23:27:21 -0800 you wrote:
> Correct the VEC_S macro definition to fix the implementation
> of vector words copy in the case of unalignment in RISC-V.
> 
> Signed-off-by: Tingbo Liao <tingbo.liao@starfivetech.com>
> ---
>  arch/riscv/kernel/vec-copy-unaligned.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - Fix the __riscv_copy_vec_words_unaligned implementation
    https://git.kernel.org/riscv/c/475afa39b123

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
