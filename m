Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319EBCD5BAB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 03:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74wGYUP7QFbK1evS19U+YeHRhWHTvwtPyRDIhexippk=; b=rCyzhQpZbjM5MU
	OxQGCqhnJe2XmZ/X5VrmoGZQnyvAgDhOWjX8ggn8HsUq9lrEOz9T5Pus6qvV+831OxzAn6xRp8xJE
	7FCO3iLvcPMKrlBc3tpbF4WlPSdYoFt1xLEgch/RQcnJKyQ7EFNFbEwKo6oS6HMGmvfpxeL0DJWZX
	Ot3LIHsZobBgboN4h21AE2GpIo9IeSZEmhBKTJLhBKnPMdkAp+sHwTF25h2lLeZ/+FTcGVx/VKc8q
	B5GIfnMkzYmPd2/I1XZsYhx4zCGSXTQxFn1qAYkMIR4D2cZFW46YsX7LLAY5bVbtXvh7B6D+5ESNv
	xT4BjdOl03RN7Eyg1wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGBC-00000009bmI-1knL;
	Fri, 22 May 2026 03:04:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGBA-00000009bli-0dRf
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 03:04:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F19ED41982;
	Fri, 22 May 2026 03:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8E41F000E9;
	Fri, 22 May 2026 03:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779419042;
	bh=wY6yT+l6zGgvE9blOGuQ1pgMTzuImGpLaOcnv/U9o84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GzNtoVsBcmEsfY8jGhw9s7aDTAmISWtqc1nuPlEK0H8vNmLU5uh49CGfbmAUOe8p2
	 jR4HmEwRiQCTFZlLUl4cz2xrCrBj/eeBwqFsQjnbKwbHtYg0dCpJop2XxcG3MZG2Y/
	 VFk7oR3MNpBXRD0a8U55gxEHRiX+fUR9qvpr3xkVFdUQSyD7U2xwXLYI0/vtrLXAvG
	 pSL464mIjdhuC5D80eeujWq64w4PyZL7Lv0SWQeiuuXbHdg1GBOKLzN0cgNjIsfYQ2
	 PJLuLbAV4xN953QU8gl7+kkSXsEq0633AaIH5Uxj1Y4+EctZkK3jIjlra3gGAVStGu
	 AfILh9gejYsog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F23930E40;
	Fri, 22 May 2026 03:04:13 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] irqchip/riscv-imsic: sync-up state before CPU offline
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177941905239.602940.15678598632674221077.git-patchwork-notify@kernel.org>
Date: Fri, 22 May 2026 03:04:12 +0000
References: <20260508-imsic-v2-1-e9f08dd46cf5@sifive.com>
In-Reply-To: <20260508-imsic-v2-1-e9f08dd46cf5@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_200404_208879_7D8C38D6 
X-CRM114-Status: UNSURE (   9.05  )
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
by Thomas Gleixner <tglx@kernel.org>:

On Fri, 08 May 2026 02:31:21 -0700 you wrote:
> The "move_prev" pointer in struct imsic_vector on the new CPU is
> cleared only after the old CPU has cleared "move_next". But when
> migrating all the interrupts out from an offling CPU, since the CPU
> is already marked as "offlined", the IMSIC driver skip to sync-up the
> interrupt vector in __imsic_remote_sync(). The "move_prev" pointer of
> these interrupts can only be cleared after the old CPU backs to online.
> Therefore, the affinity of interrupts originally targeting an offlined
> CPU cannot be updated.
> 
> [...]

Here is the summary with links:
  - [v2] irqchip/riscv-imsic: sync-up state before CPU offline
    https://git.kernel.org/riscv/c/cefafbd56140

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
