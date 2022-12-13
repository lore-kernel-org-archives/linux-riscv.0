Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D44C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6SqjhXaPajleH4EPcNZVaEx/oh9zLCEYKEGEn7lk6Y=; b=DOY2TjC9CGBSwB
	upcHh2B5NrDs1gV87VWpjCcvpAgfb8LKOCTS3xrJ4qXfUjlKMFzu8yONiMKz8xSqOhDTqtpQ9XDqs
	MPUaLjKZstAPxhEPLIG8KXbdfEazL8dnjEg0pVB5uW9nGfsbLj5rX4xVlyrzJMenL8raN/zd84uWe
	ivkhq75z8nghQwa9eNrde0AZXx0jYhhf8sRocgut8FWrWPclpLLRicx0UeAoDuPirCTQ//jF3/j1W
	OFTm1lRHNmogWwUBC8qov4hZBwHvCUYTikBXjEj7PrBwWeuVKXz2aRMylVXYndjHHSCKY7YMi6GDD
	b2+vSXORoc//iFnDBRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Gb-003ndu-1d; Tue, 13 Dec 2022 17:40:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59GO-003nOf-JM
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2192BB815A6;
	Tue, 13 Dec 2022 17:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86EACC433D2;
	Tue, 13 Dec 2022 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670953217;
	bh=X8gCjHqeNZe9a2MlXtFDCd8a5lhsjje1sO7jDqfY058=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bX8jVzlNMeinU3ZVwz0J6CYvme1pvo1CRTvr2DhD9F6o+NwZh4zCKKN4ygfW9My8f
	 4s19eRCqor7bnGPeyjyNOJGa4UoZjU6gL3uF89wq5wrvex9V0aaswbBYWM4uL+gJPy
	 m+HBjeV/oS2Q3Y9TMOUigm5EI1cTmF0F9zYTSE8CVyJCPMAKJde90ntg8M0osh8/eI
	 9gDSasM72nHM+tQOfLk8nWVUhGsYf9BimpofPqSro69TMZ6w7LiVYhysnVy5i97n5K
	 o4NdiPg2VSOEsb6wXSAw/Q3zGpqsjLwysgARUy3lWLebgVJn3twj9TAguMU5Cufo/j
	 IM++L3cSAjRGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6AFFAE4D02A;
	Tue, 13 Dec 2022 17:40:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Fixup compile error with !MMU
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167095321743.5951.3619740095349418774.git-patchwork-notify@kernel.org>
Date: Tue, 13 Dec 2022 17:40:17 +0000
References: <20221207091112.2258674-1-guoren@kernel.org>
In-Reply-To: <20221207091112.2258674-1-guoren@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com, lizhengyu3@huawei.com,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 guoren@linux.alibaba.com, conor@kernel.org, lkp@intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_094020_873154_191F0B66 
X-CRM114-Status: UNSURE (   9.71  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  7 Dec 2022 04:11:12 -0500 you wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Current nommu_virt_defconfig can't compile:
> 
> In file included from
> arch/riscv/kernel/crash_core.c:3:
> arch/riscv/kernel/crash_core.c:
> In function 'arch_crash_save_vmcoreinfo':
> arch/riscv/kernel/crash_core.c:8:27:
> error: 'VA_BITS' undeclared (first use in this function)
>     8 |         VMCOREINFO_NUMBER(VA_BITS);
>       |                           ^~~~~~~
> 
> [...]

Here is the summary with links:
  - riscv: Fixup compile error with !MMU
    https://git.kernel.org/riscv/c/c528ef0888b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
