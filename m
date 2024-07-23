Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5225FC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIxz2AuXp1+Oa09Ir1HYZncnDVHZzAdRB6kJGcwi16w=; b=1jNA7v8X4dK8C1
	FMi8ZgfBLkcmDLBmicbI/gzhuCqfkhBqoBDb3rHmlmD8pZTfSwyZjDgBI2+w/3v77JhWKz0OxNwod
	Z1DPPc3/0ZQi2wBl4PBqA59fHHO9yN2TiZB5wa3xyUAlzG10u+zDJqpwDnK028bnGiGaYRuW3auZH
	dkE05MxAir6dnhSGyYj2LiPjGuqxIxmNQpkojQDyQLQWfqYmQhizCu7wBB1Dauhrol3RbfM1Q1dUY
	OIbRGQiIRb8Z03PNxSyOMi+daBQpphDpTm883wV+0B138j2JB+kMQXgUFH5Oks8xAYsBdevevgg54
	GfguZb8r/RPupdhFfLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF72-0000000CRdl-3TAE;
	Tue, 23 Jul 2024 12:59:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6E-0000000CRFe-14qR
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6971460EA4;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C9F1C4AF48;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=MH1AecxN6hBhMEENyKPQfaDdwBYj+Uh3PGqrMvR+6v4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LHkDkwO/ZPXShs7BuzSNAZi3gcAn2cGMJHnroRzPo/iFjnZm0ENjbQHpMo0UqrhjX
	 agCB+gA4y8j/m2dWS3f02h4OvZ2VLdL/Xu4BUfVjZJ30x1jGSe7J+1yEUxim058UIQ
	 IVHYCfAyMtx0XuBECvqFFIRsKCYEUapppHvQC7qBoCnAHceGBqsiS1E5rfSo3cGFiJ
	 U4WcLA9ZRDsVCUqgli7qK39tEh3KOzd8R2cyPx/aKpeNBOP0aGaxPjpC88yQKD+xra
	 L8KJwcXb3BkoB+va/fGL7KYhdplvWvr6a3L6TLzGli2m+IL/Qt80I6JFLpnuQpNtKC
	 ioGaDVVqURVEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8EF1CC8E8DC;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: run savedefconfig for defconfig
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951658.10883.5835597869579224496.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240717-shrubs-concise-51600886babf@spud>
In-Reply-To: <20240717-shrubs-concise-51600886babf@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055838_412867_6D081643 
X-CRM114-Status: UNSURE (   9.79  )
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

On Wed, 17 Jul 2024 14:29:24 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It's been a while since this was run, and there's a few things that have
> changed. Firstly, almost all of the Renesas stuff vanishes because the
> config for the RZ/Five is gated behind NONPORTABLE. Several options
> (like CONFIG_PM) are removed as they are the default values.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: run savedefconfig for defconfig
    https://git.kernel.org/riscv/c/82b461680651

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
