Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB851C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=meTKDaLhKhciffryxT7CZpW8v0YsnmuG4BYzFC6/jXM=; b=gpboIZ5ulIuakI
	z4t+C5jbxhkmsbxLIxM+XBYGhxir6zNuCm+F6rRtyZFkP79HnvG96ZRpuAforeWxPymHGgr03y5nu
	4mScCzU90sWoZX+1H3ehg7BTzxtympzLbEwax4qRY/1YOx5ZeWCDNhaS70LRc4u5/IdaHMDsEb4rX
	/sevw6aeChI1OTmbao9hOnnZM5Lk0Ew5ElqnFe9gladad20DKQx8TcqArpdeJErIKeRTng9X8dy/v
	nSC641Iyo57g40VMfHlVQ82Uv7LpfyHKT7to9tr0J4eXNuPgcG92UeonAyFhb3ytx7bs574mXhI2D
	gK/r+RWLy/4OM5WkIJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTWY-000000078RN-0j1z;
	Wed, 26 Jun 2024 14:21:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTWV-000000078Ol-0Bsw
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4024ACE21F0;
	Wed, 26 Jun 2024 14:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A9F5C32782;
	Wed, 26 Jun 2024 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719411679;
	bh=n97Tfmv3TRG+hLeRDxVF/bzuaO9CUob3CYbgQye2sLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FD3Q1kBAdibjhTBurKw2vzJAfw2/5fhdXqjiP/H02J/7Yl7QU1bbpsfXIAKeEkyNh
	 /EIMzjX/1Hhx0bsOniTzDOoCeKo8WLlwcuMB9ep2kkOuGnlVVrFNAt+So1H6W+AkFY
	 +3DATKu8MWhbwLBSDTbxJKAfggRsc22oq58d6yNWXRZ8USdf9o0NcOVPVs10MeH+vw
	 7Or9cPCLAbl8qIt6VBgJ15zy4BQhGP6z+TBA/SysW+SLniwJwRYf7aG8+fQuxPecvu
	 Gu/a9E7lDD6ZBAr/ZdXXwUu645E8Ajviq88AN66U/YmGiI5cyWYD0tIN7JSy7YVFft
	 urcuSKwGJQ3sw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36102DE8DF4;
	Wed, 26 Jun 2024 14:21:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: fix vector insn load/store width mask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171941167921.28907.4527273499430176135.git-patchwork-notify@kernel.org>
Date: Wed, 26 Jun 2024 14:21:19 +0000
References: <20240606182800.415831-1-jesse@rivosinc.com>
In-Reply-To: <20240606182800.415831-1-jesse@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 namcaov@gmail.com, samitolvanen@google.com, charlie@rivosinc.com,
 andy.chiu@sifive.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_072123_306651_CD76587D 
X-CRM114-Status: UNSURE (   8.76  )
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

On Thu,  6 Jun 2024 14:28:00 -0400 you wrote:
> RVFDQ_FL_FS_WIDTH_MASK should be 3 bits [14-12], shifted down by 12 bits.
> Replace GENMASK(3, 0) with GENMASK(2, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - RISC-V: fix vector insn load/store width mask
    https://git.kernel.org/riscv/c/04a2aef59cfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
