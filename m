Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A44CD1296
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 19:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzSUgCilLkzuw1Wl15Y+CCcE8zXrpyGxjAs9S7XKnj8=; b=1CPORDF/4zZ+j8
	o+FI2CCeMkue/MOUund7xcBP5DSAwNDzmZX/9tVcYhAlh1Rs4S3dBMUkpP4f/IPPySev/JaBaN94U
	EukAwzheLnjn+c6a6ET/zGpP5IorXNMnyQNCkrqQ8OOVDVH64fJ/NGJNs4Pr4/LZB+hB0l63QWhvg
	S+vfzt7src0GX3Hd/gewGE8GADL9Mj0lkflLjcdY+lz3IxBVq9WupKhzexcpu3JHEvbhP0cwTMSX+
	+zx7S64YUSVclE+DV7OI/G8hph/5IYU/AU98Q9ZqscUBxtOfN2VRWb2IsBSNkFAGE8VZCm/K92jcz
	mF8XvIpj8Cx+QUD8KTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSww-000000045GL-1StG;
	Thu, 04 Apr 2024 19:40:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsSwq-000000045DV-1spl
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 19:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DC796CE293B;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CA2EC433F1;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712259629;
	bh=u334LWyOTdZGhrR0RV+2Ni31VxmZtcf+WWe2CyCtaO8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I2x9a9UbzWbEfPh8ihDO2pb2IHBvS1TmZUAiqUqqPg8zyltRsr3w07uKmypFnUAu2
	 Oypzb0H1c78FgDzw4N3RDQ1joIOiye/lwz2+hqWTao4CjZSOkB875VGEDMo/BwD9zp
	 jQMmbWiGoBpuIdI/+5G+xnxltepfjzxLE0ONXWkQQS0EQQPqnIUEKMq4ure+hhTrf8
	 jZ/f1IEktwTvZTYsSZQ7OtLq2TwlFtSY2GM3B2yfTVitwZhRl4ZPFahlNr/JHc04Rh
	 RBJjnWOv4VZ8xqEryEyLcDTnGj0ORggYcttOPIBQ3GBoz3rNkwI/DJqO2okg2kkq4I
	 jZ10TaBwAu2lQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08B19D9A150;
	Thu,  4 Apr 2024 19:40:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: use KERN_INFO in do_trap
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171225962903.17194.5283335335364983285.git-patchwork-notify@kernel.org>
Date: Thu, 04 Apr 2024 19:40:29 +0000
References: <mvmy1aegrhm.fsf@suse.de>
In-Reply-To: <mvmy1aegrhm.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, palmer@dabbelt.com,
 cuiyunhui@bytedance.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_124032_737569_78DF304F 
X-CRM114-Status: UNSURE (   7.52  )
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

On Tue, 19 Mar 2024 16:40:05 +0100 you wrote:
> Print the instruction dump with info instead of emergency level.  The
> unhandled signal message is only for informational purpose.
> 
> Fixes: b8a03a634129 ("riscv: add userland instruction dump to RISC-V splats")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [v2] riscv: use KERN_INFO in do_trap
    https://git.kernel.org/riscv/c/dd33e5dc7247

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
