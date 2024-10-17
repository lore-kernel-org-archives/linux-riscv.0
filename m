Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C35D3C524
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1FVkkv/S3QxIGC3Mmpn1mDbtK2N4P2TyfwLCJ6NkWg=; b=ocg5wvd7HLZjFz
	WLaNK6SGaa7e3GiDDrTP/JedE9GqmPafNXKV6ITM8wHRr2mPWF1SrCjs9cPjPHpgUSjBUv73VOpFC
	twA8YAG8anGRRBLjIFl+bAzRDbV7NqfeN6bPavrkdUu8ytB7bHZZSV5/sOcoVRK95GrvJuQWgToqb
	ynLCAGbsskJoScazcHOyXYzMismivx3lbxjsNjlC95jn3gCdhT/Js9LFmsDVHDJAtkztBvjlCA75Q
	uJmql9b+Y1wQ65Mp0WVzVI5edhOKBfesNl45QbC/zzW36hxKedO7J+dvKofjlj6bR2Vm1KYG5cHFk
	S3bQ87EKv7FF7LMaeMeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOo-0000000FV1I-15Y4;
	Thu, 17 Oct 2024 16:30:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOR-0000000FUsP-2ZKI
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E70D5C6156;
	Thu, 17 Oct 2024 16:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D6EC4CECD;
	Thu, 17 Oct 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182630;
	bh=KH8o1h7M6XpFzHWRszjgrArk3aExRlRWHv7xNLYme7Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ArAZ9c+IdoghXXrlY3tLFBAVCWiI0Y3XQYprK57xOgHXiKn4jyful/WcYoqBjSZeX
	 /Jj3r0ZKrKmX0ogEX3MyMXQ+4B1bl9H74dRlNsJxZCRmTT+V8oYWV9IsPPlzcvqVEv
	 JRAm8kRzDsarLBLsL5Pk+Zi/f2rLCwGSH1AQqSGdzc4JEuf+Kt/8vAtUH6iUwvcjRG
	 UZiqx7UKH1OsV4pqUORI8BM5+YiA9q8qmsLvzaLSSGqJpH10EFTVSls+E/KcUQrE2Z
	 7eDoZHJsqSSk9VQJ8i9rWEciGlGlZWkJlMRHWOdSnT7N0J7UFzVJh36kvJDy8xq+ju
	 zrqmkVk67DpEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 715943809A8A;
	Thu, 17 Oct 2024 16:30:37 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263598.2528145.14698302036420162335.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:35 +0000
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 jmontleo@redhat.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093031_727992_D1C83069 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue,  1 Oct 2024 12:28:13 +0100 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> During the discussion before supporting rust on riscv, it was decided
> not to support gcc yet, due to differences in extension handling
> compared to llvm (only the version of libclang matching the c compiler
> is supported). Recently Jason Montleon reported [1] that building with
> gcc caused build issues, due to unsupported arguments being passed to
> libclang. After some discussion between myself and Miguel, it is better
> to disable gcc + rust builds to match the original intent, and
> subsequently support it when an appropriate set of extensions can be
> deduced from the version of libclang.
> 
> [...]

Here is the summary with links:
  - [v1] RISC-V: disallow gcc + rust builds
    https://git.kernel.org/riscv/c/e52d5050a0d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
