Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E03C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqDPjtKVu8Vvj76S3icvXliJuQjH1yId3D8eUN+ZP3k=; b=mw0HCEvRZGldda
	Xfo2/yJtGX3SWi88wvVeNTjehk5tHwvh6lZj0DSebvVcK3EduPqOdBNNtLd+Cwp1M4S/Bu6N/ypCr
	pxnSmri+MOP/BFwMBuLkJiFARsRvz2dOYBFJGcIFpJlez4+kkdbesmx9d2/abJ+u3lZwa9KuqO9vF
	bGjQiUnZqW6+8xj9L/SDpGp32a+obvbjHa1WWkqbgJdaWEPrn0VBDvUrAkY244FWsbHdZxTMI+nY9
	NmdpHTR1ERhcvH9oVBrm61BFAI3jVA345/Hxur2HoWGYZ6jKHXmGqoOobKL/GNv+DuKkfQuAjsa0s
	+Jl7YhD9jNJtgx49ERyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5N-000Ixu-1t;
	Fri, 05 Jan 2024 21:50:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLs5H-000Itm-2M
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 21:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F3776CE203A;
	Fri,  5 Jan 2024 21:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2788C433CC;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704491427;
	bh=zZbKh0bXY4jP2LnG1owu/TGlfOhgMqLikZKmb67mDlg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XIwjEhlb4OOUssD1jGBzURaXALBo0jBKlPcdvjF10U85umoyNI/ZXOBgaVwX49pgc
	 QsTHWwlk22gCrm9Q8rFUvwiQ7E1xkW13/saKttLuS2Jn+K6ohnkGZP2Ura36SHh6uy
	 Ece4XXBTW99nm8Eq/RFFJq09LmuBKdo4gfeWHT2ZwGrbvhwBVWkzjVDo/hD4+yjd7w
	 Y6lQnAOvD3JcTr3uNLc3AVu5EFzLPR6CHqzW7IZXyLhWcN+90JMBHATeXWPBbe+fIN
	 ARQlM8ZzWTuhU5vkqUgzXjgV1+8AYoMxwQf1r/I4bkFuCIv6KX6ribWLc2xRYLryS8
	 7inC75tPPsbXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB91FDCB6F9;
	Fri,  5 Jan 2024 21:50:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] riscv: CPU operations cleanup
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170449142782.26226.4217701485670023420.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jan 2024 21:50:27 +0000
References: <20231121234736.3489608-1-samuel.holland@sifive.com>
In-Reply-To: <20231121234736.3489608-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_135031_942181_BFD02D8C 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, 21 Nov 2023 15:47:23 -0800 you wrote:
> This series cleans up some duplicated and dead code around the RISC-V
> CPU operations, that was copied from arm64 but is not needed here. The
> result is a bit of memory savings and removal of a few SBI calls during
> boot, with no functional change.
> 
> 
> Samuel Holland (3):
>   riscv: Deduplicate code in setup_smp()
>   riscv: Remove unused members from struct cpu_operations
>   riscv: Use the same CPU operations for all CPUs
> 
> [...]

Here is the summary with links:
  - [1/3] riscv: Deduplicate code in setup_smp()
    https://git.kernel.org/riscv/c/a4166aec1130
  - [2/3] riscv: Remove unused members from struct cpu_operations
    https://git.kernel.org/riscv/c/79093f3ec39c
  - [3/3] riscv: Use the same CPU operations for all CPUs
    https://git.kernel.org/riscv/c/62ff262227a4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
