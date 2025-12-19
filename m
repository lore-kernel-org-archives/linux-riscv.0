Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D5BD74966
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuQWIE1GCm0GLfLVxZt3L+40pGwli+8qy6HmYfTYi7A=; b=tgVQdo6YNMc3L0
	1dhQFZ1ScZl+2XfE1IB/erph0Z13WLl/Bc3a+3sFbErTJgsZjeFa6sxfsEUrqtFss/0bodStV0FAR
	M5L5mktl2JIpnsBi6LVSIfVGVegSIz7ZwI/oQjMtcr7UpHrkL22QhgcDfBF/eyzD1x9g9WkR1em7s
	OPg24Fde7kgF2bNnCpyPuk3TxHiwDFmGnYt0PserjA9/S4Xd6LybUeLDKRIqF8wA088CAMqVf8ajH
	Gafssce6gPoCSyezQiBy1ePivtQquiMleiizBEB1qBGofyBE0v9TB+JpzsEJ5ZEFsbgjfIt5dBbgn
	Bk/hyV+m8arF3V/WfjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc6-00000009p10-098U;
	Fri, 19 Dec 2025 08:13:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVbw-00000009osC-1t3l
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C37F66001D;
	Fri, 19 Dec 2025 08:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7977CC4CEF1;
	Fri, 19 Dec 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766131995;
	bh=U5TfeA3yjn9BSqQ7F9UYR0lZfnuNH+kOmFuHNqkEFro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pHM1EhSiqpgkXLqI+/HzdlYx+SdqNhjl/UIVIGqAtn+BZjbR1j0+VNbIeSarHixTq
	 B8YSVgg6qHYJD/s5cl4h0oYZrR41yH2q0iH9vGNfDPJ+ASSPsPwGwIgyqOMQDiDpMg
	 8M2dRBrYe9vZGkxAkd4fFxal+eVrDgZuyAo4SGAudots/Z3E+hw5AHs3wM/vDvKQ00
	 cnwqOA311m4x5Eqmc2wHuzAbXbIzn+wb/NhZhNzs5ijkmOVjZO6oJRvvhLzB7SVgVA
	 ihkqgriYAenFFIY6vutcq+P7pGHRypY1smRLNhWONwBWyKmFmd0ggNu/awwqnu9NrK
	 f8W4lZaW22iUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5B0E380AA50;
	Fri, 19 Dec 2025 08:10:05 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/sifive-plic: fix call to __plic_toggle in M-Mode
 code
 path
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613180427.3684357.14207836014506509623.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:04 +0000
References: <20251103161813.2437427-1-cmirabil@redhat.com>
In-Reply-To: <20251103161813.2437427-1-cmirabil@redhat.com>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 lzampier@redhat.com, samuel.holland@sifive.com, pjw@kernel.org,
 tglx@linutronix.de, lkp@intel.com
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
by Thomas Gleixner <tglx@linutronix.de>:

On Mon,  3 Nov 2025 11:18:13 -0500 you wrote:
> The code path for M-Mode linux that disables interrupts for other contexts
> was missed when refactoring __plic_toggle.
> 
> Since the new version caches updates to the state for the primary context,
> its use in this codepath is no longer desireable even if it could be made
> correct.
> 
> [...]

Here is the summary with links:
  - irqchip/sifive-plic: fix call to __plic_toggle in M-Mode code path
    https://git.kernel.org/riscv/c/a045359e7245

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
