Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADBDC0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUX7QgjhJq1ygVdc/VmblgBQe7G01T5rc0JJukBCR0E=; b=1PKmmEJvZdOfiH
	oewbLI6mK2AkbSnk8iEGNb8qmzCmX6BgSR2m7QsoMZPuDwg+uW+arObKORPtGKMofnWTFwY+8tDXz
	cpgqVaroh9ukObSeiwoAeRVOKe4itgBazfdOiR+FU1BqGDztiPhE40/2nxAo4S972cUrfCBoAoxUY
	sNOp6nY0QeG2rzBUZOb4K55NgBNyxQbQJp8UrEgd0gTuXp7uogHyDuC28j1a3rNBJ5b0Yr16fc1gs
	9QJ7PcTwpCFY751bVnJIQ0KTBozclLK0Lxyx8MM49ZEE4EvoN2e1Elojm+PJEEXz5KLunXovGRbzA
	dx8VgNLevOyfJBUV3+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibL5-0000000BZzX-1gO1;
	Thu, 13 Feb 2025 15:41:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tia4Z-0000000BITg-3un6
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Feb 2025 14:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ovp8wt5bSZ1Mhov2CrlXeYfphxJnbdd90Pc6g2OqyUU=; b=kaCMwEGNRP45SAGufyMuThRk3a
	lFHHk2xas5SKe64yaWNSJMeX3iSKYbQB4WX6YKij0OkcqTk1ZL4jJ4RROk9WY0MDSz3gDm/b876T1
	EV7oZQc2Aj8ppoTtXh4y/OhgKfnQ61T9qp3mNMHJj9MF2ZS0df9urB5uZ3G2IfHNahYTTDbXRncmR
	BbuflZUL6tx29jrBcwmleniLsFhaWmkGTPcUhmfGiMzlpXZOYBebmfvFbU1CQ1eyOECi3FEUj3VYa
	y0pY/EWNebc3c+wi7jZmchBSnnDhG5YkWhHnG7flfNewcI25Q+jhnFRm7o9VSdbO/tLdAr9fgv3Sl
	WmW3nbGw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tia4W-0000000119Y-3TdK
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 14:20:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C52A95C56F5;
	Thu, 13 Feb 2025 14:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019F2C4CEE9;
	Thu, 13 Feb 2025 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739456405;
	bh=07usGt1nxc0FC8bBEeP0t7h42KmIbvUtMbZ9M3Tt4ic=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DtAoRzvCfrFcwM/EoY1fLtsKsSkjXzZrglAQpuSmWdSHn+mUzD49mDL0Z9U1E4m/R
	 8aGwhZvxQV9oGrSm8AcnfVv/c5lWL/bRaVowNpmvrdwB4xGre6bU/7CDVzFGkDMbqt
	 TC1iTa7HA9jx0f3z4Wb8PvLtQ82cT7APZkcFJ/oU7IN1SqY233Cggs91okgaRHpHQj
	 FZUDlCJxR29TXBg4gWMz+xGKzD1eDvHR787KJWnV+XaFft9jONuP9oyEOc/c4W7xMN
	 2TvtZ+MTaCDeKG5NOoaxtXdO4E+g/7OM+gVxHnTJr73P9YTWnHbNz4rix2Ze53nUfB
	 N5zUUIquPik0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E4A380CEEF;
	Thu, 13 Feb 2025 14:20:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] riscv: Use of_property_present() to test for non-boolean
 properties
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173945643426.1243861.13922610517205148727.git-patchwork-notify@kernel.org>
Date: Thu, 13 Feb 2025 14:20:34 +0000
References: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, spersvold@gmail.com,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 jeremy.linton@arm.com, conor.dooley@microchip.com, palmer@dabbelt.com,
 cuiyunhui@bytedance.com, sudeep.holla@arm.com, mikisabate@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_142009_084903_B55A5750 
X-CRM114-Status: UNSURE (   8.98  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  5 Feb 2025 15:39:01 +0100 you wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated and since
> 
> commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")
> 
> a warning is displayed when used incorrectly. Fix it by switching to
> of_property_present() as recommended in the same commit.
> 
> [...]

Here is the summary with links:
  - [v1] riscv: Use of_property_present() to test for non-boolean properties
    https://git.kernel.org/riscv/c/b9524a73725d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
