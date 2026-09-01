Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA29C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=spcvWYGc2h1safKkR9X/f1ZcuiQHvkCY6XAKFosNx6E=; b=Jk5Ljpmd0jSUpB
	qGPDOj8kS6Kbr0NT1+CajC9AbDk5MwMmmBpKN5IATYAzncekxWKxoG6ED41q/moGPkLU3xGRDGoe4
	/G8fzG+0WaViVfimQMpQ9Ne1HricslSYZYjuyRwxCu9lec6Z0uO+jyE+3mZIlA6yOQEBIyxi6EU34
	xAzZeHOvfFFnnBLSYj5gwM9Q1S0hTCe6ZoVFfnxv72zT7ZsIsFu9wLYSRkDtxdzdbBLGMrdOCNGOO
	VCrEtBq+KxqOqa5AREVtu99Wu+jeOfMZnGM4nM1sXejRUEGOJdi6eScahj2H6vNIREmSKlhhdZ+wH
	o4N89zO6b3j+1O19xRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ULx-0000000DEm9-44Xb;
	Tue, 01 Sep 2026 19:41:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ULx-0000000DElp-0ddS
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 19:41:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9DA60207;
	Tue,  1 Sep 2026 19:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321C41F000E9;
	Tue,  1 Sep 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788291664;
	bh=23/MZB8wrEyX9XWKNI5R0zZXXj8aB24fAIwXwsKt05E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A66J4XVPkBjqRvMBUD2kbAsKdX96r18WsMjLBTPX/HboTYjTHHgW6pdanrolYO8jw
	 f7NZ+gjiHsFpZBOCKm4pbGtAX0q75DKObcEQH1umh4SAn9Pi4qxYLJBX9Ys6FPEpCg
	 bB79LsNWd/PrTZeNo+CWPSDuXFFxvVAR0xiNWPwYTydct0uoQk4xx8/m3Jx1cPvO19
	 tLVZ25tJk0gvcxbt24Ci7h4kRa3ta9RvlBPKleTXH6iRRE0jDjLUR0AUUd7o6zEhCz
	 FHe1L0GvJNrnWdf3k2PGSgbwnLzoyxk2sViWwJQyvtPuUhHgwAf1WLNac/K/cR5hcg
	 WniVsIEMtObaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AE539253EB;
	Tue,  1 Sep 2026 19:40:07 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178829160640.1815744.5288519540181026085.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 19:40:06 +0000
References: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
In-Reply-To: <7190E4DB338251C3+20260811081513.2849980-1-jinrui@haiwei.tech>
To: JinRui <jinrui@haiwei.tech>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, alex@ghiti.fr,
 ajones@ventanamicro.com, cleger@rivosinc.com, charlie@rivosinc.com,
 samuel.holland@sifive.com
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

On Tue, 11 Aug 2026 08:15:13 +0000 you wrote:
> The RISC-V ISA manual specifies that Zfh implies Zfhmin, a normative
> rule clarified in
> https://github.com/riscv/riscv-isa-manual/pull/3070. Zvfh likewise
> implies Zvfhmin, as stated by the vector extension specification.
> 
> The kernel currently reports ZFH and ZFHMIN (and ZVFH and ZVFHMIN) as
> independent hwprobe bits derived only from what the device tree
> declares. Platforms that declare just "zfh" (Zfh being a superset that
> already contains all Zfhmin instructions) therefore report
> RISCV_HWPROBE_EXT_ZFHMIN=0, which breaks userspace RVA23 conformance
> checks (e.g. snapd installing core26 on riscv64).
> 
> [...]

Here is the summary with links:
  - riscv: report Zfhmin/Zvfhmin when Zfh/Zvfh are present
    https://git.kernel.org/riscv/c/2dc1f8d0a5fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
