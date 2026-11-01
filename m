Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46A606A6C0
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyiaermF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E4IJhKC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WD3ElQtEp4UE3vv4llefGV7oJXRROhDxZ7gyF3klU40=; b=CyiaermFF7ZiIlRiGfKvGxMlz5
	vI0XrFaB4uE2F3ECpyYbqyGdMGNsgqx+1DD/k6PMLYyMZTtA2Lxkftfc/ehpRSwUHehmkTiQd/0U7
	wz6gCwTQR0jR7jDbReN21jvvhVgC6s0SH0x4DML7wb2PG67N1JkvE9Ec8jgFFIX62eq9V04ZsIeRS
	9lrWt8/d/0JPaCyU7IdVVVyHHyZvbXobZCtKqpkYEtDEdddJ7fgLBDPHioxleaJNdWg56wl/NGo/s
	L37WJzEX5frpV5kRh38chiAdVul2Rc7hcEaKAo/RJgblQqZGgXSwzDesmHUXDPhn/+wu3xl0ssAuE
	2MhJAp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrs-0000000F3xf-092y;
	Sun, 01 Nov 2026 22:17:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrQ-0000000F2HY-1GjP
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:17:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2CDB40583;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44141F000C1;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571426;
	bh=pABWBHR6n+up2I9bsewaTlF6DKSaIiqbqtQFSLN20TA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E4IJhKC/2Gm5SNOrDSZdjkrzCnmP6i9DgWi4yHtr2px/rWfBfrXoPUU0oWHORzvxH
	 bj8BYLoxYLEfRTMGEpwOkkO9EkcyIPRheuyqq7wJqeLRHh6W7MAxwCc+XAet85nVaX
	 YEqRtXYorAv045u6KSbq7DQTS1IdaSXIJ3LZi7lRfL9u4QKI9QDkezu5qfJIQYSJEi
	 b3ydJC9uRHOyhfNMqECILA0kUohpVp8rP2Nt3rTzunadNlsE1wdDarp4lAaggxVnTP
	 K2HUyDWJWOHqi2QJSUki5PcRfk1Rtva7PEWGuJcXcrYGG5GNxSnbpBQ8JwCNvqHnhX
	 F++ZNWC8c9P+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA14B38003B8;
	Sun,  1 Nov 2026 22:17:06 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.4
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357142529.2624073.15824616848622379697.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:17:05 +0000
References: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
In-Reply-To: <aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org, arnd@arndb.de,
 conor+dt@kernel.org, inochiama@gmail.com, sophgo@lists.linux.dev,
 gaohan@iscas.ac.cn, lihangfan@iscas.ac.cn, chenyou910331@gmail.com,
 andrey.lalaev@gmail.com
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri, 9 Oct 2026 17:23:58 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v7.4
    https://git.kernel.org/riscv/c/5d299ec9395e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
