Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899ADC25B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTa9ZusiN9+IpfWBIoWNum+I0zvc1qGF5Zrso62U/wY=; b=HukiA4t0mDTLfp
	oRj1wuHWFQAm0Kf+xuDxST8L+lDp/d8yTszVsfcXljOU3FJ2nSViN7t7Usk5XMxKySY0nigdgH3u2
	FVuxn7vfg3LIWMPtU5yhkUHypihOkSMu1Qy2TW+onCXlA635dQy4kIZsZh1yASo8kf4bIpaA5mFEH
	ZY8kB8/N0I/f3+W2zRnsMMIXEgrHm99PL+/PFZ5nj9rDpXnWD5OhNwcLbz7Tx4dY63vnvCKI5JuEz
	T5z+BwvlygN4rZdJFoVD455iqZPmQZsd2XL3CZZDueA21hlQaPcHn3VRPRxVOOaRTeSb1rd011rJ+
	WY2O7onpwiXj54PdL9QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vke-00000004VYv-16Fz;
	Wed, 22 May 2024 23:52:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vkN-00000004VOX-10fi
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 23:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB18A62C05;
	Wed, 22 May 2024 23:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7C3EC4AF12;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716421907;
	bh=gqLUb9QwFmSI9zsPRr9h3j96reicOIQtoFbQZ+xpT4c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kY3CpmniW4Xo04BbXZBNVtdDiX3zJFaVbuN7sRGtSwXGiPwZ/iO0HAQ+wqA307T2M
	 sf8ing+ScWnGv/es/7MrZWsgs7DOPB8gOEFRzVW60YtPXR60VdNg8zYV+K9nOzCSer
	 atj6e+cp87MEQP8vbJDBleLys/l0ItejflIL2t4R7NfcR/pOLZSDnlZcYbUpulHWTM
	 faLgH3UnsWWbS/eyh0vGTpgFrv7CrmaXNXlh8KRQQlKJWOdbKc+eV01S2BnOQWgmZl
	 q8iVdBpj7cLrOq3JT2X9R0g3RHE0A8BfzH5NZE0Yp3wb/24SPZIBGK873LwcVotaGK
	 P3KNTxnPeYEHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DCE91C43638;
	Wed, 22 May 2024 23:51:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Use bool value in set_cpu_online()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642190790.9409.1797871952115228181.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:51:47 +0000
References: <20240318065404.123668-1-ke.zhao@shingroup.cn>
In-Reply-To: <20240318065404.123668-1-ke.zhao@shingroup.cn>
To: Zhao Ke <ke.zhao@shingroup.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, dawei.li@shingroup.cn,
 shenghui.qu@shingroup.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_165151_491314_B3F169A8 
X-CRM114-Status: UNSURE (   9.40  )
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

On Mon, 18 Mar 2024 14:54:04 +0800 you wrote:
> The declaration of set_cpu_online() takes a bool value. So replace
> int here to make it consistent with the declaration.
> 
> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
> ---
>  arch/riscv/kernel/smpboot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - Use bool value in set_cpu_online()
    https://git.kernel.org/riscv/c/07f23286451d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
