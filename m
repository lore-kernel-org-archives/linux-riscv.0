Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBB2C531FC
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnUYV+mYxm8OZVv3t0EUP2/2/kbCxeS50iVsaNc2c4w=; b=PMrth4Wm44ZohL
	FcnCKL/f8nqLf0tGgWfgkm3hRNEMvLFvK2hC5hCiJBSgLrwLewpZda4pa3ALeY/csAdHcEZPd+W0a
	vxvRLkyCNkcL7jM+usvNQg+JGmNioy6rkewXrKB0mhJHVixxU6f9UE10Gl/q6ppm3jD9SnUPUZNTO
	JfYwdnQzgXzhI8dCYbsq6b6RPyK8E5ZBGtyfBoEMl1didHTShZnEwGbqyW9/qWoUhmmj2ehakvpyo
	lM0ucfywjTJ17CrM0qOruV2oHqEin0xoD0dn4nYo2avJ9X8QVFSf3sALF1K1FK/I0jfgsgPOECyxn
	PUSly2iQVq1l9hCNYyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHrA-0000000DCw3-1v6j;
	Fri, 20 Feb 2026 04:11:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr2-0000000DCeT-195U
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 599D46184D;
	Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FC1C2BC87;
	Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560659;
	bh=e81cs+ofMYR4DC6LCww6mSPUC6CG5uHTZadCxmdJ2d0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I2F7JzbuoLInhmc1ni+lBsI7Pvr/4MVFMnHll797K223oeGLE4dDCnUsu+cbuTWmg
	 79WYG3153kffMrIdPnr+erIa/9/E4lC+D6Kg/8dKGkB5Vs+XO3BrCOxQ+vToDZK4EI
	 0PfDd50chIkbRqUOaHlS8uA5KK6vvOdtoYjsBBFdYax0cYcMhNcyeT/PRgrZKyRFbr
	 RtOE7qh80PIo5d7b5xSt6wEO/6f/g7C0IA9fJFZACYouX7QJaNtg2yTFWFtzXYVASJ
	 BciRFyVHwGWYA3jSAhKvL6ZYDW98G5kakrdG0ED2Fdz81RjjSTuZKHd6WZHTc3nMC2
	 gIhlCfRjyskZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F473809A88;
	Fri, 20 Feb 2026 04:11:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent
 to
 top node
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156066728.189817.4895026991119169845.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:07 +0000
References: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
In-Reply-To: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-riscv@lists.infradead.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org
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
by Geert Uytterhoeven <geert+renesas@glider.be>:

On Tue,  6 Jan 2026 18:14:01 +0100 you wrote:
> Move the "interrupt-parent = <&plic>" property from the soc node to the
> top node, for consistency with
> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.20.
> 
> [...]

Here is the summary with links:
  - [v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
    https://git.kernel.org/riscv/c/0c3644ac3f8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
