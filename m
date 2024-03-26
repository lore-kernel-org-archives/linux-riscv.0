Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F1BCD1280
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 21:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WlfYhTbgHI3kxbL7LP5MoJUXNtUDDfxHalL37zvTR8=; b=xheQ6Q5OzKRAuF
	CALK18oqBn740OJ7Cm0bgKOexAx/suGaGITdzSLtsoKSep2fnm9B2pMXRDGB5DFNGjnFO72zPcj/a
	DJ30E9STpDdFUKJsljR2n+1SIvymYuP0iioMVApNnU3c1J6igPy6V5uBDRsNYGUS6ozMzN0HgTAdc
	UuI4h8POWZUA1tOjLSDFuk28xzgwvefIjY9SJ0CiyS12WRq1u0Kglh2Rlm2Kl6iQPBsE8tht4mfRi
	Bi9A3IsP2qRH3uQXIJw5EsZkOI94x6bO8a8uDjWiQ2NRL/EEcxKTnkrXQB6XWBaqygmO+/8qdyaR6
	dOydIFAD8s52OUeUMrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE43-00000006V3m-25UM;
	Tue, 26 Mar 2024 21:10:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpE40-00000006V2F-0JF8
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 21:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D85806144A;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7369AC43390;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711487429;
	bh=8saIACrfy8QISx9H5ksI6D7YCNwsbcZUSnWbjaAtbqM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M3seXFDpvNLKmEGfVcZqvJDXhGH0EYOKu6uBnUfgsCq8ev+H/YxRQ++NfDtioFlaL
	 BPOMPhMeOYOCh4joZfb3mKZRVcCM1qIVhskBmd2IQJq2Vuddwn/szMYPz86bSgU75b
	 c64R9NaTUy/5DVx16cCAaaFRMjo6WVLrvz4xGu4kJpQJCT+muyExdCMLcwTE+o3RxM
	 frj6Y3OB3Q7PM53mTFU5gesfMfHE9eIk4TRC4BbQIz4t7cSnj4Ij+cgq/Tkge8x0QR
	 A+B5Asbm2mcJkWEBqzT94yq6XWFh3dObj3+Vp/3oYAMW/T+oekYZ9fYFOJPNzf9H7f
	 1LYM2C2LYFeVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63A58D95063;
	Tue, 26 Mar 2024 21:10:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: hwprobe: do not produce frtace relocation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171148742940.11448.3731153346859499014.git-patchwork-notify@kernel.org>
Date: Tue, 26 Mar 2024 21:10:29 +0000
References: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
In-Reply-To: <20240313085843.17661-1-vladimir.isaev@syntacore.com>
To: Vladimir Isaev <vladimir.isaev@syntacore.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 evan@rivosinc.com, nicolas@fjasle.eu, tglx@linutronix.de,
 samitolvanen@google.com, masahiroy@kernel.org, maskray@google.com,
 linux-kernel@vger.kernel.org, guoren@kernel.org, roman.artemev@syntacore.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_141032_176421_390228A0 
X-CRM114-Status: UNSURE (   7.20  )
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

On Wed, 13 Mar 2024 10:35:46 +0300 you wrote:
> Such relocation causes crash of android linker similar to one
> described in commit e05d57dcb8c7
> ("riscv: Fixup __vdso_gettimeofday broke dynamic ftrace").
> 
> Looks like this relocation is added by CONFIG_DYNAMIC_FTRACE which is
> disabled in the default android kernel.
> 
> [...]

Here is the summary with links:
  - riscv: hwprobe: do not produce frtace relocation
    https://git.kernel.org/riscv/c/ad14f7ca9f0d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
