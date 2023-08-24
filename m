Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5FDC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+2Y0uDDH0l7oZe9gzr5Y1nxGa1QFhC8C2woRggJu2c=; b=CKzOmlfWhg13Hv
	v4oBzevxt0yVq2lwC0QzOMt270RwsASgn2RAEuS6QJc99KtKhomCBl+Y+9g8VWuWFQNfEbToxZwK8
	lW//SteaCo2haj+2FymNrHSHOQGGgPeHV9JVnFlmfWWtL7/ldOMM28FxTvBxg0riTeHqP0Uww7lzQ
	qizEJPWA6gWNFPpJ/K9nuOMT91NgT+xF3q6YXhZk//PYceqxE/35rRnMREPSgE9ouazvqj2XQqDO7
	+rBy5YKr2VBm3U/1HZ3eK53cy6McCjJYhtsXsCM0UAtv01hRouv1IOS9/KFsjVhwPsA3k+jbyPKxz
	NwpMv3RAGuQxnSKF3zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGey-003inb-07;
	Thu, 24 Aug 2023 20:10:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZGev-003imr-1W
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 20:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6D3865237;
	Thu, 24 Aug 2023 20:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48A83C433C7;
	Thu, 24 Aug 2023 20:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692907822;
	bh=qT/JbWrkOTT0b8z8DYIP7cA63D810/8ETsf+/hqaq8U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NHcNTdq+6kQqgQNG4+6nbr5bvmyMDnA7WSPRQvFgkRvocYz/gItS5JW6OZKmNXu3K
	 Mf+kB+Do3xeLqoTGrxmBj1dcsh5mflX/rDOt0z/HH5zAHy0VTM0h6VU7+kDcldEKVN
	 +bN0jqnxouPsKqLPFZHzV/ZX5UhCE95HgCk9ONTJTNPd0Q2uWZjJSPj931jozNTNi1
	 JOCWZXZm/2Rl7Q9C66GAVAsr4ouKDuWhjyZnRhM/aPDcSYJEEE6oftOw6r72exSKan
	 QhcnOr8yAmKs7qmf3/TjTVSZpX2jXWHj17TreeGyeQvpmEeFEuu5VLhFdaKtXFt/D6
	 X/u2erUCkzHdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29A74E33093;
	Thu, 24 Aug 2023 20:10:22 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fix build errors using binutils2.37 toolchains
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169290782216.11381.9335896608253523695.git-patchwork-notify@kernel.org>
Date: Thu, 24 Aug 2023 20:10:22 +0000
References: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
In-Reply-To: <20230824190852.45470-1-xingmingzheng@iscas.ac.cn>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
 bmeng@tinylab.org, guoren@kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_131025_560762_AFD85354 
X-CRM114-Status: UNSURE (   8.63  )
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

On Fri, 25 Aug 2023 03:08:52 +0800 you wrote:
> When building the kernel with binutils 2.37 and GCC-11.1.0/GCC-11.2.0,
> the following error occurs:
> 
>   Assembler messages:
>   Error: cannot find default versions of the ISA extension `zicsr'
>   Error: cannot find default versions of the ISA extension `zifencei'
> 
> [...]

Here is the summary with links:
  - riscv: Fix build errors using binutils2.37 toolchains
    https://git.kernel.org/riscv/c/ef21fa7c198e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
