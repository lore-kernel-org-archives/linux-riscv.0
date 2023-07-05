Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B740CC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 23:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHudHTpz7zQcvrvv0NPIhQnVIf/06x9DNlu9HYXJFf4=; b=4hitCi9VS21Jui
	cb3fe1sX6WqdhfQSvr0NcYTE1vkLDxR7O8Bb7xe9SlbqFx5PwIk93AIDDD3by+bK6cbf46MG2tEvL
	0JGc4OEpzjUOm23mrS8zcMlv2lsEwuVI8g5nEd9/699JoJmp9hqNm7aktW0iWzCSU8mqotDdhkUgx
	4fCJJ/ZPT60lKNFZmKnGGs+DHB2KhXjXMvYcaBdjswvOCbfAHXSuVQBpOpke2mUjS09sLL4shXxtD
	tsCNwSTth8HZGZplLKoEVB+UGPT++32dYzKWKCPSFeCjw8tnoXqCjcWnYI1sYOOCMR5VjzLsejnm3
	k0RYcfnyaKdyypM63mCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGU-00HONE-0k;
	Wed, 05 Jul 2023 23:50:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCGP-00HOJR-1G
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 23:50:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C0F6061806;
	Wed,  5 Jul 2023 23:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B510CC433CC;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688601022;
	bh=Ah3lQNuxgEI/+6I6THkMkjuLyHcRDEhQyBKN4DzGjqo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gUi9b5k+zbhb1Umv3vD9Mc9vCSo0XNUW58JRx5q1+f0QpILfd7fNXwa09SNtDTd9s
	 IhohLElN/xTgTiUuOlK2YAasYZu/meNygT87DNIm7omYfcfXmZiwZRRYQ35jGdl16f
	 L61AA+nJDmtSnoIgUuWpq+pihVhNu2tBewb+C+aCJuV4ggpvoi4JRmRMsS1TseFSyX
	 jWtlZaxoFKyYEEAZuZ9o3WfGKuuciU5OL8aTMg6rG5jd145goZKaQLPg2QjDIVgZKn
	 AtfixPbbNfr6lpnipUv076akjV6lgafDjsz3pLSnaScJy1DhWuLk0VLVqzPPdOGyBQ
	 N4nWQRK93n39g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93865C691EF;
	Wed,  5 Jul 2023 23:50:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: drop error print from riscv_hartid_to_cpuid()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <168860102260.23922.11676934686637204520.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 23:50:22 +0000
References: <20230629-paternity-grafted-b901b76d04a0@wendy>
In-Reply-To: <20230629-paternity-grafted-b901b76d04a0@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, conor@kernel.org,
 paul.walmsley@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_165025_482572_9BF28E4A 
X-CRM114-Status: GOOD (  10.10  )
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

On Thu, 29 Jun 2023 12:33:34 +0100 you wrote:
> As of commit 2ac874343749 ("RISC-V: split early & late of_node to
> hartid mapping") my CI complains about newly added pr_err() messages
> during boot, for example:
> [    0.000000] Couldn't find cpu id for hartid [0]
> [    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller
> 
> Before the split, riscv_of_processor_hartid() contained a check for
> whether the cpu was "available", before calling riscv_hartid_to_cpuid(),
> but after the split riscv_of_processor_hartid() can be called for cpus
> that are disabled.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: drop error print from riscv_hartid_to_cpuid()
    https://git.kernel.org/riscv/c/52909f176802

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
