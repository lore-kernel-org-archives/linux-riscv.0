Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E97C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vErcEssxxFlBNWgLORQpwz70LmBls8vwBGyfOr88UtE=; b=cOpXFAmKX8Od/7
	po92A8NnlRpJEyoeqV7Qf1ujlKuqIUqtSz0qH3xFZiAzCobSYnMTbJkoqYdeDx+y66DtePFFASJNH
	OiMivAlRiaPZ/eozcoq2IyjKEe64UxfXhI1uaLSzvzKh9TZ+vLAVTJRiMvwSrkhVDI/G2chsXppE9
	GXbg2Ufh6i2dYCfsWf7tjSMM/eGlxAXy/5xdnqPsxRhfBXd0mWLBMZN0nrt9qNcOz3imgTq599i5x
	kOLD1A+H8PYr2Xt0q1tziZXaCzW3Kmvzg0rhmhX6MYD516LA5rIFY3wBq4AAVen5klgXg8aaEJWUw
	kaGip6mUcqB6PnKJ/i4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGq-006Izo-4a; Wed, 15 Feb 2023 15:00:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJGl-006IwX-Rn
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 15:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 59D38CE25BA;
	Wed, 15 Feb 2023 15:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F484C4339E;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676473220;
	bh=ud2L+CyOw+iN+RQc5ipA+9ORS66YoRHSKvp73hwiWuA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZampP9JBkORbrYbWgBtKTadR8CbQcMuPi9v4B1Z4s96Tu0QM73Qi14cfyZHFggusC
	 QflKam+rpLoiXslBnH0T0AVlDVaOEWjnLHYUcomjaJzXtNLWr5b3Sa2uHaXIY0zf+o
	 kPaSM8VtAT0JCdKdTsHjAe8ikM0xImzAKQ1YEWwUYm9VUxsXFrHVEeBKbzIABJRxxS
	 KvLRTOBtAwPnkdCqoTkOkGVHVPWfX1eCL8GeFGdx+cUryltvJ02krDJMmpLMHMdG8D
	 VGqbGU7llDSXyAV+JdltytD9xe/H/nhwLbkQarJXdaKeuSp2l0GnF6sWzwsUbs0uD9
	 R76Qokvwsph/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7FFBEE29F42;
	Wed, 15 Feb 2023 15:00:20 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] RISC-V: re-order Kconfig selects alphanumerically
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167647322052.11521.12635022434797203165.git-patchwork-notify@kernel.org>
Date: Wed, 15 Feb 2023 15:00:20 +0000
References: <20221219172836.134709-1-conor@kernel.org>
In-Reply-To: <20221219172836.134709-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, bjorn@kernel.org,
 conor.dooley@microchip.com, bjorn@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_070028_143663_5F4E9DE7 
X-CRM114-Status: UNSURE (   8.82  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 19 Dec 2022 17:28:37 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Selects should be sorted alphanumerically, and were tidied up originally
> by Palmer in commit e8c7ef7d5819 ("RISC-V: Sort select statements
> alphanumerically") since then, things have gotten out of order again.
> Fish RMK's original script out of commit b1b3f49ce460 ("ARM: config:
> sort select statements alphanumerically") and do some spring cleaning.
> 
> [...]

Here is the summary with links:
  - [v3] RISC-V: re-order Kconfig selects alphanumerically
    https://git.kernel.org/riscv/c/5f365c133b83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
