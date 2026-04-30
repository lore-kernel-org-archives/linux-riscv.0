Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E619FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djOeYIGMI3N1LMqpIJxwb4JdW7YfIFq5A8oSGPuI1os=; b=Iv4dU4ypHGTnGj
	z2uMp27XyaNTvWuDLKshNOHPvd/ABArx9+jHjuxMlkWI34WpoYRS3ejHMIkgYdL0J4RRNwIXvaA6z
	UzaQU3q0YPbmk3sJNXmfPACVnpExHfqam3uvVSgSjKDOiLjGANnXiOeX4KP/akgor+jMWRX4vw9yA
	d2qjz6GGfYIpt3WSmOP6pBNTWPWacf3B/7SeWnSZ360zAwsbA/mJKGpS6UIcl/VY0pyS5k5gUaxdf
	TEV3cjA+3leEAHIMVSzivWiKI61DhfR3R9xkWeS57Yb5Lq979kNRcGk9sUCHNBJYIo+ZEqPx4LoJs
	UR2ad8b/HRayKQjx6rcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4r-00000004Z6P-1Dgm;
	Thu, 30 Apr 2026 03:28:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3U-00000004XYH-0yul
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Apr 2026 03:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=icMT7CFKhgxWAkB9/aWQ2VEfcgaI/KuH9G4xtfFNj1k=; b=ONt9L7HPTMuDlLTnKzWHJPp7pI
	nexzInAimEzd1JTQI03aP7pi9Ml//d6JnZco16FXJ/E1ugc4V2EwYBIy3lVtxZVXGe2H2asDgXzKz
	Qf3PdB4nbh4Q6OzjmzDgHi6IoEzWiqmOKFdijE8xK2iJG310DcJtQ/L98FZVdS+oTpmoEEAwW2AFJ
	VHYskFVoOKvj/fPWjGJRVZjdGi4tCUcqn0qOyFrNEFBaKmYmjuSjImLE8zbyMIwDPJ/wYSV5O/ZAG
	Wv5yp6eNIGK0Qm+YpW0lPbRUSoRm7xkKHSpFOHjIuc2hSC3aR4jDU8x2amcROUZB0n432SCmn88w6
	n5vYyGgA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3C-00000006XoL-22Q5
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B076438E4;
	Thu, 30 Apr 2026 03:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADBFC2BCB8;
	Thu, 30 Apr 2026 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519612;
	bh=1y/qx12Do8kjGRWa26585Z3zhVAR8s9S7MLftzRNkxc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Yxx8M2cZdErYh+yTRb4JYMX8n1xNToXdqoarYlzvZ+VJICM0/uJ3iKDXLNPcQGnRA
	 H8JIZj/nbbFvJXlTP9rWLNIO6QshmFfKvvU6zFT0LGw+HDcOhs2jTIA7HlayOm+BjJ
	 l8dQuieDdBsxH/orRnJnvut7oa8qxmGhcBxqkYKXiYlXBhlzr2TDj3n3VHNazWuaBZ
	 hEks0+SfUJmmVmm8mQuI5NIPiY9XYGr5RP3vTjFgNfu+nr8cJ5r2000NO381toN5VY
	 Duo2QjuhrvCx7cz7cRqnzsz5bSojfgxGn1cgcZYUy76sYJ9bjKOeYDGE6A+KGk2zK4
	 ipDtjb+awhKqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD4A3809A07;
	Thu, 30 Apr 2026 03:26:09 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/22] riscv: Memory type control for platforms with
 physical memory aliases
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751956779.2274119.16366589478749649607.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:26:07 +0000
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 devicetree@vger.kernel.org, surenb@google.com, linux-kernel@vger.kernel.org,
 rppt@kernel.org, mhocko@suse.com, conor@kernel.org,
 lorenzo.stoakes@oracle.com, krzk+dt@kernel.org, alex@ghiti.fr,
 kernel@esmil.dk, robh+dt@kernel.org, vbabka@suse.cz, Liam.Howlett@oracle.com,
 apw@canonical.com, dwaipayanray1@gmail.com, joe@perches.com,
 Julia.Lawall@inria.fr, lukas.bulwahn@gmail.com, nicolas.palix@imag.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_042657_235490_A99D59A2 
X-CRM114-Status: GOOD (  10.15  )
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
by Peter Zijlstra <peterz@infradead.org>:

On Wed, 12 Nov 2025 17:45:13 -0800 you wrote:
> On some RISC-V platforms, including StarFive JH7100 and ESWIN EIC7700,
> DRAM is mapped to multiple physical address ranges, with each alias
> having a different set of statically-determined Physical Memory
> Attributes (PMAs), such as cacheability. Software can alter the PMAs for
> a page by selecting a PFN from the corresponding physical address range.
> On these platforms, this is the only way to allocate noncached memory
> for use with noncoherent DMA.
> 
> [...]

Here is the summary with links:
  - [v3,01/22] mm/ptdump: replace READ_ONCE() with standard page table accessors
    (no matching commit)
  - [v3,02/22] mm: replace READ_ONCE() with standard page table accessors
    (no matching commit)
  - [v3,03/22] mm/dirty: replace READ_ONCE() with pudp_get()
    (no matching commit)
  - [v3,04/22] perf/events: replace READ_ONCE() with standard page table accessors
    https://git.kernel.org/riscv/c/5a84b600050c
  - [v3,05/22] mm: Move the fallback definitions of pXXp_get()
    (no matching commit)
  - [v3,06/22] mm: Always use page table accessor functions
    (no matching commit)
  - [v3,07/22] checkpatch: Warn on page table access without accessors
    (no matching commit)
  - [v3,08/22] mm: Allow page table accessors to be non-idempotent
    (no matching commit)
  - [v3,09/22] riscv: hibernate: Replace open-coded pXXp_get()
    (no matching commit)
  - [v3,10/22] riscv: mm: Always use page table accessor functions
    (no matching commit)
  - [v3,11/22] riscv: mm: Simplify set_p4d() and set_pgd()
    (no matching commit)
  - [v3,12/22] riscv: mm: Deduplicate _PAGE_CHG_MASK definition
    (no matching commit)
  - [v3,13/22] riscv: ptdump: Only show N and MT bits when enabled in the kernel
    (no matching commit)
  - [v3,14/22] riscv: mm: Fix up memory types when writing page tables
    (no matching commit)
  - [v3,15/22] riscv: mm: Expose all page table bits to assembly code
    (no matching commit)
  - [v3,16/22] riscv: alternative: Add an ALTERNATIVE_3 macro
    (no matching commit)
  - [v3,17/22] riscv: alternative: Allow calls with alternate link registers
    (no matching commit)
  - [v3,18/22] riscv: Fix logic for selecting DMA_DIRECT_REMAP
    (no matching commit)
  - [v3,19/22] dt-bindings: riscv: Describe physical memory regions
    (no matching commit)
  - [v3,20/22] riscv: mm: Use physical memory aliases to apply PMAs
    (no matching commit)
  - [v3,21/22] riscv: dts: starfive: jh7100: Use physical memory ranges for DMA
    (no matching commit)
  - [v3,22/22] riscv: dts: eswin: eic7700: Use physical memory ranges for DMA
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
