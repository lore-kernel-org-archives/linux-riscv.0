Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05683C61CE5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKIdFpSiVxKhg9iIw71aiZfGCY7k/iGnT/QxQ1C9uQI=; b=3B6A1rAMaHqq/t
	GlBBt+Y9Dv8eRuVVYhYsLHQ3tgxanxy0VU3lqSnUKhnthl31jYmBJV/1bwn/esGgxfOqjoDQFPPiv
	q698Y/xc5lut0KiVeKdi186jmC8HDQTDAh2pfb5Z8Njy6On4P278Ub8V0meOt74OsQF1rbLzw5Ez9
	jIYioEhMrPPV/yaEMPmT8NgCyOCYXDzaE48q0jUSc/wpqyEd4ijueR2O+J38cQ02rQcdGDINoRtd4
	iCTZGItrXJ6cHf9lGlDP4GcPDhZPqMX9VT3iWoY/O/0ht/pxn65cW3+ieLr72WXkFlC55KNbX0j/q
	wXQYnBZ3PdrQF5+PcLUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOH-000000099qW-3SfA;
	Mon, 02 Jun 2025 22:12:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMDOD-000000099l4-1oIQ
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 22:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5FBFA5043B;
	Mon,  2 Jun 2025 22:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549B5C4CEF4;
	Mon,  2 Jun 2025 22:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748902336;
	bh=oG/UiFUWA2CqvQOK2ARMpa4mEoWVthtgPVqsti1O0Oo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GmB4xxZHsyuvyb4+fqaveZTQq7xVpKklKBTrXgXzY+GKelBSCqlDERwOOPvt4KfdT
	 1I7yWMmh0ti63XdnuujHENbzJmw7QmphAk754Z3FKEQB3MH96cENqefC2GozoWKa5h
	 9QfKSNnLL93l7DNg4WTjuN5Ua5FZeI9w2zMOyuOV8EaE3iNDVOeDfrwUfkJAYZGJMa
	 RUhmlk0+5E3H6zbygVGElt8fEAyMbYHKGbi8RTu8yyUhwT/6NXLgPk+HSkfSSYZkBO
	 SN/XhjsjF6Z4SxtI/liToaslP7hNTgNeR5nvUrvh1ZhJzOhPIRI7ZPtjloC9M2Om+P
	 Ax0YP8ktV7I1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B58380AAD0;
	Mon,  2 Jun 2025 22:12:50 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: hwprobe: export Zabha extension
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174890236899.925497.8016809629793459248.git-patchwork-notify@kernel.org>
Date: Mon, 02 Jun 2025 22:12:48 +0000
References: <20250421141413.394444-1-alexghiti@rivosinc.com>
In-Reply-To: <20250421141413.394444-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_151217_533174_65CC6494 
X-CRM114-Status: UNSURE (   7.70  )
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Mon, 21 Apr 2025 16:14:13 +0200 you wrote:
> Export Zabha through the hwprobe syscall.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 4 ++++
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  3 files changed, 6 insertions(+)

Here is the summary with links:
  - riscv: hwprobe: export Zabha extension
    https://git.kernel.org/riscv/c/a479a75e82d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
