Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98503E77185
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qV9jaq24JiUlsjIczgkrTPQIjzmwGxZ3oOoatKxqfRo=; b=QzQuchD/W8WRm3
	4NBSQd9W1xtKcTIIExKkCy9i3tzp7Agn/wcEgCfQqK/adYb99ZV98k/vJJgpZqZu2GkLe804lKCcf
	KkypKMBjub8Og2CWYWjSec1JwHoQewTrtvsuaCAWU+xOYvPd6uB7wqpXd3VzH/RbzKy+KhliELB27
	GGC6tzJOxPsc/YkZ7dEHK+AP8a+NyLUPK2ZHJiheAr4rA8R8FsM8lU52WymKBSm7VXl7xYhPHijbE
	7QGRp95rjfnuBOOAzd/DmAUxCyb0ni5EhaW7oaPwcg3SY83lrPS4hjPfmEnTJipU9KVOkC4CQIhPA
	d828GxyLFxul9IHWn5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOa-0000000GWfu-1xij;
	Wed, 11 Dec 2024 23:45:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG4-0000000GKW6-2ptA;
	Wed, 11 Dec 2024 22:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 124F15C67E6;
	Wed, 11 Dec 2024 22:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F3DC4AF0F;
	Wed, 11 Dec 2024 22:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956360;
	bh=jp4Hkfu9jwxRbaUjCfVLhfbjcNqPwXBnLrsEXVYRfdA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b+b5rokYnQRfbPzTwJMTXZQG+EHiJjJGg1+IUOPGp/n0Wvx+ijSowiC9UHhxhBpxy
	 DZ8iD0RuWsgcRECVKgBTOlopvKBqcJoSBIo66KDkddUjm3X9HkKQx8TGNZm5iKacJA
	 T1dT/D4yM2CcTfsmISse0USBHWmqNQ/rn/1skaJcebMKvv1WVqq8kIlNhxylUEubwE
	 chfTOUNXXWA0rRMo2zBnws4AjNRn1PnnYvDHTktKDQJXrqpBgKIVkvcPnLwYXAgRWh
	 Dy0pSrtJy3l3/deM0PTrS7Ca8pgE3JM5+8uZSgt35aKVogl+Ht06F3d7xwIL8ePENC
	 EkbRgOLSfHoyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FE3380A965;
	Wed, 11 Dec 2024 22:32:57 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv changes for 6.13
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637624.1729195.9518811719329670075.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:56 +0000
References: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
In-Reply-To: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 palmer@rivosinc.com, ajones@ventanamicro.com, atishp@atishpatra.org,
 atishp@rivosinc.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143240_760550_020768CB 
X-CRM114-Status: UNSURE (   8.62  )
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

This pull request was applied to riscv/linux.git (fixes)
by Paolo Bonzini <pbonzini@redhat.com>:

On Fri, 8 Nov 2024 17:07:34 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 6.13:
> 1) Accelerate KVM RISC-V when running as a guest
> 2) Perf support to collect KVM guest statistics from host side
> 
> In addition, the pointer masking support (Ssnpm and
> Smnpm) for KVM guest is going through the RISC-V tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv changes for 6.13
    https://git.kernel.org/riscv/c/e3e0f9b7ae28

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
