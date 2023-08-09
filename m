Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976E6C04FE0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBDB32+A7ESMt6GYMqOxZKfwKRnyVeaxtMfkeEfchQE=; b=H97JF5LLISy1ex
	C2X+pEvkCb+jjE2ek33hKwLTg+mh18w6jyhyARUKulsEm9OxVb8LVvxEAt1usB39QrEkW5XPYE2xm
	M0yhxsm2hgD8mYOC37XtJb6uwLe+rlw8Qn/G8dDQLdPJekk3t8keADmu5HkxYVXMRV01QMG1ssJ9L
	WM8QoCbgrdQHcYAKU/SCmbb9Gt2ZC4JGc4nvXfp993K52XQSVTz9mXh4YYnLBRW+fTxFDaiNIg5yU
	oEkvliKWbzhdI6YX5fs0bkPTM7SOJ8O7Rvf8l97Bv5QVOJnefccGI5qhmZ9TDDoDE7VldIoO2vye3
	njk2YwgyP31NIuQC06gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMO-005CIX-3A;
	Wed, 09 Aug 2023 14:40:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTkMI-005CEe-0u
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 14:40:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCFE563C5B;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C576C433CB;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691592021;
	bh=N5b3QpnRXEbEvS3LF0AebqdApk09psCS7jK2pqPZUTI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VNIN3s5jdfPZOzxslfRuIIRYew7DOlrDSHRUHrCkbbB5BnviEk3InN9NqyVqsWwv3
	 JBInBc4E/ZwYjK3v0PrPV4xDMEnfL8Pl8XmPbFi7+nkDsxdnay5A5LeTy5vtQoy789
	 WNVWcE6J9JQr9GpQTSY0kIXoV5rAprjlRB9ZG50ASqC9KkvZMHv0SMbjwDJbrZ5Kis
	 n28ZW9B/O0gQnb+TMgkApC97Qg4/m+ELbu7+hpfsVZAM1axcwEk28z1AhCzABOcj3U
	 Cnw/BSPHHQL7rVtO//vOocq7iDgvt+qvSwn6NcJPhRhYl38Mvg27wWD1LMSoV/Cq5Y
	 GGqhoF8+1KPWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A546C64459;
	Wed,  9 Aug 2023 14:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv,mmio: Fix readX()-to-delay() ordering
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169159202110.17533.11320910350713867941.git-patchwork-notify@kernel.org>
Date: Wed, 09 Aug 2023 14:40:21 +0000
References: <20230803042738.5937-1-parri.andrea@gmail.com>
In-Reply-To: <20230803042738.5937-1-parri.andrea@gmail.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_074022_390509_EB81B459 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu,  3 Aug 2023 06:27:38 +0200 you wrote:
> Section 2.1 of the Platform Specification [1] states:
> 
>   Unless otherwise specified by a given I/O device, I/O devices are on
>   ordering channel 0 (i.e., they are point-to-point strongly ordered).
> 
> which is not sufficient to guarantee that a readX() by a hart completes
> before a subsequent delay() on the same hart (cf. memory-barriers.txt,
> "Kernel I/O barrier effects").
> 
> [...]

Here is the summary with links:
  - [v2] riscv,mmio: Fix readX()-to-delay() ordering
    https://git.kernel.org/riscv/c/4eb2eb1b4c0e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
