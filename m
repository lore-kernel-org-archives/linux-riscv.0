Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576EDCE7D14
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg9ilaRpGS71T59jYE8cq1nDkJj2HSiAsjMaKtWgBP0=; b=zrVFhUlKUry7vX
	nN3mufy4R3+9VO5SEsIRrlnI1/BpQmQSCwk4r94A1zWsgW9I7t8zkrHiMGKcxQ6macTKDzRFvTyse
	4q+FA/N5y/IktqB2D/vKPPYaYU2RmQ/0/ISpaSOGxz4m0OGBDsH2zazA6dXG8LqNhelbywZ0yKwfZ
	pcuKmtSbfiFbqFba6APTJ5bUY1YOqsvdRpDfAWhZggUlr1XUDuiOQCGsif1qGkreVIMyvXj8iPso8
	PcfCZN/NN3Pmci5nkx/uA5cEn3P7Ed/qUw2tWCcJs3Yyv8WisucqfRYae34DwPfS0WHtRDVpehoP7
	BTuKJtSoUB9yb+q3x5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbPX-00000002aXS-1bno;
	Tue, 01 Oct 2024 11:51:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9u-00000002XKd-3hP2;
	Tue, 01 Oct 2024 11:35:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39C5E5C4A56;
	Tue,  1 Oct 2024 11:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C631C4CECD;
	Tue,  1 Oct 2024 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782514;
	bh=10YhdOj8ol1a6n0A/twIEKygu8S/PkpyOPh1KoL/Tt0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m4ZEJ5v77pTy/yBTJE2k9VlW4mkdxnSLPsK4AcC82lEOpM6A68kJaLEoQu/NC0BxU
	 obq9H8uT//6Nl4oVbggUqjBlm5UmMOrtCnh7I25EYVG8cUro6/DX+ljgY1yf5dtYHO
	 //tiEjTuNwCSmvCvgbqlaOqSoh80XXZMehC6IdsvFUAQ/n5OUGylK9MPNbjUP/0IyY
	 9piwK1oEbUOpIlwitdd7oL/9gidKW2BfgszuSBBuqXund2m4Ek/J9pmIBgGiXWd/tK
	 OyRkBqw2lKmZAqEODcQD+acWeo4zFQj944sYU6uJ20th+CuYbi4wt3F6WQJfVdxGNk
	 eg9eRQbTLMtRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA2380DBF7;
	Tue,  1 Oct 2024 11:35:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix sbiret init before forwarding to userspace
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251701.314421.6304053721280906896.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:17 +0000
References: <20240807154943.150540-2-ajones@ventanamicro.com>
In-Reply-To: <20240807154943.150540-2-ajones@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
 cade.richard@berkeley.edu, jamestiotio@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043515_004908_32694CF7 
X-CRM114-Status: UNSURE (   9.80  )
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
by Anup Patel <anup@brainfault.org>:

On Wed,  7 Aug 2024 17:49:44 +0200 you wrote:
> When forwarding SBI calls to userspace ensure sbiret.error is
> initialized to SBI_ERR_NOT_SUPPORTED first, in case userspace
> neglects to set it to anything. If userspace neglects it then we
> can't be sure it did anything else either, so we just report it
> didn't do or try anything. Just init sbiret.value to zero, which is
> the preferred value to return when nothing special is specified.
> 
> [...]

Here is the summary with links:
  - RISC-V: KVM: Fix sbiret init before forwarding to userspace
    https://git.kernel.org/riscv/c/6b7b282e6bae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
