Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9D8C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/MTzu75Ckd7icHwU/pQG4RKtDGa7GfQ0dIQyv48QBo=; b=jAs62kDT3+hIGQ
	aYOCC826BpocBEfsXbRHG/wdnmOSl25RE93rhsRdDx/+kZ3buIg/auAYHvn74s7JBovfYQPTAxVYh
	kvFPWJ3lbf/7cfOG5eTtCDc2gHlqgtRQiTYqbpUyxXRWJvhkJ63VyyI4PxqmCVgXk0Q8Kwwsm8JXM
	h35IkVjWzyfGg4hN6asB+LQCICPi5B9KrvgbndAo9AMpvcUwJTHaU/QrmWX328kmiZ0sdQVOoc+9E
	DxsgiipdsiXSmQWMGLPerpxTVx78Z3dNPLFNaDfzVL1OgT/C88VtTKEdUo8Px08lRanMr2GzJSrmA
	RARm6b+1fSDwvtcXsZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtH0-0000000BIPs-3nkl;
	Thu, 27 Jun 2024 17:51:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMtGt-0000000BIJi-1QAQ
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1715A61F65;
	Thu, 27 Jun 2024 17:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD36EC4AF14;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510656;
	bh=aEmY+usoEI0JCLbYcZGViK6r8rPMlyAeGBCWtdOs+Ig=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EGnPyufgOJ4Y9Rs8F7kwwOdwhS+bQgguOfKrrJIZBbTa5uxnvZqznlBjrRpBCGBnV
	 k5XP/3S35nI0Wu8/9U7JxPdgtTuf1vlM5OVvb5X/1u5ieZcOkP2Bz3LCE7q8wIDgdu
	 YIZ5YJobggGuX84AsT/quvLa85blZ6oTzHmrltROmVr5jgyAJgamuJ5/2uT2dhfDFj
	 Wb7KI9XgzhzRK0XLS9BngyYu3ww6sJM5iZFMqs8goXWI7Q92l2djZDm7UepQUnsJAq
	 QmYWEBGfnUkv6ywkj7Ym5Nj7k4Gjb7Mzez0LwhNI3t0x/P60l9ybF4C7n0OAdpB/OM
	 wdzAryF8DZTUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B415AC43443;
	Thu, 27 Jun 2024 17:50:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [RESEND v4 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171951065673.6762.2519132722674117186.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 17:50:56 +0000
References: <20240615021507.122035-1-kanakshilledar@gmail.com>
In-Reply-To: <20240615021507.122035-1-kanakshilledar@gmail.com>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, kanakshilledar111@protonmail.com,
 tglx@linutronix.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, samuel.holland@sifive.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_105059_688283_B992D415 
X-CRM114-Status: UNSURE (   8.20  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 15 Jun 2024 07:45:02 +0530 you wrote:
> This series of patches converts the RISC-V CPU interrupt controller to
> the newer dt-schema binding.
> 
> Patch 1:
> This patch is currently at v4 as it has been previously rolled out.
> Contains the bindings for the interrupt controller.
> 
> [...]

Here is the summary with links:
  - [RESEND,v4,1/2] dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
    https://git.kernel.org/riscv/c/9ff141042a62
  - [RESEND,v4,2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
    https://git.kernel.org/riscv/c/1f6e218859f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
