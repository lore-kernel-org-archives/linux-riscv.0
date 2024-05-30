Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F296C27C44
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcvCH7Z8vGmC4n1t3ObdwJ5SJ1H3mxuSsBzoJtBKOjo=; b=2dbInFSnVk0lXv
	hdHc4DY0wie/IHqM99a7XCLxvhKJKw6uatMUi7EJXfgHJA4NCIvewxYjNm0xFDINtPqxxFLd2bnsr
	PJt/YBeVA2JL0W1SBAV8ZrGXW2WQIerKRwMHZmE6Xaxj3zFYuJpVhAHqIZADVipX67dRJ79SRniA3
	idIeclhsLoxDm3cra6KdZS6JGbgYSKFmpvRcc1r3N9VmSbZ62l50AlGlhMxUWS6wYqB4h1B9S/5+p
	v+L0CeYOwzFq3EgyvlZuCCuPp9mBRjvPdA3KhCeXeG0RRnytPeOVwNCaoY+ea8/Dx09xcrFiVb5dU
	wYFD+/SJeL1t1T9lzPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2o-00000008QyB-0dCX;
	Thu, 30 May 2024 21:10:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCn2g-00000008QuX-3SlA
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 21:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5C05FCE1B68;
	Thu, 30 May 2024 21:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D8EC32786;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717103430;
	bh=imwaghj5+sbOEUXtN0H+N4S2m2OApJlTIDRCmvWIFO0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L02GX94ZIqE3jNGEP3/mk6VzHkkns9PZu2ZFXHRhascBPvF406Fx0lhsRM/Zv6scG
	 Lhyrl6pVwJ6yrKORSf8lpFTE3hXLdrT0NYIliQjMlg8CbgsWkJd04FN+PLsor6hj7n
	 tzbzENePdDw6vhOTXbkSHhOgk7Y9ql7lDGZp6p32sgc5stqfIcZhJDJUsQVgkPcSpS
	 MCt8zu8IZPZCZMXnQz/DH7ZVgxM82Mr0fULkBUe8HjDqpOU9nvrJzkOPZlVXuMKWRi
	 MYqZ6eZ84uDetV7h5et8inTuNWblm+5ULn1Faflf/K5dUDuCHLzWCwAtioW7Q5xesv
	 hXDrZ1inkN1Lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8A81CC3276C;
	Thu, 30 May 2024 21:10:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation: RISC-V: uabi: Only scalar misaligned loads are
 supported
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171710343056.6624.2242126513528878113.git-patchwork-notify@kernel.org>
Date: Thu, 30 May 2024 21:10:30 +0000
References: <20240524185600.5919-1-palmer@rivosinc.com>
In-Reply-To: <20240524185600.5919-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, costa.shul@redhat.com,
 conor.dooley@microchip.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_141035_075412_16F035C5 
X-CRM114-Status: UNSURE (   8.35  )
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

On Fri, 24 May 2024 11:56:00 -0700 you wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> We're stuck supporting scalar misaligned loads in userspace because they
> were part of the ISA at the time we froze the uABI.  That wasn't the
> case for vector misaligned accesses, so depending on them
> unconditionally is a userspace bug.  All extant vector hardware traps on
> these misaligned accesses.
> 
> [...]

Here is the summary with links:
  - Documentation: RISC-V: uabi: Only scalar misaligned loads are supported
    https://git.kernel.org/riscv/c/982a7eb97be6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
