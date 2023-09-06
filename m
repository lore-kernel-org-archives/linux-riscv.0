Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE33AEB8FB2
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8CGOKG8Km1D/699IjtMlGhbruMqLzrVZs198VtyPN0=; b=T6QPwoSeXu2BQq
	uOlg2WWst7BlLTa/qosIY6O0hPDqKH8KD+l770UNSiDsgx8B/8yG+lSKkfrd8Zz6jUHHOrWkkEvDz
	L9oQC9S5jaegg7TnxzNsTzAb98G410J0kE6no3O8RxvScPgtDX4bIy3kvt4B8Zgruz1S7h9K+sJBV
	ButIGzVPJldx0K0a9OzGWL02IV3AiqEwpNkJJ1DeExfl32/A1CVpRzR0Q33FaGprG54EIYar9rj1G
	vibQTd19QbWE0QZKJh4WsiGIWKyfvn135jw1HkF+CjWa7cvytK0/MJgWqLo3O8YKAZ6U4Tusvp5PV
	ZV3d8asxN78Eu3dOHJcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdicm-0076GP-10;
	Wed, 06 Sep 2023 02:50:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdici-0076Cz-31
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 02:50:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0DB5B817DF;
	Wed,  6 Sep 2023 02:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B730C433C8;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693968627;
	bh=WXX8ywA+GcQsFV0bzI3D/8d0rLcnUXWMBd/za6XIDJ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Qa/U9B4a4XIWLtVvmOJvZfQC+KJKICzElSsEJ3e2belqRIOeQqGHi2adEosOkooAk
	 SIuh9xlukKszW6tIrcX/9YGRU0mCMo/CX9sw1jrogqvz+UyFG/BX8mELYgkDeNla07
	 JY1rAqbZWE5HW6YMqKYZ9MB0k/ZW9N78SHWXca2N1ZfTohnpGICpkLB5le+ixDNjxA
	 U98Fye0CclkAwW1Fhz0i1K+g3MIsYyAS/2IH3QQDFLoog4e3gFrc7AXGzHTdxRYv88
	 STnnXzbbj7tCSaIq5j9nE09l4t3T3OoVdHBwjJMf4ba4uuCk07fs+mWpIi/X5AQE0D
	 yjm3BIlNBoIbw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6FF6EC2BBF6;
	Wed,  6 Sep 2023 02:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Kconfig.errata: Drop dependency for MMU in
 ERRATA_ANDES_CMO config
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169396862745.1987.4794758415693130418.git-patchwork-notify@kernel.org>
Date: Wed, 06 Sep 2023 02:50:27 +0000
References: <20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230901105858.311745-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_195033_126526_FD9C9909 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri,  1 Sep 2023 11:58:58 +0100 you wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Now that RISCV_DMA_NONCOHERENT conditionally selects DMA_DIRECT_REMAP
> ie only if MMU is enabled, we no longer need the MMU dependency in
> ERRATA_ANDES_CMO config.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> [...]

Here is the summary with links:
  - riscv: Kconfig.errata: Drop dependency for MMU in ERRATA_ANDES_CMO config
    https://git.kernel.org/riscv/c/6fd57a739233

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
