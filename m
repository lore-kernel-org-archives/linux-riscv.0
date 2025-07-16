Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5872DC83F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 20:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CD0KBX/544t5X/fJKLXWApB9kkqce+bEbZYbgjpLxA=; b=3Atgf060EOCx0V
	Qk4EUZozYz+mUg5P3uDZqIpSWnA+dQwjQ1P2Ogr/ZTw/s0NElzhOuIpXt8nU0zMhZkvmfX9yKZxhz
	6AzbFWCIHYTvYmQNYEprUlCeIWgwX50xTHzy8tzkaPscs33Bmqy0ED7M9tnYUOdpU5Q//cVZ9mPVr
	a006yIY/nEgTWShsslUDomgATcBBdd0aqiodwa5JlMjHTG0fIMZ7QCa/KtGxCntJ8U/kagQ/VX/ei
	MuPXZ1vvTN4gp27sm6WvZQJ8wr25VU/uZzDRKUbiBqcR8KrIUE7UwV03F/Mmjo70mNwEdYOhcsCao
	pJLAdayNffF6aT20bYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Dg-00000008eXz-1K5C;
	Wed, 16 Jul 2025 20:59:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8IE-00000008YzG-1ogn
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 19:59:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89088601BB;
	Wed, 16 Jul 2025 19:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3721EC4CEF1;
	Wed, 16 Jul 2025 19:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752695993;
	bh=hwxeQlSgWBk/HzsQpu7mYAmz8iQL+ewlR3LRieKbN80=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GbYjf43xDQrbApZlHFR5ZpIautdFQd8qySqHmXn8TXJu/pT+AYty6hWwhUX4Y7QqJ
	 xyVnaPB5jeYsfZgU920bZ0L+yEb32IxOfhwYRy5+swZ95aAZDy6Zt3IHd4YXHWBFlY
	 xUUatpuG53qoyCdWVR7fRC4Wf3y/IZIVPAApPeMu8gOJUCuiS9sFJXBP9KKQWrp+wY
	 1SiDUPZrNzi6XAtBer8virong1WPDoFWCoKrWYjx0BsUTfSfw31voVwdD/SQ0q/YDL
	 68MtKr1/xuPBOXDJRh4eubCi4s6/5zYY0Cnci7ePqRGnJ9psxfmt7Y3VPKCsHfYbuO
	 bzpZBRVWAd10Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE3F383BA3A;
	Wed, 16 Jul 2025 20:00:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Stop supporting static ftrace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175269601325.1308944.797202062677315473.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 20:00:13 +0000
References: <20250716-dev-alex-static_ftrace-v1-1-ba5d2b6fc9c0@rivosinc.com>
In-Reply-To: <20250716-dev-alex-static_ftrace-v1-1-ba5d2b6fc9c0@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, rostedt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, andybnac@gmail.com, bjorn@rivosinc.com,
 linux-kernel@vger.kernel.org, chenmiao.ku@gmail.com, lkp@intel.com
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
by Palmer Dabbelt <palmer@dabbelt.com>:

On Wed, 16 Jul 2025 12:05:16 +0000 you wrote:
> Now that DYNAMIC_FTRACE was introduced, there is no need to support
> static ftrace as it is way less performant. This simplifies the code and
> prevents build failures as reported by kernel test robot when
> !DYNAMIC_FTRACE.
> 
> Also make sure that FUNCTION_TRACER can only be selected if
> DYNAMIC_FTRACE is supported (we have a dependency on the toolchain).
> 
> [...]

Here is the summary with links:
  - riscv: Stop supporting static ftrace
    https://git.kernel.org/riscv/c/5874ca4c6280

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
