Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A0EEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcFpsMBo3C/IaT/UpWJwmOkWpqPFcyl5oY+0cxjCS/A=; b=Hbcr018umlReWB
	j3yp9Ro31iyg3PHhqevvgKu781C4AhoUlY61DG8PTsApynTo8FDAjQGdfj5Ax9j+QaxxRLlV37vdy
	QkYN+EtvFyiOhdJf5xty6ls4V4KcJh19XLDPwtyN3ekdyDM6eDNcGSX6lbehk9AvRLWQufWNK7Tn1
	DYX6g2Y6KXb4mBddQlTRj4Hjns7moP2pWuen62/fSL6UQ5BghturZvmAQAFZAvI50619zCTTANrm9
	DS6Yu5EDXULt/tyXF7/9sY3yzaamWKIBenXDF9e38JqlfXbvw/pfjrpCicoESrj9HhxjdQ79JWWLk
	PKQMGQS/UVB36mMO2vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjQ-009pW6-29;
	Tue, 20 Jun 2023 01:00:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPjO-009pUV-0D
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 01:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB7BF60F6E;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B8ADC433CC;
	Tue, 20 Jun 2023 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687222824;
	bh=HxZDtofb5pX33p3Ctz7U3WBbaZaZS2yuTqlJTW0+Bpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hJpVUuC5CPGB5vi2HPFO6t8I9iNSVJEe4OUcmf3rVBwAFB25GizEWiybgyUWZUlDe
	 ZxtRjgniUX+460DgckOH2UW4zCeBwQ8z8UDgawnhiM6qKGuymhAg5lb1O6IrCQHSro
	 yGkliC1cUa0w0TWSjDtZX6NXN5aAQ8niG3A7WP4v2S+xhmB9SKoonP86AJWKlFvuUT
	 ovScnLkgf8M42OJdDw78pJs3Oa6iJuYhJtkkDigTQ4aemzUc2bU4acjrw7wP44CT/V
	 cuWMjEtjRT+QMUpn/kvs14iSqbTfl9UNvW371iPsKQhuW2TZkTNyxGxRQPex5jiQZb
	 rZlkz7Ntjd5PQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E0BC5E301FA;
	Tue, 20 Jun 2023 01:00:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168722282391.22807.12383716949139026057.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 01:00:23 +0000
References: <20230519102908.253458-1-suagrfillet@gmail.com>
In-Reply-To: <20230519102908.253458-1-suagrfillet@gmail.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mason.huo@starfivetech.com,
 leyfoon.tan@starfivetech.com, ajones@ventanamicro.com,
 jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org,
 songshuaishuai@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_180026_152562_A45D313F 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, 19 May 2023 18:29:08 +0800 you wrote:
> The suspend_restore_csrs is called in both __hibernate_cpu_resume
> and the `else` of subsequent swsusp_arch_suspend.
> 
> Removing the first call makes both suspend_{save,restore}_csrs
> left in swsusp_arch_suspend for clean code.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - riscv: hibernation: Remove duplicate call of suspend_restore_csrs
    https://git.kernel.org/riscv/c/c6399b893043

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
