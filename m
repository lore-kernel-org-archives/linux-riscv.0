Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB022C531F8
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FARBdeSz0eC7cFLBvNfwQFicUlryYTP2J7jA4vSyZGc=; b=tErmPQQyE2Ojhg
	UpttxPvCd7Po1L5SUipVW50N1APZAqqBTDeho5X4sDt7mbLwU0DDHPXAkRdw5BmV0m/njU+7H4Rnm
	pvxvuz5pLdbngdWyHDk2s7ibrlhgAjlrY7IGzjwB04q/AQGlHukUdv4Jebu95QC5PciJ9xbgrZSFt
	qoKH+eqOUQaqmBpEKzTHckSWb5U75aEfajzCgFpQ/sTzBBmPtXex3z5Hl34aYikSOtlZXz818hU3p
	eu0PoKgRpO8qbTY6gM4aaRfCimvsp08gKyTZKv0zs3l6s4la8PzZZDrf+5hg2fcp6oeR8lRc4gL+b
	Dah7Ou7P5eB4i5m7EqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHql-0000000DCMP-3SmA;
	Fri, 20 Feb 2026 04:10:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqg-0000000DCIH-3uYO;
	Fri, 20 Feb 2026 04:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 562A86187D;
	Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2047BC116D0;
	Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560638;
	bh=GmIn9ZeGRzlEikXjbn7PLITSKNkbNMHLY/Yf0fqF/IU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VlSJ+SBeeAPfhnON1ZyXqzphBgx4V3bgTvauvu85YeiI5mlTREBkb61m+04o3wIWh
	 6Pno9LXCnhI8nC/hRuhMd+fgshIq0F1mAH/DEcZO4aKOqExOeYtnuKxBzsIJIvpQze
	 kdL6hhYvFuStENEHeFVIsSx0Au5ENsZWIX8atJWOiOnN2444grbOsGlgPysnVsmu9E
	 V8116kPklhvS6giKFOfwBSN9DJyoDX0edjy80ThUYXR7VyxfB9IkYX0z/CHc2Wnpsg
	 m5FnCTC63lZ+rp27A0NoXGnjEIsJQjZpptu6p3QNXtBcuAzBXZ7aD+CXrcMpktT189
	 t7CzKaZ1g1AUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FD93809A88;
	Fri, 20 Feb 2026 04:10:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064628.189817.770597310770698604.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:46 +0000
References: <20251126160854.553077-1-tzimmermann@suse.de>
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-riscv@lists.infradead.org, ardb@kernel.org, javierm@redhat.com,
 arnd@arndb.de, richard.lyu@suse.com, helgaas@kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
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

This series was applied to riscv/linux.git (fixes)
by Ard Biesheuvel <ardb@kernel.org>:

On Wed, 26 Nov 2025 17:03:17 +0100 you wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] efi: earlycon: Reduce number of references to global screen_info
    https://git.kernel.org/riscv/c/b868070fbc02
  - [v3,2/9] efi: sysfb_efi: Reduce number of references to global screen_info
    (no matching commit)
  - [v3,3/9] sysfb: Add struct sysfb_display_info
    https://git.kernel.org/riscv/c/b945922619b7
  - [v3,4/9] sysfb: Replace screen_info with sysfb_primary_display
    (no matching commit)
  - [v3,5/9] sysfb: Pass sysfb_primary_display to devices
    https://git.kernel.org/riscv/c/08e583ad6857
  - [v3,6/9] sysfb: Move edid_info into sysfb_primary_display
    https://git.kernel.org/riscv/c/4fcae6358871
  - [v3,7/9] efi: Refactor init_primary_display() helpers
    (no matching commit)
  - [v3,8/9] efi: Support EDID information
    (no matching commit)
  - [v3,9/9] efi: libstub: Simplify interfaces for primary_display
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
