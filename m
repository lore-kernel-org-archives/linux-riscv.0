Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0F7D711D6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 08:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQ0YtiXr8lG/UQCkvxdXEOppsWimiVXvpvUbUkegoFY=; b=VkaK1cjSY5hspC
	TjE7YoeJaH+Voar3WLneTX8RAtG+2XAMwaFXJLq1WLSuG/1WdSdAhuKC8lo6VGJ9yjUIDdqsTMHda
	edM1J/mXiiZEuyCJSUPvOp+xCDs4qVVkTaNh/d0HwD8+/5E5uR1eptvrc4nkDYzN2oXTtSmEFeQkK
	kiejIJobSbtFjGSAv9uC6GCjEMx+CovaU+U+lnblxgWiVXDWW27IsLOWwHWwSv5nLBDLwRiAidCQo
	pcr8JnEHjvaetDAkpW9e+Sv833FtKYXSaEYW3sz0wsQJzEuMrvA6U0+vWkWicLIISrlaeHhyCG6VE
	hEsujWfPJiGtQlklU4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVcE-00000009pFi-3jmF;
	Fri, 19 Dec 2025 08:13:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVc2-00000009oyc-2sd7
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 08:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61DE3444DA;
	Fri, 19 Dec 2025 08:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C884C16AAE;
	Fri, 19 Dec 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766132002;
	bh=QjqVagZGheGvZNIGCfYq+z1phjrGr+cItnW4fteJZyM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KQbxlVITY7HPF+wlAhLJ9XIn6wWw1uphqVcWw2HZRKSYyveoofeDkIMk3fUG/1vBM
	 LNcLklBCrQll6Uwmx5vF8LmyG83Vz6VoRtANWV+nT50B5haOhFB1NJSynR/PCQ+HW9
	 J5w8eNplIFl2VGDgd4dZ3+x723RUJTa42hgNCCs+/isx/KzRFJpmqxJRRnqvTrQikv
	 HCpyUfF1jD4WTi6xlj/Gcu4VHUKK02bWnJrNicujYAq7MopNMIdA/iLCaepgbGtQmB
	 2w1zzGyKXtIODFI31NvaqMzSqPek2h0f0wFzKb22TSnmsRqCWfSb/vobsXBRw/fdTI
	 QYnOuTqU8HNFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78954380AA50;
	Fri, 19 Dec 2025 08:10:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/riscv-intc: Fix missing .free callback for
 freeing
 local IRQs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176613181132.3684357.15703370442701367735.git-patchwork-notify@kernel.org>
Date: Fri, 19 Dec 2025 08:10:11 +0000
References: <20251114-rv-intc-fix-v1-1-a3edd1c1a868@sifive.com>
In-Reply-To: <20251114-rv-intc-fix-v1-1-a3edd1c1a868@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, tglx@linutronix.de,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001325_344233_61E81F1D 
X-CRM114-Status: UNSURE (   9.10  )
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
by Thomas Gleixner <tglx@linutronix.de>:

On Fri, 14 Nov 2025 15:28:44 +0800 you wrote:
> The irq_domain_free_irqs() helper requires that the irq_domain_ops->free
> callback be implemented. Otherwise, the kernel reports the warning
> message "NULL pointer, cannot free irq" when the user calls
> irq_dispose_mapping() to release the per-HART local IRQs.
> 
> Set the irq_domain_ops->free to irq_domain_free_irqs_top() to free the
> IRQs.
> 
> [...]

Here is the summary with links:
  - irqchip/riscv-intc: Fix missing .free callback for freeing local IRQs
    https://git.kernel.org/riscv/c/14473a1f8859

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
