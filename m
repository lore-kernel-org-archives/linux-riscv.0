Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C62BEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVPB5Eyv2LSBJ1omH0HiLnwscExeElpX8bjwzNbA7O0=; b=UwHT6vW9Pv9pB0
	kH1qerWfz6Cw4Mj9JQu2/aEVSOBji9Z6kZAODKMTT9iGeiZ02u6bwPmzMNAWMq1E0bpmR+o/8iQbr
	40Dr4oigci1VLTMEmOldTtEA7tTQNV/aSsWH0jkMkAa7VKdX9vfSRd8RTgM0bJ8YVKjfJYWZ4MhZ/
	VxFvobMLuiFHcc0ZUTvfC6+ZzPeUevPGSknXNqLWShwy6YVQID5pXACSFUAKvaXMRp9frmFijNgxS
	/h5H1OqOyLD+CXnDYtWsREzYD8EuYlHqQyaBg4uSRPBB+KhZM1Kpp2bxhUL50KSauHc32Gcm7mQVq
	t8ADEIXF0+pEeqZvws9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjV-009pZk-2f;
	Tue, 20 Jun 2023 01:00:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjP-009pVf-2U
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3219260F7A;
	Tue, 20 Jun 2023 01:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24D5FC433CB;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=i+bkBGyvWdYTzpAuClogxpBwgpL1xJGlOgV4zpfwFvk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i5TrPzeDUtdGThVJUdeeuXnGMhhXwNhK/o2qo6Y/66rnbiQYM0elJY5AAPIptSjWW
	 fW9xRDTR8TMh2QxLP3nk79+Ms81jithGN2MljY7/J+itMQe17PdJxCcr9ByBcnV4B9
	 /m0bAqZEbt03RxTht4uehz6x5R3ElON8qmiHD3xb5Gz4vHabq0htYhiKYJNgqrV4uk
	 25gDhHX1K6y1+c4f2MW/AVDuqZ285pXphFYyyh2gA+g+7E/JlDlOTerDfV+t0VrLyH
	 nX80a+FvzSI8LqllpkqORmxNbDmC7cA/MVfxmZm05qsJ7t9rG8V82OwO+B8m/x6RuZ
	 Qbbg2tZR/fvVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0DAC7E301F8;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: mm: stub extable related functions/macros for !MMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282405.22807.12021813710687983255.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:24 +0000
References: <20230509152641.805-1-jszhang@kernel.org>
In-Reply-To: <20230509152641.805-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180027_847225_F3FEBFC8 
X-CRM114-Status: UNSURE (   7.80  )
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

On Tue,  9 May 2023 23:26:41 +0800 you wrote:
> extable relies on the MMU to work properly, so it's useless to
> include __ex_table sections and build extable related functions for
> !MMU case.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] riscv: mm: stub extable related functions/macros for !MMU
    https://git.kernel.org/riscv/c/de658bcf0333

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
