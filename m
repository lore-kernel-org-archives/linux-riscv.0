Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375A0C83F01
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ti2sZYG7jlEaMT0NqA30cUpVOC2ma0dI74nnETH6jds=; b=jILl77x05jtbHM
	gdUVZc5dXhB8Y42RATXuzwDBVdf5h6Ati+f/yycT2+E1F7pKFCcbG2Iom7mRwhAyat/YFVrYHJniy
	Am6n28U5esjEjtgwLQh3BBAyf3jzYXOCtFBvp+pgCFtzhUd+rJKPUtKjnaLjmNqnfg0UlPWBMtbkP
	65P2mT7G0XJvQxC7F7FuDGI2T3K8o4EYba/gpztJ+9++F00ccyjlkUlEbuyEtTZw7Ul+3kB8f2EZZ
	Z9WozcwtSb5rzEvjk/4B8rYQU19fFHdBxDa6ccFq6Yj/xdNLNiN9qhics3KrkAnV7DxssG4CrtzQi
	FSP4quocZ/l5n9e63vkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpi-00E8dC-1K;
	Wed, 30 Aug 2023 20:30:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRpf-00E8bg-15
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 20:30:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BE490B81EC6;
	Wed, 30 Aug 2023 20:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F09FC433C9;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693427428;
	bh=stBljQu60zlfuTB/Yda/v0XXToB/A16T9sI3oUQZyOQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g9IOPbN5qvXJioKBymDigcIBQrkvcqMp0y/6N6JclxLJ7V2G6UoImAVZj00XT4U92
	 cDdjI77xm5hLlxSMcsJ5AY33AUJVSVTKkVMbuBAH4MWX7LYZpWkXlywSweQUOjkXwZ
	 v4+clI0yoM9vo0hZtjUrDl5KjVjIZO6oH66POcD1WPJFPfgyX2Acuqduf2IwHjPUIE
	 fDYwqLhco2jvEDQRrIZdVCeHTUHhaZ9E9fREgMJXoMKbTxAOclWYxu7vEXZ6ff1as3
	 x+Sek1AlXcl2sZ3lt/Q+WfGm2dTzMkA9gCpo/+J12KqK0lJhc0xTU75+CODhVAq2pW
	 1UyNb8+PW8XMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 619AEE29F39;
	Wed, 30 Aug 2023 20:30:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169342742839.1913.17678279816730876679.git-patchwork-notify@kernel.org>
Date: Wed, 30 Aug 2023 20:30:28 +0000
References: <20230825050248.32681-1-andy.chiu@sifive.com>
In-Reply-To: <20230825050248.32681-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, oleg@redhat.com,
 ebiederm@xmission.com, keescook@chromium.org, vincent.chen@sifive.com,
 heiko@sntech.de, conor.dooley@microchip.com, bgray@linux.ibm.com,
 zhangqing@loongson.cn, baruch@tkos.co.il, eb@emlix.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_133031_516702_64B20CA9 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, 25 Aug 2023 05:02:46 +0000 you wrote:
> This patch add back the ptrace support with the following fix:
>  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
>    conflicting with gdb's NT_RISCV_CSR.
>  - Use struct __riscv_v_regset_state to handle ptrace requests
> 
> Since gdb does not directly include the note description header in
> Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> conflicts.
> 
> [...]

Here is the summary with links:
  - [v2] RISC-V: Add ptrace support for vectors
    https://git.kernel.org/riscv/c/dbe46b094026

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
