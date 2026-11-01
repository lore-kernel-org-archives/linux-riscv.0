Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC760701D3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ANitmktV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSZItbFK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RiYFt5U413wfH13O+uDPRqe5JXb7ypPj4cxTsGDk0l4=; b=ANitmktVekHz35vLlZ1BymLy+L
	eZZdzcG9EZhWwTfGuAgyOXcTTvrwGNNFx+OW2CbP1ZCKfkaLl1Maa0zhW46RPKwEGTuVvj7fQwl1G
	SsDfr/vMN2V8DSy8VC2df2uZ+Ov5FeLO2T7ZdP0Poxs7hySaWWirDlFukirz4N6tl3rwjoNpGz4Q2
	D4iA0joKPglstKOY0+E1uMSGnGcF4jXXa3KataHJn9vWg5TwcuFyYMSeW7z1bScLwKu/qLNwHWqfA
	gknMiSaQ83glLuQBS157uTSEp3SE1QhRNXUa+PHQ+mDaJntUVQCfHF85S71bf4M7A7fGaE7jF6W7l
	508CdTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqo-0000000F0RO-18nZ;
	Sun, 01 Nov 2026 22:16:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqV-0000000EzWy-1dk3
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BE6F402A3;
	Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1131F000C1;
	Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571371;
	bh=YLKh8ba9L3rUxnN5x+nnHd88mmDqVen/JZWph5lSrDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CSZItbFKmma0qjQPQ1I+yVnn0zcypanEL3Js6cusu/K3BruI16405oj2sfQPr4Qxo
	 5vyR0gnYlSUMtCLvP1Sr5lji1J0tWWWmzF1yE4ojdGA4M6cWfaC4UrT28Uk+e7J40E
	 WIcpCJnlN0XYsd+gexjLjS718qwcGcvSvQqqNcH5DTxvY/HnZy2bouWOekavUGTTX+
	 rfIYZ9CrSd+SsV+poLXDzWIcuyml4/jPE8dQQpSOEj2TLS3JdBUqUmexEBuMmy7uZM
	 bBaAXihgJiq3V2N5pAkBfVjYTnN+aBBfjhqZ6A4R9rwY1OllGuQb6x9ADBVrjkI0UR
	 6ccb5+35KLfEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 031AD38003B8;
	Sun,  1 Nov 2026 22:16:11 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/sifive-plic: Panic if initialization fails
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136954.2624073.18206480386098589488.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:09 +0000
References: <20260911145037.427896-1-namcao@linutronix.de>
In-Reply-To: <20260911145037.427896-1-namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, tglx@kernel.org, radu@rendec.net,
 pjw@kernel.org, samuel.holland@sifive.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Fri, 11 Sep 2026 16:50:37 +0200 you wrote:
> If PLIC initialization fails, the driver unwinds and returns an error.
> However, that is futile because the system cannot function without the
> PLIC: all device interrupts are routed through it.
> 
> Instead of the unnecessary cleanups, panic when PLIC initialization fails.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> 
> [...]

Here is the summary with links:
  - irqchip/sifive-plic: Panic if initialization fails
    https://git.kernel.org/riscv/c/dd6abfd40c6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
