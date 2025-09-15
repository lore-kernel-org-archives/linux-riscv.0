Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09F9CAC597
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtbEVc7Rr8J59cd6XNk8hTGH99hlOFj1JObrw8MM1i8=; b=wj7PDhu3YfzsfC
	RI3xsC26PIXgtKVXeuYsdsBPyM7cO1cYDUhsTpUdlv6pYJMOxxhLt5bPXMLT3gZniRrosjit+87q5
	qbfQFO4dFJFmKwSVoYLJDtugX5dklQVR1sj32axRPK6H9MlY8YO/naqmyzODcyH+P9bh1ddM2SY5A
	tDrQfg3YP/ftiv+F/eIsGbs6mTWnA8Eaf8CLWUhgsKhqlDdmO04ATuiljcBsIEaJNa9nuncSquaAd
	XPUNH4Rlgq5bs8HmpJilepRhf/ZS935TQy9wakdGNz+T0+zRgy4WYPu9KmVf+nN+eScOllv9X37CL
	TWPU3sloxrvrz/o+PtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7PM-00000003uMX-0lOj;
	Mon, 15 Sep 2025 11:30:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7PK-00000003uLi-3gi3
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 11:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03ABE601A3;
	Mon, 15 Sep 2025 11:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A82C4CEF1;
	Mon, 15 Sep 2025 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757935805;
	bh=0LeemALigBhOE/z8tc+3LQeO3KM+cUtqRXMQIlOWg7E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aT+e0fxJ0WcXTdzmFMlaOmeLBj7G/nVsrGnYX0C5UQGZARV4Ddqa6GBUMaI4JctuJ
	 ZPklzrvRxCLa1KLCc9Fi6nvlJdBqs/apKscB39/MZJ33CBkYH82FeDGLsy4j6EsJZR
	 PRiBwZHL+mAc6ZwY5oBbRb9Sk0ySNSpZ0PVrPgMwnwHINrn5hT24xaZMw9kKuSI64c
	 KcwnOODa3LxeBaspYEv12GgUIV1GjSv4h6OAJnMVEg+KLdRamu4Z3etavGWEsQR5ZE
	 8MZF5nW00qYy02gvPGV68CsQD07ZDPghoiBNYU8HhOouHwjlhX1+iaCviO1pr6wNAU
	 a6+bF0ClR8jvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CE5383BF6C;
	Mon, 15 Sep 2025 11:30:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv, bpf: Remove duplicated bpf_flush_icache()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175793580727.4119003.4683827020122621439.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 11:30:07 +0000
References: <20250904105119.21861-1-hengqi.chen@gmail.com>
In-Reply-To: <20250904105119.21861-1-hengqi.chen@gmail.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org
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

This patch was applied to bpf/bpf-next.git (master)
by Daniel Borkmann <daniel@iogearbox.net>:

On Thu,  4 Sep 2025 10:51:18 +0000 you wrote:
> The bpf_flush_icache() is done by bpf_arch_text_copy() already.
> Remove the duplicated one in arch_prepare_bpf_trampoline().
> 
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - [bpf-next] riscv, bpf: Remove duplicated bpf_flush_icache()
    https://git.kernel.org/bpf/bpf-next/c/6798668ab195

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
