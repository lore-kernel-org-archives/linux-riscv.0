Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B26C7113C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnlW9xsZtKl8/4uHfRrkU2gnyuAzHSHdgZgD6RCrAsE=; b=ll6IbOx8djtjj3
	OOmvTppREbmTdQkEy9b03lSTVVmr0oSjpK6vKqYRANfr98YtZ6P8J/S1OEm49SuV3NhLaeFL8rayz
	s/LQH+SgUtKWPo39DBhhdySSUwhIDg/zLhUMHRekF+fs94B9JlAuH61DtvtbKHUtomcMhoHdmeEKO
	WIHMDhuVYlMZNSsV8rHlodlVWbWP4+11snutthydsrxLfhplf/LpiSUY2oEForSV+07vORIoDAx+M
	rXPh9//wkRRZ2fQpEf3nskS43TrYZEQfJHYTSZfUoWYGSWgt/e5ZI0bJc9P39fgX2EXGW63nNSRzR
	50kiauTYjRC0Oq6XDx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57K-00000007z3J-0fNm;
	Tue, 10 Jun 2025 19:58:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pX-00000007T6X-3OiB
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25AB0A5149A;
	Tue, 10 Jun 2025 16:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5257C4CEED;
	Tue, 10 Jun 2025 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572886;
	bh=UfWMNdPrkqC4tlqc6fPvtbZO1G8O2Spm8W6u5bQX+sg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hBOukgqUoYHkJT4+Yt6L6J0g9mXhH5DdsPOob2ZcLjZ+1qP09+fO9k8aCvWj3lFut
	 fh/pOqPKm3sM5uXajzv5kmcsNFOe3LiGqZzoEzUkpU0sga3+CcpFpKNCYTXfwvwmG5
	 vkVYMPs81brQJ6V1FHgNrH6FJXu92Q/eXiT8ZowvO/lTqd5ZyorWfXP4iNv11QIRat
	 8ofKeBJDI2W1IYTw6fl8dd16NY/GZoT/xBGJI67+57W6RHyWMfNLiQcn3io3XWwzHh
	 upghmHwwb8tEFFfKyBgUItTws0xbpsDIX1Vu8SV/hrA6mdDabFjGpmQyQBSZsuezmL
	 gUgu/mKAEApbw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA939D6540;
	Tue, 10 Jun 2025 16:28:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi
 platforms
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291699.2454024.8618597246072730689.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:36 +0000
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
In-Reply-To: <20250522141410.31315-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rafael@kernel.org, lenb@kernel.org,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 mpearson-lenovo@squebb.ca, W_Armin@gmx.de, arnd@arndb.de,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092807_919770_F7FD697C 
X-CRM114-Status: GOOD (  10.39  )
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

On Thu, 22 May 2025 16:13:56 +0200 you wrote:
> The platform profile driver is loaded even on platforms that do not have
> acpi enabled. The initialization of the sysfs entries was recently moved
> from platform_profile_register() to the module init call, and those
> entries need acpi_kobj to be initialized which is not the case when acpi
> is disabled.
> 
> This results in the following warning:
> 
> [...]

Here is the summary with links:
  - drivers: acpi: Fix platform profile driver on !acpi platforms
    https://git.kernel.org/riscv/c/dd133162c9cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
