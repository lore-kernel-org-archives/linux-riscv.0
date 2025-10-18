Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2867CCD193
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vea2lcTEafpNV2Ee/QvOoJufVOG3YznteKQQ41VRfF4=; b=vfUBXQf3GuQvHt
	ESmI4kS3saHtx7ULJvx9FaftyFh1zo7eWRdI/czAKSjqWynPkrD0b7SAaIp404Ztx+/J7NMUwHB4z
	xmLCHiRvSNwypr7I/kViMOtscrfqLHFqH7my9CR394FjEl4RBBvCAHC96un/rYQ0f9Qyt12/UgzaX
	wK/nuJkrW2y9iwQ+wPXEfj2hJ6adzGBTf0nM9cKeTASsHTgj3EBl6pozY7tllTJmEyhURZr83fqj+
	y9MVQsRX/Ap7+FtzE5Q8kfNPS0Fvf15Etb3XWQMvltlYthEzJ07Lh+s3NvQdgiWVHrsl5GoNfcGjf
	yEb2O5HAJHcDXEUVD/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NO-0000000A75S-0p43;
	Sat, 18 Oct 2025 16:01:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NL-0000000A74s-23jm
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0C29459BE;
	Sat, 18 Oct 2025 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA949C4CEF8;
	Sat, 18 Oct 2025 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803306;
	bh=xdGzVFaydhp9qU3Eq9iqFsHM3rixK5o6FO97hISarJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ivk5aZFwr1PqelJFYqIiLan7RNwSpRgCvimVwLWbZPPSsTaynAydgtRg34dHe4JoM
	 0OwpoyJB7yuUIYJLSmWXNSbyyOhMIMM+afBQjI9TNZ0Kel5Ib5t9m9Gi6yAUHVZtH/
	 ezkYhR4FTfzPvoS7yuW8naeqhECKHkctRYhNUnrmxGTTG8DzBhUgdq+aDW5yjs8C7F
	 dZvke3PXtXRdttUu8eP5CmfNmGrSOU+Mo/K43UQ6EyEcn/1U4zJXV7pQbNARwTuVF3
	 nr+8I/7k/xyHQj4W2ceUCFZuZZIylEYp+KtAa7xwF1aaFT+vAlwhS8HHptl7Z/iK5o
	 nY9GmDEUs1ZEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E1C39EFBB7;
	Sat, 18 Oct 2025 16:01:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] ACPI: RIMT: Fix unused function warnings when
 CONFIG_IOMMU_API is disabled
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080328974.3028979.2139175941358455786.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:29 +0000
References: <20251013181947.261759-1-sunilvl@ventanamicro.com>
In-Reply-To: <20251013181947.261759-1-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, lkp@intel.com,
 alex@ghiti.fr, rafael@kernel.org, joerg.roedel@amd.com, palmer@dabbelt.com,
 anup@brainfault.org, pjw@kernel.org, lenb@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_090147_547191_892D7E17 
X-CRM114-Status: UNSURE (   7.40  )
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

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Mon, 13 Oct 2025 23:49:47 +0530 you wrote:
> When CONFIG_IOMMU_API is disabled, some functions defined outside its
> conditional scope become unused, triggering compiler warnings reported
> by the kernel test robot.
> 
> Move these function definitions inside the #ifdef CONFIG_IOMMU_API block
> to prevent unused function warnings when the configuration is disabled.
> 
> [...]

Here is the summary with links:
  - ACPI: RIMT: Fix unused function warnings when CONFIG_IOMMU_API is disabled
    https://git.kernel.org/riscv/c/e7b969cbe302

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
