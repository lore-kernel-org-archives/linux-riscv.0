Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E7C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3oO+DxntRSw7ZQks7wz+sOc7S2HQ/95lJhn/IjEP/o=; b=mJASRuvEkpEyLO
	AXdCm+xL4nmOaTF246xfJh1EDlTiAyZiUPbGbVut6pXFc12TQOKUG4z99vXXQCeiiIHpwIw4OX5su
	UFl/hh+Yiehsop3hz2MGClwMDvCllIQ/W+2DWh9lXysUFTGezy6zDLarSF4NhozpnuBqslqTA26lY
	dFXtz1PN5rujB0Ai09q0cnk76YD0gYKafX57r2UomgDpEnqNSFkf0YG/Ws9a3wOOJlr3aWhixt6YX
	VUuy0ISxRoJEJOFV2IbdwE7crcBD4PldSPUmfTyh7+ektgT7pxiDHCXa53S1ic7BR5aVVgZ81a1Yt
	FIgTnZc+yUWICtAtN7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL87-00DXtn-3C;
	Wed, 30 Aug 2023 13:21:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL7g-00DXXu-0E;
	Wed, 30 Aug 2023 13:20:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 589CD6229A;
	Wed, 30 Aug 2023 13:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E87D7C433BB;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693401635;
	bh=Rk0PKoJyEZ5+FRNg9NgHMqK2XLSnuE+lrVJYZ51wZv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MSVZRLD2fYUKb2eMAH/iloYGZzAMw1SeGca57apnBqdpGujyoYPtNdzUbInPAYrFz
	 iGpIEXi4XMveXZN+tb3s3Gz2/9Tr5qpVAmf1TMYBWcBH0NaniNNDvel1j5a2BOc7Ey
	 lOGMygkkHRJAnB1w1forSsGfM+5KEjV8/kSL9WMlodzLdaekNwjp2YSeNqnOM4TFrT
	 TSJrs8JWa32KdcqouXL3K1f2kIzWg/HU7SjIuuGR/nHFkPwdRr/eLo34u3oqy4kS9S
	 YQ07FSm7pXI0C8or5vdvUZlYzNcblvunjYksSy8G+WW0MUe7ZpNPNihRsYT7hTtWGJ
	 IAGlghIUyML/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF870E29F3D;
	Wed, 30 Aug 2023 13:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -next v9 0/2] support allocating crashkernel above 4G
 explicitly on riscv
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169340163484.19859.603263749901327950.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 13:20:34 +0000
References: <20230726175000.2536220-1-chenjiahao16@huawei.com>
In-Reply-To: <20230726175000.2536220-1-chenjiahao16@huawei.com>
To: chenjiahao (C) <chenjiahao16@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 guoren@kernel.org, heiko@sntech.de, bjorn@rivosinc.com, alex@ghiti.fr,
 akpm@linux-foundation.org, atishp@rivosinc.com, bhe@redhat.com,
 thunder.leizhen@huawei.com, horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062040_170237_BD153F3F 
X-CRM114-Status: UNSURE (   9.76  )
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

On Wed, 26 Jul 2023 17:49:58 +0000 you wrote:
> On riscv, the current crash kernel allocation logic is trying to
> allocate within 32bit addressible memory region by default, if
> failed, try to allocate without 4G restriction.
> 
> In need of saving DMA zone memory while allocating a relatively large
> crash kernel region, allocating the reserved memory top down in
> high memory, without overlapping the DMA zone, is a mature solution.
> Hence this patchset introduces the parameter option crashkernel=X,[high,low].
> 
> [...]

Here is the summary with links:
  - [-next,v9,1/2] riscv: kdump: Implement crashkernel=X,[high,low]
    https://git.kernel.org/riscv/c/5882e5acf18d
  - [-next,v9,2/2] docs: kdump: Update the crashkernel description for riscv
    https://git.kernel.org/riscv/c/33f0dd973d4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
