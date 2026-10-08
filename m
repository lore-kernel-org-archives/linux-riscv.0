Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090EFCA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ShHvCU4vvrA5xnvlF1EXHyoZ5hMjRVxTlCqSpPQOYk=; b=zXiK5uFsunEIT5
	cVLp2QAEdGxnUtfaj1ggFoA7SzwpQDTdo5Aiu+Yv0R8XVTsvmt+T6DZqj/QJ0oLnEV2xfkFqEzsO4
	iShBOjGkj635fbdASFlUUjAOUMYpnl/k4RqV84OJoEC+Tvq0xEHI2C14HlBbhKjlhh5LiLD8c/MXB
	ZQlu2ylmjgwDki9SgTCmw5n41tw6C31bnPDrLRzx1rZL7WSsKemzjpn0i7+AkOpQniI4IBMd5BmJZ
	05VqPV+i0nYqv4S/qFCXbj1eR0+zxoZRHdjwG0jGjRl1t9wCU7OqBCkB+XLEmF6CXigawT6IZoMZa
	SU/QxxDHJ0rYHX3rDl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe3I-00000003POq-3gMq;
	Thu, 08 Oct 2026 02:40:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEe3G-00000003POZ-4Ax2
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 02:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 140536025A;
	Thu,  8 Oct 2026 02:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD021F000FF;
	Thu,  8 Oct 2026 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791427209;
	bh=rnLQl5HBuLdC+SvHobLCtFBqTVBsdq6er1QYiXFNKXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mLKUrhOY18fxZqbh6JBlbsHr58/sUXNWp12gRU9zKD09oXXxGDF18OeC1NfCWhn3F
	 Ue5KWMLnzDBD5tmWTZmvK3UMzB2e/cT08X/5Ya433bu/65+HiZ0tM13FE1EbV0qLUI
	 97V5Rhzwe/03WVFzWNkXEgZlaGDvgQyYXAfrKUJ4dvo17ECEnJFM2W6xn/BBDIRgtU
	 td8QjML9dmG6YKFqs5rQPqDDtdXRnbbk/m0AbXAgF+N/WcdnrP81tKA1sjSujxx6O3
	 dagWpHEzHU3J8XBMpIOjnONa44tsTIzHFKol/JDERAv/0VmPIaByOTF8mdcoQDZd3o
	 VmDXll85JGThQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44A33809A09;
	Thu,  8 Oct 2026 02:40:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: entry: gate shadow call stack reload on
 sstatus.SPP,
 not tp
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179142720833.3779518.9095154686634071421.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 02:40:08 +0000
References: <20261001135711.934152-1-guoziyi114@gmail.com>
In-Reply-To: <20261001135711.934152-1-guoziyi114@gmail.com>
To: Ziyi Guo <guoziyi114@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, samitolvanen@google.com,
 wangruikang@iscas.ac.cn, debug@rivosinc.com, conor.dooley@microchip.com,
 namcao@linutronix.de, zong.li@sifive.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Thu,  1 Oct 2026 13:57:11 +0000 you wrote:
> Under CONFIG_SHADOW_CALL_STACK, handle_exception() reloads the kernel
> shadow call stack pointer (gp) only when the trap came from userspace.
> It made that decision with scs_load_current_if_task_changed, which
> compares the trap-time tp (read back from sscratch into s5) against the
> current tp:
> 
> 	beq	\prev, tp, _skip_scs
> 	scs_load_current
> _skip_scs:
> 
> [...]

Here is the summary with links:
  - riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp
    https://git.kernel.org/riscv/c/4d0697f19297

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
