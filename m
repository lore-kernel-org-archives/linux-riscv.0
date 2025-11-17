Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA9ECEBF61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWb8/MpvSX0oC/cxYofeOw5Q8W2TPvsh9BuLIZy1g9k=; b=aWtYJSi58CkcjL
	teLesJmJE+pXMLaPgG8mD3OgcU/k/OUqcBY8PNoRvlqnINXaA6W8vRCGLeEJpsshzcQQaa+NT1gDU
	ryHGKj0wisBWPo2gSyLpzNpQUpLG2366i0G3TzpD+XYj3w43ujt6Pxsf85n36AxS+HXM+8JIYFkh4
	XMUwX310Epn3zxOcRdcnTyFiHDl6FUyHjceITiGdWX4xEEFIGlVXkOzKJRANyS3n6hGmyJnyr44OO
	1WmhmWKUOQUhNsytgRUyVbOGLbFQUrIUhCabx+cGNsv5pBKLmLc75+pIgwqsUjZ/FidI+y8UEJq+9
	cebfX9JPd07mNoZsUcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKG-0000000FfI8-3agM;
	Mon, 17 Nov 2025 08:11:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuKE-0000000FfHm-2qi0
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 08:11:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22162601A0;
	Mon, 17 Nov 2025 08:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFC9C4CEFB;
	Mon, 17 Nov 2025 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763367061;
	bh=EY/sN31vK+Bntj3RYtRVW2Ai8yUhG4xDAalX4UOSER4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OBQvxVGgyAwaNZOGJLx9ZX6fSJW4+5vvAIvf9z1k29oqg2L2LHhwmd+i6A8nFhNdK
	 /+Q0neP5leKi1ShxP73z6WBrgy6WTGvyN1wHhMrt9K8m4XFPk+Gz+91aTO6/gTrNKV
	 uAflp2kH8+Xx6WujROZjJaTU4ZsKoic7sit8PxtyXh+wygBtFO9Oe03TsOTjBiBUYo
	 EaMLgHYPG3XA7eJtiZ0gtEQYGyRz1c3suJc1vnz6ZrD3S8RlI0KCyzqlCVE6Mvdnk9
	 w/loSrEceUipQ3N334f0YkPu37w/0u5TYKSE1hMZsy0UngDlJIfbyUCEa/lxkvHLCZ
	 sU5AfHSjFeGOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D2E3A82557;
	Mon, 17 Nov 2025 08:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: sbi: Prefer SRST shutdown over legacy
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176336702899.2854411.10334925946163449436.git-patchwork-notify@kernel.org>
Date: Mon, 17 Nov 2025 08:10:28 +0000
References: <20251114065808.304430-1-mchitale@ventanamicro.com>
In-Reply-To: <20251114065808.304430-1-mchitale@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, atishp@rivosinc.com,
 ajones@ventanamicro.com, cleger@rivosinc.com, afd@ti.com,
 linux-kernel@vger.kernel.org
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

On Fri, 14 Nov 2025 06:58:06 +0000 you wrote:
> Currently, the sbi_init() always attempts to register the legacy shutdown
> function as the sys-off handler which is fine when RISCV_SBI_V01 is not
> enabled. However, if RISCV_SBI_V01 is enabled in the kernel and the SBI
> v0.1 is not supported by the underlying SBI implementation then the
> legacy shutdown fails. Fix this by not registering the legacy shutdown
> when SRST shutdown is available.
> 
> [...]

Here is the summary with links:
  - riscv: sbi: Prefer SRST shutdown over legacy
    https://git.kernel.org/riscv/c/7b090e7b910c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
