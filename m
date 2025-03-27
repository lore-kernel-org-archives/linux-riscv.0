Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C2C36002
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT5SPYCDtcNVISySLP4yZ9asLsuEKiWM8b6bNF3dS9o=; b=e1tTv5BbduGLwT
	Cm8nzDApUHrcHlU0ldtEZekko2hDfteNZIW4PcNFWD2zi7PX5ghvnBQ10BGgWdZhJ2a48go7es8tN
	GR0QIxYMh/yKsGEA2zYcp5x7jYj4cYZ550piV3ui0w+AB4cPLMVRT5iFIxJ1HM6BvFFvYEIPiVpFM
	qmuizjA+piGEsPWtW1/n01zzlBVltox+oy62t5AbQGSok7XQz7jlu3oUOT/+h/hBx9Ux4pxc6Ivsh
	OSH+vf/AzVThnulMC3n2AVjUydsig5yG/huTMK0ixQ+YGtPiMNJ0wsgQ0Ihp/DM83fsbEgdV6pGiK
	N8lv6pYq0KWQXFoz/Fpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqV-0000000A3xl-34ef;
	Thu, 27 Mar 2025 03:23:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqU-0000000A3wz-0iUn
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 03:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B7636115D;
	Thu, 27 Mar 2025 03:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D60A8C4CEDD;
	Thu, 27 Mar 2025 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045832;
	bh=pCC2sGFvcufaRdmAg8yCIetKAMH3a3vUnBCLsel+L6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fKD745VX76VwxxStc0QSSD/7Xyl4djR6b5/7IvZmHkFqBv3tQXcjeflW+qAUminIz
	 RI0hOE5sy9F5CN97/jBF3mBTHWbkB4fdZAyQ2zTpcECLQ2sZFlAwwut3wwFu9xmHg6
	 byUodYbvoKVH8bg8DEkcTcw+VSHvcv3lqK7zT6IsrKd2PWZrq9sFgJ31shS1+JwPmo
	 hInRWDZMRQ+Ow78NBiRtNg6Uc9gtLpcWKNEjde1rmyMmNosnL+5MZgjatgxP4dbe07
	 UzjewMzsLjk7Z/9UyzvMudlWUyizihXHx9sy1cNENRVBRep8ldGsB2BLKQc4ndKWPT
	 YZiwenpyMMoiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B3D380AAFD;
	Thu, 27 Mar 2025 03:24:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304586925.1549280.17943998836701933910.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:29 +0000
References: <20250304120014.143628-10-ajones@ventanamicro.com>
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr,
 apatel@ventanamicro.com, corbet@lwn.net
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  4 Mar 2025 13:00:15 +0100 you wrote:
> The first six patches of this series are fixes and cleanups of the
> unaligned access speed probing code. The next patch introduces a
> kernel command line option that allows the probing to be skipped.
> This command line option is a different approach than Jesse's [1].
> [1] takes a cpu-list for a particular speed, supporting heterogeneous
> platforms. With this approach, the kernel command line should only
> be used for homogeneous platforms. [1] also only allowed 'fast' and
> 'slow' to be selected. This parameter also supports 'unsupported',
> which could be useful for testing code paths gated on that. The final
> patch adds the documentation.
> 
> [...]

Here is the summary with links:
  - [v3,1/8] riscv: Annotate unaligned access init functions
    https://git.kernel.org/riscv/c/a00e022be531
  - [v3,2/8] riscv: Fix riscv_online_cpu_vec
    https://git.kernel.org/riscv/c/5af72a818612
  - [v3,3/8] riscv: Fix check_unaligned_access_all_cpus
    https://git.kernel.org/riscv/c/e6d0adf2eb5b
  - [v3,4/8] riscv: Change check_unaligned_access_speed_all_cpus to void
    https://git.kernel.org/riscv/c/813d39baee32
  - [v3,5/8] riscv: Fix set up of cpu hotplug callbacks
    https://git.kernel.org/riscv/c/05ee21f0fcb8
  - [v3,6/8] riscv: Fix set up of vector cpu hotplug callback
    https://git.kernel.org/riscv/c/2744ec472de3
  - [v3,7/8] riscv: Add parameter for skipping access speed tests
    https://git.kernel.org/riscv/c/aecb09e091dc
  - [v3,8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
    https://git.kernel.org/riscv/c/9fe58530a8cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
