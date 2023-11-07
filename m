Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D31C4708E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQyTTKVZmNlV/6V2C5wxqUT4isSgT21J5OXb33PmV74=; b=yShreFAz3gidp0
	ob+VUhvsvmXmMZuAz2CAJXcFFNYHwsbGXaPpdQ3rjd9GkBuFDgndUwQPrj6En3ief2wpAp25En7MT
	wwHtRh0GA46H1YPkC8NlqlJarta27qPGYemvsGR4Jy6zKbLH7FCW8hhJHQQq0Sx0VdkTwMbtRJkDc
	lEvwUGofB1lBnSlOg0jn+7h+sfP5a2jxdjBpZ7xPKnom3nviXkPP+NyBNhAzam0a/oH9mQpj5tqq1
	UkCSHB1LANH+PNRr9TUZU2d7JVBwn7PNLJu0cxrjZgCSk/Ph2Ibs9h3dFpPt2UwJoz/uOTtn991zX
	XKxfA2uqAUFcoz13Z2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fv2-000fFV-1w;
	Tue, 07 Nov 2023 06:50:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Fuy-000fCa-0S
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 06:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 472DDB815C2;
	Tue,  7 Nov 2023 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC18DC433CB;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699339827;
	bh=qbNyvpCu834BElj57LNyccltMncgWk9IvDmnQ9vJRjA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=shl5AXMxRxwe5t1DNYT7WfQcfWTp5KXYl8lVkW14F07S/gYNH/2CKdgrecwJ5Ubce
	 T442EIVmb7yPMI2N5NuWUX/vqUZPdERJ9THQS6pQDDw7eT1Lp8bFqMoPOxnNdB/P4U
	 zOlRRTkE7WyE1eCkgBPLRSqc50K8KsFAmRNiL9+YWNM9Ee6pKf9f8YDBTmnFiC5G6N
	 mU++k62dTUiOKWDbzidfpie3V1bk4VkGFj8rLfEIiJuqMeCcHEOysn8gROq8ZoICEg
	 n5kMpGZQKLF9dxmu96ON3yGEmxpDXXelk/6/MxS4y7nfjyfEQ+1TcEJnok4uNXZHuw
	 Xh1oEWun9T2dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D1506E00096;
	Tue,  7 Nov 2023 06:50:26 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] riscv: tlb flush improvements
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169933982685.6233.4393621260958877500.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 06:50:26 +0000
References: <20231030133027.19542-1-alexghiti@rivosinc.com>
In-Reply-To: <20231030133027.19542-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, will@kernel.org,
 aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
 peterz@infradead.org, mchitale@ventanamicro.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 samuel@sholland.org, prabhakar.csengg@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_225032_316646_2272E677 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, 30 Oct 2023 14:30:24 +0100 you wrote:
> This series optimizes the tlb flushes on riscv which used to simply
> flush the whole tlb whatever the size of the range to flush or the size
> of the stride.
> 
> Patch 3 introduces a threshold that is microarchitecture specific and
> will very likely be modified by vendors, not sure though which mechanism
> we'll use to do that (dt? alternatives? vendor initialization code?).
> 
> [...]

Here is the summary with links:
  - [v6,1/4] riscv: Improve tlb_flush()
    https://git.kernel.org/riscv/c/c5e9b2c2ae82
  - [v6,2/4] riscv: Improve flush_tlb_range() for hugetlb pages
    https://git.kernel.org/riscv/c/c962a6e74639
  - [v6,3/4] riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
    https://git.kernel.org/riscv/c/9d4e8d5fa7db
  - [v6,4/4] riscv: Improve flush_tlb_kernel_range()
    https://git.kernel.org/riscv/c/5e22bfd520ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
