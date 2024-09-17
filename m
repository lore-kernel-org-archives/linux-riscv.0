Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DEECAC596
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSKm0331FrldEi51hOgP8Ug0mG54IhjQN1NLcBx61E8=; b=WKyLCP7sDh5GqO
	prTLNWvPc44InVv+Qn8p6TCzdfmHFY5S3Z97RnB+TdwsKcqGDh4mvPbnyHw4q9B8HBuAVpaRvoWCV
	envny6zuqeTEBhHc+BshwnILMK9eYGLKy3LteabYDTiC+CVY+GxgekUbBz6Gc/ojJOlBowVoqNBI/
	sRvxFTp1iRWfC/M3QnmS7NtexNKxGDTi0E4CIYSyVgZCNqy8UO888ZnaCANJCzJcMU/UkgVomawoA
	ZUTjc53+pLB2/giP5NbXsXCsp58NPt5MqjVAn2/bSfev6gLOLQR4ZJvPBHBMiXltc8hCbBpnZoh6v
	OX343KIuq3wpLR0v1jEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqdat-00000006jaA-0mET;
	Tue, 17 Sep 2024 19:10:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqdaq-00000006jZS-0DCL
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 19:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4691C5C0205;
	Tue, 17 Sep 2024 19:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68419C4CEC6;
	Tue, 17 Sep 2024 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726600230;
	bh=LN4sSdQbVNRyuftdRjJJuLlsJTP2gVDvHPaxKdycA+E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g7eXMVgOamIn36vMbI7OuOfwa16ZYj540udwW+aw0LC5jk77499xdtMqu4+A781a4
	 JXFWE02bYY8cKiHwool1FkHqHPB1Bm/5V+oGpDvsMsFpqI+fHW3Z6r/pdJHOtuJmv0
	 l67yZnK/BHXhciEeDPl3Vy5NheFPkSEtJkKZ6F2+leJCcyABGU8BsbRC6Su8ORzjo3
	 7G6EoxkrMNGCzprGCbrI9TVknmWwsuvRZOy/udc5Y7J/+J6jt9EZwL7M+bj+Thquk0
	 annP5eezlsUrx6ni73ycjRDliNFIarC2RpjqjzqKWXnuoZ44UsoUK8WTvz3/8Bv+8U
	 i1nr7135Ut1AA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34FE73809A81;
	Tue, 17 Sep 2024 19:10:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] ACPI: RISCV: Make acpi_numa_get_nid() to be static
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172660023203.247451.10308153847159173227.git-patchwork-notify@kernel.org>
Date: Tue, 17 Sep 2024 19:10:32 +0000
References: <20240811031804.3347298-1-guohanjun@huawei.com>
In-Reply-To: <20240811031804.3347298-1-guohanjun@huawei.com>
To: Hanjun Guo <guohanjun@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_121032_152707_81C7AD99 
X-CRM114-Status: UNSURE (   9.26  )
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
Cc: aou@eecs.berkeley.edu, haibo1.xu@intel.com, rafael@kernel.org, lpieralisi@kernel.org, sudeep.holla@arm.com, linux-acpi@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sun, 11 Aug 2024 11:18:04 +0800 you wrote:
> acpi_numa_get_nid() is only called in acpi_numa.c for riscv,
> no need to add it in head file, so make it static and remove
> related functions in the asm/acpi.h.
> 
> Spotted by doing some cleanup for arm64 ACPI.
> 
> Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
> 
> [...]

Here is the summary with links:
  - ACPI: RISCV: Make acpi_numa_get_nid() to be static
    https://git.kernel.org/riscv/c/21d98d658f9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
