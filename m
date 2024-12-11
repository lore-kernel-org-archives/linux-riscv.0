Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF21E77183
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a74Cpyy2labcHtS2QwN/IntQmspyvW2x7F2xDqgCGJk=; b=fPQ4gq8mGQav4y
	TNoiW035qcutndj16WU5QgmrtGoYUU5sn2bgh1EqyBrk/F+hDSywf4D6KBNcPg23l0d2LFGE/ay1e
	bNOxLYq8WIclX76WUON2GzvaqU7mfsO17EYhRzmaC1ajxkkIibI1ugYzia1jWSYHdMxO8teNapphY
	ATUMMsVim2HkJCm5P3yxBoASH7z+40DRFonDlE+Lgu9t9RAKn8Vpot7JkBuAsN1r9j6/+CxHytwKe
	LkmZbgU6gORsrdqcpD3PlEqdu2QhfJk4OmaGVvu24rjvgJSREE0pbTCb58TwLedhwbPB4BkNqId06
	i0kjLEEGwXEeeBIYfaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOY-0000000GWdg-2lkR;
	Wed, 11 Dec 2024 23:45:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG2-0000000GKW6-0eFs
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C9B65C6474;
	Wed, 11 Dec 2024 22:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD067C4CED2;
	Wed, 11 Dec 2024 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956357;
	bh=41951xLtjVXmGjs6Svjr58LJJmKu/NUbbk6BSbginiw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MJYwZtRkhMAZVKhK4GeGTjZQfxU/bIoqAd933nrUWGIQy7g2FOyZ2+ss3NA8gvqaM
	 +xBzXUPR2stu6pOUU4ev40AG/eDA0nKLsApM13N3nTKmZk0PSn2Dtk1/EszzyQuXUE
	 N826hVKZcNeQwlZi3cnKhP2GOnzBKGO+xdqQJr1urWgOSMuFDWfQKDfAIlCm/AZBim
	 EeZZxSjrgr+yMX5AGjAwKjpYXEuFPjiNdHrVz9+KumR01P9R4JRfNi0YxUNd3AAAKe
	 z4jaQV6YkswJm1lnYHP6e0/PYcYgZ88hRONMy0E+NPBbEqaCm+7FT98xVgR2puKHC+
	 qnGpxa5Tgweqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB31B380A965;
	Wed, 11 Dec 2024 22:32:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT
 SSWI
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637349.1729195.7002523247012795156.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:53 +0000
References: <20241031060859.722258-1-inochiama@gmail.com>
In-Reply-To: <20241031060859.722258-1-inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org, unicorn_wang@outlook.com,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterz@infradead.org, inochiama@outlook.com, guoren@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, cyy@cyyself.name,
 apatel@ventanamicro.com, hal.feng@starfivetech.com, geert+renesas@glider.be,
 dlan@gentoo.org, looong.bin@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143238_230175_072A82B3 
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

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 31 Oct 2024 14:08:56 +0800 you wrote:
> New version of T-HEAD C920[1] implement a fully featured ACLINT device
> (This core is used by Sophgo SG2044). This ACLINT device provides a
> SSWI field to support fast S-mode IPI. This SSWI device is like the
> MSWI device in CLINT/ACLINT, but for S-mode.
> 
> Add full support for T-HEAD C900 SSWI device.
> 
> [...]

Here is the summary with links:
  - [v5,1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
    (no matching commit)
  - [v5,2/3] irqchip: add T-HEAD C900 ACLINT SSWI driver
    (no matching commit)
  - [v5,3/3] riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers
    https://git.kernel.org/riscv/c/6da33567c0bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
