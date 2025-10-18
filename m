Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAEDCCD1A4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEsZ4RzXBZRIN4DTQx9obH4Oce7nRHMaLabQtqYL++I=; b=hvTM/upNt7fihU
	nY8cpPIYSozXimdEv71OeROhby/8R13WBQR9V6Vv4PmLctsif/wpvymLNZKEt/3/eYlcSiszd6hly
	9IBcdN8bcCxg1jASNQRMRXToebJ25aH3+rXxAA27G+zEPfNBmWiZcmWeBsIaDkBuRNSrgboDgnPjV
	uCKAcawrQaFaQksNR7DjsCICqfBswaw8TgXb3dSDXyZRoqa2kyaVXCIgWkaE9UGWeFqmIrFLfkVt0
	D2p5ZlCv8TJPvrYBvYoCUyZ7Ecdvxv8hP2wo1mHp5naVa6mhISphkPmEPXMLnAOFLaRfoc1b2Y81/
	wUbWzsyA1J0iXsK+kmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NU-0000000A78J-0ig8;
	Sat, 18 Oct 2025 16:01:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NQ-0000000A75m-0bv3
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E3B86115E;
	Sat, 18 Oct 2025 16:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF3DC4CEF8;
	Sat, 18 Oct 2025 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803311;
	bh=wHoIEi9LyOjbIo348UgaazyL4vnBvYSVLFSEXBSMrXo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rzn7gc9EN+Id2A78wKRBgwd5M+d6kix7zKlEas6ZxQL4huwQCQy/5xfDxhE+nkcu5
	 bsFEAqkOEE5pBADqJjVaH62xeB18AzymrfIm+6caSXdXX/YUrUfYuLqb0EQj2cBOrq
	 BHDQDVx7UPdNq5JUypiKaRbpeNHJ8jv48Bd7BGXYZ/QFpHXM0GfWZr0I9SKwnd7o2U
	 lc4uOrTTIDT5zv2++toA4voNfLI69Slut6G29tmuOLonCTtEp3hzEbMfsa7hsFF9Nn
	 Dt82B6PjRIDWDUpLz+Q1uQHxmQpSuUlNrpGUrui/VoEpDHexxV3LKVy4j8+QiOrkKI
	 kVCqfFTAaC8kQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD7439EFBB7;
	Sat, 18 Oct 2025 16:01:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Remove the PER_CPU_OFFSET_SHIFT macro
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080329424.3028979.3497089590712775875.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:34 +0000
References: <20251015225604.3860409-1-samuel.holland@sifive.com>
In-Reply-To: <20251015225604.3860409-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, charlie@rivosinc.com,
 rkrcmar@ventanamicro.com, thuth@redhat.com, linux-kernel@vger.kernel.org
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

On Wed, 15 Oct 2025 15:56:00 -0700 you wrote:
> __per_cpu_offset is an array of unsigned long, so we can reuse the
> existing RISCV_LGPTR macro.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/include/asm/asm.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Here is the summary with links:
  - riscv: Remove the PER_CPU_OFFSET_SHIFT macro
    https://git.kernel.org/riscv/c/768e054de01b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
