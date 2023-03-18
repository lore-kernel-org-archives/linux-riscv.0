Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43DDC74A5B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 01:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qI4UqHcIbZTcM+8utCjzbMBk7QYEgk9PJ8oJm1zzUlk=; b=kj5bFNbu6VJ1uk
	qIFwBEVUhJoRGCpUnyxEOkR45Cmz+3iFRyyZggrOJugdwW6LsLTwpb1oJvNCAsV1dFKqfiHl0OQ4Q
	Jh2tOz+92rV1nlFUyPHirfyBvfqrCxFLRcShOd6OvpIJFeJtKZFJNPARDBr17k9M0RZfSSIvS9MLZ
	O+jkWZRBradmqhuuf+0owu4b/XVCNeKdMN32yOONnPsZa90xX2gmyoo6Ceie/0CaTAnBwKc64ETlv
	3T2x95lVn84HhDIGezSz2TvGzCN3KcVN2O7RU/2dot/n66b7JraaEwT+whw88Ddhqqa+cDs8Mw95b
	YYS0E0z9MJLCwyRPH50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdKvw-003oxV-2w;
	Sat, 18 Mar 2023 01:00:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdKvt-003ow2-28
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 01:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B041AB82745;
	Sat, 18 Mar 2023 01:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79915C4339B;
	Sat, 18 Mar 2023 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679101221;
	bh=x3cTI0b6JhXkdaVpaHZrmSB5yAlEtIw83bG9V+KmJBQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WjqR4MXhsw4bNMR278tRNFpDoK1QMcBl1ACb2o+I8XaeZwUti1l8yOm0t5ldnXE4A
	 7D3hAepmM4vt8NeNoJCDlWPm333gd6scwdCGJVjm0Heh86efENajYANZ6TSKdxFuKB
	 m5GT/KxpSjO810IO2vxjE/KCxVUEOPtX+/MP3HkXmPjQE0Jl88CVZLWSBPOEXSXFtr
	 F9QJ69HKg7bM+U1igCNS5IQ3fjBdW/f4NaXAtWmJNo8GTpVmuMhe5sa5BQB1HGtVOx
	 J6gD5lqv33MTvH9My44K13Sl7zIGu578U4iWIt+Ckq7UdAHB1N1Cg/doaKECv0lfjb
	 74nwvJSUYWvFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52744E66CBF;
	Sat, 18 Mar 2023 01:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] riscv: alternative/cpufeature related cleanups
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167910122133.24496.7022977179168484693.git-patchwork-notify@kernel.org>
Date: Sat, 18 Mar 2023 01:00:21 +0000
References: <20230224154601.88163-1-ajones@ventanamicro.com>
In-Reply-To: <20230224154601.88163-1-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 jszhang@kernel.org, palmer@dabbelt.com, heiko@sntech.de,
 conor.dooley@microchip.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_180029_852191_0852A20B 
X-CRM114-Status: UNSURE (   9.00  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 24 Feb 2023 16:45:55 +0100 you wrote:
> This series has no intended functional change. These cleanups were
> found while renaming errata_id to patch_id in order to better
> convey that its purpose is larger than errata (it's also for
> cpufeatures).
> 
> Based on riscv-linux/for-next
> 
> [...]

Here is the summary with links:
  - [v2,1/6] riscv: Clarify RISCV_ALTERNATIVE help text
    https://git.kernel.org/riscv/c/099122af4e29
  - [v2,2/6] riscv: Rename Kconfig.erratas to Kconfig.errata
    https://git.kernel.org/riscv/c/a3d095ac00fa
  - [v2,3/6] riscv: alternatives: Remove unnecessary define and unused struct
    https://git.kernel.org/riscv/c/ce06b42a4a96
  - [v2,4/6] riscv: alternatives: Rename errata_id to patch_id
    https://git.kernel.org/riscv/c/ff19a8dee196
  - [v2,5/6] riscv: lib: Include hwcap.h directly
    https://git.kernel.org/riscv/c/28ea374da1d9
  - [v2,6/6] riscv: cpufeature: Drop errata_list.h and other unused includes
    https://git.kernel.org/riscv/c/816a69744102

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
