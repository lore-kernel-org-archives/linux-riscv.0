Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB78D3C525
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOLQK05GlhJqXtyT1ntuLd691a+3w+9TiT6ELLzMF/M=; b=WPF1WdYD+8aSSm
	1TYVLa7pB8Nq9fHDKzNAMeBUI/hym0RcJhSXCPOYinkKTtOnJRYnUS8jKHL6eD6+d+zl+NTUTXO1e
	iRwPtfB9ytOzFFKph7e85UDNhoC2TA7pnV7IIWNNfR7v98TsVgC9uZAFCQolnrckNMfl9JU0brAI9
	maDViRJo7r4pnQVpKh0dbkLQSm5bpiuQdBaWy/lkNUqZPgJH1oiJztALyD7+X2TrBaNRK5qhMgh05
	1akVFusRUhQZc8OMPizf7G9zwEH4lVDarGrwdeNgqQB1Veyaewf6jK5aVpW7klIvRT9jwYJGSA/Vp
	CXX8m32oUggWXAfRyy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOp-0000000FV1p-1mzS;
	Thu, 17 Oct 2024 16:30:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TOS-0000000FUsw-4Bfq
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12DA85C0C38;
	Thu, 17 Oct 2024 16:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B773C4CECD;
	Thu, 17 Oct 2024 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182632;
	bh=MAHHxQS0eKTGEp4J515FyxJMcIxGuOSNzAHq4WtWGpQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cVIJDfZswfdnadPqf0l/Gvj5Ex2Pc4431RNASOYjwrgbvbbKvCoQK121owGo4XrIC
	 adcHjXeMnSjASvCMEykvTPhhkBRYB0oDzEaO5z+lbhZc/diqCbs4cFrHfrCcrd6/pT
	 Cda4+GAxpf/CotLV1aiofGKl4N/tdUALp3pqDggmDxLAoZGvIN1FgauGtrJS0svWH1
	 wwPvf7+Yn4d3Oid1vc7pNo1XCbx8mVydqbUvsDlK+d7Kh7AEzYZa1fYK6deACzk9Fo
	 J/oj8o39PXeQS7qakIf4WucyAZZcjsY4+bPX8RTxZlMUGffmhv7bMdrmbAwtsP+7oj
	 9afBaMBwq0CzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB12B3809A8A;
	Thu, 17 Oct 2024 16:30:38 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH -fixes] riscv: Do not use fortify in early code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172918263750.2528145.8683172772221919308.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2024 16:30:37 +0000
References: <20241009072749.45006-1-alexghiti@rivosinc.com>
In-Reply-To: <20241009072749.45006-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de,
 bjorn@rivosinc.com, linux-kernel@vger.kernel.org, jmontleo@redhat.com,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_093033_114123_BCB8B625 
X-CRM114-Status: UNSURE (   8.59  )
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

On Wed,  9 Oct 2024 09:27:49 +0200 you wrote:
> Early code designates the code executed when the MMU is not yet enabled,
> and this comes with some limitations (see
> Documentation/arch/riscv/boot.rst, section "Pre-MMU execution").
> 
> FORTIFY_SOURCE must be disabled then since it can trigger kernel panics
> as reported in [1].
> 
> [...]

Here is the summary with links:
  - [-fixes] riscv: Do not use fortify in early code
    https://git.kernel.org/riscv/c/d49320974c4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
