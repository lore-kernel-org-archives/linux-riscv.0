Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F70C4725D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVyuCEHwk/7GjDGmuBAY2q9BxGEUYKO/ghxqRrOwTUQ=; b=WinIbcgmmKJH3m
	VtA/oZ/X7mRIuwewOld44CtnBWtiIYpYsYwdGcM5BKHiLSKya0GM3Jq59yXHop8bbg3IThuHstiVQ
	9bcaA7mU0AzqNA73uzDI+K7Dovb1iZYrMwF5a0dkSRnO3pO5Eg0o1yljNPXR8I73xV3tFvv2J4nc6
	7d5rtMaXVej2m8GoAzQ7c82SdQ55vTcEnseTcu1qd2OPShvGoQx2NddeOQGQrxAS9NwCdDJclRYKF
	/UX3+bbw4O+5UMBu5YkkUsFkvWwWbWZUZbnBdbejhTe86JGfvFTVpq1mxQh86wtUS0PhGVCSbbl0/
	as+PnvjhrYvUMvjJzm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5N-000Ixd-09;
	Fri, 05 Jan 2024 21:50:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5H-000Itl-2M;
	Fri, 05 Jan 2024 21:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C5483B81D88;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8506C433CB;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491427;
	bh=IdUsCMJ/vqOhBPKNbHGvLL4LIHpK7zjcsFeMXwJmk8I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eqKFe3dTU5AlHizIphVnFxETIy8JPb1Td00q8vgFuanO5pGzF3YJ/3Z7VMKLUIK1u
	 bRxRgzdOvQL8B5zUIMSWO6di7VQIoYRKRU1BSbVyd95ox8XfOkeeQIJlsZOfXn8KP2
	 p8NHd+m9KITKwgRmy0kHW14CyWCTtFFYVIG3b9+0S3Yz+RzM3BafXvTrp5rtbsJ0iZ
	 tDcCnI6rB/QXs3i/KH3JzDoHfVJaLIul+YMYfdsHbBTeBa/6a0SZ5m7bE7xG4AygMd
	 TawnKjFUCImNv9TMi0hWfB8Z0K0VQ+lZxrIBUhRpwHslHFAEQvh7M1PYUrnPZe/uov
	 HvqnLo6rrB6YA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C002DDCB6FD;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142778.26226.7492189738418488414.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231213203001.179237-1-alexghiti@rivosinc.com>
In-Reply-To: <20231213203001.179237-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux@armlinux.org.uk,
 ryan.roberts@arm.com, glider@google.com, elver@google.com,
 dvyukov@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, atishp@atishpatra.org,
 ardb@kernel.org, ryabinin.a.a@gmail.com, andreyknvl@gmail.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135031_923023_96C302DF 
X-CRM114-Status: UNSURE (   9.82  )
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

On Wed, 13 Dec 2023 21:29:57 +0100 you wrote:
> This series is a follow-up for riscv of a recent series from Ryan [1] which
> converts all direct dereferences of pte_t into a ptet_get() access.
> 
> The goal here for riscv is to use READ_ONCE()/WRITE_ONCE() for all page
> table entries accesses to avoid any compiler transformation when the
> hardware can concurrently modify the page tables entries (A/D bits for
> example).
> 
> [...]

Here is the summary with links:
  - [v2,1/4] riscv: Use WRITE_ONCE() when setting page table entries
    https://git.kernel.org/riscv/c/c30fa83b4989
  - [v2,2/4] mm: Introduce pudp/p4dp/pgdp_get() functions
    https://git.kernel.org/riscv/c/eba2591d99d1
  - [v2,3/4] riscv: mm: Only compile pgtable.c if MMU
    https://git.kernel.org/riscv/c/d6508999d188
  - [v2,4/4] riscv: Use accessors to page table entries instead of direct dereference
    https://git.kernel.org/riscv/c/edf955647269

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
