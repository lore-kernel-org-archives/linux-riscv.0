Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3655C48285
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpfT7mYtPZdHyVCAf8fkvT94eOwpltAeT5Gg3IcMWVg=; b=EcjAUsHDN0qUsE
	vLHyrer6XwqQPyuNJm24yAB4lvWtWM/hZiRqZ+cWLNTbfDse9jRc1+XLN0/b8J6npFkoxWU3XZSXA
	aWnP4qpLoxwVXx6ObrxGF5VQwD1OcYDiOkDFKFoxBXtD4l4sAep6A39XQz8y/iuC8YG/iBxKELAnZ
	ate5rIkREVa8fmQE9XSH8aEn0AXYCWnDVBRLaIQ3u3ef3DQ4s9N7GLugpD015hHjbTHWfEWv0qiZS
	mENUvmpeOgNRHoU43QTGnBITqJMvhHjt+gZwyYVltHp9k1YdGEkwRuwtDjgDQbtvWno9uV7cG0tX7
	Lw/2/p455XAbhIqP2HGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7Iy-000000020Rc-1yHg;
	Thu, 25 Jan 2024 21:30:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT7It-000000020NX-03wB
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC27C62322;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70F08C43601;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706218229;
	bh=X2mNprfouPEmvBoKw8baKQx7oOuTfhqFfvOx4U8Q8wU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XQvcmpdNzt0ETY1MUWWfaBPOe9ZLr+MHgLnmCec4ax5XDwFNheBmLQQiAa7dNpbnR
	 A8ErelEO4mNiAHDgU5lSz3NJKX8mtlEH2i4QNJVcdMoe3wVt+HVdIFrKWXme8krD8V
	 /cRzq0f+AOYf4fUypSykgJYIqQ5vB++Bqnl++GKZjmgBE0d0PaVaQpD3TethO7rX2j
	 z/kmGB5QoXDmC6OY8mbQ2JWWE9urYtmoYh+BPE+h2cB5rW+cu0eep+qilNpEDsOZ7R
	 EUjLFNLBLx/vuLwYRBwNkUxRnix2NHnvLllsEFOloLdESJyuEAvPm6jhLf2BQDHuoB
	 0Yqn2vdq1RIJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5CFCDDC9A06;
	Thu, 25 Jan 2024 21:30:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: Support RANDOMIZE_KSTACK_OFFSET
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170621822937.6239.4360145858676634125.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 21:30:29 +0000
References: <20231109133751.212079-1-songshuaishuai@tinylab.org>
In-Reply-To: <20231109133751.212079-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 guoren@kernel.org, bjorn@rivosinc.com, jszhang@kernel.org,
 conor.dooley@microchip.com, andy.chiu@sifive.com, samitolvanen@google.com,
 coelacanthushex@gmail.com, dlemoal@kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_133031_158271_36B203C3 
X-CRM114-Status: UNSURE (   8.54  )
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

On Thu,  9 Nov 2023 21:37:51 +0800 you wrote:
> Inspired from arm64's implement -- commit 70918779aec9
> ("arm64: entry: Enable random_kstack_offset support")
> 
> Add support of kernel stack offset randomization while handling syscall,
> the offset is defaultly limited by KSTACK_OFFSET_MAX() (i.e. 10 bits).
> 
> In order to avoid trigger stack canaries (due to __builtin_alloca) and
> slowing down the entry path, use __no_stack_protector attribute to
> disable stack protector for do_trap_ecall_u() at the function level.
> 
> [...]

Here is the summary with links:
  - [V2] riscv: Support RANDOMIZE_KSTACK_OFFSET
    https://git.kernel.org/riscv/c/05d450aabd73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
