Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9116FF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70eKkLjVAaD6475sYTzweCXadJ8rfns07PXuQEyubBk=; b=cPwyd82MLj6njw
	KliIKIlJzhMezOHhRLwJh0cgCD8lLM4poQZGOLTf8cGHyK820bVZIzOZj58FDy0x4EfQpzl5OXxZV
	wHMKrzO5nFXfLCTuYDdCSnI0Tzv80uVqZijUEvcKMClH1uomBafX8zEcjS3haWOjK9TfNy8b6+EOr
	W3AMV8S6muOVSXfNPYMSNqjcmsCGxjxsmPWXKCQnA4DdkUG0r3HZF+ilER7678x/2ndoYPKnoQJ3x
	bTb19KS69yaly9f7tCN9asRRrSGHcH9YtrxtFyrAmc2tP4XqOAqxcTqvdvy+Uekd5CCwEPOPuc6hr
	9nB6OvBOcm7fgVrO8mrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII3P-00000004XXW-3fQI;
	Thu, 30 Apr 2026 03:27:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2Y-00000004WbY-1RYL;
	Thu, 30 Apr 2026 03:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09BB443B2D;
	Thu, 30 Apr 2026 03:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB14C2BCB9;
	Thu, 30 Apr 2026 03:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519573;
	bh=THrrdSGjgRzaSbCrGespfxo5C/AWLl4KlIEGbaUs1N8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UzTbqLo/5B2o+wNCv7hc433OYzKq4siikxTyngUKDMF3HAeUjhBhAk77XupcxRUvU
	 8AQeEfOAPdqCa9Uxdu60usplkxVCGl2lAhF6QZOdLWIjERQA7vDLeINPZy/5ERe7Wc
	 ghiINRi89Td2t+djUJI7HVkMnXuK1rdp0d0YYVr2nHuJNC05bQejhStGEvFx6LEv4v
	 Q0foheq2svz+12OFi+UHX6I/M6rycHRVU+nwE7Bew/REJdDDUJFX4jYb42DVn24wgZ
	 Adw0Roiy4+syrE/ThlZQ2sCXbjShOe4cVpKtA73HBp9XxbgCtMQ6+9J8F7NCLPpp9Q
	 EzM7rlb9XVxGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE533809A07;
	Thu, 30 Apr 2026 03:25:30 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/2] Fix bugs and performance of kstack offset
 randomisation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751952875.2274119.16398594062786998071.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:28 +0000
References: <20260303150840.3789438-1-ryan.roberts@arm.com>
In-Reply-To: <20260303150840.3789438-1-ryan.roberts@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, kees@kernel.org,
 gustavoars@kernel.org, arnd@arndb.de, mark.rutland@arm.com, Jason@zx2c4.com,
 ardb@kernel.org, jeremy.linton@arm.com, david.laight.linux@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202614_402708_08CEB376 
X-CRM114-Status: GOOD (  11.82  )
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
by Kees Cook <kees@kernel.org>:

On Tue,  3 Mar 2026 15:08:37 +0000 you wrote:
> [Kees; I'm hoping this is now good-to-go via your hardening tree? It would be
> good to get some linux-next testing.]
> 
> Hi All,
> 
> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> and, on arm64 at least, the performance is poor. This series attempts to fix
> both; patch 1 provides back-portable fixes for the functional bugs. Patch 2
> proposes a performance improvement approach.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] randomize_kstack: Maintain kstack_offset per task
    https://git.kernel.org/riscv/c/37beb4256016
  - [v5,2/2] randomize_kstack: Unify random source across arches
    https://git.kernel.org/riscv/c/a96ef5848cb0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
