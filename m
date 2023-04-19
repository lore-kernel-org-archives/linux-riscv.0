Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460B9C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/UFFbJjwv9qxMWpxQQTktcXVZQ0O3fbqXTfCvVlXVOU=; b=rgbmSaFh9EdIov
	myVH2jT8iynX4+ne3bmejSPdWPI2Zck5tLEG6k/pbf/LSY1VuYrvFOLF4tyFGpv1cGqG9o3EuNsxQ
	jUWyhoLDt0x3wfXjYjHXjqARqbqFjK3SoIeHMqBxnmyzeNuw6/SL3G/fdPCKRL1B9aqXACJnKZeBD
	i9b2eXtrUk/CRiH3z6pWv8d+v05XIDzGeO4u77q9EG0n4rJd1Ke0kOGjnMQPg1guvJmal5zrJ0bMQ
	nSLyJRCQvzKNfeqJmf8Qj7QHiDSpNHhZJ5sajJdojFuMow0X1sLZlK++4uciI30KpjPVoJ4sicPAi
	ZB8W/Q6a4EUq6u/siXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pF-005fv7-3B;
	Wed, 19 Apr 2023 14:30:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8pD-005ftI-2Z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1FC060DBC;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 618E5C433EF;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681914622;
	bh=3GJL08UQ5T50uXQNNpKgWldke5xsbQdeX8PVBzZ1dls=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mngx4+wXO49ZYROCoPjuV0ixDSGI0mgFVagpIIbixh/mGPE4+nNOjxGBll4elwaMs
	 GXF2hoYusxo4WnRVB7JVtE3MYcEkbBxc5WDf1sWlbnoS/t1Zcu1FFD2ctttvo3DP9e
	 B3kyObgtLVO+kE05X7BYkg3FhvWUYE5Pna95TYaj+NG9sgXFI4VBVJYs81h6gSo1Am
	 ZKYmXcxa97p5f7e8/dA+drjzkDO0TOhhYt/FI9HzJuX2DtRNc1Nw5xgdqRgbYJP2Pq
	 drxKYFNu88yAvLWzXkoilZ7VEwV4wG8nRxQJ43ID6sglTZX3hWEnIQDWc0oNJ2xMLH
	 pYmIXLJF4NLgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B12EE270E7;
	Wed, 19 Apr 2023 14:30:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168191462230.22791.11892683089171760503.git-patchwork-notify@kernel.org>
Date: Wed, 19 Apr 2023 14:30:22 +0000
References: <20230323123924.3032174-1-suagrfillet@gmail.com>
In-Reply-To: <20230323123924.3032174-1-suagrfillet@gmail.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073023_894620_47819F64 
X-CRM114-Status: UNSURE (   9.19  )
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

On Thu, 23 Mar 2023 20:39:24 +0800 you wrote:
> RISC-V now manages CPU topology using arch_topology which provides
> CPU capacity and frequency related interfaces to access the cpu/freq
> invariant in possible heterogeneous or DVFS-enabled platforms.
> 
> Here adds topology.h file to export the arch_topology interfaces for
> replacing the scheduler's constant-based cpu/freq invariant accounting.
> 
> [...]

Here is the summary with links:
  - [V2] riscv: export cpu/freq invariant to scheduler
    https://git.kernel.org/riscv/c/c4b52d8b6c1d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
