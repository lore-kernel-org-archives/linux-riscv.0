Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D32C52D76
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phGTw9VybTX+nR6iRp8cbC8/ZVFu5TnFWMYHZLJo738=; b=GCsbBeo02ai6IH
	/ImFPj65NwqbaVWIQ1tj2EXr+ygsvVCcBvI1oYOE/anWb6oOrf0zaFybCVf7fAWB0nUfDSxz1916Q
	Z2W0R4hBpB3GUCEKunJ59Aplhobn4jG8LNkVsvLsjlmK8Xadm/zzVBJsSmiw8YAnWSUQk283gCswF
	C8HXRB5WVdFlU/oP2xPDNsa4W6C/DtY4OvIOEK/o4Rpy6syf2862oaZibmtWvkRC33f9WXNV2DfYv
	1RGNAdZeySiiR8trLSXu4j4J3/n9oj2jbvFXDYhfZrqwX90985TgPEYVwQ5hk2tf0XbKHHDb5IhsC
	eND2afVlntiqgMHFjTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQnz-00000002oNq-0psd;
	Tue, 06 Aug 2024 20:29:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQne-00000002oC4-20Ob
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 20:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51EF461093;
	Tue,  6 Aug 2024 20:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0436FC4AF0F;
	Tue,  6 Aug 2024 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976133;
	bh=eRU6lTfWk+3oWmmHeJiEsOh57khrS6jc6a+WsnE6j+k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qAvUPekLTTIn7fP1Kyzy5xefgZ16MXnoQWO8hQ7C5wjaQsrs2MuMFdtNsMLtWDyX+
	 fw7leww2LaDgvRO/ApHURhKUVIIBOIB+vcV4E/MQV/u0fW0Xyjp7sEdIeabRifXKCu
	 qu4DsGtFPuNYb5wYfy5EIpHNt2a+2/pzJGYrzTzsePd8vYjM9F5+SWK8t3sl4XhFRl
	 O2kKx4SAHtn7KY/96YOBfONoNOx35NXHvLrGrXGQUyA4UAgyWZdDesClbrclmUbY5W
	 xWKjFyJJjdPvcNkJZ4Mn+S8/1S/JktZN90a14kpL6bPpvBxEMPHOpju2odYbIUjpks
	 4RLUImDpnYv+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F3DC63824F34;
	Tue,  6 Aug 2024 20:28:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes v2] riscv: Re-introduce global icache flush in
 patch_text_XXX()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172297613179.1692635.6654179302710248006.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:28:51 +0000
References: <20240801191404.55181-1-alexghiti@rivosinc.com>
In-Reply-To: <20240801191404.55181-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 linux-kernel@vger.kernel.org, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_132854_625851_0D87E356 
X-CRM114-Status: UNSURE (   7.13  )
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

On Thu,  1 Aug 2024 21:14:04 +0200 you wrote:
> commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") mistakenly removed the global icache
> flush in patch_text_nosync() and patch_text_set_nosync() functions, so
> reintroduce them.
> 
> Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
> Reported-by: Samuel Holland <samuel.holland@sifive.com>
> Closes: https://lore.kernel.org/linux-riscv/a28ddc26-d77a-470a-a33f-88144f717e86@sifive.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [...]

Here is the summary with links:
  - [-fixes,v2] riscv: Re-introduce global icache flush in patch_text_XXX()
    https://git.kernel.org/riscv/c/ee9a68394b4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
