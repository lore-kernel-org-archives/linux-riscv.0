Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D262C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8xiUYu3Z1/4mVL0bZeG411Cd3Cvw1LvMlB5zP+DyT4=; b=yTSr6cxwkB4r1T
	YrpV/aBnb4SNga3UXTp4CvNxCn5aH001cUB0nCtZXUGEfhVpGa+Hy1EFD2+q3N/NzTZHLa3o2/cnP
	JlJDaHPStzQ1ekD1qr5Mt/ygf92KfDHnjFaVWcxkXwoEvOpJyca5MMqDyc6fugDH+dvdO4WBHM34x
	nTBlV6jd6r0VsuJK6PANuQjYOMR7hw6PKMomfHuEv5BjhxMtOCOYkkSOyDXfdjLGhAkggFc1OsnGf
	MijgwBQ6s2JoiYq0MXMJYoD8EVazTpazSdbK0Oj6fqVQiID4tdkAISsk93ifyYJIAhlPO3DaWGvf1
	l67gRpKG8ZxOrRtNB+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbP-008OOe-2D;
	Sat, 20 Jan 2024 21:10:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbI-008OFM-0l
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F29460C36;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D862C433C7;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784999;
	bh=d2EDRJscbCIR87e+6SnLlBw0VYMjOFKxJr55Hwex2FA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aC23AqXs7VHpIWiNRcIP8h2e8I6bW9BN91dlVCjUKu+I8jXrGM1pOxKU30hOLCwnF
	 JJDgvcX9l6fbSuH+iGk4kTOuSSDCiLasqckZrqXIORTywo65heqUCbF/H8qT/9QW6z
	 IMPYzJ4q/NfxWYn6OYmITbb5ZsyDpCBXIQ1wrTTkbkM6sQgiAiZ/nGQGhU67RknzTm
	 N0WhsAF4BGF02s7zEEAwDxanV3Ac6ynKYapWOQAe0JQ5eSMDvSeoGRvCHDn5EbbgYE
	 5aYLv7PBoplGmFrEMamBoY0nL1te4lK6Hq4fLF+6ociv1IMr8JZnUtBVxCIJHxXIcl
	 xasxyDiQmSfyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4BCD1D8C978;
	Sat, 20 Jan 2024 21:09:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin),
 and vmlinuz.efi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499930.24348.3965347675241435191.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:59 +0000
References: <20231119100024.2370992-1-masahiroy@kernel.org>
In-Reply-To: <20231119100024.2370992-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, ardb@kernel.org, sjg@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131000_366208_5971645D 
X-CRM114-Status: UNSURE (   7.67  )
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

On Sun, 19 Nov 2023 19:00:24 +0900 you wrote:
> A common issue in Makefile is a race in parallel building.
> 
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
> 
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: add dependency among Image(.gz), loader(.bin), and vmlinuz.efi
    https://git.kernel.org/riscv/c/c4db7ff7a9ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
