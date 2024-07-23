Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6C6C3DA63
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqmVCAdUv0d/YL0ayKa32v5JjHaVZpG6VMHbyJYpTuU=; b=slclZ261RUKmOO
	F17oe1ayyyo3H7F96VEsdgM6y7FX1V2I5aCtBPtWYC36FZSM4PnCCNFSGH/X0JTl1RaKDFlA+9/YX
	5eJHgEyXipuv9ds+LaGm5l6cYt3oZ/YrYwku0a1kj7rJKd24H/2tV3ezFtYILbHHcHO0ox0w9suYg
	jMuodutFeHUOMcuYw3Z3mZ2k6lqffyxronC1ut9G9WPOIPtnUkEm0wH0k4xiU1Ej7r+BixGW/aOsB
	vc8Cc+QBdzaRcr9i3Ky+rwlv8gJx+lYM77ClqiHIy3+dl/RMSAU3bFhhKS05DfJfln2XuVqdwPhic
	XgK2wFw7lSKZHzxJ6ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6f-0000000CRQM-0oz2;
	Tue, 23 Jul 2024 12:59:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWF6E-0000000CRFX-0rTW
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jul 2024 12:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C46860E33;
	Tue, 23 Jul 2024 12:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87E93C4AF17;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721739516;
	bh=5hpcvR5Xt4goAw6G6QK1Xdoz4E8OWx4TKQcPvVsWF+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mQ4/6nreWGGgfLtTxtTa3Os9GZzMWpBKQpOYzwhNm8QFYH1ZOYh80rtGH2QppoMTy
	 ah/k5+rCTJZMEH07kbBSz37fAYC//ZiUfwdpTCIWo/9J/LT0KK2v3QPNl1Pp33bU3D
	 jD3bJrXIXWDI3KvoT9iIr5zWAH7vsJKjlvHxXjA97xmNIPR9RDF7oWMBU10Uto2WBP
	 RSYytsBqF3Wzrm3VlZC05Dj1GFRKBhndJP1XCrf9Z3Wn1tTGdAUJ9W3UV7Q+gMQ+X8
	 VBpyXh/zmpwtDup5b0coB/AW27Q+Je74OwK6NDIwNJFL+BVbwfHgfNgxitSgdBPpPW
	 BN2lqv2P9GNEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F55CC54BB5;
	Tue, 23 Jul 2024 12:58:36 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] riscv: Separate vendor extensions from standard
 extensions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172173951651.10883.11801254450675807570.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jul 2024 12:58:36 +0000
References: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
In-Reply-To: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
 evan@rivosinc.com, andy.chiu@sifive.com, linux-kernel@vger.kernel.org,
 peterlin@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_055838_339882_AC3DE919 
X-CRM114-Status: UNSURE (   9.36  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 19 Jul 2024 09:15:17 -0700 you wrote:
> All extensions, both standard and vendor, live in one struct
> "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
> it is likely that more vendor extensions will be added to the kernel in
> the future. As more vendor extensions (and standard extensions) are
> added, riscv_isa_ext will become more bloated with a mix of vendor and
> standard extensions.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] riscv: Extend cpufeature.c to detect vendor extensions
    https://git.kernel.org/riscv/c/23c996fc2bc1
  - [v3,2/4] riscv: Add vendor extensions to /proc/cpuinfo
    https://git.kernel.org/riscv/c/9448d9accdd8
  - [v3,3/4] riscv: Introduce vendor variants of extension helpers
    https://git.kernel.org/riscv/c/0f2425411101
  - [v3,4/4] riscv: cpufeature: Extract common elements from extension checking
    https://git.kernel.org/riscv/c/d4c8d79f5199

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
