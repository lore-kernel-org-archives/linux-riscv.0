Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0329C47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MX5Q/yGvf+Xe/FSvlzTRSI/2k+rhD8t9CxlTvlkJmM=; b=FikNmivWFHl56k
	RfzvMV/H1lKayNVo1DXFJPbBmK24WxJEM9WRG/OFJwV9gJ3OUXsOGGcMFwdW5uT32ZAkewVHSDnUc
	u/Dv616XKofNxBJ3cFhIv0mhPJRNKK0kWNYNKXhxWHoYrxpxW7JjPc1WZSdPxMElsnRAqA1OJewGJ
	N5/c2zpNKPWCKkS/nC/QdjcwI/NGy3dxXJ70ye7hwocrrrrP2XQzq+hgM2Ipad1EyhQfqHQdGa+uh
	tZXkBzIqFdTUf+Xsk/CzTZJenpFJ4AQbgAYGvwp7bpx9lo5nczhWGEROHrl/LK3W/bDQYNAh+Q0VO
	djjfkpJrcVt/94XVdFiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbF-008ODK-0n;
	Sat, 20 Jan 2024 21:09:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbA-008O8y-1O;
	Sat, 20 Jan 2024 21:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 52850B801B8;
	Sat, 20 Jan 2024 21:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DCC9C43390;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784987;
	bh=eTLr4dy/uLuhEZDSb8RfdP2ShpbC5ub3YzsOlB3z738=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L2rcdUCVcDzOWn4Bg5S9EC1E2ulioUxc9CfH4ixgBvNXMr43iVg8K2rDLBlXN6hgN
	 vfNqwW5kWUqsXpVgY+wcBKjzzLbfJ/wHXLvIYXeBmg7t8/6EvA4QYoak48KaE+j/x8
	 lmnoqo+r1LcL7vqDDaPszC3IC5d48QHizq0iBOklFmos6nie6hg/3rQbfXQzXRSIsC
	 4wSPQrJB/JODPKeDz2+Hsy3ynf1vnoIH+JS71tJlB4/lUhQTXbfCY4KWD91DHL08Ub
	 6NnxzmBVBW+i1Svnfg58mBoUe+uYY3tov4jL6JVC8GrErk7qDYXH44wX+Jx14G668P
	 xaQOEg/YnDowQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 874E3D8C96C;
	Sat, 20 Jan 2024 21:09:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when retrying
 under per-VMA lock
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:47 +0000
References: <20231226214610.109282-1-surenb@google.com>
In-Reply-To: <20231226214610.109282-1-surenb@google.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 willy@infradead.org, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_130952_706701_788AAD62 
X-CRM114-Status: GOOD (  11.45  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 26 Dec 2023 13:46:10 -0800 you wrote:
> A test [1] in Android test suite started failing after [2] was merged.
> It turns out that after handling a major fault under per-VMA lock, the
> process major fault counter does not register that fault as major.
> Before [2] read faults would be done under mmap_lock, in which case
> FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
> mm_account_fault() to account the fault as major once retry completes.
> With per-VMA locks we often retry because a fault can't be handled
> without locking the whole mm using mmap_lock. Therefore such retries
> do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
> because we can now handle read major faults under per-VMA lock and
> upon retry the fact there was a major fault gets lost. Fix this by
> setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
> VM_FAULT_MAJOR was returned. Ideally we would use an additional
> VM_FAULT bit to indicate the reason for the retry (could not handle
> under per-VMA lock vs other reason) but this simpler solution seems
> to work, so keeping it simple.
> 
> [...]

Here is the summary with links:
  - [1/1] arch/mm/fault: fix major fault accounting when retrying under per-VMA lock
    https://git.kernel.org/riscv/c/46e714c729c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
