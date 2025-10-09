Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D52CCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDEJlLBaxZ0cw0LJykSFl6i6M56vYcb97YfHxPo3b6I=; b=tJSBdbYX7SO0Rv
	gKiTQYh2f5PxEd+R0Fu7Z4L0fQ0BiPGWCQFbAFhto3QKu8Bc/wXBn2r0hpuAeUZm/bESy/Qg8xWhj
	VfbzecaIk/HMMqGUqTlTOwmVaiPrhZPeiNYqFLKpfrbNmoYgiTNK9hAEkBc6EZKWkWo+kspRaIcdk
	5o835mCrGVAYiBwbBHCkTChr8oXLaeLomJtTz8OafpUEJ8JkKVwrW8vEeqxx2TD/VOrTBiNJtlDbT
	etHDiAOPQ+mdhbPzXAEzJFdeu3NuqX5pezHIWWeqIaTVr67OB+JW6k1NVuuEh07IQCpLn8YZh3W0x
	k2CbNzkFMcm8/t2flBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7n-00000004uZJ-2OcK;
	Thu, 09 Oct 2025 01:07:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7l-00000004uWy-1y3c
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0B6E62139;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DF0C4CEE7;
	Thu,  9 Oct 2025 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972036;
	bh=uICwW+7JjdNTrdwYOThDjo78WSe40MG6kD2tcS8UCr0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Cq+QIuaSsbZ85Bye4hA95eTz3hsHytAX1GTFc9YGto55OBTrhSQts03gyTHo2eSvn
	 rNgYrFWU2souedJNKH6yF6ZCWEwY8jrNexNaitylW4ivlHpWVjhbYCAMV/nCTZ0CtL
	 oShIr9D42WzY/SRFilbT1mqkl6x9++jWyPnFwByoyG/Cut3jUlY64GzGWuzLpebMQz
	 w6uj0kRrCETVOXtVAqrz1jAM7/GJQA5bYn5s7PAlvZCkQNO3eOD7pPdDsew6svVkaE
	 TtclXcV4dI7gawm5GYhlHGNy+cRg3zhyB0uCj+rKzY1KwQUV3/WZTj4Wp3vrhYv/Dt
	 LmzPOKnu/WrKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DE73A41017;
	Thu,  9 Oct 2025 01:07:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/17] Add __attribute_const__ to ffs()-family
 implementations
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997202477.3661959.16005423815156173105.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:07:04 +0000
References: <20250804163910.work.929-kees@kernel.org>
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
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
by Kees Cook <kees@kernel.org>:

On Mon,  4 Aug 2025 09:43:56 -0700 you wrote:
> Hi,
> 
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute_const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> [...]

Here is the summary with links:
  - [01/17] KUnit: Introduce ffs()-family tests
    (no matching commit)
  - [02/17] bitops: Add __attribute_const__ to generic ffs()-family implementations
    (no matching commit)
  - [03/17] csky: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [04/17] x86: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [05/17] powerpc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [06/17] sh: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [07/17] alpha: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [08/17] hexagon: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [09/17] riscv: Add __attribute_const__ to ffs()-family implementations
    https://git.kernel.org/riscv/c/c51c26e687a6
  - [10/17] openrisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [11/17] m68k: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [12/17] mips: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [13/17] parisc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [14/17] s390: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [15/17] xtensa: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [16/17] sparc: Add __attribute_const__ to ffs()-family implementations
    (no matching commit)
  - [17/17] KUnit: ffs: Validate all the __attribute_const__ annotations
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
