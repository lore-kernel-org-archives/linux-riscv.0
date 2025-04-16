Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40896C369C7
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JB/9FBdFUqe0AJUgPSpqiz1v9Tf+BSlaOQ0sgwAkiV4=; b=2xfgyuG7SpDYcx
	hs9SPbBNU6AhgGkImc20hZqEkE1EiNnKOqJcYXGdFe9wauOLIV++ZD/LT6JyChG6aOlD8Cviyh9Hm
	UW0wSsiIzCU6mp1M39UN+BN8GMOtuPgwrbXINjxZ3CM/rdW977vi+NqpoyFMsWUpFwMagP/DRdc8M
	Z07SHZXLx1FDOdMEGL7N4oX0SJCPR9YYXfAcu72LjJiF0nLmfw7Ld4FfNi4zfD/RVxjpTUXN/lYlh
	UznsnBS29LkWGWaa6cFLBHM/9IA6w46U/hd0VSdFP+eMGh6fZ7VpAlXnF9IpJ6xzH/7ikocQ/IUiB
	nWd3SSzFEELtW3mu8l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57iT-0000000Ab0Z-3Do4;
	Wed, 16 Apr 2025 18:42:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57hr-0000000AaqU-10hL
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 18:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 423E4A49CB3;
	Wed, 16 Apr 2025 18:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C335C4CEE4;
	Wed, 16 Apr 2025 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744828914;
	bh=KjNmswcxf38A5M9atBcosAwVob6w/vmfpdVCx1CNLhA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CEzkulatPzCTh53O7EgEnmFXf4HqRWwoiJ+OJyuVRfpftSRrNml7Bi7Ta8DDXebTK
	 hK0O7OPQ3hjTYNE3Fzi81/bBOExqVpqALaDCShDWDSmBr/Cy3rHfsj8yRO1rRWj5Q0
	 qY9FIQ3kDO7OrelD29lEG5xoywwsa1FXqy1Alda2crSRC1PJHJifGQiAQ2Ywc9HlV6
	 N02J/NnpgwXszPK8bCsQxxF+5rAO5RbbFIzYsCJgZLt/QqnKSszyCaCUmbsBpbAf66
	 blJ0vvFK9PMvs/JhDm56YZkbdcevmWna+xX3dEQpPxh/vjztUuSJ/Z47a7i/rFxV57
	 qzwvr+0UOF4Qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D393822D59;
	Wed, 16 Apr 2025 18:42:33 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/2] riscv: Rework the arch_kgdb_breakpoint()
 implementation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174482895224.3460781.16808742382382868644.git-patchwork-notify@kernel.org>
Date: Wed, 16 Apr 2025 18:42:32 +0000
References: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
In-Reply-To: <D5A83DF3A06E1DF9+20250411072905.55134-1-wangyuli@uniontech.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 chenhuacai@kernel.org, linux-kernel@vger.kernel.org, vincent.chen@sifive.com,
 palmerdabbelt@google.com, samuel.holland@sifive.com, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_114155_341411_EED47A73 
X-CRM114-Status: UNSURE (   7.17  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 11 Apr 2025 15:29:04 +0800 you wrote:
> 1. The arch_kgdb_breakpoint() function defines the kgdb_compiled_break
>    symbol using inline assembly.
> 
>    There's a potential issue where the compiler might inline
>    arch_kgdb_breakpoint(), which would then define the kgdb_compiled_break
>    symbol multiple times, leading to fail to link vmlinux.o.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] riscv: KGDB: Do not inline arch_kgdb_breakpoint()
    https://git.kernel.org/riscv/c/3af4bec9c1db
  - [v4,2/2] riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break
    https://git.kernel.org/riscv/c/550c2aa787d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
