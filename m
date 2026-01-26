Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9804FC88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1L6THi6wvtc4MiRrG/8Q5XZAivzJwtbD7WgILgLFUI=; b=we7A7OcDsgFnAY
	ET3p0yHMh06p2Uzqk+9g4YRdnPvE9hqjSSRcfSYpy2L8EEVUKsvyInJ1ymzw4xV8G18R7mZ0aVrcN
	WGXHM/6oz7cCDDXbFQqJ3LqyNetd+BnzLX/JaBcdaqGx7qBHb27Sy6cWbdfqf3zwTgRmj5C90fzfk
	Rg2H5MzLP4DIrc7rZyno+SBwmdJYiw0L1VwMq6GeTPH/YVQzzMuaDg3cdVh6pVHnK0aeuTH8vBJWr
	/yAd7penWTdSpRy2oLCEVmj+PE99cG72yP3p6wGkA2iZj0AGLjPXf5qzbY4z99XAAoJ5ZxdCXxCil
	kGqlCVT1zGOPsz07BU6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE71-0000000BsaW-018a;
	Mon, 26 Jan 2026 04:22:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE6v-0000000BsYk-1SZm
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1562B44415;
	Mon, 26 Jan 2026 04:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E914EC116C6;
	Mon, 26 Jan 2026 04:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769401316;
	bh=+/TmLP7uQZV/QkfJ2BYskF9iGcIhUQOcpCvg+re+VHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=R4rHeXRKr46HzJnufDrOmsu5j4AIH9EVSo6a1F05cnSGqoxagpqGojvTqJqJy4sR6
	 iXju10dKP63UUwvCT9bcJYwpG+49Jrh9V7Ww5Oh7YqU7DKFOUEuoB9nm4dTZAHlVIG
	 oaaG87Xy15z57P7JK4rC3coABIyFS6TktPPC2xZuWqAHv2nZ/UA4+avQED4N/zUI23
	 xuuguhsrVa8n1D0jyPbLwf5N+ZDB2srFp5HOGdCdb3XfrcG/DNDzDJJZ2sBKEOuVJn
	 i0FlJ1VIkna25AGzdH5peWaKjYTo9R74/qIraQXTahSxRPTUosbEB9sIRIAFwzIPnY
	 p0HgxiVmguKDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8C7A3809A22;
	Mon, 26 Jan 2026 04:21:52 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] RISC-V updates for v6.19-rc7
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176940131135.4057692.4058115103852267681.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 04:21:51 +0000
References: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
In-Reply-To: <081aefd5-d47d-8397-693a-3e0a3c73783e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202157_440667_05182D37 
X-CRM114-Status: GOOD (  12.08  )
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

This pull request was applied to riscv/linux.git (fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sat, 24 Jan 2026 16:21:29 -0700 (MST) you wrote:
> Linus,
> 
> Please pull these RISC-V fixes for v6.19-rc7.
> 
> The notable changes here are the three RISC-V timer compare register
> update sequence patches.  These only apply to RV32 systems and are related
> to the 64-bit timer compare value being split across two separate 32-bit
> registers.  We weren't using the appropriate three-write sequence,
> documented in the RISC-V ISA specifications, to avoid spurious timer
> interrupts during the update sequence; so, these patches now use the
> recommended sequence.  This doesn't affect 64-bit RISC-V systems, since
> the timer compare value fits inside a single register and can be updated
> with a single write.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V updates for v6.19-rc7
    https://git.kernel.org/riscv/c/d91a46d6805a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
