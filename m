Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D028C3DA7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6a5TAObsn94rp05ibDKrJZ/Nn073CUjfgkj5i3a63uA=; b=QNyAdlzAyXvJB4
	5c1IdU2bCEjrpf1MtGZmmxKSGQqnO577BzXgKbxPVoj2VkMAGMD2v8MPWVHQcRFbe1oIJzlfdzdfq
	PYTXhe298jfz3GETP3mn7gNfhFIMqG1nS1TYYQyYG9wuqtZZL7z6MC4Au+Bp8wLaO71TFvlKJ4BiR
	xz2IZYx46fM0uus/uiefVoAajSuWQrly9FRJLBPAxqXYjzP0BBWrTiGijEPOFlaqTSIjsoDI7iNsQ
	iYjVmFL0jpcpR/lDUcmRFhSCatvTCULkOYItSwk/ECt2UfQXbZ6aFO5bAodwNDJUI0LraFf8O1zO3
	f0MSbX6TEP34c5/orWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOm-000000012oY-0Rpw;
	Thu, 25 Jul 2024 13:20:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyOf-000000012io-12Lo
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 13:20:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E975E6135B;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65B0FC4AF0B;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721913639;
	bh=+MlYyIuitgeiygKFo7/UYoHi1EF6YVBX3jSOd6GjwYc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oY9sJyJ7O7kRwfcrK726mdmcOgkTQLZWs2uP/x6CY6ycSd61tGCxrSNCpBFNPck3r
	 FgOaIr9kf2pNPtSEbN12Sd7h8pup4pzRGy33Mh+WWlF95D5VjaWJkxqh8dbkxKXUkI
	 mGI/xpqJaBvyu8/0ACMnHEc9XSLnd6bNY9csCfJcTGmbPL8gS0+mkNVP3W+5KC5Cll
	 JODgEUoEN2qzoG7KjEqmKbjfw7kAMXGrLm7ND0VAHk/4ukmpAIYNUVkRI0SRLnCgXe
	 jdICAuXs46yvp5CaVuf7o5ROg5iXVvrB4s0vkp829KNHXfTYYbtZKmORZG6S7xxfVC
	 kd6nNyZGV8myw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5B13EC4332C;
	Thu, 25 Jul 2024 13:20:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: enable HAVE_ARCH_STACKLEAK
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172191363937.6240.7475127253705380898.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jul 2024 13:20:39 +0000
References: <20240623235316.2010-1-jszhang@kernel.org>
In-Reply-To: <20240623235316.2010-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ardb@kernel.org,
 charlie@rivosinc.com, linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_062041_537989_3DC2BB18 
X-CRM114-Status: UNSURE (   9.69  )
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

On Mon, 24 Jun 2024 07:53:16 +0800 you wrote:
> Add support for the stackleak feature. Whenever the kernel returns to user
> space the kernel stack is filled with a poison value.
> 
> At the same time, disables the plugin in EFI stub code because EFI stub
> is out of scope for the protection.
> 
> Tested on qemu and milkv duo:
> / # echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT
> [   38.675575] lkdtm: Performing direct entry STACKLEAK_ERASING
> [   38.678448] lkdtm: stackleak stack usage:
> [   38.678448]   high offset: 288 bytes
> [   38.678448]   current:     496 bytes
> [   38.678448]   lowest:      1328 bytes
> [   38.678448]   tracked:     1328 bytes
> [   38.678448]   untracked:   448 bytes
> [   38.678448]   poisoned:    14312 bytes
> [   38.678448]   low offset:  8 bytes
> [   38.689887] lkdtm: OK: the rest of the thread stack is properly erased
> 
> [...]

Here is the summary with links:
  - [v2] riscv: enable HAVE_ARCH_STACKLEAK
    https://git.kernel.org/riscv/c/0059748ce289

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
