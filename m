Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2E8C7EE37
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 00:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c7UQy7TooABvKQ5WL9HsplSYsWXbWSs/BvMKPvD0p9k=; b=Mj0BrbofCyabfD
	MccgLNJFJfG/SNwbKon6fe9JQRfmodVYWvTQgQD7zNcmWTMzkssBzkILtVgEnNR3JvQZ8GVFTEWLx
	jzXfB24Dr/U5Mgh1biocKZu4R6pqffqJ5CgsEGQAKtq0nqJqoNa87AS8cr/565OMwszNVSCFu/X+E
	1CcJCxi29iY7n7xUkqbc3rjE6nP7Ng18g3KzXcEHuCU3eOKEVRGLzCqJoH2wBa8RrodRQHIbcmoAn
	z63ByqE4Dxi2yjshzFb+4YPCgEym3JeZQj8bdujEsEZc9yTzlUglDl3EDdhl+aEPBiMx+rThz7knG
	pDI3stGbqvaMuPcwZNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gbD-003ilr-0Y;
	Wed, 07 Jun 2023 00:00:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gbA-003ikp-1a
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 00:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 079F5637ED;
	Wed,  7 Jun 2023 00:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6149DC4339C;
	Wed,  7 Jun 2023 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686096020;
	bh=gvvjUKQi4wiUt55k1lOIB90d9t2HHIpkJYXB1NoPZMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BOTENdVUIQ/9A3Q3sAtj7l0NnIJZ5pXpfsTF3xMIz2IgbL8Xhao8FxsfjKOl/HZZr
	 G7ng77QseyQTklBhD4T4ZUmPG5nDyHrYrotzilEOmkMOLyNDuDMbX3L9WMn2+UWUoh
	 aOSTMW8aLsfEk+lyK5Pjc1v23MxFme2Wxdf2Zax289USGB7c7BqkZGewbuhEV8jU0w
	 frC5GMovgFQt7B1GGFxlxGjOwgm6HCYVUp6rRkM1osP5OzhrZ6i1/9mnnKF+ebGgMp
	 TqlJmP4i+ptSUgEZYJ1BEMsuTJE2xe97tTyqMSq9ZbhMn1OVAuRhddBMd5mYrTac2A
	 IgHotCqjyAOVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44DA4E8722F;
	Wed,  7 Jun 2023 00:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: allow case-insensitive ISA string parsing
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168609602027.16436.14732118380879424687.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jun 2023 00:00:20 +0000
References: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
In-Reply-To: <tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, ajones@ventanamicro.com, twd2.me@gmail.com,
 soha@lohu.info, i@zenithal.me
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_170024_594571_FF6E590A 
X-CRM114-Status: GOOD (  12.07  )
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

On Tue,  2 May 2023 00:10:19 +0800 you wrote:
> This patchset allows case-insensitive ISA string parsing, which is
> needed in the ACPI environment. As the RISC-V Hart Capabilities Table
> (RHCT) description in UEFI Forum ECR[1] shows the format of the ISA
> string is defined in the RISC-V unprivileged specification[2]. However,
> the RISC-V unprivileged specification defines the ISA naming strings are
> case-insensitive while the current ISA string parser in the kernel only
> accepts lowercase letters. In this case, the kernel should allow
> case-insensitive ISA string parsing. Moreover, this reason has been
> discussed in Conor's patch[3]. And I have also checked the current ISA
> string parsing in the recent ACPI support patch[4] will also call
> `riscv_fill_hwcap` function as DT we use now.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: allow case-insensitive ISA string parsing
    https://git.kernel.org/riscv/c/255b34d799dd
  - [v3,2/2] dt-bindings: riscv: drop invalid comment about riscv,isa lower-case reasoning
    https://git.kernel.org/riscv/c/9e320d7ca46a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
