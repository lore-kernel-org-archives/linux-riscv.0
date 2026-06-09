Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA44FCD8C85
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u4Le2/CknvEuwqfooE+1e+1KaH5SGEMp9eR1sitqkD4=; b=2Tu3zK3m4X9IH2
	LUkr85SmdR3f0/yont2tJpQgxqonABurLZpH1+jU7xaxzl5qGXQBCGedQtZ/4/JGiGDeQ6K+uTzZu
	cxcfsNDS4+Z8U9AsWn3LjpCiViqpavgfKXwZxtrJcYig5CmdxPUKBtDxP3CJqLV5/QIlMFPcBXP4P
	62B606kY94EJ2V/urPEU9fx0vCVewME8QleOxt3DLjNthuk6REVOxh2ZfrrhmrhftWUMcO95tNYDw
	Qwsq2k1hTTU8HIPX6pFgqPe3+u3TjeMLO4F29xzME7Er0vQi+z7X9ceIHdlZZCwW12vzFX2RrQO5o
	wBmTOayh0VFvgMteXGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqmV-00000004xRt-1aJ2;
	Tue, 09 Jun 2026 07:21:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqmU-00000004xRc-3iHG
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 07:21:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 572BF601DC;
	Tue,  9 Jun 2026 07:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09881F00898;
	Tue,  9 Jun 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989710;
	bh=vPRtbvI9UUMBhlEon6EMZ/axGnGv9eAK+KWtoV3h7y4=;
	h=Date:From:To:Cc:Subject;
	b=ZAXUSZU32gDUdU7qIJI8BLPMGvhEDAf6XJfLTAYNLD4UiGTYxg1XDNveKtbL2cNpk
	 bA6qL9keV5nSecLbg9fW38wi5YFF/7UkymWf6rSoZ5AfJRY8EE5H099wjFSQaM9eH/
	 2a9tgHSBSGm6AxSqc4AxmIlRy9qiCniFZydl3cGG9FlGgBq8gwALEMPg7xKkajNaoa
	 0uKnj+u5mJIb/0Kt/tGPlES51AGz+Rut8GgkbuJDfJTMxHU29D5oG10d8+6swvQJEK
	 qd+X3D4TEFi8kppcukXBQCSNBR5LS5Uq1bUROqsMZxZcZsKfiliXq0PavdjM1UVQjB
	 L7SJEz15Fxdyg==
Date: Tue, 9 Jun 2026 00:21:48 -0700
From: Drew Fustini <fustini@kernel.org>
To: broonie@kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org
Subject: Add fustini riscv-config to linux-next
Message-ID: <aie/DAyvda4bcdLm@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

Hi Mark,

I have a new tree where I will apply patches for riscv defconfigs. I
have trees for dt and clk for two riscv soc vendors in next but
defconfig patches don't belong in such branches. Conor has in the past
taken defconfig patches but he is happy for me to send pull requests
as needed based on my new defconfig branches.

Please add these to linux-next:

riscv-config https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#riscv-config-for-next
riscv-config-fixes https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git#riscv-config-fixes

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
